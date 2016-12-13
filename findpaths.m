%this part is heavily base on:
%http://stackoverflow.com/questions/28824640/find-all-possible-paths-in-a-graph-using-matlab-brute-force-search
%only a part about scent is added. 
%I could also implement here that the scent per link (not the overall
%scent), should be rising. 

function paths = findpaths(Adj, nodes, currentPath, start, target, probabilities, scent)
   paths = {};
   nodes(start) = 0;
   currentPath = [currentPath start];
   childAdj = Adj(start,:) & nodes;
   childList = find(childAdj);
   childCount = numel(childList);
   
   %have a minimum scent for a path, otherwise the amount of possible paths gets insane
   scent=scent*probabilities{start,target};
   if scent<0.05 
       return;
   end
   
   if childCount == 0 || start == target
      if start == target
        paths = [paths; currentPath];
        scent=1;
      end
      return;
   end
      
   for idx = 1:childCount
      currentNode = childList(idx);
      newNodes = nodes;
      newNodes(currentNode) = 0;
      newPaths = findpaths(Adj, newNodes, currentPath, currentNode, target, probabilities, scent);
      paths = [paths; newPaths];
      
   end
end