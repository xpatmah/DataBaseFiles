select Employee.First_name , ifnull(I.Incentive_amount ,0) from Employee left join (select Incentive.Employee_ref_id ,sum(Incentive.Incentive_amount) Incentive_amount from Incentive group by Incentive.Employee_ref_id) I on Employee.Employee_id = I.Employee_ref_id;