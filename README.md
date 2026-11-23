# Fast Location

Aplicativo Flutter para consultar endereços a partir de um CEP brasileiro.
As consultas são realizadas na API ViaCEP e os resultados podem ser armazenados
localmente para serem exibidos no histórico.

## Tecnologias utilizadas

- Flutter e Dart
- MobX para gerenciamento de estado reativo
- Dio para chamadas HTTP
- Hive CE para persistência local
- ViaCEP como fonte dos dados de endereço
- `geocoding` e `map_launcher` para localização e abertura de mapas

## Estrutura de pastas

```text
fast_location/
├── lib/
│   ├── main.dart
│   ├── hive_registrar.g.dart
│   └── src/
│       ├── http/
│       ├── model/
│       ├── pages/
│       ├── repositories/
│       ├── services/
│       ├── shared/
│       └── store/
├── test/
├── android/
├── ios/
├── linux/
├── pubspec.yaml
└── analysis_options.yaml
```

### Responsabilidade de cada pasta

- `lib/main.dart`: inicialização do Flutter, configuração do Hive e definição
  das rotas e widgets principais.
- `lib/src/pages/`: páginas e telas visíveis ao usuário.
- `lib/src/shared/`: recursos compartilhados, como componentes visuais, cores,
  espaçamentos, rotas e configuração de armazenamento.
- `lib/src/model/`: modelos de dados usados pelo aplicativo.
- `lib/src/http/`: configuração das URLs e integrações HTTP externas.
- `lib/src/repositories/`: acesso a APIs e ao armazenamento local.
- `lib/src/services/`: regras de aplicação que coordenam repositórios.
- `lib/src/store/`: estado global da aplicação.
- `test/`: testes unitários e de widgets.
- `android/`, `ios/` e `linux/`: projetos nativos gerados pelo Flutter.

## Arquitetura em camadas

O projeto segue uma organização em camadas, semelhante a uma arquitetura
em componentes:

```text
Página / Widget
      ↓
Controller
      ↓
Service
      ↓
Repository
      ↓
API ViaCEP ou Hive
```

### 1. Camada de apresentação

As páginas ficam em `lib/src/pages/` e são responsáveis pela interface e pelas
interações do usuário.

#### Splash

`lib/src/pages/splash/`

- `splash_page.dart`: exibe a tela inicial por um breve período.
- `splash_controller.dart`: controla o estado de carregamento da tela.
- `splash_controller.g.dart`: código gerado pelo MobX.

#### Página base

`lib/src/pages/base/base_page.dart`

- Serve como contêiner principal após a tela inicial.
- Contém uma barra de navegação inferior.
- Alterna entre as páginas Home e Histórico.

#### Página inicial

`lib/src/pages/base/screens/home/`

- `home_screen.dart`: monta o formulário e a área de detalhes do endereço.
- `form_component.dart`: recebe o CEP, valida e envia para consulta.
- `home_controller.dart`: valida o CEP e solicita o endereço ao serviço.
- `home_controller.g.dart`: código gerado pelo MobX.

#### Histórico

`lib/src/pages/base/screens/history/`

- `history_screen.dart`: exibe os endereços armazenados localmente.
- `history_controller.dart`: carrega os registros usando o repositório Hive.
- `history_controller.g.dart`: código gerado pelo MobX.

### 2. Camada de componentes compartilhados

Os componentes reutilizáveis ficam em `lib/src/shared/components/`.

- `address_details_component/`: apresenta os dados detalhados de um endereço.
- `address_details_controller.dart`: prepara as coordenadas e a abertura de um
  aplicativo de mapas.
- `result_card_component/`: exibe um campo e seu valor em formato de card.

A pasta `shared/` também contém constantes visuais e configurações comuns:

- `colors.dart`: paleta de cores.
- `metrics.dart`: espaçamentos e dimensões reutilizáveis.
- `routes.dart`: nomes das rotas da aplicação.
- `storage.dart`: nome da caixa utilizada pelo Hive.

### 3. Camada de estado

Os controllers são classes MobX que armazenam os dados observáveis utilizados
pelas páginas.

- `home_controller.dart`: mantém o endereço consultado.
- `history_controller.dart`: mantém a lista do histórico.
- `splash_controller.dart`: controla o estado da tela inicial.
- `error_store.dart`: mantém mensagens de erro exibidas globalmente por meio
  de `SnackBar`.

Os arquivos terminados em `.g.dart` são gerados pelo MobX ou pelo Hive e não
devem ser editados manualmente.

### 4. Camada de serviços

`AddressService`, em `lib/src/services/AddressService.dart`, coordena o cache e
a consulta:

1. Busca o CEP no Hive.
2. Se encontrar, retorna o endereço armazenado.
3. Caso contrário, consulta o ViaCEP pelo repositório HTTP.
4. Se a consulta for bem-sucedida, salva o endereço no Hive.

### 5. Camada de repositórios

- `address_repository.dart`: consulta o ViaCEP usando Dio e transforma a
  resposta da API em `AddressModel`.
- `address_storage_repository.dart`: salva, recupera e lista endereços no Hive.

### 6. Camada de modelos

- `address_model.dart`: representa o CEP, logradouro, bairro e cidade/UF.
- `result_model.dart`: padroniza sucesso, falha, mensagem de erro e dados retornados.
- `address_model.g.dart`: adaptador gerado pelo Hive.

## Fluxo de consulta

1. O usuário informa o CEP na `HomeScreen`.
2. `FormComponent` chama o método `search` do `HomeController`.
3. `HomeController` delega a consulta ao `AddressService`.
4. `AddressService` verifica primeiro o armazenamento local.
5. Quando necessário, `AddressRepository` consulta
   `https://viacep.com.br/ws/{cep}/json/`.
6. A resposta é convertida em `AddressModel`.
7. O endereço é exibido em `AddressDetailsComponent`.
8. Consultas bem-sucedidas são armazenadas no Hive e aparecem no Histórico.

## Fluxo de navegação

```text
SplashPage
    │
    └── /base
            ├── HomeScreen
            └── HistoryScreen
```

As rotas são configuradas em `main.dart` e `lib/src/shared/routes.dart`:

- `/`: página inicial (Splash).
- `/base`: página principal com navegação entre Home e Histórico.

## Configuração e execução

Pré-requisitos:

- Flutter SDK instalado
- Emulador ou dispositivo físico configurado
- Para Android, uma instalação compatível com o Gradle configurado no projeto

Instale as dependências:

```bash
flutter pub get
```

Execute o aplicativo:

```bash
flutter run
```

## Análise e testes

Verifique problemas estáticos:

```bash
flutter analyze
```

Execute os testes:

```bash
flutter test
```

Os testes estão separados em:

- testes de controller e validação de CEP;
- testes de widget da aplicação.
