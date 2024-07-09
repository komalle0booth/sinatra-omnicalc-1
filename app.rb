require "sinatra"
require "sinatra/reloader"

get("/") do
    erb(:new_square_calc)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("number").to_f

  @the_result = @the_num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_root_calc)
end

get("/square_root/results") do
  @the_root = params.fetch("root").to_f

  @root_result = @the_root ** 0.5

  erb(:root_results)
end

get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/results") do
  @the_apr = params.fetch("user_apr")
  
  @the_apr_precentage = (params.fetch("user_apr").to_f)/100

  @the_apr_integer = params.fetch("user_apr").to_i

  @number_of_years = params.fetch("user_years").to_i

  @the_principal = params.fetch("user_principal").to_f

  @numerator = ((@the_apr_precentage/12))*(@the_principal)

  @demominator = (1-(1+(@the_apr_precentage/12))**(-(@number_of_years)*12))

  @payment = (@numerator)/(@demominator)

  erb(:payment_results)
end


get("/random/new") do
  erb(:new_random_calc)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f

  @max = params.fetch("user_max").to_f

  @random_number = rand(@min..@max).to_f

  erb(:random_results)
end
