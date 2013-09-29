class Question
  include Mongoid::Document
  field :content, type: String
  field :contexts, type: Array, default: [0]
  
  embedded_in :topic
  
  embeds_many :responses
  embeds_many :directions
  embeds_many :transitions
  
  def add_context
    array = contexts
    next_context = contexts.last + 1
    array = array.push(next_context)
    update_attribute(contexts: array)
  end
  
  def delete_context(context_number)
    generic_context = 0
    responses.where(context: context_number).each { |r| set_context_to(r, generic_context) }
    directions.where(context: context_number).each { |d| set_context_to(d, generic_context) }
    transitions.where(context: context_number).each { |t| set_context_to(t, generic_context) }
    remove_context_int(context_number)
  end
  
  # calling element.save runs validations
  def set_context_to(element, int)
    element.context = int
    element.save
  end
  
  def remove_context_int(int)    
    index = contexts.index(int)
    contexts.delete_at(index) unless int == 0
    save
  end
end

