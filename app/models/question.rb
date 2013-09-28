class Question
  include Mongoid::Document
  field :content, type: String
  field :contexts, type: Array
  
  embedded_in :topic
  
  embeds_many :responses
  embeds_many :directions
  embeds_many :transitions
  
  def add_cotnext
    max = self.contexts.max
    next_context = max.nil? ? 1 : max + 1
    push(contexts: next_context)
  end
  
  def delete_context(context_number)
    generic_context = 0
    responses.where(context: context_number).each { |r| set_context_to(r, generic_context) }
    directions.where(context: context_number).each { |d| set_context_to(d, generic_context) }
    transitions.where(context: context_number).each { |t| set_context_to(t, generic_context) }
    delete_context(context_number)
  end
  
  # calling element.save runs validations
  def set_context_to(element, int)
    element.context = int
    element.save
  end
  
  def delete_context(int)
    contexts.delete(int)
  end
end

