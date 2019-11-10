$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'

def directors_totals(nds)
  # The Hash result be full of things like "Jean-Pierre Jeunet" => "222312123123"
  result = {
  }

  row_index = 0
  while row_index < nds.length do
    director = nds[row_index][:name]
    movies = nds[row_index][:movies] 
    movie_index = 0
    revenue_all = 0

    while movie_index < movies.length do
      revenue_current = movies[movie_index][:worldwide_gross]
      revenue_all += revenue_current
      movie_index += 1
    end
    result[director] = revenue_all

    row_index += 1
  end

  result
end

# {:name=>"Quentin Tarantino",
#   :movies=>
#    [{:title=>"Django Unchained",
#      :studio=>"Weinstein",
#      :worldwide_gross=>162805434,
#      :release_year=>2012},
#     {:title=>"Once Upon a Time in Hollywood",
#      :studio=>"Sony",
#      :worldwide_gross=>135156125,
#      :release_year=>2019},
#     {:title=>"Inglourious Basterds",
#      :studio=>"Weinstein",
#      :worldwide_gross=>120540719,
#      :release_year=>2009},
#     {:title=>"Pulp Fiction",
#      :studio=>"Miramax",
#      :worldwide_gross=>107928762,
#      :release_year=>1994},
#     {:title=>"Kill Bill Vol. 1",
#      :studio=>"Miramax",
#      :worldwide_gross=>70099045,
#      :release_year=>2003},
#     {:title=>"Kill Bill Vol. 1",
#      :studio=>"Miramax",
#      :worldwide_gross=>66208183,
#      :release_year=>2004}]},
