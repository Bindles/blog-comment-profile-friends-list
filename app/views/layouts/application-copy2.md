<!-- index.html -->

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Tailwind CSS -->
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
  <!-- DaisyUI -->
  <link href="https://cdn.jsdelivr.net/npm/@divyanshu013/daisyui@1.0.0/dist/full.css" rel="stylesheet">
  <title>Your Updated Layout</title>
</head>
<body class="bg-gray-100">

  <!-- Header -->
  <header class="bg-black text-white p-4 flex flex-col items-center">
    <!-- Sample Links -->
    <nav class="space-x-4 mb-2">
      <a href="#" class="text-white">Link 1</a>
      <a href="#" class="text-white">Link 2</a>
      <a href="#" class="text-white">Link 3</a>
      <a href="#" class="text-white">Link 4</a>
    </nav>

    <!-- Username Dropdown -->
    <div class="relative">
      <button class="text-white">Username</button>
      <!-- Dropdown Menu -->
      <div class="absolute right-0 mt-2 bg-black text-white p-2 hidden">
        <!-- Dropdown content goes here -->
        <a href="#" class="block hover:text-gray-400">Login</a>
        <a href="#" class="block hover:text-gray-400">Register</a>
      </div>
    </div>

    <!-- Baby Blue Line In the Middle of Header -->
    <div class="w-full h-1 bg-blue-300 my-2"></div>
  </header>

  <!-- Post Cards Section -->
  <div class="container mx-auto mt-8 flex flex-wrap">
    <!-- Sample Post Card 1 -->
    <div class="w-full md:w-1/2 lg:w-1/3 p-4">
      <div class="bg-white rounded-md shadow-md overflow-hidden">
        <!-- Black Rectangle Area at the Top -->
        <div class="bg-black text-white p-2">
          <h2 class="text-xl font-bold">Post Title</h2>
        </div>
        <!-- Content Section -->
        <div class="p-6">
          <p>Post body goes here. Lorem ipsum dolor sit amet, consectetur adipiscing elit...</p>
        </div>
      </div>
    </div>

    <!-- Sample Post Card 2 (Inverted Colors) -->
    <div class="w-full md:w-1/2 lg:w-1/3 p-4">
      <div class="bg-black text-white rounded-md shadow-md overflow-hidden">
        <!-- White Rectangle Area at the Top -->
        <div class="bg-white text-black p-2">
          <h2 class="text-xl font-bold">Inverted Post Title</h2>
        </div>
        <!-- Content Section -->
        <div class="p-6">
          <p>Inverted post body goes here. Lorem ipsum dolor sit amet, consectetur adipiscing elit...</p>
        </div>
      </div>
    </div>

    <!-- Add more post cards as needed -->
  </div>

</body>
</html>
