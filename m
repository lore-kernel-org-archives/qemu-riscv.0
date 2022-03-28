Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nYt5h-0008OE-K1
	for mharc-qemu-riscv@gnu.org; Mon, 28 Mar 2022 13:23:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nYt5g-0008LP-ED
 for qemu-riscv@nongnu.org; Mon, 28 Mar 2022 13:23:40 -0400
Received: from [2607:f8b0:4864:20::1034] (port=52927
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nYt5e-00033y-Ri
 for qemu-riscv@nongnu.org; Mon, 28 Mar 2022 13:23:40 -0400
Received: by mail-pj1-x1034.google.com with SMTP id v4so14824951pjh.2
 for <qemu-riscv@nongnu.org>; Mon, 28 Mar 2022 10:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=L6+AqKjXtNkbK+bDI19e24j/hE2NKj1kvcBJT6uzycs=;
 b=YE1ASoogvsv5KlCpQX0XDaceGi6nmqRzokyuNVvmVVISpoaih84PSLupkhdrNBCg8L
 uDp0E2n1fYtvsSum4vDJC6MLyMbeChuw9bxfw1gA1HY7V768XpDQ3XpYoGPV5icui1ty
 7cd2DqAi1PWcCXjB3zTM8MFMyv8aSNecy6OHzKitjPEzd+crVPbFvYe5vFrUq/p/3dKe
 zJmgzPzgePeGpzCRclDPKoPGC7h+/pDsjVN0ksPPXjsrcOcikHS7EtopPq3ioeehYEiC
 qozgkYLwaRE7DxSLEf2VY18jMmOaBpzKeBK7SzIUyqrM+GlEllTO+r/Cxc6Fpi2nroln
 I+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=L6+AqKjXtNkbK+bDI19e24j/hE2NKj1kvcBJT6uzycs=;
 b=xzpaZurqDdVWsV7Fkc1HlrqohB12pPLFhhNqtuMQOpROen/JZVFkTbFWdHrjR9kjoy
 D/S3R9QPJmjWCbp9KMVKYZu6r0YkbfRk2je66YcjEADukLhomhN4O8MFXTGJiJuhpe4A
 u86oeO3jGJHuQ8Hgng/160A+vCw7sweagOO/LAT1LUYCZbFsk/4f80f6eTC10vp5ICH7
 W2j/J5JKjmkV1jFfsv2fbZw0rxUMM8nVSmV5ivrD1xlk8A+lgtVxuoDYgoN4rSL/Q/Qd
 CP8cmG+/nygdAM0x0TGBX7UgU2A4gWGrQyTv+ECzYKVfS/pQlsf2TIKxES5Qaujc8hBf
 c1hQ==
X-Gm-Message-State: AOAM531vS78LpxdgRLx36l2vB2i0KRJaZzdcsTJpyVMcAzJtJ7pDi0Wt
 plzNRJJYQDdUN9v+Mccog39BUg==
X-Google-Smtp-Source: ABdhPJxSmHshDLqNck26bx0yH8wFXvOwPr0qiEoxx/9jOq61iw1/KOzm2c63gJsuXb87ixd+QapQtQ==
X-Received: by 2002:a17:902:6943:b0:156:1d3c:1e0d with SMTP id
 k3-20020a170902694300b001561d3c1e0dmr2744706plt.76.1648488217590; 
 Mon, 28 Mar 2022 10:23:37 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([171.50.204.174])
 by smtp.googlemail.com with ESMTPSA id
 132-20020a62168a000000b004f40e8b3133sm17802504pfw.188.2022.03.28.10.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 10:23:37 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [RFC PATCH v3 3/4] target/riscv: smstateen check for fcsr
Date: Mon, 28 Mar 2022 22:53:18 +0530
Message-Id: <20220328172319.6802-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220328172319.6802-1-mchitale@ventanamicro.com>
References: <20220328172319.6802-1-mchitale@ventanamicro.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Mon, 28 Mar 2022 17:23:40 -0000

If smstateen is implemented and sstateen0.fcsr is clear
then the floating point operations must return illegal
instruction exception.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/csr.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index dda254a6c9..658f51bd40 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -73,6 +73,10 @@ static RISCVException fs(CPURISCVState *env, int csrno)
         !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
+
+    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
+        return smstateen_acc_ok(env, PRV_U, SMSTATEEN0_FCSR);
+    }
 #endif
     return RISCV_EXCP_NONE;
 }
@@ -1617,6 +1621,10 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
                        (1UL << SMSTATEEN0_HSENVCFG);
 
     reg = &env->mstateen[csrno - CSR_MSTATEEN0];
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     write_smstateen(env, reg, wr_mask, new_val);
 
     return RISCV_EXCP_NONE;
@@ -1641,6 +1649,10 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
     reg = &env->mstateen[csrno - CSR_MSTATEEN0H];
     val = (uint64_t)new_val << 32;
     val |= *reg & 0xFFFFFFFF;
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     write_smstateen(env, reg, wr_mask, val);
 
     return RISCV_EXCP_NONE;
@@ -1662,6 +1674,10 @@ static RISCVException write_hstateen(CPURISCVState *env, int csrno,
                        (1UL << SMSTATEEN0_HSENVCFG);
     int index = csrno - CSR_HSTATEEN0;
 
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     reg = &env->hstateen[index];
     wr_mask &= env->mstateen[index];
     write_smstateen(env, reg, wr_mask, new_val);
@@ -1686,6 +1702,10 @@ static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
     uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
                        (1UL << SMSTATEEN0_HSENVCFG);
 
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     reg = &env->hstateen[index];
     val = (uint64_t)new_val << 32;
     val |= *reg & 0xFFFFFFFF;
@@ -1711,6 +1731,10 @@ static RISCVException write_sstateen(CPURISCVState *env, int csrno,
     int index = csrno - CSR_SSTATEEN0;
     bool virt = riscv_cpu_virt_enabled(env);
 
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     reg = &env->sstateen[index];
     if (virt) {
         wr_mask &= env->mstateen[index];
-- 
2.17.1


