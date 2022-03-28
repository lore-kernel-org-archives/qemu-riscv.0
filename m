Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nYt5o-0000BS-PI
	for mharc-qemu-riscv@gnu.org; Mon, 28 Mar 2022 13:23:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nYt5k-00005c-T2
 for qemu-riscv@nongnu.org; Mon, 28 Mar 2022 13:23:45 -0400
Received: from [2607:f8b0:4864:20::52f] (port=44971
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nYt5i-00034U-CT
 for qemu-riscv@nongnu.org; Mon, 28 Mar 2022 13:23:44 -0400
Received: by mail-pg1-x52f.google.com with SMTP id c11so12719561pgu.11
 for <qemu-riscv@nongnu.org>; Mon, 28 Mar 2022 10:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=N4PhcLUgMjhVVcJ/lTuiA/1ywNDkD0qbVjch5k3Oq28=;
 b=Ofw0X8uQhdgCRAha0Nfn0f7F56tZFQ7wRnBtjigQMDaaHiNJ3mMWG/+Dx/9bba6p7m
 FNlfD+iUXU8AYui+J7fBlTPvEChUMrGQFcjYQf94DbtTMn14yMTsWpnnisahVxsM/9SM
 PpQG+uLEHOCdXO8IoVa1IeNiW/ct5jtRPBSdbHlXQNGjDEJgWGydCVVbx0LugQ4tmiWb
 +VCo/zd/J8w45COiE00hEycYu9D95K6XMfgNXFzyfCEj9jgGO2OJRWAdaoI1kYbB4F3E
 k2Sg3uJtHwBtyeKZoZmH/sSY9HBmBVeBWstEg9a85YpkhLItEU30Nwu5XHcLOBhQeA8w
 PijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=N4PhcLUgMjhVVcJ/lTuiA/1ywNDkD0qbVjch5k3Oq28=;
 b=Sosn7HUPlnBfsRdE7igNiIHAUdpXaSRWXXYs9ee0PQFnZgsCE//1eUVB5+65ieJy1E
 DPMa2IhIJ7LhDdg65t0o54g6gPGZH+YlB+fsHPhk51nX0naIIDuE6wP2kxiYcy4NasXG
 r8aVkdzxveCXU9T+esrNU6PTdqv1+zI7dBliIFqn5jMYYO0cOL50/+R4OqVdmuEWoC5m
 Aex6PLU946xsrp0I//xmtFv8hc0YuiA5gtmdy8qY85M0qIyGPSYbmLESrltlyLDyLjUH
 u8jxlVpFMwQnf4fEu+7GCNKsr1Xw9JKKNhYyM51e9mr7rrKK+c/7PsGfO1kZb2tSKVW8
 hDbg==
X-Gm-Message-State: AOAM530eKLhNPMxQJlRQbfAO7vP54Xw1Alvwm4kx3CiIPdGqz8XImEQm
 X5wox/ApILuvUwggbNhRQJJEuw==
X-Google-Smtp-Source: ABdhPJwZbYMqWzOaSbd4pba0nM5oyML5vO8O/+zD8JfdPevaZRqNhfqKWZyH74Clu736AHZkGJ0JXQ==
X-Received: by 2002:a63:7502:0:b0:37f:f089:7d56 with SMTP id
 q2-20020a637502000000b0037ff0897d56mr10851291pgc.531.1648488221022; 
 Mon, 28 Mar 2022 10:23:41 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([171.50.204.174])
 by smtp.googlemail.com with ESMTPSA id
 132-20020a62168a000000b004f40e8b3133sm17802504pfw.188.2022.03.28.10.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 10:23:40 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [RFC PATCH v3 4/4] target/riscv: smstateen check for AIA/IMSIC
Date: Mon, 28 Mar 2022 22:53:19 +0530
Message-Id: <20220328172319.6802-5-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220328172319.6802-1-mchitale@ventanamicro.com>
References: <20220328172319.6802-1-mchitale@ventanamicro.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 28 Mar 2022 17:23:45 -0000

If smstateen is implemented then accesses to AIA
registers CSRS, IMSIC CSRs and other IMSIC registers
is controlled by setting of corresponding bits in
mstateen/hstateen registers. Otherwise an illegal
instruction trap or virtual instruction trap is
generated.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/csr.c | 248 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 246 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 658f51bd40..93866fd773 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -66,6 +66,53 @@ static RISCVException smstateen_acc_ok(CPURISCVState *env, int mode, int bit)
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException smstateen_aia_acc_ok(CPURISCVState *env, int csrno)
+{
+    int bit, mode;
+
+    switch (csrno) {
+    case CSR_SSETEIPNUM:
+    case CSR_SCLREIPNUM:
+    case CSR_SSETEIENUM:
+    case CSR_SCLREIENUM:
+    case CSR_STOPEI:
+    case CSR_VSSETEIPNUM:
+    case CSR_VSCLREIPNUM:
+    case CSR_VSSETEIENUM:
+    case CSR_VSCLREIENUM:
+    case CSR_VSTOPEI:
+    case CSR_HSTATUS:
+        mode = PRV_S;
+        bit = SMSTATEEN0_IMSIC;
+        break;
+
+    case CSR_SIEH:
+    case CSR_SIPH:
+    case CSR_HVIPH:
+    case CSR_HVICTL:
+    case CSR_HVIPRIO1:
+    case CSR_HVIPRIO2:
+    case CSR_HVIPRIO1H:
+    case CSR_HVIPRIO2H:
+    case CSR_VSIEH:
+    case CSR_VSIPH:
+        mode = PRV_S;
+        bit = SMSTATEEN0_AIA;
+        break;
+
+    case CSR_SISELECT:
+    case CSR_VSISELECT:
+        mode = PRV_S;
+        bit = SMSTATEEN0_SVSLCT;
+        break;
+
+    default:
+        return RISCV_EXCP_NONE;
+    }
+
+    return smstateen_acc_ok(env, mode, bit);
+}
+
 static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -1047,6 +1094,13 @@ static int rmw_xiselect(CPURISCVState *env, int csrno, target_ulong *val,
                         target_ulong new_val, target_ulong wr_mask)
 {
     target_ulong *iselect;
+    RISCVException ret;
+
+    /* Check if smstateen is enabled and this access is allowed */
+    ret = smstateen_aia_acc_ok(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
     /* Translate CSR number for VS-mode */
     csrno = aia_xlate_vs_csrno(env, csrno);
@@ -1129,7 +1183,9 @@ static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
     bool virt;
     uint8_t *iprio;
     int ret = -EINVAL;
-    target_ulong priv, isel, vgein;
+    target_ulong priv, isel, vgein = 0;
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
 
     /* Translate CSR number for VS-mode */
     csrno = aia_xlate_vs_csrno(env, csrno);
@@ -1158,11 +1214,20 @@ static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
     };
 
     /* Find the selected guest interrupt file */
-    vgein = (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
+    if (virt) {
+        if (!cpu->cfg.ext_smstateen ||
+                (env->hstateen[0] & (1UL << SMSTATEEN0_IMSIC))) {
+            vgein = get_field(env->hstatus, HSTATUS_VGEIN);
+        }
+    }
 
     if (ISELECT_IPRIO0 <= isel && isel <= ISELECT_IPRIO15) {
         /* Local interrupt priority registers not available for VS-mode */
         if (!virt) {
+            if (priv == PRV_S && cpu->cfg.ext_smstateen &&
+                !(env->hstateen[0] & (1UL << SMSTATEEN0_AIA))) {
+                goto done;
+            }
             ret = rmw_iprio(riscv_cpu_mxl_bits(env),
                             isel, iprio, val, new_val, wr_mask,
                             (priv == PRV_M) ? IRQ_M_EXT : IRQ_S_EXT);
@@ -1196,6 +1261,13 @@ static int rmw_xsetclreinum(CPURISCVState *env, int csrno, target_ulong *val,
     int ret = -EINVAL;
     bool set, pend, virt;
     target_ulong priv, isel, vgein, xlen, nval, wmask;
+    RISCVException excp;
+
+    /* Check if smstateen is enabled and this access is allowed */
+    excp = smstateen_aia_acc_ok(env, csrno);
+    if (excp != RISCV_EXCP_NONE) {
+        return excp;
+    }
 
     /* Translate CSR number for VS-mode */
     csrno = aia_xlate_vs_csrno(env, csrno);
@@ -1314,6 +1386,13 @@ static int rmw_xtopei(CPURISCVState *env, int csrno, target_ulong *val,
     bool virt;
     int ret = -EINVAL;
     target_ulong priv, vgein;
+    RISCVException excp;
+
+    /* Check if smstateen is enabled and this access is allowed */
+    excp = smstateen_aia_acc_ok(env, csrno);
+    if (excp != RISCV_EXCP_NONE) {
+        return excp;
+    }
 
     /* Translate CSR number for VS-mode */
     csrno = aia_xlate_vs_csrno(env, csrno);
@@ -1625,6 +1704,12 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
         wr_mask |= 1UL << SMSTATEEN0_FCSR;
     }
 
+    if (riscv_feature(env, RISCV_FEATURE_AIA)) {
+        wr_mask |= (1UL << SMSTATEEN0_IMSIC) |
+                   (1UL << SMSTATEEN0_AIA) |
+                   (1UL << SMSTATEEN0_SVSLCT);
+    }
+
     write_smstateen(env, reg, wr_mask, new_val);
 
     return RISCV_EXCP_NONE;
@@ -1653,6 +1738,12 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
         wr_mask |= 1UL << SMSTATEEN0_FCSR;
     }
 
+    if (riscv_feature(env, RISCV_FEATURE_AIA)) {
+        wr_mask |= (1UL << SMSTATEEN0_IMSIC) |
+                   (1UL << SMSTATEEN0_AIA) |
+                   (1UL << SMSTATEEN0_SVSLCT);
+    }
+
     write_smstateen(env, reg, wr_mask, val);
 
     return RISCV_EXCP_NONE;
@@ -1678,6 +1769,12 @@ static RISCVException write_hstateen(CPURISCVState *env, int csrno,
         wr_mask |= 1UL << SMSTATEEN0_FCSR;
     }
 
+    if (riscv_feature(env, RISCV_FEATURE_AIA)) {
+        wr_mask |= (1UL << SMSTATEEN0_IMSIC) |
+                   (1UL << SMSTATEEN0_AIA) |
+                   (1UL << SMSTATEEN0_SVSLCT);
+    }
+
     reg = &env->hstateen[index];
     wr_mask &= env->mstateen[index];
     write_smstateen(env, reg, wr_mask, new_val);
@@ -1706,6 +1803,12 @@ static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
         wr_mask |= 1UL << SMSTATEEN0_FCSR;
     }
 
+    if (riscv_feature(env, RISCV_FEATURE_AIA)) {
+        wr_mask |= (1UL << SMSTATEEN0_IMSIC) |
+                   (1UL << SMSTATEEN0_AIA) |
+                   (1UL << SMSTATEEN0_SVSLCT);
+    }
+
     reg = &env->hstateen[index];
     val = (uint64_t)new_val << 32;
     val |= *reg & 0xFFFFFFFF;
@@ -1892,6 +1995,12 @@ static RISCVException rmw_vsieh(CPURISCVState *env, int csrno,
     uint64_t rval;
     RISCVException ret;
 
+    /* Check if smstateen is enabled and this access is allowed */
+    ret = smstateen_aia_acc_ok(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     ret = rmw_vsie64(env, csrno, &rval,
         ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
     if (ret_val) {
@@ -1946,6 +2055,12 @@ static RISCVException rmw_sieh(CPURISCVState *env, int csrno,
     uint64_t rval;
     RISCVException ret;
 
+    /* Check if smstateen is enabled and this access is allowed */
+    ret = smstateen_aia_acc_ok(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     ret = rmw_sie64(env, csrno, &rval,
         ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
     if (ret_val) {
@@ -2108,6 +2223,12 @@ static RISCVException rmw_vsiph(CPURISCVState *env, int csrno,
     uint64_t rval;
     RISCVException ret;
 
+    /* Check if smstateen is enabled and this access is allowed */
+    ret = smstateen_aia_acc_ok(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     ret = rmw_vsip64(env, csrno, &rval,
         ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
     if (ret_val) {
@@ -2162,6 +2283,12 @@ static RISCVException rmw_siph(CPURISCVState *env, int csrno,
     uint64_t rval;
     RISCVException ret;
 
+    /* Check if smstateen is enabled and this access is allowed */
+    ret = smstateen_aia_acc_ok(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     ret = rmw_sip64(env, csrno, &rval,
         ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
     if (ret_val) {
@@ -2352,6 +2479,10 @@ static RISCVException read_hstatus(CPURISCVState *env, int csrno,
 static RISCVException write_hstatus(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
+    if (smstateen_aia_acc_ok(env, csrno) != RISCV_EXCP_NONE) {
+        val &= ~HSTATUS_VGEIN;
+    }
+
     env->hstatus = val;
     if (riscv_cpu_mxl(env) != MXL_RV32 && get_field(val, HSTATUS_VSXL) != 2) {
         qemu_log_mask(LOG_UNIMP, "QEMU does not support mixed HSXLEN options.");
@@ -2412,6 +2543,12 @@ static RISCVException rmw_hidelegh(CPURISCVState *env, int csrno,
     uint64_t rval;
     RISCVException ret;
 
+    /* Check if smstateen is enabled and this access is allowed */
+    ret = smstateen_aia_acc_ok(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     ret = rmw_hideleg64(env, csrno, &rval,
         ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
     if (ret_val) {
@@ -2458,6 +2595,12 @@ static RISCVException rmw_hviph(CPURISCVState *env, int csrno,
     uint64_t rval;
     RISCVException ret;
 
+    /* Check if smstateen is enabled and this access is allowed */
+    ret = smstateen_aia_acc_ok(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     ret = rmw_hvip64(env, csrno, &rval,
         ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
     if (ret_val) {
@@ -2512,6 +2655,13 @@ static RISCVException write_hcounteren(CPURISCVState *env, int csrno,
 static RISCVException read_hgeie(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_IMSIC);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     if (val) {
         *val = env->hgeie;
     }
@@ -2521,6 +2671,13 @@ static RISCVException read_hgeie(CPURISCVState *env, int csrno,
 static RISCVException write_hgeie(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_IMSIC);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     /* Only GEILEN:1 bits implemented and BIT0 is never implemented */
     val &= ((((target_ulong)1) << env->geilen) - 1) << 1;
     env->hgeie = val;
@@ -2560,6 +2717,13 @@ static RISCVException write_htinst(CPURISCVState *env, int csrno,
 static RISCVException read_hgeip(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_IMSIC);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     if (val) {
         *val = env->hgeip;
     }
@@ -2630,12 +2794,28 @@ static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
 
 static int read_hvictl(CPURISCVState *env, int csrno, target_ulong *val)
 {
+    RISCVException ret;
+
+    /* Check if smstateen is enabled and this access is allowed */
+    ret = smstateen_aia_acc_ok(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->hvictl;
     return RISCV_EXCP_NONE;
 }
 
 static int write_hvictl(CPURISCVState *env, int csrno, target_ulong val)
 {
+    RISCVException ret = RISCV_EXCP_NONE;
+
+    /* Check if smstateen is enabled and this access is allowed */
+    ret = smstateen_aia_acc_ok(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     env->hvictl = val & HVICTL_VALID_MASK;
     return RISCV_EXCP_NONE;
 }
@@ -2694,41 +2874,105 @@ static int write_hvipriox(CPURISCVState *env, int first_index,
 
 static int read_hviprio1(CPURISCVState *env, int csrno, target_ulong *val)
 {
+    RISCVException ret;
+
+    /* Check if smstateen is enabled and this access is allowed */
+    ret = smstateen_aia_acc_ok(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     return read_hvipriox(env, 0, env->hviprio, val);
 }
 
 static int write_hviprio1(CPURISCVState *env, int csrno, target_ulong val)
 {
+    RISCVException ret;
+
+    /* Check if smstateen is enabled and this access is allowed */
+    ret = smstateen_aia_acc_ok(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     return write_hvipriox(env, 0, env->hviprio, val);
 }
 
 static int read_hviprio1h(CPURISCVState *env, int csrno, target_ulong *val)
 {
+    RISCVException ret;
+
+    /* Check if smstateen is enabled and this access is allowed */
+    ret = smstateen_aia_acc_ok(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     return read_hvipriox(env, 4, env->hviprio, val);
 }
 
 static int write_hviprio1h(CPURISCVState *env, int csrno, target_ulong val)
 {
+    RISCVException ret;
+
+    /* Check if smstateen is enabled and this access is allowed */
+    ret = smstateen_aia_acc_ok(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     return write_hvipriox(env, 4, env->hviprio, val);
 }
 
 static int read_hviprio2(CPURISCVState *env, int csrno, target_ulong *val)
 {
+    RISCVException ret;
+
+    /* Check if smstateen is enabled and this access is allowed */
+    ret = smstateen_aia_acc_ok(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     return read_hvipriox(env, 8, env->hviprio, val);
 }
 
 static int write_hviprio2(CPURISCVState *env, int csrno, target_ulong val)
 {
+    RISCVException ret;
+
+    /* Check if smstateen is enabled and this access is allowed */
+    ret = smstateen_aia_acc_ok(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     return write_hvipriox(env, 8, env->hviprio, val);
 }
 
 static int read_hviprio2h(CPURISCVState *env, int csrno, target_ulong *val)
 {
+    RISCVException ret;
+
+    /* Check if smstateen is enabled and this access is allowed */
+    ret = smstateen_aia_acc_ok(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     return read_hvipriox(env, 12, env->hviprio, val);
 }
 
 static int write_hviprio2h(CPURISCVState *env, int csrno, target_ulong val)
 {
+    RISCVException ret;
+
+    /* Check if smstateen is enabled and this access is allowed */
+    ret = smstateen_aia_acc_ok(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     return write_hvipriox(env, 12, env->hviprio, val);
 }
 
-- 
2.17.1


