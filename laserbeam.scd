/*
Mitchell Sigman (2011) Steal this Sound. Milwaukee, WI: Hal Leonard Books

Adapted for SuperCollider and elaborated by Nick Collins
http://www.sussex.ac.uk/Users/nc81/index.html
under GNU GPL 3 as per SuperCollider license

Minor modifications by Bruno Ruviaro, June 2015.
*/
(
SynthDef("laserbeam", {
	arg out = 0, pan = 0.0, freq = 440, amp = 0.1, att = 0.01;
	var snd, freqenv, ampenv;
	// frequency envelope
	freqenv = EnvGen.ar(Env([4, 0.5, 1, 1], [att, 0.01, 1.0]));
	// amplitude envelope
	// no gate: fixed-time envelope, self-terminating.
	ampenv = EnvGen.ar(
		envelope: Env([0, 1, 0.5, 0.0], [0.02, 0.2, 0.1]),
		levelScale: amp,
		doneAction: 2);
	snd = LFTri.ar(freq: freq * freqenv, mul: ampenv);
	Out.ar(out, Pan2.ar(snd, pan));
}).add;



	Pbind(
		\instrument, "laserbeam",
		\amp, 0.2,
		\midinote,Pseq([36, 48, 60, 72, 84], inf),
		\dur, 0.5,
		\att, Pstutter(8, Pseq([Pshuf((0.01, 0.02..0.1), 1)],inf))
	).play;
)



//their lasers on pp 16-17 seem just to be fast sweeps of frequency of one oscillator by a modulator oscillator, or an envelope.
(

//no use of gate, fixed length
SynthDef(\laserbeam,{|out= 0 freq = 440 amp = 0.1 attackTime= 0.04 gate=1 pan=0.0|

}).add;

)



