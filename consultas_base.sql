--Quantiade de vendedores por cidade
SELECT count(*) as qtd_vendedores, cid.cidade FROM vendedores v
JOIN concessionarias c ON c.id_concessionarias = v.id_concessionarias
JOIN cidades cid ON cid.id_cidades = c.id_cidades
GROUP BY cid.cidade
ORDER BY 1 DESC

--Atividade 1: Seleção Simples
--DESCrição: Liste todos os veículos com tipo 'SUV Compacta' e valor inferior a 30.000,00.

SELECT nome, tipo, valor  
FROM veiculos
WHERE tipo = 'SUV Compacta' AND
valor < 30000

--Atividade 2: Junção Simples
--DESCrição: Exiba o nome dos clientes e o nome das concessionárias onde realizaram suas compras.

SELECT cli.cliente, con.concessionaria 
FROM vendas v
JOIN concessionarias con ON con.id_concessionarias = v.id_concessionarias
JOIN clientes cli ON cli.id_clientes = v.id_clientes

--Atividade 3: Contagem e Agrupamento
--DESCrição: Conte quantos vendedores existem em cada concessionária.

SELECT c.concessionaria, COUNT(nome) quantidade_vendedor
FROM vendedores v
JOIN concessionarias c ON c.id_concessionarias = v.id_concessionarias
GROUP BY c.id_concessionarias

--Atividade 4: Subconsulta
--DESCrição: Encontre os veículos mais caros vendidos em cada tipo de veículo.

SELECT tipo, MAX(valor) 
FROM veiculos
GROUP BY tipo

--Atividade 5: Junção Múltipla
--DESCrição: Liste o nome do cliente, o veículo comprado e o valor pago, para todas as vendas.

SELECT c.cliente, veic.nome, valor_pago
FROM vendas v
JOIN clientes c ON c.id_clientes = v.id_clientes
JOIN veiculos veic ON veic.id_veiculos = v.id_veiculos

--Atividade 6: Filtro com Agregação
--DESCrição: Identifique as concessionárias que venderam mais de 5 veículos.

SELECT v.id_concessionarias,  c.concessionaria, COUNT(*) Qtd_vendas
FROM vendas v
JOIN concessionarias c ON c.id_concessionarias = v.id_concessionarias
GROUP BY v.id_concessionarias, c.concessionaria
HAVING COUNT(*) > 5
ORDER BY v.id_concessionarias ASC

--Atividade 7: Consulta com ORDER BY e LIMIT
--Descrição: Liste os três veículos mais caros disponíveis.

SELECT nome, valor 
FROM veiculos
ORDER BY valor DESC
LIMIT 3

--Atividade 8: Consulta com Datas
--DESCrição: Selecione todos os veículos adicionados no último mês.

SELECT nome, data_inclusao
FROM veiculos
WHERE data_inclusao > CURRENT_TIMESTAMP - INTERVAL '1 month';

--Atividade 9: Junção Externa
--DESCrição: Liste todas as cidades e qualquer concessionária nelas, se houver.

SELECT cid.cidade , con.concessionaria
FROM cidades cid
LEFT JOIN concessionarias con ON cid.id_cidades = con.id_cidades

--Atividade 10: Consulta com Várias Condições
--DESCrição: Encontre clientes que compraram veículos 'SUV Premium Híbrida' ou veículos com valor acima de 60.000,00.

SELECT cli.cliente, veic.nome, veic.tipo, ven.valor_pago 
FROM vendas ven
JOIN veiculos veic ON veic.id_veiculos = ven.id_veiculos
JOIN clientes cli ON cli.id_clientes = ven.id_clientes
WHERE veic.tipo = 'SUV Premium Híbrida' OR
ven.valor_pago >= 600000