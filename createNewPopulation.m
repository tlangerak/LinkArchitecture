function population = createNewPopulation(populationSorted, populationSize)
    parents={};
    bestPercentage=0.2;
    randomPercentage=0.05;
    permutationPercentage=0.1;
    
    for getParents = 1:ceil(populationSize*bestPercentage)
        parents(getParents,1)=populationSorted(getParents);
    end
    
    for getRandom = 1:ceil(populationSize*randomPercentage)
        place=round((rand(1)*populationSize-1)+1)
        while place == 0
            place=round((rand(1)*populationSize-1)+1)
        end
        parents(end+1,1)=populationSorted(place,1);
    end
    
    [m,~]=size(parents);
%     for getPermutation = 1:m
%         if permutationPercentage>rand(1)
%             parents(m,1)=randperm(parents(m,1));
%         end
%     end
    
    desiredLength=populationSize-m;
    children={};
    [n,~]=size(children);
    while n < desiredLength
        male=char(parents(round(rand(1)*(m-1))+1,1));
        female=char(parents(round(rand(1)*(m-1))+1,1));
        [~,maleHalf]=size(male);
        maleHalf=ceil(maleHalf/2);
        [~,femaleHalf]=size(female);
        femaleHalf=round(femaleHalf-maleHalf);
        if strcmp(male,female)==0
            malePart=male(1:maleHalf);
            [o,~]=size(female);
            femalePart=female(femaleHalf:end);
            child=strcat(malePart,femalePart);
            children(end+1,1)=cellstr(child);
        end
        [n,~]=size(children);
    end
    
    for l = 1:desiredLength
       parents(end+1,1)=children(l); 
    end
    population=parents;
end