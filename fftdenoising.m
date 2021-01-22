function [denoisedSignal] = fftdenoising(noisedSignal,nSelectedFrequency)

  if (nargin < 2)
    error('Please see demo.');
  end
 
  frequency = fft(noisedSignal);
  mRows = length(frequency);
  selectedFrequencyRange = ones( mRows, 1 );
  selectedFrequencyRange( nSelectedFrequency : (mRows - nSelectedFrequency - 1) ) = 0;
  retainedFrequency = frequency .* selectedFrequencyRange;
  denoisedSignal = ifft(retainedFrequency);
  denoisedSignal = real(denoisedSignal);

end

%!demo
%! load ./Data/noisedata1.txt
%! x = noisedata1(:,2);
%! sf = 12;
%! [x_new] = fftdenoising(x,sf);
%! plot(x_new)

