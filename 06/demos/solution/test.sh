#!/bin/bash

RANDOM=$$$(date +%s)
readarray -t items < ./todos.txt
uids=()

get_index () {
    for i in "${!uids[@]}"; do
        if [[ "${uids[$i]}" = "${1}" ]]; then
            echo "${i}";
        fi
    done
}


add_item () {
    id=$(curl -s --header "Content-Type: application/json" \
        --request POST \
        --data '{"name":"'"$1"'"}' \
        http://localhost:3000/items | jq -r '.id')
    uids+=("$id")
}


delete_item () {
    random_uid=${uids[$RANDOM % ${#uids[@]}]} > /dev/null
    curl -s -X DELETE -H "Content-Type: application/json" \
        http://localhost:3000/items/"${random_uid}" > /dev/null
    pos="$(get_index "$random_uid")"
    uids=("${uids[@]:0:$pos}" "${uids[@]:$((pos + 1))}")
    items=("${items[@]:0:$pos}" "${items[@]:$((pos + 1))}")
}


update_item () {
    random_uid=${uids[$RANDOM % ${#uids[@]}]} > /dev/null
    pos="$(get_index "$random_uid")"
    curl -s -X PUT -H "Content-Type: application/json" \
        -d'{"name":"'"${items[pos]}"'","completed":true}' \
        http://localhost:3000/items/"${random_uid}"
}


for i in "${items[@]}"; do
    delay="$(((RANDOM % 60)+1))"
    sleep "$delay"s
    add_item "$i"
    [[ $((delay % 7)) == 0 ]] && sleep "$(((RANDOM % 60)+1))"s && delete_item
    [[ $((delay % 6)) == 0 ]] && sleep "$(((RANDOM % 60)+1))"s && update_item
done
