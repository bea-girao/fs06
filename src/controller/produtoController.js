const database = require('../connection/databaseConnection');

async function listar() {
    //let dados = [];

    //simulando que estamos buscando dados em um banco de dados
    //for (let i = 1; i <= 10; i++) {
    //    dados.push({
    //        id: i,
    //        nome: 'Produto '+i,
    //        valor: 100.01*3,
    //        categoria: 'Informática',
    //    });
    //}

    //return dados;
    
    let sql = 'SELECT produto, cliente.nome AS cliente FROM tb_produto INNER JOIN tb_cliente ON produto.cliente_id = cliente.id';

    return await database.executar('SELECT * FROM tb_produto');
}

async function buscarUm(id) {
    let sql = "SELECT * FROM tb_produto WHERE id="+id;

    let resultado = await database.executar(sql);

    return resultado[0];
}

async function cadastrar({nome, preco, quantidade, descricao, categoria}) {
    let sql = `INSERT INTO tb_produto (nome, preco, quantidade, descricao, categoria) 
                VALUES ('${nome}', '${preco}', '${quantidade}', '${descricao}, ${categoria})`;

    await database.executar(sql);

    return {nome, preco, quantidade, descricao, categoria};
}

async function editar({nome, preco, quantidade, descricao, categoria}, id) {
    let sql = `UPDATE tb_produto SET nome='${nome}', preco='${preco}', quantidade='${quantidade}', descricao='${descricao}', categoria='${categoria}' WHERE id=${id}`;

    await database.executar(sql);
}

async function excluir(id) {
    let sql = "DELETE FROM tb_produto WHERE id="+id;

    await database.executar(sql);
}

module.exports = {
    listar, 
    buscarUm,
    cadastrar,
    editar,
    excluir
};