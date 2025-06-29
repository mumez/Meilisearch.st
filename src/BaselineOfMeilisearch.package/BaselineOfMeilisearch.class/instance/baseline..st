baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec 
			package: 'Meilisearch-Core';
			package: 'Meilisearch-Paginator' with: [ spec requires: #('Meilisearch-Core')];
			package: 'Meilisearch-Tests' with: [ spec requires: #('Meilisearch-Core' 'Meilisearch-Paginator')].
		spec 
			group: 'default' with: #('Core' 'Tests');
			group: 'Core' with: #('Meilisearch-Core' 'Meilisearch-Paginator');
			group: 'Tests' with: #('Meilisearch-Tests')].
	spec for: #pharo do:[
		spec package: 'Meilisearch-Core-Pharo'.
		spec package: 'Meilisearch-Core' with: [spec includes: 'Meilisearch-Core-Pharo'].
	].
	spec for: #gemstone do:[
		spec package: 'Meilisearch-Core-GemStone'.
		spec package: 'Meilisearch-Core' with: [spec includes: 'Meilisearch-Core-GemStone'].
	].
