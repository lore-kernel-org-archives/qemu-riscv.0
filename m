Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84027C04A6A
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 13:47:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWGnH-0007wi-89; Wed, 16 Aug 2023 09:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWGn4-0007EE-O7
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 09:42:28 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWGmv-0001SL-Tj
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 09:42:23 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-688779ffcfdso993022b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 06:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193331; x=1692798131;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9A/irVSRNTDRyAMd8tbb4ofq2py6oa1gC/mUH/zNkC4=;
 b=RXtGwsg5pby9WTBTMSsEUOHX7sR8mLpM2Lm2Q4IXOwDl7Lj+f5ugcnwaws56/pXC30
 OknE6+WKhDh/W1eUTobkq9Znfdrl5CvzPRMFYcv/HpIesCOziGVogfELde7eswNfkwdH
 oSLHGS+Iczk7MCSwAgEsaoAYTXGcCHRwpR9if+pu3Zdpg8uLEjVgPHHEMvvkLG9TkJCw
 2EJBPyLUjWZMAAuO2HO40QxZa2LEsgKqmqsRLUICjLimlfethuBPGcPqQnrdBoWyR0NF
 U0F8yJixoNdmDfXBDbuFN+nXx94w8LN9K3lepo9HHpKhZQUoDLBV2yfJ2U0LNSg8wPO7
 tdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692193331; x=1692798131;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9A/irVSRNTDRyAMd8tbb4ofq2py6oa1gC/mUH/zNkC4=;
 b=Z9fReNVDV2STuH/JAIbWTIhVvnwahTicAXoGHsfvu3HZJXqorXpk0LZkPktYwgVzpA
 i2GF5j2aqyd8QRb2ZbJb4UYxQ5PN9hcMmcXg0PbdlY/NpFqYkpgvNmr2MWaDsjd6k5Ul
 0IDLI2lJ9WN56i+1oewnE0ZIOzkCeyN0QjcyIV3xiGwHGS4toevXqRjmi61L/6/iBf5v
 VsSctIXXx689n3t2C5oeoxqa/g2N2u5cyZvQ2Vuhe5xTs6P1xytgx200OJq2jLmH+wen
 P8iVAGyiz+toV3+8VxvhiCPE9hIj1HDQ+J7IwkMCBAzBv0sDYxbufptvs3bejOkQ/Rb0
 UnBQ==
X-Gm-Message-State: AOJu0Yy0vOX09vmQ+Gytnwx3/GX6fuNOYQuJS3994LS7KluvQheJthVJ
 NfAXbkfOeiNuNHvaftfQr9D1OA==
X-Google-Smtp-Source: AGHT+IGMnsNwR3XxlKpzLxkw5OnepSQkNyPIWR8D/6668xVGijq4J2qWt1gSnf3Nh8JrSJOdcwC7uQ==
X-Received: by 2002:a05:6a20:3d95:b0:13d:315f:26b7 with SMTP id
 s21-20020a056a203d9500b0013d315f26b7mr2238965pzi.1.1692193331082; 
 Wed, 16 Aug 2023 06:42:11 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 06:42:10 -0700 (PDT)
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
Subject: [PATCH v3 13/25] hw/core/cpu: Return static value with gdb_arch_name()
Date: Wed, 16 Aug 2023 22:39:23 +0900
Message-ID: <20230816133938.18310-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816133938.18310-1-akihiko.odaki@daynix.com>
References: <20230816133938.18310-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

All implementations of gdb_arch_name() returns dynamic duplicates of
static strings. It's also unlikely that there will be an implementation
of gdb_arch_name() that returns a truly dynamic value due to the nature
of the function returning a well-known identifiers. Qualify the value
gdb_arch_name() with const and make all of its implementations return
static strings.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/hw/core/cpu.h  | 2 +-
 target/ppc/internal.h  | 2 +-
 gdbstub/gdbstub.c      | 4 +---
 target/arm/cpu.c       | 6 +++---
 target/arm/cpu64.c     | 4 ++--
 target/i386/cpu.c      | 6 +++---
 target/loongarch/cpu.c | 4 ++--
 target/ppc/gdbstub.c   | 6 +++---
 target/riscv/cpu.c     | 6 +++---
 target/s390x/cpu.c     | 4 ++--
 target/tricore/cpu.c   | 4 ++--
 11 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 84219c1885..09f1aca624 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -165,7 +165,7 @@ struct CPUClass {
     vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
 
     const GDBFeature *gdb_core_feature;
-    gchar * (*gdb_arch_name)(CPUState *cpu);
+    const gchar * (*gdb_arch_name)(CPUState *cpu);
     const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
 
     void (*disas_set_info)(CPUState *cpu, disassemble_info *info);
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 57acb3212c..974b37aa60 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -221,7 +221,7 @@ void destroy_ppc_opcodes(PowerPCCPU *cpu);
 
 /* gdbstub.c */
 void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);
-gchar *ppc_gdb_arch_name(CPUState *cs);
+const gchar *ppc_gdb_arch_name(CPUState *cs);
 
 /**
  * prot_for_access_type:
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 7a4775633e..c2ce970c98 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -378,11 +378,9 @@ static const char *get_feature_xml(const char *p, const char **newp,
                     "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
                     "<target>");
             if (cc->gdb_arch_name) {
-                gchar *arch = cc->gdb_arch_name(cpu);
                 pstrcat(buf, buf_sz, "<architecture>");
-                pstrcat(buf, buf_sz, arch);
+                pstrcat(buf, buf_sz, cc->gdb_arch_name(cpu));
                 pstrcat(buf, buf_sz, "</architecture>");
-                g_free(arch);
             }
             pstrcat(buf, buf_sz, "<xi:include href=\"");
             pstrcat(buf, buf_sz, cc->gdb_core_feature->xmlname);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a206ab6b1b..5f07133419 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2281,15 +2281,15 @@ static Property arm_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
-static gchar *arm_gdb_arch_name(CPUState *cs)
+static const gchar *arm_gdb_arch_name(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
 
     if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
-        return g_strdup("iwmmxt");
+        return "iwmmxt";
     }
-    return g_strdup("arm");
+    return "arm";
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 9c2a226159..65f84bfb18 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -743,9 +743,9 @@ static void aarch64_cpu_finalizefn(Object *obj)
 {
 }
 
-static gchar *aarch64_gdb_arch_name(CPUState *cs)
+static const gchar *aarch64_gdb_arch_name(CPUState *cs)
 {
-    return g_strdup("aarch64");
+    return "aarch64";
 }
 
 static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 069410985f..c1a7667f4a 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5910,12 +5910,12 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
     memset(&env->user_features, 0, sizeof(env->user_features));
 }
 
-static gchar *x86_gdb_arch_name(CPUState *cs)
+static const gchar *x86_gdb_arch_name(CPUState *cs)
 {
 #ifdef TARGET_X86_64
-    return g_strdup("i386:x86-64");
+    return "i386:x86-64";
 #else
-    return g_strdup("i386");
+    return "i386";
 #endif
 }
 
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index b204cb279d..6c76d14e43 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -692,9 +692,9 @@ static const struct SysemuCPUOps loongarch_sysemu_ops = {
 };
 #endif
 
-static gchar *loongarch_gdb_arch_name(CPUState *cs)
+static const gchar *loongarch_gdb_arch_name(CPUState *cs)
 {
-    return g_strdup("loongarch64");
+    return "loongarch64";
 }
 
 static void loongarch_cpu_class_init(ObjectClass *c, void *data)
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 70cac919e0..dbdee7d56e 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -572,12 +572,12 @@ static int gdb_set_vsx_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
     return 0;
 }
 
-gchar *ppc_gdb_arch_name(CPUState *cs)
+const gchar *ppc_gdb_arch_name(CPUState *cs)
 {
 #if defined(TARGET_PPC64)
-    return g_strdup("powerpc:common64");
+    return "powerpc:common64";
 #else
-    return g_strdup("powerpc:common");
+    return "powerpc:common";
 #endif
 }
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ceca40cdd9..86a477bfc0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1941,17 +1941,17 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static gchar *riscv_gdb_arch_name(CPUState *cs)
+static const gchar *riscv_gdb_arch_name(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
 
     switch (riscv_cpu_mxl(env)) {
     case MXL_RV32:
-        return g_strdup("riscv:rv32");
+        return "riscv:rv32";
     case MXL_RV64:
     case MXL_RV128:
-        return g_strdup("riscv:rv64");
+        return "riscv:rv64";
     default:
         g_assert_not_reached();
     }
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 2a2ff8cbdc..ca356c2b86 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -284,9 +284,9 @@ static void s390_cpu_initfn(Object *obj)
 #endif
 }
 
-static gchar *s390_gdb_arch_name(CPUState *cs)
+static const gchar *s390_gdb_arch_name(CPUState *cs)
 {
-    return g_strdup("s390:64-bit");
+    return "s390:64-bit";
 }
 
 static Property s390x_cpu_properties[] = {
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 133a9ac70e..44e3ba6f0e 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -29,9 +29,9 @@ static inline void set_feature(CPUTriCoreState *env, int feature)
     env->features |= 1ULL << feature;
 }
 
-static gchar *tricore_gdb_arch_name(CPUState *cs)
+static const gchar *tricore_gdb_arch_name(CPUState *cs)
 {
-    return g_strdup("tricore");
+    return "tricore";
 }
 
 static void tricore_cpu_set_pc(CPUState *cs, vaddr value)
-- 
2.41.0


