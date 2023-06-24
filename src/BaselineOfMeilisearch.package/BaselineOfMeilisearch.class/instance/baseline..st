baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec 
			package: 'Meilisearch-Core'.
		spec 
			group: 'default' with: #('Core');
			group: 'Core' with: #('Meilisearch-Core-Core')].
	spec for: #pharo do:[
		self neojson: spec.
		spec package: 'Meilisearch-Core-Core-Pharo'.
		spec package: 'Meilisearch-Core-Core' with: [spec includes: 'Meilisearch-Core-Core-Pharo'].
	].
	spec for: #gemstone do:[
		spec package: 'Meilisearch-Core-Core-GemStone'.
		spec package: 'Meilisearch-Core-Core' with: [spec includes: 'Meilisearch-Core-Core-GemStone'].
	].
