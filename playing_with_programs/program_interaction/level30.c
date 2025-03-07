#include <unistd.h>
#include <sys/wait.h>

int pwncollege()
{
        int i = fork();

        if (i == 0)
        {
                execve("/challenge/run", NULL, NULL);
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
