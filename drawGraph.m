function []=drawGraph(linkArchitecture, numberOfPages,k)
linkNodes=zeros(numberOfPages);
for x_link = 1:numberOfPages
    for y=1:k
        linkNodes(x_link,linkArchitecture(x_link,y))=1;
    end
end

G=digraph(linkNodes);
plot(G)