 function quality = ObjectiveFunction(linkArchitecture,k,numberOfPages,pairwise,frequency)
    %create link probabilities
    %the probability the user will click is the pairwise_semantice_relavance of
    %the topic of the link to the target, divide of all pairwise_semamntic_relevances on that page

    linkProbabilities={};
    pairwiseSemanticRelevancePerPage={};
    probaPerTarget=zeros(numberOfPages,1);

    %calculate the chance the user presses a link. This is done by look ing
    %at the pairwise semantic relevance for each link to the target on a
    %page. Summing them and diving the sementantic relevance per link on
    %the page by the total.
    %this makes the assumption that semantic relevance 100% corresponds
    %with the hyperlink text and context. Meaning that only relevance plays
    %a role and not the communication of that relevance. 
    
    for t=1:numberOfPages
        for x=1:numberOfPages
            for y=1:k
                pairwiseSemanticRelevancePerPage(x,y)=pairwise(linkArchitecture(x,y),t);
            end
        end
        for x=1:numberOfPages
                sum=0;
            for y=1:k
                sum=sum+pairwiseSemanticRelevancePerPage{x,y};
            end
           for y=1:k
                linkProbabilities{x,y}=pairwiseSemanticRelevancePerPage{x,y}/sum;
           end        
        end
        
        %for each target, calculate the possibility that the user will find
        %the target, for all possible routes with a certain strength of
        %scent. 
        ProbUserFindsRoute
    end
    
    %calculate the overall quality of the link architecture. This is the
    %sum of (probabilities the target reached*frequency) divided by the
    %total frequency for the webpage. 
    
    quality=0;
    for e=1:numberOfPages
       quality=quality+(probaPerTarget(e,1)*frequency(1,numberOfPages)); 
    end
    
    totalWeight=0;
    for r=1:numberOfPages
        totalWeight=totalWeight+frequency(1,numberOfPages);
    end
    quality=quality/totalWeight;
end
