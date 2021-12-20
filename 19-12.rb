require 'csv'
t = Time.now
data_file = CSV.parse(open("data.csv").read)
d = data_file.flatten

sc = {}
i = -1
d.each do |line|
  if line[0..2] == "---"
    i += 1
    sc[i] = []
  else
    sc[i] << [line.split('/')[0].to_i, line.split('/')[1].to_i, line.split('/')[2].to_i]
  end
end

def find_match(array_val, plan, k, b_com)
  array_val.each do |key_arr, arr_rel|
    plan.each do |sc_n, b_rel|
      c = 0
      if sc_n != k
        b_rel.each do |bc, rels|
          c = 0
          arr_rel.each do |coord_rel|
            if rels.include?(coord_rel)
              c += 1
              if c == b_com
                puts "#{sc_n} a #{b_com} balises communes ac #{k}"
                # p [bc,key_arr]
                decalage = [bc[0] - key_arr[0],bc[1] - key_arr[1],bc[2] - key_arr[2]]
                return [sc_n, decalage, k]
              end
            end
          end
          if c == b_com
            puts "#{sc_n} a #{b_com} balises communes ac #{k}"
            return [sc_n, k]
          end
        end
      end
    end
  end
  nil
end

done = []
todo = [0]
matching_number = 12
centers = []

todo.each do |number_todo|
  p "DONE: #{done}"
  plan = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    v.each_with_index do |coord, i|
      rel[coord] = []
      v.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan[k] = rel
  end
  plan2 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [-y, x, z]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan2[k] = rel
  end
  plan3 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [-x, -y, z]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan3[k] = rel
  end
  plan4 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [y, -x, z]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan4[k] = rel
  end
  plan5 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [-z, y, x]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan5[k] = rel
  end
  plan6 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [-y, -z, x]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan6[k] = rel
  end
  plan7 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [z, -y, x]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan7[k] = rel
  end
  plan8 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [y, z, x]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan8[k] = rel
  end
  plan9 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [x, -z, y]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan9[k] = rel
  end
  plan10 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [z, x, y]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan10[k] = rel
  end
  plan11 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [-x, z, y]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan11[k] = rel
  end
  plan12 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [-z, -x, y]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan12[k] = rel
  end
  plan13 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [-y, z, -x]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan13[k] = rel
  end
  plan14 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [-z, -y, -x]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan14[k] = rel
  end

  plan15 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [y, -z, -x]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan15[k] = rel
  end
  plan16 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [z, y, -x]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan16[k] = rel
  end
  plan17 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [-x, -z, -y]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan17[k] = rel
  end
  plan18 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [z, -x, -y]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan18[k] = rel
  end
  plan19 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [x, z, -y]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan19[k] = rel
  end
  plan20 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [-z, x, -y]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan20[k] = rel
  end
  plan21 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [x, -y, -z]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan21[k] = rel
  end
  plan22 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [-y, -x, -z]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan22[k] = rel
  end
  plan23 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [-x, y, -z]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan23[k] = rel
  end
  plan24 = {}
  sc.reject{|kkk, vvv| todo.include? kkk}.each do |k,v|
    rel = {}
    u = v.map{|x,y,z| [y, x, -z]}
    u.each_with_index do |coord, i|
      rel[coord] = []
      u.each_with_index do |coordi, j|
        rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]] if j >= i
      end
      rel.reject!{|k,va| va.length < matching_number}
    end
    plan24[k] = rel
  end
  p "PLANFULL CHANGE"
  planfull = {}
  rel = {}
  sc[number_todo].each_with_index do |coord, i|
    rel[coord] = []
    sc[number_todo].each_with_index do |coordi, j|
      rel[coord] << [coord[0]-coordi[0], coord[1]-coordi[1], coord[2]-coordi[2]]
    end
  end
  planfull[number_todo] = rel
  p planfull.keys


  # plan[0] chaque balise de scan0 en clé, hash des pos rel des autres balises
  # coord_rel : position rel des balises par rapport a l'une delle



  matchs = {}

  sc.each do |k,v|
    matchs[k] = []
  end


  trouve = []
  match_trans = {}
  sc.each do |k,v|
    match_trans[k] = []
  end
  plan.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "x,y,z", match[1]] unless match.nil?
  end
  plan2.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "-y,x,z",match[1]] unless match.nil?
  end
  plan3.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "-x,-y,z",match[1]] unless match.nil?
  end
  plan4.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "y,-x,z",match[1]] unless match.nil?
  end
  plan5.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "-z,y,x",match[1]] unless match.nil?
  end
  plan6.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "-y,-z,x",match[1]] unless match.nil?
  end
  plan7.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "z,-y,x",match[1]] unless match.nil?
  end
  plan8.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "y,z,x",match[1]] unless match.nil?
  end
  plan9.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "x,-z,y",match[1]] unless match.nil?
  end
  plan10.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "z,x,y",match[1]] unless match.nil?
  end
  plan11.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "-x,z,y",match[1]] unless match.nil?
  end
  plan12.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "-z,-x,y",match[1]] unless match.nil?
  end
  plan13.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "-y,z,-x",match[1]] unless match.nil?
  end
  plan14.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "-z,-y,-x",match[1]] unless match.nil?
  end
  plan15.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "y,-z,-x",match[1]] unless match.nil?
  end
  plan16.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "z,y,-x",match[1]] unless match.nil?
  end
  plan17.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "-x,-z,-y",match[1]] unless match.nil?
  end
  plan18.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "z,-x,-y",match[1]] unless match.nil?
  end
  plan19.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "x,z,-y",match[1]] unless match.nil?
  end
  plan20.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "-z,x,-y",match[1]] unless match.nil?
  end
  plan21.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "x,-y,-z",match[1]] unless match.nil?
  end
  plan22.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "-y,-x,-z",match[1]] unless match.nil?
  end
  plan23.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "-x,y,-z",match[1]] unless match.nil?
  end
  plan24.reject{|kx, vx| trouve.include? kx}.each do |k,v|
    match = find_match(v, planfull, k, matching_number)
    trouve << match.last << match.first unless match.nil?
    matchs[match.first] << match.last unless match.nil?
    matchs[match.last] << match.first unless match.nil?
    match_trans[match.first] << [k, "y,x,-z",match[1]] unless match.nil?
  end

  match_trans[number_todo].each do |res|
    sc[res[0]].map! do |x,y,z|
      if res[1] == "-x,y,-z"
        centers << [res[2][0], res[2][1], res[2][2]]
        [-x + res[2][0],y + res[2][1],-z + res[2][2]]
      elsif res[1] == "x,y,z"
        centers << [res[2][0], res[2][1], res[2][2]]
        [x + res[2][0],y + res[2][1],z + res[2][2]]
      elsif res[1] == "-y,x,z"
        centers << [res[2][0], res[2][1], res[2][2]]
        [-y + res[2][0],x + res[2][1],z + res[2][2]]
      elsif res[1] == "-x,-y,z"
        centers << [res[2][0], res[2][1], res[2][2]]
        [-x + res[2][0],-y + res[2][1],z + res[2][2]]
      elsif res[1] == "y,-x,z"
        centers << [res[2][0], res[2][1], res[2][2]]
        [y + res[2][0],-x + res[2][1],z + res[2][2]]
      elsif res[1] == "-z,y,x"
        centers << [res[2][0], res[2][1], res[2][2]]
        [-z + res[2][0],y + res[2][1],x + res[2][2]]
      elsif res[1] == "-y,-z,x"
        centers << [res[2][0], res[2][1], res[2][2]]
        [-y + res[2][0],-z + res[2][1],x + res[2][2]]
      elsif res[1] == "z,-y,x"
        centers << [res[2][0], res[2][1], res[2][2]]
        [z + res[2][0],-y + res[2][1],x + res[2][2]]
      elsif res[1] == "y,z,x"
        centers << [res[2][0], res[2][1], res[2][2]]
        [y + res[2][0],z + res[2][1],x + res[2][2]]
      elsif res[1] == "x,-z,y"
        centers << [res[2][0], res[2][1], res[2][2]]
        [x + res[2][0],-z + res[2][1],y + res[2][2]]
      elsif res[1] == "z,x,y"
        centers << [res[2][0], res[2][1], res[2][2]]
        [z + res[2][0],x + res[2][1],y + res[2][2]]
      elsif res[1] == "-x,z,y"
        centers << [res[2][0], res[2][1], res[2][2]]
        [-x + res[2][0],z + res[2][1],y + res[2][2]]
      elsif res[1] == "-z,-x,y"
        centers << [res[2][0], res[2][1], res[2][2]]
        [-z + res[2][0], -x + res[2][1], y + res[2][2]]
      elsif res[1] == "-y,z,-x"
        centers << [res[2][0], res[2][1], res[2][2]]
        [-y + res[2][0],z + res[2][1],-x + res[2][2]]
      elsif res[1] == "-z,-y,-x"
        centers << [res[2][0], res[2][1], res[2][2]]
        [-z + res[2][0],-y + res[2][1],-x + res[2][2]]
      elsif res[1] == "y,-z,-x"
        centers << [res[2][0], res[2][1], res[2][2]]
        [y + res[2][0],-z + res[2][1],-x + res[2][2]]
      elsif res[1] == "z,y,-x"
        centers << [res[2][0], res[2][1], res[2][2]]
        [z + res[2][0],y + res[2][1],-x + res[2][2]]
      elsif res[1] == "-x,-z,-y"
        centers << [res[2][0], res[2][1], res[2][2]]
        [-x + res[2][0],-z + res[2][1],-y + res[2][2]]
      elsif res[1] == "z,-x,-y"
        centers << [res[2][0], res[2][1], res[2][2]]
        [z + res[2][0],-x + res[2][1],-y + res[2][2]]
      elsif res[1] == "x,z,-y"
        centers << [res[2][0], res[2][1], res[2][2]]
        [x + res[2][0],z + res[2][1],-y + res[2][2]]
      elsif res[1] == "-z,x,-y"
        centers << [res[2][0], res[2][1], res[2][2]]
        [-z + res[2][0],x + res[2][1],-y + res[2][2]]
      elsif res[1] == "x,-y,-z"
        centers << [res[2][0], res[2][1], res[2][2]]
        [x + res[2][0],-y + res[2][1],-z + res[2][2]]
      elsif res[1] == "-y,-x,-z"
        centers << [res[2][0], res[2][1], res[2][2]]
        [-y + res[2][0],-x + res[2][1],-z + res[2][2]]
      elsif res[1] == "y,x,-z"
        centers << [res[2][0], res[2][1], res[2][2]]
        [y + res[2][0],x + res[2][1],-z + res[2][2]]
      end
    end
    todo << res[0] unless ((done.include? res[0]) || (todo.include? res[0]))
  end
  done << number_todo
end
p centers.uniq
diffs = []
centers.each do |center|
  centers.each do |centert|
    diffs << (center[0] -centert[0]).abs + (center[1] -centert[1]).abs + (center[2] -centert[2]).abs
  end
end
p sc.values.flatten(1).uniq.length
p diffs.max
puts "Elapsed time: #{Time.now - t}s"
