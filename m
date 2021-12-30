Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2uff-0003H5-TO
	for mharc-qemu-riscv@gnu.org; Thu, 30 Dec 2021 07:36:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ufd-0003CV-Or
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:36:37 -0500
Received: from [2607:f8b0:4864:20::636] (port=39706
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ufb-0003NS-Vz
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:36:37 -0500
Received: by mail-pl1-x636.google.com with SMTP id h6so14322697plf.6
 for <qemu-riscv@nongnu.org>; Thu, 30 Dec 2021 04:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F4BnrOq7VnsXLGKwJaOTyRGGF1Q9cxylw5yRZLGMpIo=;
 b=XxYLWaZicvlCx0qREzTPDZoegsPL2/wcmmXEqinBZI4BBmyeXNHMn0w8ttMmWMolDO
 pMPY0u73oF5gTvxkwjC3LbZ5AHbDCIyWOr6H7lwCccPXDF8xu6uSqZWbE60W2cByHJuB
 2R6t9C1n7fW2/mf+6pJZCD1kJLiYQHy4VKSBzL5ndOXZSr1psaWpJ/IFrwI3NemiS+v7
 +Yuw9FNL+xjnkQbiS5PBgH0mElkOpqh4ck45Ytd/HyM2F+bGxQBI35eE4QUHAWZPWaT0
 WdEc+pZYgCe4IC0+YJUM5gNMvBX3nE3qReRde+PXcwMbQiXmwSMrYdNLZ8Sl9tiissMH
 tNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F4BnrOq7VnsXLGKwJaOTyRGGF1Q9cxylw5yRZLGMpIo=;
 b=3tOM89q5lnhtflkwFgtQ+cD6ZQs3d4GMaWdzsGmmPH5ShGA2MQm9cOmQ61ze+yAljE
 DmtXASnVZzksyVpaBB3G1EvBMXXuMw8ijngL8RDUv1TFph9BxwTTJ82W+CXmhibsYvAE
 oBUiQRrXCaHaRAsCioxsJ5gCiRNOe3MDdjAFnMp6pukX6TTte0RFTBO8+XY1MWWDvtUD
 uwsTFunu3qZCRM4S6vqcYYEkMOek2o8AdWJYdVS198G145DXe01kqd6tpov9ubunzGOZ
 XYt1ATgoxzBn52wrOAmM/kUP6rIw78wDRGr6lN/GDhfEdRttPWOLlOjZcfwkkrQK5gtx
 aqug==
X-Gm-Message-State: AOAM531YEsr9E7ZF50pYWMnXYq7rDo2kNhWm2wJl2OrAwQPT7oDjwaW1
 inTkdQwbBGb95AVRT5hSbh5Gsw==
X-Google-Smtp-Source: ABdhPJyGHBVdrJ8jurW7YvOen83ZjG9jUDqKGD50SLwtOJMp1hmPCveY61dXSM04z/3TDx9+HnXdXA==
X-Received: by 2002:a17:90b:f0b:: with SMTP id
 br11mr37370367pjb.39.1640867794714; 
 Thu, 30 Dec 2021 04:36:34 -0800 (PST)
Received: from localhost.localdomain ([171.61.71.9])
 by smtp.gmail.com with ESMTPSA id a3sm28588348pfv.47.2021.12.30.04.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 04:36:34 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v6 13/23] target/riscv: Implement AIA mtopi, stopi,
 and vstopi CSRs
Date: Thu, 30 Dec 2021 18:05:29 +0530
Message-Id: <20211230123539.52786-14-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211230123539.52786-1-anup@brainfault.org>
References: <20211230123539.52786-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=anup@brainfault.org; helo=mail-pl1-x636.google.com
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
X-List-Received-Date: Thu, 30 Dec 2021 12:36:38 -0000

From: Anup Patel <anup.patel@wdc.com>

The AIA specification introduces new [m|s|vs]topi CSRs for
reporting pending local IRQ number and associated IRQ priority.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
---
 target/riscv/csr.c | 156 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 55e747fbf7..5a27c3bfbb 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -190,6 +190,15 @@ static int smode32(CPURISCVState *env, int csrno)
     return smode(env, csrno);
 }
 
+static int aia_smode(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return smode(env, csrno);
+}
+
 static int aia_smode32(CPURISCVState *env, int csrno)
 {
     if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
@@ -502,6 +511,8 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
 #define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP))
 #define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS))
 
+#define VSTOPI_NUM_SRCS 5
+
 static const uint64_t delegable_ints = S_MODE_INTERRUPTS |
                                            VS_MODE_INTERRUPTS;
 static const uint64_t vs_delegable_ints = VS_MODE_INTERRUPTS;
@@ -862,6 +873,28 @@ static RISCVException rmw_mieh(CPURISCVState *env, int csrno,
     return ret;
 }
 
+static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int irq;
+    uint8_t iprio;
+
+    irq = riscv_cpu_mirq_pending(env);
+    if (irq <= 0 || irq > 63) {
+       *val = 0;
+    } else {
+       iprio = env->miprio[irq];
+       if (!iprio) {
+           if (riscv_cpu_default_priority(irq) > IPRIO_DEFAULT_M) {
+               iprio = IPRIO_MMAXIPRIO;
+           }
+       }
+       *val = (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
+       *val |= iprio;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mtvec(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
@@ -1391,6 +1424,120 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static int read_vstopi(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int irq, ret;
+    target_ulong topei;
+    uint64_t vseip, vsgein;
+    uint32_t iid, iprio, hviid, hviprio, gein;
+    uint32_t s, scount = 0, siid[VSTOPI_NUM_SRCS], siprio[VSTOPI_NUM_SRCS];
+
+    gein = get_field(env->hstatus, HSTATUS_VGEIN);
+    hviid = get_field(env->hvictl, HVICTL_IID);
+    hviprio = get_field(env->hvictl, HVICTL_IPRIO);
+
+    if (gein) {
+        vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
+        vseip = env->mie & (env->mip | vsgein) & MIP_VSEIP;
+        if (gein <= env->geilen && vseip) {
+            siid[scount] = IRQ_S_EXT;
+            siprio[scount] = IPRIO_MMAXIPRIO + 1;
+            if (env->aia_ireg_rmw_fn[PRV_S]) {
+                /*
+                 * Call machine specific IMSIC register emulation for
+                 * reading TOPEI.
+                 */
+                ret = env->aia_ireg_rmw_fn[PRV_S](
+                        env->aia_ireg_rmw_fn_arg[PRV_S],
+                        AIA_MAKE_IREG(ISELECT_IMSIC_TOPEI, PRV_S, true, gein,
+                                      riscv_cpu_mxl_bits(env)),
+                        &topei, 0, 0);
+                if (!ret && topei) {
+                    siprio[scount] = topei & IMSIC_TOPEI_IPRIO_MASK;
+                }
+            }
+            scount++;
+        }
+    } else {
+        if (hviid == IRQ_S_EXT && hviprio) {
+            siid[scount] = IRQ_S_EXT;
+            siprio[scount] = hviprio;
+            scount++;
+        }
+    }
+
+    if (env->hvictl & HVICTL_VTI) {
+        if (hviid != IRQ_S_EXT) {
+            siid[scount] = hviid;
+            siprio[scount] = hviprio;
+            scount++;
+        }
+    } else {
+        irq = riscv_cpu_vsirq_pending(env);
+        if (irq != IRQ_S_EXT && 0 < irq && irq <= 63) {
+           siid[scount] = irq;
+           siprio[scount] = env->hviprio[irq];
+           scount++;
+        }
+    }
+
+    iid = 0;
+    iprio = UINT_MAX;
+    for (s = 0; s < scount; s++) {
+        if (siprio[s] < iprio) {
+            iid = siid[s];
+            iprio = siprio[s];
+        }
+    }
+
+    if (iid) {
+        if (env->hvictl & HVICTL_IPRIOM) {
+            if (iprio > IPRIO_MMAXIPRIO) {
+                iprio = IPRIO_MMAXIPRIO;
+            }
+            if (!iprio) {
+                if (riscv_cpu_default_priority(iid) > IPRIO_DEFAULT_S) {
+                    iprio = IPRIO_MMAXIPRIO;
+                }
+            }
+        } else {
+            iprio = 1;
+        }
+    } else {
+        iprio = 0;
+    }
+
+    *val = (iid & TOPI_IID_MASK) << TOPI_IID_SHIFT;
+    *val |= iprio;
+    return RISCV_EXCP_NONE;
+}
+
+static int read_stopi(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int irq;
+    uint8_t iprio;
+
+    if (riscv_cpu_virt_enabled(env)) {
+        return read_vstopi(env, CSR_VSTOPI, val);
+    }
+
+    irq = riscv_cpu_sirq_pending(env);
+    if (irq <= 0 || irq > 63) {
+       *val = 0;
+    } else {
+       iprio = env->siprio[irq];
+       if (!iprio) {
+           if (riscv_cpu_default_priority(irq) > IPRIO_DEFAULT_S) {
+               iprio = IPRIO_MMAXIPRIO;
+           }
+       }
+       *val = (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
+       *val |= iprio;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
 /* Hypervisor Extensions */
 static RISCVException read_hstatus(CPURISCVState *env, int csrno,
                                    target_ulong *val)
@@ -2389,6 +2536,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
+    /* Machine-Level Interrupts (AIA) */
+    [CSR_MTOPI]    = { "mtopi",    aia_any,   read_mtopi },
+
     /* Virtual Interrupts for Supervisor Level (AIA) */
     [CSR_MVIEN]      = { "mvien", aia_any, read_zero, write_ignore },
     [CSR_MVIP]       = { "mvip",  aia_any, read_zero, write_ignore },
@@ -2416,6 +2566,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
 
+    /* Supervisor-Level Interrupts (AIA) */
+    [CSR_STOPI]      = { "stopi",      aia_smode, read_stopi },
+
     /* Supervisor-Level High-Half CSRs (AIA) */
     [CSR_SIEH]       = { "sieh",   aia_smode32, NULL, NULL, rmw_sieh },
     [CSR_SIPH]       = { "siph",   aia_smode32, NULL, NULL, rmw_siph },
@@ -2454,6 +2607,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
     [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
 
+    /* VS-Level Interrupts (H-extension with AIA) */
+    [CSR_VSTOPI]      = { "vstopi",      aia_hmode, read_vstopi },
+
     /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
     [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
     [CSR_HVIENH]      = { "hvienh",      aia_hmode32, read_zero, write_ignore },
-- 
2.25.1


