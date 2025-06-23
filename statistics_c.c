#include <stdio.h>
#include <stdlib.h>

// Function to calculate the mean
double calculate_mean(int arr[], int size) {
    int sum = 0;
    for (int i = 0; i < size; i++) {
        sum += arr[i];
    }
    return (double)sum / size;
}

// Function to compare two integers (for sorting)
int compare(const void* a, const void* b) {
    return (*(int*)a - *(int*)b);
}

// Function to calculate the median
double calculate_median(int arr[], int size) {
    qsort(arr, size, sizeof(int), compare); // Sorting the array
    
    if (size % 2 == 0) {
        return (arr[size / 2 - 1] + arr[size / 2]) / 2.0;
    } else {
        return arr[size / 2];
    }
}

// Function to calculate the mode
void calculate_mode(int arr[], int size) {
    int max_count = 0, mode = arr[0];
    for (int i = 0; i < size; i++) {
        int count = 0;
        for (int j = 0; j < size; j++) {
            if (arr[i] == arr[j]) {
                count++;
            }
        }
        if (count > max_count) {
            max_count = count;
            mode = arr[i];
        }
    }
    printf("Mode: %d\n", mode);
}

int main() {
    int n;
    printf("Enter the number of elements: ");
    scanf("%d", &n);
    
    int arr[n];
    
    printf("Enter %d integers:\n", n);
    for (int i = 0; i < n; i++) {
        scanf("%d", &arr[i]);
    }

    printf("Mean: %.2f\n", calculate_mean(arr, n));
    printf("Median: %.2f\n", calculate_median(arr, n));
    calculate_mode(arr, n);

    return 0;
}
