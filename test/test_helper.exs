Mox.defmock(FileReaderBehaviourMock, for: FileReaderBehaviour)
Application.put_env(:fizz_buzz, :file_reader, FileReaderBehaviourMock)
ExUnit.start()
