Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9S6O-0001kA-K6
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 08:31:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5T-0001Mg-ME
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:30:20 -0500
Received: from [2607:f8b0:4864:20::536] (port=45858
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5A-0000iB-PV
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:30:14 -0500
Received: by mail-pg1-x536.google.com with SMTP id c5so10883372pgk.12
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 05:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pJywUDyiV0TiiPTTsFZ1k+iKTYkcWX2yjf8//u9zbLg=;
 b=hj1dxqgYFu4tCg9KTu/sZHzqUnXtvxJLF0PXusiXC4k0hZlX5FvdJcSxbn8y1mDYZF
 mzRYOI3A2OknhnDxs7MWDVBFEMsFxsdlyM5HgdQ0EYOfv5nfadXtNyy8O8fdNtvudJVH
 3PevP0iR9zMT35iPnc26Tv5caeZYblrclKyhYFfkAMEYeQBUJn7pJw4QHWHsS4PpwQEd
 m8tdUj2SToQWszdwbtW42DVubKa+AEXeMd2v848oTsBv+lOiSoIj1P8qCTJB115dgYUm
 Pr9cOwgRCbFSuiLXBdL8xdyDpJ7dhkDC3AqfwQIYQKgQMOsCmgwVT2Wg1E86n/VE4jV4
 1pyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pJywUDyiV0TiiPTTsFZ1k+iKTYkcWX2yjf8//u9zbLg=;
 b=ZG4NdtIxeu/5Da65eLCQpNJfxYW3wdsPisZ6y7VPR85VEdyriJ/mcHksOJOGDLqPzE
 Uefv9sYLxEEc/MONivXVNu2NMNziVZ4oBWW8bSmSlNb0otI3HnFlvsSl0Jhtb97c4qG6
 IclVHaVqOUVAv1QIB9NoDsHu0uGblyuv3NGM7CeT/+9PVxM1QGG94/yWE5fZwo1hSOzJ
 HJ12y0P0vO09NKsLDUwalMmisXIkmuNQr8pR5v8FaKYkVY0njRcIB6iV/3QNdTEU6f8k
 cbzQ9Hq6ubZwavmSJFKVHyUz9WBAdwJzaeonnUMS4VYuY/ybi0B+w+3Vs8n4QOqVjQtr
 wk8w==
X-Gm-Message-State: AOAM530ISCOraoD7vvCvitLOc7kF5qVp0ZnSNiIPOHhcOS/FbPIzjF+Y
 a9sBpfCraq6RiR5S7+QFtLVoRQ==
X-Google-Smtp-Source: ABdhPJykwld0eMorPLZ124XXhdIU9ffGmrn9qABD43j9Ii7lJRqntUtorsQXqZPti1vVW+N36SMCMg==
X-Received: by 2002:a63:920f:: with SMTP id o15mr19241111pgd.510.1642426199547; 
 Mon, 17 Jan 2022 05:29:59 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:29:58 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v7 11/23] target/riscv: Implement AIA hvictl and hviprioX CSRs
Date: Mon, 17 Jan 2022 18:58:14 +0530
Message-Id: <20220117132826.426418-12-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117132826.426418-1-anup@brainfault.org>
References: <20220117132826.426418-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::536;
 envelope-from=anup@brainfault.org; helo=mail-pg1-x536.google.com
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

The AIA hvictl and hviprioX CSRs allow hypervisor to control
interrupts visible at VS-level. This patch implements AIA hvictl
and hviprioX CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h     |   2 +
 target/riscv/csr.c     | 126 +++++++++++++++++++++++++++++++++++++++++
 target/riscv/machine.c |   2 +
 3 files changed, 130 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a141686b58..d09abc3654 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -207,6 +207,7 @@ struct CPURISCVState {
     uint64_t htimedelta;
 
     /* Hypervisor controlled virtual interrupt priorities */
+    target_ulong hvictl;
     uint8_t hviprio[64];
 
     /* Upper 64-bits of 128-bit CSRs */
@@ -488,6 +489,7 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
     return env->misa_mxl;
 }
 #endif
+#define riscv_cpu_mxl_bits(env) (1UL << (4 + riscv_cpu_mxl(env)))
 
 /*
  * Encode LMUL to lmul as follows:
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index cab02a48e5..f0d8cb097b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -230,6 +230,15 @@ static RISCVException pointer_masking(CPURISCVState *env, int csrno)
     return RISCV_EXCP_ILLEGAL_INST;
 }
 
+static int aia_hmode(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+     }
+
+     return hmode(env, csrno);
+}
+
 static int aia_hmode32(CPURISCVState *env, int csrno)
 {
     if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
@@ -1112,6 +1121,9 @@ static RISCVException rmw_sie64(CPURISCVState *env, int csrno,
     uint64_t mask = env->mideleg & S_MODE_INTERRUPTS;
 
     if (riscv_cpu_virt_enabled(env)) {
+        if (env->hvictl & HVICTL_VTI) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
         ret = rmw_vsie64(env, CSR_VSIE, ret_val, new_val, wr_mask);
     } else {
         ret = rmw_mie64(env, csrno, ret_val, new_val, wr_mask & mask);
@@ -1325,6 +1337,9 @@ static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
     uint64_t mask = env->mideleg & sip_writable_mask;
 
     if (riscv_cpu_virt_enabled(env)) {
+        if (env->hvictl & HVICTL_VTI) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
         ret = rmw_vsip64(env, CSR_VSIP, ret_val, new_val, wr_mask);
     } else {
         ret = rmw_mip64(env, csrno, ret_val, new_val, wr_mask & mask);
@@ -1711,6 +1726,110 @@ static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static int read_hvictl(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->hvictl;
+    return RISCV_EXCP_NONE;
+}
+
+static int write_hvictl(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->hvictl = val & HVICTL_VALID_MASK;
+    return RISCV_EXCP_NONE;
+}
+
+static int read_hvipriox(CPURISCVState *env, int first_index,
+                         uint8_t *iprio, target_ulong *val)
+{
+    int i, irq, rdzero, num_irqs = 4 * (riscv_cpu_mxl_bits(env) / 32);
+
+    /* First index has to be a multiple of number of irqs per register */
+    if (first_index % num_irqs) {
+        return (riscv_cpu_virt_enabled(env)) ?
+               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    /* Fill-up return value */
+    *val = 0;
+    for (i = 0; i < num_irqs; i++) {
+        if (riscv_cpu_hviprio_index2irq(first_index + i, &irq, &rdzero)) {
+            continue;
+        }
+        if (rdzero) {
+            continue;
+        }
+        *val |= ((target_ulong)iprio[irq]) << (i * 8);
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static int write_hvipriox(CPURISCVState *env, int first_index,
+                          uint8_t *iprio, target_ulong val)
+{
+    int i, irq, rdzero, num_irqs = 4 * (riscv_cpu_mxl_bits(env) / 32);
+
+    /* First index has to be a multiple of number of irqs per register */
+    if (first_index % num_irqs) {
+        return (riscv_cpu_virt_enabled(env)) ?
+               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    /* Fill-up priority arrary */
+    for (i = 0; i < num_irqs; i++) {
+        if (riscv_cpu_hviprio_index2irq(first_index + i, &irq, &rdzero)) {
+            continue;
+        }
+        if (rdzero) {
+            iprio[irq] = 0;
+        } else {
+            iprio[irq] = (val >> (i * 8)) & 0xff;
+        }
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static int read_hviprio1(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    return read_hvipriox(env, 0, env->hviprio, val);
+}
+
+static int write_hviprio1(CPURISCVState *env, int csrno, target_ulong val)
+{
+    return write_hvipriox(env, 0, env->hviprio, val);
+}
+
+static int read_hviprio1h(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    return read_hvipriox(env, 4, env->hviprio, val);
+}
+
+static int write_hviprio1h(CPURISCVState *env, int csrno, target_ulong val)
+{
+    return write_hvipriox(env, 4, env->hviprio, val);
+}
+
+static int read_hviprio2(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    return read_hvipriox(env, 8, env->hviprio, val);
+}
+
+static int write_hviprio2(CPURISCVState *env, int csrno, target_ulong val)
+{
+    return write_hvipriox(env, 8, env->hviprio, val);
+}
+
+static int read_hviprio2h(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    return read_hvipriox(env, 12, env->hviprio, val);
+}
+
+static int write_hviprio2h(CPURISCVState *env, int csrno, target_ulong val)
+{
+    return write_hvipriox(env, 12, env->hviprio, val);
+}
+
 /* Virtual CSR Registers */
 static RISCVException read_vsstatus(CPURISCVState *env, int csrno,
                                     target_ulong *val)
@@ -2460,9 +2579,16 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,      write_mtval2      },
     [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
 
+    /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
+    [CSR_HVICTL]      = { "hvictl",      aia_hmode, read_hvictl, write_hvictl },
+    [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
+    [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
+
     /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
     [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
     [CSR_HVIPH]       = { "hviph",       aia_hmode32, NULL, NULL, rmw_hviph },
+    [CSR_HVIPRIO1H]   = { "hviprio1h",   aia_hmode32, read_hviprio1h, write_hviprio1h },
+    [CSR_HVIPRIO2H]   = { "hviprio2h",   aia_hmode32, read_hviprio2h, write_hviprio2h },
     [CSR_VSIEH]       = { "vsieh",       aia_hmode32, NULL, NULL, rmw_vsieh },
     [CSR_VSIPH]       = { "vsiph",       aia_hmode32, NULL, NULL, rmw_vsiph },
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 99f932be9c..be6af2bbf1 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -92,6 +92,8 @@ static const VMStateDescription vmstate_hyper = {
         VMSTATE_UINTTL(env.hgeie, RISCVCPU),
         VMSTATE_UINTTL(env.hgeip, RISCVCPU),
         VMSTATE_UINT64(env.htimedelta, RISCVCPU),
+
+        VMSTATE_UINTTL(env.hvictl, RISCVCPU),
         VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
 
         VMSTATE_UINT64(env.vsstatus, RISCVCPU),
-- 
2.25.1


