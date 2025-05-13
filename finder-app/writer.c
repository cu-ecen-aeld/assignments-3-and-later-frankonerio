#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    // Start syslog with LOG_USER facility
    openlog("writer", LOG_PID, LOG_USER);

    // Validate number of arguments
    if (argc != 3) {
        syslog(LOG_ERR, "Invalid arguments. Usage: %s <file> <string>", argv[0]);
        closelog();
        return 1;
    }

    const char *writefile = argv[1];
    const char *writestr = argv[2];

    // Open file for writing
    FILE *fp = fopen(writefile, "w");
    if (!fp) {
        syslog(LOG_ERR, "Failed to open file: %s", writefile);
        closelog();
        return 1;
    }

    // Write string to file
    if (fprintf(fp, "%s", writestr) < 0) {
        syslog(LOG_ERR, "Failed to write to file: %s", writefile);
        fclose(fp);
        closelog();
        return 1;
    }

    fclose(fp);

    // Log success
    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);
    closelog();
    return 0;
}
