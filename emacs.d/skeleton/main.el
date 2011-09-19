(define-skeleton create-main
"Inserts a main function."
""
"#include <stdlib.h>
#include <sys/types.h>

/*
** |---------------------------------------------|
** |   /!\ Don't touch the _malloc_options /!\	 |
** |---------------------------------------------|
*/

int			main(void)
{
#if defined (DEBUG)
  _malloc_options = \"Z\";
#endif

  return (EXIT_SUCCESS);
}
")