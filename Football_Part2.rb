f = []
ag =[]
team = []
File.open('football.dat').readlines.each do |linea|
  f << linea[43,2]
  ag << linea[50,2]
  team << linea[7, 13]
 #linea.each_char { |chr|  }
end

def diferencial(f, ag, team)

 ag = ag.map(&:to_i)
 f = f.map(&:to_i)
 arr=[]
 arr1=[]
 dif = Array(1..ag.length)
 a = 0
 iPosicion = 0


 for z in dif
    arr.insert(a, (ag[a] - f[a]))
    a = a + 1
  end


  narr = arr.map(&:to_i)
  array_positivos = []
  array_equipos =[]
  resultado = []
  x = 0

  for z in narr
      if  z > 0
        array_positivos << narr[x]
        array_equipos << team[x]
      else
        array_positivos.delete_at(x)
        array_equipos.delete_at(x)

    end
 x=x+1
 end
 puts 'The name of the team with the smallest difference in ‘for’ and ‘against’ goals is: '
 puts 'TEAM' + '         ' + 'DIFFERENCE'
 posicion = array_positivos.index(array_positivos.map(&:to_i).min)
 puts array_equipos[posicion] + ' ' + array_positivos.map(&:to_i).min.to_s


end

ag.shift
ag.delete('--')

f.shift
f.delete('--')

team.shift
team.delete('-------------')

diferencial(ag, f, team)
