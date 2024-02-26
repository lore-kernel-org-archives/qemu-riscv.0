Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D74C48BF6
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 16:57:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1reeIG-0005o5-E2; Mon, 26 Feb 2024 11:57:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1reeHv-0005cB-9U
 for qemu-riscv@nongnu.org; Mon, 26 Feb 2024 11:57:11 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1reeHb-0007c5-T5
 for qemu-riscv@nongnu.org; Mon, 26 Feb 2024 11:57:10 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33d118a181fso2235972f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 26 Feb 2024 08:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708966610; x=1709571410; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/6OMZ0loRFGpvJj8x2xSy3ZdDA+ZTmmsIgUpBxK3Sio=;
 b=ovqHkjBlWJNm/dAKJxYpC+A6nvh8HdFyyZmgXoa3UeMYz7bDsoiIvKTPZAkgiHr4cI
 o9yCEpCEjsI3zLUMSi5jNlrOqNa7uL9onDpV7S/e4HOIlLlrW/7z6/5UJEdH1qjQO66l
 4pmEs3uV+PEFlwfeMdK5ZPURgVKIPXwtP0Rac1kObc6Af9NB4f0zhP0HtJ70buvmlaCV
 k/O5+/7LKQzLJzVlD39pn0HURdjU+2Xde9Ns9flF++q0pIlzp7krcAz1p4Sfi0K5sEtx
 gPJbzcFVAV/LIELVBVA+G0n/rr+/VufHdDcvJpV1MORg8C2fjlIEAX28WsqarZ6KGGym
 eqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708966610; x=1709571410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/6OMZ0loRFGpvJj8x2xSy3ZdDA+ZTmmsIgUpBxK3Sio=;
 b=YUeXWSyF7Bq0bx7TiHWLUvJJYK3ja10xS1YhJiNXbKlMx/JPTyio2OV5cgIDM2dL2K
 i3ypJvAJVwNOwnxCgu2jUvCaWTQB/Y3pN6MKFGDoZlQ4CdEdIG3r2XvWlSdbnp7FVpvE
 qItzTPn9AAhWdTS/WB5XlfYyHa8Udpop7+tXzlW4Yf2LC7HbeC/Kl8GiQ7RnnhBkV9Ur
 UNzW/huXLXhBhG/w6ZF7mVNmoS6/dn9lfMOMV1Srr/v7R7F73HAqVx0Lc/6lQVRQdwWv
 a8Nac5X4+eDe8sq37o1XXrlk6w/08fPMK9lJIZpKJf76buaquoUv3PCyTSGY/rqoXW29
 XZ3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB3baXIEQIIh9rzxiM5RnLUjuVSqrpAZLftjCQIxJC12PQKp/fsXs6TgsFEBNOtjc08de3u4C8zwy2KD9mhpUlWhf5Q7A=
X-Gm-Message-State: AOJu0YzjCt3JN0uSsiRnqxSbelg2cqD0E26bePq2MkMhJrYHSpU8/w0b
 N2EmDT7k6OB+KpVVhq3yNta2jXu4Llvn1075/Hs5hZqEOFtNJEnj8MSh0ZK93WA=
X-Google-Smtp-Source: AGHT+IH7aU77emJxuTuY9V4u09abRWJ5lU2OKuRmj77Axa8ySUbHgdV5wRwwQDrF9oaIRCqfHPaDPQ==
X-Received: by 2002:adf:fc01:0:b0:33d:a185:17ed with SMTP id
 i1-20020adffc01000000b0033da18517edmr4554880wrr.56.1708966610090; 
 Mon, 26 Feb 2024 08:56:50 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 bx27-20020a5d5b1b000000b0033daa63807fsm8976587wrb.24.2024.02.26.08.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 08:56:47 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 15E7F5F904;
 Mon, 26 Feb 2024 16:56:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-riscv@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Alexandre Iooss <erdnaxe@crans.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-s390x@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Brian Cain <bcain@quicinc.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 04/27] target/ppc: Use GDBFeature for dynamic XML
Date: Mon, 26 Feb 2024 16:56:23 +0000
Message-Id: <20240226165646.425600-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226165646.425600-1-alex.bennee@linaro.org>
References: <20240226165646.425600-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

In preparation for a change to use GDBFeature as a parameter of
gdb_register_coprocessor(), convert the internal representation of
dynamic feature from plain XML to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240103173349.398526-28-alex.bennee@linaro.org>
Message-Id: <20231213-gdb-v17-2-777047380591@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/ppc/cpu-qom.h  |  1 +
 target/ppc/cpu.h      |  4 +---
 target/ppc/cpu_init.c |  4 ----
 target/ppc/gdbstub.c  | 51 ++++++++++++++++---------------------------
 4 files changed, 21 insertions(+), 39 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 0241609efef..8247fa23367 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -20,6 +20,7 @@
 #ifndef QEMU_PPC_CPU_QOM_H
 #define QEMU_PPC_CPU_QOM_H
 
+#include "exec/gdbstub.h"
 #include "hw/core/cpu.h"
 
 #ifdef TARGET_PPC64
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index ec14574d142..c66989a5e60 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1492,8 +1492,7 @@ struct PowerPCCPUClass {
     int bfd_mach;
     uint32_t l1_dcache_size, l1_icache_size;
 #ifndef CONFIG_USER_ONLY
-    unsigned int gdb_num_sprs;
-    const char *gdb_spr_xml;
+    GDBFeature gdb_spr;
 #endif
     const PPCHash64Options *hash64_opts;
     struct ppc_radix_page_info *radix_page_info;
@@ -1546,7 +1545,6 @@ int ppc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int ppc_cpu_gdb_write_register_apple(CPUState *cpu, uint8_t *buf, int reg);
 #ifndef CONFIG_USER_ONLY
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu);
 const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name);
 #endif
 int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 9bccddb350c..5f0ecf443d8 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6682,10 +6682,6 @@ static void init_ppc_proc(PowerPCCPU *cpu)
     /* PowerPC implementation specific initialisations (SPRs, timers, ...) */
     (*pcc->init_proc)(env);
 
-#if !defined(CONFIG_USER_ONLY)
-    ppc_gdb_gen_spr_xml(cpu);
-#endif
-
     /* MSR bits & flags consistency checks */
     if (env->msr_mask & (1 << 25)) {
         switch (env->flags & (POWERPC_FLAG_SPE | POWERPC_FLAG_VRE)) {
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index dfe31d0f47f..c4c55961083 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -300,15 +300,23 @@ int ppc_cpu_gdb_write_register_apple(CPUState *cs, uint8_t *mem_buf, int n)
 }
 
 #ifndef CONFIG_USER_ONLY
-void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu)
+static void gdb_gen_spr_feature(CPUState *cs)
 {
-    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
+    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
-    GString *xml;
-    char *spr_name;
+    GDBFeatureBuilder builder;
     unsigned int num_regs = 0;
     int i;
 
+    if (pcc->gdb_spr.xml) {
+        return;
+    }
+
+    gdb_feature_builder_init(&builder, &pcc->gdb_spr,
+                             "org.qemu.power.spr", "power-spr.xml",
+                             cs->gdb_num_regs);
+
     for (i = 0; i < ARRAY_SIZE(env->spr_cb); i++) {
         ppc_spr_t *spr = &env->spr_cb[i];
 
@@ -326,35 +334,13 @@ void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu)
          */
         spr->gdb_id = num_regs;
         num_regs++;
-    }
-
-    if (pcc->gdb_spr_xml) {
-        return;
-    }
 
-    xml = g_string_new("<?xml version=\"1.0\"?>");
-    g_string_append(xml, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append(xml, "<feature name=\"org.qemu.power.spr\">");
-
-    for (i = 0; i < ARRAY_SIZE(env->spr_cb); i++) {
-        ppc_spr_t *spr = &env->spr_cb[i];
-
-        if (!spr->name) {
-            continue;
-        }
-
-        spr_name = g_ascii_strdown(spr->name, -1);
-        g_string_append_printf(xml, "<reg name=\"%s\"", spr_name);
-        g_free(spr_name);
-
-        g_string_append_printf(xml, " bitsize=\"%d\"", TARGET_LONG_BITS);
-        g_string_append(xml, " group=\"spr\"/>");
+        gdb_feature_builder_append_reg(&builder, g_ascii_strdown(spr->name, -1),
+                                       TARGET_LONG_BITS, num_regs,
+                                       "int", "spr");
     }
 
-    g_string_append(xml, "</feature>");
-
-    pcc->gdb_num_sprs = num_regs;
-    pcc->gdb_spr_xml = g_string_free(xml, false);
+    gdb_feature_builder_end(&builder);
 }
 
 const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name)
@@ -362,7 +348,7 @@ const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name)
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
 
     if (strcmp(xml_name, "power-spr.xml") == 0) {
-        return pcc->gdb_spr_xml;
+        return pcc->gdb_spr.xml;
     }
     return NULL;
 }
@@ -635,7 +621,8 @@ void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *pcc)
                                  32, "power-vsx.xml", 0);
     }
 #ifndef CONFIG_USER_ONLY
+    gdb_gen_spr_feature(cs);
     gdb_register_coprocessor(cs, gdb_get_spr_reg, gdb_set_spr_reg,
-                             pcc->gdb_num_sprs, "power-spr.xml", 0);
+                             pcc->gdb_spr.num_regs, "power-spr.xml", 0);
 #endif
 }
-- 
2.39.2


