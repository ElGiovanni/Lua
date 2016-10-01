--[[
  Alumno: GLC
  Fecha: 23/09/2016
  Programa: NewtonRhapson.lua
  Descripcion: Este programa calculara aproximaciones a la raiz con el metodo Newton Rhapson
]]--

require "Functions"

os.execute("cls")
x = 0
print("Este programa calculara aproximaciones a x utilizando el metodo de Newton Rhapson.")
io.write("Por favor dame la funcion que quiera utilizar: ")
s = io.stdin:read()
f = "a = " .. s --{Aqui se guarda la ecuacion f que me da el usuario, en un string que despues se leera como codigo}
io.write("Por favor dame la derivada de la funcion: ")
s = io.stdin:read()
g = "b = " .. s --{Aqui se guarda la derivada de f que me da el usuario, en un string que despues se leera como codigo}
io.write("Por favor dame el valor inicial: ")
x = io.read("*n")
repeat
  io.write("Por favor dame el numero de iteraciones: ")
  iter = io.read("*n")
  if iter <= 0 then print("Ingrese un numero mayor que 0: ") end
until iter >= 0
io.write("Por favor deme el n".. string.char(163) .."mero de la TOL aceptada (solo el valor de k): ")
n = io.read("*n")
TOL = 5*math.pow(10,-n)

loadstring(f)() --{Parser}
fp = a  --{Se evalua la funcion original con el valor inicial}
loadstring(g)() --{Parser}
gp = b --{Se evalua la funcion con la derivada}

  cont = 1
  tabla = string.format("%-8s%-20s%-25s%-25s%-25s","|n","|Xn","|f(p)","|g(p)","|Error")
  print(tabla)
  tabla = string.format("%-8s%-20s%-25s%-25s%-25s","|0","|" .. x,"|" .. fp,"|" .. gp,"| -------")
  print(tabla)

  repeat
    xant = x --{Se guarda la xant, para luego evaluar la nueva x}
    x = xant - (fp/gp) --{Evaluacion de la nueva x}
    error = math.abs(x - xant)/x
    loadstring(f)()
    fp = a
    loadstring(g)()
    gp = b
    tabla = string.format("%-8s%-20s%-25s%-25s%-25s","|" .. cont,"|" .. x,"|" .. fp,"|" .. gp,"|" .. error)
    print(tabla)
    cont = cont + 1
    if x == 0 or error <= TOL then --{Por si se llega a la raiz o a cumplir la tolerancia}
      print()
      print("la raiz tolerable es: " .. x)
      os.execute("pause")
      os.execute("cls")
      os.exit()
    end
    if gp == 0 then
      print()
      print("la derivada no es continua")
      os.execute("pause")
      os.execute("cls")
      os.exit()
    end
  until cont > iter

  if cont > iter then --{Si llega a este punto, se necesitan mas iteraciones}
    print()
    print("La raiz no converge en " .. iter .. " iteraciones.")
  end
os.execute("pause")
os.execute("cls")
