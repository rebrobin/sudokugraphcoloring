
set V; #set of vertices

set H; #set of colors in precoloring

set E within (V cross V); #set of edges in graph

set C within (V cross H); #set of precolored vertices

param N; #number of colors in palette (how many numbers we are using for the sudoku model)


var w{1..N} binary; #if color i is used

var x{V,1..N} binary; #color i is given to vertex k




minimize Colors: sum{i in 1..N} w[i]; #doing this has the program find a sudoku solution within
									  #the 4 colors


subject to Assigned {i in V}: #each vertex gets colored

sum{j in 1..N} x[i,j]=1;


subject to Edges {(i,j) in E, k in 1..N}: #no two adjacent vertices have same color

x[i,k] + x[j,k] <= w[k];


subject to ExistingColors {(i,j) in C}: #the existing numbers of the sudoku are precolored

x[i,j] = 1;

