#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
����binstall.sh �Wms�F��_�V�(q+.v�t��0O���&͋F��X��w�C�߻zA��i3�?����}�ٗ{tD�Y@�R�.���Ժ��^t[�ݏ�IVR�R�v�z2\ά?��p|�5m2zӁ5���Y�2���z�QQH[Pe9+!h��5����S�h�l�ށ9�xlD���Ç��Z� ����.�'550�3��w7`\N��؄�
Z���T�op��T���T�z��WLe�L�Ҁ=[QY�����Ckμ���G���f"6G��y`�)�/@�9U�0��c+�Lց�^0�\]��?��I�@�#�[�:K�B�!��V��>4䒼����"g:\P\��-�$iF�
t��E��u�*��q�����$xL�!L8K���_	����m��3'[H�
��O��V��
l�����6$y��0vh�L���e[<C���-b~5�P��>:E�J]�@���p�)���.�"�jVʠ≐^Q�oF���`�ያa]EN��.��Z�Ȕ���񟗣q�o���/���g��c��iUJF*�`uo>������l��#7o���_�++N��Ӓ��(����#���F��x {a��@MA�Je���gm��jަ����i:`a)����T�n+'Wp�W�k�S���l��}�r*!@U�
C.T���Y�jo����l��Rl_R�x���'�9Ng�ׯ�`����Oҏӳ�闳�S�_.�͡F�42�H������cBJ�����e�����ǏQA4��-H
�i��*`���KHd���m{JCQ��~����o�.h��s8T����J>\�{��3)������٫+�?��g���4�����:����9��|=3��>4�S4[�UGA}��n���
F��l�+��lL~9;C�J�"Cm�(�[P����-�%���T%6.V܈�6�Q\&6'��5
���P��4{�Nss(��zF������7���>5��'��2*��4�Ab�Qi��Ug�]�J�QD?t�d�~�Cc��c�VmatF�Q�u=�k����K�`�(��{����n^��ϊZ���j�Z��ߪ;�)�_5�-����y`qg(J��;K=!�x�������w(���M�o�	���I��d�_��jmr\��#��yH��{uq+q��������Bj�n���!�����#B��_����8���T��_�8~���"��:@t��I��J�սҒz�:���o��K�����i�Ż�����m����նcmD��~L�닚Vj�,َ	�^�0�o�۹�yY{v��8Z�t�̊$fN<vT��\�ƕ���='�~�!�K�44��2t��Qtp��Y ˶ا�XS��J�A��k�C��[��J  