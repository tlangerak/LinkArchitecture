clear all
clc

%assuming that the Pairwase Semantic Relation ships are equal to the Scent
%(which makes the assumption that the links are a 100% clear)

frequency = ReadFrequency('Frequency.csv');
pairwise = ReadPairwise('Pairwise_Semantic_Relevance.csv');

k=5; %number of links per page
numberOfPages=18; %number of pages on the website
populationSize=100;

%randomly generate the first link architecture
%an addition I can make is the automatically include the links to parents
%and childs. 

linkLetters=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
%linkArchitecture=createLinkArchitecture(numberOfPages,k);

population=createPopulation(populationSize,numberOfPages,k, linkLetters);

fitness=fitnessIndividual(population,linkLetters,k,numberOfPages,pairwise,frequency);
[fitness_sorted,sorting_index]=sort(fitness,'descend');
populationSorted={};
bestFitness=0;
worstFitness=fitness_sorted(end,1);
for sorting = 1:populationSize
    populationSorted(sorting,1)=population(sorting_index(sorting));
end
for time =1:150
    disp 'creating new population'
    population=createNewPopulation(populationSorted, populationSize);
   
    disp 'sorting population'
    fitness=fitnessIndividual(population,linkLetters,k,numberOfPages,pairwise,frequency);
    [fitness_sorted,sorting_index]=sort(fitness,'descend');
    populationSorted={};
    
    for sorting = 1:populationSize
        populationSorted(sorting,1)=population(sorting_index(sorting));
    end

    if fitness_sorted(1,1)>bestFitness(1,1)
       bestFitness=fitness_sorted(1,1);
       bestArchitecture=populationSorted(1,1);
    end
    time
end

test=arrayToArchitecture(bestArchitecture{1,1}, linkLetters, k)
worstFitness
bestFitness

%create array from link architecture for easy modification. 
%linkArray=architectureToArray(linkArchitecture, linkLetters)

%ObjectiveFunction calculates the weighted average of a user can reach a
%webpage. OQ=sum(probability of reaching that webpage*# of people wanting
%to reach that webpage)/total amount of people on website.
%the higher this is, the higher the chance that most people can reach their
%target link. k=4 takes 4 seconds per call
%arrayToArchitecture creates a matrix from an array of links
%overallQuality = ObjectiveFunction(arrayToArchitecture(linkArray,linkLetters,k),k,numberOfPages,pairwise,frequency)