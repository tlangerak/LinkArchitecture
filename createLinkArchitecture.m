function linkArchitecture=createLinkArchitecture(numberOfPages, k)
    linkArchitecture=zeros(numberOfPages,k); %initialize double to store link architecture. 
    for x = 1:numberOfPages
       for y=1:k
            r=round(rand(1)*(numberOfPages-1))+1;
           while r == x || ismember(r, linkArchitecture(x), 'rows')== 1 %% a page cannot link to the page on which it is present and there cannot be twolinks linking to the same page. 
            r=round(rand(1)*(numberOfPages-1))+1;
           end
            linkArchitecture(x,y)=r;
       end
    end
end