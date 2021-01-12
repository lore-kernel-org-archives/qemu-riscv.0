Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGA4-0002gv-Ci
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:40:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzG9w-0002f0-Hw
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:40:18 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzG9s-0006uM-39
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:40:14 -0500
Received: by mail-pj1-x102d.google.com with SMTP id l23so1308804pjg.1
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MEZtoYfV2WNqDXUl2jlgykOVGs3a8s8n4X/6jJNOFcU=;
 b=Rip/sCik9i6uDa0uaeBTCaL88JGkBXy3muPu1JDzlsxMQrxVkqmQgDqcOeBTZkzb9s
 /DxEzlJdowvXPvS1HTQ1fGhEvGvv6M3ToPtbSlxKOMFFylVpHcooTWX4brV3a5GajDzP
 TAPz9dhMowJ1PpoqPKpj4pIgHrlGhrKvZ4I0PYj4CHUL1NOqqyKRj4JNgw/XfQRIyuGD
 2OKEQcefxuVdCXny6Byk4HPxTw9n6RaptrazDaJuLHpBjyp8lgbj8IOZTg02+yDIagJD
 p3ezEHlAFgjk+dvVPqtos1yYnquJO4vw50mPAspnLRLvJbIelNd+r8aowEMinD6YXOIA
 VmCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MEZtoYfV2WNqDXUl2jlgykOVGs3a8s8n4X/6jJNOFcU=;
 b=gryhsgy1D89kRxTX0eFydFGE0szef9dQe+HwYAtmhbEC2QDPAaSfdIhPglmgQk1HU9
 eJ9545dHeSO1PdEkufThv16aa9YtFJse+uCT+t77rmBvNeGrON0KKnti23S7TvOV1Nyf
 I7POe6wYYpOyUhN0yaPIsZgNcQ/+1yQqh9lr1NcpEofg4q2ispmUGciVfpPl4OXp/OTC
 ndABWtprn8y6v+6xe2K/vUa8C4Glc45Td7RS8cnds1U8rTdZJuGY2tjQVM8NFWnQ+Dcv
 k6qVhGCCgnRNqrETbcUuFoqVNkAlidr8rBWXiaZ8jhiNMdJHVG8Gbmt8Ub8pTHA1RJd8
 Z4Tg==
X-Gm-Message-State: AOAM53107Fgj11mUCPWCD/KWYwR04ZyBLW2i66no37Cbr3fGSCRrzS0n
 aK7EyS95LBHxFBH+JblYaxMsAQ==
X-Google-Smtp-Source: ABdhPJwaIsvvxDleN6/9tBfFCx2w++rIF1M1w+TEma1lW57eLHrFlrSj+Z1dCZxfFgASRqY96APhHA==
X-Received: by 2002:a17:902:ed0d:b029:da:c83b:5f40 with SMTP id
 b13-20020a170902ed0db02900dac83b5f40mr3999506pld.20.1610444410121; 
 Tue, 12 Jan 2021 01:40:10 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:40:09 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v6 03/72] target/riscv: rvv-1.0: add mstatus VS field
Date: Tue, 12 Jan 2021 17:38:37 +0800
Message-Id: <20210112093950.17530-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jan 2021 09:40:22 -0000

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h        |  7 +++++++
 target/riscv/cpu_bits.h   |  1 +
 target/riscv/cpu_helper.c | 15 ++++++++++++++-
 target/riscv/csr.c        | 25 ++++++++++++++++++++++++-
 4 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index b0281133e09..cd5c77114a4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -325,6 +325,7 @@ int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
+bool riscv_cpu_vector_enabled(CPURISCVState *env);
 bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env);
@@ -372,6 +373,7 @@ void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 #define TB_FLAGS_PRIV_MMU_MASK                3
 #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
 #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
+#define TB_FLAGS_MSTATUS_VS MSTATUS_VS
 
 typedef CPURISCVState CPUArchState;
 typedef RISCVCPU ArchCPU;
@@ -426,6 +428,7 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 
 #ifdef CONFIG_USER_ONLY
     flags |= TB_FLAGS_MSTATUS_FS;
+    flags |= TB_FLAGS_MSTATUS_VS;
 #else
     flags |= cpu_mmu_index(env, 0);
     if (riscv_cpu_fp_enabled(env)) {
@@ -440,6 +443,10 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
             flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
         }
     }
+
+    if (riscv_cpu_vector_enabled(env)) {
+        flags |= env->mstatus & MSTATUS_VS;
+    }
 #endif
 
     *pflags = flags;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index b41e8836c3f..82c48b7b9be 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -370,6 +370,7 @@
 #define MSTATUS_SPIE        0x00000020
 #define MSTATUS_MPIE        0x00000080
 #define MSTATUS_SPP         0x00000100
+#define MSTATUS_VS          0x00000600
 #define MSTATUS_MPP         0x00001800
 #define MSTATUS_FS          0x00006000
 #define MSTATUS_XS          0x00018000
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index a2afb95fa11..8f67263a49a 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -108,11 +108,24 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
     return false;
 }
 
+/* Return true is vector support is currently enabled */
+bool riscv_cpu_vector_enabled(CPURISCVState *env)
+{
+    if (env->mstatus & MSTATUS_VS) {
+        if (riscv_cpu_virt_enabled(env) && !(env->mstatus_hs & MSTATUS_VS)) {
+            return false;
+        }
+        return true;
+    }
+
+    return false;
+}
+
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
 {
     uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
                             MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
-                            MSTATUS64_UXL;
+                            MSTATUS64_UXL | MSTATUS_VS;
     bool current_virt = riscv_cpu_virt_enabled(env);
 
     g_assert(riscv_has_ext(env, RVH));
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 10ab82ed1fc..50862df9e82 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -268,6 +268,7 @@ static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
         return -RISCV_EXCP_ILLEGAL_INST;
     }
     env->mstatus |= MSTATUS_FS;
+    env->mstatus |= MSTATUS_VS;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
     if (vs(env, csrno) >= 0) {
@@ -298,6 +299,13 @@ static int read_vxrm(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int write_vxrm(CPURISCVState *env, int csrno, target_ulong val)
 {
+#if !defined(CONFIG_USER_ONLY)
+    if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+        return -1;
+    }
+    env->mstatus |= MSTATUS_VS;
+#endif
+
     env->vxrm = val;
     return 0;
 }
@@ -310,6 +318,13 @@ static int read_vxsat(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int write_vxsat(CPURISCVState *env, int csrno, target_ulong val)
 {
+#if !defined(CONFIG_USER_ONLY)
+    if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+        return -1;
+    }
+    env->mstatus |= MSTATUS_VS;
+#endif
+
     env->vxsat = val;
     return 0;
 }
@@ -322,6 +337,13 @@ static int read_vstart(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
 {
+#if !defined(CONFIG_USER_ONLY)
+    if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+        return -1;
+    }
+    env->mstatus |= MSTATUS_VS;
+#endif
+
     env->vstart = val;
     return 0;
 }
@@ -485,7 +507,7 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
     mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
         MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
-        MSTATUS_TW;
+        MSTATUS_TW | MSTATUS_VS;
 
     if (!riscv_cpu_is_32bit(env)) {
         /*
@@ -498,6 +520,7 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
     mstatus = (mstatus & ~mask) | (val & mask);
 
     dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
+            ((mstatus & MSTATUS_VS) == MSTATUS_VS) |
             ((mstatus & MSTATUS_XS) == MSTATUS_XS);
     mstatus = set_field(mstatus, MSTATUS_SD, dirty);
     env->mstatus = mstatus;
-- 
2.17.1


