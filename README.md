# Avaliação em Flutter

## Descrição da Atividade

Implementar uma avaliação em Flutter para solucionar o problema abaixo:

### Telas

#### Tela Inicial
- Logo tipo (escola)
- Botão para acesso à Tela 1

#### Tela 1 - Login
- Solicitar nome e senha
- Emular no [mockable.io](https://mockable.io) uma resposta ao login
  - Considerar que a resposta sempre dará acesso (nome e senha sempre serão aceitos)
  - O endpoint é denominado `login` e retorna um token
- Mostrar o token recebido antes de ir para a Tela 2

#### Tela 2
- Recuperar as informações do endpoint `notasAlunos`
  - Criar este endpoint no [mockable.io](https://mockable.io)
  - O endpoint deve retornar: Matrícula, Nome do aluno e respectiva nota (de 0 a 100)
- Implementar 3 botões:
  - Alunos nota < 60
  - Alunos nota >= 60 (exceto 100)
  - Alunos nota = 100
- Visualizar as informações em um ListView
  - Alunos com nota < 60 deverão ter background do item no ListView na cor Amarelo
  - Alunos com nota >= 60 deverão ter background do item no ListView na cor Azul
  - Alunos com nota = 100 deverão ter background do item no ListView na cor Verde
  - Nota 100 prevalece em relação às notas >= 60

### Detalhes da Visualização
- Quando todas as informações são carregadas na segunda tela pela primeira vez, devem estar de acordo com o descrito anteriormente.
- Quando visualizadas por meio da seleção do botão, devem seguir a orientação dada, porém individualmente.

## Instruções de Execução
1. Clone este repositório.
2. Instale as dependências do Flutter.
3. Execute o aplicativo no emulador ou dispositivo.
