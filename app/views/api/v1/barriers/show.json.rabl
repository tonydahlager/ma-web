object @barrier
attributes :title
node(:id){ |b| b.id.to_s }

child :contexts, root: 'context' do 
  extends "/api/v1/barriers/contexts"
end
