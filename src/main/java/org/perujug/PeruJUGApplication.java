package org.perujug;

import io.quarkus.runtime.Quarkus;
import io.quarkus.runtime.QuarkusApplication;
import io.quarkus.runtime.annotations.QuarkusMain;

@QuarkusMain
public class PeruJUGApplication {
    public static void main(String... args) {
        Quarkus.run(args);
    }
} 