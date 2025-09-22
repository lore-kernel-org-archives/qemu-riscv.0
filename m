Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4617CAC5AD
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 09:40:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v0d0p-0004dz-NZ; Mon, 22 Sep 2025 05:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czi-0002UP-Lr
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:38:06 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czC-0000gr-CB
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:38:02 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46cbdf513d7so9882505e9.2
 for <qemu-riscv@nongnu.org>; Mon, 22 Sep 2025 02:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758533848; x=1759138648; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6IMWbDFgDEMOUiMUfT2TDkGRm3klPMgO+lre4zsnFwM=;
 b=ylLRNwcsrOhMLbtImmXvXmGlCCW+qQj8xvLlirvqN9JgzkiRd9b2YoFfSbrQ8/w9Ib
 8ZcK1JGpazrFwwaUEfbBa2Cgzr4k29u76bF+S2C1uMZ52Q1pkWIWVYFsK4oHumHspEZn
 WQEi0PCRwGER/U92RIXnmxzvi98EAr5GAOynSFUjgxKcfnuJCWfaQf6mCxMd84vl5Hqc
 VECnUtF+1Fb1MpQCww7VlRyXSj5EgYvphtOk9OLbw2bfO1pDbtEAS8+9s19wesXc35t7
 K2XD0lXCeRPTa2EqyWlTKjg52ri8ZUbKBHsotzLTVu0sJwGpYF0mo7goQX7EWc/YTk0+
 Lvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758533848; x=1759138648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6IMWbDFgDEMOUiMUfT2TDkGRm3klPMgO+lre4zsnFwM=;
 b=eX6h/MqEaDeiHgN707zpjJyy3EpFwEaXP0OVhW9DgAyuj8SGHQ+XEogm58xri4Tyts
 GAaU9Pp+xUOHv4gMemQmF2FQdTX4Nz26rt7le2tHO4ZAuMhb+EsniJLJ06FATzMutZaU
 IiGBovqei692awXQqqeKvBWaIlbX2EjIoMezpvPd4DHQPwddpXY4FVB0AizxZyguLy9d
 mjodvFCwPOsO5HwLx0ed0OruNNymFmIObLevYjORMkTgrjG1/PucdznCh7ZOX4TWAAao
 QTUTSwXDNDpX/QlIGlQhQD5WnZVzaJ0xuBTAneIKHO/srgj+44LyUMMWqdz4ZSi3dYep
 AmeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3vbAMF+gsWHhCxjP8OU4V3tE9W8gapUELJVNOAY4enViblvrJm5CcetOege7BIlFUOft6Jt0U0u2g@nongnu.org
X-Gm-Message-State: AOJu0YzHLfSPI2fxb3kfcqeI4zcKbYf4OM7i8w5zBhYkK4QVPP8oNK6U
 d6muGlzOQyireAQaQbZ81pU9QmMjDObRUNjBn7hvDkHrTGrvPerXv98YcYwGEPAQLzg=
X-Gm-Gg: ASbGncvBb0J7tqaOMF6UmKsCsXNeAg4tBBJqusMrrJEyBUd2eRNOkwVEYryCHU/P1Xs
 Iy0NaFNg76Ig7K6ny2eQZT/2YjJx/e3BKqYT6uwR5qkJrxFP0v8lEbCawPa/3m8ZKbM50ZAwk5e
 pbvaoDYWvHJBSHJ8QnFvi+ZsQ5nVZv6WLth28fO1AarC99zgTPapKeBUoehwxzOejZeqUjSFGaP
 LVCfcWvgR+7WDw6O4sIOBrFWgUa7/k8hEX9ARHworgjrxTGbeLFNzmc9VLXconM0HDbG32Wze85
 qOUk9alqKoiyElWGTsAKpFvr9TDRZuMpO27EPuNvp2iZu/M9FgmAjjRHnbjuYnlLROM2EstQ5Dc
 EPF67xswPYOtp6J69qhBGhTg=
X-Google-Smtp-Source: AGHT+IHzcbP4ZgAQ4czQX/WUR2ZTlhWheiedH3ZK+CqlCjpak/wZDsCWom84WogTfvuujwoB7Ghnwg==
X-Received: by 2002:a05:6000:42c9:b0:3f7:b7ac:f3aa with SMTP id
 ffacd0b85a97d-3f7b7acf7e9mr3396731f8f.29.1758533847808; 
 Mon, 22 Sep 2025 02:37:27 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3fd84338ca2sm4200856f8f.42.2025.09.22.02.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:37:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2C5255FA29;
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
Subject: [PATCH 17/25] contrib/plugins/uftrace: skeleton file
Date: Mon, 22 Sep 2025 10:37:02 +0100
Message-ID: <20250922093711.2768983-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922093711.2768983-1-alex.bennee@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

We define a scoreboard that will hold our data per cpu. As well, we
define a buffer per cpu that will be used to read registers and memories
in a thread-safe way.

For now, we just instrument all instructions with an empty callback.

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20250902075042.223990-2-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/uftrace.c   | 73 +++++++++++++++++++++++++++++++++++++
 contrib/plugins/meson.build |  3 +-
 2 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 contrib/plugins/uftrace.c

diff --git a/contrib/plugins/uftrace.c b/contrib/plugins/uftrace.c
new file mode 100644
index 00000000000..4af0130b159
--- /dev/null
+++ b/contrib/plugins/uftrace.c
@@ -0,0 +1,73 @@
+/*
+ * Copyright (C) 2025, Pierrick Bouvier <pierrick.bouvier@linaro.org>
+ *
+ * Generates a trace compatible with uftrace (similar to uftrace record).
+ * https://github.com/namhyung/uftrace
+ *
+ * See docs/about/emulation.rst|Uftrace for details and examples.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <qemu-plugin.h>
+#include <glib.h>
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+
+typedef struct Cpu {
+    GByteArray *buf;
+} Cpu;
+
+static struct qemu_plugin_scoreboard *score;
+
+static void track_callstack(unsigned int cpu_index, void *udata)
+{
+}
+
+static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
+{
+    size_t n_insns = qemu_plugin_tb_n_insns(tb);
+
+    for (size_t i = 0; i < n_insns; i++) {
+        struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, i);
+
+        uintptr_t pc = qemu_plugin_insn_vaddr(insn);
+        qemu_plugin_register_vcpu_insn_exec_cb(insn, track_callstack,
+                                               QEMU_PLUGIN_CB_R_REGS,
+                                               (void *) pc);
+    }
+}
+
+static void vcpu_init(qemu_plugin_id_t id, unsigned int vcpu_index)
+{
+    Cpu *cpu = qemu_plugin_scoreboard_find(score, vcpu_index);
+    cpu->buf = g_byte_array_new();
+}
+
+static void vcpu_end(unsigned int vcpu_index)
+{
+    Cpu *cpu = qemu_plugin_scoreboard_find(score, vcpu_index);
+    g_byte_array_free(cpu->buf, true);
+    memset(cpu, 0, sizeof(Cpu));
+}
+
+static void at_exit(qemu_plugin_id_t id, void *data)
+{
+    for (size_t i = 0; i < qemu_plugin_num_vcpus(); ++i) {
+        vcpu_end(i);
+    }
+
+    qemu_plugin_scoreboard_free(score);
+}
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
+                                           const qemu_info_t *info,
+                                           int argc, char **argv)
+{
+    score = qemu_plugin_scoreboard_new(sizeof(Cpu));
+    qemu_plugin_register_vcpu_init_cb(id, vcpu_init);
+    qemu_plugin_register_atexit_cb(id, at_exit, NULL);
+    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
+
+    return 0;
+}
diff --git a/contrib/plugins/meson.build b/contrib/plugins/meson.build
index 1876bc78438..7eb3629c95d 100644
--- a/contrib/plugins/meson.build
+++ b/contrib/plugins/meson.build
@@ -1,5 +1,6 @@
 contrib_plugins = ['bbv', 'cache', 'cflow', 'drcov', 'execlog', 'hotblocks',
-                   'hotpages', 'howvec', 'hwprofile', 'ips', 'stoptrigger']
+                   'hotpages', 'howvec', 'hwprofile', 'ips', 'stoptrigger',
+                   'uftrace']
 if host_os != 'windows'
   # lockstep uses socket.h
   contrib_plugins += 'lockstep'
-- 
2.47.3


