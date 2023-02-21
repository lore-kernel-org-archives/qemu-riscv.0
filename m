Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUbVN-0007fA-Cd
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 17:53:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbVF-0007XX-LY
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 17:52:54 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbUy-00047N-2J
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 17:52:53 -0500
Received: by mail-wr1-x42b.google.com with SMTP id l25so5625178wrb.3
 for <qemu-riscv@nongnu.org>; Tue, 21 Feb 2023 14:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GF1Zpfcve20fYcKqemvWCLSo69XTi83E3g6L19Nahew=;
 b=OolpMWpoAcf4FFpMfCYST3KF6K77oEPtNyqkXYFFaaX5yZ7iAeUJhyr6sHDGSSohu6
 iWAApyozZM57JrL2KeoK+IWtdMLSEbgEb2pPyIN6WADBBA2jaKxhlC8C8lRylBqXZJHU
 e2zWFP/yNc4BofnbdD7xjJuFzpCvAYYEPSnyBhbmt7H3/Q1jtWWWcJVKo/FIpbE/EFce
 WMigQWDotTESpwSGrZWLqautPwANYenVtSrKZLHuYlEdLTWGwm1AX2UtOhnyT0iBZPnZ
 GI98XZsNAZ3j//3oE8OErNqLuaoS+bb8Bg94pjTF/6auavpAfQiB1K0x0XcklTZdm5i4
 vuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GF1Zpfcve20fYcKqemvWCLSo69XTi83E3g6L19Nahew=;
 b=JgADSefSL/Hk9KcQE4QAJEszwZLVB/+MqKcAT3w9QDobCkfY3kIP6wbs7huYgyS0Tr
 JcS39YJ/yKSR+o/GZl8gHvAAjrX2/ocJeitoLjwMwqBG9wuIkAPmk5y/yJSX/ugJ3gvq
 grJmHuOkCs0gQPX6u9whDLCyY1yzsUy+zZ/fSY93EWTu88sJqNm+HodovCJiSh+g1LQ+
 WkbvonPzrAg9/6pDIMKqEoYKfBbjsKjFAwguDj5UID08g9HJmOmsQMk3/yo1rwKpdbRT
 D9J7fCo3Q0Fr7FUanIUmUc9j7F7BfYzZKpRbN1QNNFcjrMVp44eMOmm/2l4/GZcCLkev
 XtJw==
X-Gm-Message-State: AO0yUKU3MAviWpV8b3IPIVweD8iV5VnAcOqLaAxF0dA5NF2Gaq7+qDhE
 YmFafeWHh8pfgt+uWxcUiOVYQA==
X-Google-Smtp-Source: AK7set8M1RroRWfjjLhAebjS7rz8FRQBlTUc/Qe7iB7r/n9OVhNi7PKYyPsfpPK2u1j7raSaNJecLg==
X-Received: by 2002:a05:6000:14e:b0:2bf:dcdc:afb8 with SMTP id
 r14-20020a056000014e00b002bfdcdcafb8mr5706780wrx.64.1677019953582; 
 Tue, 21 Feb 2023 14:52:33 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a5d4c4d000000b002c55de1c72bsm9417774wrt.62.2023.02.21.14.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 14:52:31 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 79DF91FFC0;
 Tue, 21 Feb 2023 22:52:28 +0000 (GMT)
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v3 09/24] gdbstub: move chunk of softmmu functionality to own
 file
Date: Tue, 21 Feb 2023 22:52:12 +0000
Message-Id: <20230221225227.3735319-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221225227.3735319-1-alex.bennee@linaro.org>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
X-List-Received-Date: Tue, 21 Feb 2023 22:52:54 -0000

This is mostly code motion but a number of things needed to be done
for this minimal patch set:

  - move shared structures to internals.h
  - splitting some functions into user and softmmu versions
  - fixing a few casting issues to keep softmmu common

More CONFIG_USER_ONLY stuff will be handled in a following patches.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - rebase fixes
  - move extern to internals.h
---
 gdbstub/internals.h  |  43 ++++-
 gdbstub/gdbstub.c    | 421 +------------------------------------------
 gdbstub/softmmu.c    | 415 ++++++++++++++++++++++++++++++++++++++++++
 gdbstub/trace-events |   4 +-
 4 files changed, 470 insertions(+), 413 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 73e454edfe..c889f52beb 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -15,6 +15,18 @@
  * Shared structures and definitions
  */
 
+enum {
+    GDB_SIGNAL_0 = 0,
+    GDB_SIGNAL_INT = 2,
+    GDB_SIGNAL_QUIT = 3,
+    GDB_SIGNAL_TRAP = 5,
+    GDB_SIGNAL_ABRT = 6,
+    GDB_SIGNAL_ALRM = 14,
+    GDB_SIGNAL_IO = 23,
+    GDB_SIGNAL_XCPU = 24,
+    GDB_SIGNAL_UNKNOWN = 143
+};
+
 typedef struct GDBProcess {
     uint32_t pid;
     bool attached;
@@ -55,6 +67,8 @@ typedef struct GDBState {
     int supported_sstep_flags;
 } GDBState;
 
+/* lives in main gdbstub.c */
+extern GDBState gdbserver_state;
 
 /*
  * Inline utility function, convert from int to hex and back
@@ -99,7 +113,6 @@ CPUState *gdb_first_attached_cpu(void);
 void gdb_append_thread_id(CPUState *cpu, GString *buf);
 int gdb_get_cpu_index(CPUState *cpu);
 
-void gdb_init_gdbserver_state(void);
 void gdb_create_default_process(GDBState *s);
 
 /*
@@ -107,6 +120,34 @@ void gdb_create_default_process(GDBState *s);
  */
 void gdb_put_buffer(const uint8_t *buf, int len);
 
+/*
+ * Command handlers - either softmmu or user only
+ */
+void gdb_init_gdbserver_state(void);
+
+typedef enum GDBThreadIdKind {
+    GDB_ONE_THREAD = 0,
+    GDB_ALL_THREADS,     /* One process, all threads */
+    GDB_ALL_PROCESSES,
+    GDB_READ_THREAD_ERR
+} GDBThreadIdKind;
+
+typedef union GdbCmdVariant {
+    const char *data;
+    uint8_t opcode;
+    unsigned long val_ul;
+    unsigned long long val_ull;
+    struct {
+        GDBThreadIdKind kind;
+        uint32_t pid;
+        uint32_t tid;
+    } thread_id;
+} GdbCmdVariant;
+
+#define get_param(p, i)    (&g_array_index(p, GdbCmdVariant, i))
+
+void gdb_handle_query_rcmd(GArray *params, void *user_ctx); /* softmmu */
+
 /*
  * Break/Watch point support - there is an implementation for softmmu
  * and user mode.
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 41414d89bc..817fe5e61a 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -24,8 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qapi/error.h"
-#include "qemu/error-report.h"
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
 #include "qemu/module.h"
@@ -34,9 +32,6 @@
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 #else
-#include "monitor/monitor.h"
-#include "chardev/char.h"
-#include "chardev/char-fe.h"
 #include "hw/cpu/cluster.h"
 #include "hw/boards.h"
 #endif
@@ -88,30 +83,15 @@ static inline int target_memory_rw_debug(CPUState *cpu, target_ulong addr,
 /*
  * Return the GDB index for a given vCPU state.
  *
- * For user mode this is simply the thread id. In system mode GDB
- * numbers CPUs from 1 as 0 is reserved as an "any cpu" index.
+ * For user mode this is simply the thread id.
  */
+#if defined(CONFIG_USER_ONLY)
 int gdb_get_cpu_index(CPUState *cpu)
 {
-#if defined(CONFIG_USER_ONLY)
     TaskState *ts = (TaskState *) cpu->opaque;
     return ts ? ts->ts_tid : -1;
-#else
-    return cpu->cpu_index + 1;
-#endif
 }
-
-enum {
-    GDB_SIGNAL_0 = 0,
-    GDB_SIGNAL_INT = 2,
-    GDB_SIGNAL_QUIT = 3,
-    GDB_SIGNAL_TRAP = 5,
-    GDB_SIGNAL_ABRT = 6,
-    GDB_SIGNAL_ALRM = 14,
-    GDB_SIGNAL_IO = 23,
-    GDB_SIGNAL_XCPU = 24,
-    GDB_SIGNAL_UNKNOWN = 143
-};
+#endif
 
 #ifdef CONFIG_USER_ONLY
 
@@ -333,15 +313,9 @@ typedef struct {
     int running_state;
 } GDBUserState;
 static GDBUserState gdbserver_user_state;
-#else
-typedef struct {
-    CharBackend chr;
-    Chardev *mon_chr;
-} GDBSystemState;
-static GDBSystemState gdbserver_system_state;
 #endif
 
-static GDBState gdbserver_state;
+GDBState gdbserver_state;
 
 void gdb_init_gdbserver_state(void)
 {
@@ -362,15 +336,6 @@ void gdb_init_gdbserver_state(void)
     gdbserver_state.sstep_flags &= gdbserver_state.supported_sstep_flags;
 }
 
-#ifndef CONFIG_USER_ONLY
-static void reset_gdbserver_state(void)
-{
-    g_free(gdbserver_state.processes);
-    gdbserver_state.processes = NULL;
-    gdbserver_state.process_num = 0;
-}
-#endif
-
 bool gdb_has_xml;
 
 #ifdef CONFIG_USER_ONLY
@@ -446,7 +411,7 @@ static bool stub_can_reverse(void)
 }
 
 /* Resume execution.  */
-static inline void gdb_continue(void)
+static void gdb_continue(void)
 {
 
 #ifdef CONFIG_USER_ONLY
@@ -525,9 +490,9 @@ static int gdb_continue_partial(char *newstates)
     return res;
 }
 
+#ifdef CONFIG_USER_ONLY
 void gdb_put_buffer(const uint8_t *buf, int len)
 {
-#ifdef CONFIG_USER_ONLY
     int ret;
 
     while (len > 0) {
@@ -540,12 +505,8 @@ void gdb_put_buffer(const uint8_t *buf, int len)
             len -= ret;
         }
     }
-#else
-    /* XXX this blocks entire thread. Rewrite to use
-     * qemu_chr_fe_write and background I/O callbacks */
-    qemu_chr_fe_write_all(&gdbserver_system_state.chr, buf, len);
-#endif
 }
+#endif
 
 /* writes 2*len+1 bytes in buf */
 void gdb_memtohex(GString *buf, const uint8_t *mem, int len)
@@ -993,13 +954,6 @@ void gdb_append_thread_id(CPUState *cpu, GString *buf)
     }
 }
 
-typedef enum GDBThreadIdKind {
-    GDB_ONE_THREAD = 0,
-    GDB_ALL_THREADS,     /* One process, all threads */
-    GDB_ALL_PROCESSES,
-    GDB_READ_THREAD_ERR
-} GDBThreadIdKind;
-
 static GDBThreadIdKind read_thread_id(const char *buf, const char **end_buf,
                                       uint32_t *pid, uint32_t *tid)
 {
@@ -1180,20 +1134,6 @@ out:
     return res;
 }
 
-typedef union GdbCmdVariant {
-    const char *data;
-    uint8_t opcode;
-    unsigned long val_ul;
-    unsigned long long val_ull;
-    struct {
-        GDBThreadIdKind kind;
-        uint32_t pid;
-        uint32_t tid;
-    } thread_id;
-} GdbCmdVariant;
-
-#define get_param(p, i)    (&g_array_index(p, GdbCmdVariant, i))
-
 static const char *cmd_next_param(const char *param, const char delimiter)
 {
     static const char all_delimiters[] = ",;:=";
@@ -2024,32 +1964,6 @@ static void handle_query_offsets(GArray *params, void *user_ctx)
                     ts->info->data_offset);
     gdb_put_strbuf();
 }
-#else
-static void handle_query_rcmd(GArray *params, void *user_ctx)
-{
-    const guint8 zero = 0;
-    int len;
-
-    if (!params->len) {
-        gdb_put_packet("E22");
-        return;
-    }
-
-    len = strlen(get_param(params, 0)->data);
-    if (len % 2) {
-        gdb_put_packet("E01");
-        return;
-    }
-
-    g_assert(gdbserver_state.mem_buf->len == 0);
-    len = len / 2;
-    gdb_hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
-    g_byte_array_append(gdbserver_state.mem_buf, &zero, 1);
-    qemu_chr_be_write(gdbserver_system_state.mon_chr,
-                      gdbserver_state.mem_buf->data,
-                      gdbserver_state.mem_buf->len);
-    gdb_put_packet("OK");
-}
 #endif
 
 static void handle_query_supported(GArray *params, void *user_ctx)
@@ -2263,7 +2177,7 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
     },
 #else
     {
-        .handler = handle_query_rcmd,
+        .handler = gdb_handle_query_rcmd,
         .cmd = "Rcmd,",
         .cmd_startswith = 1,
         .schema = "s0"
@@ -2647,100 +2561,6 @@ void gdb_set_stop_cpu(CPUState *cpu)
     gdbserver_state.g_cpu = cpu;
 }
 
-#ifndef CONFIG_USER_ONLY
-static void gdb_vm_state_change(void *opaque, bool running, RunState state)
-{
-    CPUState *cpu = gdbserver_state.c_cpu;
-    g_autoptr(GString) buf = g_string_new(NULL);
-    g_autoptr(GString) tid = g_string_new(NULL);
-    const char *type;
-    int ret;
-
-    if (running || gdbserver_state.state == RS_INACTIVE) {
-        return;
-    }
-    /* Is there a GDB syscall waiting to be sent?  */
-    if (gdbserver_state.current_syscall_cb) {
-        gdb_put_packet(gdbserver_state.syscall_buf);
-        return;
-    }
-
-    if (cpu == NULL) {
-        /* No process attached */
-        return;
-    }
-
-    gdb_append_thread_id(cpu, tid);
-
-    switch (state) {
-    case RUN_STATE_DEBUG:
-        if (cpu->watchpoint_hit) {
-            switch (cpu->watchpoint_hit->flags & BP_MEM_ACCESS) {
-            case BP_MEM_READ:
-                type = "r";
-                break;
-            case BP_MEM_ACCESS:
-                type = "a";
-                break;
-            default:
-                type = "";
-                break;
-            }
-            trace_gdbstub_hit_watchpoint(type, gdb_get_cpu_index(cpu),
-                    (target_ulong)cpu->watchpoint_hit->vaddr);
-            g_string_printf(buf, "T%02xthread:%s;%swatch:" TARGET_FMT_lx ";",
-                            GDB_SIGNAL_TRAP, tid->str, type,
-                            (target_ulong)cpu->watchpoint_hit->vaddr);
-            cpu->watchpoint_hit = NULL;
-            goto send_packet;
-        } else {
-            trace_gdbstub_hit_break();
-        }
-        tb_flush(cpu);
-        ret = GDB_SIGNAL_TRAP;
-        break;
-    case RUN_STATE_PAUSED:
-        trace_gdbstub_hit_paused();
-        ret = GDB_SIGNAL_INT;
-        break;
-    case RUN_STATE_SHUTDOWN:
-        trace_gdbstub_hit_shutdown();
-        ret = GDB_SIGNAL_QUIT;
-        break;
-    case RUN_STATE_IO_ERROR:
-        trace_gdbstub_hit_io_error();
-        ret = GDB_SIGNAL_IO;
-        break;
-    case RUN_STATE_WATCHDOG:
-        trace_gdbstub_hit_watchdog();
-        ret = GDB_SIGNAL_ALRM;
-        break;
-    case RUN_STATE_INTERNAL_ERROR:
-        trace_gdbstub_hit_internal_error();
-        ret = GDB_SIGNAL_ABRT;
-        break;
-    case RUN_STATE_SAVE_VM:
-    case RUN_STATE_RESTORE_VM:
-        return;
-    case RUN_STATE_FINISH_MIGRATE:
-        ret = GDB_SIGNAL_XCPU;
-        break;
-    default:
-        trace_gdbstub_hit_unknown(state);
-        ret = GDB_SIGNAL_UNKNOWN;
-        break;
-    }
-    gdb_set_stop_cpu(cpu);
-    g_string_printf(buf, "T%02xthread:%s;", ret, tid->str);
-
-send_packet:
-    gdb_put_packet(buf->str);
-
-    /* disable single step if it was enabled */
-    cpu_single_step(cpu, 0);
-}
-#endif
-
 /* Send a gdb syscall request.
    This accepts limited printf-style format specifiers, specifically:
     %x  - target_ulong argument printed in hex.
@@ -2970,6 +2790,7 @@ void gdb_read_byte(uint8_t ch)
     }
 }
 
+#ifdef CONFIG_USER_ONLY
 /* Tell the remote gdb that the process has exited.  */
 void gdb_exit(int code)
 {
@@ -2978,24 +2799,19 @@ void gdb_exit(int code)
   if (!gdbserver_state.init) {
       return;
   }
-#ifdef CONFIG_USER_ONLY
   if (gdbserver_user_state.socket_path) {
       unlink(gdbserver_user_state.socket_path);
   }
   if (gdbserver_user_state.fd < 0) {
       return;
   }
-#endif
 
   trace_gdbstub_op_exiting((uint8_t)code);
 
   snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
   gdb_put_packet(buf);
-
-#ifndef CONFIG_USER_ONLY
-  qemu_chr_fe_deinit(&gdbserver_system_state.chr, true);
-#endif
 }
+#endif
 
 /*
  * Create the process that will contain all the "orphan" CPUs (that are not
@@ -3249,221 +3065,4 @@ void gdbserver_fork(CPUState *cpu)
     cpu_breakpoint_remove_all(cpu, BP_GDB);
     cpu_watchpoint_remove_all(cpu, BP_GDB);
 }
-#else
-static int gdb_chr_can_receive(void *opaque)
-{
-  /* We can handle an arbitrarily large amount of data.
-   Pick the maximum packet size, which is as good as anything.  */
-  return MAX_PACKET_LENGTH;
-}
-
-static void gdb_chr_receive(void *opaque, const uint8_t *buf, int size)
-{
-    int i;
-
-    for (i = 0; i < size; i++) {
-        gdb_read_byte(buf[i]);
-    }
-}
-
-static void gdb_chr_event(void *opaque, QEMUChrEvent event)
-{
-    int i;
-    GDBState *s = (GDBState *) opaque;
-
-    switch (event) {
-    case CHR_EVENT_OPENED:
-        /* Start with first process attached, others detached */
-        for (i = 0; i < s->process_num; i++) {
-            s->processes[i].attached = !i;
-        }
-
-        s->c_cpu = gdb_first_attached_cpu();
-        s->g_cpu = s->c_cpu;
-
-        vm_stop(RUN_STATE_PAUSED);
-        replay_gdb_attached();
-        gdb_has_xml = false;
-        break;
-    default:
-        break;
-    }
-}
-
-static int gdb_monitor_write(Chardev *chr, const uint8_t *buf, int len)
-{
-    g_autoptr(GString) hex_buf = g_string_new("O");
-    gdb_memtohex(hex_buf, buf, len);
-    gdb_put_packet(hex_buf->str);
-    return len;
-}
-
-#ifndef _WIN32
-static void gdb_sigterm_handler(int signal)
-{
-    if (runstate_is_running()) {
-        vm_stop(RUN_STATE_PAUSED);
-    }
-}
-#endif
-
-static void gdb_monitor_open(Chardev *chr, ChardevBackend *backend,
-                             bool *be_opened, Error **errp)
-{
-    *be_opened = false;
-}
-
-static void char_gdb_class_init(ObjectClass *oc, void *data)
-{
-    ChardevClass *cc = CHARDEV_CLASS(oc);
-
-    cc->internal = true;
-    cc->open = gdb_monitor_open;
-    cc->chr_write = gdb_monitor_write;
-}
-
-#define TYPE_CHARDEV_GDB "chardev-gdb"
-
-static const TypeInfo char_gdb_type_info = {
-    .name = TYPE_CHARDEV_GDB,
-    .parent = TYPE_CHARDEV,
-    .class_init = char_gdb_class_init,
-};
-
-static int find_cpu_clusters(Object *child, void *opaque)
-{
-    if (object_dynamic_cast(child, TYPE_CPU_CLUSTER)) {
-        GDBState *s = (GDBState *) opaque;
-        CPUClusterState *cluster = CPU_CLUSTER(child);
-        GDBProcess *process;
-
-        s->processes = g_renew(GDBProcess, s->processes, ++s->process_num);
-
-        process = &s->processes[s->process_num - 1];
-
-        /*
-         * GDB process IDs -1 and 0 are reserved. To avoid subtle errors at
-         * runtime, we enforce here that the machine does not use a cluster ID
-         * that would lead to PID 0.
-         */
-        assert(cluster->cluster_id != UINT32_MAX);
-        process->pid = cluster->cluster_id + 1;
-        process->attached = false;
-        process->target_xml[0] = '\0';
-
-        return 0;
-    }
-
-    return object_child_foreach(child, find_cpu_clusters, opaque);
-}
-
-static int pid_order(const void *a, const void *b)
-{
-    GDBProcess *pa = (GDBProcess *) a;
-    GDBProcess *pb = (GDBProcess *) b;
-
-    if (pa->pid < pb->pid) {
-        return -1;
-    } else if (pa->pid > pb->pid) {
-        return 1;
-    } else {
-        return 0;
-    }
-}
-
-static void create_processes(GDBState *s)
-{
-    object_child_foreach(object_get_root(), find_cpu_clusters, s);
-
-    if (gdbserver_state.processes) {
-        /* Sort by PID */
-        qsort(gdbserver_state.processes, gdbserver_state.process_num, sizeof(gdbserver_state.processes[0]), pid_order);
-    }
-
-    gdb_create_default_process(s);
-}
-
-int gdbserver_start(const char *device)
-{
-    trace_gdbstub_op_start(device);
-
-    char gdbstub_device_name[128];
-    Chardev *chr = NULL;
-    Chardev *mon_chr;
-
-    if (!first_cpu) {
-        error_report("gdbstub: meaningless to attach gdb to a "
-                     "machine without any CPU.");
-        return -1;
-    }
-
-    if (!gdb_supports_guest_debug()) {
-        error_report("gdbstub: current accelerator doesn't support guest debugging");
-        return -1;
-    }
-
-    if (!device)
-        return -1;
-    if (strcmp(device, "none") != 0) {
-        if (strstart(device, "tcp:", NULL)) {
-            /* enforce required TCP attributes */
-            snprintf(gdbstub_device_name, sizeof(gdbstub_device_name),
-                     "%s,wait=off,nodelay=on,server=on", device);
-            device = gdbstub_device_name;
-        }
-#ifndef _WIN32
-        else if (strcmp(device, "stdio") == 0) {
-            struct sigaction act;
-
-            memset(&act, 0, sizeof(act));
-            act.sa_handler = gdb_sigterm_handler;
-            sigaction(SIGINT, &act, NULL);
-        }
-#endif
-        /*
-         * FIXME: it's a bit weird to allow using a mux chardev here
-         * and implicitly setup a monitor. We may want to break this.
-         */
-        chr = qemu_chr_new_noreplay("gdb", device, true, NULL);
-        if (!chr)
-            return -1;
-    }
-
-    if (!gdbserver_state.init) {
-        gdb_init_gdbserver_state();
-
-        qemu_add_vm_change_state_handler(gdb_vm_state_change, NULL);
-
-        /* Initialize a monitor terminal for gdb */
-        mon_chr = qemu_chardev_new(NULL, TYPE_CHARDEV_GDB,
-                                   NULL, NULL, &error_abort);
-        monitor_init_hmp(mon_chr, false, &error_abort);
-    } else {
-        qemu_chr_fe_deinit(&gdbserver_system_state.chr, true);
-        mon_chr = gdbserver_system_state.mon_chr;
-        reset_gdbserver_state();
-    }
-
-    create_processes(&gdbserver_state);
-
-    if (chr) {
-        qemu_chr_fe_init(&gdbserver_system_state.chr, chr, &error_abort);
-        qemu_chr_fe_set_handlers(&gdbserver_system_state.chr,
-                                 gdb_chr_can_receive,
-                                 gdb_chr_receive, gdb_chr_event,
-                                 NULL, &gdbserver_state, NULL, true);
-    }
-    gdbserver_state.state = chr ? RS_IDLE : RS_INACTIVE;
-    gdbserver_system_state.mon_chr = mon_chr;
-    gdbserver_state.current_syscall_cb = NULL;
-
-    return 0;
-}
-
-static void register_types(void)
-{
-    type_register_static(&char_gdb_type_info);
-}
-
-type_init(register_types);
 #endif
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 183dfb40e4..0be5511ea7 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -11,11 +11,426 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/cutils.h"
 #include "exec/gdbstub.h"
 #include "exec/hwaddr.h"
+#include "exec/tb-flush.h"
 #include "sysemu/cpus.h"
+#include "sysemu/runstate.h"
+#include "sysemu/replay.h"
+#include "hw/core/cpu.h"
+#include "hw/cpu/cluster.h"
+#include "hw/boards.h"
+#include "chardev/char.h"
+#include "chardev/char-fe.h"
+#include "monitor/monitor.h"
+#include "trace.h"
 #include "internals.h"
 
+/* System emulation specific state */
+typedef struct {
+    CharBackend chr;
+    Chardev *mon_chr;
+} GDBSystemState;
+
+GDBSystemState gdbserver_system_state;
+
+static void reset_gdbserver_state(void)
+{
+    g_free(gdbserver_state.processes);
+    gdbserver_state.processes = NULL;
+    gdbserver_state.process_num = 0;
+}
+
+/*
+ * Return the GDB index for a given vCPU state.
+ *
+ * In system mode GDB numbers CPUs from 1 as 0 is reserved as an "any
+ * cpu" index.
+ */
+int gdb_get_cpu_index(CPUState *cpu)
+{
+    return cpu->cpu_index + 1;
+}
+
+/*
+ * GDB Connection management. For system emulation we do all of this
+ * via our existing Chardev infrastructure which allows us to support
+ * network and unix sockets.
+ */
+
+void gdb_put_buffer(const uint8_t *buf, int len)
+{
+    /* XXX this blocks entire thread. Rewrite to use
+     * qemu_chr_fe_write and background I/O callbacks */
+    qemu_chr_fe_write_all(&gdbserver_system_state.chr, buf, len);
+}
+
+static void gdb_chr_event(void *opaque, QEMUChrEvent event)
+{
+    int i;
+    GDBState *s = (GDBState *) opaque;
+
+    switch (event) {
+    case CHR_EVENT_OPENED:
+        /* Start with first process attached, others detached */
+        for (i = 0; i < s->process_num; i++) {
+            s->processes[i].attached = !i;
+        }
+
+        s->c_cpu = gdb_first_attached_cpu();
+        s->g_cpu = s->c_cpu;
+
+        vm_stop(RUN_STATE_PAUSED);
+        replay_gdb_attached();
+        gdb_has_xml = false;
+        break;
+    default:
+        break;
+    }
+}
+
+static void gdb_vm_state_change(void *opaque, bool running, RunState state)
+{
+    CPUState *cpu = gdbserver_state.c_cpu;
+    g_autoptr(GString) buf = g_string_new(NULL);
+    g_autoptr(GString) tid = g_string_new(NULL);
+    const char *type;
+    int ret;
+
+    if (running || gdbserver_state.state == RS_INACTIVE) {
+        return;
+    }
+    /* Is there a GDB syscall waiting to be sent?  */
+    if (gdbserver_state.current_syscall_cb) {
+        gdb_put_packet(gdbserver_state.syscall_buf);
+        return;
+    }
+
+    if (cpu == NULL) {
+        /* No process attached */
+        return;
+    }
+
+    gdb_append_thread_id(cpu, tid);
+
+    switch (state) {
+    case RUN_STATE_DEBUG:
+        if (cpu->watchpoint_hit) {
+            switch (cpu->watchpoint_hit->flags & BP_MEM_ACCESS) {
+            case BP_MEM_READ:
+                type = "r";
+                break;
+            case BP_MEM_ACCESS:
+                type = "a";
+                break;
+            default:
+                type = "";
+                break;
+            }
+            trace_gdbstub_hit_watchpoint(type,
+                                         gdb_get_cpu_index(cpu),
+                                         cpu->watchpoint_hit->vaddr);
+            g_string_printf(buf, "T%02xthread:%s;%swatch:%" VADDR_PRIx ";",
+                            GDB_SIGNAL_TRAP, tid->str, type,
+                            cpu->watchpoint_hit->vaddr);
+            cpu->watchpoint_hit = NULL;
+            goto send_packet;
+        } else {
+            trace_gdbstub_hit_break();
+        }
+        tb_flush(cpu);
+        ret = GDB_SIGNAL_TRAP;
+        break;
+    case RUN_STATE_PAUSED:
+        trace_gdbstub_hit_paused();
+        ret = GDB_SIGNAL_INT;
+        break;
+    case RUN_STATE_SHUTDOWN:
+        trace_gdbstub_hit_shutdown();
+        ret = GDB_SIGNAL_QUIT;
+        break;
+    case RUN_STATE_IO_ERROR:
+        trace_gdbstub_hit_io_error();
+        ret = GDB_SIGNAL_IO;
+        break;
+    case RUN_STATE_WATCHDOG:
+        trace_gdbstub_hit_watchdog();
+        ret = GDB_SIGNAL_ALRM;
+        break;
+    case RUN_STATE_INTERNAL_ERROR:
+        trace_gdbstub_hit_internal_error();
+        ret = GDB_SIGNAL_ABRT;
+        break;
+    case RUN_STATE_SAVE_VM:
+    case RUN_STATE_RESTORE_VM:
+        return;
+    case RUN_STATE_FINISH_MIGRATE:
+        ret = GDB_SIGNAL_XCPU;
+        break;
+    default:
+        trace_gdbstub_hit_unknown(state);
+        ret = GDB_SIGNAL_UNKNOWN;
+        break;
+    }
+    gdb_set_stop_cpu(cpu);
+    g_string_printf(buf, "T%02xthread:%s;", ret, tid->str);
+
+send_packet:
+    gdb_put_packet(buf->str);
+
+    /* disable single step if it was enabled */
+    cpu_single_step(cpu, 0);
+}
+
+#ifndef _WIN32
+static void gdb_sigterm_handler(int signal)
+{
+    if (runstate_is_running()) {
+        vm_stop(RUN_STATE_PAUSED);
+    }
+}
+#endif
+
+static int gdb_monitor_write(Chardev *chr, const uint8_t *buf, int len)
+{
+    g_autoptr(GString) hex_buf = g_string_new("O");
+    gdb_memtohex(hex_buf, buf, len);
+    gdb_put_packet(hex_buf->str);
+    return len;
+}
+
+static void gdb_monitor_open(Chardev *chr, ChardevBackend *backend,
+                             bool *be_opened, Error **errp)
+{
+    *be_opened = false;
+}
+
+static void char_gdb_class_init(ObjectClass *oc, void *data)
+{
+    ChardevClass *cc = CHARDEV_CLASS(oc);
+
+    cc->internal = true;
+    cc->open = gdb_monitor_open;
+    cc->chr_write = gdb_monitor_write;
+}
+
+#define TYPE_CHARDEV_GDB "chardev-gdb"
+
+static const TypeInfo char_gdb_type_info = {
+    .name = TYPE_CHARDEV_GDB,
+    .parent = TYPE_CHARDEV,
+    .class_init = char_gdb_class_init,
+};
+
+static int gdb_chr_can_receive(void *opaque)
+{
+  /* We can handle an arbitrarily large amount of data.
+   Pick the maximum packet size, which is as good as anything.  */
+  return MAX_PACKET_LENGTH;
+}
+
+static void gdb_chr_receive(void *opaque, const uint8_t *buf, int size)
+{
+    int i;
+
+    for (i = 0; i < size; i++) {
+        gdb_read_byte(buf[i]);
+    }
+}
+
+static int find_cpu_clusters(Object *child, void *opaque)
+{
+    if (object_dynamic_cast(child, TYPE_CPU_CLUSTER)) {
+        GDBState *s = (GDBState *) opaque;
+        CPUClusterState *cluster = CPU_CLUSTER(child);
+        GDBProcess *process;
+
+        s->processes = g_renew(GDBProcess, s->processes, ++s->process_num);
+
+        process = &s->processes[s->process_num - 1];
+
+        /*
+         * GDB process IDs -1 and 0 are reserved. To avoid subtle errors at
+         * runtime, we enforce here that the machine does not use a cluster ID
+         * that would lead to PID 0.
+         */
+        assert(cluster->cluster_id != UINT32_MAX);
+        process->pid = cluster->cluster_id + 1;
+        process->attached = false;
+        process->target_xml[0] = '\0';
+
+        return 0;
+    }
+
+    return object_child_foreach(child, find_cpu_clusters, opaque);
+}
+
+static int pid_order(const void *a, const void *b)
+{
+    GDBProcess *pa = (GDBProcess *) a;
+    GDBProcess *pb = (GDBProcess *) b;
+
+    if (pa->pid < pb->pid) {
+        return -1;
+    } else if (pa->pid > pb->pid) {
+        return 1;
+    } else {
+        return 0;
+    }
+}
+
+static void create_processes(GDBState *s)
+{
+    object_child_foreach(object_get_root(), find_cpu_clusters, s);
+
+    if (gdbserver_state.processes) {
+        /* Sort by PID */
+        qsort(gdbserver_state.processes,
+              gdbserver_state.process_num,
+              sizeof(gdbserver_state.processes[0]),
+              pid_order);
+    }
+
+    gdb_create_default_process(s);
+}
+
+int gdbserver_start(const char *device)
+{
+    trace_gdbstub_op_start(device);
+
+    char gdbstub_device_name[128];
+    Chardev *chr = NULL;
+    Chardev *mon_chr;
+
+    if (!first_cpu) {
+        error_report("gdbstub: meaningless to attach gdb to a "
+                     "machine without any CPU.");
+        return -1;
+    }
+
+    if (!gdb_supports_guest_debug()) {
+        error_report("gdbstub: current accelerator doesn't support guest debugging");
+        return -1;
+    }
+
+    if (!device)
+        return -1;
+    if (strcmp(device, "none") != 0) {
+        if (strstart(device, "tcp:", NULL)) {
+            /* enforce required TCP attributes */
+            snprintf(gdbstub_device_name, sizeof(gdbstub_device_name),
+                     "%s,wait=off,nodelay=on,server=on", device);
+            device = gdbstub_device_name;
+        }
+#ifndef _WIN32
+        else if (strcmp(device, "stdio") == 0) {
+            struct sigaction act;
+
+            memset(&act, 0, sizeof(act));
+            act.sa_handler = gdb_sigterm_handler;
+            sigaction(SIGINT, &act, NULL);
+        }
+#endif
+        /*
+         * FIXME: it's a bit weird to allow using a mux chardev here
+         * and implicitly setup a monitor. We may want to break this.
+         */
+        chr = qemu_chr_new_noreplay("gdb", device, true, NULL);
+        if (!chr)
+            return -1;
+    }
+
+    if (!gdbserver_state.init) {
+        gdb_init_gdbserver_state();
+
+        qemu_add_vm_change_state_handler(gdb_vm_state_change, NULL);
+
+        /* Initialize a monitor terminal for gdb */
+        mon_chr = qemu_chardev_new(NULL, TYPE_CHARDEV_GDB,
+                                   NULL, NULL, &error_abort);
+        monitor_init_hmp(mon_chr, false, &error_abort);
+    } else {
+        qemu_chr_fe_deinit(&gdbserver_system_state.chr, true);
+        mon_chr = gdbserver_system_state.mon_chr;
+        reset_gdbserver_state();
+    }
+
+    create_processes(&gdbserver_state);
+
+    if (chr) {
+        qemu_chr_fe_init(&gdbserver_system_state.chr, chr, &error_abort);
+        qemu_chr_fe_set_handlers(&gdbserver_system_state.chr,
+                                 gdb_chr_can_receive,
+                                 gdb_chr_receive, gdb_chr_event,
+                                 NULL, &gdbserver_state, NULL, true);
+    }
+    gdbserver_state.state = chr ? RS_IDLE : RS_INACTIVE;
+    gdbserver_system_state.mon_chr = mon_chr;
+    gdbserver_state.current_syscall_cb = NULL;
+
+    return 0;
+}
+
+static void register_types(void)
+{
+    type_register_static(&char_gdb_type_info);
+}
+
+type_init(register_types);
+
+/* Tell the remote gdb that the process has exited.  */
+void gdb_exit(int code)
+{
+  char buf[4];
+
+  if (!gdbserver_state.init) {
+      return;
+  }
+
+  trace_gdbstub_op_exiting((uint8_t)code);
+
+  snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
+  gdb_put_packet(buf);
+
+  qemu_chr_fe_deinit(&gdbserver_system_state.chr, true);
+}
+
+/*
+ * Softmmu specific command helpers
+ */
+void gdb_handle_query_rcmd(GArray *params, void *user_ctx)
+{
+    const guint8 zero = 0;
+    int len;
+
+    if (!params->len) {
+        gdb_put_packet("E22");
+        return;
+    }
+
+    len = strlen(get_param(params, 0)->data);
+    if (len % 2) {
+        gdb_put_packet("E01");
+        return;
+    }
+
+    g_assert(gdbserver_state.mem_buf->len == 0);
+    len = len / 2;
+    gdb_hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
+    g_byte_array_append(gdbserver_state.mem_buf, &zero, 1);
+    qemu_chr_be_write(gdbserver_system_state.mon_chr,
+                      gdbserver_state.mem_buf->data,
+                      gdbserver_state.mem_buf->len);
+    gdb_put_packet("OK");
+}
+
+/*
+ * Break/Watch point helpers
+ */
+
 bool gdb_supports_guest_debug(void)
 {
     const AccelOpsClass *ops = cpus_get_accel();
diff --git a/gdbstub/trace-events b/gdbstub/trace-events
index 03f0c303bf..0c18a4d70a 100644
--- a/gdbstub/trace-events
+++ b/gdbstub/trace-events
@@ -7,7 +7,6 @@ gdbstub_op_continue(void) "Continuing all CPUs"
 gdbstub_op_continue_cpu(int cpu_index) "Continuing CPU %d"
 gdbstub_op_stepping(int cpu_index) "Stepping CPU %d"
 gdbstub_op_extra_info(const char *info) "Thread extra info: %s"
-gdbstub_hit_watchpoint(const char *type, int cpu_gdb_index, uint64_t vaddr) "Watchpoint hit, type=\"%s\" cpu=%d, vaddr=0x%" PRIx64 ""
 gdbstub_hit_internal_error(void) "RUN_STATE_INTERNAL_ERROR"
 gdbstub_hit_break(void) "RUN_STATE_DEBUG"
 gdbstub_hit_paused(void) "RUN_STATE_PAUSED"
@@ -27,3 +26,6 @@ gdbstub_err_invalid_repeat(uint8_t ch) "got invalid RLE count: 0x%02x"
 gdbstub_err_invalid_rle(void) "got invalid RLE sequence"
 gdbstub_err_checksum_invalid(uint8_t ch) "got invalid command checksum digit: 0x%02x"
 gdbstub_err_checksum_incorrect(uint8_t expected, uint8_t got) "got command packet with incorrect checksum, expected=0x%02x, received=0x%02x"
+
+# softmmu.c
+gdbstub_hit_watchpoint(const char *type, int cpu_gdb_index, uint64_t vaddr) "Watchpoint hit, type=\"%s\" cpu=%d, vaddr=0x%" PRIx64 ""
-- 
2.39.1


