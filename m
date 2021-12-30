Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2uf4-0001gF-Vv
	for mharc-qemu-riscv@gnu.org; Thu, 30 Dec 2021 07:36:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2uf0-0001ZY-GI
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:35:58 -0500
Received: from [2607:f8b0:4864:20::534] (port=33457
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2uey-0003Eb-CV
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:35:57 -0500
Received: by mail-pg1-x534.google.com with SMTP id 7so8675165pgn.0
 for <qemu-riscv@nongnu.org>; Thu, 30 Dec 2021 04:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X+NcYTu4vtnvT9iritxHsZv9XrI8LDFmq8DEcK3eg+k=;
 b=QEAR/GhJLPFvhObmUHikP4nFsIDYeYMhmQh2y6eLSd48cXd7yW58WLVnJqJ5JgOJnr
 9mS0uoEOiJJhSwFb2omrP1pHmbpTMHXbV8q1gjGo3AKh+JX4cK0rtGlOrjZwQOr3n8+4
 bYbBEH88vRRzDHqCDJSffZn7hSLaY7hdKcb5Wfy/yF0UcAY+JC4ImnGO5SmqBCFnwy/h
 RbLjBGD45cez4DJinFjNpu6cQnNBxqL0Synk/sDxeYsMvXARvoOLKPWrs3LkKcCMpw97
 bXKG8KMqB9AsPsWyMQkO1GNAMWI0gvVND5K++KpBatNM5hQC4t09ee6iKNMdGbFGyP3S
 KfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X+NcYTu4vtnvT9iritxHsZv9XrI8LDFmq8DEcK3eg+k=;
 b=0+iJIbx8BsLiMhSu1oTuoaWGlY1AfC2jVzO+rorrXJYWT+LB5oPOpvt4MMJxIMT8LS
 Y/dQiyTCV2DZ1CUiZGUQZ6O9FcZjrX/iaej7GlUAo2ETUUd/Oc7dpXSGv9hcPsYRSEWC
 hwdkQObwsq0tmPnGTWvk+9N734vZetXFqecDAanUuGNSJnCqW5zchXBA3sS+FF8YFd5T
 QuE8lSHfoOP3ozowUqTKLZw1U6KCQFZyokyfkecyZKfSHxSstpBPRgRQnAxkepts1NT0
 +Tlbd2krqXMMbWyAsozchaQ0BVPEAu0esS2NbW7mV+yvUxWt2bqF/N2mWUjqOOVcNVPM
 Vf7Q==
X-Gm-Message-State: AOAM532bmcsK97BOH4Gjhm3PMD3barwYWjWCuhAcFq/MkJ4bxL1zB972
 innqrU/qaNHfvbOWXaIjJyD3IA==
X-Google-Smtp-Source: ABdhPJw80zlTPMeakIHtOa4L6OW1cDef81VJlYVho4qSiuHa4Kaa5vY3oyUe+O3Y+DrUmhGwdCaxEw==
X-Received: by 2002:a62:e516:0:b0:4bc:c00:d919 with SMTP id
 n22-20020a62e516000000b004bc0c00d919mr14608440pff.69.1640867754462; 
 Thu, 30 Dec 2021 04:35:54 -0800 (PST)
Received: from localhost.localdomain ([171.61.71.9])
 by smtp.gmail.com with ESMTPSA id a3sm28588348pfv.47.2021.12.30.04.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 04:35:53 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 02/23] target/riscv: Implement SGEIP bit in hip and hie CSRs
Date: Thu, 30 Dec 2021 18:05:18 +0530
Message-Id: <20211230123539.52786-3-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211230123539.52786-1-anup@brainfault.org>
References: <20211230123539.52786-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::534;
 envelope-from=anup@brainfault.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 30 Dec 2021 12:35:58 -0000

From: Anup Patel <anup.patel@wdc.com>

A hypervisor can optionally take guest external interrupts using
SGEIP bit of hip and hie CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c      |  3 ++-
 target/riscv/cpu_bits.h |  3 +++
 target/riscv/csr.c      | 18 +++++++++++-------
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6ef3314bce..7d92ce7555 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -372,6 +372,7 @@ static void riscv_cpu_reset(DeviceState *dev)
         env->mstatus = set_field(env->mstatus, MSTATUS64_UXL, env->misa_mxl);
     }
     env->mcause = 0;
+    env->miclaim = MIP_SGEIP;
     env->pc = env->resetvec;
     env->two_stage_lookup = false;
     /* mmte is supposed to have pm.current hardwired to 1 */
@@ -610,7 +611,7 @@ static void riscv_cpu_init(Object *obj)
     cpu_set_cpustate_pointers(cpu);
 
 #ifndef CONFIG_USER_ONLY
-    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, 12);
+    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_MAX);
 #endif /* CONFIG_USER_ONLY */
 }
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 1e31f4d35f..fe276d4b34 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -534,6 +534,8 @@ typedef enum RISCVException {
 #define IRQ_S_EXT                          9
 #define IRQ_VS_EXT                         10
 #define IRQ_M_EXT                          11
+#define IRQ_S_GEXT                         12
+#define IRQ_LOCAL_MAX                      16
 
 /* mip masks */
 #define MIP_USIP                           (1 << IRQ_U_SOFT)
@@ -548,6 +550,7 @@ typedef enum RISCVException {
 #define MIP_SEIP                           (1 << IRQ_S_EXT)
 #define MIP_VSEIP                          (1 << IRQ_VS_EXT)
 #define MIP_MEIP                           (1 << IRQ_M_EXT)
+#define MIP_SGEIP                          (1 << IRQ_S_GEXT)
 
 /* sip masks */
 #define SIP_SSIP                           MIP_SSIP
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fd7110c38b..a4028f28e0 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -446,12 +446,13 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
 #define M_MODE_INTERRUPTS  (MIP_MSIP | MIP_MTIP | MIP_MEIP)
 #define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP)
 #define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
+#define HS_MODE_INTERRUPTS (MIP_SGEIP | VS_MODE_INTERRUPTS)
 
 static const target_ulong delegable_ints = S_MODE_INTERRUPTS |
                                            VS_MODE_INTERRUPTS;
 static const target_ulong vs_delegable_ints = VS_MODE_INTERRUPTS;
 static const target_ulong all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
-                                     VS_MODE_INTERRUPTS;
+                                     HS_MODE_INTERRUPTS;
 #define DELEGABLE_EXCPS ((1ULL << (RISCV_EXCP_INST_ADDR_MIS)) | \
                          (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) | \
                          (1ULL << (RISCV_EXCP_ILLEGAL_INST)) | \
@@ -712,7 +713,7 @@ static RISCVException write_mideleg(CPURISCVState *env, int csrno,
 {
     env->mideleg = (env->mideleg & ~delegable_ints) | (val & delegable_ints);
     if (riscv_has_ext(env, RVH)) {
-        env->mideleg |= VS_MODE_INTERRUPTS;
+        env->mideleg |= HS_MODE_INTERRUPTS;
     }
     return RISCV_EXCP_NONE;
 }
@@ -728,6 +729,9 @@ static RISCVException write_mie(CPURISCVState *env, int csrno,
                                 target_ulong val)
 {
     env->mie = (env->mie & ~all_ints) | (val & all_ints);
+    if (!riscv_has_ext(env, RVH)) {
+        env->mie &= ~MIP_SGEIP;
+    }
     return RISCV_EXCP_NONE;
 }
 
@@ -1023,7 +1027,7 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
     }
 
     if (ret_value) {
-        *ret_value &= env->mideleg;
+        *ret_value &= env->mideleg & S_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1141,7 +1145,7 @@ static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
                       write_mask & hvip_writable_mask);
 
     if (ret_value) {
-        *ret_value &= hvip_writable_mask;
+        *ret_value &= VS_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1154,7 +1158,7 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
                       write_mask & hip_writable_mask);
 
     if (ret_value) {
-        *ret_value &= hip_writable_mask;
+        *ret_value &= HS_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1162,14 +1166,14 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
 static RISCVException read_hie(CPURISCVState *env, int csrno,
                                target_ulong *val)
 {
-    *val = env->mie & VS_MODE_INTERRUPTS;
+    *val = env->mie & HS_MODE_INTERRUPTS;
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException write_hie(CPURISCVState *env, int csrno,
                                 target_ulong val)
 {
-    target_ulong newval = (env->mie & ~VS_MODE_INTERRUPTS) | (val & VS_MODE_INTERRUPTS);
+    target_ulong newval = (env->mie & ~HS_MODE_INTERRUPTS) | (val & HS_MODE_INTERRUPTS);
     return write_mie(env, CSR_MIE, newval);
 }
 
-- 
2.25.1


