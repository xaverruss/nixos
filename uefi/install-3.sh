# Final

echo "Building"
tmux \
    new-session 'nixos-install --no-root-password ; echo "Now Reboot the system" ;bash' \; \
    split-window ' btop -p 0 ; bash'

echo " " 
echo " "
echo "Now Reboot the system"