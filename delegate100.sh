stchaincli tx staking delegate stvaloper1vfeuy7gkdsfun2u9a896sam3ss0mqvxlk9rd0t "100000000000ustos" \
--chain-id=tropos-1 \
--gas="auto" \
--gas-adjustment=1.5 \
--gas-prices="0.5ustos" \
--keyring-backend=test \
--node `cat "$HOME/.stchaind/config/config.toml" \
| grep -oPm1 "(?<=^laddr = \")([^%]+)(?=\")"` \
--from=$NICKNAME \
-y