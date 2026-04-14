select nomeCompleto as Nomecliente , produtos.nome as nomeproduto from item_pedido i
join produtos p where p.id = pedido_id
join clientes c where c.cliente_id = i.cliente_id
