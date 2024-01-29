<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
--opcode-lib=serialOpcodes.dylib -odac
</CsOptions>
<CsInstruments>

sr  = 44100
ksmps = 500 ; the default krate can be too fast for the arduino to handle
nchnls = 2
0dbfs  = 1

instr Main
    ; INSERIRE PORTA COM
    iPort serialBegin "/COM16", 9600			;connect to the arduino with baudrate = 9600
    kFreq serialRead iPort
    aRes poscil3 0.5, kFreq
    out aRes
endin

; Prima chiamata, punto di inizio del programma
schedule("Main", 0, -1 ) 

</CsInstruments>
<CsScore>

</CsScore>
</CsoundSynthesizer>