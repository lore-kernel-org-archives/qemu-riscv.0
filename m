Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA55C001E0
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 15:01:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWHu7-0007uY-84; Wed, 16 Aug 2023 10:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWHu6-0007qP-35
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 10:53:46 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWHu3-0001VR-JW
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 10:53:45 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-68871bbfe33so1232534b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 07:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197622; x=1692802422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jj8XEMKTKizRIsIUeuKfRN/fxn5DPOE9jMPRlwlycR0=;
 b=hH3/fXw+D9GIpBxo6VDA6N7a8xLZouGQ5dubWF2mANy3HgkwAdSLv3GvfoV4SV9NF9
 PiEfIQSjWjPjkC6Bc4Xj06OtD2gtkEhXkpUdZaa/6Bl03zZ61r82rVku4U3wbPerDn/r
 on5RGYr/R+9mJd5kX8NFUp+Sl7FuMUF4OdLeXIWpABRukG229dLSDpyk79YOThzrocYc
 DwQbk+WG3QAVL1o6D07ACkzTsdCmExDFXIIXaOeaGE3JBHUCozlad6nj+kVzuSuJfs3f
 y6RYrvv7t5Yx01sIhHfeDf8Qbxgb6JPt92vC+1y2P1a/vupNEGI/hrVm9bARhiRXP56W
 ndsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692197622; x=1692802422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jj8XEMKTKizRIsIUeuKfRN/fxn5DPOE9jMPRlwlycR0=;
 b=dByhXbpILccW6GDfG0JT34g5hirvIzZ5sCAOAJjjTg1yUn7C+QMGkM7gFjlbfqxz7r
 SwWT/vrzFPfpFBJeO4I9gDfdgdkDUSk4pWE94/8w1Y2s4FuMw3al/fbfWd7v94qfDJ37
 OI42cI6HsKCMYtT7AbBLDf+iOzsDWv1LIt3CnzI0TV+9bdOKHbmDEeRuVRaJ/qigU3lv
 0DTWfBnt8Fepore+fa5dLJvaXD87Unu602r1YPttcQQQF0R7zrx7RbUOpNuIjd3wECdz
 pHqhsY7Fr4ZTLJUxs5vzjLuRnBI544KzImZDlQn+LB2lDQHNBc5Idtf69DUWaJ06jKt3
 E6Iw==
X-Gm-Message-State: AOJu0YyqOWZ4Zpp1j5q2MULJjEAs+RG1hPURKsWWMeG4E07TzaxqiP2Y
 WQhr48yFA/Mt6EGokfng00xXPQ==
X-Google-Smtp-Source: AGHT+IEMOEShkqLuKZ4Za79QLuj7c+axaOCpkpvZz3YCMFwOMkxY6VmMJYHSRE9vdmX7KrhoixOzVg==
X-Received: by 2002:a05:6a20:431c:b0:13e:23bc:f4cc with SMTP id
 h28-20020a056a20431c00b0013e23bcf4ccmr2578458pzk.37.1692197621739; 
 Wed, 16 Aug 2023 07:53:41 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 07:53:41 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Anton Kochkov <anton.kochkov@proton.me>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 09/25] target/ppc: Use GDBFeature for dynamic XML
Date: Wed, 16 Aug 2023 23:51:30 +0900
Message-ID: <20230816145155.21049-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::434;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

In preparation for a change to use GDBFeature as a parameter of
gdb_register_coprocessor(), convert the internal representation of
dynamic feature from plain XML to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/ppc/cpu-qom.h  |  3 +--
 target/ppc/cpu.h      |  2 +-
 target/ppc/cpu_init.c |  2 +-
 target/ppc/gdbstub.c  | 45 ++++++++++++++-----------------------------
 4 files changed, 17 insertions(+), 35 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index be33786bd8..633fb402b5 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -186,8 +186,7 @@ struct PowerPCCPUClass {
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
index 25fac9577a..5f251bdffe 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1381,7 +1381,7 @@ int ppc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int ppc_cpu_gdb_write_register_apple(CPUState *cpu, uint8_t *buf, int reg);
 #ifndef CONFIG_USER_ONLY
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu);
+void ppc_gdb_gen_spr_feature(PowerPCCPU *cpu);
 const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name);
 #endif
 int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index eb56226865..938cd2b7e1 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6673,7 +6673,7 @@ static void init_ppc_proc(PowerPCCPU *cpu)
     (*pcc->init_proc)(env);
 
 #if !defined(CONFIG_USER_ONLY)
-    ppc_gdb_gen_spr_xml(cpu);
+    ppc_gdb_gen_spr_feature(cpu);
 #endif
 
     /* MSR bits & flags consistency checks */
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index ca39efdc35..0ef484dbee 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -318,15 +318,21 @@ int ppc_cpu_gdb_write_register_apple(CPUState *cs, uint8_t *mem_buf, int n)
 }
 
 #ifndef CONFIG_USER_ONLY
-void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu)
+void ppc_gdb_gen_spr_feature(PowerPCCPU *cpu)
 {
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
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
+                             "org.qemu.power.spr", "power-spr.xml");
+
     for (i = 0; i < ARRAY_SIZE(env->spr_cb); i++) {
         ppc_spr_t *spr = &env->spr_cb[i];
 
@@ -344,35 +350,12 @@ void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu)
          */
         spr->gdb_id = num_regs;
         num_regs++;
-    }
-
-    if (pcc->gdb_spr_xml) {
-        return;
-    }
-
-    xml = g_string_new("<?xml version=\"1.0\"?>");
-    g_string_append(xml, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append(xml, "<feature name=\"org.qemu.power.spr\">");
 
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
+                                       TARGET_LONG_BITS, "int", "spr");
     }
 
-    g_string_append(xml, "</feature>");
-
-    pcc->gdb_num_sprs = num_regs;
-    pcc->gdb_spr_xml = g_string_free(xml, false);
+    gdb_feature_builder_end(&builder);
 }
 
 const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name)
@@ -380,7 +363,7 @@ const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name)
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
 
     if (strcmp(xml_name, "power-spr.xml") == 0) {
-        return pcc->gdb_spr_xml;
+        return pcc->gdb_spr.xml;
     }
     return NULL;
 }
@@ -618,6 +601,6 @@ void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *pcc)
     }
 #ifndef CONFIG_USER_ONLY
     gdb_register_coprocessor(cs, gdb_get_spr_reg, gdb_set_spr_reg,
-                             pcc->gdb_num_sprs, "power-spr.xml", 0);
+                             pcc->gdb_spr.num_regs, "power-spr.xml", 0);
 #endif
 }
-- 
2.41.0


