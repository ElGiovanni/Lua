require "Functions"

os.execute("cls")
x = 0
print("Este programa calculara aproximaciones a x utilizando el metodo de punto fijo.")
io.write("Por favor dame la funcion que quiera utilizar: ")
local s = io.stdin:read()
local f = "a=" .. s
io.write("Por favor dame la funcion despejada: ")
s = io.stdin:read()
local g = "b=" .. s
io.write("Por favor dame el primer valor del intervalo [a,b]: ")
local an,bn = io.read("*n","*n")
repeat
  io.write("Por favor dame el numero de iteraciones: ")
  iter = io.read("*n")
  if iter <= 0 then print("Ingrese un numero mayor que 0: ") end
until iter >= 0
io.write("Por favor deme el n".. string.char(163) .."mero de la TOL aceptada (solo el valor de k): ")
local n = io.read("*n")
TOL = 5*math.pow(10,-n)

x = an
loadstring(f)()
fa = a
x = bn
loadstring(f)()
fb = a
pn = (an+bn)/2
x = pn
loadstring(f)()
fp = a

error = 100
cont = 1
if fa * fb < 0 then
  tabla = string.format("%-8s%-20s%-25s%-20s","|n","|pn","|fp","|Error")
  print(tabla)
  tabla = string.format("%-8s%-20s%-25s%-20s","|0","|" .. pn,"|" .. fp,"| -------")
  print(tabla)

  while error > TOL and iter > cont do
    ant = pn
    x = an
    loadstring(f)()
    fa = a
    x = bn
    loadstring(f)()
    fb = a
    x = ant
    loadstring(g)()
    pn = b
    x = pn
    loadstring(f)()
    fp = a
    error = math.abs((x - ant)/x)
    tabla = string.format("%-8s%-20s%-25s%-2s","|" .. cont,"|" .. pn,"|" .. fp,"|" .. error)
    print(tabla)
    cont = cont + 1
    if fp == 0 or error <= TOL then
      print()
      print("la raiz tolerable es: " .. pn)
    end
  end
else
  print()
  print("No hay cambio de signo al evaluar en los intervalos dado,")
  print("por lo tanto no podemos hacer aprox. a la ra".. string.char(161) .."z")
end
if cont > iter then
  print("no converge en ".. iter .." iteraciones")
end
os.execute("pause")
os.execute("cls")
