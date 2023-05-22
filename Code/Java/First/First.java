public class First {
    public static void main(String[] args) {

        for (var i = 0; i < 5; i++) {
            System.out.println("Season: " + CallSwitch(i));
        }
    }

    public static String CallSwitch(int code) {
        return switch (code) {
            case 0 -> "Spring";
            case 1 -> "Summer";
            case 2 -> "Spring";
            case 3 -> "Winter";
            default -> "??";
        };
    }
}