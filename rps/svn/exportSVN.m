function [] = exportSVN(url, dest, username, password)
% Get Parent Dir _> ...\Rapid-Prototyping-System\
homePath = getParentDir(2, '\');
% SVN Paths..
svnPath = [homePath 'gui\etc\svn'];
svnExe = [svnPath '\svn.exe'];

%Update current folder..
command='export';
flags='-r HEAD';
custom='';

if isempty(username)
    cmd=sprintf('%s %s %s %s %s', svnExe, command, flags, url, dest);
else
    cmd=sprintf('%s %s %s %s %s --username %s --password %s', svnExe, command, flags, url, dest, username, password);
end

[status, cmdout] = dos(cmd);

end