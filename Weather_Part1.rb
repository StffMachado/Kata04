minimat = []
maximat =[]
File.open('weather.dat').readlines.each do |linea|
  minimat << linea[12,2]
  maximat << linea[6,2]

end


def diferencial(arreglo1, arreglo2)

  minimat = arreglo1.map(&:to_i)
  maximat = arreglo2.map(&:to_i)
  arr=[]
  dif = Array(1..maximat.length)
  a = 0

for z in dif
  arr.insert(a, (maximat[a] - minimat[a]))
  #puts dif[a].to_s + ' ---- ' + arr[a].to_s
  a = a + 1
end
posicion = arr.index(arr.map(&:to_i).min)
 puts 'The team with the smallest temperature spread is:'
 puts 'DAY' + ' ' + 'DIFERENCCE'
 puts  dif[posicion].to_s + '  ' +  arr.map(&:to_i).min.to_s
#puts maximat.length
end

minimat.pop
minimat.delete_at(0)
minimat.shift

maximat.pop
maximat.delete_at(0)
maximat.shift
diferencial(minimat, maximat)
