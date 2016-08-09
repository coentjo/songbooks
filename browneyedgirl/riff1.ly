\version "2.18.2"

%{
Welcome to LilyPond
%}

\header{
  title = "bass solo Brown eyed girl"
}


mynotes = {
  \repeat volta 2 {
		g,2~ g,8 g,8 b,4 
		c4. c8  e4 fis4
		g4.\4 g,4 b,8 c4 \bar "||" 
  }
  \alternative {
     { d4.\5 d4\5 e8 d4\5 }
     { d4.\4 fis'4 d'8 a8}
  }

}


<<

  \new Voice \with {
%	\set midiInstrument = #"flute"
    \omit StringNumber
  } {
%    \clef "bass_8"
	\clef "G_8"
    \mynotes
  }

  \new TabStaff \with {
    stringTunings = #guitar-tuning
  } {
    \mynotes
  }

  \new TabStaff \with {
    \tabFullNotation
    stringTunings = #guitar-tuning
  } {
    \mynotes
  }



>>



