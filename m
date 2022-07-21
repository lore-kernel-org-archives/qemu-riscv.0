Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEY9s-0007S0-Pe
	for mharc-qemu-riscv@gnu.org; Thu, 21 Jul 2022 11:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oEY9p-0007Kr-I2
 for qemu-riscv@nongnu.org; Thu, 21 Jul 2022 11:32:09 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:39809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oEY9n-0002da-Hl
 for qemu-riscv@nongnu.org; Thu, 21 Jul 2022 11:32:09 -0400
Received: by mail-pf1-x436.google.com with SMTP id b133so2072849pfb.6
 for <qemu-riscv@nongnu.org>; Thu, 21 Jul 2022 08:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tVHglTLpehsDGbxX3FN7F4b5IgMe8HHT5vXknc0fpr4=;
 b=GoYyzspT8KeWZGGs3t4nCiv8uqXJFL0U143md6Odl8JMv5Z7OKX04SArOCcDAEFWV8
 +LtbWRWiSoO85qx4bWN/0SVbN7TqIqld3KjMKNSfBSj8xduyk8R7d2XdNcFJ7BkTQkTt
 HvwuanM/lMRWXA0OOrSNc0tjI9uLfCBJ6Mmv+6RpHFq+LMyaU8k9cUYPxnqoEIM23T18
 Jcm1iYAlVCnjZkTFH9yJjhpx6skOrbr7gvorbs99JJwzcvQ5kIYMVRcSHM8BkZJZQtDz
 EbOQPHEu3i8GJX8Gx/of5o5rx0wouhGuiznXQSCqeOiIWxVLXUWZTs87jNmocOmKgMsF
 flTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tVHglTLpehsDGbxX3FN7F4b5IgMe8HHT5vXknc0fpr4=;
 b=PAvEDUlU1BFVh6qxyEYmfqjYJk4RonuqYFpWlzl5vpqMfZdZEUwzTA2ZzdgDPgazHp
 8gU+ZPyT/K+I9JA4bG0vt7eke4im7VepWbcByWUrCTteSITQsuXPN5nG1vhnjtikKi+Q
 iEM5/W+WglXEOdnaG9tEN09ieOEsZxZndwHTmt6TLrC3iwpEpVG2H4frrBDFsWJVxqu7
 sBZEm8nzxEGiN/tmTYf8Wivkan3zdtvSrKDbVbB+Y5JFkg9s1AgAj73+EVJToyOHV6Hy
 Lkb8acohG2NvB2IUkKYwLbVONdxKnHhtGVfAg5UDX/izLIuoVJbow/227EiyeZZHPXIu
 jdEw==
X-Gm-Message-State: AJIora8k+Z8xtkHLkk84ii1cm1jqh/Zlfn9EoNPaV6YlRvRnQPoIU9O1
 GVsVXnUONetxYx9ANf5tUg7Qeg==
X-Google-Smtp-Source: AGRyM1s9YmDGQp9cmgRwroX//w63qWNJJp/Z7/IZrNiqj3SOQYEzldjVBtj6njNxMCmdH6rvhC99vg==
X-Received: by 2002:a05:6a00:301f:b0:52a:ccdd:17f9 with SMTP id
 ay31-20020a056a00301f00b0052accdd17f9mr44465541pfb.82.1658417526144; 
 Thu, 21 Jul 2022 08:32:06 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([182.70.95.50])
 by smtp.googlemail.com with ESMTPSA id
 f4-20020a170902684400b0016bdf0032b9sm1814379pln.110.2022.07.21.08.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 08:32:05 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v6 2/5] target/riscv: smstateen check for h/senvcfg
Date: Thu, 21 Jul 2022 21:01:33 +0530
Message-Id: <20220721153136.377578-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220721153136.377578-1-mchitale@ventanamicro.com>
References: <20220721153136.377578-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pf1-x436.google.com
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
X-List-Received-Date: Thu, 21 Jul 2022 15:32:09 -0000

Accesses to henvcfg, henvcfgh and senvcfg are allowed only if
corresponding bit in mstateen0/hstateen0 is enabled. Otherwise an
illegal instruction trap is generated.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/csr.c | 100 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 93 insertions(+), 7 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 27032a416c..ab06b117f9 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -40,6 +40,55 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 }
 
 /* Predicates */
+#if !defined(CONFIG_USER_ONLY)
+static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
+                                       uint64_t bit)
+{
+    bool virt = riscv_cpu_virt_enabled(env);
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    uint64_t hstateen = env->hstateen[index];
+    uint64_t sstateen = env->sstateen[index];
+
+    if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
+        return RISCV_EXCP_NONE;
+    }
+
+    if (!(env->mstateen[index] & bit)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    /*
+     * Treat hstateen and sstateen as read-only zero if mstateen0.staten
+     * is clear.
+     */
+    if (!(env->mstateen[index] & SMSTATEEN_STATEN)) {
+        hstateen = 0;
+        sstateen = 0;
+    }
+
+    if (virt) {
+        if (!(hstateen & bit)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+        /*
+         * Treat sstateen as read-only zero if hstateen0.staten is clear.
+         */
+        if (!(hstateen & SMSTATEEN_STATEN)) {
+            sstateen = 0;
+        }
+    }
+
+    if (env->priv == PRV_U && riscv_has_ext(env, RVS)) {
+        if (!(sstateen & bit)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+    }
+
+    return RISCV_EXCP_NONE;
+}
+#endif
+
 static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -1708,6 +1757,13 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
 static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->senvcfg;
     return RISCV_EXCP_NONE;
 }
@@ -1716,15 +1772,27 @@ static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
     uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENVCFG_CBZE;
+    RISCVException ret;
 
-    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
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
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->henvcfg;
     return RISCV_EXCP_NONE;
 }
@@ -1733,6 +1801,12 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
     uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
         mask |= HENVCFG_PBMTE | HENVCFG_STCE;
@@ -1746,6 +1820,13 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
 static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->henvcfg >> 32;
     return RISCV_EXCP_NONE;
 }
@@ -1755,9 +1836,14 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
 {
     uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
     uint64_t valh = (uint64_t)val << 32;
+    RISCVException ret;
 
-    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
+    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
     return RISCV_EXCP_NONE;
 }
 
@@ -1789,7 +1875,7 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
 static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
-    uint64_t wr_mask = SMSTATEEN_STATEN;
+    uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
 
     return write_mstateen(env, csrno, wr_mask, new_val);
 }
@@ -1836,7 +1922,7 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
 static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
-    uint64_t wr_mask = SMSTATEEN_STATEN;
+    uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
 
     return write_mstateenh(env, csrno, wr_mask, new_val);
 }
@@ -1885,7 +1971,7 @@ static RISCVException write_hstateen(CPURISCVState *env, int csrno,
 static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
-    uint64_t wr_mask = SMSTATEEN_STATEN;
+    uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
 
     return write_hstateen(env, csrno, wr_mask, new_val);
 }
@@ -1936,7 +2022,7 @@ static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
 static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
                                        target_ulong new_val)
 {
-    uint64_t wr_mask = SMSTATEEN_STATEN;
+    uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
 
     return write_hstateenh(env, csrno, wr_mask, new_val);
 }
@@ -1995,7 +2081,7 @@ static RISCVException write_sstateen(CPURISCVState *env, int csrno,
 static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
-    uint64_t wr_mask = SMSTATEEN_STATEN;
+    uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
 
     return write_sstateen(env, csrno, wr_mask, new_val);
 }
-- 
2.25.1


