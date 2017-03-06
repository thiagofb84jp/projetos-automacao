Given(/^user acess with Supervisor SIGEC Unidade$/) do
  visit "https://dev.control.eng.br/acessos"
end

When(/^insert valid "([^"]*)" and "([^"]*)"$/) do |arg1, arg2|
  fill_in 'usuario_login', :with => 'poliana.monte'
  fill_in 'usuario_senha', :with => ''
  click_button 'submit_login'
end

Then(/^the user home page is displayed$/) do
  expect(page).to have_content 'poliana.monte'
end

Given(/^I am like a Supervisior SIGEC unidade and add new Tipo de Estrutura$/) do
  visit "https://dev.control.eng.br/tipo_estruturas"
  visit "https://dev.control.eng.br/tipo_estruturas/new"
end

When(/^I fill "([^"]*)", "([^"]*)" and "([^"]*)"$/) do |arg1, arg2, arg3|
  find(:xpath, '//*[@id="click_link_tipo_estrutura_sub_contrato_id"]/img').click
  fill_in 'busca_cmp_tipo_estrutura_sub_contrato_id_descricao', :with => '079'
  find(:xpath, '//*[@id="img_b_tipo_estrutura_sub_contrato_id"]').click
  find(:xpath, '//*[@id="imgSel_10060"]/img').click
  
  #find(:xpath, '//*[@id="main"]/div[1]/div[2]/div/form/div[4]/button').click
  
  fill_in 'tipo_estrutura_nome', :with => 'TIPO DE ESTRUTURA [CONTRATO 079]'
  fill_in 'tipo_estrutura_descricao', :with => 'DESCRICAO_TIPO_ESTRUTURA [CONTRATO 079]'
end

Then(/^I should see sucess page and new Tipo de Estrutura$/) do
  expect(page).to have_content 'Tipo estrutura cadastrado com sucesso.'  
end