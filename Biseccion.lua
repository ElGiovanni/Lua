--[[
  Programa: Biseccion.lua
  Autor: GLC
  Fecha: 5/09/2016
  Descripcion: Aproximaciones al valor de x con metodo de biseccion
]]

require "Functions"

-- ******************************** FUNCTIONS *************************************
function Combinacion()
  os.execute("cls")
  x = 0
  io.write("Por favor dame la ecuacion que quiera usar para la aproximacion: ")
  local s = io.stdin:read()
  s = "a=" .. s
  io.write("Por favor dame el primer valor del intervalo [a]: ")
  local an = io.read()
  io.write("Por favor dame el segundo valor del intervalo [b]: ")
  local bn = io.read()
  io.write("Por favor deme el n".. string.char(163) .."mero de la TOL aceptada (solo el valor de k): ")
  local n = io.read()
  TOL = 5*math.pow(10,-n)

  pn = ((an+bn)/2)
  x = an
  loadstring(s)()
  fa = a
  x = pn
  loadstring(s)()
  fp = a
  s1 = string.format("%-8s%-20s%-20s%-20s%-25s%-25s%-25s","|n","|an","|bn","|pn","|f(an)","|f(pn)","|error")
  print(s1)
  s2 = string.format("%-8s%-20s%-20s%-20s%-25s%-25s%-25s","|0","|" .. an,"|" .. bn,"|" .. pn,"|" .. fa,"|" .. fp,"|  ------")
  print(s2)

  if fa*fp > 0 then
      an = pn
  else
      bn = pn
  end
  pn2 = pn

  i = 1
  repeat
    pn = ((an+bn)/2)
    x = an
    loadstring(s)()
    fa = a
    x = pn
    loadstring(s)()
    fp = a
    local Error = math.abs((pn-pn2)/pn)
    s2 = string.format("%-8s%-20s%-20s%-20s%-25s%-25s%-25s","|" .. i,"|" .. an,"|" .. bn,"|" .. pn,"|" .. fa,"|" .. fp,"|" .. Error)
    print(s2)
    if fa*fp > 0 then
        an = pn
    else
        bn = pn
    end
    pn2 = pn
    i = i+1
  until Error < TOL
  os.execute("pause")
end

-- ******************************** POLINOMIO ********************************
function PoliEva(a,n,x)
  local res = 0.0
  for i=0,n do
      res = res + (a*math.pow(x,n))
  end
  return res
end

function Polinomial()
  os.execute("cls")
  tablaA = {}
  io.write("Por favor deme el numero de coeficientes del polinomio: ")
  local n = io.read("*n")
  io.write("Por favor deme el valor de x: ")
  local x = io.read("*n")
  io.write("Por favor deme el intervalo [a,b]: ")
  local a,b = io.read("*n","*n")

  s = string.format("%-8s%-20s%-20s%-20s%-25s%-25s%-25s","|n","|an","|bn","|pn","|f(an)","|f(pn)","|error")
  print(s)

  for j=0,n do
    s1 = string.format("%-8s%-20s%-20s%-20s%-25s%-25s%-25s","|" .. j,"|" .. a,"|" .. b,"|" .. ((a+b)/2),"|" .. PoliEva(a,n,x),"|f(pn)","|error")
    print(s1)
  end
  os.execute("pause")
end

-- ******************************** EXPONENCIAL ********************************
function Expo(a,b,c,k,x)
  return a*math.exp(k*x+c)+b
end

function Exponencial()
  os.execute("cls")
  io.write("Por favor deme el n".. string.char(163) .."mero de la TOL aceptada (solo el valor de k): ")
  local n = io.read("*n")
  local TOL = 5*math.pow(10,-n)
  io.write("Por favor deme el valor de la constante a: ")
  local a = io.read("*n")
  io.write("Por favor deme el valor de la constante k: ")
  local k = io.read("*n")
  io.write("Por favor deme el valor de la constante c: ")
  local c = io.read("*n")
  io.write("Por favor deme el valor de la constante b: ")
  local b = io.read("*n")
  io.write("Por favor deme el intervalo [a,b]: ")
  local an,bn = io.read("*n","*n")

  s = string.format("%-8s%-20s%-20s%-20s%-25s%-25s%-25s","|n","|an","|bn","|pn","|f(an)","|f(pn)","|error")
  print(s)
  local pn = ((an+bn)/2)
  local fa = Expo(a,b,c,k,an)
  local fp = Expo(a,b,c,k,pn)
  s2 = string.format("%-8s%-20s%-20s%-20s%-25s%-25s%-25s","|0","|" .. an,"|" .. bn,"|" .. pn,"|" .. fa,"|" .. fp,"|  ------")
  print(s2)
  if fa*fp > 0 then
      an = pn
  else
      bn = pn
  end
  pn2 = pn

  i = 1
  repeat
    local pn = ((an+bn)/2)
    local fa = Expo(a,b,c,k,an)
    local fp = Expo(a,b,c,k,pn)
    local Error = math.abs((pn-pn2)/pn)
    s2 = string.format("%-8s%-20s%-20s%-20s%-25s%-25s%-25s","|" .. i,"|" .. an,"|" .. bn,"|" .. pn,"|" .. fa,"|" .. fp,"|" .. Error)
    print(s2)
    if fa*fp > 0 then
        an = pn
    else
        bn = pn
    end
    pn2 = pn
    i = i+1
  until Error < TOL
  os.execute("pause")
end

-- ******************************** LOGARITMICA ********************************
function LogEva(a,b,c,k,x,val)
  if val == '1' then
    return a*math.log(k*x+c)+b
  else
    return a*math.log10(k*x+c)+b
  end
end

function Logaritmica()
  os.execute("cls")
  io.write("Por favor deme el n".. string.char(163) .."mero de la TOL aceptada (solo el valor de k): ")
  local n = io.read("*n")
  local TOL = 5*math.pow(10,-n)
  io.write("Por favor deme el valor de la constante a: ")
  local a = io.read("*n")
  io.write("Por favor deme el valor de la constante k: ")
  local k = io.read("*n")
  io.write("Por favor deme el valor de la constante c: ")
  local c = io.read("*n")
  io.write("Por favor deme el valor de la constante b: ")
  local b = io.read("*n")
  io.write("Por favor deme el intervalo [a,b]: ")
  local an,bn = io.read("*n","*n")

  print("Cual funci".. string.char(162) .."n desea utilizar?")
  print("1) Ln")
  print("2) Log")
  repeat
    local val = io.read()
    if val == '1' then
      r = '1'
    else
      r = '2'
    end
  until val >= '1' and val <= '2'

  s = string.format("%-8s%-20s%-20s%-20s%-25s%-25s%-25s","|n","|an","|bn","|pn","|f(an)","|f(pn)","|error")
  print(s)
  local pn = ((an+bn)/2)
  local fa = LogEva(a,b,c,k,an,r)
  local fp = LogEva(a,b,c,k,pn,r)
  s2 = string.format("%-8s%-20s%-20s%-20s%-25s%-25s%-25s","|0","|" .. an,"|" .. bn,"|" .. pn,"|" .. fa,"|" .. fp,"|  ------")
  print(s2)
  if fa*fp > 0 then
      an = pn
  else
      bn = pn
  end
  pn2 = pn

  i = 1
  repeat
    local pn = ((an+bn)/2)
    local fa = LogEva(a,b,c,k,an,r)
    local fp = LogEva(a,b,c,k,pn,r)
    local Error = math.abs((pn-pn2)/pn)
    s2 = string.format("%-8s%-20s%-20s%-20s%-25s%-25s%-25s","|" .. i,"|" .. an,"|" .. bn,"|" .. pn,"|" .. fa,"|" .. fp,"|" .. Error)
    print(s2)
    if fa*fp > 0 then
        an = pn
    else
        bn = pn
    end
    pn2 = pn
    i = i+1
  until Error < TOL
  os.execute("pause")
end

-- ******************************** TRIGONOMETRICA ********************************
function Trig (a,b,c,k,x,val)
  if val == '1' then
    return a*math.sin(k*x+c)+b
  elseif val == '2' then
    return a*math.cos(k*x+c)+b
  elseif val == '3' then
    return a*math.tan(k*x+c)+b
  elseif val == '4' then
    return a*math.asin(k*x+c)+b
  elseif val == '5' then
    return a*math.acos(k*x+c)+b
  elseif val == '6' then
    return a*math.atan(k*x+c)+b
  elseif val == '7' then
    return a*math.sinh(k*x+c)+b
  elseif val == '8' then
    return a*math.cosh(k*x+c)+b
  else
    return a*math.tanh(k*x+c)+b
  end
end

function Trigonometrica()
  os.execute("cls")
  io.write("Por favor deme el n".. string.char(163) .."mero de la TOL aceptada (solo el valor de k): ")
  local n = io.read("*n")
  local TOL = 5*math.pow(10,-n)
  io.write("Por favor deme el valor de la constante a: ")
  local a = io.read("*n")
  io.write("Por favor deme el valor de la constante k: ")
  local k = io.read("*n")
  io.write("Por favor deme el valor de la constante c: ")
  local c = io.read("*n")
  io.write("Por favor deme el valor de la constante b: ")
  local b = io.read("*n")
  io.write("Por favor deme el intervalo [a,b]: ")
  local an,bn = io.read("*n","*n")

  print("Cual funci".. string.char(162) .."n desea utilizar?")
  print("1) Sen")
  print("2) Cos")
  print("3) Tan")
  print("4) ArcSen")
  print("5) ArcCos")
  print("6) ArcTan")
  print("7) Senh")
  print("8) Cosh")
  print("9) Tanh")
  repeat
    local val = io.read()
    if val == '1' then
      r = '1'
    elseif val == '2' then
      r = '2'
    elseif val == '3' then
      r = '3'
    elseif val == '4' then
      r = '4'
    elseif val == '5' then
      r = '5'
    elseif val == '6' then
      r = '6'
    elseif val == '7' then
      r = '7'
    elseif val == '8' then
      r = '8'
    else
      r = '9'
    end
  until val >= '1' and val <= '9'

  s = string.format("%-8s%-20s%-20s%-20s%-25s%-25s%-25s","|n","|an","|bn","|pn","|f(an)","|f(pn)","|error")
  print(s)
  local pn = ((an+bn)/2)
  local fa = Trig(a,b,c,k,an,r)
  local fp = Trig(a,b,c,k,pn,r)
  s2 = string.format("%-8s%-20s%-20s%-20s%-25s%-25s%-25s","|0","|" .. an,"|" .. bn,"|" .. pn,"|" .. fa,"|" .. fp,"|  ------")
  print(s2)
  if fa*fp > 0 then
      an = pn
  else
      bn = pn
  end
  pn2 = pn

  i = 1
  repeat
    local pn = ((an+bn)/2)
    local fa = Trig(a,b,c,k,an,r)
    local fp = Trig(a,b,c,k,pn,r)
    local Error = math.abs((pn-pn2)/pn)
    s2 = string.format("%-8s%-20s%-20s%-20s%-25s%-25s%-25s","|" .. i,"|" .. an,"|" .. bn,"|" .. pn,"|" .. fa,"|" .. fp,"|" .. Error)
    print(s2)
    if fa*fp > 0 then
        an = pn
    else
        bn = pn
    end
    pn2 = pn
    i = i+1
  until Error < TOL
  os.execute("pause")
end

-- ************************************ MAIN **************************************
repeat
  os.execute("cls")
  print(string.char(144) .."ste programa encontrara aproximaciones a la ra".. string.char(161) .."z utilizando el m".. string.char(130) .."todo de bisecci".. string.char(162) .."n ")
  print("Eliga una de las opciones de como hallar la aproximaci".. string.char(162) .."n")
  print()
  print("1) Polinomial:  f(x) = a0 + a1 x +  a2 x2 + ... + an xn")
  print("2) Exponencial: f(x) = a e^(k x + c) + b")
  print("3) Logaritmica: f(x) =  a ".. string.char(225) .."(k x + c) + b    ".. string.char(225) .." = log10, ln")
  print("4) Trigonom".. string.char(130) .."trica: f(x) = a ".. string.char(225) .."(k x + c) + b  ".. string.char(225) .." = sen, cos, etc")
  print("5) Combinacion de las anteriores")
  print("6) Salir")
  repeat
    resp = io.read()
  until resp >= '1' and resp <= '6'
  if resp == '1' then
    Polinomial()
  elseif resp == '2' then
    Exponencial()
  elseif resp == '3' then
    Logaritmica()
  elseif resp == '4' then
    Trigonometrica()
  elseif resp == '5' then
    Combinacion()
  end
until resp == '6'

os.execute("cls")
