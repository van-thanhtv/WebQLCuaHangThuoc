package Dao;

import entitys.DetailPlan;

import java.util.List;

public class detailPlanDao extends AbstractDao<DetailPlan> implements DaoInterface<DetailPlan>{
    @Override
    public DetailPlan findById(Integer id) {
        return super.findById(DetailPlan.class,id);
    }

    @Override
    public List<DetailPlan> findAll() {
        return super.finAll(DetailPlan.class);
    }
}
