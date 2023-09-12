Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C88CEE3F39
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 22:42:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qgC4h-0002dG-0d; Tue, 12 Sep 2023 18:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qgC4f-0002cY-Dh
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 18:41:37 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qgC4c-00019B-Nn
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 18:41:37 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1c09673b006so42995915ad.1
 for <qemu-riscv@nongnu.org>; Tue, 12 Sep 2023 15:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694558493; x=1695163293;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k/YKq4wnvg2qIgTbMwp6QJwopVfOdxBAFQMm/Ze0iPE=;
 b=RU1kGbjkFfee4ol4hXfaXfR49GHdW6YN/dw0dcs9kQq6tPAUdedkrOjBaXOWHJbpG0
 V+ZM6p0DqJGMrFpggUE+AI28nESQUAf0QqM5uDeG1QoWxUgRWWeUAWgF9GE+hOG/XgI3
 /9G+WT5vkPF7TvfxvDwO0VyLABnHcctDOmiZAtguNNIMvN8vCgN5K4RAGnOe9ff2YKuL
 v+vRKPGBd+LmXoA/cH+0GgWcLBDANoaU+EF6cmqKLBxkg4ya1UdER7pOKgBQmHdzd57b
 4rgtybyA9rjqkjN2JOjkwpgqwTuzo6xP0ZmH74iaf9Wn3j3rJwiFIMF7V1sFU2M2ZXQ6
 kLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694558493; x=1695163293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k/YKq4wnvg2qIgTbMwp6QJwopVfOdxBAFQMm/Ze0iPE=;
 b=anVgfzFV3DSLigjnQx+0i3+vpYHydz4ATp84xmO4EEN78NJe9KViF8wJFYP+wivrsH
 ghZGffCnXQPGVY75ToTGIaLBjfJDHap6Y5W8OGoSlNWhq+T2kK+JY87K/8M07+5ZeGin
 C1S1CUjd0vwuz9mfUDCQYPfkNOnkYx5QcLcbijBcfLCnirpTQNr8Z8SiNlUCDjKkMSKb
 vnlrPZtp2OolhH1anSUMP6q8o+aLeWhMCuzxHcCslmjQfEPH6Ei9F/O2GQIoqz1h6KCr
 h19kIM/lJFa4smxABLbiOSNJhNZiZZJRVm7m/RXSUdK6yQd6lwkEFmQJ2Z6grnzOoiW+
 9jag==
X-Gm-Message-State: AOJu0YwNdJbMQvaRftkxlx+gphdz8jJXcN2+zOAU4gfmbR5P/YLB4PGP
 6F+uMdeyfb06Bg8ckOm/lSay8Q==
X-Google-Smtp-Source: AGHT+IHX0RD+iIToge+0jCf4ocPglhvNJ0y8SNdXPpqaFJnlaRVgV0r26Fcekofw2zrEDBNEkHWDGg==
X-Received: by 2002:a17:902:ea11:b0:1bc:73bf:304c with SMTP id
 s17-20020a170902ea1100b001bc73bf304cmr1555631plg.48.1694558493399; 
 Tue, 12 Sep 2023 15:41:33 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170902d34d00b001bbbc655ca1sm8996977plk.219.2023.09.12.15.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 15:41:33 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>,
 Aleksandr Anenkov <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 general arch...)
Subject: [PATCH v3 07/12] hw/core/cpu: Return static value with gdb_arch_name()
Date: Wed, 13 Sep 2023 07:40:56 +0900
Message-ID: <20230912224107.29669-8-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230912224107.29669-1-akihiko.odaki@daynix.com>
References: <20230912224107.29669-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x632.google.com
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

All implementations of gdb_arch_name() returns dynamic duplicates of
static strings. It's also unlikely that there will be an implementation
of gdb_arch_name() that returns a truly dynamic value due to the nature
of the function returning a well-known identifiers. Qualify the value
gdb_arch_name() with const and make all of its implementations return
static strings.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/core/cpu.h  | 2 +-
 target/ppc/internal.h  | 2 +-
 gdbstub/gdbstub.c      | 3 +--
 target/arm/cpu.c       | 6 +++---
 target/arm/cpu64.c     | 4 ++--
 target/i386/cpu.c      | 6 +++---
 target/loongarch/cpu.c | 8 ++++----
 target/ppc/gdbstub.c   | 6 +++---
 target/riscv/cpu.c     | 6 +++---
 target/s390x/cpu.c     | 4 ++--
 target/tricore/cpu.c   | 4 ++--
 11 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index fdcbe87352..4f5c7eb04e 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -164,7 +164,7 @@ struct CPUClass {
     vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
 
     const char *gdb_core_xml_file;
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
index 12f4d07046..9db4af41c1 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -380,10 +380,9 @@ static const char *get_feature_xml(const char *p, const char **newp,
                             "<target>");
 
             if (cc->gdb_arch_name) {
-                g_autofree gchar *arch = cc->gdb_arch_name(cpu);
                 g_string_append_printf(xml,
                                        "<architecture>%s</architecture>",
-                                       arch);
+                                       cc->gdb_arch_name(cpu));
             }
             g_string_append(xml, "<xi:include href=\"");
             g_string_append(xml, cc->gdb_core_xml_file);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6ff6ff2d55..a13c609249 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2316,15 +2316,15 @@ static Property arm_cpu_properties[] = {
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
index 96158093cc..6b91aab6b7 100644
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
index 00f913b638..5678b52472 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5914,12 +5914,12 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
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
index 27fc6e1f33..f88cfa93ce 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -763,9 +763,9 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
 #endif
 }
 
-static gchar *loongarch32_gdb_arch_name(CPUState *cs)
+static const gchar *loongarch32_gdb_arch_name(CPUState *cs)
 {
-    return g_strdup("loongarch32");
+    return "loongarch32";
 }
 
 static void loongarch32_cpu_class_init(ObjectClass *c, void *data)
@@ -777,9 +777,9 @@ static void loongarch32_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_arch_name = loongarch32_gdb_arch_name;
 }
 
-static gchar *loongarch64_gdb_arch_name(CPUState *cs)
+static const gchar *loongarch64_gdb_arch_name(CPUState *cs)
 {
-    return g_strdup("loongarch64");
+    return "loongarch64";
 }
 
 static void loongarch64_cpu_class_init(ObjectClass *c, void *data)
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 2ad11510bf..778ef73bd7 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -589,12 +589,12 @@ static int gdb_set_vsx_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
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
index 6b93b04453..ef8faaaff5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1939,17 +1939,17 @@ static Property riscv_cpu_properties[] = {
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
index df167493c3..cf4b5e43f2 100644
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
2.42.0


