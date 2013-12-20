object @barrier
attributes :id_to_s, :title, :description

child :contexts do 
  extends "/api/v1/barriers/contexts"
end
