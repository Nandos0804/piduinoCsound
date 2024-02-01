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
    ; connect to the arduino with baudrate = 9600
    iPort serialBegin "/dev/ttyACM0", 9600			
    kString serialRead iPort ;kString is used as controll parameter,
                            ; does not hold the value
    iFreq = 0   ; 
    ;to avoid use of -1
    ;not sending string, treating serial message as control value
    if (kString == 4 ) then
        kFreq = 440
    elseif (kString == 5) then
        kFreq = 880
    endif
    printk2 kFreq
    aSig poscil3 0.5, kFreq
    out aSig
endin

; Prima chiamata, punto di inizio del programma
schedule("Main", 0, -1 ) 

</CsInstruments>
<CsScore>

</CsScore>
</CsoundSynthesizer>
