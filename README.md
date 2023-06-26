# Meilisearch.st
Meilisearch client for Smalltalk.
Currently, Pharo 11 and GemStone/S 3.6.x are supported.

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

### Deleting an index

```Smalltalk
(MeiliSearch new index: 'my-blog') delete.
```
