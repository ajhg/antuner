declare name "antuner";
declare author "antonio goulart";
declare version "0.001";

import("stdfaust.lib");

e6 = checkbox("[0]E");
a5 = checkbox("[1]A");
d4 = checkbox("[2]D");
g3 = checkbox("[5]G");
b2 = checkbox("[4]B");
e1 = checkbox("[3]e");

sound = hgroup("[0].", e6*os.square(164.814) + a5*os.square(220) + d4*os.square(293.665)) + hgroup("[1].", g3*os.square(391.995) + b2*os.square(493.883) + e1*os.square(659.255));

cutoff = hslider("[2]tone", 2250, 500, 4000, 10) : si.smoo;
gain = hslider("[3]volume", 0.5, 0, 1, 0.01) : si.smoo;

process = sound, gain : * : fi.lowpass(2,cutoff) : co.limiter_1176_R4_mono;

