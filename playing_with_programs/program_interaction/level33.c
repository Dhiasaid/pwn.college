#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

void pwncollege() {
    int fd;
    
    // Open the file and write the password into it
    fd = open("/tmp/ukdwqy", O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (fd < 0) {
        perror("open");
        return;
    }
    
    write(fd, "ljxjvcyy\n", 9); // Write password with newline
    close(fd);

    // Open the file for reading
    fd = open("/tmp/ukdwqy", O_RDONLY);
    if (fd < 0) {
        perror("open");
        return;
    }

    if (fork()) {
        wait(NULL);
    } else {
        dup2(fd, 0); // Redirect stdin to the file
        execl("/challenge/run", "run", NULL);
    }
}

int main() {
    pwncollege();
    return 0;
}

