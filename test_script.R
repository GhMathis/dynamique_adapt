library(plot3D)
library(rgl)
library(deSolve)

K = function(x){return((1-0.5*(x - 1)^2))}

a = function(x,y){return(exp(-1/2*(x-y)^2)}

X = list(x1 = seq(0.01,1.99,length.out = 100), 
         x2 = seq(0.01,1.99,length.out = 100))


s = function(x1,x2) {1 - a(x1,x2) *(K(x2) / K(x1))}
plot3d(s, xlim = c(0.01,1.99), ylim = c(0.01,1.99))

fitness = function(X){
  df = data.frame(x1 = rep(NA, length(X$x1)**2),
                  x2 = rep(NA, length(X$x2)**2),
                  s = rep(NA, length(X$x2)**2))
  n = 1
  for (x1 in X$x1){
    for(x2 in X$x2){
      s =  1 - a(x1,x2) *(K(x2) / K(x1))
      df[n,] = c(x1, x2, s)
      n = n+1
    }
  }
    
 return(df)
}
fitness_output = fitness(X)
str(fitness_output)
plot3d(fitness_output$x1,fitness_output$x2,fitness_output$s,type="l",col="red") 

plot(fitness_output$x1,fitness_output$x2, "p")
plot(fitness_output$x1[fitness_output$s == 0],fitness_output$x2[fitness_output$s == 0])
x = rnorm(100) ; 
y = rnorm(100)  ; 
z =  rnorm(100)   
plot3d(x,y,z,type="p",col="purple",xlab="parameter x",ylab=" parameter y",zlab="parameter z" ) 
# Pour sauvegarder une capture
rgl.snapshot("rgl_2_R.gif")

A_val = simplify2array()
K_val = 


GLV = function(t, N, params){
  with(as.list(params), {
    
    
  })
}