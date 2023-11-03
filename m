Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE4EC4332F
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 20:04:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qz0Mc-0001Wa-Ud; Fri, 03 Nov 2023 16:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0LI-0008IO-Cz
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:00:32 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0L4-0005cl-Bb
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:00:32 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40907b82ab9so21022475e9.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Nov 2023 13:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699041609; x=1699646409; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3UyTA5dTrQvBJFOCjN13w0HZMzwuuddj/H79AztA+uQ=;
 b=mww7gUgOyHdVCbjP3vcFYVs36ETybl1Ci1hDFmZYiLaV8nQ6kEhGZR6/VEVo4IJcaQ
 l+jMy+gs0Djns9vML9+x+WvYRbn+uz0u1um6PuuWX43QNko/BdgDAGklLPIZb8XKRKHj
 k+OeigBtSQrCA+honaLzVCjNEynZBAIMGHOT8O5onoK8zgYZARHqYPQcwJ5QldGpgGGd
 TipngmjqikQyc9Sk1UgMlh6getOQ3eyVJYy/Lopfh0zntO+7frX6M/wL6g/Or6otlT8x
 FBWR5HrXlAgL2+HEnXWsXnLrGrXQTm/SHEavQH1fTGKw1yCuA85H/OZvMIB4HssdGETl
 drfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699041609; x=1699646409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3UyTA5dTrQvBJFOCjN13w0HZMzwuuddj/H79AztA+uQ=;
 b=X4MsDUXpv8Z0BgcOOG8P5YeUTQLRQdajAYdr+A6OZmtPAVHNgVGYROrBnAwpvuFe3E
 qb4E4Hn/GbZM0tA5H7qQyuTw+vv5QMzvGFiAtxWi9rt6wTqEk7tfJjMD9Y082+grgKJa
 5bIBEHg3vvYmfSbP2DL9mUENjBj3hpW11+S5h2v3Hpntq/hJH0rAZzOKXpJSce5tteIk
 Q3vO5z8gopqi7Vk6AYoNfex+nSLY6FyN2ODAfbSXB78AhZY3a+jIAlTlpmKPw0r57A4H
 HTIw5cNYFST/KJ26i0fQj/ms73D/lXQFRqTdngarSB4KVqGi9Pb1+VHeLMtIJSjC5s2N
 E1Yw==
X-Gm-Message-State: AOJu0YzOkqv9yv2/D56s7KbUiwLOqJz8+5UuHRLA1L6L15l9x7MlpP1n
 /7sQaGkPLhDXnPOe7Zx/Lei1ZQ==
X-Google-Smtp-Source: AGHT+IH5cfpMGqLIfhtLVGwn1PvDUelCh08MIwyeq4GJEvseSyS/Nv++SUrKEps3e343owIXNr/6Zg==
X-Received: by 2002:adf:f309:0:b0:32f:7d50:62f8 with SMTP id
 i9-20020adff309000000b0032f7d5062f8mr3477316wro.3.1699041609574; 
 Fri, 03 Nov 2023 13:00:09 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 h16-20020a05600004d000b0032dbf99bf4fsm2658778wri.89.2023.11.03.13.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 13:00:07 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id DBB06656E5;
 Fri,  3 Nov 2023 19:59:57 +0000 (GMT)
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
Subject: [PATCH 12/29] target/ppc: Use GDBFeature for dynamic XML
Date: Fri,  3 Nov 2023 19:59:39 +0000
Message-Id: <20231103195956.1998255-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103195956.1998255-1-alex.bennee@linaro.org>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Message-Id: <20231025093128.33116-6-akihiko.odaki@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/ppc/cpu-qom.h  |  4 ++--
 target/ppc/cpu.h      |  1 -
 target/ppc/cpu_init.c |  4 ----
 target/ppc/gdbstub.c  | 51 ++++++++++++++++---------------------------
 4 files changed, 21 insertions(+), 39 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index be33786bd8..8d5ebba5d3 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -20,6 +20,7 @@
 #ifndef QEMU_PPC_CPU_QOM_H
 #define QEMU_PPC_CPU_QOM_H
 
+#include "exec/gdbstub.h"
 #include "hw/core/cpu.h"
 #include "qom/object.h"
 
@@ -186,8 +187,7 @@ struct PowerPCCPUClass {
     int bfd_mach;
     uint32_t l1_dcache_size, l1_icache_size;
 #ifndef CONFIG_USER_ONLY
-    unsigned int gdb_num_sprs;
-    const char *gdb_spr_xml;
+    GDBFeature gdb_spr;
 #endif
     const PPCHash64Options *hash64_opts;
     struct ppc_radix_page_info *radix_page_info;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 30392ebeee..848062bc9f 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1384,7 +1384,6 @@ int ppc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int ppc_cpu_gdb_write_register_apple(CPUState *cpu, uint8_t *buf, int reg);
 #ifndef CONFIG_USER_ONLY
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu);
 const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name);
 #endif
 int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 40fe14a6c2..a0178c3ce8 100644
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
index ec5731e5d6..e3be3dbd10 100644
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


