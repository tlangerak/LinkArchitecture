function linkArray = architectureToArray(linkArchitecture,linkLetters)
    [m,n]=size(linkArchitecture);
    linkArray='';    
    for r =1:m
        for e=1:n
            addLetter=linkLetters(linkArchitecture(r,e));
            linkArray=[linkArray addLetter];
        end
    end    
end