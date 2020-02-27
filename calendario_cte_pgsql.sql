/**
    Gera dias do calendário a partir da data atual.
    Escolha a quantidade de dias na cláusula WHERE.
    Este calendário é importante para colocar valores de datas vazios em tabelas que não possuem todos os dias.
    Ex.: Dias que não possuem vendas.
**/
;WITH recursive calendario_cte(dia, data)
AS
(
    VALUES (1,now()::date)
    union all 
    select 
        dia +1  as dia, 
        now()::date-dia as data 
    from calendario_cte
    where 
        dia < 30
)
select * from calendario_cte

