package com.example;

import org.junit.Test;
import static org.junit.Assert.*;

public class AppTest {

    @Test
    public void testGreet() {
        assertEquals("Hello Jenkins!", App.greet());
    }
}
