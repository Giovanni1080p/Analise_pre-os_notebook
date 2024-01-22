-- Databricks notebook source
-- MAGIC %md
-- MAGIC 1-Qual a media de preço entre as marcas?

-- COMMAND ----------

select 
case 
  when marca= 'lenovo' then 'Lenovo' 
  else marca 
end as marca_ajustada,
avg(preco_atual_euro) as media_preco
from vw_notebooks_vendidos
group by 1
order by 2 desc

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 2-Distribuição de vendas com base na capacidade de memória RAM

-- COMMAND ----------

select 
case 
  when tipo_RAM= 'LPDDR3' then 'DDR3' 
   when tipo_RAM in ('LPDDR4','LPDDR4X' ) then 'DDR4' 
   else tipo_RAM
end as ram_atualizada,
sum(preco_atual_euro) as soma_preco
from vw_notebooks_vendidos
group by 1
order by 2 desc

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 3-Distribuição de vendas com base na marca do processador

-- COMMAND ----------

select 
marca_processador,
sum(preco_atual_euro) as soma_preco
from vw_notebooks_vendidos
group by 1
order by 2 desc

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 4-Distribuição de vendas com base no modelo do processador

-- COMMAND ----------

select 
nome_processador,
marca_processador,
sum(preco_atual_euro) as soma_preco
from vw_notebooks_vendidos
group by 1, 2
order by 3 desc

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 5-Quantidade vendida por marca

-- COMMAND ----------

select 
case 
  when marca= 'lenovo' then 'Lenovo' 
  else marca 
end as marca_ajustada,
count(preco_atual_euro) as qdt_vendas
from vw_notebooks_vendidos
group by 1
order by 2 desc

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 6-Quais marcas de notebooks registraram as maiores vendas?

-- COMMAND ----------

select 
case 
  when marca= 'lenovo' then 'Lenovo' 
  else marca 
end as marca_ajustada,
sum(preco_atual_euro) as soma_preco
from vw_notebooks_vendidos
group by 1
order by 2

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 7- Quais transações apresentaram os descontos mais significativos?

-- COMMAND ----------

select marca,modelo, preco_atual_euro,preco_anterior_euro,porcentagem_desconto
from vw_notebooks_vendidos
where porcentagem_desconto > '0.45'
order by porcentagem_desconto desc
