class TarefasPage
    include Capybara::DSL 
    
    def painel
        find('#task-board') 
        # retorna o elemento
    end

    def buscar_tr(nome)
        find('#tasks tbody tr', text: nome) 
        # busca o status de acordo com nome da tarefa cadastrada
    end

    def busca_trs
        all('#tasks tbody tr') #all retorna uma coleção de trs
    end

    def alerta
        find('.alert-warn').text #retorna a string
    end

    def cadastrar(nome, data_f)
        find('#insert-button').click # clicando no formulario

        within('#add-task') do #somente no escopo do formulario #add-task
            fill_in 'title', with: nome
            # id com o "name" chamado nome
            # fill_in metodo do cabybara
            # preencha o elemento com o nome...
            fill_in 'dueDate', with: data_f
            click_on 'Cadastrar' #clica em algo que tenha o nome cadastrar 
        end
    end

    def busca(nome)
        find('#search-input').set nome #busca pelo nome a tarefa
        find('#search-button').click #pesquisa
    end

    def solicita_remove(nome)
        tr = buscar_tr(nome)
        tr.find("#delete-button").click #busca pelo botao apagar da tarefa buscada 
    end
    
    def confirma_modal
        # modal.find('button', text: 'Sim').click
        within('.modal-footer') do
            click_button 'Sim'
        end
    end

    # def modal
    #     find('.modal-content')
    # end

    def desisto_modal
        # modal.find('button', text: 'Não, deixa queto.').click 
        within('.modal-footer') do
            click_button 'Não, deixa queto.'
        end        
    end

    def voltar
        click_on 'Voltar' if page.has_css?('#add-task') #esse voltar so funciona na pagina tarefas 
    end

end

  
# click_link para elementos do tipo link
# click_button para clicar em elementos do tipo botão
# click_on para clicar em qualquer coisa (span, div, tavle, tr e etc)

