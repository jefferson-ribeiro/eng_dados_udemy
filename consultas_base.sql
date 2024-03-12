--Quantiade de vendedores por cidade
SELECT count(*) as qtd_vendedores, cid.cidade FROM vendedores v
JOIN concessionarias c ON c.id_concessionarias = v.id_concessionarias
JOIN cidades cid ON cid.id_cidades = c.id_cidades
GROUP BY cid.cidade
ORDER BY 1 desc