D = 'C:\School\20F\CSDS499\HW\Projects\Project2';
S = dir(fullfile(D,'*'));
N = setdiff({S([S.isdir]).name},{'.','..'}); % list of subfolders of D.
options.format = 'pdf';
options.evalCode = false;
for ii = 1:numel(N)
    T = dir(fullfile(D,N{ii},'*.m')); % improve by specifying the file extension.
    C = {T(~[T.isdir]).name}; % files in subfolder.
    for jj = 1:numel(C)
        F = fullfile(D,N{ii},C{jj})
        publish(F, options);
    end
end