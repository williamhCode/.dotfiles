if [ $# -eq 0 ]
  then
    echo "error: please supply program name"
    exit
fi

mkfile() {
    mkdir -p -- "$1" && touch -- "$1"/"$2" 
}

# create folders
mkfile src/main/java "$1.java"
mkfile src/test/java "RunLocalTest.java"

# create build.gradle
cat << EOF >> build.gradle
plugins {
    id 'java'
}

jar {
    manifest {
        attributes 'Main-Class': '$1'
    }
}

repositories {
    mavenCentral()
}

dependencies {
    testImplementation group: 'junit', name: 'junit', version: '4.13.2'
}
EOF

gradle wrapper

cat << EOF >> .gitignore
bin/

.gradle
**/build/
!src/**/build/

# Ignore Gradle GUI config
gradle-app.setting

# Avoid ignoring Gradle wrapper jar file (.jar files are usually ignored)
!gradle-wrapper.jar

# Avoid ignore Gradle wrappper properties
!gradle-wrapper.properties

# Cache of project
.gradletasknamecache

# Eclipse Gradle plugin generated files
# Eclipse Core
.project
# JDT-specific (Eclipse Java Development Tools)
.classpath
EOF
