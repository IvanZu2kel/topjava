package ru.javawebinar.topjava.service;

import org.springframework.stereotype.Service;
import ru.javawebinar.topjava.model.Meal;
import ru.javawebinar.topjava.repository.MealRepository;
import ru.javawebinar.topjava.util.exception.NotFoundException;
import ru.javawebinar.topjava.web.SecurityUtil;

import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import static ru.javawebinar.topjava.util.ValidationUtil.checkNotFoundWithId;

@Service
public class MealService {

    private final MealRepository repository;
    private final Integer userId = SecurityUtil.authUserId();

    public MealService(MealRepository repository) {
        this.repository = repository;
    }

    public Meal create(Meal meal) {
        meal.setUserId(userId);
        return repository.save(meal);
    }

    public Meal update(Meal meal) {
        if (userId.equals(meal.getUserId())) {
            return repository.save(meal);
        }
        throw new NotFoundException("update exception");
    }

    public void delete(int id) {
        checkNotFoundWithId(repository.delete(id), id);
    }

    public Meal get(int id) {
        if (userId.equals(repository.get(id).getUserId())) {
            return checkNotFoundWithId(repository.get(id), id);
        }
        throw new NotFoundException("get by id: " + id + " exception");
    }

    public Collection<Meal> getAll() {
        List<Meal> collect = repository.getAll().stream()
                .filter(m -> Objects.equals(m.getUserId(), userId))
                .collect(Collectors.toList());
        if (collect.isEmpty()) throw new NotFoundException("getAll exception");
        return collect;
    }
}
