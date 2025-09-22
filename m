Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F41CAC5AC
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 09:44:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v0d5m-0005ji-AO; Mon, 22 Sep 2025 05:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0d50-0005Ij-Vv
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:43:33 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0d4n-0001zg-Rk
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:43:30 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45dcff2f313so24450505e9.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Sep 2025 02:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758534193; x=1759138993; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7GRsJV0VAPOLcd8y8nlS+oqJKDqNktygqxz6o8+pfd4=;
 b=JQz1DxL8QuRXlkOTtdHivr6qOQRQ7jVEHe1DNBfmnTl2u98Pz36JnbO/Kc0h+pM+Ge
 iZFjfhckIpEoBmCKj8BnH0/uCGbJ4k0k0+w3xQHOXXlTHwhWx7eNNXx0WHfy0HThXamb
 LbLlD1Ej5Nrv+R6gQVfk2lRo1/4BnkdjT/7iI3UgFl5gdXZNBBh5tfxplOvA6rEmwmSg
 zE8McGCoqnUHwex2UIgAgvscTM8tgQWq2Ijs+UBQQSPynoxcxm0oGYVug9I+McQsAXkV
 h5+s/J/rCy7NxJtPeWtKV834svC6NGFVOW3XErVsdxSBU5xkwZikwZ6i/s/FJKYa7bWU
 J20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758534193; x=1759138993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7GRsJV0VAPOLcd8y8nlS+oqJKDqNktygqxz6o8+pfd4=;
 b=Yt7Iw2S/k6jPocF7hnYtVcLjp5cpAyHABMavodXJfr3vGAqV2hSrR4mqmg7lar5cr0
 EW6E4sHfDwsgzBUeetLCi9lCNv4W5FI23aMkVo6gpowcCCL9btpn0ol7l+C1bk1QvlYe
 XEL8rjvtwD56Lp4O3/P5ZOZQfWqmEihpoc0od7vATXh+k13d+ISQ0QnWmF54dThi31Y4
 lrfgCjO/Ikl6Fx03LVviAwZkzJN2AY5R5LRg3Z/UScw3w8m/I40MxocCqdd6j1SSG9Jn
 Lsu1FXn6w/Dbpp0GOIlyz3DJOSBldZoMNQ+RiIio5drpi3afuMgIuLwtu2Oo2SluarBA
 IGXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBEDeSTtZhJndCxiltknkBQP5yb2bHGPAaukeN0vm15sr/F671Sz53bRfFr7jeF24Zc3NtVxKtJZBM@nongnu.org
X-Gm-Message-State: AOJu0Yw6ty3jvETvY8+ZXg/0G0Ol6DLZJDMwVnOt+PtmvUeZ4gPnOLY6
 c9b748OZV4bZd2Avdk/aF5o81jCx2k1HK7A/LpF+kSWYL0aUfxJlVxoDg2nROIJOQ6k=
X-Gm-Gg: ASbGncuAIFsS3zEZAA1E2hAZuDvu0qmME0xYaH2d9kyuhiCl1rT2bV0ZPeqPALGymzd
 cY6BQ3nrTehvo7CZFn+6Ilk/sQRbtuKSYOVtyVmG5AeJPd1ri4BLBV3W/IUMRM35LbahGE9wpk5
 3PHA8Mhv/IDmMhSmLzPr54zNJYHKv9uO30Eymnz9dFRueHPgxiB4nqnGAROQry+xjpbiREEazHs
 pC8hZeJozX83hZtvhANQNGuf6qUmG+Qb8s2M3pImZGvBBUaFVY6ypbvguKHIgesDZWVitb6MAMT
 GBVDoUaZ918ZcFpCGNmq6Bs8sC3ZGFDOeQ+aThxZbUeeUqGGrdPXwwycLnP9YYkmB175JH3YOJE
 X7lrQMle9E2V7t3LBuaugRHc=
X-Google-Smtp-Source: AGHT+IGog4+Y0WnU5KswDpjQ1MvsxTCEtNhvD3dapvSYl1WAcp7YJ15rUMx6prxALge0mIrPKtA+PA==
X-Received: by 2002:a05:600c:3593:b0:45b:8477:de1a with SMTP id
 5b1f17b1804b1-467ead67316mr122960165e9.7.1758534193220; 
 Mon, 22 Sep 2025 02:43:13 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-464f527d6cdsm220145955e9.12.2025.09.22.02.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:43:09 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 42BE95FA2E;
 Mon, 22 Sep 2025 10:37:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH 18/25] contrib/plugins/uftrace: define cpu operations and
 implement aarch64
Date: Mon, 22 Sep 2025 10:37:03 +0100
Message-ID: <20250922093711.2768983-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922093711.2768983-1-alex.bennee@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

We define a new CpuOps structure that will be used to implement tracking
independently of guest architecture.

As well, we now instrument only instructions following ones that might
have touched the frame pointer.

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20250902075042.223990-3-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/uftrace.c | 114 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 110 insertions(+), 4 deletions(-)

diff --git a/contrib/plugins/uftrace.c b/contrib/plugins/uftrace.c
index 4af0130b159..d060513446c 100644
--- a/contrib/plugins/uftrace.c
+++ b/contrib/plugins/uftrace.c
@@ -11,14 +11,94 @@
 
 #include <qemu-plugin.h>
 #include <glib.h>
+#include <stdio.h>
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 
+typedef struct Cpu Cpu;
+
+typedef struct {
+    void (*init)(Cpu *cpu);
+    void (*end)(Cpu *cpu);
+    uint64_t (*get_frame_pointer)(Cpu *cpu);
+    bool (*does_insn_modify_frame_pointer)(const char *disas);
+} CpuOps;
+
 typedef struct Cpu {
     GByteArray *buf;
+    CpuOps ops;
+    void *arch;
 } Cpu;
 
+typedef struct {
+    struct qemu_plugin_register *reg_fp;
+} Aarch64Cpu;
+
 static struct qemu_plugin_scoreboard *score;
+static CpuOps arch_ops;
+
+static uint64_t cpu_read_register64(Cpu *cpu, struct qemu_plugin_register *reg)
+{
+    GByteArray *buf = cpu->buf;
+    g_byte_array_set_size(buf, 0);
+    size_t sz = qemu_plugin_read_register(reg, buf);
+    g_assert(sz == 8);
+    g_assert(buf->len == 8);
+    return *((uint64_t *) buf->data);
+}
+
+static struct qemu_plugin_register *plugin_find_register(const char *name)
+{
+    g_autoptr(GArray) regs = qemu_plugin_get_registers();
+    for (int i = 0; i < regs->len; ++i) {
+        qemu_plugin_reg_descriptor *reg;
+        reg = &g_array_index(regs, qemu_plugin_reg_descriptor, i);
+        if (!strcmp(reg->name, name)) {
+            return reg->handle;
+        }
+    }
+    return NULL;
+}
+
+static uint64_t aarch64_get_frame_pointer(Cpu *cpu_)
+{
+    Aarch64Cpu *cpu = cpu_->arch;
+    return cpu_read_register64(cpu_, cpu->reg_fp);
+}
+
+static void aarch64_init(Cpu *cpu_)
+{
+    Aarch64Cpu *cpu = g_new0(Aarch64Cpu, 1);
+    cpu_->arch = cpu;
+    cpu->reg_fp = plugin_find_register("x29");
+    if (!cpu->reg_fp) {
+        fprintf(stderr, "uftrace plugin: frame pointer register (x29) is not "
+                        "available. Please use an AArch64 cpu (or -cpu max).\n");
+        g_abort();
+    }
+}
+
+static void aarch64_end(Cpu *cpu)
+{
+    g_free(cpu->arch);
+}
+
+static bool aarch64_does_insn_modify_frame_pointer(const char *disas)
+{
+    /*
+     * Check if current instruction concerns fp register "x29".
+     * We add a prefix space to make sure we don't match addresses dump
+     * in disassembly.
+     */
+    return strstr(disas, " x29");
+}
+
+static CpuOps aarch64_ops = {
+    .init = aarch64_init,
+    .end = aarch64_end,
+    .get_frame_pointer = aarch64_get_frame_pointer,
+    .does_insn_modify_frame_pointer = aarch64_does_insn_modify_frame_pointer,
+};
 
 static void track_callstack(unsigned int cpu_index, void *udata)
 {
@@ -28,19 +108,37 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
 {
     size_t n_insns = qemu_plugin_tb_n_insns(tb);
 
+    /*
+     * Callbacks and inline instrumentation are inserted before an instruction.
+     * Thus, to see instruction effect, we need to wait for next one.
+     * Potentially, the last instruction of a block could modify the frame
+     * pointer. Thus, we need to always instrument first instruction in a tb.
+     */
+    bool instrument_insn = true;
     for (size_t i = 0; i < n_insns; i++) {
         struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, i);
 
-        uintptr_t pc = qemu_plugin_insn_vaddr(insn);
-        qemu_plugin_register_vcpu_insn_exec_cb(insn, track_callstack,
-                                               QEMU_PLUGIN_CB_R_REGS,
-                                               (void *) pc);
+        if (instrument_insn) {
+            uintptr_t pc = qemu_plugin_insn_vaddr(insn);
+            qemu_plugin_register_vcpu_insn_exec_cb(insn, track_callstack,
+                                                   QEMU_PLUGIN_CB_R_REGS,
+                                                   (void *) pc);
+            instrument_insn = false;
+        }
+
+        char *disas = qemu_plugin_insn_disas(insn);
+        if (arch_ops.does_insn_modify_frame_pointer(disas)) {
+            instrument_insn = true;
+        }
     }
 }
 
 static void vcpu_init(qemu_plugin_id_t id, unsigned int vcpu_index)
 {
     Cpu *cpu = qemu_plugin_scoreboard_find(score, vcpu_index);
+    cpu->ops = arch_ops;
+
+    cpu->ops.init(cpu);
     cpu->buf = g_byte_array_new();
 }
 
@@ -64,6 +162,14 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info,
                                            int argc, char **argv)
 {
+    if (!strcmp(info->target_name, "aarch64")) {
+        arch_ops = aarch64_ops;
+    } else {
+        fprintf(stderr, "plugin uftrace: %s target is not supported\n",
+                info->target_name);
+        return 1;
+    }
+
     score = qemu_plugin_scoreboard_new(sizeof(Cpu));
     qemu_plugin_register_vcpu_init_cb(id, vcpu_init);
     qemu_plugin_register_atexit_cb(id, at_exit, NULL);
-- 
2.47.3


