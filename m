Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nWywE-0005JW-0P
	for mharc-qemu-riscv@gnu.org; Wed, 23 Mar 2022 07:14:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nWyw0-0005CE-HO
 for qemu-riscv@nongnu.org; Wed, 23 Mar 2022 07:13:50 -0400
Received: from [2607:f8b0:4864:20::62c] (port=37695
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nWyvx-0007mq-1c
 for qemu-riscv@nongnu.org; Wed, 23 Mar 2022 07:13:48 -0400
Received: by mail-pl1-x62c.google.com with SMTP id e5so1193814pls.4
 for <qemu-riscv@nongnu.org>; Wed, 23 Mar 2022 04:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kv18HE4X/ytZ3EFkK1RN6LsKO/HJwj+GsN1n2H+zSX0=;
 b=A93G/0t+gtwlS6ElA2T4CTJNxGicVR3EvYM6VBzJp07otN4mzVaYEPse8YBYwUmhG+
 ptn59qCN3J/DleMDes3sRhaMyg7FLN+LIiEYD0sjIPHABtI5ZC5VH4f/Lcu9zcU2/6TX
 LwzD4UuJ9sRmwT1XVHuKxSAO0kr++XPLWJmGM/+7Kg/AT5ZCFBAtNFqm/lgV1Ac6xCE3
 dEhAp+ZWkVU0/BT3P1ub2g65+MO59sK1TIz/4cE/59Y7cVOXPBc5TPujvvLadOr54a0S
 MVVdEepuM+ET2zHFG854W3L210pumDn6wmvB48cGXz0oGGaY3oWeEqSUcCsCpDdmeOvv
 8C4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kv18HE4X/ytZ3EFkK1RN6LsKO/HJwj+GsN1n2H+zSX0=;
 b=WX4xNstMhF3TDlD7T6lhqvgZ1PhgAu5k9cgIYoKIdql6ieowdlrGrobyI1dE1NDb6a
 m0qWv04icfNr7Q9Tv0rVS8BmlKxk8k8bJ3sRmdpW37DwaJO2i1EmxmleopN4t/nqRLXJ
 1u9PfkC39RE9qCe0RxkPVvAnppfhVi1SYKL56a0E5xgNPfFjKd4s1EmGcDk70k3XW3N0
 N1rr4DtB4yLj2zxqbFAsYdh3309omZjacbkWgV8tlG1+5rDhhbVuIMR2HJvD4c44qx9a
 NPJEXy4MRdDnxnrHhPkJ5eVuIL2Lnv75fe++CFS6lobWdpjZ7Pbtg/mqhHsS3ZvkjKwh
 aPCQ==
X-Gm-Message-State: AOAM5337inR6WMDNeuvACx/s8EQlAYYw2Fk5dkUSyBVBvBW5Yb5g0MLV
 lqKMn4RRZ7AOBxGPgCF6YwocSA==
X-Google-Smtp-Source: ABdhPJw2eebFZRs8fvs6eRM++kfjoYlYC+F7iftUj0mki2WXexaIwYJCl1VYmcJakYzbpkARk2u74Q==
X-Received: by 2002:a17:902:c949:b0:154:5215:1db1 with SMTP id
 i9-20020a170902c94900b0015452151db1mr16005176pla.163.1648034014177; 
 Wed, 23 Mar 2022 04:13:34 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([171.50.204.174])
 by smtp.googlemail.com with ESMTPSA id
 f31-20020a631f1f000000b003742e45f7d7sm19798002pgf.32.2022.03.23.04.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 04:13:33 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [RFC PATCH v2 4/4] target/riscv: smstateen check for AIA/IMSIC
Date: Wed, 23 Mar 2022 16:43:09 +0530
Message-Id: <20220323111309.9109-5-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220323111309.9109-1-mchitale@ventanamicro.com>
References: <20220323111309.9109-1-mchitale@ventanamicro.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pl1-x62c.google.com
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
X-List-Received-Date: Wed, 23 Mar 2022 11:13:50 -0000

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
index 5959adc9b3..cfdda8dc2b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -68,6 +68,53 @@ static RISCVException smstateen_acc_ok(CPURISCVState *env, int mode, int bit)
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
@@ -1402,6 +1449,13 @@ static int rmw_xiselect(CPURISCVState *env, int csrno, target_ulong *val,
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
@@ -1484,7 +1538,9 @@ static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
     bool virt;
     uint8_t *iprio;
     int ret = -EINVAL;
-    target_ulong priv, isel, vgein;
+    target_ulong priv, isel, vgein = 0;
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
 
     /* Translate CSR number for VS-mode */
     csrno = aia_xlate_vs_csrno(env, csrno);
@@ -1513,11 +1569,20 @@ static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
     };
 
     /* Find the selected guest interrupt file */
-    vgein = (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
+    if (virt) {
+        if (!cpu->cfg.ext_smstateen ||
+                (env->hstateen[0] & 1UL << SMSTATEEN0_IMSIC)) {
+            vgein = get_field(env->hstatus, HSTATUS_VGEIN);
+        }
+    }
 
     if (ISELECT_IPRIO0 <= isel && isel <= ISELECT_IPRIO15) {
         /* Local interrupt priority registers not available for VS-mode */
         if (!virt) {
+            if (priv == PRV_S && cpu->cfg.ext_smstateen &&
+                !(env->hstateen[0] & 1UL << SMSTATEEN0_AIA)) {
+                goto done;
+            }
             ret = rmw_iprio(riscv_cpu_mxl_bits(env),
                             isel, iprio, val, new_val, wr_mask,
                             (priv == PRV_M) ? IRQ_M_EXT : IRQ_S_EXT);
@@ -1551,6 +1616,13 @@ static int rmw_xsetclreinum(CPURISCVState *env, int csrno, target_ulong *val,
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
@@ -1669,6 +1741,13 @@ static int rmw_xtopei(CPURISCVState *env, int csrno, target_ulong *val,
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
@@ -2014,6 +2093,12 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
         wr_mask |= 1UL << SMSTATEEN0_FCSR;
     }
 
+    if (riscv_feature(env, RISCV_FEATURE_AIA)) {
+        wr_mask |= (1UL << SMSTATEEN0_IMSIC)
+                | (1UL << SMSTATEEN0_AIA)
+                | (1UL << SMSTATEEN0_SVSLCT);
+    }
+
     write_smstateen(env, reg, wr_mask, new_val);
 
     return RISCV_EXCP_NONE;
@@ -2042,6 +2127,12 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
         wr_mask |= 1UL << SMSTATEEN0_FCSR;
     }
 
+    if (riscv_feature(env, RISCV_FEATURE_AIA)) {
+        wr_mask |= (1UL << SMSTATEEN0_IMSIC)
+                | (1UL << SMSTATEEN0_AIA)
+                | (1UL << SMSTATEEN0_SVSLCT);
+    }
+
     write_smstateen(env, reg, wr_mask, val);
 
     return RISCV_EXCP_NONE;
@@ -2067,6 +2158,12 @@ static RISCVException write_hstateen(CPURISCVState *env, int csrno,
         wr_mask |= 1UL << SMSTATEEN0_FCSR;
     }
 
+    if (riscv_feature(env, RISCV_FEATURE_AIA)) {
+        wr_mask |= (1UL << SMSTATEEN0_IMSIC)
+                | (1UL << SMSTATEEN0_AIA)
+                | (1UL << SMSTATEEN0_SVSLCT);
+    }
+
     reg = &env->hstateen[index];
     wr_mask &= env->mstateen[index];
     write_smstateen(env, reg, wr_mask, new_val);
@@ -2095,6 +2192,12 @@ static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
         wr_mask |= 1UL << SMSTATEEN0_FCSR;
     }
 
+    if (riscv_feature(env, RISCV_FEATURE_AIA)) {
+        wr_mask |= (1UL << SMSTATEEN0_IMSIC)
+                | (1UL << SMSTATEEN0_AIA)
+                | (1UL << SMSTATEEN0_SVSLCT);
+    }
+
     reg = &env->hstateen[index];
     val = (uint64_t)new_val << 32;
     val |= *reg & 0xFFFFFFFF;
@@ -2288,6 +2391,12 @@ static RISCVException rmw_vsieh(CPURISCVState *env, int csrno,
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
@@ -2342,6 +2451,12 @@ static RISCVException rmw_sieh(CPURISCVState *env, int csrno,
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
@@ -2504,6 +2619,12 @@ static RISCVException rmw_vsiph(CPURISCVState *env, int csrno,
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
@@ -2558,6 +2679,12 @@ static RISCVException rmw_siph(CPURISCVState *env, int csrno,
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
@@ -2748,6 +2875,10 @@ static RISCVException read_hstatus(CPURISCVState *env, int csrno,
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
@@ -2808,6 +2939,12 @@ static RISCVException rmw_hidelegh(CPURISCVState *env, int csrno,
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
@@ -2854,6 +2991,12 @@ static RISCVException rmw_hviph(CPURISCVState *env, int csrno,
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
@@ -2908,6 +3051,13 @@ static RISCVException write_hcounteren(CPURISCVState *env, int csrno,
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
@@ -2917,6 +3067,13 @@ static RISCVException read_hgeie(CPURISCVState *env, int csrno,
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
@@ -2956,6 +3113,13 @@ static RISCVException write_htinst(CPURISCVState *env, int csrno,
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
@@ -3026,12 +3190,28 @@ static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
 
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
@@ -3090,41 +3270,105 @@ static int write_hvipriox(CPURISCVState *env, int first_index,
 
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


