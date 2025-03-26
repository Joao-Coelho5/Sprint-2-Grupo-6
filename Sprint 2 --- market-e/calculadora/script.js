// Início do script, onde a parte lógica da página do simulador financeiro irá iniciar após o botão ser acionado

// Aqui é onde a função "Simular()"se encontra com cinco variáveis que recebem os valores digitados nos inputs do HTML
// O nome das variáveis descrevem bem quais dados são
function Simular() {
    var horarioInicial = Number(ipt_horarioinicial.value);
    var horarioFinal = Number(ipt_horariofinal.value);
    var horarioTotal = (horarioFinal - horarioInicial);
    var qtdSetores = Number(ipt_qtd_setor.value);
    var valorTotalMercado = Number(ipt_valor_total_mercado.value);

    var setor = ipt_setor.value;
    var valorSetor = Number(ipt_valor_setor.value);
    var valorMedio = Number((valorSetor / horarioTotal).toFixed(2));

    var porcentagemSetor = Number(((valorSetor / valorTotalMercado) * 100).toFixed(2));
    var mediaLucro = Number((((valorTotalMercado / qtdSetores) / valorTotalMercado) * 100).toFixed(2));


    // resposta da função de quando o botão é clicado após ter toda a lógica de conta aplicada

    if (horarioInicial >= 0 && horarioInicial <= 23 && horarioFinal >= 0 && horarioFinal <= 23) {
        if (qtdSetores > 0 && valorSetor >= 0 && valorTotalMercado >= 0) {
            div_resposta_media.innerHTML = `<p>Em ${horarioTotal} horas, o setor de ${setor} vendeu R$${valorSetor}.</p>
                <p>Gerando uma média de R$${valorMedio} por hora.</p>`;
                div_resposta_media.style.display = 'block'; // Deixei a div resposta média e porcentagem 'display: none' no CSS para não aparecerem, aqui no script, com base na lógica ao clicar o botão, através do '.style' consigo acessaar as propriedades do CSS, no caso, alterando o display para block. (mudando a visualização de none para block, ela volta a aparecer na tela).
                div_resposta_porcentagem.style.display = 'block';


            if (porcentagemSetor == mediaLucro) {
                div_resposta_porcentagem.innerHTML = `<p>O lucro do setor ${setor} correspode a ${porcentagemSetor}% do lucro total, sendo ${Number((porcentagemSetor - mediaLucro).toFixed(2))}%, batendo a média esperada.</p>
                    <p>Média esperada: ${mediaLucro}%</p>`;

            } else if (porcentagemSetor < mediaLucro) {
                    div_resposta_porcentagem.innerHTML = `<p>O lucro do setor ${setor} correspode a ${porcentagemSetor}% do lucro total, sendo ${Number((mediaLucro - porcentagemSetor).toFixed(2))}% menor que a média esperada.</p>
                    <p>Média esperada: ${mediaLucro}%</p>`;
            }else {
                div_resposta_porcentagem.innerHTML = `<p>O lucro do setor ${setor} correspode a ${porcentagemSetor}% do lucro total, sendo ${Number((porcentagemSetor - mediaLucro).toFixed(2))}% maior que a média esperada.</p>
                    <p>Média esperada: ${mediaLucro}%</p>`;

            }
        } else {
            div_resposta_porcentagem.innerHTML = `<p>Para obter a comparação em porcentagem, você precisa digitar valores que façam sentido.</p>`;
            div_resposta_porcentagem.style.display = 'block';
        }
    } else {
        div_resposta_media.innerHTML = `<p>Para obter o valor da média, você precisa especificar horários corretos.</p>`;
        div_resposta_media.style.display = 'block';
    }
}