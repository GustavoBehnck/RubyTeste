module ApplicationHelper

    # Converte o formato de data americana para formato de data Brasileira
    def data_br(data_us)
        data_us.strftime("%d/%m/%Y")
    end

    # Retorna em qual ambiente o projeto está sendo rodado
    def ambiente_rails
        if Rails.env.development?
            "Desenvolvimento"
        elsif Rails.env.production?
            "Produção"
        else 
            "Testes"
        end
    end
end
