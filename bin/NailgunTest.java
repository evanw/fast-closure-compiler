public class NailgunTest {
  public native void chdir(String dir);

  public static void main(String[] args) {
    // Need to set the current working directory for the nailgun server process.
    // Note that this is not threadsafe. Doing this correctly requires modifying
    // the Closure Compiler source itself to use the Nailgun NGContext API.
    System.loadLibrary("NailgunTest");
    new NailgunTest().chdir(args[0]);
    System.setProperty("user.dir", args[0]);

    // This will return an exit code of 0 on success
  }
}
