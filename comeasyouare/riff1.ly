%{
Welcome to LilyPond
%}


\header{
  title = "Theezakje"
}


% notes and bass tab

<<
  \new Voice \with {
    \omit StringNumber
  } {
    \clef "bass_8"
    \relative c, {
      c4 d e f
    }
  }
  \new TabStaff \with {
    stringTunings = #bass-tuning
  } {
    \relative c, {
      c4 d e f
    }
  }
>>


%{
\new TabStaff {
  \override Staff.Clef #'stencil = #(lambda (grob)
    (grob-interpret-markup grob TAB))
  a
}
%}




<<
	\chords { c2 g:sus4 f e }
	\relative c'' {
		c4 c c c 
		c c c c
		c c c c
		c c c c
	}
	\addlyrics { maar al wa ze aonthouwe is 
		theezakje theezakje theezakje
	}
>>



<<
  \chords { c2 g:sus4 f e }
  \relative c'' {
    a4 e c8 e r4
    b2 c4( d)
	d8 d d d d d d
  }
  \addlyrics { One day this shall be free __ 
%	bla nbla bnla sergjhsenpr er  asrs;uh fu 
	}
>>




%{
\relative {
  c' d e f g a b c
}
%}

%{
one = \markup { \finger 1 }
two = \markup { \finger 2 }
threeTwo = \markup {
  \override #'(baseline-skip . 2)
  \column {
    \finger 3
    \finger 2
  }
}
threeFour = \markup {
  \override #'(baseline-skip . 2)
  \column {
    \finger 3
    \finger 4
  }
}

\score {
  \new TabStaff {
    \stemUp
    e8\4^\one b\2 <e, g\3 e'\1>^>[ b\2 e\4]
    <a\3 fis'\1>^>^\threeTwo[ b\2 e\4]
  }
}


\score {
  \new TabStaff {
    \relative c'' {
      c4( d) d( d)
      d2( c)
    }
  }
}



\new TabStaff {
  \relative c {
    g16 b d g b d g b
    \stemDown
    \override Beam #'damping = #+inf.0
    g,,16 b d g b d g b
  }
}


upper = \relative c' {
  \time 12/8
  \key e \minor
  \voiceOne
  r4. r8 e, fis g16 b g e e' b c b a g fis e
}

lower = \relative c {
  \key e \minor
  \voiceTwo
  r16 e d c b a g4 fis8 e fis g a b c
}

\score {
  <<
    \new StaffGroup = "tab with traditional" <<
      \new Staff = "guitar traditional" <<
        \clef "treble_8"
        \context Voice = "upper" \upper
        \context Voice = "lower" \lower
      >>
      \new TabStaff = "guitar tab" <<
        \context TabVoice = "upper" \upper
        \context TabVoice = "lower" \lower
      >>
    >>
  >>
}

TAB = \markup {
  \raise #1.5
  \sans
  \bold
  \huge
  \override #'(baseline-skip . 2.5)
  \left-align
  \center-column {
    T
    A
    B
  }
}


%}




\version "2.18.2"  % necessary for upgrading to future LilyPond versions.
