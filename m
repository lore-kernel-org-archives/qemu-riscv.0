Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE1AC35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 10:43:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGGSW-0004l1-IW; Thu, 21 Dec 2023 05:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGGS9-0004Nd-5z
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 05:38:57 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGGRs-0004GL-09
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 05:38:56 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c39ef63d9so6322945e9.3
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 02:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703155116; x=1703759916; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GQ/wZukjb9MkID54+svIg/xF+LuLzsv4JVtqMj5aDqg=;
 b=pAUMDszQt4rzGkNODqDJiMzo65n/+s//tCS0v3HnWLZANyKkDQtY/tnmCdyM70b+mE
 Xd/xHNcDD+f/7744Cy4QV1Hi8GB+STRtBBTaANGZU31y8Xy7N088/bVukcYyiwDg1ZEi
 asAYLCDd3uIjGeQcJJdzvkE2VPUN7ROyhP/tGlA/BXOqY0zpDJ5K1Nza4XZ8KY2zn95L
 smBe/T1Z92liqd1z/1gw+SS2f0VKyXZrz9elwCjHda+dRh+cvchufa7bXK6h4gvvX0uq
 UKhAfEK1pjaUgBLb3lKFhZUy8mEBkADf76z34GWdQWThI1UDtQZJL7eCz7gshbv/GXwA
 1oMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703155116; x=1703759916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GQ/wZukjb9MkID54+svIg/xF+LuLzsv4JVtqMj5aDqg=;
 b=xD+Ct98J8e3ThX1w0AThq5fEd6X/uTsczFSf4n32UVU1OR7wDkXmAbhkzexq/R89OW
 WxZFHmg3EZbspHZ3PYin3Q+VtGTnsU/NcDufPhXDYF+Wwr7K70YDCYcmHh+E7QAkGySo
 YVV+g1ttdl6X57AScZKQv2HlwSq7lsVTlJXmS9o68azzb1ADgR5HvvXiOxviVD0UOl0J
 hxJCm9cxtiwJ+MaZbkrei5rPM/i/wl+61LZgkE2NSObXW+kV2RygLQfunD1q0AKSVExa
 4pnLb8AHF+ilXyzIxqml7CHX5boXwX+1PWs6XjH9F66Hl6b4DX+GsrktQvQIMtMgooVB
 VJZQ==
X-Gm-Message-State: AOJu0YzWyBs3ZjU/gDUnkgIYoXmwwoNfKA+kRCl+ML6bMIYfKs+0n0zv
 243SSzSjVkn59XD6+J415QbGCA==
X-Google-Smtp-Source: AGHT+IGGs3q4Sn+pFrt96v41emu4VX1Cjlc8q5TEXui3ohNwGdr986MkBva+WZWaDOwZaApxoljyhQ==
X-Received: by 2002:a05:600c:6c7:b0:40c:3e6e:5466 with SMTP id
 b7-20020a05600c06c700b0040c3e6e5466mr540732wmn.182.1703155116576; 
 Thu, 21 Dec 2023 02:38:36 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 z6-20020a5d4c86000000b003365fb3247csm1730355wrs.32.2023.12.21.02.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 02:38:34 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C06835F90B;
 Thu, 21 Dec 2023 10:38:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Brian Cain <bcain@quicinc.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Cleber Rosa <crosa@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-s390x@nongnu.org,
 David Woodhouse <dwmw2@infradead.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 37/40] plugins: add an API to read registers
Date: Thu, 21 Dec 2023 10:38:15 +0000
Message-Id: <20231221103818.1633766-38-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221103818.1633766-1-alex.bennee@linaro.org>
References: <20231221103818.1633766-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

We can only request a list of registers once the vCPU has been
initialised so the user needs to use either call the get function on
vCPU initialisation or during the translation phase.

We don't expose the reg number to the plugin instead hiding it behind
an opaque handle. This allows for a bit of future proofing should the
internals need to be changed while also being hashed against the
CPUClass so we can handle different register sets per-vCPU in
hetrogenous situations.

Having an internal state within the plugins also allows us to expand
the interface in future (for example providing callbacks on register
change if the translator can track changes).

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1706
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Based-on: <20231025093128.33116-18-akihiko.odaki@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use new get whole list api, and expose upwards

vAJB:

The main difference to Akikio's version is hiding the gdb register
detail from the plugin for the reasons described above.
---
 include/qemu/qemu-plugin.h   |  53 +++++++++++++++++-
 plugins/api.c                | 102 +++++++++++++++++++++++++++++++++++
 plugins/qemu-plugins.symbols |   2 +
 3 files changed, 155 insertions(+), 2 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 4daab6efd29..e3b35c6ee81 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -11,6 +11,7 @@
 #ifndef QEMU_QEMU_PLUGIN_H
 #define QEMU_QEMU_PLUGIN_H
 
+#include <glib.h>
 #include <inttypes.h>
 #include <stdbool.h>
 #include <stddef.h>
@@ -227,8 +228,8 @@ struct qemu_plugin_insn;
  * @QEMU_PLUGIN_CB_R_REGS: callback reads the CPU's regs
  * @QEMU_PLUGIN_CB_RW_REGS: callback reads and writes the CPU's regs
  *
- * Note: currently unused, plugins cannot read or change system
- * register state.
+ * Note: currently QEMU_PLUGIN_CB_RW_REGS is unused, plugins cannot change
+ * system register state.
  */
 enum qemu_plugin_cb_flags {
     QEMU_PLUGIN_CB_NO_REGS,
@@ -708,4 +709,52 @@ uint64_t qemu_plugin_end_code(void);
 QEMU_PLUGIN_API
 uint64_t qemu_plugin_entry_code(void);
 
+/** struct qemu_plugin_register - Opaque handle for a translated instruction */
+struct qemu_plugin_register;
+
+/**
+ * typedef qemu_plugin_reg_descriptor - register descriptions
+ *
+ * @name: register name
+ * @handle: opaque handle for retrieving value with qemu_plugin_read_register
+ * @feature: optional feature descriptor, can be NULL
+ */
+typedef struct {
+    char name[32];
+    struct qemu_plugin_register *handle;
+    const char *feature;
+} qemu_plugin_reg_descriptor;
+
+/**
+ * qemu_plugin_get_registers() - return register list for vCPU
+ * @vcpu_index: vcpu to query
+ *
+ * Returns a GArray of qemu_plugin_reg_descriptor or NULL. Caller
+ * frees the array (but not the const strings).
+ *
+ * As the register set of a given vCPU is only available once
+ * the vCPU is initialised if you want to monitor registers from the
+ * start you should call this from a qemu_plugin_register_vcpu_init_cb()
+ * callback.
+ */
+GArray * qemu_plugin_get_registers(unsigned int vcpu_index);
+
+/**
+ * qemu_plugin_read_register() - read register
+ *
+ * @vcpu: vcpu index
+ * @handle: a @qemu_plugin_reg_handle handle
+ * @buf: A GByteArray for the data owned by the plugin
+ *
+ * This function is only available in a context that register read access is
+ * explicitly requested.
+ *
+ * Returns the size of the read register. The content of @buf is in target byte
+ * order. On failure returns -1
+ */
+int qemu_plugin_read_register(unsigned int vcpu,
+                              struct qemu_plugin_register *handle,
+                              GByteArray *buf);
+
+
 #endif /* QEMU_QEMU_PLUGIN_H */
diff --git a/plugins/api.c b/plugins/api.c
index ac39cdea0b3..fc1f26e3440 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -8,6 +8,7 @@
  *
  *  qemu_plugin_tb
  *  qemu_plugin_insn
+ *  qemu_plugin_register
  *
  * Which can then be passed back into the API to do additional things.
  * As such all the public functions in here are exported in
@@ -35,10 +36,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/main-loop.h"
 #include "qemu/plugin.h"
 #include "qemu/log.h"
 #include "tcg/tcg.h"
 #include "exec/exec-all.h"
+#include "exec/gdbstub.h"
 #include "exec/ram_addr.h"
 #include "disas/disas.h"
 #include "plugin.h"
@@ -435,3 +438,102 @@ uint64_t qemu_plugin_entry_code(void)
 #endif
     return entry;
 }
+
+/*
+ * Register handles
+ *
+ * The plugin infrastructure keeps hold of these internal data
+ * structures which are presented to plugins as opaque handles. They
+ * are global to the system and therefor additions to the hash table
+ * must be protected by the @reg_handle_lock.
+ *
+ * In order to future proof for up-coming heterogeneous work we want
+ * different entries for each CPU type while sharing them in the
+ * common case of multiple cores of the same type.
+ */
+
+static QemuMutex reg_handle_lock;
+
+struct qemu_plugin_register {
+    const char *name;
+    int gdb_reg_num;
+};
+
+static GHashTable *reg_handles; /* hash table of PluginReg */
+
+/* Generate a stable key - would xxhash be overkill? */
+static gpointer cpu_plus_reg_to_key(CPUState *cs, int gdb_regnum)
+{
+    uintptr_t key = (uintptr_t) cs->cc;
+    key ^= gdb_regnum;
+    return GUINT_TO_POINTER(key);
+}
+
+/*
+ * Create register handles.
+ *
+ * We need to create a handle for each register so the plugin
+ * infrastructure can call gdbstub to read a register. We also
+ * construct a result array with those handles and some ancillary data
+ * the plugin might find useful.
+ */
+
+static GArray * create_register_handles(CPUState *cs, GArray *gdbstub_regs) {
+    GArray *find_data = g_array_new(true, true, sizeof(qemu_plugin_reg_descriptor));
+
+    WITH_QEMU_LOCK_GUARD(&reg_handle_lock) {
+
+        if (!reg_handles) {
+            reg_handles = g_hash_table_new(g_direct_hash, g_direct_equal);
+        }
+
+        for (int i=0; i < gdbstub_regs->len; i++) {
+            GDBRegDesc *grd = &g_array_index(gdbstub_regs, GDBRegDesc, i);
+            gpointer key = cpu_plus_reg_to_key(cs, grd->gdb_reg);
+            struct qemu_plugin_register *val = g_hash_table_lookup(reg_handles, key);
+
+            /* Doesn't exist, create one */
+            if (!val) {
+                val = g_new0(struct qemu_plugin_register, 1);
+                val->gdb_reg_num = grd->gdb_reg;
+                val->name = grd->name;
+
+                g_hash_table_insert(reg_handles, key, val);
+            }
+
+            /* Create a record for the plugin */
+            qemu_plugin_reg_descriptor desc = {
+                .handle = val,
+                .feature = g_intern_string(grd->feature_name)
+            };
+            g_strlcpy(desc.name, val->name, sizeof(desc.name));
+            g_array_append_val(find_data, desc);
+        }
+    }
+
+    return find_data;
+}
+
+GArray * qemu_plugin_get_registers(unsigned int vcpu)
+{
+    CPUState *cs = qemu_get_cpu(vcpu);
+    if (cs) {
+        g_autoptr(GArray) regs = gdb_get_register_list(cs);
+        return regs->len ? create_register_handles(cs, regs) : NULL;
+    } else {
+        return NULL;
+    }
+}
+
+int qemu_plugin_read_register(unsigned int vcpu, struct qemu_plugin_register *reg, GByteArray *buf)
+{
+    CPUState *cs = qemu_get_cpu(vcpu);
+    /* assert with debugging on? */
+    return gdb_read_register(cs, buf, reg->gdb_reg_num);
+}
+
+static void __attribute__((__constructor__)) qemu_api_init(void)
+{
+    qemu_mutex_init(&reg_handle_lock);
+
+}
diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 71f6c90549d..6963585c1ea 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -3,6 +3,7 @@
   qemu_plugin_end_code;
   qemu_plugin_entry_code;
   qemu_plugin_get_hwaddr;
+  qemu_plugin_get_registers;
   qemu_plugin_hwaddr_device_name;
   qemu_plugin_hwaddr_is_io;
   qemu_plugin_hwaddr_phys_addr;
@@ -20,6 +21,7 @@
   qemu_plugin_n_vcpus;
   qemu_plugin_outs;
   qemu_plugin_path_to_binary;
+  qemu_plugin_read_register;
   qemu_plugin_register_atexit_cb;
   qemu_plugin_register_flush_cb;
   qemu_plugin_register_vcpu_exit_cb;
-- 
2.39.2


