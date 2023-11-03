Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5F0C4332F
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 20:07:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qz0Qy-0003sZ-Oj; Fri, 03 Nov 2023 16:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0Qs-0003cs-OP
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:06:18 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0Qj-0006wv-Ss
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:06:18 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40842752c6eso18809955e9.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Nov 2023 13:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699041968; x=1699646768; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3BIf7/hKITxMMftVrPZ9EbRbAEu+bIjc+oIaOv86blM=;
 b=pPwPbWcnvw0533t1472Jdor7bm94M2Kp0cw5iL6ACcrl5qaI7i1lax5Tggg+w6gKyJ
 czkEg5wfgGX8y/J0gt8SJlxo0chnkWEFmRav+dfCJ3IhO0n+H9hMekon0pULa4ow66Zy
 /prhg2ueN2oYCQNjw9OlT9vr9iZxbagiYtlyqvJXah1UqWFHm6xx3UFvaHMdiOq/bEwz
 7ITxUyDsm8D2DAKUSAFj6otx7ooeGryeSah4mS9i/ZOU4JTiKTfoFzG38ZemlH8Cc/dN
 6i0KlmqkgxoSH2Fr4KKv9u721pGjsTI0qhyxXaTbb3axc+BOEm7oYVM3mpYrsOjNKFuB
 D9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699041968; x=1699646768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3BIf7/hKITxMMftVrPZ9EbRbAEu+bIjc+oIaOv86blM=;
 b=Sqj9X8wK3xQzsV5UKTFBIlqe176PLwZHTN7t97yTKeGfcm1Tk+0czoWEgGhG0kN/h9
 BcmN676lsfg6EFPanIQO4BNZvuBMTuCujOlH9lpf6AaLpxDFoTVDvrq8YqSkLUw3tD8O
 igLZ2bxc3tdgzNVhNB1M692T2tKAMQcaborcitXZ0X82ZcefandVy2sFtc3t1+sgIE4s
 y/Fzpz4dRsHj23CXTK+q2JUI0gb5eGvDZuBkM0qzyC1smlKBX6KxrSNeWeWlYlBGZLhS
 L5rAz6+X+frqyJZazKi0YNAhZ0uGJALKGp6HJjZEj/bRjNINlgK8RjBJKJ8TatzWYapq
 q+xQ==
X-Gm-Message-State: AOJu0Yymg9HpbFSoJCSiqHnoJ4lrmH/WF8TNDsrdVA0Vdsp905V94AJn
 HSErgLeW2w68bF3y4mKqwy1FJA==
X-Google-Smtp-Source: AGHT+IHynNie37gxETRZRgxTEnUTXb0kFU+hRYXsXYse/cvUlPCrK31uEnj0Ca9Un7O1UrOZixS/zA==
X-Received: by 2002:a05:600c:4449:b0:408:4120:bab7 with SMTP id
 v9-20020a05600c444900b004084120bab7mr19208320wmn.15.1699041968020; 
 Fri, 03 Nov 2023 13:06:08 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c35d200b00401e32b25adsm3573036wmq.4.2023.11.03.13.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 13:06:05 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5904F65754;
 Fri,  3 Nov 2023 19:59:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Brian Cain <bcain@quicinc.com>, qemu-ppc@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 24/29] plugins: add an API to read registers
Date: Fri,  3 Nov 2023 19:59:51 +0000
Message-Id: <20231103195956.1998255-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103195956.1998255-1-alex.bennee@linaro.org>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
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
initialised so the user needs to use either call the find function on
vCPU initialisation or during the translation phase. We don't expose
the reg number to the plugin instead hiding it behind an opaque
handle. This allows for a bit of future proofing should the internals
need to be changed while also being hashed against the CPUClass so we
can handle different register sets per-vCPU in hetrogenous situations.

Having an internal state within the plugins also allows us to expand
the interface in future (for example providing callbacks on register
change if the translator can track changes).

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1706
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Based-on: <20231025093128.33116-18-akihiko.odaki@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
vAJB:

The main difference to Akikio's version is hiding the gdb register
detail from the plugin for the reasons described above.
---
 include/qemu/qemu-plugin.h   |  52 +++++++++++++++++-
 plugins/api.c                | 102 +++++++++++++++++++++++++++++++++++
 plugins/qemu-plugins.symbols |   2 +
 3 files changed, 154 insertions(+), 2 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 50a9957279..e5c16df5ca 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -11,6 +11,7 @@
 #ifndef QEMU_QEMU_PLUGIN_H
 #define QEMU_QEMU_PLUGIN_H
 
+#include <glib.h>
 #include <inttypes.h>
 #include <stdbool.h>
 #include <stddef.h>
@@ -218,8 +219,8 @@ struct qemu_plugin_insn;
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
@@ -664,4 +665,51 @@ uint64_t qemu_plugin_end_code(void);
  */
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
+ * qemu_plugin_find_registers() - return register list
+ * @vcpu_index: vcpu to query
+ * @reg_pattern: register name pattern
+ *
+ * Returns a GArray of qemu_plugin_reg_descriptor or NULL. Caller
+ * frees. As the register set of a given vCPU is only available once
+ * the vCPU is initialised if you want to monitor registers from the
+ * start you should call this from a qemu_plugin_register_vcpu_init_cb()
+ * callback.
+ */
+GArray * qemu_plugin_find_registers(unsigned int vcpu_index, const char *reg_pattern);
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
index ac39cdea0b..2644af5bb3 100644
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
+GArray * qemu_plugin_find_registers(unsigned int vcpu, const char *reg_pattern)
+{
+    CPUState *cs = qemu_get_cpu(vcpu);
+    if (cs) {
+        g_autoptr(GArray) regs = gdb_find_registers(cs, reg_pattern);
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
index 71f6c90549..86928f5f50 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -42,4 +42,6 @@
   qemu_plugin_tb_vaddr;
   qemu_plugin_uninstall;
   qemu_plugin_vcpu_for_each;
+  qemu_plugin_find_registers;
+  qemu_plugin_read_register;
 };
-- 
2.39.2


