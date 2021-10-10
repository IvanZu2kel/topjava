package ru.javawebinar.topjava.util.strategy;

import ru.javawebinar.topjava.model.Meal;
import ru.javawebinar.topjava.model.MealTo;

import java.time.LocalTime;
import java.util.List;

public class Context {

    private Strategy strategy;

    public void setStrategy(Strategy strategy) {
        this.strategy = strategy;
    }

    public List<MealTo> executeStrategy(List<Meal> meals, LocalTime startTime, LocalTime endTime, int caloriesPerDay) {
        return strategy.filteredByStreams(meals, startTime, endTime, caloriesPerDay);
    }
}
