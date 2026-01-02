# Query cheat.sh for command help
function ch --description "Query cheat.sh for command examples"
    if test (count $argv) -eq 0
        curl -s cheat.sh/:help
    else
        curl -s "cheat.sh/$argv[1]"
    end
end
