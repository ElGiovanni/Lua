require "Functions"

-- ******************************** FUNCTIONS *************************************
function leer()
  os.execute("cls")
  io.write("Porfavor deme la ecuacion que quiera usar para la aproximacion: ")
  local s = io.stdin:read()
  s = "x=" .. s
  loadstring(s)()
  print(x)
  os.execute("pause")
end

function Polinomial()

end

function Exponencial()

end

function Logaritmica()

end

function Trigonometrica()

end

function printTable(t, length)
    for _,row in pairs(t) do
        local format = ""
        for i=1,#row do format = format .. "%" .. length .. "d" end
        print(string.format(format, table.unpack(row)))
    end
end


-- ************************************ MAIN **************************************
repeat
  os.execute("cls")
  print("Este programa encontrara aproximaciones a la raiz utilizando el metodo de biseccion ")
  print("Eliga una de las opciones de como hallar la aproximacion")
  print()
  print("1) Polinomial:  f(x) = a0 + a1 x +  a2 x2 + ... + an xn")
  print("2) Exponencial: f(x) = a e^(k x + c) + b")
  print("3) Logaritmica: f(x) =  a Ω(k x + c) + b    Ω = log10, ln")
  print("4) Trigonometrica: f(x) = a Ω(k x + c) + b  Ω = sen, cos, etc")
  print("5) Combinacion de las anteriores")
  print("6) Salir")
  repeat
    resp = io.read()
  until resp >= '1' or resp <= '6'
  if resp == '1' then
    Polinomial()
  elseif resp == '2' then
    Exponencial()
  elseif resp == '3' then
    Logaritmica()
  elseif resp == '4' then
    Trigonometrica()
  elseif resp == '5' then
    leer()
  end
until resp == '6'

os.execute("cls")
