--Quantiade de vendedores por cidade
SELECT count(*) as qtd_vendedores, cid.cidade FROM vendedores v
JOIN concessionarias c ON c.id_concessionarias = v.id_concessionarias
JOIN cidades cid ON cid.id_cidades = c.id_cidades
GROUP BY cid.cidade
ORDER BY 1 desc

--Atividade 1: Seleção Simples
--Descrição: Liste todos os veículos com tipo 'SUV Compacta' e valor inferior a 30.000,00.

SELECT nome, tipo, valor  
FROM veiculos
WHERE tipo = 'SUV Compacta' and
valor < 30000

--Atividade 2: Junção Simples
--Descrição: Exiba o nome dos clientes e o nome das concessionárias onde realizaram suas compras.

SELECT cli.cliente, con.concessionaria 
FROM vendas v
JOIN concessionarias con ON con.id_concessionarias = v.id_concessionarias
JOIN clientes cli ON cli.id_clientes = v.id_clientes

--Atividade 3: Contagem e Agrupamento
--Descrição: Conte quantos vendedores existem em cada concessionária.

SELECT c.concessionaria, COUNT(nome) quantidade_vendedor
FROM vendedores v
JOIN concessionarias c ON c.id_concessionarias = v.id_concessionarias
GROUP BY c.id_concessionarias

--Atividade 4: Subconsulta
--Descrição: Encontre os veículos mais caros vendidos em cada tipo de veículo.

--Atividade 5: Junção Múltipla
--Descrição: Liste o nome do cliente, o veículo comprado e o valor pago, para todas as vendas.

--Atividade 6: Filtro com Agregação
--Descrição: Identifique as concessionárias que venderam mais de 5 veículos.

--Atividade 7: Consulta com ORDER BY e LIMIT
--Descrição: Liste os três veículos mais caros disponíveis.

--Atividade 8: Consulta com Datas
--Descrição: Selecione todos os veículos adicionados no último mês.

--Atividade 9: Junção Externa
--Descrição: Liste todas as cidades e qualquer concessionária nelas, se houver.

--Atividade 10: Consulta com Várias Condições
--Descrição: Encontre clientes que compraram veículos 'SUV Premium Híbrida' ou veículos com valor acima de 60.000,00.