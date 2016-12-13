%create Nodes
linkNodes=zeros(numberOfPages);
for x_link = 1:numberOfPages
    for y=1:k
        linkNodes(x_link,linkArchitecture(x_link,y))=1;
    end
end

%just for reference purposes. the can be commented while optamizing. 
%G=digraph(linkNodes);
%plot(G)

%find all simple (meaning no node twice) possible paths from 1 to target,
%with an average scent higher than x
unusedNodes=ones(1,size(linkNodes,1));
start=1;
target=t;
emptyPath=[];
allPaths =[];
allPaths = findpaths(linkNodes, unusedNodes, emptyPath, start, target, pairwise,1);

%find the probability the user succesfully executes that path. 
[m,~]=size(allPaths);
for f = 1:m
    cPath=allPaths(f);
    completePath=cPath{1,1};
    [~,n]=size(completePath);
    proba=1;
    for h = 1:n-1
        [x_link,y_link] = find(linkArchitecture == completePath(h+1));
        [o,~]=size(x_link);
        for p = 1:o
            if x_link(p) == completePath(h)
                linkProba=linkProbabilities{x_link(p),y_link(p)};
            end      
        end
        proba=proba*linkProba;
    end
    probaPerPath(f,1)=proba;
end

%sum all possible executions to create the chance the user finds the
%target.
[q,~]=size(probaPerPath);
for w=1:q
    probaPerTarget(target,1)=probaPerTarget(target,1)+probaPerPath(w,1);
end