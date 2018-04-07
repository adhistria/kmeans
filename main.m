dataSet = csvread('Aggregation.csv');
scatter(dataSet(:,1),dataSet(:,2));
%% 

while SSE1>2750
    randCent = randperm(length(dataSet),max(dataSet(:,3)));
    centroid = dataSet(randCent,1:2);
    [finalCentroid,classCentroid] = kMeans(dataSet(:,1:2),centroid);
    for i=1:length(finalCentroid)
       finalCentroid(i,3) = i; 
    end
    hasilKMeans = (dataSet(:,1:2));
    hasilKMeans(:,3) = classCentroid;
    SSE1 = (hitungSSE(finalCentroid(:,1:2),hasilKMeans));
end
figure;scatter(hasilKMeans(:,1),hasilKMeans(:,2),10,hasilKMeans(:,3)); hold on
scatter(finalCentroid(:,1),finalCentroid(:,2),100,finalCentroid(:,3))
figure;scatter(dataSet(:,1),dataSet(:,2),10,dataSet(:,3));
%% d
while SSE2>2700
    for i=1:max(dataSet(:,3))
        index = find(dataSet(:,3)==i);
        idx = randperm(length(index),1);
        newCentroid(i,:) = dataSet(index(idx,1),1:2);
    end
    [finalCentroid,classCentroid] = kMeans(dataSet(:,1:2),newCentroid(:,1:2));
    for i=1:length(finalCentroid)
       finalCentroid(i,3) = i; 
    end
    hasilKMeans = (dataSet(:,1:2));
    hasilKMeans(:,3) = classCentroid;
    SSE2 = (hitungSSE(finalCentroid(:,1:2),hasilKMeans));
end
figure;scatter(hasilKMeans(:,1),hasilKMeans(:,2),10,hasilKMeans(:,3)); hold on
scatter(finalCentroid(:,1),finalCentroid(:,2),50,finalCentroid(:,3));
figure;scatter(dataSet(:,1),dataSet(:,2),10,dataSet(:,3));
