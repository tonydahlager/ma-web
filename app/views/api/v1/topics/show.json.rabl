object @topic
attributes :id_to_s, :title, :description

child :barriers do
  extends "/api/v1/topics/barriers"
end
