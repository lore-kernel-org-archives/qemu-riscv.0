Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nG2hW-0006KQ-TG
	for mharc-qemu-riscv@gnu.org; Fri, 04 Feb 2022 12:48:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2hS-0006H5-Sr
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:48:47 -0500
Received: from [2a00:1450:4864:20::42f] (port=43837
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2hE-0003vI-N5
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:48:46 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r19so1933255wrg.10
 for <qemu-riscv@nongnu.org>; Fri, 04 Feb 2022 09:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZO/0S2NQc3SEeipGrSMgSGKCMvukktNFfZTHuhQZWlA=;
 b=t5WBAvdKwQNJxIWN7fEz1eh2awTFGBq9X6bk5wsZq4mPBBJzqnu6b1sMjdwbwUEi8J
 6I/12h2t+e2+3EOHJzRpD+GqHwFBz0GE1zOp/is+dxcEQShDnB5suRhXCiW40kHt6AYA
 jGjvkl1wBmJPNMWLpsp51XErUfnuDaLvy6bX4GrU84ZJCTVdxvnKmfpSLTSAM26BjlH0
 4Myo3OSJI1x8RxIHu4sGyVOEdf8ErPW3OGKeUEOnovSaQyk2ZonIysO69VG5DuvPB2hQ
 /UTc6Z9sn4Lat6WI4SHKWgLItUshLhf+Ob8PJNLTyqFpCXZZffiO1gEWivLY7dXXKkYq
 yQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZO/0S2NQc3SEeipGrSMgSGKCMvukktNFfZTHuhQZWlA=;
 b=G4syU21DV3KqSYo9T9fU/WC0zx/1wNzaC/vTqeRBAkQ5NlcnmmiLitqsTjnZAlK802
 GtiUNwMfohypFOH/utogSzDeDtfrc6hN1BCa8ZEH3zALMEDO8SAkfli8hujndw3yIsiv
 QWXVXxSvPMgzg51yjI4KNx3N0kFQhS/zwiA5xHXXCA3sz0wpp3N4Pz5oH7Z01w1l3HRS
 pE0ao/kdownPdcmVKzOFObF/eztjtV1comO9llOfAPm4deuwMdj7JUdEQ0Dz3U7pvLau
 3glLetUGXb8fIx/UvkzY2lSDWgjroTRg4MzhJll0tRMz1i2OfQSusLkj8VSlS4bkGBCI
 sFMw==
X-Gm-Message-State: AOAM532I1bHNJXg+mqlJU7nmSNCusdLU0QimMX1xHZ3kgeDDu2YS/lJK
 6LryCu7EJnlYb8/Ny42KXSC1Mw==
X-Google-Smtp-Source: ABdhPJyediFk/LhmEcGvDcv5/+L/FO3qogcmvmhiHzi/sABOclPNH3LxTw9l6Xa/ic7kjrG7VsFbhA==
X-Received: by 2002:a5d:6409:: with SMTP id z9mr3349140wru.587.1643996900429; 
 Fri, 04 Feb 2022 09:48:20 -0800 (PST)
Received: from localhost.localdomain ([122.167.157.188])
 by smtp.gmail.com with ESMTPSA id f13sm11381876wmq.29.2022.02.04.09.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:48:19 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v9 13/23] target/riscv: Implement AIA mtopi, stopi,
 and vstopi CSRs
Date: Fri,  4 Feb 2022 23:16:49 +0530
Message-Id: <20220204174700.534953-14-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204174700.534953-1-anup@brainfault.org>
References: <20220204174700.534953-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::42f;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Fri, 04 Feb 2022 17:48:47 -0000

From: Anup Patel <anup.patel@wdc.com>

The AIA specification introduces new [m|s|vs]topi CSRs for
reporting pending local IRQ number and associated IRQ priority.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 156 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 00f55f47ed..b052de6b38 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -194,6 +194,15 @@ static int smode32(CPURISCVState *env, int csrno)
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
@@ -517,6 +526,8 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
 #define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP))
 #define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS))
 
+#define VSTOPI_NUM_SRCS 5
+
 static const uint64_t delegable_ints = S_MODE_INTERRUPTS |
                                            VS_MODE_INTERRUPTS;
 static const uint64_t vs_delegable_ints = VS_MODE_INTERRUPTS;
@@ -898,6 +909,28 @@ static RISCVException rmw_mieh(CPURISCVState *env, int csrno,
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
@@ -1478,6 +1511,120 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
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
@@ -2613,6 +2760,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
+    /* Machine-Level Interrupts (AIA) */
+    [CSR_MTOPI]    = { "mtopi",    aia_any,   read_mtopi },
+
     /* Virtual Interrupts for Supervisor Level (AIA) */
     [CSR_MVIEN]      = { "mvien", aia_any, read_zero, write_ignore },
     [CSR_MVIP]       = { "mvip",  aia_any, read_zero, write_ignore },
@@ -2642,6 +2792,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
 
+    /* Supervisor-Level Interrupts (AIA) */
+    [CSR_STOPI]      = { "stopi",      aia_smode, read_stopi },
+
     /* Supervisor-Level High-Half CSRs (AIA) */
     [CSR_SIEH]       = { "sieh",   aia_smode32, NULL, NULL, rmw_sieh },
     [CSR_SIPH]       = { "siph",   aia_smode32, NULL, NULL, rmw_siph },
@@ -2680,6 +2833,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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


