function population=createPopulation(populationSize, numberOfPages, k, linkLetters)
    population={};
    for size=1:populationSize
       individual=createLinkArchitecture(numberOfPages, k);
       individual=architectureToArray(individual,linkLetters);
       population(size,1)=cellstr(individual);
    end
end
