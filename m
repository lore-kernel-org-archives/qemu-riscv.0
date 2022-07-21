Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEYAB-0008Ar-1U
	for mharc-qemu-riscv@gnu.org; Thu, 21 Jul 2022 11:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oEYA9-00084E-0B
 for qemu-riscv@nongnu.org; Thu, 21 Jul 2022 11:32:29 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:34532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oEY9u-0002eZ-37
 for qemu-riscv@nongnu.org; Thu, 21 Jul 2022 11:32:28 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 bk6-20020a17090b080600b001f2138a2a7bso4582080pjb.1
 for <qemu-riscv@nongnu.org>; Thu, 21 Jul 2022 08:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MAD1UILybRA7UODYcT172kOzQeddZVd2CVkPvfzwQgk=;
 b=mzyPFkc0nILxvLM/t0N6jDPxA0vOrE6aFIJgcWPMR+Qx3mupzIS7LFQ5ht713/Bkhy
 pHIzdzRMFZR4oB9oOKimq6tw9C3elMPeRvDqXOOY3VsyvUKtjqo0r/jgZCgOuMDZoTob
 B+NVS9YLEjYkFr4MnSHbJXP2cutpbcOfl3QBbiWCHwLXmaem8hG5Cyqp0vs11AUS9P8R
 LWBQ+MRZ8A2++K4isFT3/CVQuCzrHHd/Magip40xCPHSspfSUgqVUF+AiZYh4N5TvfI/
 dXX81YG0bNvp1TrdE0mNA2FhHs6ynrTjRnZV9b9Oz7onciGzPho5kDsXh551peHkTH4v
 6c6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MAD1UILybRA7UODYcT172kOzQeddZVd2CVkPvfzwQgk=;
 b=ntAET2SJlaRdZhGyNj1rySymzsUZHuACTKY49+utVYbqSI1rK8Jvq7FFG+rd9xC5as
 rbNSOV59IoEMpiktjD+xl33nYp7Eb74/Cbc1jACY8L5xi5N3iCvsGPk/l/W1L19S5qwu
 Sno7GFcraapf9xX2JTI4k3KvcflOt/yQx2BYStHQCkQsyYuVRtq34xMnEVcLoLL2TxEL
 puCVfY+f2oFe10fOb9sB3D3GfpUAk0yQUQFxWdco5g92JdZjYU7jy5ZxpT+VF10b+T+c
 DkPk1yRBIk6h1VgH1tgiemzY6Ee3AjIFig02HPEQMmJ5m4+o37SktaUmLheaqcZ2FVb8
 YHwA==
X-Gm-Message-State: AJIora8i+lDdlENEYVi2eTXYcjacKlD1V/9iO7sl2dHAETdaUIRrYxHY
 RtlltmjssiAAuOS+1JkQX5TqHA==
X-Google-Smtp-Source: AGRyM1umy4a27VCJS7JtFsB2FbVQ9PNpzlZZgQQ76mvtFsQpQo3fFaStu4gI4QFU8t+eu4AWTSiKdA==
X-Received: by 2002:a17:90b:1a81:b0:1f0:77a7:907f with SMTP id
 ng1-20020a17090b1a8100b001f077a7907fmr12212174pjb.49.1658417531766; 
 Thu, 21 Jul 2022 08:32:11 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([182.70.95.50])
 by smtp.googlemail.com with ESMTPSA id
 f4-20020a170902684400b0016bdf0032b9sm1814379pln.110.2022.07.21.08.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 08:32:11 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v6 4/5] target/riscv: smstateen check for AIA/IMSIC
Date: Thu, 21 Jul 2022 21:01:35 +0530
Message-Id: <20220721153136.377578-5-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220721153136.377578-1-mchitale@ventanamicro.com>
References: <20220721153136.377578-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 21 Jul 2022 15:32:29 -0000

If smstateen is implemented then accesses to AIA
registers CSRS, IMSIC CSRs and other IMSIC registers
is controlled by setting of corresponding bits in
mstateen/hstateen registers. Otherwise an illegal
instruction trap or virtual instruction trap is
generated.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/csr.c | 222 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 220 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a597b6cbc7..e40dd35d85 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -87,6 +87,42 @@ static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
 
     return RISCV_EXCP_NONE;
 }
+
+static RISCVException smstateen_aia_acc_ok(CPURISCVState *env, int csrno)
+{
+    uint64_t bit;
+
+    switch (csrno) {
+    case CSR_STOPEI:
+    case CSR_VSTOPEI:
+    case CSR_HSTATUS:
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
+        bit = SMSTATEEN0_AIA;
+        break;
+
+    case CSR_SISELECT:
+    case CSR_VSISELECT:
+        bit = SMSTATEEN0_SVSLCT;
+        break;
+
+    default:
+        return RISCV_EXCP_NONE;
+    }
+
+    return smstateen_acc_ok(env, 0, bit);
+}
 #endif
 
 static RISCVException fs(CPURISCVState *env, int csrno)
@@ -1383,6 +1419,13 @@ static int rmw_xiselect(CPURISCVState *env, int csrno, target_ulong *val,
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
@@ -1465,7 +1508,9 @@ static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
     bool virt;
     uint8_t *iprio;
     int ret = -EINVAL;
-    target_ulong priv, isel, vgein;
+    target_ulong priv, isel, vgein = 0;
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
 
     /* Translate CSR number for VS-mode */
     csrno = aia_xlate_vs_csrno(env, csrno);
@@ -1494,11 +1539,20 @@ static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
     };
 
     /* Find the selected guest interrupt file */
-    vgein = (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
+    if (virt) {
+        if (!cpu->cfg.ext_smstateen ||
+                (env->hstateen[0] & SMSTATEEN0_IMSIC)) {
+            vgein = get_field(env->hstatus, HSTATUS_VGEIN);
+        }
+    }
 
     if (ISELECT_IPRIO0 <= isel && isel <= ISELECT_IPRIO15) {
         /* Local interrupt priority registers not available for VS-mode */
         if (!virt) {
+            if (priv == PRV_S && cpu->cfg.ext_smstateen &&
+                !(env->hstateen[0] & SMSTATEEN0_AIA)) {
+                goto done;
+            }
             ret = rmw_iprio(riscv_cpu_mxl_bits(env),
                             isel, iprio, val, new_val, wr_mask,
                             (priv == PRV_M) ? IRQ_M_EXT : IRQ_S_EXT);
@@ -1532,6 +1586,13 @@ static int rmw_xtopei(CPURISCVState *env, int csrno, target_ulong *val,
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
@@ -1884,6 +1945,10 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
         wr_mask |= SMSTATEEN0_FCSR;
     }
 
+    if (riscv_feature(env, RISCV_FEATURE_AIA)) {
+        wr_mask |= (SMSTATEEN0_IMSIC | SMSTATEEN0_AIA | SMSTATEEN0_SVSLCT);
+    }
+
     return write_mstateen(env, csrno, wr_mask, new_val);
 }
 
@@ -1935,6 +2000,10 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
         wr_mask |= SMSTATEEN0_FCSR;
     }
 
+    if (riscv_feature(env, RISCV_FEATURE_AIA)) {
+        wr_mask |= (SMSTATEEN0_IMSIC | SMSTATEEN0_AIA | SMSTATEEN0_SVSLCT);
+    }
+
     return write_mstateenh(env, csrno, wr_mask, new_val);
 }
 
@@ -1988,6 +2057,10 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
         wr_mask |= SMSTATEEN0_FCSR;
     }
 
+    if (riscv_feature(env, RISCV_FEATURE_AIA)) {
+        wr_mask |= (SMSTATEEN0_IMSIC | SMSTATEEN0_AIA | SMSTATEEN0_SVSLCT);
+    }
+
     return write_hstateen(env, csrno, wr_mask, new_val);
 }
 
@@ -2043,6 +2116,10 @@ static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
         wr_mask |= SMSTATEEN0_FCSR;
     }
 
+    if (riscv_feature(env, RISCV_FEATURE_AIA)) {
+        wr_mask |= SMSTATEEN0_IMSIC | SMSTATEEN0_AIA | SMSTATEEN0_SVSLCT;
+    }
+
     return write_hstateenh(env, csrno, wr_mask, new_val);
 }
 
@@ -2277,6 +2354,12 @@ static RISCVException rmw_vsieh(CPURISCVState *env, int csrno,
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
@@ -2331,6 +2414,12 @@ static RISCVException rmw_sieh(CPURISCVState *env, int csrno,
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
@@ -2493,6 +2582,12 @@ static RISCVException rmw_vsiph(CPURISCVState *env, int csrno,
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
@@ -2547,6 +2642,12 @@ static RISCVException rmw_siph(CPURISCVState *env, int csrno,
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
@@ -2739,6 +2840,10 @@ static RISCVException read_hstatus(CPURISCVState *env, int csrno,
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
@@ -2799,6 +2904,12 @@ static RISCVException rmw_hidelegh(CPURISCVState *env, int csrno,
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
@@ -2845,6 +2956,12 @@ static RISCVException rmw_hviph(CPURISCVState *env, int csrno,
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
@@ -2899,6 +3016,13 @@ static RISCVException write_hcounteren(CPURISCVState *env, int csrno,
 static RISCVException read_hgeie(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_IMSIC);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     if (val) {
         *val = env->hgeie;
     }
@@ -2908,6 +3032,13 @@ static RISCVException read_hgeie(CPURISCVState *env, int csrno,
 static RISCVException write_hgeie(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_IMSIC);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     /* Only GEILEN:1 bits implemented and BIT0 is never implemented */
     val &= ((((target_ulong)1) << env->geilen) - 1) << 1;
     env->hgeie = val;
@@ -2947,6 +3078,13 @@ static RISCVException write_htinst(CPURISCVState *env, int csrno,
 static RISCVException read_hgeip(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_IMSIC);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     if (val) {
         *val = env->hgeip;
     }
@@ -3017,12 +3155,28 @@ static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
 
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
@@ -3081,41 +3235,105 @@ static int write_hvipriox(CPURISCVState *env, int first_index,
 
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


