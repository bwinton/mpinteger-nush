;; source files
(set @m_files     (filelist "^.*.m$"))
(set @nu_files    (filelist "^.*nu$"))

(set SYSTEM ((NSString stringWithShellCommand:"uname") chomp))
(case SYSTEM
      ("Darwin"
               (set @arch (list "x86_64"))
               (set @cflags "-g -std=gnu99 -fobjc-gc -DDARWIN")
               (set @ldflags  "-framework Foundation -framework Nu -lgmp"))
      ("Linux"
              (set @arch (list "i386"))
              (set gnustep_flags ((NSString stringWithShellCommand:"gnustep-config --objc-flags") chomp))
              (set gnustep_libs ((NSString stringWithShellCommand:"gnustep-config --base-libs") chomp))
              (set @cflags "-g -std=gnu99 -DLINUX -I/usr/local/include #{gnustep_flags}")
              (set @ldflags "#{gnustep_libs} -lNu -levent -lcrypto"))
      (else nil))

;; framework description
(set @framework "MPInteger")
(set @framework_identifier "ca.latte.mpinteger")
(set @framework_creator_code "????")
(set @framework_extra_install (do () ()))

(ifDarwin
         (set @public_headers (filelist "^.*\.h$")))

(compilation-tasks)
(framework-tasks)

(task "clean" is
      (SH "rm -rf build")
      (SH "rm -rf Xcode/build"))

(task "clobber" => "clean" is
      (SH "rm -rf #{@framework_dir}"))

(task "default" => "framework")

(task "doc" is (SH "nudoc"))

