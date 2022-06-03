Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nx9nH-0001CU-F0
	for mharc-qemu-riscv@gnu.org; Fri, 03 Jun 2022 12:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nx9nA-00018l-La
 for qemu-riscv@nongnu.org; Fri, 03 Jun 2022 12:04:52 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:46709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nx9n8-0008JM-43
 for qemu-riscv@nongnu.org; Fri, 03 Jun 2022 12:04:52 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 v5-20020a17090a7c0500b001df84fa82f8so7461156pjf.5
 for <qemu-riscv@nongnu.org>; Fri, 03 Jun 2022 09:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QJTej2h3MQf01hCD0FiQXxOPaz0l2FQeFvbdubSGzpM=;
 b=glLL8PmnBJWL5cdU8iaEgUZ0lATx0yAvIiwCLTXXa14YlitBedgjpa2Urixa/KpBHo
 NrdZOVZtd0Bzevw5eR//F+/EufynUgh3C2RWREPlV5SQNHjr0bGmglimLieeLId0jAeP
 p9YyUZzl+5738DKjyenVGCmczjfNB+JdEYhCXuRMj40C6rntp4r6O5urYb/MsU547lzb
 vdBwzYxI0RWqRZL6rC11InhRAFuGd5VACNiWQg+4TAY9tGPJKd58+ZeH+vlep5sBoiWt
 Sk3J+X1G+my0CYq97VGJyLB5VQBuI0SNkqMwAO32YXq3bc812w2BP713I2C6KXTtt/bB
 H4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QJTej2h3MQf01hCD0FiQXxOPaz0l2FQeFvbdubSGzpM=;
 b=NQ1yZwqozQj/kKjny3zpgqZF9obTpiY8gFwnostqeek2yohYsRXO3d911zhFIRsyag
 +iMUBnIUK13C8o2+aq59Z7/LAJZXoAnnt69cAA1/5o3KexUWgM3YSfMcErUqz4aNYhow
 DRSkewCwRJwtZ27IL7WNYVvBbzwPrNbT1JtW6OqdGsPfC7CRzz1k+qidAeS5AcBdQqo8
 ys+A9SLf4662J7rSnl3RB9JiDNcoWCkiWoEBWCaKuPfvjJl+Swo5mSl5472pbmgTb/k0
 RDoLzLnZ9j0CmEUNPrEWUI2puH4POCNR/i9HgiTZ1+hw9EqVBh+6GMo60vsI3LzANx+v
 yzUw==
X-Gm-Message-State: AOAM531/glGpZYQB69Q8+uSBILPLRXEd3kJQMEUa99+nB4GpSumTaOOx
 z2RDGHsTM69AyP8RzsOJ9X8dVI/fJeoUcw==
X-Google-Smtp-Source: ABdhPJxBxNTlCFXe2bWiPgIhAfHwD1eo6Z7FBD6YzpYQ39qaJSRialyhTsyKBXBQXHiEFpt+SkhLJg==
X-Received: by 2002:a17:902:e881:b0:161:bfc2:c52 with SMTP id
 w1-20020a170902e88100b00161bfc20c52mr10631807plg.75.1654272288845; 
 Fri, 03 Jun 2022 09:04:48 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([122.169.0.22])
 by smtp.googlemail.com with ESMTPSA id
 z12-20020a1709027e8c00b0016196bd15f4sm5638035pla.15.2022.06.03.09.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 09:04:48 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [RFC PATCH v5 4/4] target/riscv: smstateen check for AIA/IMSIC
Date: Fri,  3 Jun 2022 21:34:25 +0530
Message-Id: <20220603160425.3667456-5-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220603160425.3667456-1-mchitale@ventanamicro.com>
References: <20220603160425.3667456-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 03 Jun 2022 16:04:53 -0000

If smstateen is implemented then accesses to AIA
registers CSRS, IMSIC CSRs and other IMSIC registers
is controlled by setting of corresponding bits in
mstateen/hstateen registers. Otherwise an illegal
instruction trap or virtual instruction trap is
generated.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/csr.c | 253 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 248 insertions(+), 5 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 8bbbed38ff..213b3c17ff 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -39,6 +39,7 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 }
 
 /* Predicates */
+#if !defined(CONFIG_USER_ONLY)
 static RISCVException smstateen_acc_ok(CPURISCVState *env, int mode, int bit)
 {
     CPUState *cs = env_cpu(env);
@@ -49,7 +50,6 @@ static RISCVException smstateen_acc_ok(CPURISCVState *env, int mode, int bit)
         return RISCV_EXCP_NONE;
     }
 
-#if !defined(CONFIG_USER_ONLY)
     if (!(env->mstateen[0] & 1UL << bit)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
@@ -65,11 +65,57 @@ static RISCVException smstateen_acc_ok(CPURISCVState *env, int mode, int bit)
             return RISCV_EXCP_ILLEGAL_INST;
         }
     }
-#endif
-
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
+#endif
+
 static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -1130,6 +1176,13 @@ static int rmw_xiselect(CPURISCVState *env, int csrno, target_ulong *val,
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
@@ -1212,7 +1265,9 @@ static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
     bool virt;
     uint8_t *iprio;
     int ret = -EINVAL;
-    target_ulong priv, isel, vgein;
+    target_ulong priv, isel, vgein = 0;
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
 
     /* Translate CSR number for VS-mode */
     csrno = aia_xlate_vs_csrno(env, csrno);
@@ -1241,11 +1296,20 @@ static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
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
@@ -1279,6 +1343,13 @@ static int rmw_xsetclreinum(CPURISCVState *env, int csrno, target_ulong *val,
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
@@ -1397,6 +1468,13 @@ static int rmw_xtopei(CPURISCVState *env, int csrno, target_ulong *val,
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
@@ -1708,6 +1786,12 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
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
@@ -1736,6 +1820,12 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
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
@@ -1761,6 +1851,12 @@ static RISCVException write_hstateen(CPURISCVState *env, int csrno,
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
@@ -1789,6 +1885,12 @@ static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
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
@@ -1979,6 +2081,12 @@ static RISCVException rmw_vsieh(CPURISCVState *env, int csrno,
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
@@ -2033,6 +2141,12 @@ static RISCVException rmw_sieh(CPURISCVState *env, int csrno,
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
@@ -2195,6 +2309,12 @@ static RISCVException rmw_vsiph(CPURISCVState *env, int csrno,
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
@@ -2249,6 +2369,12 @@ static RISCVException rmw_siph(CPURISCVState *env, int csrno,
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
@@ -2441,6 +2567,10 @@ static RISCVException read_hstatus(CPURISCVState *env, int csrno,
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
@@ -2501,6 +2631,12 @@ static RISCVException rmw_hidelegh(CPURISCVState *env, int csrno,
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
@@ -2547,6 +2683,12 @@ static RISCVException rmw_hviph(CPURISCVState *env, int csrno,
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
@@ -2601,6 +2743,13 @@ static RISCVException write_hcounteren(CPURISCVState *env, int csrno,
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
@@ -2610,6 +2759,13 @@ static RISCVException read_hgeie(CPURISCVState *env, int csrno,
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
@@ -2649,6 +2805,13 @@ static RISCVException write_htinst(CPURISCVState *env, int csrno,
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
@@ -2719,12 +2882,28 @@ static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
 
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
@@ -2783,41 +2962,105 @@ static int write_hvipriox(CPURISCVState *env, int first_index,
 
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
2.25.1


