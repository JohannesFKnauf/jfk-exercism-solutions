<?php

function language_list(...$items)
{
    return $items;
}

function add_to_language_list($language_list, $item)
{
    $language_list[] = $item;
    return $language_list;
}

function prune_language_list($language_list)
{
    array_shift($language_list);
    return $language_list;
}

function current_language($language_list)
{
    return $language_list[0];
}

function language_list_length($language_list)
{
    return count($language_list);
}
