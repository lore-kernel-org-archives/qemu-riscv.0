Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA7BC48260
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 16:31:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rb16q-0004bK-Ix; Fri, 16 Feb 2024 11:30:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rb16o-0004YT-Ac
 for qemu-riscv@nongnu.org; Fri, 16 Feb 2024 11:30:42 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rb16e-0002Ak-75
 for qemu-riscv@nongnu.org; Fri, 16 Feb 2024 11:30:42 -0500
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d0c7e6b240so30355031fa.0
 for <qemu-riscv@nongnu.org>; Fri, 16 Feb 2024 08:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708101030; x=1708705830; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E8QhIidXtm1KWUMz6R6/HNvg/qk4Sel77EmOGwDTHnU=;
 b=dgr9S6daOqP5CXmvIQtjeWlB1YwoIIEYSvRow5lY3q1S86w9WTSlr2QC/7vWzX+e0q
 F8/TBxc+ki6TaYe3q4WmgB2EriqH8BaZYtMGrBvBvOVnGOirQ/j8lypYMC5TiTMtuNHB
 QxXq3vIp/1+r3EOK8NuRsMtamRSJl1garfJBsDgXYMPZT/2gHu7G16GaozuR4Mevz3L8
 3vjTJZbEmqrAZUSo+d9K+viPGYGnW0D1z43nN8gaPnXBqLOcQiROXcyJ1O+6HYyXPjlv
 cr+FlV5E4nIfQ+DrDyLGpi2YaX9oMvqHKzzZqkHKz54qjVmKP4dSmpho8S5SeeJLyPQ8
 aKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708101030; x=1708705830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E8QhIidXtm1KWUMz6R6/HNvg/qk4Sel77EmOGwDTHnU=;
 b=eGi3u6MzLhTkP6ubUEl7QP3A0yd5ijF8VPKRB16q0mG9oFTKtCJDYHn6P1Aw2ZLTla
 Xw43Im6lnxMgAWa8/Dpfcs+9WDlIbWuyQuKZ9U4hA479ZPDlAGS1l2NGLSieZYEliJ9G
 kEiSaL1YimGB7P0yYLJqrPgxmnDuqkQK2O3y0Y2VpPXRhUwtbdC28l0/0iIcIpAGgq23
 UAA0kzuR/Gj7aMQZL3hYdxPigA3kxdFqLVxhCp4RNpf6qvO7b6A2w/H6UVpStkCvavuX
 1zallIEue381pf1w+Xhj5XBWBYXSzJeDWCSUN9iV4+DSo9ayiTd/yozEntGiMlruNbia
 7jkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBGafPgggjtXyHQatam/1TY1umpOyggbMilHeqAXpJtTVLpQnoeMr8ekjK+o53A6tqXc1TKu32Zk0mJ/GhD2K9TCgSC6w=
X-Gm-Message-State: AOJu0YwuxRLRARf/zdRXg3SDm4ZElbnSUb7HYM/NwgbzyP4ipaK4ICfj
 W47m4iiOT5F2hgwBehgm2zq9ya90s5JBF8xy4slVsn0KoZo/Z4YJoxIk6uQk1U4=
X-Google-Smtp-Source: AGHT+IEZb/UwB10mJDW7fzrmYtk43wYQsAjrEo4Z5yqrY2hjQBoFL2V66DwsUa27+WZRkBKVQZ9ItQ==
X-Received: by 2002:a2e:8919:0:b0:2d0:bc40:2aa1 with SMTP id
 d25-20020a2e8919000000b002d0bc402aa1mr3949706lji.10.1708101030008; 
 Fri, 16 Feb 2024 08:30:30 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 e25-20020a05600c219900b0040fe4b733f4sm2752985wme.26.2024.02.16.08.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 08:30:27 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 564055F9CF;
 Fri, 16 Feb 2024 16:30:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-s390x@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 03/23] target/ppc: Use GDBFeature for dynamic XML
Date: Fri, 16 Feb 2024 16:30:05 +0000
Message-Id: <20240216163025.424857-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240216163025.424857-1-alex.bennee@linaro.org>
References: <20240216163025.424857-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x22a.google.com
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
index a44de22ca4a..200652e2c87 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1471,8 +1471,7 @@ struct PowerPCCPUClass {
     int bfd_mach;
     uint32_t l1_dcache_size, l1_icache_size;
 #ifndef CONFIG_USER_ONLY
-    unsigned int gdb_num_sprs;
-    const char *gdb_spr_xml;
+    GDBFeature gdb_spr;
 #endif
     const PPCHash64Options *hash64_opts;
     struct ppc_radix_page_info *radix_page_info;
@@ -1525,7 +1524,6 @@ int ppc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int ppc_cpu_gdb_write_register_apple(CPUState *cpu, uint8_t *buf, int reg);
 #ifndef CONFIG_USER_ONLY
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu);
 const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name);
 #endif
 int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 9931372a08a..4f6903d3f16 100644
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
index ec5731e5d67..e3be3dbd109 100644
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
@@ -599,7 +585,8 @@ void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *pcc)
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


