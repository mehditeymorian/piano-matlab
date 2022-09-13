set(0,'DefaultFigureVisible','off')
freq_func = @(n) 2^((n-49)/12) * 440; % calculate each piano button frequency
Fs = 10000; % sample frequency by Hz
Length = 1; % length of each note by Sec
t = 0 : 1/Fs : Length; % sample points 
octave = 0; % octave number
s = 1; % number of first button of current octave
playNote = 0; % play note by pressing a key or not
result = []; % result of playing the notes will be stored in here

% take entry forever
while 1
	% wait for keyboard input
    k = waitforbuttonpress;
    
    % key stroke number
	value = double(get(gcf,'CurrentCharacter'));

% 48 to 56 presents 0 to 8 keys in numpad
% which are used to set octave 
% A _W S _E D F _T G _Y H _U J
% are used to define each octave notes
% only play sound for A _W S _E D F _T G _Y H _U J key strokes
switch value(1)
    case 48
        octave = 0;
        s = 1;
        playNote = 0;
    case 49
        octave = 1;
        s = 4;
        playNote = 0;
    case 50
        octave = 2;
        s = 16;
        playNote = 0;
    case 51
        octave = 3;
        s = 28;
        playNote = 0;
    case 52
        octave = 4;
        s = 40;
        playNote = 0;
    case 53
        octave = 5;
        s = 52;
        playNote = 0;
    case 54
        octave = 6;
        s = 64;
        playNote = 0;
    case 55
        octave = 7;
        s = 76;
        playNote = 0;
    case 56
        octave = 8;
        s = 88;  
        playNote = 0;
    case 97 % A
        n = s;
        fprintf('%dA - %d\n',octave,n);
        playNote = 1;
    case 119 % W
        if octave == 8
            continue; end
        n = s + 1;
        fprintf('%dW - %d\n',octave,n);
        playNote = 1;
    case 115 % S
        if octave == 8
            continue; end
        n = s + 2;
        fprintf('%dS - %d\n',octave,n);
        playNote = 1;
    case 101 % E
        if octave == 8 || octave == 0
            continue; end
        n = s + 3;
        fprintf('%dE - %d\n',octave,n);
        playNote = 1;
    case 100 % D
        if octave == 8 || octave == 0
            continue; end
        n = s + 4;
        fprintf('%dD - %d\n',octave,n);
        playNote = 1;
    case 102 % F
        if octave == 8 || octave == 0
            continue; end
        n = s + 5;
        fprintf('%dF - %d\n',octave,n);
        playNote = 1;
    case 116 % T
        if octave == 8 || octave == 0
            continue; end
        n = s + 6;
        fprintf('%dT - %d\n',octave,n);
        playNote = 1;
    case 103 % G
        if octave == 8 || octave == 0
            continue; end
        n = s + 7;
        fprintf('%dG - %d\n',octave,n);
        playNote = 1;
    case 121 % Y
        if octave == 8 || octave == 0
            continue; end
        n = s + 8;
        fprintf('%dY - %d\n',octave,n);
        playNote = 1;
    case 104 % H
        if octave == 8 || octave == 0
            continue; end
        n = s + 9;
        fprintf('%dH - %d\n',octave,n);
        playNote = 1;
    case 117 % U
        if octave == 8 || octave == 0
            continue; end
        n = s + 10;
        fprintf('%dU - %d\n',octave,n);
        playNote = 1;
    case 106 % J
        if octave == 8 || octave == 0
            continue; end
        n = s + 11;
        fprintf('%dJ - %d\n',octave,n); 
        playNote = 1;
    case 13 % enter
    	%save the result in sample if user hit enter
        audiowrite('sample.wav',result,Fs);
        result = [];
        playNote = 0;
    otherwise
        playNote = 0;
end

if playNote
	% calculate value of dying sine wave
    w = 2*pi*freq_func(n)*t;
    x1 = sin(w) .*exp(-0.001*w);
    % play the note
    soundsc(x1,Fs);
    % append to end of result
    result = [result x1];
    plot(t,x1);
end

end
