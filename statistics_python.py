from collections import Counter

class StatisticsCalculator:
    def __init__(self, data):
        """
        Initializes the StatisticsCalculator with a list of integers.
        """
        self.data = data
    
    def calculate_mean(self):
        """
        Calculates the mean (average) of the list of integers.
        """
        if len(self.data) == 0:
            raise ValueError("Cannot calculate mean of an empty list")
        return sum(self.data) / len(self.data)
    
    def calculate_median(self):
        """
        Calculates the median of the list of integers.
        """
        if len(self.data) == 0:
            raise ValueError("Cannot calculate median of an empty list")
        sorted_data = sorted(self.data)
        n = len(sorted_data)
        if n % 2 == 0:
            return (sorted_data[n // 2 - 1] + sorted_data[n // 2]) / 2
        else:
            return sorted_data[n // 2]
    
    def calculate_mode(self):
        """
        Calculates the mode(s) of the list of integers. If there are multiple modes, all will be returned.
        """
        if len(self.data) == 0:
            raise ValueError("Cannot calculate mode of an empty list")
        count = Counter(self.data)
        max_count = max(count.values())
        modes = [k for k, v in count.items() if v == max_count]
        return modes


# Example usage
data = [5, 1, 4, 3, 2, 5, 4]

# Create an instance of the StatisticsCalculator class
calculator = StatisticsCalculator(data)

# Calculate and print mean, median, and mode
print(f"Mean: {calculator.calculate_mean():.2f}")
print(f"Median: {calculator.calculate_median():.2f}")
modes = calculator.calculate_mode()
print(f"Mode: {', '.join(map(str, modes))}")
