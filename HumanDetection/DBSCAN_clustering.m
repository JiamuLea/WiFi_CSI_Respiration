close all;
clc;
k = 3;
Eps = 2;
data = [DataSample; DataSample2];
%% 生成模拟数据
% n = 200;
% a = linspace(0,8*pi,n/2);
% u = [5*cos(a)+5 10*cos(a)+5]'+1*rand(n,1);
% v = [5*sin(a)+5 10*sin(a)+5]'+1*rand(n,1);
% mu1 = [20 20];
% S1 = [10 0;0 10];
% data1 = mvnrnd(mu1,S1,100);
% data = [u v;data1];
% 
% image = imread('data.png');
% image = image(:,:,1);
% [x,y]=find(image == 0);
% data=[x,y];

%% 准备变量，输出原始结果
[m,n] = size(data);
data=[(1:m)',data];
n = n + 1;
type = zeros(1,m);
cluster_No = 1;
visited = zeros(m,1);
class = zeros(1,m)-2;

plot(data(:,2),data(:,3),'k.');
grid on
xlabel('x');ylabel('y');
title('原始输入点');
hold on;

%% DBscan
Kdtree = KDTreeSearcher(data(:,2:3));

for i = 1:m
    % 抽取一个未访问点
    if visited(i)==0
        % 标为访问
        visited(i) = 1;
        point_now = data(i,:);
        Idx_range = rangesearch(Kdtree, point_now(2:3), Eps);
        index = Idx_range{1};
        if length(index) > k
            class(i) = cluster_No;
            while index
                if visited(index(1)) == 0
                    visited(index(1)) = 1;
                    if class(index(1)) <= 0
                        class(index(1)) = cluster_No;
                    end
                    point_now = data(index(1),:);
                    Idx_range = rangesearch(Kdtree, point_now(2:3), Eps);
                    index_temp = Idx_range{1};
                    index(1) = [];
                    if length(index_temp) > k
                        index = [index, index_temp];
                    end
                else
                    index(1) = [];
                end
            end
            cluster_No = cluster_No + 1;
        end
    end
end

%% DBscan聚类结果
figure;
for i = 1: cluster_No
    color = [rand(),rand(),rand()];
    data_class = data(find(class==i),:);
    plot(data_class(:,2),data_class(:,3),'.','Color',color,'MarkerFaceColor',color);
    hold on
end
data_class = data(find(class<=0),:);
plot(data_class(:,2),data_class(:,3),'k*');
hold on
grid on
xlabel('x');ylabel('y');
title('DBscan聚类结果');
