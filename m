Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUbea-0006qW-GZ
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 18:02:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbeJ-0006W7-FT
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 18:02:16 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbe6-0006FF-Vz
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 18:02:15 -0500
Received: by mail-wm1-x336.google.com with SMTP id p26so4385870wmc.4
 for <qemu-riscv@nongnu.org>; Tue, 21 Feb 2023 15:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=31Qn8/51ca33s21oYTA4eUzOL1KubkRerbe1Qmdq3yE=;
 b=k7K+dEVLZVY/uENC63ChIgPVKcUAWPVgExTbOfIpgx8xrWBtki4J9gijFnjJRU7TF9
 A9bYswJr10WrjyOY7nleVCIGndKhT9AnX5Cv5y0H9L/nu+CuwqsbXta1mwe1/NdA0Avs
 qh+rmLDZwGPuITdsKHf3oJCPKD2eS37FfFtb6G3nDJhsWsdTn+FwQeSpKV5aaP2S9EgW
 2ksu/FJU+7oetIIfxBoMXhkgO5+VIuMbGWjc6eeSYwWR5G7p4ibnvAmKyUwvPfMbhaLZ
 O7ub1SUZVGz4XM1mp9NG2o+oH/lrP+CKPB8PHPM3SXOZFP126/QUSzokCRd82t1kok5m
 D2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=31Qn8/51ca33s21oYTA4eUzOL1KubkRerbe1Qmdq3yE=;
 b=C5569g2edAtm7TFRnTTh1x3t4ekUwjyh/SWSQ25GaG39AbKy+gbQEFh4ORs5Fip+RQ
 F17rRA/IHR8M6MiclmrtU3DeexeyKtnVtOaq2YL8rnpE9JDMsU9fCxEMqD0UpENywkkt
 hcevF8T1qWOWbRgFVqnSv8mNMdKDHeBzgSUehmcSopkJJHTxva7SitqabimA4Bt3hlEA
 QDGILE4gkwtRbGHa3JoPSwBFBwFHhBnBJHyHjPm5nqUyH6t8nv+jkAIgFo5m5rB9xXoG
 LkzYpHZ8EBq5CmRDRO9LMoniVi4NsOwqqp8+8yXi2liJbw0Ieeo6vH7UpVBG7a/lUV73
 SK4w==
X-Gm-Message-State: AO0yUKX/cOMxWXlbiO2Rq1wmY9Q4aUnHVL3avPQpRKMMCoEjHumZF/Sc
 qVvW7VSwCUJEwCA/4RIz3L/6hg==
X-Google-Smtp-Source: AK7set8lvfs4HN5l8vT8H/WQLsP6b90OuvXkb8n0HkstS1wfFPxG2sYn3hDKRVlkkuQPhW1mwgvdxA==
X-Received: by 2002:a05:600c:4b30:b0:3e2:147f:ac1a with SMTP id
 i48-20020a05600c4b3000b003e2147fac1amr2525182wmp.21.1677020518460; 
 Tue, 21 Feb 2023 15:01:58 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 18-20020a05600c231200b003e20fa01a86sm5340865wmo.13.2023.02.21.15.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 15:01:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C05271FFBD;
 Tue, 21 Feb 2023 22:52:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 nicolas.eder@lauterbach.com, Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, mads@ynddal.dk,
 Marek Vasut <marex@denx.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Bin Meng <bin.meng@windriver.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v3 20/24] gdbstub: move syscall handling to new file
Date: Tue, 21 Feb 2023 22:52:23 +0000
Message-Id: <20230221225227.3735319-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221225227.3735319-1-alex.bennee@linaro.org>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Feb 2023 23:02:18 -0000

Our GDB syscall support is the last chunk of code that needs target
specific support so move it to a new file. We take the opportunity to
move the syscall state into its own singleton instance and add in a
few helpers for the main gdbstub to interact with the module.

I also moved the gdb_exit() declaration into syscalls.h as it feels
pretty related and most of the callers of it treat it as such.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h                |   8 +-
 include/exec/gdbstub.h             | 102 -------------
 include/gdbstub/syscalls.h         | 124 ++++++++++++++++
 gdbstub/gdbstub.c                  | 177 +---------------------
 gdbstub/softmmu.c                  |   7 +-
 gdbstub/syscalls.c                 | 227 +++++++++++++++++++++++++++++
 gdbstub/user.c                     |   1 +
 linux-user/exit.c                  |   2 +-
 semihosting/arm-compat-semi.c      |   1 +
 semihosting/guestfd.c              |   2 +-
 semihosting/syscalls.c             |   2 +-
 softmmu/runstate.c                 |   2 +-
 target/m68k/m68k-semi.c            |   2 +-
 target/mips/tcg/sysemu/mips-semi.c |   2 +-
 target/nios2/nios2-semi.c          |   2 +-
 gdbstub/meson.build                |   4 +
 16 files changed, 377 insertions(+), 288 deletions(-)
 create mode 100644 include/gdbstub/syscalls.h
 create mode 100644 gdbstub/syscalls.c

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 5f2e24c4f3..fe82facaeb 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -59,8 +59,6 @@ typedef struct GDBState {
     bool multiprocess;
     GDBProcess *processes;
     int process_num;
-    char syscall_buf[256];
-    gdb_syscall_complete_cb current_syscall_cb;
     GString *str_buf;
     GByteArray *mem_buf;
     int sstep_flags;
@@ -189,6 +187,12 @@ void gdb_handle_query_attached(GArray *params, void *user_ctx); /* both */
 void gdb_handle_query_qemu_phy_mem_mode(GArray *params, void *user_ctx);
 void gdb_handle_set_qemu_phy_mem_mode(GArray *params, void *user_ctx);
 
+/* sycall handling */
+void gdb_handle_file_io(GArray *params, void *user_ctx);
+bool gdb_handled_syscall(void);
+void gdb_disable_syscalls(void);
+void gdb_syscall_reset(void);
+
 /*
  * Break/Watch point support - there is an implementation for softmmu
  * and user mode.
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index bb8a3928dd..7d743fe1e9 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -10,98 +10,6 @@
 #define GDB_WATCHPOINT_READ      3
 #define GDB_WATCHPOINT_ACCESS    4
 
-/* For gdb file i/o remote protocol open flags. */
-#define GDB_O_RDONLY  0
-#define GDB_O_WRONLY  1
-#define GDB_O_RDWR    2
-#define GDB_O_APPEND  8
-#define GDB_O_CREAT   0x200
-#define GDB_O_TRUNC   0x400
-#define GDB_O_EXCL    0x800
-
-/* For gdb file i/o remote protocol errno values */
-#define GDB_EPERM           1
-#define GDB_ENOENT          2
-#define GDB_EINTR           4
-#define GDB_EBADF           9
-#define GDB_EACCES         13
-#define GDB_EFAULT         14
-#define GDB_EBUSY          16
-#define GDB_EEXIST         17
-#define GDB_ENODEV         19
-#define GDB_ENOTDIR        20
-#define GDB_EISDIR         21
-#define GDB_EINVAL         22
-#define GDB_ENFILE         23
-#define GDB_EMFILE         24
-#define GDB_EFBIG          27
-#define GDB_ENOSPC         28
-#define GDB_ESPIPE         29
-#define GDB_EROFS          30
-#define GDB_ENAMETOOLONG   91
-#define GDB_EUNKNOWN       9999
-
-/* For gdb file i/o remote protocol lseek whence. */
-#define GDB_SEEK_SET  0
-#define GDB_SEEK_CUR  1
-#define GDB_SEEK_END  2
-
-/* For gdb file i/o stat/fstat. */
-typedef uint32_t gdb_mode_t;
-typedef uint32_t gdb_time_t;
-
-struct gdb_stat {
-  uint32_t    gdb_st_dev;     /* device */
-  uint32_t    gdb_st_ino;     /* inode */
-  gdb_mode_t  gdb_st_mode;    /* protection */
-  uint32_t    gdb_st_nlink;   /* number of hard links */
-  uint32_t    gdb_st_uid;     /* user ID of owner */
-  uint32_t    gdb_st_gid;     /* group ID of owner */
-  uint32_t    gdb_st_rdev;    /* device type (if inode device) */
-  uint64_t    gdb_st_size;    /* total size, in bytes */
-  uint64_t    gdb_st_blksize; /* blocksize for filesystem I/O */
-  uint64_t    gdb_st_blocks;  /* number of blocks allocated */
-  gdb_time_t  gdb_st_atime;   /* time of last access */
-  gdb_time_t  gdb_st_mtime;   /* time of last modification */
-  gdb_time_t  gdb_st_ctime;   /* time of last change */
-} QEMU_PACKED;
-
-struct gdb_timeval {
-  gdb_time_t tv_sec;  /* second */
-  uint64_t tv_usec;   /* microsecond */
-} QEMU_PACKED;
-
-typedef void (*gdb_syscall_complete_cb)(CPUState *cpu, uint64_t ret, int err);
-
-/**
- * gdb_do_syscall:
- * @cb: function to call when the system call has completed
- * @fmt: gdb syscall format string
- * ...: list of arguments to interpolate into @fmt
- *
- * Send a GDB syscall request. This function will return immediately;
- * the callback function will be called later when the remote system
- * call has completed.
- *
- * @fmt should be in the 'call-id,parameter,parameter...' format documented
- * for the F request packet in the GDB remote protocol. A limited set of
- * printf-style format specifiers is supported:
- *   %x  - target_ulong argument printed in hex
- *   %lx - 64-bit argument printed in hex
- *   %s  - string pointer (target_ulong) and length (int) pair
- */
-void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...);
-/**
- * gdb_do_syscallv:
- * @cb: function to call when the system call has completed
- * @fmt: gdb syscall format string
- * @va: arguments to interpolate into @fmt
- *
- * As gdb_do_syscall, but taking a va_list rather than a variable
- * argument list.
- */
-void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va);
-int use_gdb_syscalls(void);
 
 /* Get or set a register.  Returns the size of the register.  */
 typedef int (*gdb_get_reg_cb)(CPUArchState *env, GByteArray *buf, int reg);
@@ -120,16 +28,6 @@ void gdb_register_coprocessor(CPUState *cpu,
  */
 int gdbserver_start(const char *port_or_device);
 
-/**
- * gdb_exit: exit gdb session, reporting inferior status
- * @code: exit code reported
- *
- * This closes the session and sends a final packet to GDB reporting
- * the exit status of the program. It also cleans up any connections
- * detritus before returning.
- */
-void gdb_exit(int code);
-
 void gdb_set_stop_cpu(CPUState *cpu);
 
 /**
diff --git a/include/gdbstub/syscalls.h b/include/gdbstub/syscalls.h
new file mode 100644
index 0000000000..5851a2c706
--- /dev/null
+++ b/include/gdbstub/syscalls.h
@@ -0,0 +1,124 @@
+/*
+ * GDB Syscall support
+ *
+ * Copyright (c) 2023 Linaro Ltd
+ *
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
+
+#ifndef _SYSCALLS_H_
+#define _SYSCALLS_H_
+
+/* For gdb file i/o remote protocol open flags. */
+#define GDB_O_RDONLY  0
+#define GDB_O_WRONLY  1
+#define GDB_O_RDWR    2
+#define GDB_O_APPEND  8
+#define GDB_O_CREAT   0x200
+#define GDB_O_TRUNC   0x400
+#define GDB_O_EXCL    0x800
+
+/* For gdb file i/o remote protocol errno values */
+#define GDB_EPERM           1
+#define GDB_ENOENT          2
+#define GDB_EINTR           4
+#define GDB_EBADF           9
+#define GDB_EACCES         13
+#define GDB_EFAULT         14
+#define GDB_EBUSY          16
+#define GDB_EEXIST         17
+#define GDB_ENODEV         19
+#define GDB_ENOTDIR        20
+#define GDB_EISDIR         21
+#define GDB_EINVAL         22
+#define GDB_ENFILE         23
+#define GDB_EMFILE         24
+#define GDB_EFBIG          27
+#define GDB_ENOSPC         28
+#define GDB_ESPIPE         29
+#define GDB_EROFS          30
+#define GDB_ENAMETOOLONG   91
+#define GDB_EUNKNOWN       9999
+
+/* For gdb file i/o remote protocol lseek whence. */
+#define GDB_SEEK_SET  0
+#define GDB_SEEK_CUR  1
+#define GDB_SEEK_END  2
+
+/* For gdb file i/o stat/fstat. */
+typedef uint32_t gdb_mode_t;
+typedef uint32_t gdb_time_t;
+
+struct gdb_stat {
+  uint32_t    gdb_st_dev;     /* device */
+  uint32_t    gdb_st_ino;     /* inode */
+  gdb_mode_t  gdb_st_mode;    /* protection */
+  uint32_t    gdb_st_nlink;   /* number of hard links */
+  uint32_t    gdb_st_uid;     /* user ID of owner */
+  uint32_t    gdb_st_gid;     /* group ID of owner */
+  uint32_t    gdb_st_rdev;    /* device type (if inode device) */
+  uint64_t    gdb_st_size;    /* total size, in bytes */
+  uint64_t    gdb_st_blksize; /* blocksize for filesystem I/O */
+  uint64_t    gdb_st_blocks;  /* number of blocks allocated */
+  gdb_time_t  gdb_st_atime;   /* time of last access */
+  gdb_time_t  gdb_st_mtime;   /* time of last modification */
+  gdb_time_t  gdb_st_ctime;   /* time of last change */
+} QEMU_PACKED;
+
+struct gdb_timeval {
+  gdb_time_t tv_sec;  /* second */
+  uint64_t tv_usec;   /* microsecond */
+} QEMU_PACKED;
+
+typedef void (*gdb_syscall_complete_cb)(CPUState *cpu, uint64_t ret, int err);
+
+/**
+ * gdb_do_syscall:
+ * @cb: function to call when the system call has completed
+ * @fmt: gdb syscall format string
+ * ...: list of arguments to interpolate into @fmt
+ *
+ * Send a GDB syscall request. This function will return immediately;
+ * the callback function will be called later when the remote system
+ * call has completed.
+ *
+ * @fmt should be in the 'call-id,parameter,parameter...' format documented
+ * for the F request packet in the GDB remote protocol. A limited set of
+ * printf-style format specifiers is supported:
+ *   %x  - target_ulong argument printed in hex
+ *   %lx - 64-bit argument printed in hex
+ *   %s  - string pointer (target_ulong) and length (int) pair
+ */
+void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...);
+
+/**
+ * gdb_do_syscallv:
+ * @cb: function to call when the system call has completed
+ * @fmt: gdb syscall format string
+ * @va: arguments to interpolate into @fmt
+ *
+ * As gdb_do_syscall, but taking a va_list rather than a variable
+ * argument list.
+ */
+void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va);
+
+/**
+ * use_gdb_syscalls() - report if GDB should be used for syscalls
+ *
+ * This is mostly driven by the semihosting mode the user configures
+ * but assuming GDB is allowed by that we report true if GDB is
+ * connected to the stub.
+ */
+int use_gdb_syscalls(void);
+
+/**
+ * gdb_exit: exit gdb session, reporting inferior status
+ * @code: exit code reported
+ *
+ * This closes the session and sends a final packet to GDB reporting
+ * the exit status of the program. It also cleans up any connections
+ * detritus before returning.
+ */
+void gdb_exit(int code);
+
+#endif /* _SYSCALLS_H_ */
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 7ae3ff52b3..a8b321710c 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -29,6 +29,7 @@
 #include "qemu/module.h"
 #include "trace.h"
 #include "exec/gdbstub.h"
+#include "gdbstub/syscalls.h"
 #ifdef CONFIG_USER_ONLY
 #include "gdbstub/user.h"
 #else
@@ -38,7 +39,6 @@
 
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
-#include "semihosting/semihost.h"
 #include "exec/exec-all.h"
 #include "exec/tb-flush.h"
 #include "exec/hwaddr.h"
@@ -78,41 +78,6 @@ void gdb_init_gdbserver_state(void)
 
 bool gdb_has_xml;
 
-/*
- * Return true if there is a GDB currently connected to the stub
- * and attached to a CPU
- */
-static bool gdb_attached(void)
-{
-    return gdbserver_state.init && gdbserver_state.c_cpu;
-}
-
-static enum {
-    GDB_SYS_UNKNOWN,
-    GDB_SYS_ENABLED,
-    GDB_SYS_DISABLED,
-} gdb_syscall_mode;
-
-/* Decide if either remote gdb syscalls or native file IO should be used. */
-int use_gdb_syscalls(void)
-{
-    SemihostingTarget target = semihosting_get_target();
-    if (target == SEMIHOSTING_TARGET_NATIVE) {
-        /* -semihosting-config target=native */
-        return false;
-    } else if (target == SEMIHOSTING_TARGET_GDB) {
-        /* -semihosting-config target=gdb */
-        return true;
-    }
-
-    /* -semihosting-config target=auto */
-    /* On the first call check if gdb is connected and remember. */
-    if (gdb_syscall_mode == GDB_SYS_UNKNOWN) {
-        gdb_syscall_mode = gdb_attached() ? GDB_SYS_ENABLED : GDB_SYS_DISABLED;
-    }
-    return gdb_syscall_mode == GDB_SYS_ENABLED;
-}
-
 /* writes 2*len+1 bytes in buf */
 void gdb_memtohex(GString *buf, const uint8_t *mem, int len)
 {
@@ -922,7 +887,7 @@ static void handle_detach(GArray *params, void *user_ctx)
 
     if (!gdbserver_state.c_cpu) {
         /* No more process attached */
-        gdb_syscall_mode = GDB_SYS_DISABLED;
+        gdb_disable_syscalls();
         gdb_continue();
     }
     gdb_put_packet("OK");
@@ -1234,60 +1199,6 @@ static void handle_read_all_regs(GArray *params, void *user_ctx)
     gdb_put_strbuf();
 }
 
-static void handle_file_io(GArray *params, void *user_ctx)
-{
-    if (params->len >= 1 && gdbserver_state.current_syscall_cb) {
-        uint64_t ret;
-        int err;
-
-        ret = get_param(params, 0)->val_ull;
-        if (params->len >= 2) {
-            err = get_param(params, 1)->val_ull;
-        } else {
-            err = 0;
-        }
-
-        /* Convert GDB error numbers back to host error numbers. */
-#define E(X)  case GDB_E##X: err = E##X; break
-        switch (err) {
-        case 0:
-            break;
-        E(PERM);
-        E(NOENT);
-        E(INTR);
-        E(BADF);
-        E(ACCES);
-        E(FAULT);
-        E(BUSY);
-        E(EXIST);
-        E(NODEV);
-        E(NOTDIR);
-        E(ISDIR);
-        E(INVAL);
-        E(NFILE);
-        E(MFILE);
-        E(FBIG);
-        E(NOSPC);
-        E(SPIPE);
-        E(ROFS);
-        E(NAMETOOLONG);
-        default:
-            err = EINVAL;
-            break;
-        }
-#undef E
-
-        gdbserver_state.current_syscall_cb(gdbserver_state.c_cpu, ret, err);
-        gdbserver_state.current_syscall_cb = NULL;
-    }
-
-    if (params->len >= 3 && get_param(params, 2)->opcode == (uint8_t)'C') {
-        gdb_put_packet("T02");
-        return;
-    }
-
-    gdb_continue();
-}
 
 static void handle_step(GArray *params, void *user_ctx)
 {
@@ -1893,7 +1804,7 @@ static int gdb_handle_packet(const char *line_buf)
     case 'F':
         {
             static const GdbCmdParseEntry file_io_cmd_desc = {
-                .handler = handle_file_io,
+                .handler = gdb_handle_file_io,
                 .cmd = "F",
                 .cmd_startswith = 1,
                 .schema = "L,L,o0"
@@ -2061,88 +1972,6 @@ void gdb_set_stop_cpu(CPUState *cpu)
     gdbserver_state.g_cpu = cpu;
 }
 
-/* Send a gdb syscall request.
-   This accepts limited printf-style format specifiers, specifically:
-    %x  - target_ulong argument printed in hex.
-    %lx - 64-bit argument printed in hex.
-    %s  - string pointer (target_ulong) and length (int) pair.  */
-void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
-{
-    char *p;
-    char *p_end;
-    target_ulong addr;
-    uint64_t i64;
-
-    if (!gdb_attached()) {
-        return;
-    }
-
-    gdbserver_state.current_syscall_cb = cb;
-#ifndef CONFIG_USER_ONLY
-    vm_stop(RUN_STATE_DEBUG);
-#endif
-    p = &gdbserver_state.syscall_buf[0];
-    p_end = &gdbserver_state.syscall_buf[sizeof(gdbserver_state.syscall_buf)];
-    *(p++) = 'F';
-    while (*fmt) {
-        if (*fmt == '%') {
-            fmt++;
-            switch (*fmt++) {
-            case 'x':
-                addr = va_arg(va, target_ulong);
-                p += snprintf(p, p_end - p, TARGET_FMT_lx, addr);
-                break;
-            case 'l':
-                if (*(fmt++) != 'x')
-                    goto bad_format;
-                i64 = va_arg(va, uint64_t);
-                p += snprintf(p, p_end - p, "%" PRIx64, i64);
-                break;
-            case 's':
-                addr = va_arg(va, target_ulong);
-                p += snprintf(p, p_end - p, TARGET_FMT_lx "/%x",
-                              addr, va_arg(va, int));
-                break;
-            default:
-            bad_format:
-                error_report("gdbstub: Bad syscall format string '%s'",
-                             fmt - 1);
-                break;
-            }
-        } else {
-            *(p++) = *(fmt++);
-        }
-    }
-    *p = 0;
-#ifdef CONFIG_USER_ONLY
-    gdb_put_packet(gdbserver_state.syscall_buf);
-    /* Return control to gdb for it to process the syscall request.
-     * Since the protocol requires that gdb hands control back to us
-     * using a "here are the results" F packet, we don't need to check
-     * gdb_handlesig's return value (which is the signal to deliver if
-     * execution was resumed via a continue packet).
-     */
-    gdb_handlesig(gdbserver_state.c_cpu, 0);
-#else
-    /* In this case wait to send the syscall packet until notification that
-       the CPU has stopped.  This must be done because if the packet is sent
-       now the reply from the syscall request could be received while the CPU
-       is still in the running state, which can cause packets to be dropped
-       and state transition 'T' packets to be sent while the syscall is still
-       being processed.  */
-    qemu_cpu_kick(gdbserver_state.c_cpu);
-#endif
-}
-
-void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...)
-{
-    va_list va;
-
-    va_start(va, fmt);
-    gdb_do_syscallv(cb, fmt, va);
-    va_end(va);
-}
-
 void gdb_read_byte(uint8_t ch)
 {
     uint8_t reply;
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 5363ff066d..b7e3829ca0 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -15,6 +15,7 @@
 #include "qemu/error-report.h"
 #include "qemu/cutils.h"
 #include "exec/gdbstub.h"
+#include "gdbstub/syscalls.h"
 #include "exec/hwaddr.h"
 #include "exec/tb-flush.h"
 #include "sysemu/cpus.h"
@@ -111,9 +112,9 @@ static void gdb_vm_state_change(void *opaque, bool running, RunState state)
     if (running || gdbserver_state.state == RS_INACTIVE) {
         return;
     }
+
     /* Is there a GDB syscall waiting to be sent?  */
-    if (gdbserver_state.current_syscall_cb) {
-        gdb_put_packet(gdbserver_state.syscall_buf);
+    if (gdb_handled_syscall()) {
         return;
     }
 
@@ -377,7 +378,7 @@ int gdbserver_start(const char *device)
     }
     gdbserver_state.state = chr ? RS_IDLE : RS_INACTIVE;
     gdbserver_system_state.mon_chr = mon_chr;
-    gdbserver_state.current_syscall_cb = NULL;
+    gdb_syscall_reset();
 
     return 0;
 }
diff --git a/gdbstub/syscalls.c b/gdbstub/syscalls.c
new file mode 100644
index 0000000000..1b63a1d197
--- /dev/null
+++ b/gdbstub/syscalls.c
@@ -0,0 +1,227 @@
+/*
+ * GDB Syscall Handling
+ *
+ * GDB can execute syscalls on the guests behalf, currently used by
+ * the various semihosting extensions. As this interfaces with a guest
+ * ABI we need to build it per-guest (although in reality its a 32 or
+ * 64 bit target_ulong that is the only difference).
+ *
+ * Copyright (c) 2003-2005 Fabrice Bellard
+ * Copyright (c) 2023 Linaro Ltd
+ *
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "semihosting/semihost.h"
+#include "sysemu/runstate.h"
+#include "gdbstub/user.h"
+#include "gdbstub/syscalls.h"
+#include "trace.h"
+#include "internals.h"
+
+/* Syscall specific state */
+typedef struct {
+    char syscall_buf[256];
+    gdb_syscall_complete_cb current_syscall_cb;
+} GDBSyscallState;
+
+static GDBSyscallState gdbserver_syscall_state;
+
+/*
+ * Return true if there is a GDB currently connected to the stub
+ * and attached to a CPU
+ */
+static bool gdb_attached(void)
+{
+    return gdbserver_state.init && gdbserver_state.c_cpu;
+}
+
+static enum {
+    GDB_SYS_UNKNOWN,
+    GDB_SYS_ENABLED,
+    GDB_SYS_DISABLED,
+} gdb_syscall_mode;
+
+/* Decide if either remote gdb syscalls or native file IO should be used. */
+int use_gdb_syscalls(void)
+{
+    SemihostingTarget target = semihosting_get_target();
+    if (target == SEMIHOSTING_TARGET_NATIVE) {
+        /* -semihosting-config target=native */
+        return false;
+    } else if (target == SEMIHOSTING_TARGET_GDB) {
+        /* -semihosting-config target=gdb */
+        return true;
+    }
+
+    /* -semihosting-config target=auto */
+    /* On the first call check if gdb is connected and remember. */
+    if (gdb_syscall_mode == GDB_SYS_UNKNOWN) {
+        gdb_syscall_mode = gdb_attached() ? GDB_SYS_ENABLED : GDB_SYS_DISABLED;
+    }
+    return gdb_syscall_mode == GDB_SYS_ENABLED;
+}
+
+/* called when the stub detaches */
+void gdb_disable_syscalls(void)
+{
+    gdb_syscall_mode = GDB_SYS_DISABLED;
+}
+
+void gdb_syscall_reset(void)
+{
+    gdbserver_syscall_state.current_syscall_cb = NULL;
+}
+
+bool gdb_handled_syscall(void)
+{
+    if (gdbserver_syscall_state.current_syscall_cb) {
+        gdb_put_packet(gdbserver_syscall_state.syscall_buf);
+        return true;
+    }
+
+    return false;
+}
+
+/* Send a gdb syscall request.
+   This accepts limited printf-style format specifiers, specifically:
+    %x  - target_ulong argument printed in hex.
+    %lx - 64-bit argument printed in hex.
+    %s  - string pointer (target_ulong) and length (int) pair.  */
+void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
+{
+    char *p;
+    char *p_end;
+    target_ulong addr;
+    uint64_t i64;
+
+    if (!gdb_attached()) {
+        return;
+    }
+
+    gdbserver_syscall_state.current_syscall_cb = cb;
+#ifndef CONFIG_USER_ONLY
+    vm_stop(RUN_STATE_DEBUG);
+#endif
+    p = &gdbserver_syscall_state.syscall_buf[0];
+    p_end = &gdbserver_syscall_state.syscall_buf[sizeof(gdbserver_syscall_state.syscall_buf)];
+    *(p++) = 'F';
+    while (*fmt) {
+        if (*fmt == '%') {
+            fmt++;
+            switch (*fmt++) {
+            case 'x':
+                addr = va_arg(va, target_ulong);
+                p += snprintf(p, p_end - p, TARGET_FMT_lx, addr);
+                break;
+            case 'l':
+                if (*(fmt++) != 'x')
+                    goto bad_format;
+                i64 = va_arg(va, uint64_t);
+                p += snprintf(p, p_end - p, "%" PRIx64, i64);
+                break;
+            case 's':
+                addr = va_arg(va, target_ulong);
+                p += snprintf(p, p_end - p, TARGET_FMT_lx "/%x",
+                              addr, va_arg(va, int));
+                break;
+            default:
+            bad_format:
+                error_report("gdbstub: Bad syscall format string '%s'",
+                             fmt - 1);
+                break;
+            }
+        } else {
+            *(p++) = *(fmt++);
+        }
+    }
+    *p = 0;
+#ifdef CONFIG_USER_ONLY
+    gdb_put_packet(gdbserver_syscall_state.syscall_buf);
+    /* Return control to gdb for it to process the syscall request.
+     * Since the protocol requires that gdb hands control back to us
+     * using a "here are the results" F packet, we don't need to check
+     * gdb_handlesig's return value (which is the signal to deliver if
+     * execution was resumed via a continue packet).
+     */
+    gdb_handlesig(gdbserver_state.c_cpu, 0);
+#else
+    /* In this case wait to send the syscall packet until notification that
+       the CPU has stopped.  This must be done because if the packet is sent
+       now the reply from the syscall request could be received while the CPU
+       is still in the running state, which can cause packets to be dropped
+       and state transition 'T' packets to be sent while the syscall is still
+       being processed.  */
+    qemu_cpu_kick(gdbserver_state.c_cpu);
+#endif
+}
+
+void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...)
+{
+    va_list va;
+
+    va_start(va, fmt);
+    gdb_do_syscallv(cb, fmt, va);
+    va_end(va);
+}
+
+/*
+ * GDB Command Handlers
+ */
+
+void gdb_handle_file_io(GArray *params, void *user_ctx)
+{
+    if (params->len >= 1 && gdbserver_syscall_state.current_syscall_cb) {
+        uint64_t ret;
+        int err;
+
+        ret = get_param(params, 0)->val_ull;
+        if (params->len >= 2) {
+            err = get_param(params, 1)->val_ull;
+        } else {
+            err = 0;
+        }
+
+        /* Convert GDB error numbers back to host error numbers. */
+#define E(X)  case GDB_E##X: err = E##X; break
+        switch (err) {
+        case 0:
+            break;
+        E(PERM);
+        E(NOENT);
+        E(INTR);
+        E(BADF);
+        E(ACCES);
+        E(FAULT);
+        E(BUSY);
+        E(EXIST);
+        E(NODEV);
+        E(NOTDIR);
+        E(ISDIR);
+        E(INVAL);
+        E(NFILE);
+        E(MFILE);
+        E(FBIG);
+        E(NOSPC);
+        E(SPIPE);
+        E(ROFS);
+        E(NAMETOOLONG);
+        default:
+            err = EINVAL;
+            break;
+        }
+#undef E
+
+        gdbserver_syscall_state.current_syscall_cb(gdbserver_state.c_cpu, ret, err);
+        gdbserver_syscall_state.current_syscall_cb = NULL;
+    }
+
+    if (params->len >= 3 && get_param(params, 2)->opcode == (uint8_t)'C') {
+        gdb_put_packet("T02");
+        return;
+    }
+
+    gdb_continue();
+}
diff --git a/gdbstub/user.c b/gdbstub/user.c
index a716ad05b2..cc7eeb9afb 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -15,6 +15,7 @@
 #include "exec/hwaddr.h"
 #include "exec/tb-flush.h"
 #include "exec/gdbstub.h"
+#include "gdbstub/syscalls.h"
 #include "gdbstub/user.h"
 #include "hw/core/cpu.h"
 #include "trace.h"
diff --git a/linux-user/exit.c b/linux-user/exit.c
index 607b6da9fc..fd49d76f45 100644
--- a/linux-user/exit.c
+++ b/linux-user/exit.c
@@ -18,7 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "accel/tcg/perf.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/syscalls.h"
 #include "qemu.h"
 #include "user-internals.h"
 #ifdef CONFIG_GPROF
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 62d8bae97f..564fe17f75 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -34,6 +34,7 @@
 #include "qemu/osdep.h"
 #include "qemu/timer.h"
 #include "exec/gdbstub.h"
+#include "gdbstub/syscalls.h"
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
 #include "semihosting/common-semi.h"
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index b05c52f26f..acb86b50dd 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -9,7 +9,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/syscalls.h"
 #include "semihosting/semihost.h"
 #include "semihosting/guestfd.h"
 #ifdef CONFIG_USER_ONLY
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index d69078899a..42080ffdda 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -7,8 +7,8 @@
  */
 
 #include "qemu/osdep.h"
-#include "exec/gdbstub.h"
 #include "cpu.h"
+#include "gdbstub/syscalls.h"
 #include "semihosting/guestfd.h"
 #include "semihosting/syscalls.h"
 #include "semihosting/console.h"
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index f9ad88e6a7..6ee622841d 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -30,7 +30,7 @@
 #include "crypto/cipher.h"
 #include "crypto/init.h"
 #include "exec/cpu-common.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/syscalls.h"
 #include "hw/boards.h"
 #include "migration/misc.h"
 #include "migration/postcopy-ram.h"
diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index f753710d7d..88ad9ba814 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/syscalls.h"
 #include "gdbstub/helpers.h"
 #include "semihosting/syscalls.h"
 #include "semihosting/softmmu-uaccess.h"
diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 4e6e759057..f3735df7b9 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "qemu/log.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/syscalls.h"
 #include "gdbstub/helpers.h"
 #include "semihosting/softmmu-uaccess.h"
 #include "semihosting/semihost.h"
diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index 113b3f22aa..3738774976 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -23,7 +23,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/syscalls.h"
 #include "gdbstub/helpers.h"
 #include "semihosting/syscalls.h"
 #include "semihosting/softmmu-uaccess.h"
diff --git a/gdbstub/meson.build b/gdbstub/meson.build
index 827f062af6..56c40c25ef 100644
--- a/gdbstub/meson.build
+++ b/gdbstub/meson.build
@@ -5,6 +5,10 @@
 #
 
 specific_ss.add(files('gdbstub.c'))
+
+# These have to built to the target ABI
+specific_ss.add(files('syscalls.c'))
+
 softmmu_ss.add(files('softmmu.c'))
 user_ss.add(files('user.c'))
 
-- 
2.39.1


