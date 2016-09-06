--[[
	Programa: Estabilidad1.lua
	Autor: GLC
	Fecha:	2/09/2016
	Descripcion: Aproximaciones con un procedimiento estable
]]--

-- ***************************** FUNCIONES *******************************
X0, X1 = 1, (1/3)

--Redondeo
function Round(x,n)
    return ("%.".. n .."g"):format(x)  --[[ Convierte un numero punto-flotante a decimal o notacion decimal exponencial dependiendo del valor y la precision,
											donde la precision se define por un . seguido por un numero entero o un asterisco ]]
end
--Calcula la aproximacion
function FunEstable(n)
	local c1, c2 = 1, 1.25*math.pow(10,-6)
	return (c1/math.pow(3,n)+c2*math.pow(3,n))
end
--Calcula el error
function Error(ValV, ValA)
	return (math.abs((ValV-ValA)/ValV))
end

-- ***************************** MAIN *****************************
print"Este programa calculara aproximaciones al valor Xn por un procedimiento estable, con aritmetica de redondeo a k cifras."
io.write("Cual es su nombre? ")
nombre = io.read()
io.write(nombre..", Dame el numero de iteraciones: ")
x = io.read()
io.write"Dame el numero de cifras significativas: "
n = io.read()

s = string.format("%30s%30s%30s%30s%30s","| Xn","| fl(Xn) ","| ErrorV ","| ErrorR","| ErrorRPorcentual")
print("| n " .. s)
s1 = string.format("%29s%25s%30s%41s%20s"," | " .. X0," | " .. Round(X0,n)," | " .. Error(X0,Round(X0,n))," | -----------","| -----------")
print("| 1 " .. s1)
s2 = string.format("%44s%16s%42s%24s%20s"," | " .. X1," | " .. Round(X1,n)," | " .. Error(X1,Round(X1,n))," | " .. Error(Round(X1,n),Round(X0,n))," | " .. Error(Round(X1,n),Round(X0,n))*100)
print("| 2 " .. s2)
B = X1
for i = 2, x do
	local a = FunEstable(i)
	local b = Round(a,n)
	local c = Round(Error(a,b),n)
	local d = Error(a,B)
	local e = d*100
  s3 = string.format("%44s%16s%35s%36s%19s"," | " .. a," | " .. b," | " .. c," | " .. d," | " .. e)
	print("| " .. i .. s3) -- Lo imprime bien feo profe :C
	B = a
end
