function [freq] = estFreqEsprit(R, fs)

% Eigendecomposition.
[E, ~] = eig(R);

% Number of rows on R.
nRows = size(R, 1);

% Number of harmonics desired (2 * the actual number if real signal).
nHarmonics = 2;

% Selection matrices.
J1 = [eye(nRows-1,nRows-1) zeros(nRows-1,1)];
J2 = [zeros(nRows-1,1) eye(nRows-1,nRows-1)];

% Signal subspace.
Es = E(:, (nRows - nHarmonics + 1):nRows);

% Compute Phi.
Phi = pinv(J1 * Es) * J2 * Es;

% Compute eigenvalues of Phi.
eigenvaluesPhi = eig(Phi);

% Compute the frequencies from the eigenvalues of Phi.
freqs = angle(eigenvaluesPhi);

% Extract the harmonic of interest.
freq = freqs(freqs > 0)/(2 * pi) * fs;

end

