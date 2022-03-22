Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nWemZ-0006sM-Ig
	for mharc-qemu-riscv@gnu.org; Tue, 22 Mar 2022 09:42:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nWemY-0006qS-Kc
 for qemu-riscv@nongnu.org; Tue, 22 Mar 2022 09:42:42 -0400
Received: from [2607:f8b0:4864:20::102c] (port=40667
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nWemU-0006iu-MX
 for qemu-riscv@nongnu.org; Tue, 22 Mar 2022 09:42:39 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 mp6-20020a17090b190600b001c6841b8a52so2745175pjb.5
 for <qemu-riscv@nongnu.org>; Tue, 22 Mar 2022 06:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kg/pKk30mbUxRLPDjKNWTsH4zz7r/mNxr+90O8Y2D9k=;
 b=ZhVm4Svo9Q9GA/y8NefPxJEqSXyNlCfJireDjAqSxGpiY39tlUjkXN6Y31Lb+eOb2/
 O64zPD6tF82nRMiXxDmsgHZGjmUp/hNK+TQS8LIkQyQWjDHt06zNmlojHCKEEKReNVMi
 BKde+4IXPA7C4igE8VjdSN9E9zp4xONXUGyDdMVvS8fvvrsdOdC1p/vBP2XOGPBh3h9w
 fTrxG6FBCm7n2lSpz8ipwc7EeOwJCDQWZlkXwKI4o23xGTouAL3EbtcLwEQq0+R5bamb
 +dXzVt8hIMjdeCfz/46a2JftKU+TFRf5W7OhTv/MKy75FDiob8v9+tnPzM7BmAIV4kwd
 Wyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kg/pKk30mbUxRLPDjKNWTsH4zz7r/mNxr+90O8Y2D9k=;
 b=rdQzmktrK29Ww8zF7QCCyDR54msIfzbGfX/6SPLh8OYMhBH7+vV/ygE5okVCH8kPJC
 MtrSAjQlXgrGWwpjBChhMPf4zaKg0nCa6OZlANXlMEC+yddM0LYb3E+H6FPnreKu77qD
 kfVQrv5sjc+KYcINeCRbe+/aakVhfTn+95LWKYFmbSiBhZQYvfVUZ6/rF0d+CoJ8HK0t
 LFXNBWGtBmRW5rZaSLsJtVsNFH4v+cNsEON4D63XFRyjYO7a0qV3eBoVa3CvENKXCg24
 N68XE4hZxIi8SVGx4+Wb/c0dAXkcyLnoDxbAhI0agsiDRaD1uvDyaTk6welLk/NTxdcm
 cTsQ==
X-Gm-Message-State: AOAM533b2zYpshZyA6WdFTVxAwINZvPiH3GswcZEu0RJ2nMYhAdOQihC
 lD9yuh4jRpsGOv1qRbD+GiMGIp/0L6q5zRlJ
X-Google-Smtp-Source: ABdhPJz92ohAFboe9dINHklh8iodg87zcl2ex0KQWYUhnxEqHfr01mHC4oj1OkGHlHtGAr1zfxWkWQ==
X-Received: by 2002:a17:90a:4214:b0:1bf:6ae9:f62a with SMTP id
 o20-20020a17090a421400b001bf6ae9f62amr5140698pjg.64.1647956556974; 
 Tue, 22 Mar 2022 06:42:36 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([171.50.204.174])
 by smtp.googlemail.com with ESMTPSA id
 ij17-20020a17090af81100b001c67c964d93sm3101216pjb.2.2022.03.22.06.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 06:42:36 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [RFC PATCH v1 2/4] target/riscv: smstateen check for h/senvcfg
Date: Tue, 22 Mar 2022 19:12:16 +0530
Message-Id: <20220322134218.27322-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220322134218.27322-1-mchitale@ventanamicro.com>
References: <20220322134218.27322-1-mchitale@ventanamicro.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Tue, 22 Mar 2022 13:42:42 -0000

Accesses to henvcfg, henvcfgh and senvcfg are allowed
only if corresponding bit in mstateen0/hstateen0 is
enabled. Otherwise an illegal instruction trap is
generated.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/csr.c | 70 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 68 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 215c8ecef1..46761a6fa8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -39,6 +39,35 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
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
+
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -1865,6 +1894,13 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
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
@@ -1873,15 +1909,27 @@ static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
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
@@ -1890,6 +1938,12 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
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
@@ -1903,6 +1957,13 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
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
@@ -1912,9 +1973,14 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
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
 
-- 
2.17.1


