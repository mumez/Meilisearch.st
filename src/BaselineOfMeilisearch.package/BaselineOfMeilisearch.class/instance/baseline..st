baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec 
			package: 'Meilisearch-Core'.
		spec 
			group: 'default' with: #('Core');
			group: 'Core' with: #('Meilisearch-Core')].
	spec for: #pharo do:[
		spec package: 'Meilisearch-Core-Pharo'.
		spec package: 'Meilisearch-Core' with: [spec includes: 'Meilisearch-Core-Pharo'].
	].
	spec for: #gemstone do:[
		spec package: 'Meilisearch-Core-GemStone'.
		spec package: 'Meilisearch-Core' with: [spec includes: 'Meilisearch-Core-GemStone'].
	].
