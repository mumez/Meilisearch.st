Class {
	#name : 'MeiliSearchTest',
	#superclass : 'MsTestCase',
	#category : 'Meilisearch-Tests',
	#package : 'Meilisearch-Tests'
}

{ #category : 'tests' }
MeiliSearchTest >> testAddDeleteDocuments [
	| originalIndexes newIndexId index createIndexTask documents putDocumentsTask resp deleteDocumentsTask deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-documents-1'.
	createIndexTask := meilisearch createIndex: newIndexId.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	
	index := (meilisearch index: newIndexId).
	documents := self documentsJson.
		
	putDocumentsTask := index putDocuments: documents.
	putDocumentsTask waitEndedForAWhile.
	self assert: putDocumentsTask isSucceeded.
	
	resp := index getAllDocuments.
	self assert: resp total equals: documents size.
	
	deleteDocumentsTask := index deleteAllDocuments.
	deleteDocumentsTask waitEndedForAWhile.
	
	resp := index getAllDocuments.
	self assert: resp total equals: 0.
	
	deleteIndexTask := index delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.
]

{ #category : 'tests' }
MeiliSearchTest >> testApplyingIndexSettings [
	| originalIndexes newIndexId createIndexTask index origSettings settings deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-settings-1'.
	createIndexTask := meilisearch createIndex: newIndexId.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	index := meilisearch index: newIndexId.
	origSettings := index getAllSettings.
	self assert: origSettings displayedAttributes equals: #('*').
	self assert: origSettings filterableAttributes equals: #().
	self assert: origSettings searchableAttributes equals: #('*').
	self assert: origSettings sortableAttributes equals: #().
	
	{
	index setDisplayedAttributes: #('id').
	index setFilterableAttributes: #('id').
	index setSearchableAttributes: #('id').
	index setSortableAttributes: #('id')
	} do: [ :each | each waitEndedForAWhile ].
	
	settings := index getAllSettings.
	self assert: settings displayedAttributes equals: #('id').
	self assert: settings filterableAttributes equals: #('id').
	self assert: settings searchableAttributes equals: #('id').
	self assert: settings sortableAttributes equals: #('id').
	
	index resetSettings waitEndedForAWhile.
	settings := index getAllSettings.
	self assert: settings displayedAttributes equals: #('*').
	self assert: settings filterableAttributes equals: #().
	self assert: settings searchableAttributes equals: #('*').
	self assert: settings sortableAttributes equals: #().
	
	deleteIndexTask := index delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.
]

{ #category : 'tests' }
MeiliSearchTest >> testCreateDeleteIndex [
	| originalIndexes newIndexId newIndex newlIndexes createIndexTask deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-index-1'.
	createIndexTask := meilisearch createIndex: newIndexId.
	self assert: createIndexTask isEnqueued.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	newlIndexes := meilisearch indexes.
	self assert: newlIndexes total - originalIndexes total equals: 1.
	
	newIndex := (meilisearch index: newIndexId) loaded.
	self assert: newIndex uid equals: newIndexId.
	
	deleteIndexTask := newIndex delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.
	newlIndexes := meilisearch indexes.
	self assert: newlIndexes total - originalIndexes total equals: 0.
	
]

{ #category : 'tests' }
MeiliSearchTest >> testCreateDeleteIndexWithPrimaryKey [
	| originalIndexes newIndexId newIndex newlIndexes createIndexTask deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-index-2'.
	createIndexTask := meilisearch createIndex: newIndexId primaryKey: 'primKey'.
	self assert: createIndexTask isEnqueued.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	newlIndexes := meilisearch indexes.
	self assert: newlIndexes total - originalIndexes total equals: 1.
	
	newIndex := (meilisearch index: newIndexId) loaded.
	self assert: newIndex uid equals: newIndexId.
	self assert: newIndex primaryKey equals: 'primKey'.
	
	deleteIndexTask := newIndex delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.
	newlIndexes := meilisearch indexes.
	self assert: newlIndexes total - originalIndexes total equals: 0.
	
]

{ #category : 'tests' }
MeiliSearchTest >> testFacetSearchDocuments [
	self
		createIndexNamed: 'mailisearch-st-test-facet-search-1'
		then: [ :idx |
			| settingsTask |
			settingsTask := idx applySettingsUsing: [ :opts |
				                opts filterableAttributes:
					                #( 'title' 'genres' 'language' 'rating' ) ].
			settingsTask waitEndedForAWhile ]
		documents: self facetsDocumentsJson
		do: [ :index | | resp facetHits classics comedy childrensLiterature |
			resp := index facetSearchUsing: [ :opts |
				        opts
					        facetQuery: 'c';
					        facetName: 'genres';
					        filter: 'rating > 4.3' ].
			facetHits := resp facetHits.
			self assert: facetHits size equals: 3.
			classics := facetHits detect: [ :each |
				            (each at: 'value') = 'Classics' ].
			self assert: (classics at: 'count') equals: 7.
			comedy := facetHits detect: [ :each |
				          (each at: 'value') = 'Comedy' ].
			self assert: (comedy at: 'count') equals: 1.
			childrensLiterature := facetHits detect: [ :each |
				                       (each at: 'value') = 'Childrens Literature' ].
			self assert: (childrensLiterature at: 'count') equals: 2 ]
]

{ #category : 'tests' }
MeiliSearchTest >> testHealth [
	| status |
	status := meilisearch health.
	self assert: status equals: 'available'
]

{ #category : 'tests' }
MeiliSearchTest >> testHybridSearchVectorizedDocuments [
	self
		createIndexNamed: 'mailisearch-st-test-hybrid-search-1'
		then: [ :index |
			index
				setEmbedder: 'mock'
				using: [ :ops | ops userProvided dimensions: 3 ] ]
		documents: self vectorDocumentsJson
		do: [ :index |
			| resp |
			resp := index
				        hybridSearch: 'AAA'
				        vector: #( 1 2 3 )
				        embedder: 'mock'
				        semanticRatio: 1.
			self assert: resp estimatedTotalHits equals: 3.
			self assert: (resp hits first at: 'id') equals: 3.

			resp := index
				        hybridSearch: 'AAA'
				        vector: #( 1 2 3 )
				        embedder: 'mock'
				        semanticRatio: 0.
			self assert: resp estimatedTotalHits equals: 1.
			self assert: (resp hits first at: 'id') equals: 1 ]
]

{ #category : 'tests' }
MeiliSearchTest >> testMultiSearchBasicDocuments [
	| originalIndexes createIndexTask newIndexId1 newIndexId2 index1 index2 documents1 documents2 putDocumentsTask deleteDocumentsTask resp deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId1 := 'mailisearch-st-test-multi-search-1'.
	createIndexTask := meilisearch createIndex: newIndexId1.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	newIndexId2 := 'mailisearch-st-test-multi-search-2'.
	createIndexTask := meilisearch createIndex: newIndexId2.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	
	index1 := (meilisearch index: newIndexId1).
	index2 := (meilisearch index: newIndexId2).
	documents1 := self documentsJson.
	documents2 := (self documentsJson asOrderedCollection add: (self extraDocumentJson); yourself) asArray.
		
	putDocumentsTask := index1 putDocuments: documents1.
	putDocumentsTask waitEndedForAWhile.
	self assert: putDocumentsTask isSucceeded.
	putDocumentsTask := index2 putDocuments: documents2.
	putDocumentsTask waitEndedForAWhile.
	self assert: putDocumentsTask isSucceeded.
	
	resp := meilisearch multiSearchUsing: [ :opts | {
		(opts index: index1) q: 'Healthy'.
		(opts index: index2) q: 'Healthy'.
	}].
	self assert: resp first estimatedTotalHits equals: 1.
	self assert: (resp first hits first at: 'id') equals: 3.
	self assert: resp second estimatedTotalHits equals: 2.
	self assert: (resp second hits collect: [ :each | each at: 'id' ]) sort equals: #(3 6).
	
	deleteDocumentsTask := index1 deleteAllDocuments.
	deleteDocumentsTask waitEndedForAWhile.
	resp := index1 getAllDocuments.
	self assert: resp total equals: 0.
	deleteDocumentsTask := index2 deleteAllDocuments.
	deleteDocumentsTask waitEndedForAWhile.
	resp := index2 getAllDocuments.
	self assert: resp total equals: 0.
	
	deleteIndexTask := index1 delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.
	deleteIndexTask := index2 delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.
]

{ #category : 'tests' }
MeiliSearchTest >> testSearchBasicDocuments [
	self
		createIndexNamed: 'mailisearch-st-test-search-basic'
		documents: self documentsJson
		do: [ :index | | resp |
			resp := index search: 'Healthy'.
			self assert: resp estimatedTotalHits equals: 1.
			self assert: (resp hits first at: 'id') equals: 3.

			resp := index search: 'Future'.
			self assert: resp estimatedTotalHits equals: 2.
			self
				assert: (resp hits collect: [ :each | each at: 'id' ]) sort
				equals: #( 1 2 ).

			resp := index search: 'AI'.
			self assert: resp estimatedTotalHits equals: 3.
			self
				assert: (resp hits collect: [ :each | each at: 'id' ]) sort
				equals: #( 1 2 4 ).

			resp := index search: 'xyzzy'.
			self assert: resp estimatedTotalHits equals: 0 ]
]

{ #category : 'tests' }
MeiliSearchTest >> testSearchDocumentsWithDefaultOptions [
	self
		createIndexNamed: 'mailisearch-st-test-search-default-options-1'
		then: [ :index |
			index defaultSearchOptionsUsing: [ :opts |
				opts
					showRankingScore: true;
					limit: 2 ] ]
		documents: self documentsJson
		do: [ :index | | resp |
			resp := index search: 'Healthy'.
			self assert: resp estimatedTotalHits equals: 1.
			self assert: (resp hits first at: 'id') equals: 3.
			self assert: (resp hits first includesKey: '_rankingScore').
			self
				assert: (resp hits first at: '_rankingScore') > 0.8
				equals: true.

			resp := index search: 'Future'.
			self assert: resp estimatedTotalHits equals: 2.
			self
				assert: (resp hits collect: [ :each | each at: 'id' ]) sort
				equals: #( 1 2 ).

			resp := index search: 'AI'.
			self assert: resp estimatedTotalHits equals: 3.
			self assert: resp hits size equals: 2.
			self
				assert: (resp hits collect: [ :each | each at: 'id' ]) sort
				equals: #( 1 2 ).

			resp := index search: 'xyzzy'.
			self assert: resp estimatedTotalHits equals: 0 ]
]

{ #category : 'tests' }
MeiliSearchTest >> testSearchDocumentsWithFacets [
	self
		createIndexNamed: 'mailisearch-st-test-search-with-facets-1'
		then: [ :index |
			| settingsTask |
			settingsTask := index applySettingsUsing: [ :opts |
				                opts filterableAttributes:
					                #( 'title' 'genres' 'language' 'rating' ) ].
			settingsTask waitEndedForAWhile ]
		documents: self facetsDocumentsJson
		do: [ :index |
			| resp languageDistibution ratingStats |
			resp := index
				        search: 'classic'
				        optionsUsing: [ :opts |
				        opts facets: #( 'genres' 'language' 'rating' ) ].
			self assert: resp estimatedTotalHits equals: 10.
			self
				assert: (resp hits collect: [ :each | each at: 'id' ]) sorted
				equals: #( 5 6 7 8 9 10 11 12 14 15 ).
			languageDistibution := resp facetDistribution at: 'language'.
			self assert: (languageDistibution at: 'English') equals: 9.
			self assert: (languageDistibution at: 'Russian') equals: 1.
			ratingStats := resp facetStats
				               at: 'rating'
				               ifAbsent: [ Dictionary new ].
			self assert: (ratingStats at: 'min') equals: 4.3.
			self assert: (ratingStats at: 'max') equals: 4.8 ]
]

{ #category : 'tests' }
MeiliSearchTest >> testSearchDocumentsWithOptions [
	self
		createIndexNamed: 'mailisearch-st-test-search-with-options-1'
		then: [ :index |
			| settingsTask |
			settingsTask := index applySettingsUsing: [ :opts |
				                opts
					                sortableAttributes: #( 'id' 'title' );
					                filterableAttributes: #( 'title' ) ].
			settingsTask waitEndedForAWhile ]
		documents: self documentsJson
		do: [ :index |
			| putDocumentsTask resp |
			putDocumentsTask := index putDocuments: self sortableDocumentsJson.
			putDocumentsTask waitEndedForAWhile.
			self assert: putDocumentsTask isSucceeded.


			resp := index
				        search: 'Smalltalk'
				        optionsUsing: [ :opts | opts sort: #( 'id:desc' ) ].
			self assert: resp estimatedTotalHits equals: 2.
			self
				assert: (resp hits collect: [ :each | each at: 'id' ])
				equals: #( 100 10 ).

			resp := index
				        search: 'AI'
				        optionsUsing: [ :opts |
				        opts filter: 'title = "The Internet and AI"' ].
			self assert: resp estimatedTotalHits equals: 1.
			self
				assert: (resp hits collect: [ :each | each at: 'id' ])
				equals: #( 4 ) ]
]

{ #category : 'tests' }
MeiliSearchTest >> testSearchVectorizedDocuments [
	self
		createIndexNamed: 'mailisearch-st-test-vector-search-1'
		then: [ :index |
			index
				setEmbedder: 'mock'
				using: [ :ops | ops userProvided dimensions: 3 ] ]
		documents: self vectorDocumentsJson
		do: [ :index |
			| resp |
			resp := index vectorSearch: #( 1 2 3 ) embedder: 'mock'.
			self assert: resp estimatedTotalHits equals: 3.
			self assert: (resp hits first at: 'id') equals: 3.

			resp := index vectorSearch: #( 0 0 0 ) embedder: 'mock'.
			self assert: resp estimatedTotalHits equals: 3.

			resp := index vectorSearch: #( 0 0.8 0.2 ) embedder: 'mock'.
			self assert: resp estimatedTotalHits equals: 3.
			self assert: (resp hits first at: 'id') equals: 1 ]
]

{ #category : 'tests' }
MeiliSearchTest >> testSetGetExperimentalFeatures [
	| originalExperimeltalFeatures firstOptionKey isEnabled isEnabledUpdated updatedExperimeltalFeatures |
	[originalExperimeltalFeatures := meilisearch experimentalFeatures.
	firstOptionKey := originalExperimeltalFeatures optionKeys first.
	isEnabled := originalExperimeltalFeatures isEnabled: firstOptionKey.
	meilisearch experimentalFeaturesUsing: [:opts | opts at: firstOptionKey enabled: isEnabled not].
	updatedExperimeltalFeatures := meilisearch experimentalFeatures.
	isEnabledUpdated := updatedExperimeltalFeatures isEnabled: firstOptionKey.
	self assert: isEnabled equals: isEnabledUpdated not.
	] ensure: [  
	meilisearch experimentalFeaturesWithOptions: originalExperimeltalFeatures asDictionary].
]

{ #category : 'tests' }
MeiliSearchTest >> testSetGetIndexDictionarySettings [
	| originalIndexes newIndexId index settingsTask createIndexTask appliedSettings deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-index-dictionary-settings'.
	createIndexTask := meilisearch createIndex: newIndexId.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	
	index := (meilisearch index: newIndexId).
	settingsTask := index applySettingsUsing: [ :opts | 
		opts dictionary: #('J. R. R.' 'J.R.R.').
	].
	settingsTask waitEndedForAWhile.
	
	appliedSettings := index getAllSettings.
	
	self assert: appliedSettings dictionary asSortedCollection equals: #('J. R. R.' 'J.R.R.') asSortedCollection.
	
	(index setDictionary: #('1')) waitEndedForAWhile.
	
	appliedSettings := index getAllSettings.
	
	self assert: appliedSettings dictionary asSortedCollection equals: #('1') asSortedCollection.
	
	deleteIndexTask := index delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.
]

{ #category : 'tests' }
MeiliSearchTest >> testSetGetIndexSeparatorTokensSettings [
	| originalIndexes newIndexId index settingsTask createIndexTask appliedSettings deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-index-separator-tokens-settings'.
	createIndexTask := meilisearch createIndex: newIndexId.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	
	index := (meilisearch index: newIndexId).
	settingsTask := index applySettingsUsing: [ :opts | 
		opts separatorTokens: #('|' '&hellip;'); nonSeparatorTokens: #('@' '#' '&').
	].
	settingsTask waitEndedForAWhile.
	
	appliedSettings := index getAllSettings.
	
	self assert: appliedSettings separatorTokens asSortedCollection equals: #('|' '&hellip;') asSortedCollection.
	self assert: appliedSettings nonSeparatorTokens asSortedCollection equals: #('@' '#' '&') asSortedCollection.
	
	(index setSeparatorTokens: #('1')) waitEndedForAWhile.
	(index setNonSeparatorTokens: #('2')) waitEndedForAWhile.
	
	appliedSettings := index getAllSettings.
	
	self assert: appliedSettings separatorTokens asSortedCollection equals: #('1') asSortedCollection.
	self assert: appliedSettings nonSeparatorTokens asSortedCollection equals: #('2') asSortedCollection.
	
	deleteIndexTask := index delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.
]

{ #category : 'tests' }
MeiliSearchTest >> testTaskEnded [
	| originalIndexes newIndexId newIndex createIndexTask deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-task-1'.
	createIndexTask := meilisearch createIndex: newIndexId.
	self assert: createIndexTask isEnqueued.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	
	newIndex := (meilisearch index: newIndexId) loaded.
	deleteIndexTask := newIndex delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.
	
]
