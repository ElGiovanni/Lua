--[[
  Alumno: GLC
  Fecha: 24/09/2016
  Programa: Secante.lua
  Descripcion: Este programa calculara aproximaciones a la raiz con el metodo de la Secante
]]--
require "Functions" --SE REQUIERE EL ARCHIVO "Functions.lua"

os.execute("cls")
x = 0 -- ESTA X ES UTILIZADA PARA EL PARSER
-- ******************************* MENU **********************************
print("Este programa calculara aproximaciones a x utilizando el metodo de punto fijo.")
io.write("Por favor dame la funcion que quiera utilizar: ")
s = io.stdin:read()
f = "a = " .. s --{Aqui se guarda la ecuacion f que me da el usuario, en un string que despues se leera como codigo}
io.write("Por favor dame los valores del intervalo [a,b]: ")
an,bn = io.read("*n","*n")
repeat
  io.write("Por favor dame el numero de iteraciones: ")
  iter = io.read("*n")
  if iter <= 0 then print("Ingrese un numero mayor que 0: ") end
until iter >= 0
io.write("Por favor deme el n".. string.char(163) .."mero de la TOL aceptada (solo el valor de k): ")
n = io.read("*n")
TOL = math.pow(10,-n)
-- *************************************************************************
cont = 1
x = an
loadstring(f)()
fa = a
x = bn
loadstring(f)()
fb = a

if fa * fb < 0 then
  tabla = string.format("%-8s%-20s%-25s%-25s","|n","|Xn","|f(Xn)","|Error")
  print(tabla)
  cn = bn - (fb * (bn - an))/(fb - fa)
  an = bn
  bn = cn
  aux = an
  x = cn
  loadstring(f)()
  fcn = a
  tabla = string.format("%-8s%-20s%-25s%-25s","|" .. cont,"|" .. cn,"|" .. fcn,"| ----------------")
  print(tabla)

  repeat
    -- EVALUACION DE LOS NUEVOS VALORES DEL INTERVALO
    x = an
    loadstring(f)()
    fa = a
    x = bn
    loadstring(f)()
    fb = a
    if fa - fb == 0 then print(); print("Division entre 0 :C"); os.execute("pause"); os.execute("cls"); os.exit() end
    -- **********************************************
    cn = bn - (fb * (bn - an))/(fb - fa)
    error = math.abs(cn - aux)/cn
    an = bn
    bn = cn
    aux = an
    x = cn
    loadstring(f)()
    fcn = a

    tabla = string.format("%-8s%-20s%-25s%-25s","|" .. cont,"|" .. cn,"|" .. fcn,"|" .. error)
    print(tabla)
    cont = cont + 1
    if fcn == 0 or error <= TOL then
      print()
      print("la raiz tolerable es: " .. x)
      os.execute("pause")
      os.execute("cls")
      os.exit()
    end
  until cont > iter

  if cont > iter then
    print()
    print("La raiz no converge en " .. iter .. " iteraciones.")
  end
else
  print()
  print("No hay raiz de la ecuacion: ".. s .. ", en el intervalo dado." )
end
os.execute("pause")
os.execute("cls")
