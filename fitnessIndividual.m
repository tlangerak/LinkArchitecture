function fitness=fitnessIndividual(population,linkLetters,k,numberOfPages,pairwise,frequency)
    [popSize,~]=size(population);
    fitness=[];
    for x = 1:popSize
        linkArray=char(population(x));
        disp 'calculating fitness individual', x
        fitness(x)=ObjectiveFunction(arrayToArchitecture(linkArray,linkLetters,k),k,numberOfPages,pairwise,frequency);
    end
    
end