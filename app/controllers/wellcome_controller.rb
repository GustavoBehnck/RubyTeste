class WellcomeController < ApplicationController
  def index
    @meu_nome = params[:nome]
    
    @curso = "teste de rails"
  end
end
