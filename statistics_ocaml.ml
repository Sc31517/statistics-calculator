(* Calculate the mean of a list of integers *)
let calculate_mean lst =
  if List.length lst = 0 then
    failwith "Cannot calculate mean of an empty list"
  else
    let sum = List.fold_left (+) 0 lst in
    float_of_int sum /. float_of_int (List.length lst) ;;

(* Calculate the median of a list of integers *)
let calculate_median lst =
  if List.length lst = 0 then
    failwith "Cannot calculate median of an empty list"
  else
    let sorted_lst = List.sort compare lst in  (* Sorting the list *)
    let len = List.length sorted_lst in
    if len mod 2 = 0 then  (* If the list has an even length *)
      let mid1 = List.nth sorted_lst (len / 2 - 1) in
      let mid2 = List.nth sorted_lst (len / 2) in
      float_of_int (mid1 + mid2) /. 2.  (* Return the average of the two middle elements *)
    else  (* If the list has an odd length *)
      float_of_int (List.nth sorted_lst (len / 2)) ;;

(* Calculate the mode of a list of integers *)
let calculate_mode lst =
  if List.length lst = 0 then
    failwith "Cannot calculate mode of an empty list"
  else
    (* Create a frequency table using fold_left *)
    let freq_map = List.fold_left (fun acc x -> 
        let count = try List.assoc x acc with Not_found -> 0 in  (* Count occurrences *)
        (x, count + 1) :: List.remove_assoc x acc  (* Update the frequency table *)
      ) [] lst in
    let max_count = List.fold_left (fun current_max (_, count) -> 
        if count > current_max then count else current_max) 0 freq_map in  (* Find the max frequency *)
    let modes = List.filter (fun (_, count) -> count = max_count) freq_map in  (* Filter elements with the max frequency *)
    List.iter (fun (mode, _) -> Printf.printf "Mode: %d\n" mode) modes ;;  (* Print all modes *)

(* Main function to handle input and print results *)
let () =
  (* Sample list for testing *)
  let lst = [5; 1; 4; 3; 2; 5; 4] in  

  (* Print calculated mean, median, and mode *)
  Printf.printf "Mean: %.2f\n" (calculate_mean lst);
  Printf.printf "Median: %.2f\n" (calculate_median lst);
  calculate_mode lst
