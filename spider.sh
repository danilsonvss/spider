#!/bin/bash

# Função de ajuda
function show_help() {
  echo "Uso: $0 [opções] caminho/do/arquivo.php"
  echo
  echo "Este script gera um arquivo de teste PHPUnit para um arquivo PHP especificado."
  echo
  echo "Opções:"
  echo "  -h, --help      Exibe esta ajuda e sai"
  echo
  echo "Exemplo:"
  echo "  $0 caminho/do/seu/arquivo.php"
}

# Verifica se o argumento -h ou --help foi passado
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
  show_help
  exit 0
fi

# Verifica se um argumento foi passado
if [ -z "$1" ]; then
  echo "Erro: É necessário informar o caminho ou o nome do arquivo."
  show_help
  exit 1
fi

# Extrai o nome do arquivo sem a extensão e o caminho
filepath="$1"
filename=$(basename -- "$filepath")
classname="${filename%.*}"

# Define o diretório onde o arquivo de teste será criado
testdir="tests/$(dirname "$filepath")"

# Cria o diretório se não existir
mkdir -p "$testdir"

# Define o caminho completo do arquivo de teste
testfile="${testdir}/${classname}Test.php"

# Cria o arquivo de teste com um template básico de PHPUnit
cat <<EOT > "$testfile"
<?php

use PHPUnit\Framework\TestCase;

class ${classname}Test extends TestCase
{
    protected function setUp(): void
    {
        // Inicialização antes de cada teste
    }

    public function testExample()
    {
        // Exemplo de teste
        \$this->assertTrue(true);
    }
}
EOT

echo "Arquivo de teste criado em: $testfile"
