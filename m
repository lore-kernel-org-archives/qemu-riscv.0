Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npR1m-0001r3-KL
	for mharc-qemu-riscv@gnu.org; Fri, 13 May 2022 04:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1npR1Y-0001nd-5E
 for qemu-riscv@nongnu.org; Fri, 13 May 2022 04:51:48 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:45004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1npR1W-0005Ju-Be
 for qemu-riscv@nongnu.org; Fri, 13 May 2022 04:51:47 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 c1-20020a17090a558100b001dca2694f23so7202796pji.3
 for <qemu-riscv@nongnu.org>; Fri, 13 May 2022 01:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+RxmBBGYe+1c31JCCxKkp4lR7lER1U35YW4cmNqXk+I=;
 b=P4yMBRri8lpjS3v39+TMxNyqDx8ijgMJOfjIHVTiHutQSrCVgKDZ5D8Sv0LFd8WR0p
 crZEXR11kY/JXpesv9pPmJTuF3wg4TB9viURlH5OmXXSX61PeApfOSOsYscM3s98wx07
 6qZy7OztOg5dxKNHt8MAfLUqlfP6qFhLb9yWlfCXM1sdc76hWxFNjk7rP2AAfZkj4ePT
 y+p1r5cLpW+ceiFewqe0PvwtPnvRT22PwZRiEHsNrodhV9ej1Le7JtUik3tHnwWfN4EU
 KhQNUiJZ88frLkuSMqx1eenDx5MOS5vhWXVx4iyylHL2+ZPkhAW0dKBAl0gHUfqSoPha
 sv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+RxmBBGYe+1c31JCCxKkp4lR7lER1U35YW4cmNqXk+I=;
 b=yPD/khufYjm7x7DEtSk32uWzXUebieD+rIZrlkeXIAFenUX5BOxdScmgzhqnPnWUJl
 O52iSyIgc3p2r7XrJqbyLqXGz9SDxPTtvdLfwi7qpRgzBmnytbQOvX2rg87r7KP54bB5
 m1y2XNkJIjFAiFFRjGYcm3l44dMRH3Izx1sK9wk80rduJHHKpQL6WmR498tTa+aJeEXH
 r7FuvIGYS862tztBpwYrbkPx49WFxPRe8IU9Mmbht+cXcNELGquucCsReCYoDz/H4+Xd
 zAZISiF2xTBWI6f2JMjqIWpSZVY/eYfixFYx0ndGZHvw9h14MK6LvmZ/FfDKTJ1HOxTU
 HaeQ==
X-Gm-Message-State: AOAM533CC46rHGVPB6+piH3EutshOdMgouP3cZ55EonDHSAM8Q8wsMNo
 g5PDfD3FWSD/wCdiFiOeIhW1KMNRvvmJyg==
X-Google-Smtp-Source: ABdhPJzMvlk4X2DNj421kyinKy5Jr3gEy21o/XBQsh3/JGilD7zMCyqXkJ/CzmvGeVM6lLIzhvXxSA==
X-Received: by 2002:a17:903:1205:b0:15e:8cbc:fd2b with SMTP id
 l5-20020a170903120500b0015e8cbcfd2bmr3874441plh.99.1652431905059; 
 Fri, 13 May 2022 01:51:45 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com
 ([2401:4900:198a:9865:5430:73db:b48f:47ad])
 by smtp.googlemail.com with ESMTPSA id
 a3-20020a1709027d8300b0015e8d4eb26dsm1253734plm.183.2022.05.13.01.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 01:51:44 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [RFC PATCH v4 2/4] target/riscv: smstateen check for h/senvcfg
Date: Fri, 13 May 2022 14:21:23 +0530
Message-Id: <20220513085125.403037-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220513085125.403037-1-mchitale@ventanamicro.com>
References: <20220513085125.403037-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 13 May 2022 08:51:49 -0000

Accesses to henvcfg, henvcfgh and senvcfg are allowed
only if corresponding bit in mstateen0/hstateen0 is
enabled. Otherwise an illegal instruction trap is
generated.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/csr.c | 84 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 78 insertions(+), 6 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fea5cdd178..d4920b3fa4 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -39,6 +39,37 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 }
 
 /* Predicates */
+static RISCVException smstateen_acc_ok(CPURISCVState *env, int mode, int bit)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    bool virt = riscv_cpu_virt_enabled(env);
+
+    if (!cpu->cfg.ext_smstateen) {
+        return RISCV_EXCP_NONE;
+    }
+
+#if !defined(CONFIG_USER_ONLY)
+    if (!(env->mstateen[0] & 1UL << bit)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (virt) {
+        if (!(env->hstateen[0] & 1UL << bit)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+    }
+
+    if (mode == PRV_U) {
+        if (!(env->sstateen[0] & 1UL << bit)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+    }
+#endif
+
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -1557,6 +1588,13 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
 static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->senvcfg;
     return RISCV_EXCP_NONE;
 }
@@ -1565,15 +1603,27 @@ static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
     uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENVCFG_CBZE;
+    RISCVException ret;
 
-    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
+    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->henvcfg;
     return RISCV_EXCP_NONE;
 }
@@ -1582,6 +1632,12 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
     uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
         mask |= HENVCFG_PBMTE | HENVCFG_STCE;
@@ -1595,6 +1651,13 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
 static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->henvcfg >> 32;
     return RISCV_EXCP_NONE;
 }
@@ -1604,9 +1667,14 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
 {
     uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
     uint64_t valh = (uint64_t)val << 32;
+    RISCVException ret;
 
-    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
+    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
     return RISCV_EXCP_NONE;
 }
 
@@ -1628,7 +1696,8 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
                                      target_ulong new_val)
 {
     uint64_t *reg;
-    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
+    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
+                       (1UL << SMSTATEEN0_HSENVCFG);
 
     reg = &env->mstateen[csrno - CSR_MSTATEEN0];
     write_smstateen(env, reg, wr_mask, new_val);
@@ -1649,7 +1718,8 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
 {
     uint64_t *reg;
     uint64_t val;
-    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
+    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
+                       (1UL << SMSTATEEN0_HSENVCFG);
 
     reg = &env->mstateen[csrno - CSR_MSTATEEN0H];
     val = (uint64_t)new_val << 32;
@@ -1671,7 +1741,8 @@ static RISCVException write_hstateen(CPURISCVState *env, int csrno,
                                      target_ulong new_val)
 {
     uint64_t *reg;
-    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
+    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
+                       (1UL << SMSTATEEN0_HSENVCFG);
     int index = csrno - CSR_HSTATEEN0;
 
     reg = &env->hstateen[index];
@@ -1694,8 +1765,9 @@ static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
 {
     uint64_t *reg;
     uint64_t val;
-    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
     int index = csrno - CSR_HSTATEEN0H;
+    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
+                       (1UL << SMSTATEEN0_HSENVCFG);
 
     reg = &env->hstateen[index];
     val = (uint64_t)new_val << 32;
-- 
2.25.1


