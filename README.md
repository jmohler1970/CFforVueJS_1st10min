# CFforVueJS_1st10min
ColdFusion for VueJS developers: the first 10 minutes

Let's go through the code in the order that they are processed

# Request livecyle.

We are going load pages. Each page is only a small part of an application. I have worked on application with hundreds of pages / files. Here are the good parts of this.

- If one page is broken, the rest of the application still runs
- Libraries like jQuery and VueJS just get cached by the browser automatically
- As a result, what we are pushing over on a page request tends to be rather small. We are not trying to load up the entire app.

The not so good parts

- There could be a broken page. It could fail at compile time. If it is a page few people use, it could be a long time before anyone notices
- There is no easy way to comple the entire app to verify it compiles. (Some CF people are yelling in the background. I said "easy")
- Everytime a link is followed, or a form is submitted, the browser will blink as it is loading the next page.


# Files

## `server.json`

This is used by commandbox to bring up the ColdFusion server. This is the simplest and quickest way I know to bring up ColdFusion. It also makes each and every ColdFusion application separate.

## `application.cfc`

As soon as you see a `.cfc` you are dealing with an object definition. ColdFusion does not pack multiple object defintions into a single file. We just have one. `application.cfc` is a special object which (surprise!) controls the entire application. 

`application.cfc` has four parts

1. The first part is all the stuff outside of a function. Anything outside of a function is a part of the constructor. No that was not a typo. In theory your constructor code could just about anywhere. For your sanity, and the sanity of your fellow developers, put it all at the top of the file. `application.cfc` is not a generic object. All of the member data I have shown, is a standard part of its configuration. Keep in mind that `application.cfc` impacts every file in an application. It should be treated with care.

You may ask, how do I know which files are a part of an application? The answer is any file that is the same directory as `application.cfc` or any file that is in a subdirectory. (Certain rules, exceptions, and restriction apply). These are kinds of like constants in VueJS

2. Our first function is `onApplicationStart()`. This is were variables that are shared across all users AND all pages are kept. By their nature, these are typically read only. We will demonstrate why later. VueJS certainly has global variables, but the distinction between this function and the contructor really does not exist.

3. The next function is `onSessionStart()`. This is for variables that are for one user but shared across multiple pages. This is a lot like what vuex does. If you are loading in data into vuex, this is kinda like that. It is also similar to whatever you might put into `mounted`

4. The next function is `onRequestStart()` This is to setup items that are only for this request. One of my favorite things to do with this is log clicks into a traffic tracker. This is where I load the DB table with click information This would be common across all pages. Image in VueJS if you had a method that was called as a part of each and every method associated with a click.


## `header.cfi`

This is a non-standard trick, but I think it is so cool. I came up with this. `.cfi` stands for ColdFusion include. It is a file that can only be included. It cannot be ran directly. If you try to navigate to it, nothing will be served. But if you `<cfinclude>` it, it will bring in its content.

OK, we need to talk about what a `<cfinclude>` is. In VueJS, a file needs to be exported, then imported where it is going to be used, and then used. The is a three step process. In ColdFusion, we just use `<cfinclude>`. Nothing special was done to the thing being included. The file doing the `<cfinclude>`ing just had a relative or absolute path the file, and it was brough in. This is a one step process. The good parts about this are:

- It is dead simple
- It is very, very common
- Without any additional work variables are shared going into the `<cfinclude>` and they are shared coming out of the `<cfincude>`

The not so good parts

- Without any additional work variables are shared going into the `<cfinclude>` and they are shared coming out of the `<cfincude>`. You can really screw up some variables.
- Did I mention that ColdFusion before 2018 did not have constants.
- Be careful. It is not a compile error if you accidentially change your variables. You did it. Not ColdFusion.

OK, things get better. `<cfinclude>` is not the only way to share and reuse code. We have objects, and functions that are not a part of objects. We have `<cfmodule>`. We have ORM. We have all kinds of things. Variables can be tightened down.

## `footer.cfi`

Works the same way as `header.cfi`. It just goes on the bottom.


## `index.cfm`

We start with a `<cfscript>`. I like to manipulate my variables within `<cfscript>` block. It looks a lot like C++, C, Javascript, etc. ColdFusion supports variable manipulation in the tag syntax too. To me, that syntax is more verbose and harder to read. Everyone has their opinion on this. I have seen code without a single block of `<cfscript>`. Sometimes you just have to update the code you are given.

So I am incrementing `application.counter`, `session.counter`, and `request.counter`. When we start running our code, we will see differences in behavior.

I also have a simple form, that we will be submitting, to see how `form` scoped variables work.

# Let's run it.
