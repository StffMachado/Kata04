class Read_file

#attr_accessor :minimat, :maximat, :fors, :against, :team
  def initialize(min, max, fors, aga, team)
    @minimat = Array.new()
    @maximat = Array.new()
    @fors = Array.new()
    @against = Array.new()
    @team = Array.new()
  end

 def Save_arrays_for_columns(min, max, fors, aga, team)

   File.open('weather.dat').readlines.each do |linea|
   @minimat << linea[12,2]
   @maximat << linea[6,2]
   end


   File.open('football.dat').readlines.each do |linea|
   @fors << linea[43,2]
   @against << linea[50,2]
   @team << linea[7, 13]
  end
end

   def Organize_file(min, max, fors, aga, team)

    @minimat.pop
    @minimat.delete_at(0)
    @minimat.shift

    @maximat.pop
    @maximat.delete_at(0)
    @maximat.shift

    @against.shift
    @against.delete('--')

    @fors.shift
    @fors.delete('--')

    @team.shift
    @team.delete('-------------')

    Difference_between_arrays(@minimat, @maximat, @fors, @against, @team)
    end



    def Difference_between_arrays(min, max, fors, aga, team)

      @minimat = min.map(&:to_i)
      @maximat = max.map(&:to_i)
      arr=[]
      dif = Array(1..@maximat.length)
      a = 0

    for z in dif
      arr.insert(a, (@maximat[a] - @minimat[a]))
      #puts dif[a].to_s + ' ---- ' + arr[a].to_s
      a = a + 1
    end
    posicion = arr.index(arr.map(&:to_i).min)

     puts 'The day with the smallest temperature spread is:'
     puts 'DAY' + ' ' + 'DIFFERENCE'
     puts  dif[posicion].to_s + '  ' +  arr.map(&:to_i).min.to_s


     @against = aga.map(&:to_i)
     @fors = fors.map(&:to_i)
     arr=[]
     arr1=[]
     dif = Array(1..@against.length)
     a = 0
     iPosicion = 0


     for z in dif
        arr.insert(a, (@fors[a] - @against[a]))
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
     puts ' '
     puts 'The name of the team with the smallest difference in ‘for’ and ‘against’ goals is: '
     puts 'TEAM' + '         ' + 'DIFFERENCE'
     posicion = array_positivos.index(array_positivos.map(&:to_i).min)
     puts array_equipos[posicion] + ' ' + array_positivos.map(&:to_i).min.to_s


    end

end
archivo = Read_file.new(@minimat, @maximat, @fors, @against, @team)
archivo.Save_arrays_for_columns(@minimat, @maximat, @fors, @against, @team)
archivo.Organize_file(@minimat, @maximat, @fors, @against, @team)
