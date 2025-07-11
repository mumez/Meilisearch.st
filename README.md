# Meilisearch.st

[![CI](https://github.com/mumez/Meilisearch.st/actions/workflows/main.yml/badge.svg)](https://github.com/mumez/Meilisearch.st/actions/workflows/main.yml)

Meilisearch client for Smalltalk.
Currently, Pharo 11-13 and GemStone/S 3.6.x are supported.

## Installation

```smalltalk
Metacello new
  baseline: 'Meilisearch';
  repository: 'github://mumez/Meilisearch.st:main/src';
  load.
```

## Usage

### Setting API key

To use Meilisearch, you need to set an API key.
You can set the default API key at the system level.

```Smalltalk
MsSettings default apiKey: 'meili-api-key-A'.
```

After setting the default key, all newly created instances will use that API key.

```Smalltalk
meili := MeiliSearch new.
meili settings apiKey. "print it => 'meili-api-key-A'"
```

You can also explicitly set an API key on a per-instance basis:

```Smalltalk
meili := MeiliSearch apiKey: 'meili-api-key-B' url: 'http://localhost:7700'.
meili settings apiKey. "print it => 'meili-api-key-B'"

```

### Creating an index

```Smalltalk
meili := MeiliSearch new.
task := meili createIndex: 'my-blog' primaryKey: 'id'.
"or just `meili createIndex: 'my-blog'.`"
task inspect. "You can see the task is enqueued"
```

### Getting indexes

#### Retrieving all indexes

```Smalltalk
resp := MeiliSearch new indexes.
resp results detect: [ :each | each uid = 'my-blog' ]. "print it =>
a MsIndex uid: 'my-blog' primaryKey: 'id' createdAt:
2023-06-26T07:10:18.44037373+00:00 updatedAt:
2023-06-26T07:10:18.458306996+00:00"
```

#### Retrieving a specific index

```Smalltalk
index := (MeiliSearch new index: 'my-blog') loaded.
```

### Putting documents

```Smalltalk
index := MeiliSearch new index: 'my-blog'.
docs := {
    {'id' -> 1. 'title' -> 'Woke up'. 'contents'->'I finally woke up. Started researching Meilisearch.' } asDictionary.
    {'id' -> 2. 'title' -> 'Smalltalk'. 'contents'->'I did Smalltalk programming' } asDictionary.
    {'id' -> 3. 'title' -> 'Meilisearch.st'. 'contents'->'I tried Meilisearch.st. Works good. I can add full-text search to my blog program in a few minutes.' } asDictionary.
}.
task := index putDocuments: docs.
task waitEndedForAWhile. "Await task is ended"
```

### Searching documents

#### Basic search

```Smalltalk
index := MeiliSearch new index: 'my-blog'.
resp := index search: 'Meilisearch'.
resp hits collect: [ :each | each at: 'id' ]. "print it => #(3 1)"

resp := index search: 'program'.
resp hits collect: [ :each | each at: 'id' ]. "print it => #(2 3)"

resp := index search: 'Smalltalk'.
resp hits. "print it => an Array(a Dictionary('contents'->'I did Smalltalk programming' 'id'->2
'title'->'Smalltalk' ))"

```

#### Search with options

```Smalltalk
resp := index search: 'Meilisearch' optionsUsing:[:opts | opts attributesToRetrieve: #('id')].
resp hits. "print it => an Array(a Dictionary('id'->3 ) a Dictionary('id'->1 ))"

resp := index search: 'Meilisearch' optionsUsing:[:opts | opts attributesToRetrieve: #('id'); offset: 1; limit: 1].
resp hits. "print it => an Array(a Dictionary('id'->1 ))"

"You can apply index-specific settings for advanced searching"
attributes := #('id' 'title').
settingsTask := index applySettingsUsing: [ :opts |
  opts sortableAttributes: attributes copy; filterableAttributes: attributes copy; displayedAttributes: attributes copy.
].
settingsTask waitEndedForAWhile.
resp := index search: 'Meilisearch' optionsUsing:[:opts | opts filter: 'title = "Woke up"'].
resp hits. "print it => an Array(a Dictionary('id'->1 'title'->'Woke up' ))"

```

#### Multi search

You can also submit multiple searches in a single request.

```Smalltalk
(meili createIndex: 'my-wiki') waitEndedForAWhile.
otherIndex := meili index: 'my-wiki'.
otherIndex putDocuments: {
  {'id' -> 1. 'title' -> 'Smalltalk meetup'. 'contents'->'June 9 will be a Smalltalk meet-up in Tokyo' } asDictionary.
}.
resp := meili multiSearchUsing: [ :opts | {
  (opts index: otherIndex) q: 'Smalltalk'.
  (opts index: 'my-blog') q: 'Smalltalk'; attributesToRetrieve: #('id')
}].
resp collect: [ :each | each hits ]. "print it => an Array(an Array(a Dictionary('contents'->'June 9 will be a Smalltalk meet-up
in Tokyo' 'id'->1 'title'->'Smalltalk meetup' )) an Array(a Dictionary('id'->2)))"
```

### Search with facets

By setting #filterableAttributes: on an index, you can enable [faceted search](https://www.meilisearch.com/docs/learn/fine_tuning_results/faceted_search) feature. The search response includes facets statistics, which can be used to further refine search results.

```Smalltalk
(meili createIndex: 'facet-books') waitEndedForAWhile.
booksIndex := meili index: 'facet-books'.
settingsTask := booksIndex applySettingsUsing: [ :opts |
	opts filterableAttributes: #('title' 'rating' 'genres').
].
settingsTask waitEndedForAWhile.
docs := {
    {'id' -> 1. 'title' -> 'Hard Times'. 'rating' -> 4.5.
    'genres' -> #('Classics' 'Victorian' 'English Literature')} asDictionary.
    {'id' -> 2. 'title' -> 'The Great Gatsby'. 'rating' -> 4.8.
    'genres' -> #('Classics' 'American Literature' 'Romance') } asDictionary.
    {'id' -> 3. 'title' -> 'Moby Dick'. 'rating' -> 4.7.
    'genres' -> #('Classics' 'American Literature' 'Adventure') } asDictionary.
}.
(booksIndex putDocuments: docs) waitEndedForAWhile.
resp := booksIndex search: 'classic' optionsUsing: [:opts | opts facets: #('genres' 'rating')].

resp facetStats at: 'rating'. "print it => a Dictionary('max'->4.8 'min'->4.5 )"
resp facetDistribution at: 'genres'. "print it => a Dictionary('Adventure'->1 'American Literature'->2 'Classics'->3 'English
Literature'->1 'Romance'->1 'Victorian'->1 )"

resp := booksIndex search: 'America' optionsUsing: [:opts | opts facets: #('genres' 'rating')].
resp facetStats at: 'rating'. "print it => a Dictionary('max'->4.8 'min'->4.7 )"
resp facetDistribution at: 'genres'. "print it => a Dictionary('Adventure'->1 'American Literature'->2 'Classics'->2 'Romance'->1
)"
```

You can also use #facetSearchUsing: to search for facet values in the index. The #facetQuery: search word is a prefix match and allows typos.

```Smalltalk
resp := booksIndex facetSearchUsing: [:opts | opts facetQuery: 'clasic'; facetName: 'genres'; filter: 'rating > 4.5'].
facetHits := resp facetHits. "print it => an Array(a Dictionary('count'->2 'value'->'Classics' ))"

```

### Paginator

Meilisearch.st provides two types of pagination to handle large result sets efficiently:

1. **Offset Pagination** - Uses `offset` and `limit` parameters
2. **Numbered Page Pagination** - Uses `page` and `hitsPerPage` parameters

```Smalltalk
"Offset Pagination"
paginator1 := index offsetPaginator.
paginator1
    search: 'English';
    offset: 3;     "Skip first 3 results"
    limit: 5.      "Return max 5 results"

"Numbered Page Pagination"
paginator2 := index numberedPagePaginator.
paginator2
    search: 'English';
    page: 1;        "First page (1-based)"
    hitsPerPage: 5. "5 results per page"

"Iterate through all results"
responses := OrderedCollection new.
[ paginator2 atEnd ] whileFalse: [ 
    response := paginator2 next. "Get the search result"
    responses add: response.
].
```

### AI-powered hybrid search

Meilisearch supports [hybrid search](https://www.meilisearch.com/blog/hybrid-search), which combines keyword (lexical) and semantic (vector-based) search for more powerful and flexible results.

See `MsIndex>>hybridSearch:query vector:vector embedder:embedderName semanticRatio:semanticRatio` and related methods for more details.

```Smalltalk
"Example of AI-powered hybrid search: combine text and vector queries"
resp := index hybridSearch: 'some words'
    vector: #(1 2 3)
    embedder: 'openAi-embedder'
    semanticRatio: 0.5.
```

### Deleting an index

```Smalltalk
(MeiliSearch new index: 'my-blog') delete.
```
