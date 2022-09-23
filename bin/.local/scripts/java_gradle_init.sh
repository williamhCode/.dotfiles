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

gradle build
gradle wrapper
