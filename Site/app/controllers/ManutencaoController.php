<?php
    namespace app\controllers;
    use app\core\Controller;
    use app\models\Cliente;
    use app\models\Peca;
    use app\models\Veiculo;
    use app\models\Manutencao;
    use app\models\ItensManutencao;
    use app\models\PecaManutencao;

    class ManutencaoController extends Controller{
        public function index(){
            $cliente = new Cliente();
            $veiculo = new Veiculo();
            $manutencao = new Manutencao();
            $data['clientes'] = $cliente->lista();
            $data['veiculos'] = $veiculo->lista();
            $data['manutencoes'] = $manutencao->lista();
            $data['view'] = 'manutencao/index';
            $this->load('template',$data);
        }
        public function new(){
            $cliente = new Cliente();
            $peca = new Peca();
            $data['clientes'] = $cliente->lista();
            $data['pecas'] = $peca->lista();
            $data['view'] = 'manutencao/insert';
            $data['title'] = 'Novo';
            $data['btn'] = 'Salvar';
            $this->load('template',$data);
        }
        public function edita($id){
            $cliente = new Cliente();
            $veiculo = new Veiculo();
            $peca = new Peca();
            $itensManutencao = new ItensManutencao();
            $pecaManutencao = new PecaManutencao();
            $manutencao = new Manutencao();
            $info = $data['manutencao'] = $manutencao->lista_selecionado($id);
            $cliente_id = $info['cliente_id'];
            $veiculo_id = $info['veiculo_id'];
            $data['cliente'] = $cliente->lista_selecionado($cliente_id);
            $data['clientes'] = $cliente->lista();
            $data['veiculo'] = $veiculo->lista_selecionado($veiculo_id);
            $data['pecas'] = $peca->lista();
            $data['pecaManutencao'] = $pecaManutencao->lista_where('id_manutencao',$id,'array');
            $data['itensManutencao'] = $itensManutencao->lista_where('id_manutencao',$id,'array');
            $data['view'] = 'manutencao/edit';
            $this->load('template',$data);
        }    
        public function salvar(){
            $peca = new Peca(); 
            $erros = [];
            $id_cliente = isset($_POST['id_cliente']) && ($_POST['id_cliente']) ? trim(strip_tags(filter_input(INPUT_POST, 'id_cliente'))) : $erros[] = 'Cliente';
            $id_veiculo = isset($_POST['id_veiculo']) && ($_POST['id_veiculo']) ? trim(strip_tags(filter_input(INPUT_POST, 'id_veiculo'))) : $erros[] = 'Veiculo';
            $data_inicio = date('Y/m/d');
            $prazo = isset($_POST['prazo']) && ($_POST['prazo']) ? trim(strip_tags(filter_input(INPUT_POST, 'prazo'))) : $erros[] = 'Prazo';
            $status = 'Iniciado';
            $itens =  isset($_POST['itens']) && ($_POST['itens']) ? $_POST['itens'] : '';
            $valor_item =  isset($_POST['valor_item']) && ($_POST['valor_item']) ? $_POST['valor_item'] : '';
            $pecas =  isset($_POST['peca']) && ($_POST['peca']) ? $_POST['peca'] : '';
            $qtd_peca =  isset($_POST['qtd_peca']) && ($_POST['qtd_peca']) ? $_POST['qtd_peca'] : '';
            foreach($pecas as $idx=>$p){
                $valor = $peca->lista_selecionado($p); 
                $valor_total += floatval($valor['preco']*$qtd_peca[$idx]);
            }
            foreach($valor_item as $vi){
                $valor_total += floatval($vi);
            }
            if($erros){
                $data['view']  = 'manutencao/insert';
                $data['erros'] = $erros;
                $this->load('template',$data);
            }
            else{
                $itensManutencao = new ItensManutencao();
                $pecaManutencao = new PecaManutencao();
                $manutencao = new Manutencao();
                $id = $manutencao->inserir($id_cliente,$id_veiculo,$data_inicio,'',$prazo,$valor_total,$status);
                foreach($itens as $idx=>$i){
                    $itensManutencao->inserir($id,$i,$valor_item[$idx]);
                }
                $manutencao->inserir($id_cliente,$id_veiculo,$data_inicio,'',$prazo,);
                foreach($pecas as $idx=>$p){
                    $pecaManutencao->inserir($p,$id,$qtd_peca[$idx]);
                    $qtd_atual = $peca->lista_selecionado($p);
                    $qtd_atual = $qtd_atual['estoque'];
                    $peca->update_estoque($p,($qtd_atual - $qtd_peca[$idx]));
                }
                header('location:'.URL_BASE.'manutencao');
            }
        }
        public function delete($id){
            $itensManutencao = new ItensManutencao();
            $pecaManutencao = new PecaManutencao();
            $manutencao = new Manutencao();
            $manutencao->delete($id);
            $pecaManutencao->delete($id);
            $itensManutencao->delete($id);
            header('location:'.URL_BASE.'manutencao');
        }

   
    }