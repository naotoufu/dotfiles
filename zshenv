case ${OSTYPE} in
    darwin*|linux*)
typeset -U path
path=(~/bin /other/things/in/path /usr/local/mysql/bin
    /usr/local/bin /sw/bin/ /opt/local/bin /opt/local/sbin
    $path)

export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH
;;

    cygwin*)
## ENVIRONMENT PATH
typeset -U path cdpath fpath manpath

path=(
   ~/bin
   ~/bin/windows
    /bin
    /sbin
    /lib
    /usr/local/bin
    /cygdrive/c/MinGW/bin
#    /cygdrive/c/Program\ Files/Java/jdk1.6.0_31/bin
    /cygdrive/c/Program\ Files/Java/jdk1.8.0_05/bin
    /cygdrive/c/Program\ Files/Java/jre8/bin
    /local/postfix
    /cygdrive/c/vim/vim74
    /cygdrive/c/gtk/bin
    /cygdrive/c/Program\ Files/Inkscape
    /cygdrive/c/Program\ Files/GIMP\ 2/bin
    /cygdrive/c/Program\ Files/Mozilla\ Firefox
    $path
)

fpath=(~/.zsh/functions ${fpath})
# キャッシュの設定
if [ -d ~/.zsh/cache ]; then
    zstyle ':completion:*' use-cache yes
    zstyle ':completion:*' cache-path ~/.zsh/cache
fi
        ;;
esac

case ${OSTYPE} in
    cygwin*)
        # EMACS_SERVER_FILE
        #export EMACS_SERVER_FILE="C:/Users/netforce/Dropbox/.emacs.d/server/server"
        export EMACS_SERVER_FILE=""
        # ALTERNATE_EDITOR
        export ALTERNATE_EDITOR="C:/emacs-24.4-bin-i686-pc-mingw32/bin"
        #export ALTERNATE_EDITOR=""

# JAVA_HOME
#export JAVA_HOME='/cygdrive/c/Program Files/Java/jdk1.6.0_31/bin'
#export JAVA_HOME='/cygdrive/c/Program Files/Java/jdk1.8.0_25/bin'
export JAVA_HOME='/cygdrive/c/Program Files/Java/jdk1.8.0_05/'

# Apache_HOME
export APACHE_HOME='/cygdrive/c/Apache Software Foundation/Apache2.2'
# Apache Tomcat CATALINA_HOME
#export CATALINA_HOME='/cygdrive/c/Apache Software Foundation/Tomcat 6.0'
export CATALINA_HOME="C:/Program Files/Apache Software Foundation/Tomcat 8.0"

#GTK
export GTK_BASEPATH='/cygdrive/c/gtk'
export LIB=${GTK_BASEPATH}/lib
#PKG_CONFIG
export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:'/cygdrive/c/gtk/lib/pkgconfig'

export LD_LIBRARY_PATH=/cygdrive/c/cygwin/lib:/cygdrive/c/cygwin/lib/w32api:/cygdrive/c/cygwin/usr/local/lib
#export LD_LIBRARY_PATH="/usr/local/lib"

        ;;
esac


case ${OSTYPE} in
    cygwin*|darwin*)
export EDITOR="vim"
#export PAGER="less"
TMUX_OLD="$TMUX"
TMUX=''
        ;;
esac
