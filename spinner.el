(setq spinner "\
                        .';cloddddddool:,..\n\
                      ..;ldOKNNWWWWWWWNX0xo:'.\n\
                    .':oOKNWWWWWWWWWWWWWWNX0xc,.\n\
                   .'lkKNWWWNKkdllooxOKNWWWWXOo,.\n\
                  .'ckXWMWNKko;.  ..':dOKNMMWNOo;.\n\
                 .':d0NMMWXkl,.      .,lkXWMMWKkl,.\n\
                 .;oOXWMMWKd:..      ..:xKWMMWXOd;.\n\
                 .;oOXWMMWXkc,.      .,lkXWMMWXOo;.\n\
                  .:d0NMMMNKko,.   ..:oOKNMMMWKxc'.\n\
                   .:xKWMMWWX0xocclldkKNWWMMWXkl'.\n\
                    .:x0XWWMWWWNNNNNNWWWMMWNKkl'.\n\
                     .':d0NWMMMMMMMMMMMMWNKkc,.\n\
                       .ckKNWMMMMMMMMMMMWN0o,.\n\
            .......   .'lOXNWMMMMMMMMMMMMWXx:...  ......\n\
       ..,:ldxxxxdddoooxOXWWMMMMMMMMMMMMMMWKkddooddxxxxdoc;'.\n\
     .,cok0XNWWWWWWNNNXNWWMMMMMMMMMMMMMMMMMWWNNNNWWWMWWNXKOdl;'.\n\
   .'ckKNNWWWWNNNNNWWWWMMMMMMMMMMMMMMMMMMMMMMMWWWWNNNNNWWWWNX0dc,.\n\
  .:dOXWMMWX0kdlclox0XWMMMMMMMMMMMMMMMMMMMMMMWNKOxlcclokKWMMWWX0d;.\n\
 .;xKNWMWWXOo;..  .,lkXWMMMMMMMMMMMMMMMMMMMMWN0d:'.   .;d0NWMMMN0o,.\n\
.'lONWMMWXOo,.     .'oOXWWMMMMWWWWWWWWWMMMMWNKd;.      .;oOXWMMWXxc'.\n\
.,o0NWMWNKkl.       .ckKNWMWNXOdllllokKNWWMWN0o'       .,cxKWMMWXkl;.\n\
.'lONWMWWX0o,.     .,o0XWMWNXkc.    .;d0XWMWNKd;.      .:dOXWMMWXxc'.\n\
 .;xKNWMMWXOo;..  .,lOXWMMWX0d;.     'cd0NWMWN0dc'.  ..:xKNWMMWN0l'.\n\
  .;oOXWMMWNKOxolldk0XWMMWXko;.       .;o0NWMWNX0xollodOKWMMWNXOo,.\n\
   .'cxKXNWWWWWWNWWWWWWNX0d:..         .,lk0XNWWWWWNNWWWWWWNKOdc'.\n\
     .':ox0XNWWWWWWWNX0kl;.               ':ok0XNWWWWWWNX0kdc;..\n\
       ..,:codddddddol:,.                  ..,:loddddddol:;..")

(defun spin (for-seconds)
  (let ((seconds-left for-seconds)
        (min-frametime 0.1))
    (while (> seconds-left 0)
      (reverse-region (point-min) (point-max))
      (let ((until-next-frame (+ min-frametime (/ 1 seconds-left))))
        (sit-for until-next-frame)
        (setq seconds-left (- seconds-left until-next-frame)))))
  (message "You spun for %s seconds. %s" for-seconds
           (if (> for-seconds 45) "Wow!" "")))

(defun fidget ()
  (interactive)
  (let ((buffer (generate-new-buffer "spinner")))
    (switch-to-buffer buffer)
    (insert spinner)
    (spin (random 60))
    (kill-buffer buffer)))

(global-set-key (kbd "<f10>") 'fidget)
