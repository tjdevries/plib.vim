# plib.vim

Python 3 standard library functions on vim objects

To view documentation for the functions, see the [Python List Documentation](https://docs.python.org/3/tutorial/datastructures.html#more-on-lists).

## Usage

First install it and make sure it's in the runtimepath. I use vim-plug for that

```vim
call plug#begin()

Plug 'tjdevries/plib.vim'

call plug#end()
```

Then you can use it to do things with objects!

```vim
let List = plib#List()

" This is the example shown in the Python 3 documentation
let fruits = ['orange', 'apple', 'pear', 'banana', 'kiwi', 'apple', 'banana']

echo List.count(fruits, 'apple')
" 2

echo List.count(fruits, 'tangerine')
" 0

echo List.index(fruits, 'banana')
" 3

" Find next banana starting a position 4
echo List.index(fruits, 'banana', 4)
" 6

call List.reverse(fruits)
echo fruits
" ['banana', 'apple', 'kiwi', 'banana', 'pear', 'apple', 'orange']

call List.append(fruits, 'grape')
echo fruits
" ['banana', 'apple', 'kiwi', 'banana', 'pear', 'apple', 'orange', 'grape']

call List.sort(fruits)
echo fruits
" ['apple', 'apple', 'banana', 'banana', 'grape', 'kiwi', 'orange', 'pear']

echo List.pop(fruits)
" 'pear'
```
