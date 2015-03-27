javacomplete
============

Java omni-completion for Vim 7.x

Starting point of the project is: 
* https://github.com/VictorDenisov/javacomplete, by Victor Denisov, which in turn is started by 
* http://www.vim.org/scripts/script.php?script_id=1785, created by Mr. Fang Cheng. 

I do not take credit for any of the work, I have contacted the authors about these modifications.

Modifications

javacomplete.vim is a vim plugin that uses
* a java parser written in plain vim for completion in source code files. 
* a java reflection class written in java for completion from jars / .class files

I have made the following changes:

* added javacomplete#GoToDefinition; should open the definition of any varible inside the file, or outside
* changed the Reflection.java mechanism with a new tool, that
** introspects and saves caches with parsed source / introspection data for both source and binary classes

* the vim script parser is kept for the current file. 

Dependencies
============

* Sun JDK
* [nailgun](http://martiansoftware.com/nailgun/) client installed

Usage
=====

In ftplugin/java.vim -
Add the following to enable javacomplete:

    setlocal omnifunc=javacomplete#Complete

You will also need this:

```
let g:nailgun_port='2113'
```

You may need this, in case your nailgun client isn't `ng`:

```
let g:javacomplete_ng='ng-nailgun'
```

GoToDefinition example keybind:

    <leader>b :call javacomplete#GoToDefinition()<CR>

Create a vim script file containing the list of classes, jars and source paths in your project: 

    call javacomplete#AddClassPath('/home/user/.m2/repository/asm/asm/3.1/asm-3.1.jar')
    call javacomplete#AddClassPath('/path/to/class/files')
    call javacomplete#AddSourcePath('/path/to/source')
    ...

Source the file, edit something in your project. C-x C-o gets you omni completion, <leader>b goes to definition
