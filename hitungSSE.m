function [ SSE ] = hitungSSE( centroid,dataKluster)
SSE=0;
for i=1:length(centroid)
    index = find(dataKluster(:,3)==i);
    data = dataKluster(index,1:2);
    for j=1:length(data)
       SSE = SSE+(norm(centroid(i,:)-data(j,:)));
    end
end

