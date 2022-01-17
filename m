Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9S62-0001ZJ-Ol
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 08:30:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5T-0001Mi-N1
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:30:20 -0500
Received: from [2607:f8b0:4864:20::633] (port=38673
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5O-0000wT-Ex
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:30:17 -0500
Received: by mail-pl1-x633.google.com with SMTP id c3so21262104pls.5
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 05:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hQY+m9fuC7vMypurkGGjBusC5p3WfUoDr2Ct0YoQ1kY=;
 b=2rzSNHFav0xYBNFe3YIQdhFr4DsibwIGh+MULxXvsqqhoB5Vm+D6BN6+Rev9TT5gTo
 6p2gWbLJZ6BwR+k659mx2VLNJh2H7tZkBxWC6Kmf0A9VW++hQoO7Www633EWZKggq2Vl
 Matcg1KUAnHPxpA+rAuVeZ0kVxncsvIMl2u3UjV7zBtyDyA8Qt2kfGmYRPkZD40m+0GP
 oC2Sv/4h14nMF5dFysFFHhIqsF8bqKgioAA7RrwzTQnjCzQjXUNQlcAldUgpaH+e1Alr
 rdlVmpnicWe0S3XkA33bYN95VRy28JXLjGw+yCNiA6E302+5zE3oLvLhoHDWMco3ei+z
 oDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hQY+m9fuC7vMypurkGGjBusC5p3WfUoDr2Ct0YoQ1kY=;
 b=jCJZ0047Z885IEM3840N/OiejvH9pLfSPYbdmdhxnRL2W1yoM/xOquaD6CdhYFHvAJ
 gxdjXYd9GWVw1ZHJ9e5POfdCxSLSMrmCki2y1+ReJlswZNkf8gFDG1vlzdp698zXeRYt
 ZC/LNWpmFW5ru65bx8P14dgo4n0mpqaEdYGygmUTtyNW/WWI/Bx11MYx/XyobJxEK3eo
 BXch2KA4zQ1h0xtmeMvcU4JIi8nn6vb9SKOdyYXnkveUwmkpdDqm61HnGeO6HC9cEm/P
 1UA0hOhRuxnZVL+PkUN3o7FAln/QkSCqMWYKdCkVqGkM3xZxoT0fe8Irsow1NPzEBIDD
 eLnw==
X-Gm-Message-State: AOAM532SSRJKTUbvwB5Rz8qxPTzBNVe0m1yzbgqRmDkmVo8iaCGFpRuz
 OQ0aGUNgioHA7WjBphznff0y3Q==
X-Google-Smtp-Source: ABdhPJxO/r0p4AkhAY6Dnwmf94XMZPVhkTTWZUIYzthCzkaYr44pXsmxStFxevTYc/Vn2PVHDNPgEQ==
X-Received: by 2002:a17:90b:4b4c:: with SMTP id
 mi12mr23072144pjb.85.1642426212866; 
 Mon, 17 Jan 2022 05:30:12 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:30:11 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v7 14/23] target/riscv: Implement AIA xiselect and xireg CSRs
Date: Mon, 17 Jan 2022 18:58:17 +0530
Message-Id: <20220117132826.426418-15-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117132826.426418-1-anup@brainfault.org>
References: <20220117132826.426418-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::633;
 envelope-from=anup@brainfault.org; helo=mail-pl1-x633.google.com
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
X-List-Received-Date: Mon, 17 Jan 2022 13:30:24 -0000

From: Anup Patel <anup.patel@wdc.com>

The AIA specification defines [m|s|vs]iselect and [m|s|vs]ireg CSRs
which allow indirect access to interrupt priority arrays and per-HART
IMSIC registers. This patch implements AIA xiselect and xireg CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h     |   7 ++
 target/riscv/csr.c     | 175 +++++++++++++++++++++++++++++++++++++++++
 target/riscv/machine.c |   3 +
 3 files changed, 185 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d09abc3654..7b4cf19350 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -194,6 +194,10 @@ struct CPURISCVState {
     uint8_t miprio[64];
     uint8_t siprio[64];
 
+    /* AIA CSRs */
+    target_ulong miselect;
+    target_ulong siselect;
+
     /* Hypervisor CSRs */
     target_ulong hstatus;
     target_ulong hedeleg;
@@ -227,6 +231,9 @@ struct CPURISCVState {
     target_ulong vstval;
     target_ulong vsatp;
 
+    /* AIA VS-mode CSRs */
+    target_ulong vsiselect;
+
     target_ulong mtval2;
     target_ulong mtinst;
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e92a1915a8..7a787d3a3f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -912,6 +912,169 @@ static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
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
@@ -2686,6 +2849,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
+    /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
+    [CSR_MISELECT] = { "miselect", aia_any,   NULL, NULL,    rmw_xiselect },
+    [CSR_MIREG]    = { "mireg",    aia_any,   NULL, NULL,    rmw_xireg },
+
     /* Machine-Level Interrupts (AIA) */
     [CSR_MTOPI]    = { "mtopi",    aia_any,   read_mtopi },
 
@@ -2718,6 +2885,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
 
+    /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
+    [CSR_SISELECT]   = { "siselect",   aia_smode, NULL, NULL, rmw_xiselect },
+    [CSR_SIREG]      = { "sireg",      aia_smode, NULL, NULL, rmw_xireg },
+
     /* Supervisor-Level Interrupts (AIA) */
     [CSR_STOPI]      = { "stopi",      aia_smode, read_stopi },
 
@@ -2759,6 +2930,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
     [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
 
+    /* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
+    [CSR_VSISELECT]   = { "vsiselect",   aia_hmode, NULL, NULL,      rmw_xiselect },
+    [CSR_VSIREG]      = { "vsireg",      aia_hmode, NULL, NULL,      rmw_xireg },
+
     /* VS-Level Interrupts (H-extension with AIA) */
     [CSR_VSTOPI]      = { "vstopi",      aia_hmode, read_vstopi },
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index be6af2bbf1..b8269272d2 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -103,6 +103,7 @@ static const VMStateDescription vmstate_hyper = {
         VMSTATE_UINTTL(env.vscause, RISCVCPU),
         VMSTATE_UINTTL(env.vstval, RISCVCPU),
         VMSTATE_UINTTL(env.vsatp, RISCVCPU),
+        VMSTATE_UINTTL(env.vsiselect, RISCVCPU),
 
         VMSTATE_UINTTL(env.mtval2, RISCVCPU),
         VMSTATE_UINTTL(env.mtinst, RISCVCPU),
@@ -231,6 +232,8 @@ const VMStateDescription vmstate_riscv_cpu = {
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


