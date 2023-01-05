Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDTLU-0007cN-9K
	for mharc-qemu-riscv@gnu.org; Thu, 05 Jan 2023 11:44:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTLM-0007JG-VO
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:43:53 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTKz-00072G-IZ
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:43:52 -0500
Received: by mail-wm1-x32c.google.com with SMTP id ja17so28447672wmb.3
 for <qemu-riscv@nongnu.org>; Thu, 05 Jan 2023 08:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dq+rRQ8VRcqDw3VK+XUoNAUY4lPdXx+D6O3N7YMZLHQ=;
 b=iy30XnDGoFXdLHjGUr4l17D1YAkJ/mqJOBAgy9h+gIvBibMgnhJphZYcm9botUhcPp
 bl384/qXwT/4Hu0RvaTaLK5L7F7ztdLWyOsObt39ojHyoiAtkAz4HJfrzNEnkNSI5VFz
 agcgDWSapfc8SmGNm11RWZE9HpE/rUNWao0A2c+Z9HmwL6oc3fwuxAO5VlrpVQDWT6/x
 mdz9gtKA3ib8NwQ6YzK3778kUNpUTMSVKAJr8ekT/2R6B23TygoZzGSmDugk/HtgH2Mw
 7I7qglsCXErU67FHgehYuR8eKPAukA0FCBcRHIpborcSDpeLwcqQnj7IzIAp5swtSU8L
 dczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dq+rRQ8VRcqDw3VK+XUoNAUY4lPdXx+D6O3N7YMZLHQ=;
 b=TmkeMIKb25s55smamd3gBETvO5pBmmhITiTrxWHH8R1+u7/9MFA1nulRKMYIdPguNa
 UzE40JH/8L8yDRgr6mwemDhQ6mUREFl2Ge/4sKh/4XMEiHYrxKLYJILMBqK6CKW+iIcQ
 eZ8x1rw/6wTf2ZFAyLS7nRHpLYeMj9JtZgkUMOh/3835tx8wgKUhmphXoSh4B+mNXadE
 9JNcFWftuyTX+jWhLnhCa+yrZzid1mGh/YVYKgSX0werKkX4wdPoObgjHvlWEtRI1WWd
 Jd4m7hfH8WVbWhApszPX2d80rrIdyWqOfEXoWeJlKvEkcYNKKlSUJTXW2rHh/QDlOqL6
 dvVQ==
X-Gm-Message-State: AFqh2koLPsbXYPh/ZbUBxQwlDRfFZ1u7tVTtpafM6O8DV42bRdEkxDUu
 k5le1wawJbVLxu1vwoRcmQ8fbQ==
X-Google-Smtp-Source: AMrXdXsXJjabvwmZq8q8PChpT3zzoa7wAb/4Xws+VZxixPv18Zo8aAvtlZ69AjAmliJkUDJ7i5QRZg==
X-Received: by 2002:a05:600c:4307:b0:3d3:494f:6a39 with SMTP id
 p7-20020a05600c430700b003d3494f6a39mr37100454wme.16.1672937008193; 
 Thu, 05 Jan 2023 08:43:28 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ay19-20020a5d6f13000000b0022cdeba3f83sm18000710wrb.84.2023.01.05.08.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:43:25 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4EEC31FFB8;
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
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
Subject: [PATCH v2 14/21] gdbstub: specialise target_memory_rw_debug
Date: Thu,  5 Jan 2023 16:43:13 +0000
Message-Id: <20230105164320.2164095-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105164320.2164095-1-alex.bennee@linaro.org>
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
X-List-Received-Date: Thu, 05 Jan 2023 16:43:54 -0000

The two implementations are different enough to encourage having a
specialisation and we can move some of the softmmu only stuff out of
gdbstub.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h | 19 ++++++++++++
 gdbstub/gdbstub.c   | 73 +++++++--------------------------------------
 gdbstub/softmmu.c   | 51 +++++++++++++++++++++++++++++++
 gdbstub/user.c      | 15 ++++++++++
 4 files changed, 96 insertions(+), 62 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 646d2c4e82..55f3d820aa 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -181,6 +181,10 @@ void gdb_handle_query_xfer_auxv(GArray *params, void *user_ctx); /*user */
 
 void gdb_handle_query_attached(GArray *params, void *user_ctx); /* both */
 
+/* softmmu only */
+void gdb_handle_query_qemu_phy_mem_mode(GArray *params, void *user_ctx);
+void gdb_handle_set_qemu_phy_mem_mode(GArray *params, void *user_ctx);
+
 /*
  * Break/Watch point support - there is an implementation for softmmu
  * and user mode.
@@ -190,4 +194,19 @@ int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len);
 int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr len);
 void gdb_breakpoint_remove_all(CPUState *cs);
 
+/**
+ * gdb_target_memory_rw_debug() - handle debug access to memory
+ * @cs: CPUState
+ * @addr: nominal address, could be an entire physical address
+ * @buf: data
+ * @len: length of access
+ * @is_write: is it a write operation
+ *
+ * This function is specialised depending on the mode we are running
+ * in. For softmmu guests we can switch the interpretation of the
+ * address to a physical address.
+ */
+int gdb_target_memory_rw_debug(CPUState *cs, hwaddr addr,
+                               uint8_t *buf, int len, bool is_write);
+
 #endif /* GDBSTUB_INTERNALS_H */
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 0d90685c72..91021859a1 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -46,33 +46,6 @@
 
 #include "internals.h"
 
-#ifndef CONFIG_USER_ONLY
-static int phy_memory_mode;
-#endif
-
-static inline int target_memory_rw_debug(CPUState *cpu, target_ulong addr,
-                                         uint8_t *buf, int len, bool is_write)
-{
-    CPUClass *cc;
-
-#ifndef CONFIG_USER_ONLY
-    if (phy_memory_mode) {
-        if (is_write) {
-            cpu_physical_memory_write(addr, buf, len);
-        } else {
-            cpu_physical_memory_read(addr, buf, len);
-        }
-        return 0;
-    }
-#endif
-
-    cc = CPU_GET_CLASS(cpu);
-    if (cc->memory_rw_debug) {
-        return cc->memory_rw_debug(cpu, addr, buf, len, is_write);
-    }
-    return cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
-}
-
 typedef struct GDBRegisterState {
     int base_reg;
     int num_regs;
@@ -1194,11 +1167,11 @@ static void handle_write_mem(GArray *params, void *user_ctx)
     }
 
     gdb_hextomem(gdbserver_state.mem_buf, get_param(params, 2)->data,
-             get_param(params, 1)->val_ull);
-    if (target_memory_rw_debug(gdbserver_state.g_cpu,
-                               get_param(params, 0)->val_ull,
-                               gdbserver_state.mem_buf->data,
-                               gdbserver_state.mem_buf->len, true)) {
+                 get_param(params, 1)->val_ull);
+    if (gdb_target_memory_rw_debug(gdbserver_state.g_cpu,
+                                   get_param(params, 0)->val_ull,
+                                   gdbserver_state.mem_buf->data,
+                                   gdbserver_state.mem_buf->len, true)) {
         gdb_put_packet("E14");
         return;
     }
@@ -1222,10 +1195,10 @@ static void handle_read_mem(GArray *params, void *user_ctx)
     g_byte_array_set_size(gdbserver_state.mem_buf,
                           get_param(params, 1)->val_ull);
 
-    if (target_memory_rw_debug(gdbserver_state.g_cpu,
-                               get_param(params, 0)->val_ull,
-                               gdbserver_state.mem_buf->data,
-                               gdbserver_state.mem_buf->len, false)) {
+    if (gdb_target_memory_rw_debug(gdbserver_state.g_cpu,
+                                   get_param(params, 0)->val_ull,
+                                   gdbserver_state.mem_buf->data,
+                                   gdbserver_state.mem_buf->len, false)) {
         gdb_put_packet("E14");
         return;
     }
@@ -1675,30 +1648,6 @@ static void handle_query_qemu_supported(GArray *params, void *user_ctx)
     gdb_put_strbuf();
 }
 
-#ifndef CONFIG_USER_ONLY
-static void handle_query_qemu_phy_mem_mode(GArray *params,
-                                           void *user_ctx)
-{
-    g_string_printf(gdbserver_state.str_buf, "%d", phy_memory_mode);
-    gdb_put_strbuf();
-}
-
-static void handle_set_qemu_phy_mem_mode(GArray *params, void *user_ctx)
-{
-    if (!params->len) {
-        gdb_put_packet("E22");
-        return;
-    }
-
-    if (!get_param(params, 0)->val_ul) {
-        phy_memory_mode = 0;
-    } else {
-        phy_memory_mode = 1;
-    }
-    gdb_put_packet("OK");
-}
-#endif
-
 static const GdbCmdParseEntry gdb_gen_query_set_common_table[] = {
     /* Order is important if has same prefix */
     {
@@ -1789,7 +1738,7 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
     },
 #ifndef CONFIG_USER_ONLY
     {
-        .handler = handle_query_qemu_phy_mem_mode,
+        .handler = gdb_handle_query_qemu_phy_mem_mode,
         .cmd = "qemu.PhyMemMode",
     },
 #endif
@@ -1805,7 +1754,7 @@ static const GdbCmdParseEntry gdb_gen_set_table[] = {
     },
 #ifndef CONFIG_USER_ONLY
     {
-        .handler = handle_set_qemu_phy_mem_mode,
+        .handler = gdb_handle_set_qemu_phy_mem_mode,
         .cmd = "qemu.PhyMemMode:",
         .cmd_startswith = 1,
         .schema = "l0"
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 19fcb3be7d..c42230acca 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -409,9 +409,60 @@ void gdb_exit(int code)
   qemu_chr_fe_deinit(&gdbserver_system_state.chr, true);
 }
 
+/*
+ * Memory access
+ */
+static int phy_memory_mode;
+
+int gdb_target_memory_rw_debug(CPUState *cpu, hwaddr addr,
+                               uint8_t *buf, int len, bool is_write)
+{
+    CPUClass *cc;
+
+    if (phy_memory_mode) {
+        if (is_write) {
+            cpu_physical_memory_write(addr, buf, len);
+        } else {
+            cpu_physical_memory_read(addr, buf, len);
+        }
+        return 0;
+    }
+
+    cc = CPU_GET_CLASS(cpu);
+    if (cc->memory_rw_debug) {
+        return cc->memory_rw_debug(cpu, addr, buf, len, is_write);
+    }
+
+    return cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
+}
+
+
 /*
  * Softmmu specific command helpers
  */
+
+void gdb_handle_query_qemu_phy_mem_mode(GArray *params,
+                                        void *user_ctx)
+{
+    g_string_printf(gdbserver_state.str_buf, "%d", phy_memory_mode);
+    gdb_put_strbuf();
+}
+
+void gdb_handle_set_qemu_phy_mem_mode(GArray *params, void *user_ctx)
+{
+    if (!params->len) {
+        gdb_put_packet("E22");
+        return;
+    }
+
+    if (!get_param(params, 0)->val_ul) {
+        phy_memory_mode = 0;
+    } else {
+        phy_memory_mode = 1;
+    }
+    gdb_put_packet("OK");
+}
+
 void gdb_handle_query_rcmd(GArray *params, void *user_ctx)
 {
     const guint8 zero = 0;
diff --git a/gdbstub/user.c b/gdbstub/user.c
index a668b16952..74f541223c 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -376,6 +376,21 @@ int gdb_continue_partial(char *newstates)
     return res;
 }
 
+/*
+ * Memory access helpers
+ */
+int gdb_target_memory_rw_debug(CPUState *cpu, hwaddr addr,
+                               uint8_t *buf, int len, bool is_write)
+{
+    CPUClass *cc;
+
+    cc = CPU_GET_CLASS(cpu);
+    if (cc->memory_rw_debug) {
+        return cc->memory_rw_debug(cpu, addr, buf, len, is_write);
+    }
+    return cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
+}
+
 /*
  * Break/Watch point helpers
  */
-- 
2.34.1


