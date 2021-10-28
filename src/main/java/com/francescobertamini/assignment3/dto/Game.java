package com.francescobertamini.assignment3.dto;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class Game {
    public String id;
    public int score;
    public String username;
    public String time;
    public ArrayList<Integer> values;

    public Game(String id, String username, String time) {

        this.id = id;
        this.score = 0;
        this.username = username;
        this.time = time;
        this.values = new ArrayList<>();

        for (int e = 0; e < 2; e++) {
            for (int i = 0; i < 8; i++) {
                this.values.add(i + 1);
            }
        }

        Collections.shuffle(this.values);
        System.out.println("Values: ");

        for (int a = 0; a < values.size(); a++) {
            System.out.print(values.get(a));
        }
        System.out.println();
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public ArrayList<Integer> getValues() {
        return values;
    }

    public void setValues(ArrayList<Integer> values) {
        this.values = values;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public static class GameComparator implements Comparator<Game> {

        @Override
        public int compare(Game o1, Game o2) {
            if (o1.getScore() > o2.getScore()) return -1;
            if (o1.getScore() < o2.getScore()) return 1;
            return 0;
        }
    }
}
