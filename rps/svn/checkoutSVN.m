function [] = checkoutSVN(repository, destination, depth, username, password)
%Define important Paths which will be needed ...
homePath = getParentDir(2, '\');
svnPath = [homePath 'gui\etc\svn'];
svnExe = [svnPath '\svn.exe'];
svnBench = [svnPath '\svn-bench.exe'];

%Check size of Files which will be transfered..
command='checkout';
custom='-r HEAD';

repository = strrep(repository, '\', '/');

if isempty(username)
    cmd=sprintf('%s %s %s %s %s --depth %s', svnExe, command, custom, repository, destination, depth);
else
    cmd=sprintf('%s %s %s %s %s --depth %s --username %s --password %s', svnExe, ...
        command, custom, repository, destination, depth, username, password);
end
[status, cmdout] = dos(cmd, '-echo');
end