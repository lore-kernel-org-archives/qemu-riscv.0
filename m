Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDTLL-0007Ip-VT
	for mharc-qemu-riscv@gnu.org; Thu, 05 Jan 2023 11:43:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTLB-0007BY-P9
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:43:43 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTKx-0006wN-6L
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:43:41 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 g25-20020a7bc4d9000000b003d97c8d4941so1728774wmk.4
 for <qemu-riscv@nongnu.org>; Thu, 05 Jan 2023 08:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CIDSeyk+jWrwDPOPLe4pwVNwNB6LvgoIltJL9E83w90=;
 b=kk/1XEymGIrs8Idicou9dorRf4fQUKd9MZRUE7wwCoeY+pFJOjtjOzhhQatomUVwFs
 c6jQUyC+fPjoFRT/YsO+bsOU08TjeIgcqzSvejeGbNeXeJKHsO9AzlIVQOvL4v9KoLne
 G8u77fCkTNK1mBV9ybMbh2GMCrCDyaEVKPsepOfkkIjmlKjIHgDVfciFSkMSKirycidb
 0EXQGTuolXZBKyt5fvqTvBBV3TRtjayLt9iByBRGIsxsDBg4Pu09eT5oKzypHjbYJRoe
 ahYxKHtddnyiWxAIhanjqVIY/o54rcUKwddxBdW56ETlRH8r2Io9//N0f7bttbYTZl3b
 hJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CIDSeyk+jWrwDPOPLe4pwVNwNB6LvgoIltJL9E83w90=;
 b=MGyte8XEpmKl6dTjg4E5TNYM6jv3jfhjEJ3YCpPMvugkfQBgwKrJnwcBHAEhYyUYPQ
 uvQD5Recsc/Pd9NvAwiIrDzfyEAHZvKrj4vjzYaZFdKvrT8AoeJQ+U18jeFmLTCTkWAI
 6zcartaWvFMER4ismDlxs+TdZSVh697mygBBhnbKYjFpgvq7dWCvJl14B8Bfo81gaXqs
 I7Q5QVX/EH33uZ9AK0vXcWBXTu5S28/j60qUrhEtbu7t7Y25S5EWCfEtJOeBCT6eIC6S
 nJchU3Wl+N0zEYJmfoiQOShkjyjshmQ5N85/94v9p/PcG6aorMVDKB2ewb8C1xztuIXk
 xOnA==
X-Gm-Message-State: AFqh2koKw+pOD62b6Bx62KXZXkn5rFfwxeyeg/KXgPB1xFHS1cbvnddi
 OG8PAmPw7EGrBp798TtJ7e/3dA==
X-Google-Smtp-Source: AMrXdXu9l50cIhQV7a4JVt/CXoXHm2+8a45W928JbJIidnEI1knm7eGSgsaQAtzeNgd9Ffh9TmLwOw==
X-Received: by 2002:a05:600c:4255:b0:3d2:282a:e1f5 with SMTP id
 r21-20020a05600c425500b003d2282ae1f5mr35687823wmm.30.1672937006270; 
 Thu, 05 Jan 2023 08:43:26 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 s23-20020a1cf217000000b003d1e3b1624dsm2974916wmc.2.2023.01.05.08.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:43:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0CFD01FFC2;
 Thu,  5 Jan 2023 16:43:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Greg Kurz <groug@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v2 10/21] gdbstub: move chunk of softmmu functionality to own
 file
Date: Thu,  5 Jan 2023 16:43:09 +0000
Message-Id: <20230105164320.2164095-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105164320.2164095-1-alex.bennee@linaro.org>
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 05 Jan 2023 16:43:45 -0000

This is mostly code motion but a number of things needed to be done
for this minimal patch set:

  - move shared structures to internals.h
  - splitting some functions into user and softmmu versions
  - fixing a few casting issues to keep softmmu common

More CONFIG_USER_ONLY stuff will be handled in a following patches.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h  |  48 ++++-
 gdbstub/gdbstub.c    | 415 ++----------------------------------------
 gdbstub/softmmu.c    | 416 +++++++++++++++++++++++++++++++++++++++++++
 gdbstub/trace-events |   4 +-
 4 files changed, 469 insertions(+), 414 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 670bd01a1d..bbdc660233 100644
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
@@ -39,11 +51,6 @@ typedef struct {
     char *socket_path;
     int running_state;
 } GDBUserState;
-#else
-typedef struct {
-    CharBackend chr;
-    Chardev *mon_chr;
-} GDBSystemState;
 #endif
 
 typedef struct GDBState {
@@ -60,8 +67,6 @@ typedef struct GDBState {
     int signal;
 #ifdef CONFIG_USER_ONLY
     GDBUserState user;
-#else
-    GDBSystemState system;
 #endif
     bool multiprocess;
     GDBProcess *processes;
@@ -118,7 +123,6 @@ CPUState *gdb_first_attached_cpu(void);
 void gdb_append_thread_id(CPUState *cpu, GString *buf);
 int gdb_get_cpu_index(CPUState *cpu);
 
-void gdb_init_gdbserver_state(void);
 void gdb_create_default_process(GDBState *s);
 
 /*
@@ -126,6 +130,34 @@ void gdb_create_default_process(GDBState *s);
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
index 9c347cd84b..d9afee5879 100644
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
 
@@ -326,7 +306,7 @@ typedef struct GDBRegisterState {
     struct GDBRegisterState *next;
 } GDBRegisterState;
 
-static GDBState gdbserver_state;
+GDBState gdbserver_state;
 
 void gdb_init_gdbserver_state(void)
 {
@@ -347,15 +327,6 @@ void gdb_init_gdbserver_state(void)
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
@@ -431,7 +402,7 @@ static bool stub_can_reverse(void)
 }
 
 /* Resume execution.  */
-static inline void gdb_continue(void)
+static void gdb_continue(void)
 {
 
 #ifdef CONFIG_USER_ONLY
@@ -510,9 +481,9 @@ static int gdb_continue_partial(char *newstates)
     return res;
 }
 
+#ifdef CONFIG_USER_ONLY
 void gdb_put_buffer(const uint8_t *buf, int len)
 {
-#ifdef CONFIG_USER_ONLY
     int ret;
 
     while (len > 0) {
@@ -525,12 +496,8 @@ void gdb_put_buffer(const uint8_t *buf, int len)
             len -= ret;
         }
     }
-#else
-    /* XXX this blocks entire thread. Rewrite to use
-     * qemu_chr_fe_write and background I/O callbacks */
-    qemu_chr_fe_write_all(&gdbserver_state.system.chr, buf, len);
-#endif
 }
+#endif
 
 /* writes 2*len+1 bytes in buf */
 void gdb_memtohex(GString *buf, const uint8_t *mem, int len)
@@ -978,13 +945,6 @@ void gdb_append_thread_id(CPUState *cpu, GString *buf)
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
@@ -1165,20 +1125,6 @@ out:
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
@@ -2009,32 +1955,6 @@ static void handle_query_offsets(GArray *params, void *user_ctx)
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
-    qemu_chr_be_write(gdbserver_state.system.mon_chr,
-                      gdbserver_state.mem_buf->data,
-                      gdbserver_state.mem_buf->len);
-    gdb_put_packet("OK");
-}
 #endif
 
 static void handle_query_supported(GArray *params, void *user_ctx)
@@ -2248,7 +2168,7 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
     },
 #else
     {
-        .handler = handle_query_rcmd,
+        .handler = gdb_handle_query_rcmd,
         .cmd = "Rcmd,",
         .cmd_startswith = 1,
         .schema = "s0"
@@ -2632,100 +2552,6 @@ void gdb_set_stop_cpu(CPUState *cpu)
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
@@ -2955,6 +2781,7 @@ void gdb_read_byte(uint8_t ch)
     }
 }
 
+#ifdef CONFIG_USER_ONLY
 /* Tell the remote gdb that the process has exited.  */
 void gdb_exit(int code)
 {
@@ -2963,24 +2790,19 @@ void gdb_exit(int code)
   if (!gdbserver_state.init) {
       return;
   }
-#ifdef CONFIG_USER_ONLY
   if (gdbserver_state.user.socket_path) {
       unlink(gdbserver_state.user.socket_path);
   }
   if (gdbserver_state.user.fd < 0) {
       return;
   }
-#endif
 
   trace_gdbstub_op_exiting((uint8_t)code);
 
   snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
   gdb_put_packet(buf);
-
-#ifndef CONFIG_USER_ONLY
-  qemu_chr_fe_deinit(&gdbserver_state.system.chr, true);
-#endif
 }
+#endif
 
 /*
  * Create the process that will contain all the "orphan" CPUs (that are not
@@ -3234,221 +3056,4 @@ void gdbserver_fork(CPUState *cpu)
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
-        qemu_chr_fe_deinit(&gdbserver_state.system.chr, true);
-        mon_chr = gdbserver_state.system.mon_chr;
-        reset_gdbserver_state();
-    }
-
-    create_processes(&gdbserver_state);
-
-    if (chr) {
-        qemu_chr_fe_init(&gdbserver_state.system.chr, chr, &error_abort);
-        qemu_chr_fe_set_handlers(&gdbserver_state.system.chr,
-                                 gdb_chr_can_receive,
-                                 gdb_chr_receive, gdb_chr_event,
-                                 NULL, &gdbserver_state, NULL, true);
-    }
-    gdbserver_state.state = chr ? RS_IDLE : RS_INACTIVE;
-    gdbserver_state.system.mon_chr = mon_chr;
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
index 696894243b..3a88d0ebb4 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -11,13 +11,429 @@
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
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
+#include "monitor/monitor.h"
+#include "trace.h"
 #include "internals.h"
 
+/* Common state */
+extern GDBState gdbserver_state;
+
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
2.34.1


