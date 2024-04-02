data = cd;
other_data = mach;

threshold = 0.27;
startIndex = 1200;

% Check if value is above threshold and index is above 1200
indices_to_remove = (data(startIndex:end) > threshold);

% Get indices of removed elements
removed_indices = startIndex + find(indices_to_remove) - 1;

% Remove points from 'data'
data(startIndex + find(indices_to_remove) - 1) = [];

% Remove corresponding points from 'other_data'
other_data(removed_indices) = [];

% Plot original data and modified data
figure;
plot(data);
xlabel('Index');
ylabel('Value');
title('Modified Data with Outliers Removed');

% Plot original other_data and modified other_data
figure;
plot(other_data);
xlabel('Index');
ylabel('Value');
title('Modified Other Data with Corresponding Outliers Removed');

figure;
plot(other_data,data);

window_size = 10; % Adjust as needed

% Apply moving average filter to 'data'
smoothed_data = movmean(data, window_size);

% Plot original data and smoothed data
figure;
plot(data, 'b', 'LineWidth', 1.5);
hold on;
plot(smoothed_data, 'r', 'LineWidth', 1.5);
hold off;
xlabel('Index');
ylabel('Value');
title('Original Data vs. Smoothed Data');
legend('Original Data', 'Smoothed Data');

remove_index = 2000;

% Remove data from indices 2000 or beyond
data = data(1:remove_index - 1);

% Remove corresponding data from 'other_data'
other_data = other_data(1:remove_index - 1);

% Apply moving average filter to 'data'
smoothed_data = movmean(data, window_size);

% Plot original data and smoothed data
figure;
plot(data, 'b', 'LineWidth', 1.5);
hold on;
plot(smoothed_data, 'r', 'LineWidth', 1.5);
hold off;
xlabel('Index');
ylabel('Value');
title('Original Data vs. Smoothed Data (After Removal)');
legend('Original Data', 'Smoothed Data');