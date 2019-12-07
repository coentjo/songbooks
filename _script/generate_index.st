| dir stream  |
dir := '/Users/Coen/gitRepos/songbooks' asFileReference . 
stream := (dir / 'index' , 'txt' ) writeStream .

(dir filesMatching: '*.pdf') 
	do: [ :pdfFile | 
		stream nextPutAll: '[', (pdfFile fullName ) , '](' , pdfFile fullName , ')'
			, Character cr asString 
			, Character lf asString 
		 ] .

stream close
