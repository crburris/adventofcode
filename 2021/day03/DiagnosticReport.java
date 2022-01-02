import java.util.ArrayList;

public class DiagnosticReport {

    private int maxBitWidth = 0;
    private ArrayList<Integer> reportData = new ArrayList<>();

    public void add(int datum) {
        reportData.add(datum);
        maxBitWidth = Integer.max(bitWidth(datum), maxBitWidth);
    }

    // Find number of bits required to represent any datum in report
    private int bitWidth() {
        return maxBitWidth;
    }

    // Find number of bits required to represent the given value
    private int bitWidth(int datum) {
        int highBit = Integer.highestOneBit(datum);
        int width = 0;
        while (highBit > 0) {
            highBit >>= 1;
            width++;
        }
        return width;
    }

    // Count data points with given bit set
    private int countSetBits(int place) {
        final int bitmask = 1 << place;
        int count = 0;
        for (int datum : reportData) {
            if ((datum & bitmask) != 0) {
                count++;
            }
        }
        return count;
    }

    // Find least common bit in place
    public int epsilonBit(int place) {
        if (countSetBits(place) > reportData.size() / 2) {
            // majority have bit set, so minority have bit cleared
            return 0;
        } else {
            // majority have bit cleared, so minority have bit set
            return 1 << place;
        }
    }

    // Find concatenation of least common bits
    public int epsilonRate() {
        int epsilon = 0;
        for (int i = 0; i < maxBitWidth; i++) {
            epsilon |= epsilonBit(i);
        }
        return epsilon;
    }

    // Find most common bit in place
    public int gammaBit(int place) {
        // We just need to flip the least common bit
        return epsilonBit(place) ^ (1 << place);
    }

    // Find concatenation of most common bits
    public int gammaRate() {
        int gamma = 0;
        for (int i = 0; i < maxBitWidth; i++) {
            gamma |= gammaBit(i);
        }
        return gamma;
    }
    
}
