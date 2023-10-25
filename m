Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A48EC25B47
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 09:34:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvaFs-00040a-Cz; Wed, 25 Oct 2023 05:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qvaFm-0003FM-EP
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 05:32:42 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qvaFa-0002M1-L3
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 05:32:40 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5b837db1b26so3288573a12.3
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 02:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1698226348; x=1698831148;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k5xD5Yl58XJJvVwH7ft3pNEwY2e2tTOO+14Vc8f1nTk=;
 b=ykrg+6A9UEN/1ZbsE/tpftHVM4ZwEF/PIxGmpW4n3W7nO49JazLtzfCD/dJRv9cRGJ
 cZwH1DOHXmVri76stFSnCoSOURtcw3sHX9JUAkibZLNSeyGW+tOPBK1vadurXsdb2Byh
 7MT6ksjhyqCPr3APSyfZNOri5ftq9tnZXxYgajL8pTSAz2IsE+9B+YUb3GSCjXVUmwur
 b5dadcscGYF8/h8xn6qzd1jlc0CqI74ysqokEwzoCatx5qdeol5KwY252xHgLMNn2c22
 kv3ao4yieRs9HSf0WHCPnKxw49ipAnD0+mcJZFpGlIA+8YhPujAoxkXHrzSmD6AKLzAk
 /7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698226348; x=1698831148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k5xD5Yl58XJJvVwH7ft3pNEwY2e2tTOO+14Vc8f1nTk=;
 b=ru4Q5J3sirNTiXO4OP9lsdM1S+sFqLMggLFity8+DCt3LiqIoyrR1or9oAWYRRGq8X
 6HQfqzD5IUts1Qyox25zStrBeof0EXZ/SVd6WLvY14lNvCkaasLKP/O0BSUgMUy36soQ
 CL/Sm6GDIZ99cwWF9yDtE3U5vj6yS8TmMn18wub/H6G7UUMLpEJcgq2keVk9wex1BlzU
 kxdSSSHd1PxPnSk1zq/keSR2bfsxRxV1dd4MXie/tpBgQexCO4cKl9Eej+4JEHJlibDD
 kLDp4bej+8D4pO06J4zWw/fHYxU6SAQb/5644VAL0KQf8hB1DPNqycq0dQdlF7XxR53X
 225g==
X-Gm-Message-State: AOJu0Yxi/7I4K08r+LQ9JDUA/4leP1x7olXDzI6clDjqb9y9p37oSs5e
 OaZSz1/SFlQKRnmdUDPUziS8sg==
X-Google-Smtp-Source: AGHT+IHbIufZ3jF3grGZos9h143hopEtqHwMJOVFbNQzBFBbYJ9zMmy5QgB+34y/geloiCdQSj2gMw==
X-Received: by 2002:a17:90a:c297:b0:27c:f483:e2da with SMTP id
 f23-20020a17090ac29700b0027cf483e2damr12918648pjt.5.1698226347687; 
 Wed, 25 Oct 2023 02:32:27 -0700 (PDT)
Received: from localhost ([157.82.205.15]) by smtp.gmail.com with UTF8SMTPSA id
 a6-20020a170902ecc600b001c61bde04a7sm8726777plh.276.2023.10.25.02.32.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 02:32:26 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>,
 Aleksandr Anenkov <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH v16 09/18] gdbstub: Change gdb_get_reg_cb and gdb_set_reg_cb
Date: Wed, 25 Oct 2023 18:31:09 +0900
Message-ID: <20231025093128.33116-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025093128.33116-1-akihiko.odaki@daynix.com>
References: <20231025093128.33116-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52c.google.com
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

Align the parameters of gdb_get_reg_cb and gdb_set_reg_cb with the
gdb_read_register and gdb_write_register members of CPUClass to allow
to unify the logic to access registers of the core and coprocessors
in the future.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/gdbstub.h      |  4 +-
 target/arm/internals.h      | 12 +++---
 target/hexagon/internal.h   |  4 +-
 target/microblaze/cpu.h     |  4 +-
 gdbstub/gdbstub.c           |  6 +--
 target/arm/gdbstub.c        | 51 ++++++++++++++++--------
 target/arm/gdbstub64.c      | 27 +++++++++----
 target/hexagon/gdbstub.c    | 10 ++++-
 target/loongarch/gdbstub.c  | 11 ++++--
 target/m68k/helper.c        | 20 ++++++++--
 target/microblaze/gdbstub.c |  9 ++++-
 target/ppc/gdbstub.c        | 46 +++++++++++++++++-----
 target/riscv/gdbstub.c      | 46 ++++++++++++++++------
 target/s390x/gdbstub.c      | 77 ++++++++++++++++++++++++++++---------
 14 files changed, 236 insertions(+), 91 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index ac6fce99a6..bcaab1bc75 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -24,8 +24,8 @@ typedef struct GDBFeatureBuilder {
 
 
 /* Get or set a register.  Returns the size of the register.  */
-typedef int (*gdb_get_reg_cb)(CPUArchState *env, GByteArray *buf, int reg);
-typedef int (*gdb_set_reg_cb)(CPUArchState *env, uint8_t *buf, int reg);
+typedef int (*gdb_get_reg_cb)(CPUState *cpu, GByteArray *buf, int reg);
+typedef int (*gdb_set_reg_cb)(CPUState *cpu, uint8_t *buf, int reg);
 
 /**
  * gdb_register_coprocessor() - register a supplemental set of registers
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 99136985ad..e597b77be3 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1441,12 +1441,12 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
 
 #ifdef TARGET_AARCH64
 GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cpu, int base_reg);
-int aarch64_gdb_get_sve_reg(CPUARMState *env, GByteArray *buf, int reg);
-int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg);
-int aarch64_gdb_get_fpu_reg(CPUARMState *env, GByteArray *buf, int reg);
-int aarch64_gdb_set_fpu_reg(CPUARMState *env, uint8_t *buf, int reg);
-int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg);
-int aarch64_gdb_set_pauth_reg(CPUARMState *env, uint8_t *buf, int reg);
+int aarch64_gdb_get_sve_reg(CPUState *cs, GByteArray *buf, int reg);
+int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t *buf, int reg);
+int aarch64_gdb_get_fpu_reg(CPUState *cs, GByteArray *buf, int reg);
+int aarch64_gdb_set_fpu_reg(CPUState *cs, uint8_t *buf, int reg);
+int aarch64_gdb_get_pauth_reg(CPUState *cs, GByteArray *buf, int reg);
+int aarch64_gdb_set_pauth_reg(CPUState *cs, uint8_t *buf, int reg);
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
diff --git a/target/hexagon/internal.h b/target/hexagon/internal.h
index d732b6bb3c..beb08cb7e3 100644
--- a/target/hexagon/internal.h
+++ b/target/hexagon/internal.h
@@ -33,8 +33,8 @@
 
 int hexagon_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int hexagon_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-int hexagon_hvx_gdb_read_register(CPUHexagonState *env, GByteArray *mem_buf, int n);
-int hexagon_hvx_gdb_write_register(CPUHexagonState *env, uint8_t *mem_buf, int n);
+int hexagon_hvx_gdb_read_register(CPUState *env, GByteArray *mem_buf, int n);
+int hexagon_hvx_gdb_write_register(CPUState *env, uint8_t *mem_buf, int n);
 
 void hexagon_debug_vreg(CPUHexagonState *env, int regnum);
 void hexagon_debug_qreg(CPUHexagonState *env, int regnum);
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index e43c49d4af..c14b3357b7 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -370,8 +370,8 @@ G_NORETURN void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
 void mb_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 int mb_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int mb_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-int mb_cpu_gdb_read_stack_protect(CPUArchState *cpu, GByteArray *buf, int reg);
-int mb_cpu_gdb_write_stack_protect(CPUArchState *cpu, uint8_t *buf, int reg);
+int mb_cpu_gdb_read_stack_protect(CPUState *cs, GByteArray *buf, int reg);
+int mb_cpu_gdb_write_stack_protect(CPUState *cs, uint8_t *buf, int reg);
 
 static inline uint32_t mb_cpu_read_msr(const CPUMBState *env)
 {
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index ebabbc00f6..4809c90c4a 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -502,7 +502,6 @@ const GDBFeature *gdb_find_static_feature(const char *xmlname)
 static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
-    CPUArchState *env = cpu_env(cpu);
     GDBRegisterState *r;
 
     if (reg < cc->gdb_num_core_regs) {
@@ -513,7 +512,7 @@ static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
         for (guint i = 0; i < cpu->gdb_regs->len; i++) {
             r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
             if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
-                return r->get_reg(env, buf, reg - r->base_reg);
+                return r->get_reg(cpu, buf, reg - r->base_reg);
             }
         }
     }
@@ -523,7 +522,6 @@ static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
 static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
-    CPUArchState *env = cpu_env(cpu);
     GDBRegisterState *r;
 
     if (reg < cc->gdb_num_core_regs) {
@@ -534,7 +532,7 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
         for (guint i = 0; i < cpu->gdb_regs->len; i++) {
             r =  &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
             if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
-                return r->set_reg(env, mem_buf, reg - r->base_reg);
+                return r->set_reg(cpu, mem_buf, reg - r->base_reg);
             }
         }
     }
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index df98ce7462..8d771c5d46 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -105,9 +105,10 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     return 0;
 }
 
-static int vfp_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
+static int vfp_gdb_get_reg(CPUState *cs, GByteArray *buf, int reg)
 {
-    ARMCPU *cpu = env_archcpu(env);
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
     int nregs = cpu_isar_feature(aa32_simd_r32, cpu) ? 32 : 16;
 
     /* VFP data registers are always little-endian.  */
@@ -129,9 +130,10 @@ static int vfp_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
     return 0;
 }
 
-static int vfp_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
+static int vfp_gdb_set_reg(CPUState *cs, uint8_t *buf, int reg)
 {
-    ARMCPU *cpu = env_archcpu(env);
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
     int nregs = cpu_isar_feature(aa32_simd_r32, cpu) ? 32 : 16;
 
     if (reg < nregs) {
@@ -155,8 +157,11 @@ static int vfp_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
-static int vfp_gdb_get_sysreg(CPUARMState *env, GByteArray *buf, int reg)
+static int vfp_gdb_get_sysreg(CPUState *cs, GByteArray *buf, int reg)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
     switch (reg) {
     case 0:
         return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPSID]);
@@ -166,8 +171,11 @@ static int vfp_gdb_get_sysreg(CPUARMState *env, GByteArray *buf, int reg)
     return 0;
 }
 
-static int vfp_gdb_set_sysreg(CPUARMState *env, uint8_t *buf, int reg)
+static int vfp_gdb_set_sysreg(CPUState *cs, uint8_t *buf, int reg)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
     switch (reg) {
     case 0:
         env->vfp.xregs[ARM_VFP_FPSID] = ldl_p(buf);
@@ -179,8 +187,11 @@ static int vfp_gdb_set_sysreg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
-static int mve_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
+static int mve_gdb_get_reg(CPUState *cs, GByteArray *buf, int reg)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
     switch (reg) {
     case 0:
         return gdb_get_reg32(buf, env->v7m.vpr);
@@ -189,8 +200,11 @@ static int mve_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
     }
 }
 
-static int mve_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
+static int mve_gdb_set_reg(CPUState *cs, uint8_t *buf, int reg)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
     switch (reg) {
     case 0:
         env->v7m.vpr = ldl_p(buf);
@@ -209,9 +223,10 @@ static int mve_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
  * We return the number of bytes copied
  */
 
-static int arm_gdb_get_sysreg(CPUARMState *env, GByteArray *buf, int reg)
+static int arm_gdb_get_sysreg(CPUState *cs, GByteArray *buf, int reg)
 {
-    ARMCPU *cpu = env_archcpu(env);
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
     const ARMCPRegInfo *ri;
     uint32_t key;
 
@@ -227,7 +242,7 @@ static int arm_gdb_get_sysreg(CPUARMState *env, GByteArray *buf, int reg)
     return 0;
 }
 
-static int arm_gdb_set_sysreg(CPUARMState *env, uint8_t *buf, int reg)
+static int arm_gdb_set_sysreg(CPUState *cs, uint8_t *buf, int reg)
 {
     return 0;
 }
@@ -366,8 +381,11 @@ static int m_sysreg_get(CPUARMState *env, GByteArray *buf,
     return gdb_get_reg32(buf, *ptr);
 }
 
-static int arm_gdb_get_m_systemreg(CPUARMState *env, GByteArray *buf, int reg)
+static int arm_gdb_get_m_systemreg(CPUState *cs, GByteArray *buf, int reg)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
     /*
      * Here, we emulate MRS instruction, where CONTROL has a mix of
      * banked and non-banked bits.
@@ -378,7 +396,7 @@ static int arm_gdb_get_m_systemreg(CPUARMState *env, GByteArray *buf, int reg)
     return m_sysreg_get(env, buf, reg, env->v7m.secure);
 }
 
-static int arm_gdb_set_m_systemreg(CPUARMState *env, uint8_t *buf, int reg)
+static int arm_gdb_set_m_systemreg(CPUState *cs, uint8_t *buf, int reg)
 {
     return 0; /* TODO */
 }
@@ -413,12 +431,15 @@ static GDBFeature *arm_gen_dynamic_m_systemreg_feature(CPUState *cs,
  * For user-only, we see the non-secure registers via m_systemreg above.
  * For secext, encode the non-secure view as even and secure view as odd.
  */
-static int arm_gdb_get_m_secextreg(CPUARMState *env, GByteArray *buf, int reg)
+static int arm_gdb_get_m_secextreg(CPUState *cs, GByteArray *buf, int reg)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
     return m_sysreg_get(env, buf, reg >> 1, reg & 1);
 }
 
-static int arm_gdb_set_m_secextreg(CPUARMState *env, uint8_t *buf, int reg)
+static int arm_gdb_set_m_secextreg(CPUState *cs, uint8_t *buf, int reg)
 {
     return 0; /* TODO */
 }
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 5286d5c604..caa31ff3fa 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -72,8 +72,11 @@ int aarch64_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     return 0;
 }
 
-int aarch64_gdb_get_fpu_reg(CPUARMState *env, GByteArray *buf, int reg)
+int aarch64_gdb_get_fpu_reg(CPUState *cs, GByteArray *buf, int reg)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
     switch (reg) {
     case 0 ... 31:
     {
@@ -92,8 +95,11 @@ int aarch64_gdb_get_fpu_reg(CPUARMState *env, GByteArray *buf, int reg)
     }
 }
 
-int aarch64_gdb_set_fpu_reg(CPUARMState *env, uint8_t *buf, int reg)
+int aarch64_gdb_set_fpu_reg(CPUState *cs, uint8_t *buf, int reg)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
     switch (reg) {
     case 0 ... 31:
         /* 128 bit FP register */
@@ -116,9 +122,10 @@ int aarch64_gdb_set_fpu_reg(CPUARMState *env, uint8_t *buf, int reg)
     }
 }
 
-int aarch64_gdb_get_sve_reg(CPUARMState *env, GByteArray *buf, int reg)
+int aarch64_gdb_get_sve_reg(CPUState *cs, GByteArray *buf, int reg)
 {
-    ARMCPU *cpu = env_archcpu(env);
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
 
     switch (reg) {
     /* The first 32 registers are the zregs */
@@ -164,9 +171,10 @@ int aarch64_gdb_get_sve_reg(CPUARMState *env, GByteArray *buf, int reg)
     return 0;
 }
 
-int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg)
+int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t *buf, int reg)
 {
-    ARMCPU *cpu = env_archcpu(env);
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
 
     /* The first 32 registers are the zregs */
     switch (reg) {
@@ -210,8 +218,11 @@ int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
-int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg)
+int aarch64_gdb_get_pauth_reg(CPUState *cs, GByteArray *buf, int reg)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
     switch (reg) {
     case 0: /* pauth_dmask */
     case 1: /* pauth_cmask */
@@ -241,7 +252,7 @@ int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg)
     }
 }
 
-int aarch64_gdb_set_pauth_reg(CPUARMState *env, uint8_t *buf, int reg)
+int aarch64_gdb_set_pauth_reg(CPUState *cs, uint8_t *buf, int reg)
 {
     /* All pseudo registers are read-only. */
     return 0;
diff --git a/target/hexagon/gdbstub.c b/target/hexagon/gdbstub.c
index 54d37e006e..6007e6462b 100644
--- a/target/hexagon/gdbstub.c
+++ b/target/hexagon/gdbstub.c
@@ -81,8 +81,11 @@ static int gdb_get_qreg(CPUHexagonState *env, GByteArray *mem_buf, int n)
     return total;
 }
 
-int hexagon_hvx_gdb_read_register(CPUHexagonState *env, GByteArray *mem_buf, int n)
+int hexagon_hvx_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
+    HexagonCPU *cpu = HEXAGON_CPU(cs);
+    CPUHexagonState *env = &cpu->env;
+
     if (n < NUM_VREGS) {
         return gdb_get_vreg(env, mem_buf, n);
     }
@@ -115,8 +118,11 @@ static int gdb_put_qreg(CPUHexagonState *env, uint8_t *mem_buf, int n)
     return MAX_VEC_SIZE_BYTES / 8;
 }
 
-int hexagon_hvx_gdb_write_register(CPUHexagonState *env, uint8_t *mem_buf, int n)
+int hexagon_hvx_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
+    HexagonCPU *cpu = HEXAGON_CPU(cs);
+    CPUHexagonState *env = &cpu->env;
+
    if (n < NUM_VREGS) {
         return gdb_put_vreg(env, mem_buf, n);
     }
diff --git a/target/loongarch/gdbstub.c b/target/loongarch/gdbstub.c
index 843a869450..22c6889011 100644
--- a/target/loongarch/gdbstub.c
+++ b/target/loongarch/gdbstub.c
@@ -84,9 +84,11 @@ int loongarch_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     return length;
 }
 
-static int loongarch_gdb_get_fpu(CPULoongArchState *env,
-                                 GByteArray *mem_buf, int n)
+static int loongarch_gdb_get_fpu(CPUState *cs, GByteArray *mem_buf, int n)
 {
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+
     if (0 <= n && n < 32) {
         return gdb_get_reg64(mem_buf, env->fpr[n].vreg.D(0));
     } else if (32 <= n && n < 40) {
@@ -97,9 +99,10 @@ static int loongarch_gdb_get_fpu(CPULoongArchState *env,
     return 0;
 }
 
-static int loongarch_gdb_set_fpu(CPULoongArchState *env,
-                                 uint8_t *mem_buf, int n)
+static int loongarch_gdb_set_fpu(CPUState *cs, uint8_t *mem_buf, int n)
 {
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
     int length = 0;
 
     if (0 <= n && n < 32) {
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 675f2dcd5a..a5ee4d87e3 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -69,8 +69,11 @@ void m68k_cpu_list(void)
     g_slist_free(list);
 }
 
-static int cf_fpu_gdb_get_reg(CPUM68KState *env, GByteArray *mem_buf, int n)
+static int cf_fpu_gdb_get_reg(CPUState *cs, GByteArray *mem_buf, int n)
 {
+    M68kCPU *cpu = M68K_CPU(cs);
+    CPUM68KState *env = &cpu->env;
+
     if (n < 8) {
         float_status s;
         return gdb_get_reg64(mem_buf, floatx80_to_float64(env->fregs[n].d, &s));
@@ -86,8 +89,11 @@ static int cf_fpu_gdb_get_reg(CPUM68KState *env, GByteArray *mem_buf, int n)
     return 0;
 }
 
-static int cf_fpu_gdb_set_reg(CPUM68KState *env, uint8_t *mem_buf, int n)
+static int cf_fpu_gdb_set_reg(CPUState *cs, uint8_t *mem_buf, int n)
 {
+    M68kCPU *cpu = M68K_CPU(cs);
+    CPUM68KState *env = &cpu->env;
+
     if (n < 8) {
         float_status s;
         env->fregs[n].d = float64_to_floatx80(ldq_p(mem_buf), &s);
@@ -106,8 +112,11 @@ static int cf_fpu_gdb_set_reg(CPUM68KState *env, uint8_t *mem_buf, int n)
     return 0;
 }
 
-static int m68k_fpu_gdb_get_reg(CPUM68KState *env, GByteArray *mem_buf, int n)
+static int m68k_fpu_gdb_get_reg(CPUState *cs, GByteArray *mem_buf, int n)
 {
+    M68kCPU *cpu = M68K_CPU(cs);
+    CPUM68KState *env = &cpu->env;
+
     if (n < 8) {
         int len = gdb_get_reg16(mem_buf, env->fregs[n].l.upper);
         len += gdb_get_reg16(mem_buf, 0);
@@ -125,8 +134,11 @@ static int m68k_fpu_gdb_get_reg(CPUM68KState *env, GByteArray *mem_buf, int n)
     return 0;
 }
 
-static int m68k_fpu_gdb_set_reg(CPUM68KState *env, uint8_t *mem_buf, int n)
+static int m68k_fpu_gdb_set_reg(CPUState *cs, uint8_t *mem_buf, int n)
 {
+    M68kCPU *cpu = M68K_CPU(cs);
+    CPUM68KState *env = &cpu->env;
+
     if (n < 8) {
         env->fregs[n].l.upper = lduw_be_p(mem_buf);
         env->fregs[n].l.lower = ldq_be_p(mem_buf + 4);
diff --git a/target/microblaze/gdbstub.c b/target/microblaze/gdbstub.c
index 29ac6e9c0f..6ffc5ad075 100644
--- a/target/microblaze/gdbstub.c
+++ b/target/microblaze/gdbstub.c
@@ -94,8 +94,10 @@ int mb_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     return gdb_get_reg32(mem_buf, val);
 }
 
-int mb_cpu_gdb_read_stack_protect(CPUMBState *env, GByteArray *mem_buf, int n)
+int mb_cpu_gdb_read_stack_protect(CPUState *cs, GByteArray *mem_buf, int n)
 {
+    MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
+    CPUMBState *env = &cpu->env;
     uint32_t val;
 
     switch (n) {
@@ -153,8 +155,11 @@ int mb_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     return 4;
 }
 
-int mb_cpu_gdb_write_stack_protect(CPUMBState *env, uint8_t *mem_buf, int n)
+int mb_cpu_gdb_write_stack_protect(CPUState *cs, uint8_t *mem_buf, int n)
 {
+    MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
+    CPUMBState *env = &cpu->env;
+
     switch (n) {
     case GDB_SP_SHL:
         env->slr = ldl_p(mem_buf);
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 09b852464f..8ca37b6bf9 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -369,8 +369,10 @@ static int gdb_find_spr_idx(CPUPPCState *env, int n)
     return -1;
 }
 
-static int gdb_get_spr_reg(CPUPPCState *env, GByteArray *buf, int n)
+static int gdb_get_spr_reg(CPUState *cs, GByteArray *buf, int n)
 {
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    CPUPPCState *env = &cpu->env;
     int reg;
     int len;
 
@@ -385,8 +387,10 @@ static int gdb_get_spr_reg(CPUPPCState *env, GByteArray *buf, int n)
     return len;
 }
 
-static int gdb_set_spr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
+static int gdb_set_spr_reg(CPUState *cs, uint8_t *mem_buf, int n)
 {
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    CPUPPCState *env = &cpu->env;
     int reg;
     int len;
 
@@ -403,8 +407,10 @@ static int gdb_set_spr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
 }
 #endif
 
-static int gdb_get_float_reg(CPUPPCState *env, GByteArray *buf, int n)
+static int gdb_get_float_reg(CPUState *cs, GByteArray *buf, int n)
 {
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    CPUPPCState *env = &cpu->env;
     uint8_t *mem_buf;
     if (n < 32) {
         gdb_get_reg64(buf, *cpu_fpr_ptr(env, n));
@@ -421,8 +427,11 @@ static int gdb_get_float_reg(CPUPPCState *env, GByteArray *buf, int n)
     return 0;
 }
 
-static int gdb_set_float_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
+static int gdb_set_float_reg(CPUState *cs, uint8_t *mem_buf, int n)
 {
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    CPUPPCState *env = &cpu->env;
+
     if (n < 32) {
         ppc_maybe_bswap_register(env, mem_buf, 8);
         *cpu_fpr_ptr(env, n) = ldq_p(mem_buf);
@@ -436,8 +445,10 @@ static int gdb_set_float_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
     return 0;
 }
 
-static int gdb_get_avr_reg(CPUPPCState *env, GByteArray *buf, int n)
+static int gdb_get_avr_reg(CPUState *cs, GByteArray *buf, int n)
 {
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    CPUPPCState *env = &cpu->env;
     uint8_t *mem_buf;
 
     if (n < 32) {
@@ -462,8 +473,11 @@ static int gdb_get_avr_reg(CPUPPCState *env, GByteArray *buf, int n)
     return 0;
 }
 
-static int gdb_set_avr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
+static int gdb_set_avr_reg(CPUState *cs, uint8_t *mem_buf, int n)
 {
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    CPUPPCState *env = &cpu->env;
+
     if (n < 32) {
         ppc_avr_t *avr = cpu_avr_ptr(env, n);
         ppc_maybe_bswap_register(env, mem_buf, 16);
@@ -484,8 +498,11 @@ static int gdb_set_avr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
     return 0;
 }
 
-static int gdb_get_spe_reg(CPUPPCState *env, GByteArray *buf, int n)
+static int gdb_get_spe_reg(CPUState *cs, GByteArray *buf, int n)
 {
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    CPUPPCState *env = &cpu->env;
+
     if (n < 32) {
 #if defined(TARGET_PPC64)
         gdb_get_reg32(buf, env->gpr[n] >> 32);
@@ -508,8 +525,11 @@ static int gdb_get_spe_reg(CPUPPCState *env, GByteArray *buf, int n)
     return 0;
 }
 
-static int gdb_set_spe_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
+static int gdb_set_spe_reg(CPUState *cs, uint8_t *mem_buf, int n)
 {
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    CPUPPCState *env = &cpu->env;
+
     if (n < 32) {
 #if defined(TARGET_PPC64)
         target_ulong lo = (uint32_t)env->gpr[n];
@@ -537,8 +557,11 @@ static int gdb_set_spe_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
     return 0;
 }
 
-static int gdb_get_vsx_reg(CPUPPCState *env, GByteArray *buf, int n)
+static int gdb_get_vsx_reg(CPUState *cs, GByteArray *buf, int n)
 {
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    CPUPPCState *env = &cpu->env;
+
     if (n < 32) {
         gdb_get_reg64(buf, *cpu_vsrl_ptr(env, n));
         ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 8), 8);
@@ -547,8 +570,11 @@ static int gdb_get_vsx_reg(CPUPPCState *env, GByteArray *buf, int n)
     return 0;
 }
 
-static int gdb_set_vsx_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
+static int gdb_set_vsx_reg(CPUState *cs, uint8_t *mem_buf, int n)
 {
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    CPUPPCState *env = &cpu->env;
+
     if (n < 32) {
         ppc_maybe_bswap_register(env, mem_buf, 8);
         *cpu_vsrl_ptr(env, n) = ldq_p(mem_buf);
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index f222d5050e..5cb550761e 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -108,8 +108,11 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     return length;
 }
 
-static int riscv_gdb_get_fpu(CPURISCVState *env, GByteArray *buf, int n)
+static int riscv_gdb_get_fpu(CPUState *cs, GByteArray *buf, int n)
 {
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+
     if (n < 32) {
         if (env->misa_ext & RVD) {
             return gdb_get_reg64(buf, env->fpr[n]);
@@ -121,8 +124,11 @@ static int riscv_gdb_get_fpu(CPURISCVState *env, GByteArray *buf, int n)
     return 0;
 }
 
-static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
+static int riscv_gdb_set_fpu(CPUState *cs, uint8_t *mem_buf, int n)
 {
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+
     if (n < 32) {
         env->fpr[n] = ldq_p(mem_buf); /* always 64-bit */
         return sizeof(uint64_t);
@@ -130,8 +136,10 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
     return 0;
 }
 
-static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
+static int riscv_gdb_get_vector(CPUState *cs, GByteArray *buf, int n)
 {
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
     uint16_t vlenb = riscv_cpu_cfg(env)->vlen >> 3;
     if (n < 32) {
         int i;
@@ -146,8 +154,10 @@ static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
     return 0;
 }
 
-static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, int n)
+static int riscv_gdb_set_vector(CPUState *cs, uint8_t *mem_buf, int n)
 {
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
     uint16_t vlenb = riscv_cpu_cfg(env)->vlen >> 3;
     if (n < 32) {
         int i;
@@ -160,8 +170,11 @@ static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, int n)
     return 0;
 }
 
-static int riscv_gdb_get_csr(CPURISCVState *env, GByteArray *buf, int n)
+static int riscv_gdb_get_csr(CPUState *cs, GByteArray *buf, int n)
 {
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+
     if (n < CSR_TABLE_SIZE) {
         target_ulong val = 0;
         int result;
@@ -174,8 +187,11 @@ static int riscv_gdb_get_csr(CPURISCVState *env, GByteArray *buf, int n)
     return 0;
 }
 
-static int riscv_gdb_set_csr(CPURISCVState *env, uint8_t *mem_buf, int n)
+static int riscv_gdb_set_csr(CPUState *cs, uint8_t *mem_buf, int n)
 {
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+
     if (n < CSR_TABLE_SIZE) {
         target_ulong val = ldtul_p(mem_buf);
         int result;
@@ -188,25 +204,31 @@ static int riscv_gdb_set_csr(CPURISCVState *env, uint8_t *mem_buf, int n)
     return 0;
 }
 
-static int riscv_gdb_get_virtual(CPURISCVState *cs, GByteArray *buf, int n)
+static int riscv_gdb_get_virtual(CPUState *cs, GByteArray *buf, int n)
 {
     if (n == 0) {
 #ifdef CONFIG_USER_ONLY
         return gdb_get_regl(buf, 0);
 #else
-        return gdb_get_regl(buf, cs->priv);
+        RISCVCPU *cpu = RISCV_CPU(cs);
+        CPURISCVState *env = &cpu->env;
+
+        return gdb_get_regl(buf, env->priv);
 #endif
     }
     return 0;
 }
 
-static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
+static int riscv_gdb_set_virtual(CPUState *cs, uint8_t *mem_buf, int n)
 {
     if (n == 0) {
 #ifndef CONFIG_USER_ONLY
-        cs->priv = ldtul_p(mem_buf) & 0x3;
-        if (cs->priv == PRV_RESERVED) {
-            cs->priv = PRV_S;
+        RISCVCPU *cpu = RISCV_CPU(cs);
+        CPURISCVState *env = &cpu->env;
+
+        env->priv = ldtul_p(mem_buf) & 0x3;
+        if (env->priv == PRV_RESERVED) {
+            env->priv = PRV_S;
         }
 #endif
         return sizeof(target_ulong);
diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
index 02c388dc32..c1e7c59b82 100644
--- a/target/s390x/gdbstub.c
+++ b/target/s390x/gdbstub.c
@@ -70,8 +70,11 @@ int s390_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 #define S390_A0_REGNUM 0
 #define S390_A15_REGNUM 15
 
-static int cpu_read_ac_reg(CPUS390XState *env, GByteArray *buf, int n)
+static int cpu_read_ac_reg(CPUState *cs, GByteArray *buf, int n)
 {
+    S390CPU *cpu = S390_CPU(cs);
+    CPUS390XState *env = &cpu->env;
+
     switch (n) {
     case S390_A0_REGNUM ... S390_A15_REGNUM:
         return gdb_get_reg32(buf, env->aregs[n]);
@@ -80,8 +83,11 @@ static int cpu_read_ac_reg(CPUS390XState *env, GByteArray *buf, int n)
     }
 }
 
-static int cpu_write_ac_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
+static int cpu_write_ac_reg(CPUState *cs, uint8_t *mem_buf, int n)
 {
+    S390CPU *cpu = S390_CPU(cs);
+    CPUS390XState *env = &cpu->env;
+
     switch (n) {
     case S390_A0_REGNUM ... S390_A15_REGNUM:
         env->aregs[n] = ldl_p(mem_buf);
@@ -97,8 +103,11 @@ static int cpu_write_ac_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
 #define S390_F0_REGNUM 1
 #define S390_F15_REGNUM 16
 
-static int cpu_read_fp_reg(CPUS390XState *env, GByteArray *buf, int n)
+static int cpu_read_fp_reg(CPUState *cs, GByteArray *buf, int n)
 {
+    S390CPU *cpu = S390_CPU(cs);
+    CPUS390XState *env = &cpu->env;
+
     switch (n) {
     case S390_FPC_REGNUM:
         return gdb_get_reg32(buf, env->fpc);
@@ -109,8 +118,11 @@ static int cpu_read_fp_reg(CPUS390XState *env, GByteArray *buf, int n)
     }
 }
 
-static int cpu_write_fp_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
+static int cpu_write_fp_reg(CPUState *cs, uint8_t *mem_buf, int n)
 {
+    S390CPU *cpu = S390_CPU(cs);
+    CPUS390XState *env = &cpu->env;
+
     switch (n) {
     case S390_FPC_REGNUM:
         env->fpc = ldl_p(mem_buf);
@@ -129,8 +141,10 @@ static int cpu_write_fp_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
 #define S390_V16_REGNUM 16
 #define S390_V31_REGNUM 31
 
-static int cpu_read_vreg(CPUS390XState *env, GByteArray *buf, int n)
+static int cpu_read_vreg(CPUState *cs, GByteArray *buf, int n)
 {
+    S390CPU *cpu = S390_CPU(cs);
+    CPUS390XState *env = &cpu->env;
     int ret;
 
     switch (n) {
@@ -148,8 +162,11 @@ static int cpu_read_vreg(CPUS390XState *env, GByteArray *buf, int n)
     return ret;
 }
 
-static int cpu_write_vreg(CPUS390XState *env, uint8_t *mem_buf, int n)
+static int cpu_write_vreg(CPUState *cs, uint8_t *mem_buf, int n)
 {
+    S390CPU *cpu = S390_CPU(cs);
+    CPUS390XState *env = &cpu->env;
+
     switch (n) {
     case S390_V0L_REGNUM ... S390_V15L_REGNUM:
         env->vregs[n][1] = ldtul_p(mem_buf + 8);
@@ -168,8 +185,11 @@ static int cpu_write_vreg(CPUS390XState *env, uint8_t *mem_buf, int n)
 #define S390_C15_REGNUM 15
 
 #ifndef CONFIG_USER_ONLY
-static int cpu_read_c_reg(CPUS390XState *env, GByteArray *buf, int n)
+static int cpu_read_c_reg(CPUState *cs, GByteArray *buf, int n)
 {
+    S390CPU *cpu = S390_CPU(cs);
+    CPUS390XState *env = &cpu->env;
+
     switch (n) {
     case S390_C0_REGNUM ... S390_C15_REGNUM:
         return gdb_get_regl(buf, env->cregs[n]);
@@ -178,8 +198,11 @@ static int cpu_read_c_reg(CPUS390XState *env, GByteArray *buf, int n)
     }
 }
 
-static int cpu_write_c_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
+static int cpu_write_c_reg(CPUState *cs, uint8_t *mem_buf, int n)
 {
+    S390CPU *cpu = S390_CPU(cs);
+    CPUS390XState *env = &cpu->env;
+
     switch (n) {
     case S390_C0_REGNUM ... S390_C15_REGNUM:
         env->cregs[n] = ldtul_p(mem_buf);
@@ -199,8 +222,11 @@ static int cpu_write_c_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
 #define S390_VIRT_BEA_REGNUM    2
 #define S390_VIRT_PREFIX_REGNUM 3
 
-static int cpu_read_virt_reg(CPUS390XState *env, GByteArray *mem_buf, int n)
+static int cpu_read_virt_reg(CPUState *cs, GByteArray *mem_buf, int n)
 {
+    S390CPU *cpu = S390_CPU(cs);
+    CPUS390XState *env = &cpu->env;
+
     switch (n) {
     case S390_VIRT_CKC_REGNUM:
         return gdb_get_regl(mem_buf, env->ckc);
@@ -215,24 +241,27 @@ static int cpu_read_virt_reg(CPUS390XState *env, GByteArray *mem_buf, int n)
     }
 }
 
-static int cpu_write_virt_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
+static int cpu_write_virt_reg(CPUState *cs, uint8_t *mem_buf, int n)
 {
+    S390CPU *cpu = S390_CPU(cs);
+    CPUS390XState *env = &cpu->env;
+
     switch (n) {
     case S390_VIRT_CKC_REGNUM:
         env->ckc = ldtul_p(mem_buf);
-        cpu_synchronize_post_init(env_cpu(env));
+        cpu_synchronize_post_init(cs);
         return 8;
     case S390_VIRT_CPUTM_REGNUM:
         env->cputm = ldtul_p(mem_buf);
-        cpu_synchronize_post_init(env_cpu(env));
+        cpu_synchronize_post_init(cs);
         return 8;
     case S390_VIRT_BEA_REGNUM:
         env->gbea = ldtul_p(mem_buf);
-        cpu_synchronize_post_init(env_cpu(env));
+        cpu_synchronize_post_init(cs);
         return 8;
     case S390_VIRT_PREFIX_REGNUM:
         env->psa = ldtul_p(mem_buf);
-        cpu_synchronize_post_init(env_cpu(env));
+        cpu_synchronize_post_init(cs);
         return 8;
     default:
         return 0;
@@ -245,8 +274,11 @@ static int cpu_write_virt_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
 #define S390_VIRT_KVM_PFS_REGNUM    2
 #define S390_VIRT_KVM_PFC_REGNUM    3
 
-static int cpu_read_virt_kvm_reg(CPUS390XState *env, GByteArray *mem_buf, int n)
+static int cpu_read_virt_kvm_reg(CPUState *cs, GByteArray *mem_buf, int n)
 {
+    S390CPU *cpu = S390_CPU(cs);
+    CPUS390XState *env = &cpu->env;
+
     switch (n) {
     case S390_VIRT_KVM_PP_REGNUM:
         return gdb_get_regl(mem_buf, env->pp);
@@ -261,8 +293,11 @@ static int cpu_read_virt_kvm_reg(CPUS390XState *env, GByteArray *mem_buf, int n)
     }
 }
 
-static int cpu_write_virt_kvm_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
+static int cpu_write_virt_kvm_reg(CPUState *cs, uint8_t *mem_buf, int n)
 {
+    S390CPU *cpu = S390_CPU(cs);
+    CPUS390XState *env = &cpu->env;
+
     switch (n) {
     case S390_VIRT_KVM_PP_REGNUM:
         env->pp = ldtul_p(mem_buf);
@@ -292,13 +327,19 @@ static int cpu_write_virt_kvm_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
 #define S390_GS_GSSM_REGNUM     2
 #define S390_GS_GSEPLA_REGNUM   3
 
-static int cpu_read_gs_reg(CPUS390XState *env, GByteArray *buf, int n)
+static int cpu_read_gs_reg(CPUState *cs, GByteArray *buf, int n)
 {
+    S390CPU *cpu = S390_CPU(cs);
+    CPUS390XState *env = &cpu->env;
+
     return gdb_get_regl(buf, env->gscb[n]);
 }
 
-static int cpu_write_gs_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
+static int cpu_write_gs_reg(CPUState *cs, uint8_t *mem_buf, int n)
 {
+    S390CPU *cpu = S390_CPU(cs);
+    CPUS390XState *env = &cpu->env;
+
     env->gscb[n] = ldtul_p(mem_buf);
     cpu_synchronize_post_init(env_cpu(env));
     return 8;
-- 
2.42.0


