Feature: Agendamento com placas repetidas no portal do fornecedor

  Como usuário do portal do fornecedor
  Quero que o sistema trate corretamente placas duplicadas
  Para que os agendamentos mantenham consistência e não gerem conflitos

  Scenario: Cadastro de agendamento com placa repetida
    Given que já existe um agendamento com a placa "ABC1234"
    When eu realizo um novo agendamento com a mesma placa "ABC1234"
    Then o sistema deve registrar o novo agendamento com a placa "ABC1234_1"

  Scenario: Finalização de agendamento com placa repetida
    Given que existe um agendamento ativo com a placa "BCD1234_1"
    And que já existe a placa "BCD1234" cadastrada
    When o agendamento com a placa "BCD1234_1" for finalizado
    Then o sistema deve exibir a placa "BCD1234" como ativa
    And um próximo agendamento duplicado deverá ser registrado como "BCD1234_1"
