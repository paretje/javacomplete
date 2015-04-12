if exists('g:loaded_javacompleteplugin')
  finish
endif

function! s:initialize()
  command! -bang -narg=0 JavaCompleteReindexAll call javacomplete#ReindexAllSources()
  command! -bang -narg=0 JavaCompleteReindexFile call javacomplete#ReindexFile()
  command! -bang -narg=0 JavaCompleteGoToDefinition call javacomplete#GoToDefinition()
  command! -bang -narg=0 JavaCompleteRestartWithFolder call javacomplete#RestartWithFolder()
  command! -bang -narg=0 JavaCompleteRestart call javacomplete#Restart()
  command! -bang -narg=0 JavaCompleteReinitialize call javacomplete#Reinitialize()
  command! -bang -narg=0 JavaCompleteAddImport call javacomplete#AddImport()
  command! -bang -narg=0 JavaCompleteReplaceWithImport call javacomplete#ReplaceWithImport()
  command! -range -bang -narg=0 JavaCompleteSortImports :<line1>,<line2>call javacomplete#SortImports()
  command! -bang -narg=1 -complete=file JavaCompleteAddSourcePath call javacomplete#AddSourcePath(<q-args>) | JavaCompleteReinitialize
  command! -bang -narg=1 -complete=file JavaCompleteAddClassPath call javacomplete#AddClassPath(<q-args>) | JavaCompleteReinitialize
endfunction

call s:initialize()

let g:loaded_javacompleteplugin = 1
