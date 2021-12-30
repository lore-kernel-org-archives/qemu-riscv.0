Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2ufj-0003NM-5A
	for mharc-qemu-riscv@gnu.org; Thu, 30 Dec 2021 07:36:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ufi-0003Mf-8a
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:36:42 -0500
Received: from [2607:f8b0:4864:20::1034] (port=40564
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2uff-0003Pb-5X
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:36:41 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 o63-20020a17090a0a4500b001b1c2db8145so27848442pjo.5
 for <qemu-riscv@nongnu.org>; Thu, 30 Dec 2021 04:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WmRXnvnshswRVjtiHfFAPfea1Nc21HoifgqgAYsWGDA=;
 b=UrFcM83cvUzD+RtVe6cKwO/gPWiSLbIYZHe4bUaXYCuCnsWIbMiZN/5ky7T7A/+K3u
 h1/vB1fl/t44qVkVzvOqlJnSF6oOhuirw6IGSsGV4r9h7JmM2WwMyfv+RSidHFnY0HkB
 JYlQpcNQCyRM2yHym6RCJpgjqzcQXG7LIveP3liWdcj9gI0Lg0JWzjPVf7xyOfE4U0W+
 lqKE26N07LRbJcKj3CO4ZW3uxPyZ6Wod1L8bjL3zE4K8/W3HoXp227BMr/ncaWVxcRTI
 /ElYztHX95auz6gZMVEBJF0WY/HT1Lxij+IxIDHYVt7lLSlWvVNYWLjSowfKW74LjVDb
 9XbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WmRXnvnshswRVjtiHfFAPfea1Nc21HoifgqgAYsWGDA=;
 b=dEBmMyCcj7C4sA9utnm0b0W7BaXE8VyrojC65XFmSJPX//60gZn9YlusIhBiGgz49J
 0qwVKGRHmCi6wEUVhuU2WyZvwt8ZCNENoIJyTtMk2qZovcW8P7UedH81H13yz6SAzF4Y
 oQ1Dx+K7xX0FGmTCqyZAQRnLH5c0PrclO+H0rLSv+fcl3/UEnQ80sVXeVLMA+cuei643
 lES8GqZVdnQMsu7P+OQRmg+0T/r6V9ckYWJTwIHtOMdXod7uLhzJ355QrYWyPPmg6lOt
 RAtnK0e9rDQaAgPjtifsBwyr+I1V4RtPrzjoxIFIcjr/7vppniH55PdeCU3PiDf9NGmZ
 gHnw==
X-Gm-Message-State: AOAM533/R95BDwRuTJPd6zdrNKrQjpNkpI/XtEahbvSu3E8xubGvdXnq
 JScx9YhIEt9s7n00YqIUvG1tWw==
X-Google-Smtp-Source: ABdhPJwq6lnSlqBz81HTuEb0XDe+8URyT5cDE+pO0to6cEBH2MrPQPOgImUuHLUTq+/WBPMFrK0aCw==
X-Received: by 2002:a17:90a:c788:: with SMTP id
 gn8mr37553845pjb.212.1640867797889; 
 Thu, 30 Dec 2021 04:36:37 -0800 (PST)
Received: from localhost.localdomain ([171.61.71.9])
 by smtp.gmail.com with ESMTPSA id a3sm28588348pfv.47.2021.12.30.04.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 04:36:37 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v6 14/23] target/riscv: Implement AIA xiselect and xireg CSRs
Date: Thu, 30 Dec 2021 18:05:30 +0530
Message-Id: <20211230123539.52786-15-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211230123539.52786-1-anup@brainfault.org>
References: <20211230123539.52786-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=anup@brainfault.org; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Thu, 30 Dec 2021 12:36:42 -0000

From: Anup Patel <anup.patel@wdc.com>

The AIA specification defines [m|s|vs]iselect and [m|s|vs]ireg CSRs
which allow indirect access to interrupt priority arrays and per-HART
IMSIC registers. This patch implements AIA xiselect and xireg CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
---
 target/riscv/cpu.h     |   7 ++
 target/riscv/csr.c     | 175 +++++++++++++++++++++++++++++++++++++++++
 target/riscv/machine.c |   3 +
 3 files changed, 185 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 721727c577..82272f99fd 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -186,6 +186,10 @@ struct CPURISCVState {
     uint8_t miprio[64];
     uint8_t siprio[64];
 
+    /* AIA CSRs */
+    target_ulong miselect;
+    target_ulong siselect;
+
     /* Hypervisor CSRs */
     target_ulong hstatus;
     target_ulong hedeleg;
@@ -215,6 +219,9 @@ struct CPURISCVState {
     target_ulong vstval;
     target_ulong vsatp;
 
+    /* AIA VS-mode CSRs */
+    target_ulong vsiselect;
+
     target_ulong mtval2;
     target_ulong mtinst;
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5a27c3bfbb..488877e89c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -895,6 +895,169 @@ static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
     return RISCV_EXCP_NONE;
 }
 
+static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)
+{
+    if (!riscv_cpu_virt_enabled(env)) {
+        return csrno;
+    }
+
+    switch (csrno) {
+    case CSR_SISELECT:
+        return CSR_VSISELECT;
+    case CSR_SIREG:
+        return CSR_VSIREG;
+    default:
+        return csrno;
+    };
+}
+
+static int rmw_xiselect(CPURISCVState *env, int csrno, target_ulong *val,
+                        target_ulong new_val, target_ulong wr_mask)
+{
+    target_ulong *iselect;
+
+    /* Translate CSR number for VS-mode */
+    csrno = aia_xlate_vs_csrno(env, csrno);
+
+    /* Find the iselect CSR based on CSR number */
+    switch (csrno) {
+    case CSR_MISELECT:
+        iselect = &env->miselect;
+        break;
+    case CSR_SISELECT:
+        iselect = &env->siselect;
+        break;
+    case CSR_VSISELECT:
+        iselect = &env->vsiselect;
+        break;
+    default:
+         return RISCV_EXCP_ILLEGAL_INST;
+    };
+
+    if (val) {
+        *val = *iselect;
+    }
+
+    wr_mask &= ISELECT_MASK;
+    if (wr_mask) {
+        *iselect = (*iselect & ~wr_mask) | (new_val & wr_mask);
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static int rmw_iprio(target_ulong xlen,
+                     target_ulong iselect, uint8_t *iprio,
+                     target_ulong *val, target_ulong new_val,
+                     target_ulong wr_mask, int ext_irq_no)
+{
+    int i, firq, nirqs;
+    target_ulong old_val;
+
+    if (iselect < ISELECT_IPRIO0 || ISELECT_IPRIO15 < iselect) {
+        return -EINVAL;
+    }
+    if (xlen != 32 && iselect & 0x1) {
+        return -EINVAL;
+    }
+
+    nirqs = 4 * (xlen / 32);
+    firq = ((iselect - ISELECT_IPRIO0) / (xlen / 32)) * (nirqs);
+
+    old_val = 0;
+    for (i = 0; i < nirqs; i++) {
+        old_val |= ((target_ulong)iprio[firq + i]) << (IPRIO_IRQ_BITS * i);
+    }
+
+    if (val) {
+        *val = old_val;
+    }
+
+    if (wr_mask) {
+        new_val = (old_val & ~wr_mask) | (new_val & wr_mask);
+        for (i = 0; i < nirqs; i++) {
+            /*
+             * M-level and S-level external IRQ priority always read-only
+             * zero. This means default priority order is always preferred
+             * for M-level and S-level external IRQs.
+             */
+            if ((firq + i) == ext_irq_no) {
+                continue;
+            }
+            iprio[firq + i] = (new_val >> (IPRIO_IRQ_BITS * i)) & 0xff;
+        }
+    }
+
+    return 0;
+}
+
+static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
+                     target_ulong new_val, target_ulong wr_mask)
+{
+    bool virt;
+    uint8_t *iprio;
+    int ret = -EINVAL;
+    target_ulong priv, isel, vgein;
+
+    /* Translate CSR number for VS-mode */
+    csrno = aia_xlate_vs_csrno(env, csrno);
+
+    /* Decode register details from CSR number */
+    virt = false;
+    switch (csrno) {
+    case CSR_MIREG:
+        iprio = env->miprio;
+        isel = env->miselect;
+        priv = PRV_M;
+        break;
+    case CSR_SIREG:
+        iprio = env->siprio;
+        isel = env->siselect;
+        priv = PRV_S;
+        break;
+    case CSR_VSIREG:
+        iprio = env->hviprio;
+        isel = env->vsiselect;
+        priv = PRV_S;
+        virt = true;
+        break;
+    default:
+         goto done;
+    };
+
+    /* Find the selected guest interrupt file */
+    vgein = (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
+
+    if (ISELECT_IPRIO0 <= isel && isel <= ISELECT_IPRIO15) {
+        /* Local interrupt priority registers not available for VS-mode */
+        if (!virt) {
+            ret = rmw_iprio(riscv_cpu_mxl_bits(env),
+                            isel, iprio, val, new_val, wr_mask,
+                            (priv == PRV_M) ? IRQ_M_EXT : IRQ_S_EXT);
+        }
+    } else if (ISELECT_IMSIC_FIRST <= isel && isel <= ISELECT_IMSIC_LAST) {
+        /* IMSIC registers only available when machine implements it. */
+        if (env->aia_ireg_rmw_fn[priv]) {
+            /* Selected guest interrupt file should not be zero */
+            if (virt && (!vgein || env->geilen < vgein)) {
+                goto done;
+            }
+            /* Call machine specific IMSIC register emulation */
+            ret = env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv],
+                                    AIA_MAKE_IREG(isel, priv, virt, vgein,
+                                                  riscv_cpu_mxl_bits(env)),
+                                    val, new_val, wr_mask);
+        }
+    }
+
+done:
+    if (ret) {
+        return (riscv_cpu_virt_enabled(env) && virt) ?
+               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
+    }
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mtvec(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
@@ -2536,6 +2699,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
+    /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
+    [CSR_MISELECT] = { "miselect", aia_any,   NULL, NULL,    rmw_xiselect },
+    [CSR_MIREG]    = { "mireg",    aia_any,   NULL, NULL,    rmw_xireg },
+
     /* Machine-Level Interrupts (AIA) */
     [CSR_MTOPI]    = { "mtopi",    aia_any,   read_mtopi },
 
@@ -2566,6 +2733,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
 
+    /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
+    [CSR_SISELECT]   = { "siselect",   aia_smode, NULL, NULL, rmw_xiselect },
+    [CSR_SIREG]      = { "sireg",      aia_smode, NULL, NULL, rmw_xireg },
+
     /* Supervisor-Level Interrupts (AIA) */
     [CSR_STOPI]      = { "stopi",      aia_smode, read_stopi },
 
@@ -2607,6 +2778,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
     [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
 
+    /* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
+    [CSR_VSISELECT]   = { "vsiselect",   aia_hmode, NULL, NULL,      rmw_xiselect },
+    [CSR_VSIREG]      = { "vsireg",      aia_hmode, NULL, NULL,      rmw_xireg },
+
     /* VS-Level Interrupts (H-extension with AIA) */
     [CSR_VSTOPI]      = { "vstopi",      aia_hmode, read_vstopi },
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index f027d5e307..376a02a36f 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -103,6 +103,7 @@ static const VMStateDescription vmstate_hyper = {
         VMSTATE_UINTTL(env.vscause, RISCVCPU),
         VMSTATE_UINTTL(env.vstval, RISCVCPU),
         VMSTATE_UINTTL(env.vsatp, RISCVCPU),
+        VMSTATE_UINTTL(env.vsiselect, RISCVCPU),
 
         VMSTATE_UINTTL(env.mtval2, RISCVCPU),
         VMSTATE_UINTTL(env.mtinst, RISCVCPU),
@@ -210,6 +211,8 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.mepc, RISCVCPU),
         VMSTATE_UINTTL(env.mcause, RISCVCPU),
         VMSTATE_UINTTL(env.mtval, RISCVCPU),
+        VMSTATE_UINTTL(env.miselect, RISCVCPU),
+        VMSTATE_UINTTL(env.siselect, RISCVCPU),
         VMSTATE_UINTTL(env.scounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
-- 
2.25.1


