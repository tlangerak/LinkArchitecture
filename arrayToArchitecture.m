function linkArchitecture = arrayToArchitecture(linkArray,linkLetters,k)
    
    x_arch=1;
    y_arch=1;
    for q = 1:length(linkArray)
        [a,b]=find(linkLetters == linkArray(q));
        linkArchitecture(x_arch,y_arch)=b;
        y_arch=y_arch+1;
        if y_arch==k+1
            y_arch=1;
            x_arch=x_arch+1;
        end
    end
end
