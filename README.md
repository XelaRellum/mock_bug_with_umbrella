# Bug in Mock?
This repository contains fairly simple code, just a function that writes a file to the filesystem and immediately reads it to verify the successful write.

The test the behaviour we use mocks (see https://github.com/jjh42/mock).

The mocked functions `File.write!` and `File.read!` use an `Agent` to store the content of the file.

We have two Elixir projects in this repository `without_umbrella` and `with_umbrella`, containing the identical `lib/file_ex.ex` and `test/file_ex_test.exs`.

When running `mix test` inside `without_umbrella` everything works fine.

But when running `mix test` inside `with_umbrella` the test runned gets killed:
`** (EXIT from #PID<0.92.0>) killed`
