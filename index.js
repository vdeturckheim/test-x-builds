import OS from 'os';
import { GLIBC, MUSL, family, version, isNonGlibcLinux } from 'detect-libc';

console.log('System is:');
console.log('* platform:', OS.platform());
console.log('* arch:', OS.arch());
console.log('* libc:', family + ' v' + version)
