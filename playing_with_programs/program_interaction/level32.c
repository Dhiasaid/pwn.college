#include <unistd.h>
#include <sys/wait.h>

int pwncollege()
{
        int i = fork();

        if (i == 0)
        {
                char* envp[2] = {"ujfafn=iabztmmpxi", NULL};
                execle("/challenge/run", "run", NULL, envp);
        }
        else
        {
                waitpid(i, NULL, 0);
        }
}

int main()
{
        pwncollege();
}
