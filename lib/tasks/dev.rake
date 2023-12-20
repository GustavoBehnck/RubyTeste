namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?

      show_spinner('Droppando Base', 'Droppado com sucesso') do
        %x(rails db:drop)
      end
      show_spinner('Criando Base', 'Criado com sucesso'){%x(rails db:create)}
      show_spinner('Migrando', 'Migração sucedida'){%x(rails db:migrate)}
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)

    else
      puts "Vc não está em desenvolvimento"
    end
  end

  desc "Cadastrar moedas"
  task add_coins: :environment do
    if Rails.env.development?
      show_spinner('Criando moedas','Moedas criadas') do
        coins_to_create = [
          {
              description: "Bitcoin",
              acronym: "BTC",
              url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/1200px-Bitcoin.svg.png",
              mining_type: MiningType.find_by(acronym: 'PoW')
          },
          {
              description: "Ethereum",
              acronym: "ETH",
              url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Ethereum-icon-purple.svg/512px-Ethereum-icon-purple.svg.png?20200227011040",
              mining_type: MiningType.all.sample
          },
          {
              description: "Dash",
              acronym: "DASH",
              url_image: "https://cdn2.iconfinder.com/data/icons/bitcoin-73/128/dash-512.png",
              mining_type: MiningType.all.sample
          },
          {
              description: "Iota",
              acronym: "IOT",
              url_image: "https://cdn-icons-png.flaticon.com/512/7829/7829646.png",
              mining_type: MiningType.all.sample
          },
          {
              description: "ZCash",
              acronym: "ZEC",
              url_image: "https://cdn-icons-png.flaticon.com/512/1418/1418194.png",
              mining_type: MiningType.all.sample
          }
        ]
        coins_to_create.each do |coin|
          Coin.find_or_create_by!(coin)
        end
      end
    else
      puts "Vc não está em desenvolvimento"
    end
  end

  desc "Cadastrar dos Tipos de Mineração"
  task add_mining_types: :environment do
    if Rails.env.development?
      show_spinner('Criando Tipes de mineração','Tipes de mineração criadas') do
        mine_types = [
          {
            description: "Proof of Work",
            acronym: "PoW"
          },
          {
            description: "Proof of Stake",
            acronym: "PoS"
          },
          {
            description: "Proof of Capacity",
            acronym: "PoC"
          }
        ]
        mine_types.each do |mt|
          MiningType.find_or_create_by!(mt)
        end
      end
    else
      puts "Vc não está em desenvolvimento"
    end
  end

  private
  def show_spinner(msg_start, msg_end)
    spinner = TTY::Spinner.new(":spinner #{msg_start} :spinner", format: :classic)
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end
