Extension { #name : 'Date' }

{ #category : '*GsBasePharoCompatibility-Core' }
Date class >> fromISOString: aString [
	"Answer a Date decoded from a ISO format string: YYYY-MM-DD"

	^Date fromString: aString usingFormat: #(3 2 1 $- 1 1)
]

{ #category : '*GsBasePharoCompatibility-Core' }
Date >> ddmmyyyy [
	"Common format: mm/dd/yyyy
	 Per Wikipedia, 56 countries use YMD, 230 use DMY, and 33 use MDY formats. Many use more than one.
	 Most countries using DMY or MDY do not use hyphens. Slash and dot are most common.
	 https://en.wikipedia.org/wiki/Date_format_by_country"
	"(Date newDay: 28 monthNumber: 9 year: 2018) ddmmyyyy >>> '28/09/2018'"

	^self asStringUsingFormat: #(1 2 3 $/ 1 1)
]

{ #category : '*GsBasePharoCompatibility-Core' }
Date >> mmddyyyy [
	"US format: mm/dd/yyyy
	 Per Wikipedia, 56 countries use YMD, 230 use DMY, and 33 use MDY formats. Many use more than one.
	 Most countries using DMY or MDY do not use hyphens. Slash and dot are most common.
	 https://en.wikipedia.org/wiki/Date_format_by_country"
	"(Date newDay: 28 monthNumber: 9 year: 2018) mmddyyyy >>> '09/28/2018'"

	^self asStringUsingFormat: #(2 1 3 $/ 1 1)
]

{ #category : '*GsBasePharoCompatibility-Core' }
Date >> yyyymmdd [
	"ISO format: yyyy-mm-dd
	 Per Wikipedia, 56 countries use YMD, 230 use DMY, and 33 use MDY formats. Many use more than one.
	 Most countries using DMY or MDY do not use hyphens. Slash and dot are most common.
	 https://en.wikipedia.org/wiki/Date_format_by_country"
	"(Date newDay: 28 monthNumber: 9 year: 2018) mmddyyyy >>> '2018-09-28'"

	^self asStringUsingFormat: #(3 2 1 $- 1 1)
]
