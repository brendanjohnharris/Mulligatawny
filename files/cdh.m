function cdh()
% Change the directory to HERE. Most often will go at the start of a script.
    loc = dbstack('-completenames');
    if length(loc) > 1
        loc = loc(end, :).file;
        loc = regexp(loc, ['.*(?=\', filesep, '\w+)'], 'match');
        evalin('base', ['cd(''', loc{1}, ''')'])
    end
end
