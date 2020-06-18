
## Setup Webpack, and Babel

Running babel with webpack on a  project. Here we will use TypeScript to demonstrate some of the features of Babel. First, you need TypeScript installed of course. You can decide to have it installed globally on your machine, or locally to your project.

`npm i typescript -g`{{execute}}

Make a project deirectory

`mkdir babelingit`{{execute}} and change to the directory `cd babelingit`{{execute}} add the `package.json`

**Exercise** what npm command is used to initialise the package.json file

Once done generating the `package.json` run one of `tsc --init`{{execute}} or `npx tsc --init`{{execute}}

After running `tsc` with the `--init` flag, a `tsconfig.json` will be added to your project folder with a few sensible defaults and an extensive list of commented-out possible configurations. Here are the starting configurations:

```json
{
  "compilerOptions": {
    "target": "es5",
    "module": "commonjs",
    "strict": true
  }
}
```

We'll update this file to our needs; open `babelingit/tsconfig.json`{{open}} and replace contents

<pre class="file" data-filename="babelingit/tsconfig.json" data-target="replace">
{
  "compilerOptions": {
    "allowSyntheticDefaultImports": true,
    "noFallthroughCasesInSwitch": true,
    "noUnusedParameters": true,
    "noImplicitReturns": true,
    "esModuleInterop": true,
    "noUnusedLocals": true,
    "noImplicitAny": true,
    "declarationDir": "dist/types",
    "declaration": true,
    "target": "es2015",
    "module": "es2015",
    "strict": true
  },
  "include": [
    "src/**/*"
  ],
  "exclude": [
    "node_modules",
    "dist"
  ]
}
</pre>

Add the `mkdir src`{{execute}} directory, and a simple typescript source file to it `babelingit/src/index.ts`{{open}}

<pre class="file" data-filename="babelingit/src/index.ts" data-target="replace">
export interface Props {
  x: number;
  y: number;
}

export class Value {
  private value = 10
  private props: Props = { x: 0, y: 0 };

  getValue(): number {
    return this.value;
  }

  setValue(value: number): void {
    this.value = value;
  }

  setProps(props: Props) {
    this.props = props;
  }

  getProps(): Props {
    return this.props;
  }
}

const value = new Value();
value.setValue(1000);
value.getValue();

const value1 = new Value()
value1.setProps({ x: 1000, y: 1000 });
value1.getProps();
</pre>

Add typescript as dependency

`npm install --save-dev typescript`{{execute}}

Let's see how typescript compiles our source code, run `npx tsc`{{execute}}

Notice the `dist` directory created from this command, this is where the built files are.

`ls -ltr dist`{{execute}}

followd by 

`ls -ltr dist/types`{{execute}}

Open the `babelingit/dist/types/index.d.ts`{{open}} and notice the contents we will further work on this output by adding webpack and babel to our project.

Let's add some simple typescript goals first that enforce code quality.

Open the `babelingit/package.json`{{open}} file and update the scripts section to add following code

```json
  "type-check": "tsc --noEmit",
  "type-check:watch": "npm run type-check -- --watch",
```

**Exercise** Where in the file should these be added?

Let's run these scripts and observe the output 

`npm run type-check`{{execute}}

the `tpye-check:watch` goal is for continuous scanning i.e. you'll see it opens a live console and will continue to *lint* your files as save changes.
