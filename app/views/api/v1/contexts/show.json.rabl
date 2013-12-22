object @context
attributes :id_to_s, :title

child :steps do 
  extends "api/v1/steps/index"
end
