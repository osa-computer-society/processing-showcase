# processing-showcase

A showcase of some of the most impressive Processing (and P5.js) programs written by OSA students.

## Getting started

Check out the [firstcontributions](https://github.com/firstcontributions/first-contributions#readme)
repo. They have a really good explanation of how to make a pull request on GitHub, and if you don't
want to use the command line, they also have tutorials for getting started with other tools like
GitHub Desktop or Visual Studio Code.

## Contributing

To make a contribution:

1. Fork this repository and create a new branch on your fork titled `submission-john-doe` (with your
   name in place of John Doe).
2. Add your **entire** Processing project folder into the `showcase` folder.
3. At the top of the main sketch file, add a comment with the following information:

```java
/**
 * Project title: PROJECT_TITLE_HERE
 * Author: YOUR_NAME_HERE
 * If your code is based off of a school assignment or a coding challenge, please give a brief
 * description of the assignment/prompt here, with a link if applicable
 */
```

4. Keeping in mind that new OSA students might be looking at these programs as exemplars, try to
   **document your code** as well as you can (while keeping it concise).
5. Inside your project, please comment out anything which modifies the filesystem, such as
   `saveFrame()` or video recording libraries.
   - If modifying files is necessary for your program or if you simply prefer having them there,
     please add a `.gitignore` file to the project folder that ignores all of the generated files.
     See [this Atlassian tutorial](https://www.atlassian.com/git/tutorials/saving-changes/gitignore)
     for more information.
6. Commit and push your changes and create a new pull request following the format indicated in the
   template.
7. We'll check out your pull request within a week and possibly suggest some changes.
8. Once we've looked over your pull request, we'll merge it into `main` and it'll be there for the
   world to see! Thank you for contributing.
