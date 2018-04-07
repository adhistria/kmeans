function [ finalCentroid,classData ] = kMeans( dataSet,centroid )
finalCentroid= zeros(7,2);
finalCentroid2 = ones(7,2);
c=1;
while(finalCentroid2~=finalCentroid) 
    finalCentroid2=finalCentroid;
    classData = [];
    for i=1:length(dataSet)
        euc = [];
        for j=1:length(centroid)
            if(c==1)
               euc=[euc; norm(dataSet(i,:)-centroid(j,:))];
            else
               euc=[euc; norm(dataSet(i,:)-finalCentroid(j,:))];
            end
        end
        [~, label] = min(euc);
        classData = [classData;label];
    end
    for k=1:length(centroid)
       groupLabel = find(classData==k);
       finalCentroid(k,:) = mean(dataSet(groupLabel,:));
    end
    c=c+1;
end