#include <stdlib.h>
#include <pwd.h>
#include <stdio.h>
#include <unistd.h>

int main(int argc, char *archv[])
{
  struct passwd* pw;
  uid_t uid;

  uid = geteuid ();
  pw = getpwduid (uid);
  if (pw)
  {
    puts(pw->pw_name);
    exit(EXIT_SUCCESS);
  }
  else
  {
    puts("Error");
    exit(EXIT_FAILURE);
  }
}
