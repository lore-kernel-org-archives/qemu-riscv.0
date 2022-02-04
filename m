Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nG2gE-00036l-NP
	for mharc-qemu-riscv@gnu.org; Fri, 04 Feb 2022 12:47:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2gA-00031e-4C
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:47:27 -0500
Received: from [2a00:1450:4864:20::335] (port=42780
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2g7-0003kJ-Jo
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:47:25 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 n40-20020a05600c3ba800b00353958feb16so4229726wms.1
 for <qemu-riscv@nongnu.org>; Fri, 04 Feb 2022 09:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NXC7GLLmEsyikTRoYgJNb69Znup+5XSzek9+wleqbfY=;
 b=1lb/u14FVlSvbxRg1yq18IDzTQo7EMbZcG/bynPVEiTjf+63ZOEbp0ybUqoQaVaHsr
 G34IvHVqhg2ecnR98R8Vmsx1p6BDJTeUrJLvQk0X7sND91o+f7DLbrnLrPCQjc+I/OjT
 h5baSN8g9qpWh861fDBj2vTwbodVqJSAEcAj/uL+zboVSL7Zne+6DLhrzKxe6n7bZHFf
 l3YYYmiSP3DfLp5KIxmnzeFjPu5rvhGK+uDc3jCcwLFylCa54EgHTQN8bGMoAjCP5n67
 DzVMUinf9DSgoqP0pizPKJh9UBG2k9E/+DCekc6IOhPBzDb7n5txlC6gU1p4Q5T6fd69
 FEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NXC7GLLmEsyikTRoYgJNb69Znup+5XSzek9+wleqbfY=;
 b=Z9ZH3/27Zk8F7pwIkoaj3+2cRJl+F5aZguX5VTAO0EtjqSBlvL9bQ/yKxenFmIxvW1
 OS+/iRftJZiN2CqjfFDHw4psEk1jU3Iknj2M3Q5UV52BjgbsaGI0hGoVJqUUN+5Q5q55
 3F0N0JhDH2upBeDM5cYQScPmZsvR/gddwVy4elYBCXBMXy1jyeL2oCm9RtBRHLanIg/E
 IdpS1T5y8KVlejwLTWxMms6lEvitsvizQg09BOlHxi2PKz5hJt6R7TE0aymwwzl/GqM5
 8/1dooSdINrsr1Jyaq3R0lbwo8ffg/43er7EB47+bNt+FUJa0J2LF08MebQSfNUA8hvs
 W3Gg==
X-Gm-Message-State: AOAM532V44X3GgTNMn+OwsPVKui7M2a4dsyAyMNRv5YTAfk7kFird+9Q
 UYFNnHQrcCuM8Ybc2dfde9rUSg==
X-Google-Smtp-Source: ABdhPJwXMekrlUUH9+kSIQAu8/hW+uV+HKhg86gi8ky5bh/dGSSBm+u7oXP+wzxUxEQcR7mz0ZwX3Q==
X-Received: by 2002:a05:600c:4141:: with SMTP id
 h1mr3200551wmm.171.1643996840938; 
 Fri, 04 Feb 2022 09:47:20 -0800 (PST)
Received: from localhost.localdomain ([122.167.157.188])
 by smtp.gmail.com with ESMTPSA id f13sm11381876wmq.29.2022.02.04.09.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:47:20 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v9 02/23] target/riscv: Implement SGEIP bit in hip and hie CSRs
Date: Fri,  4 Feb 2022 23:16:38 +0530
Message-Id: <20220204174700.534953-3-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204174700.534953-1-anup@brainfault.org>
References: <20220204174700.534953-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::335;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 04 Feb 2022 17:47:28 -0000

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
index 1238aabe3f..e1224d26dc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -434,6 +434,7 @@ static void riscv_cpu_reset(DeviceState *dev)
         }
     }
     env->mcause = 0;
+    env->miclaim = MIP_SGEIP;
     env->pc = env->resetvec;
     env->two_stage_lookup = false;
     /* mmte is supposed to have pm.current hardwired to 1 */
@@ -695,7 +696,7 @@ static void riscv_cpu_init(Object *obj)
     cpu_set_cpustate_pointers(cpu);
 
 #ifndef CONFIG_USER_ONLY
-    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, 12);
+    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_MAX);
 #endif /* CONFIG_USER_ONLY */
 }
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7c87433645..e1256a9982 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -540,6 +540,8 @@ typedef enum RISCVException {
 #define IRQ_S_EXT                          9
 #define IRQ_VS_EXT                         10
 #define IRQ_M_EXT                          11
+#define IRQ_S_GEXT                         12
+#define IRQ_LOCAL_MAX                      16
 
 /* mip masks */
 #define MIP_USIP                           (1 << IRQ_U_SOFT)
@@ -554,6 +556,7 @@ typedef enum RISCVException {
 #define MIP_SEIP                           (1 << IRQ_S_EXT)
 #define MIP_VSEIP                          (1 << IRQ_VS_EXT)
 #define MIP_MEIP                           (1 << IRQ_M_EXT)
+#define MIP_SGEIP                          (1 << IRQ_S_GEXT)
 
 /* sip masks */
 #define SIP_SSIP                           MIP_SSIP
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 41a533a310..c635ffb089 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -461,12 +461,13 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
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
@@ -748,7 +749,7 @@ static RISCVException write_mideleg(CPURISCVState *env, int csrno,
 {
     env->mideleg = (env->mideleg & ~delegable_ints) | (val & delegable_ints);
     if (riscv_has_ext(env, RVH)) {
-        env->mideleg |= VS_MODE_INTERRUPTS;
+        env->mideleg |= HS_MODE_INTERRUPTS;
     }
     return RISCV_EXCP_NONE;
 }
@@ -764,6 +765,9 @@ static RISCVException write_mie(CPURISCVState *env, int csrno,
                                 target_ulong val)
 {
     env->mie = (env->mie & ~all_ints) | (val & all_ints);
+    if (!riscv_has_ext(env, RVH)) {
+        env->mie &= ~MIP_SGEIP;
+    }
     return RISCV_EXCP_NONE;
 }
 
@@ -1110,7 +1114,7 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
     }
 
     if (ret_value) {
-        *ret_value &= env->mideleg;
+        *ret_value &= env->mideleg & S_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1228,7 +1232,7 @@ static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
                       write_mask & hvip_writable_mask);
 
     if (ret_value) {
-        *ret_value &= hvip_writable_mask;
+        *ret_value &= VS_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1241,7 +1245,7 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
                       write_mask & hip_writable_mask);
 
     if (ret_value) {
-        *ret_value &= hip_writable_mask;
+        *ret_value &= HS_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1249,14 +1253,14 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
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


