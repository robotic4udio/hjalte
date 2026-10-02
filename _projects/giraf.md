---
layout: project
date: 2018-09-14
title:  Giraf
description: A Bela-based    self-contained polyphonic sampler
image:  '/images/giraf/Giraf.png'
tags:   [Creative-Tech, Music, Composition, Sound-Design, Bela]
featured: false
---

# The instrument
The basis of Giraf is a polyphonic sampler where a sample can be played by hitting the “sound trigger” pad – the amplitude of the sound is determined by how hard the pad is struck. The pitch of this triggered sample can then be controlled by a infra-red distance sensor, in such a way that the further the hand is from the sensor, the lower the pitch. Instead of having continous control, the pitch that is actually played is determined in relation to a selected musical scale making harmonically related results easier to acheive.

![]({{site.baseurl}}/images/giraf/top-labels.jpg)


Se a walktrough of the instrument in the video below:

<p>
<iframe width="560" height="315" src="https://www.youtube.com/embed/huHpao-UUPo?si=0xYT-WLkpHXEUbq2" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
</p>

# Signal path and effects
The signal path of Giraf is as follows:
![]({{site.baseurl}}/images/giraf/Giraf_Block_Diagram-2.png)

Alongside the main sampler Giraf has multiple built-in effects.

- FX1 – Sampler Gain
- FX2 – Biquad Filter
    - The button switches between: Bypass, Lowpass, Highpass and Resonant Bandpass
    - The knob controls the cutoff frequency.
- FX3 – Feedback Delay Line
    - The button switches the effect on/off
    - The knob controls the delay time
- FX4 – Reverberator
    - The button switches the effect on/off
    - The knob controls how much signal goes to the room
    - The action buttons playback the performance in reverse, with the right button resulting in normal pitch and the left button in double pitch and tempo
- The Looper:
    - When the green button is pressed once, sound is recorded until the button is pressed again, which starts overdub mode.
    - When no more overdubbing is required, the button can be pressed a third time to enable playback mode.
    - The red button clears the buffer and prepares the looper for a new recording.

# Software and technical notes

The code implementation is written in C++ and it was programmed using the browser-based Bela IDE, which runs on a server on the Bela itself – no internet required. Using C++ and working with Bela allowed me to keep everything very fast and responsive. There was a total of ~66 samples group delay, that is - at 44.1kHz - 1.5ms of latency from trigger to the sound coming out: thank you Bela!!!

# The Bela Blog
The project can be found on the Bela blog here: [Giraf](https://blog.bela.io/giraf-polyphonic-sampler/)