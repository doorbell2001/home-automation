Class {
	#name : #BaselineOfHomeAutomation,
	#superclass : #BaselineOf,
	#category : #BaselineOfHomeAutomation
}

{ #category : #loading }
BaselineOfHomeAutomation class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'home-automation' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfHomeAutomation >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'HomeAutomation'
		]
]
