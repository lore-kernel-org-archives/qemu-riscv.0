Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUbVJ-0007at-UC
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 17:52:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbVA-0007R2-Eu
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 17:52:48 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbUx-00046s-1b
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 17:52:48 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j2-20020a05600c1c0200b003e1e754657aso4837525wms.2
 for <qemu-riscv@nongnu.org>; Tue, 21 Feb 2023 14:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rurBkhAP42a+iSTKcpb98EEHSv7vknoHnWiv4mi4zUc=;
 b=Hx5IQ71U6ohmoICIxtTewKdiscNrJiJOnwVEdRK5vLQee7RM14YE/5xLy1EIdag5va
 CwTx6SrM/79BQ+5P9nzF8h3yaNFJS2kkqlSr9NhUA+4i+jjV+IB+NrjML3yuXpzjfxms
 OXK6GDM+FysrWbM+kk8Y5zrGbf/bsfD4PymBkZhpvUi1uv/mPG3Je8aaT0DUM4GMJKaX
 f7d4ITPRjsjfPOHq5abC86ZWv2bK/KmqBjzqAQjV/gZMgrappppAFzLZ5HjpaDGESAQY
 m1KNIEtVbQThvpwjR5XmVfg1L/VQGVzL9wiFIi+osHmScHEawFw/pO3NEWnyWIrgDpUd
 QbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rurBkhAP42a+iSTKcpb98EEHSv7vknoHnWiv4mi4zUc=;
 b=mHCQrxrCqzMHwR+7Imy6ERdGdBBZW7lyI0NCFttd8OXMlxQE2VLTWfkN23hTiBHLTv
 +X5rQOpIi/djlTz7d+1cq/LIPaaDyM/we7uOW6fHMXWxQY+GXyUAZg/juoiK/oWHBjAP
 KeHDI9WjBpU/sLDrXAbKSo/YFhuCUZ+4G3XeVk4LVm22vveXgRB+ItAfDF6jm9BqrhM8
 Zpiq0midP0shdjK30KEzYY+uHWT8tYHTpfYhK2X3Mbe+chq9/Cy8GKQ136LLUfZgunpq
 Y1IBsDzQlhFN6p7vDbt2Z2H7v7qC3e5Cb39p245baubO+Y34KX6WKqS2vegSUcKoENKQ
 2T+g==
X-Gm-Message-State: AO0yUKVAZcgPLaC2e5qdz2Sa8o61T69VQQepFSae6qrkLSEJGK2t+ilj
 1z9yPW6sgcwe8vnjsH29ytUsEw==
X-Google-Smtp-Source: AK7set9nphGUqVcBipKveBN6ky6mOKytLxAOYcPzfjxfJply9lxXjHNchXSFvlzRf5s/q3OY0kq+Cw==
X-Received: by 2002:a05:600c:3088:b0:3df:ed95:d757 with SMTP id
 g8-20020a05600c308800b003dfed95d757mr10260399wmn.34.1677019953294; 
 Tue, 21 Feb 2023 14:52:33 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a7bcbd8000000b003dc4aae4739sm14283373wmi.27.2023.02.21.14.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 14:52:31 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4CDB01FFBF;
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v3 08/24] gdbstub: make various helpers visible to the rest of
 the module
Date: Tue, 21 Feb 2023 22:52:11 +0000
Message-Id: <20230221225227.3735319-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221225227.3735319-1-alex.bennee@linaro.org>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
X-List-Received-Date: Tue, 21 Feb 2023 22:52:48 -0000

We will be needing to use these helpers between the user and softmmu
files so declare them in the headers, add a system prefix and remove
static from the implementations.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h |  25 ++++
 gdbstub/gdbstub.c   | 271 ++++++++++++++++++++++----------------------
 2 files changed, 161 insertions(+), 135 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 6be05fac9f..73e454edfe 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -82,6 +82,31 @@ static inline int tohex(int v)
     }
 }
 
+/*
+ * Connection helpers for both softmmu and user backends
+ */
+
+void gdb_put_strbuf(void);
+int gdb_put_packet(const char *buf);
+int gdb_put_packet_binary(const char *buf, int len, bool dump);
+void gdb_hextomem(GByteArray *mem, const char *buf, int len);
+void gdb_memtohex(GString *buf, const uint8_t *mem, int len);
+void gdb_memtox(GString *buf, const char *mem, int len);
+void gdb_read_byte(uint8_t ch);
+
+/* utility helpers */
+CPUState *gdb_first_attached_cpu(void);
+void gdb_append_thread_id(CPUState *cpu, GString *buf);
+int gdb_get_cpu_index(CPUState *cpu);
+
+void gdb_init_gdbserver_state(void);
+void gdb_create_default_process(GDBState *s);
+
+/*
+ * Helpers with separate softmmu and user implementations
+ */
+void gdb_put_buffer(const uint8_t *buf, int len);
+
 /*
  * Break/Watch point support - there is an implementation for softmmu
  * and user mode.
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 4407706aa3..41414d89bc 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -85,12 +85,13 @@ static inline int target_memory_rw_debug(CPUState *cpu, target_ulong addr,
     return cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
 }
 
-/* Return the GDB index for a given vCPU state.
+/*
+ * Return the GDB index for a given vCPU state.
  *
  * For user mode this is simply the thread id. In system mode GDB
  * numbers CPUs from 1 as 0 is reserved as an "any cpu" index.
  */
-static inline int cpu_gdb_index(CPUState *cpu)
+int gdb_get_cpu_index(CPUState *cpu)
 {
 #if defined(CONFIG_USER_ONLY)
     TaskState *ts = (TaskState *) cpu->opaque;
@@ -342,7 +343,7 @@ static GDBSystemState gdbserver_system_state;
 
 static GDBState gdbserver_state;
 
-static void init_gdbserver_state(void)
+void gdb_init_gdbserver_state(void)
 {
     g_assert(!gdbserver_state.init);
     memset(&gdbserver_state, 0, sizeof(GDBState));
@@ -524,7 +525,7 @@ static int gdb_continue_partial(char *newstates)
     return res;
 }
 
-static void put_buffer(const uint8_t *buf, int len)
+void gdb_put_buffer(const uint8_t *buf, int len)
 {
 #ifdef CONFIG_USER_ONLY
     int ret;
@@ -547,7 +548,7 @@ static void put_buffer(const uint8_t *buf, int len)
 }
 
 /* writes 2*len+1 bytes in buf */
-static void memtohex(GString *buf, const uint8_t *mem, int len)
+void gdb_memtohex(GString *buf, const uint8_t *mem, int len)
 {
     int i, c;
     for(i = 0; i < len; i++) {
@@ -558,7 +559,7 @@ static void memtohex(GString *buf, const uint8_t *mem, int len)
     g_string_append_c(buf, '\0');
 }
 
-static void hextomem(GByteArray *mem, const char *buf, int len)
+void gdb_hextomem(GByteArray *mem, const char *buf, int len)
 {
     int i;
 
@@ -603,7 +604,7 @@ static void hexdump(const char *buf, int len,
 }
 
 /* return -1 if error, 0 if OK */
-static int put_packet_binary(const char *buf, int len, bool dump)
+int gdb_put_packet_binary(const char *buf, int len, bool dump)
 {
     int csum, i;
     uint8_t footer[3];
@@ -627,7 +628,7 @@ static int put_packet_binary(const char *buf, int len, bool dump)
         footer[2] = tohex((csum) & 0xf);
         g_byte_array_append(gdbserver_state.last_packet, footer, 3);
 
-        put_buffer(gdbserver_state.last_packet->data,
+        gdb_put_buffer(gdbserver_state.last_packet->data,
                    gdbserver_state.last_packet->len);
 
 #ifdef CONFIG_USER_ONLY
@@ -644,20 +645,20 @@ static int put_packet_binary(const char *buf, int len, bool dump)
 }
 
 /* return -1 if error, 0 if OK */
-static int put_packet(const char *buf)
+int gdb_put_packet(const char *buf)
 {
     trace_gdbstub_io_reply(buf);
 
-    return put_packet_binary(buf, strlen(buf), false);
+    return gdb_put_packet_binary(buf, strlen(buf), false);
 }
 
-static void put_strbuf(void)
+void gdb_put_strbuf(void)
 {
-    put_packet(gdbserver_state.str_buf->str);
+    gdb_put_packet(gdbserver_state.str_buf->str);
 }
 
 /* Encode data using the encoding for 'x' packets.  */
-static void memtox(GString *buf, const char *mem, int len)
+void gdb_memtox(GString *buf, const char *mem, int len)
 {
     char c;
 
@@ -714,7 +715,7 @@ static CPUState *find_cpu(uint32_t thread_id)
     CPUState *cpu;
 
     CPU_FOREACH(cpu) {
-        if (cpu_gdb_index(cpu) == thread_id) {
+        if (gdb_get_cpu_index(cpu) == thread_id) {
             return cpu;
         }
     }
@@ -768,7 +769,7 @@ static CPUState *gdb_next_attached_cpu(CPUState *cpu)
 }
 
 /* Return the first attached cpu */
-static CPUState *gdb_first_attached_cpu(void)
+CPUState *gdb_first_attached_cpu(void)
 {
     CPUState *cpu = first_cpu;
     GDBProcess *process = gdb_get_cpu_process(cpu);
@@ -982,13 +983,13 @@ static void gdb_set_cpu_pc(target_ulong pc)
     cpu_set_pc(cpu, pc);
 }
 
-static void gdb_append_thread_id(CPUState *cpu, GString *buf)
+void gdb_append_thread_id(CPUState *cpu, GString *buf)
 {
     if (gdbserver_state.multiprocess) {
         g_string_append_printf(buf, "p%02x.%02x",
-                               gdb_get_cpu_pid(cpu), cpu_gdb_index(cpu));
+                               gdb_get_cpu_pid(cpu), gdb_get_cpu_index(cpu));
     } else {
-        g_string_append_printf(buf, "%02x", cpu_gdb_index(cpu));
+        g_string_append_printf(buf, "%02x", gdb_get_cpu_index(cpu));
     }
 }
 
@@ -1359,7 +1360,7 @@ static void run_cmd_parser(const char *data, const GdbCmdParseEntry *cmd)
     /* In case there was an error during the command parsing we must
     * send a NULL packet to indicate the command is not supported */
     if (process_string_cmd(NULL, data, cmd, 1)) {
-        put_packet("");
+        gdb_put_packet("");
     }
 }
 
@@ -1370,7 +1371,7 @@ static void handle_detach(GArray *params, void *user_ctx)
 
     if (gdbserver_state.multiprocess) {
         if (!params->len) {
-            put_packet("E22");
+            gdb_put_packet("E22");
             return;
         }
 
@@ -1394,7 +1395,7 @@ static void handle_detach(GArray *params, void *user_ctx)
         gdb_syscall_mode = GDB_SYS_DISABLED;
         gdb_continue();
     }
-    put_packet("OK");
+    gdb_put_packet("OK");
 }
 
 static void handle_thread_alive(GArray *params, void *user_ctx)
@@ -1402,23 +1403,23 @@ static void handle_thread_alive(GArray *params, void *user_ctx)
     CPUState *cpu;
 
     if (!params->len) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
     if (get_param(params, 0)->thread_id.kind == GDB_READ_THREAD_ERR) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
     cpu = gdb_get_cpu(get_param(params, 0)->thread_id.pid,
                       get_param(params, 0)->thread_id.tid);
     if (!cpu) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
-    put_packet("OK");
+    gdb_put_packet("OK");
 }
 
 static void handle_continue(GArray *params, void *user_ctx)
@@ -1455,24 +1456,24 @@ static void handle_set_thread(GArray *params, void *user_ctx)
     CPUState *cpu;
 
     if (params->len != 2) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
     if (get_param(params, 1)->thread_id.kind == GDB_READ_THREAD_ERR) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
     if (get_param(params, 1)->thread_id.kind != GDB_ONE_THREAD) {
-        put_packet("OK");
+        gdb_put_packet("OK");
         return;
     }
 
     cpu = gdb_get_cpu(get_param(params, 1)->thread_id.pid,
                       get_param(params, 1)->thread_id.tid);
     if (!cpu) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
@@ -1483,14 +1484,14 @@ static void handle_set_thread(GArray *params, void *user_ctx)
     switch (get_param(params, 0)->opcode) {
     case 'c':
         gdbserver_state.c_cpu = cpu;
-        put_packet("OK");
+        gdb_put_packet("OK");
         break;
     case 'g':
         gdbserver_state.g_cpu = cpu;
-        put_packet("OK");
+        gdb_put_packet("OK");
         break;
     default:
-        put_packet("E22");
+        gdb_put_packet("E22");
         break;
     }
 }
@@ -1500,7 +1501,7 @@ static void handle_insert_bp(GArray *params, void *user_ctx)
     int res;
 
     if (params->len != 3) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
@@ -1509,14 +1510,14 @@ static void handle_insert_bp(GArray *params, void *user_ctx)
                                 get_param(params, 1)->val_ull,
                                 get_param(params, 2)->val_ull);
     if (res >= 0) {
-        put_packet("OK");
+        gdb_put_packet("OK");
         return;
     } else if (res == -ENOSYS) {
-        put_packet("");
+        gdb_put_packet("");
         return;
     }
 
-    put_packet("E22");
+    gdb_put_packet("E22");
 }
 
 static void handle_remove_bp(GArray *params, void *user_ctx)
@@ -1524,7 +1525,7 @@ static void handle_remove_bp(GArray *params, void *user_ctx)
     int res;
 
     if (params->len != 3) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
@@ -1533,14 +1534,14 @@ static void handle_remove_bp(GArray *params, void *user_ctx)
                                 get_param(params, 1)->val_ull,
                                 get_param(params, 2)->val_ull);
     if (res >= 0) {
-        put_packet("OK");
+        gdb_put_packet("OK");
         return;
     } else if (res == -ENOSYS) {
-        put_packet("");
+        gdb_put_packet("");
         return;
     }
 
-    put_packet("E22");
+    gdb_put_packet("E22");
 }
 
 /*
@@ -1559,20 +1560,20 @@ static void handle_set_reg(GArray *params, void *user_ctx)
     int reg_size;
 
     if (!gdb_has_xml) {
-        put_packet("");
+        gdb_put_packet("");
         return;
     }
 
     if (params->len != 2) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
     reg_size = strlen(get_param(params, 1)->data) / 2;
-    hextomem(gdbserver_state.mem_buf, get_param(params, 1)->data, reg_size);
+    gdb_hextomem(gdbserver_state.mem_buf, get_param(params, 1)->data, reg_size);
     gdb_write_register(gdbserver_state.g_cpu, gdbserver_state.mem_buf->data,
                        get_param(params, 0)->val_ull);
-    put_packet("OK");
+    gdb_put_packet("OK");
 }
 
 static void handle_get_reg(GArray *params, void *user_ctx)
@@ -1580,12 +1581,12 @@ static void handle_get_reg(GArray *params, void *user_ctx)
     int reg_size;
 
     if (!gdb_has_xml) {
-        put_packet("");
+        gdb_put_packet("");
         return;
     }
 
     if (!params->len) {
-        put_packet("E14");
+        gdb_put_packet("E14");
         return;
     }
 
@@ -1593,53 +1594,53 @@ static void handle_get_reg(GArray *params, void *user_ctx)
                                  gdbserver_state.mem_buf,
                                  get_param(params, 0)->val_ull);
     if (!reg_size) {
-        put_packet("E14");
+        gdb_put_packet("E14");
         return;
     } else {
         g_byte_array_set_size(gdbserver_state.mem_buf, reg_size);
     }
 
-    memtohex(gdbserver_state.str_buf, gdbserver_state.mem_buf->data, reg_size);
-    put_strbuf();
+    gdb_memtohex(gdbserver_state.str_buf, gdbserver_state.mem_buf->data, reg_size);
+    gdb_put_strbuf();
 }
 
 static void handle_write_mem(GArray *params, void *user_ctx)
 {
     if (params->len != 3) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
-    /* hextomem() reads 2*len bytes */
+    /* gdb_hextomem() reads 2*len bytes */
     if (get_param(params, 1)->val_ull >
         strlen(get_param(params, 2)->data) / 2) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
-    hextomem(gdbserver_state.mem_buf, get_param(params, 2)->data,
+    gdb_hextomem(gdbserver_state.mem_buf, get_param(params, 2)->data,
              get_param(params, 1)->val_ull);
     if (target_memory_rw_debug(gdbserver_state.g_cpu,
                                get_param(params, 0)->val_ull,
                                gdbserver_state.mem_buf->data,
                                gdbserver_state.mem_buf->len, true)) {
-        put_packet("E14");
+        gdb_put_packet("E14");
         return;
     }
 
-    put_packet("OK");
+    gdb_put_packet("OK");
 }
 
 static void handle_read_mem(GArray *params, void *user_ctx)
 {
     if (params->len != 2) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
-    /* memtohex() doubles the required space */
+    /* gdb_memtohex() doubles the required space */
     if (get_param(params, 1)->val_ull > MAX_PACKET_LENGTH / 2) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
@@ -1650,13 +1651,13 @@ static void handle_read_mem(GArray *params, void *user_ctx)
                                get_param(params, 0)->val_ull,
                                gdbserver_state.mem_buf->data,
                                gdbserver_state.mem_buf->len, false)) {
-        put_packet("E14");
+        gdb_put_packet("E14");
         return;
     }
 
-    memtohex(gdbserver_state.str_buf, gdbserver_state.mem_buf->data,
+    gdb_memtohex(gdbserver_state.str_buf, gdbserver_state.mem_buf->data,
              gdbserver_state.mem_buf->len);
-    put_strbuf();
+    gdb_put_strbuf();
 }
 
 static void handle_write_all_regs(GArray *params, void *user_ctx)
@@ -1671,7 +1672,7 @@ static void handle_write_all_regs(GArray *params, void *user_ctx)
 
     cpu_synchronize_state(gdbserver_state.g_cpu);
     len = strlen(get_param(params, 0)->data) / 2;
-    hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
+    gdb_hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
     registers = gdbserver_state.mem_buf->data;
     for (addr = 0; addr < gdbserver_state.g_cpu->gdb_num_g_regs && len > 0;
          addr++) {
@@ -1679,7 +1680,7 @@ static void handle_write_all_regs(GArray *params, void *user_ctx)
         len -= reg_size;
         registers += reg_size;
     }
-    put_packet("OK");
+    gdb_put_packet("OK");
 }
 
 static void handle_read_all_regs(GArray *params, void *user_ctx)
@@ -1696,8 +1697,8 @@ static void handle_read_all_regs(GArray *params, void *user_ctx)
     }
     g_assert(len == gdbserver_state.mem_buf->len);
 
-    memtohex(gdbserver_state.str_buf, gdbserver_state.mem_buf->data, len);
-    put_strbuf();
+    gdb_memtohex(gdbserver_state.str_buf, gdbserver_state.mem_buf->data, len);
+    gdb_put_strbuf();
 }
 
 static void handle_file_io(GArray *params, void *user_ctx)
@@ -1748,7 +1749,7 @@ static void handle_file_io(GArray *params, void *user_ctx)
     }
 
     if (params->len >= 3 && get_param(params, 2)->opcode == (uint8_t)'C') {
-        put_packet("T02");
+        gdb_put_packet("T02");
         return;
     }
 
@@ -1768,7 +1769,7 @@ static void handle_step(GArray *params, void *user_ctx)
 static void handle_backward(GArray *params, void *user_ctx)
 {
     if (!stub_can_reverse()) {
-        put_packet("E22");
+        gdb_put_packet("E22");
     }
     if (params->len == 1) {
         switch (get_param(params, 0)->opcode) {
@@ -1776,26 +1777,26 @@ static void handle_backward(GArray *params, void *user_ctx)
             if (replay_reverse_step()) {
                 gdb_continue();
             } else {
-                put_packet("E14");
+                gdb_put_packet("E14");
             }
             return;
         case 'c':
             if (replay_reverse_continue()) {
                 gdb_continue();
             } else {
-                put_packet("E14");
+                gdb_put_packet("E14");
             }
             return;
         }
     }
 
     /* Default invalid command */
-    put_packet("");
+    gdb_put_packet("");
 }
 
 static void handle_v_cont_query(GArray *params, void *user_ctx)
 {
-    put_packet("vCont;c;C;s;S");
+    gdb_put_packet("vCont;c;C;s;S");
 }
 
 static void handle_v_cont(GArray *params, void *user_ctx)
@@ -1808,9 +1809,9 @@ static void handle_v_cont(GArray *params, void *user_ctx)
 
     res = gdb_handle_vcont(get_param(params, 0)->data);
     if ((res == -EINVAL) || (res == -ERANGE)) {
-        put_packet("E22");
+        gdb_put_packet("E22");
     } else if (res) {
-        put_packet("");
+        gdb_put_packet("");
     }
 }
 
@@ -1842,13 +1843,13 @@ static void handle_v_attach(GArray *params, void *user_ctx)
     gdb_append_thread_id(cpu, gdbserver_state.str_buf);
     g_string_append_c(gdbserver_state.str_buf, ';');
 cleanup:
-    put_strbuf();
+    gdb_put_strbuf();
 }
 
 static void handle_v_kill(GArray *params, void *user_ctx)
 {
     /* Kill the target */
-    put_packet("OK");
+    gdb_put_packet("OK");
     error_report("QEMU: Terminated via GDBstub");
     gdb_exit(0);
     exit(0);
@@ -1889,7 +1890,7 @@ static void handle_v_commands(GArray *params, void *user_ctx)
     if (process_string_cmd(NULL, get_param(params, 0)->data,
                            gdb_v_commands_table,
                            ARRAY_SIZE(gdb_v_commands_table))) {
-        put_packet("");
+        gdb_put_packet("");
     }
 }
 
@@ -1907,7 +1908,7 @@ static void handle_query_qemu_sstepbits(GArray *params, void *user_ctx)
                                SSTEP_NOTIMER);
     }
 
-    put_strbuf();
+    gdb_put_strbuf();
 }
 
 static void handle_set_qemu_sstep(GArray *params, void *user_ctx)
@@ -1921,19 +1922,19 @@ static void handle_set_qemu_sstep(GArray *params, void *user_ctx)
     new_sstep_flags = get_param(params, 0)->val_ul;
 
     if (new_sstep_flags  & ~gdbserver_state.supported_sstep_flags) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
     gdbserver_state.sstep_flags = new_sstep_flags;
-    put_packet("OK");
+    gdb_put_packet("OK");
 }
 
 static void handle_query_qemu_sstep(GArray *params, void *user_ctx)
 {
     g_string_printf(gdbserver_state.str_buf, "0x%x",
                     gdbserver_state.sstep_flags);
-    put_strbuf();
+    gdb_put_strbuf();
 }
 
 static void handle_query_curr_tid(GArray *params, void *user_ctx)
@@ -1950,19 +1951,19 @@ static void handle_query_curr_tid(GArray *params, void *user_ctx)
     cpu = get_first_cpu_in_process(process);
     g_string_assign(gdbserver_state.str_buf, "QC");
     gdb_append_thread_id(cpu, gdbserver_state.str_buf);
-    put_strbuf();
+    gdb_put_strbuf();
 }
 
 static void handle_query_threads(GArray *params, void *user_ctx)
 {
     if (!gdbserver_state.query_cpu) {
-        put_packet("l");
+        gdb_put_packet("l");
         return;
     }
 
     g_string_assign(gdbserver_state.str_buf, "m");
     gdb_append_thread_id(gdbserver_state.query_cpu, gdbserver_state.str_buf);
-    put_strbuf();
+    gdb_put_strbuf();
     gdbserver_state.query_cpu = gdb_next_attached_cpu(gdbserver_state.query_cpu);
 }
 
@@ -1979,7 +1980,7 @@ static void handle_query_thread_extra(GArray *params, void *user_ctx)
 
     if (!params->len ||
         get_param(params, 0)->thread_id.kind == GDB_READ_THREAD_ERR) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
@@ -2004,8 +2005,8 @@ static void handle_query_thread_extra(GArray *params, void *user_ctx)
                         cpu->halted ? "halted " : "running");
     }
     trace_gdbstub_op_extra_info(rs->str);
-    memtohex(gdbserver_state.str_buf, (uint8_t *)rs->str, rs->len);
-    put_strbuf();
+    gdb_memtohex(gdbserver_state.str_buf, (uint8_t *)rs->str, rs->len);
+    gdb_put_strbuf();
 }
 
 #ifdef CONFIG_USER_ONLY
@@ -2021,7 +2022,7 @@ static void handle_query_offsets(GArray *params, void *user_ctx)
                     ts->info->code_offset,
                     ts->info->data_offset,
                     ts->info->data_offset);
-    put_strbuf();
+    gdb_put_strbuf();
 }
 #else
 static void handle_query_rcmd(GArray *params, void *user_ctx)
@@ -2030,24 +2031,24 @@ static void handle_query_rcmd(GArray *params, void *user_ctx)
     int len;
 
     if (!params->len) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
     len = strlen(get_param(params, 0)->data);
     if (len % 2) {
-        put_packet("E01");
+        gdb_put_packet("E01");
         return;
     }
 
     g_assert(gdbserver_state.mem_buf->len == 0);
     len = len / 2;
-    hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
+    gdb_hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
     g_byte_array_append(gdbserver_state.mem_buf, &zero, 1);
     qemu_chr_be_write(gdbserver_system_state.mon_chr,
                       gdbserver_state.mem_buf->data,
                       gdbserver_state.mem_buf->len);
-    put_packet("OK");
+    gdb_put_packet("OK");
 }
 #endif
 
@@ -2078,7 +2079,7 @@ static void handle_query_supported(GArray *params, void *user_ctx)
     }
 
     g_string_append(gdbserver_state.str_buf, ";vContSupported+;multiprocess+");
-    put_strbuf();
+    gdb_put_strbuf();
 }
 
 static void handle_query_xfer_features(GArray *params, void *user_ctx)
@@ -2090,14 +2091,14 @@ static void handle_query_xfer_features(GArray *params, void *user_ctx)
     const char *p;
 
     if (params->len < 3) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
     process = gdb_get_cpu_process(gdbserver_state.g_cpu);
     cc = CPU_GET_CLASS(gdbserver_state.g_cpu);
     if (!cc->gdb_core_xml_file) {
-        put_packet("");
+        gdb_put_packet("");
         return;
     }
 
@@ -2105,7 +2106,7 @@ static void handle_query_xfer_features(GArray *params, void *user_ctx)
     p = get_param(params, 0)->data;
     xml = get_feature_xml(p, &p, process);
     if (!xml) {
-        put_packet("E00");
+        gdb_put_packet("E00");
         return;
     }
 
@@ -2113,7 +2114,7 @@ static void handle_query_xfer_features(GArray *params, void *user_ctx)
     len = get_param(params, 2)->val_ul;
     total_len = strlen(xml);
     if (addr > total_len) {
-        put_packet("E00");
+        gdb_put_packet("E00");
         return;
     }
 
@@ -2123,13 +2124,13 @@ static void handle_query_xfer_features(GArray *params, void *user_ctx)
 
     if (len < total_len - addr) {
         g_string_assign(gdbserver_state.str_buf, "m");
-        memtox(gdbserver_state.str_buf, xml + addr, len);
+        gdb_memtox(gdbserver_state.str_buf, xml + addr, len);
     } else {
         g_string_assign(gdbserver_state.str_buf, "l");
-        memtox(gdbserver_state.str_buf, xml + addr, total_len - addr);
+        gdb_memtox(gdbserver_state.str_buf, xml + addr, total_len - addr);
     }
 
-    put_packet_binary(gdbserver_state.str_buf->str,
+    gdb_put_packet_binary(gdbserver_state.str_buf->str,
                       gdbserver_state.str_buf->len, true);
 }
 
@@ -2140,7 +2141,7 @@ static void handle_query_xfer_auxv(GArray *params, void *user_ctx)
     unsigned long offset, len, saved_auxv, auxv_len;
 
     if (params->len < 2) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
@@ -2151,7 +2152,7 @@ static void handle_query_xfer_auxv(GArray *params, void *user_ctx)
     auxv_len = ts->info->auxv_len;
 
     if (offset >= auxv_len) {
-        put_packet("E00");
+        gdb_put_packet("E00");
         return;
     }
 
@@ -2169,20 +2170,20 @@ static void handle_query_xfer_auxv(GArray *params, void *user_ctx)
     g_byte_array_set_size(gdbserver_state.mem_buf, len);
     if (target_memory_rw_debug(gdbserver_state.g_cpu, saved_auxv + offset,
                                gdbserver_state.mem_buf->data, len, false)) {
-        put_packet("E14");
+        gdb_put_packet("E14");
         return;
     }
 
-    memtox(gdbserver_state.str_buf,
-           (const char *)gdbserver_state.mem_buf->data, len);
-    put_packet_binary(gdbserver_state.str_buf->str,
-                      gdbserver_state.str_buf->len, true);
+    gdb_memtox(gdbserver_state.str_buf,
+               (const char *)gdbserver_state.mem_buf->data, len);
+    gdb_put_packet_binary(gdbserver_state.str_buf->str,
+                          gdbserver_state.str_buf->len, true);
 }
 #endif
 
 static void handle_query_attached(GArray *params, void *user_ctx)
 {
-    put_packet(GDB_ATTACHED);
+    gdb_put_packet(GDB_ATTACHED);
 }
 
 static void handle_query_qemu_supported(GArray *params, void *user_ctx)
@@ -2191,7 +2192,7 @@ static void handle_query_qemu_supported(GArray *params, void *user_ctx)
 #ifndef CONFIG_USER_ONLY
     g_string_append(gdbserver_state.str_buf, ";PhyMemMode");
 #endif
-    put_strbuf();
+    gdb_put_strbuf();
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -2199,13 +2200,13 @@ static void handle_query_qemu_phy_mem_mode(GArray *params,
                                            void *user_ctx)
 {
     g_string_printf(gdbserver_state.str_buf, "%d", phy_memory_mode);
-    put_strbuf();
+    gdb_put_strbuf();
 }
 
 static void handle_set_qemu_phy_mem_mode(GArray *params, void *user_ctx)
 {
     if (!params->len) {
-        put_packet("E22");
+        gdb_put_packet("E22");
         return;
     }
 
@@ -2214,7 +2215,7 @@ static void handle_set_qemu_phy_mem_mode(GArray *params, void *user_ctx)
     } else {
         phy_memory_mode = 1;
     }
-    put_packet("OK");
+    gdb_put_packet("OK");
 }
 #endif
 
@@ -2347,7 +2348,7 @@ static void handle_gen_query(GArray *params, void *user_ctx)
     if (process_string_cmd(NULL, get_param(params, 0)->data,
                            gdb_gen_query_table,
                            ARRAY_SIZE(gdb_gen_query_table))) {
-        put_packet("");
+        gdb_put_packet("");
     }
 }
 
@@ -2366,7 +2367,7 @@ static void handle_gen_set(GArray *params, void *user_ctx)
     if (process_string_cmd(NULL, get_param(params, 0)->data,
                            gdb_gen_set_table,
                            ARRAY_SIZE(gdb_gen_set_table))) {
-        put_packet("");
+        gdb_put_packet("");
     }
 }
 
@@ -2375,7 +2376,7 @@ static void handle_target_halt(GArray *params, void *user_ctx)
     g_string_printf(gdbserver_state.str_buf, "T%02xthread:", GDB_SIGNAL_TRAP);
     gdb_append_thread_id(gdbserver_state.c_cpu, gdbserver_state.str_buf);
     g_string_append_c(gdbserver_state.str_buf, ';');
-    put_strbuf();
+    gdb_put_strbuf();
     /*
      * Remove all the breakpoints when this query is issued,
      * because gdb is doing an initial connect and the state
@@ -2392,7 +2393,7 @@ static int gdb_handle_packet(const char *line_buf)
 
     switch (line_buf[0]) {
     case '!':
-        put_packet("OK");
+        gdb_put_packet("OK");
         break;
     case '?':
         {
@@ -2619,7 +2620,7 @@ static int gdb_handle_packet(const char *line_buf)
         break;
     default:
         /* put empty packet */
-        put_packet("");
+        gdb_put_packet("");
         break;
     }
 
@@ -2660,7 +2661,7 @@ static void gdb_vm_state_change(void *opaque, bool running, RunState state)
     }
     /* Is there a GDB syscall waiting to be sent?  */
     if (gdbserver_state.current_syscall_cb) {
-        put_packet(gdbserver_state.syscall_buf);
+        gdb_put_packet(gdbserver_state.syscall_buf);
         return;
     }
 
@@ -2685,7 +2686,7 @@ static void gdb_vm_state_change(void *opaque, bool running, RunState state)
                 type = "";
                 break;
             }
-            trace_gdbstub_hit_watchpoint(type, cpu_gdb_index(cpu),
+            trace_gdbstub_hit_watchpoint(type, gdb_get_cpu_index(cpu),
                     (target_ulong)cpu->watchpoint_hit->vaddr);
             g_string_printf(buf, "T%02xthread:%s;%swatch:" TARGET_FMT_lx ";",
                             GDB_SIGNAL_TRAP, tid->str, type,
@@ -2733,7 +2734,7 @@ static void gdb_vm_state_change(void *opaque, bool running, RunState state)
     g_string_printf(buf, "T%02xthread:%s;", ret, tid->str);
 
 send_packet:
-    put_packet(buf->str);
+    gdb_put_packet(buf->str);
 
     /* disable single step if it was enabled */
     cpu_single_step(cpu, 0);
@@ -2794,7 +2795,7 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
     }
     *p = 0;
 #ifdef CONFIG_USER_ONLY
-    put_packet(gdbserver_state.syscall_buf);
+    gdb_put_packet(gdbserver_state.syscall_buf);
     /* Return control to gdb for it to process the syscall request.
      * Since the protocol requires that gdb hands control back to us
      * using a "here are the results" F packet, we don't need to check
@@ -2822,7 +2823,7 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...)
     va_end(va);
 }
 
-static void gdb_read_byte(uint8_t ch)
+void gdb_read_byte(uint8_t ch)
 {
     uint8_t reply;
 
@@ -2832,7 +2833,7 @@ static void gdb_read_byte(uint8_t ch)
            of a new command then abandon the previous response.  */
         if (ch == '-') {
             trace_gdbstub_err_got_nack();
-            put_buffer(gdbserver_state.last_packet->data,
+            gdb_put_buffer(gdbserver_state.last_packet->data,
                        gdbserver_state.last_packet->len);
         } else if (ch == '+') {
             trace_gdbstub_io_got_ack();
@@ -2954,12 +2955,12 @@ static void gdb_read_byte(uint8_t ch)
                 trace_gdbstub_err_checksum_incorrect(gdbserver_state.line_sum, gdbserver_state.line_csum);
                 /* send NAK reply */
                 reply = '-';
-                put_buffer(&reply, 1);
+                gdb_put_buffer(&reply, 1);
                 gdbserver_state.state = RS_IDLE;
             } else {
                 /* send ACK reply */
                 reply = '+';
-                put_buffer(&reply, 1);
+                gdb_put_buffer(&reply, 1);
                 gdbserver_state.state = gdb_handle_packet(gdbserver_state.line_buf);
             }
             break;
@@ -2989,7 +2990,7 @@ void gdb_exit(int code)
   trace_gdbstub_op_exiting((uint8_t)code);
 
   snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
-  put_packet(buf);
+  gdb_put_packet(buf);
 
 #ifndef CONFIG_USER_ONLY
   qemu_chr_fe_deinit(&gdbserver_system_state.chr, true);
@@ -3001,7 +3002,7 @@ void gdb_exit(int code)
  * part of a CPU cluster). Note that if this process contains no CPUs, it won't
  * be attachable and thus will be invisible to the user.
  */
-static void create_default_process(GDBState *s)
+void gdb_create_default_process(GDBState *s)
 {
     GDBProcess *process;
     int max_pid = 0;
@@ -3042,9 +3043,9 @@ gdb_handlesig(CPUState *cpu, int sig)
                         "T%02xthread:", target_signal_to_gdb(sig));
         gdb_append_thread_id(cpu, gdbserver_state.str_buf);
         g_string_append_c(gdbserver_state.str_buf, ';');
-        put_strbuf();
+        gdb_put_strbuf();
     }
-    /* put_packet() might have detected that the peer terminated the
+    /* gdb_put_packet() might have detected that the peer terminated the
        connection.  */
     if (gdbserver_user_state.fd < 0) {
         return sig;
@@ -3086,13 +3087,13 @@ void gdb_signalled(CPUArchState *env, int sig)
     }
 
     snprintf(buf, sizeof(buf), "X%02x", target_signal_to_gdb(sig));
-    put_packet(buf);
+    gdb_put_packet(buf);
 }
 
 static void gdb_accept_init(int fd)
 {
-    init_gdbserver_state();
-    create_default_process(&gdbserver_state);
+    gdb_init_gdbserver_state();
+    gdb_create_default_process(&gdbserver_state);
     gdbserver_state.processes[0].attached = true;
     gdbserver_state.c_cpu = gdb_first_attached_cpu();
     gdbserver_state.g_cpu = gdbserver_state.c_cpu;
@@ -3292,8 +3293,8 @@ static void gdb_chr_event(void *opaque, QEMUChrEvent event)
 static int gdb_monitor_write(Chardev *chr, const uint8_t *buf, int len)
 {
     g_autoptr(GString) hex_buf = g_string_new("O");
-    memtohex(hex_buf, buf, len);
-    put_packet(hex_buf->str);
+    gdb_memtohex(hex_buf, buf, len);
+    gdb_put_packet(hex_buf->str);
     return len;
 }
 
@@ -3379,7 +3380,7 @@ static void create_processes(GDBState *s)
         qsort(gdbserver_state.processes, gdbserver_state.process_num, sizeof(gdbserver_state.processes[0]), pid_order);
     }
 
-    create_default_process(s);
+    gdb_create_default_process(s);
 }
 
 int gdbserver_start(const char *device)
@@ -3429,7 +3430,7 @@ int gdbserver_start(const char *device)
     }
 
     if (!gdbserver_state.init) {
-        init_gdbserver_state();
+        gdb_init_gdbserver_state();
 
         qemu_add_vm_change_state_handler(gdb_vm_state_change, NULL);
 
-- 
2.39.1


