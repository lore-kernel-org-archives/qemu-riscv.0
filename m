Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nACr6-00066h-Tu
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 10:26:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACr5-00062F-Jo
 for qemu-riscv@nongnu.org; Wed, 19 Jan 2022 10:26:35 -0500
Received: from [2607:f8b0:4864:20::62f] (port=38736
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACr3-0000JJ-VO
 for qemu-riscv@nongnu.org; Wed, 19 Jan 2022 10:26:35 -0500
Received: by mail-pl1-x62f.google.com with SMTP id c3so2528232pls.5
 for <qemu-riscv@nongnu.org>; Wed, 19 Jan 2022 07:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+2f76xuGenIPr0LxZCa85I1s9ximdhNUkYzue96LV0g=;
 b=AalSV6o19p9EppP6PaMZN7gafADtgZBKNThl1iUDPrU4uq3/wgdt0l9gIMOV6SXy+v
 Mm8TK4CVkfgZGhhVL+Duilu1cbtt/bZzJ5xphDXmL0Mv8HBKO/HvSbipAg6HI9YlqyXW
 xdTLA53Li2ZAQzRnJs1S9oCBmoirPEZ4DM341Ko5X749mN5CZxYcGOk5PGmCLkvjtAA2
 /71d1rC8V4veWu4WYFK4VreQcLY/s5T3brscgTe5RrY3oLU/sySSXHgl45V5OpV8fOZv
 lVYmkf2woyR0GEIZdvToCBt/dYXHISPUcHb8UBxindGFkI/WVswYrN4YFd6O41GTO85D
 G1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+2f76xuGenIPr0LxZCa85I1s9ximdhNUkYzue96LV0g=;
 b=PyfGeKVOQMzqiaKYJOMYEKNGnsPbuaMEWAjnwzLND1/8vluNR+lOUnqb9q9eoFhx9I
 HfjGaw93soNPDwC8sYnqYJiTzDSNlCrxVC/5Zqcz6qvodRHM1LzZ63Upg0mqLyYAhNgw
 mF9swH24G0UZdQMUI/OOSv/JazZfhI8/p8A7I6LfIkXP8lLJbOqR8WkdHLU7am0JGmoO
 4sqgSXFthM6QFI/bErp3wb6EEqDHVtKB2c8Kau5w9Jgg8yK6D/GoYgyKHw7Ppzx5nNaF
 p+dj5nijGF887Jr5syZmyCO22WxM7wa0FZAe9NFiCHvnI5HYZkVrWwuL2ILLtpjQ68w3
 ycrQ==
X-Gm-Message-State: AOAM5317of0Lr3UyD5TmUSGzeIo0BP8EWZxnm+0Z9YqwwhXFy/LTIvG0
 q9/reVfajfTmWWJFtSYLXJj+SA==
X-Google-Smtp-Source: ABdhPJx90Xb/RWsQzBChy4zDUVQSNCfZjIvfirrMvYpdEMyZYnYOip3uPkk3osWs+kdKFcpEKY4EPQ==
X-Received: by 2002:a17:90b:3841:: with SMTP id
 nl1mr4942165pjb.60.1642605992583; 
 Wed, 19 Jan 2022 07:26:32 -0800 (PST)
Received: from localhost.localdomain ([122.179.40.245])
 by smtp.gmail.com with ESMTPSA id 187sm26791pfv.157.2022.01.19.07.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:26:31 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v8 02/23] target/riscv: Implement SGEIP bit in hip and hie CSRs
Date: Wed, 19 Jan 2022 20:55:53 +0530
Message-Id: <20220119152614.27548-3-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119152614.27548-1-anup@brainfault.org>
References: <20220119152614.27548-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=anup@brainfault.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 19 Jan 2022 15:26:35 -0000

From: Anup Patel <anup.patel@wdc.com>

A hypervisor can optionally take guest external interrupts using
SGEIP bit of hip and hie CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c      |  3 ++-
 target/riscv/cpu_bits.h |  3 +++
 target/riscv/csr.c      | 18 +++++++++++-------
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c2b570e904..f9cdc10fba 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -408,6 +408,7 @@ static void riscv_cpu_reset(DeviceState *dev)
         env->mstatus = set_field(env->mstatus, MSTATUS64_UXL, env->misa_mxl);
     }
     env->mcause = 0;
+    env->miclaim = MIP_SGEIP;
     env->pc = env->resetvec;
     env->two_stage_lookup = false;
     /* mmte is supposed to have pm.current hardwired to 1 */
@@ -665,7 +666,7 @@ static void riscv_cpu_init(Object *obj)
     cpu_set_cpustate_pointers(cpu);
 
 #ifndef CONFIG_USER_ONLY
-    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, 12);
+    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_MAX);
 #endif /* CONFIG_USER_ONLY */
 }
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 5a6d49aa64..ee6d95ea91 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -537,6 +537,8 @@ typedef enum RISCVException {
 #define IRQ_S_EXT                          9
 #define IRQ_VS_EXT                         10
 #define IRQ_M_EXT                          11
+#define IRQ_S_GEXT                         12
+#define IRQ_LOCAL_MAX                      16
 
 /* mip masks */
 #define MIP_USIP                           (1 << IRQ_U_SOFT)
@@ -551,6 +553,7 @@ typedef enum RISCVException {
 #define MIP_SEIP                           (1 << IRQ_S_EXT)
 #define MIP_VSEIP                          (1 << IRQ_VS_EXT)
 #define MIP_MEIP                           (1 << IRQ_M_EXT)
+#define MIP_SGEIP                          (1 << IRQ_S_GEXT)
 
 /* sip masks */
 #define SIP_SSIP                           MIP_SSIP
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f7f178b63b..48f0598a20 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -450,12 +450,13 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
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
@@ -733,7 +734,7 @@ static RISCVException write_mideleg(CPURISCVState *env, int csrno,
 {
     env->mideleg = (env->mideleg & ~delegable_ints) | (val & delegable_ints);
     if (riscv_has_ext(env, RVH)) {
-        env->mideleg |= VS_MODE_INTERRUPTS;
+        env->mideleg |= HS_MODE_INTERRUPTS;
     }
     return RISCV_EXCP_NONE;
 }
@@ -749,6 +750,9 @@ static RISCVException write_mie(CPURISCVState *env, int csrno,
                                 target_ulong val)
 {
     env->mie = (env->mie & ~all_ints) | (val & all_ints);
+    if (!riscv_has_ext(env, RVH)) {
+        env->mie &= ~MIP_SGEIP;
+    }
     return RISCV_EXCP_NONE;
 }
 
@@ -1084,7 +1088,7 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
     }
 
     if (ret_value) {
-        *ret_value &= env->mideleg;
+        *ret_value &= env->mideleg & S_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1202,7 +1206,7 @@ static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
                       write_mask & hvip_writable_mask);
 
     if (ret_value) {
-        *ret_value &= hvip_writable_mask;
+        *ret_value &= VS_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1215,7 +1219,7 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
                       write_mask & hip_writable_mask);
 
     if (ret_value) {
-        *ret_value &= hip_writable_mask;
+        *ret_value &= HS_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1223,14 +1227,14 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
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


