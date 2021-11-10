Extension { #name : 'AbstractDictionary' }

{ #category : '*GsBasePharoCompatibiity-Core' }
AbstractDictionary >> removeAll [
	"Override the inherited behavior since dictionaries don't like #removeAll:/"

	self removeAllKeys: self keys
]
