Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1plsH2-0000yk-ED
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 10:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1plsH0-0000yI-4W
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 10:13:34 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1plsGy-0000O9-3f
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 10:13:33 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 90-20020a17090a0fe300b0023b4bcf0727so4588809pjz.0
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 07:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681136011; x=1683728011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YhUJzlv6L2SG01QXHZ5Rm122+jHRIvLzIcJjNiuBws0=;
 b=mvIMREe7duJ/AcLuo9USNYSkiyo5iiMCrnh9dw4YhzBgf1NU2jSiSe+igWXSEJlptj
 lQPpZ+NxnaoddrxTmQ7huL6zNsBpD3D1HjZMShGdzcCjFfYF4xHlXo7ZH6fkJBNGCyft
 gMNEnKo/cyfjXvS0LzkLoqxLKtL1djwZn6+N8WlTBFrvtNP9MXEn5mEcFC0dscmNTkmt
 Wsj8wc6HwIdQ1hFBUiqGq7i4OWN0gXb6D2E714Xeu9bsjcDDEaS6zgzyogp/OcpyDGgy
 YQn9dT3tlxK7fH3obKtTIgujywgBSR4SnyqBresA2KzLyX4TNT01BYgb0fDO2aGOpzk9
 7uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681136011; x=1683728011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YhUJzlv6L2SG01QXHZ5Rm122+jHRIvLzIcJjNiuBws0=;
 b=DcmBCalCFJqiHTF5JOwXA1w/XWNXBtTGNVBlAcFNvNB0osDIi5FMWNdPOD9UyI1JHB
 6qySEjlLda6y7OtK1jh3DMucI/DxI8FMV/uzI8cp5CgAIChbyDtwMY8CX2RiEnu9P6bC
 yLKyKiNOeOzSqcAlBr4dnv8Ww1O1/PclCMXgDg7M+2eUgSsGODCuldqlqaN3Qoszx382
 M/XSYs49UVNsaYp52yU14AuwLfp4OwvfhZvVke0BfqjnWLYoF1NgPCBilxB9hhN+Ol7x
 j7BDB4SY9yWP4XwZEk0rwkixKncVMBOfc+aZMcTv3bhOukcFd8U7uWVq+BIZhofoeJha
 4zrg==
X-Gm-Message-State: AAQBX9cDDHDrWCMOFrUgdGRFh/0v9AH2NghO+2SYEhGCv/DhqTZGRVee
 /W1ZuI9b6fGx/VYVkH5s8aMejg==
X-Google-Smtp-Source: AKy350bqp85WsMpDYj1LLncH0t4juVEGb+r5uD3RkwIkGqX6XhSBT5Ez1E8ghd8QhX02mu9/YkE95Q==
X-Received: by 2002:a05:6a20:6d07:b0:d7:87ce:671e with SMTP id
 fv7-20020a056a206d0700b000d787ce671emr7513421pzb.52.1681136010835; 
 Mon, 10 Apr 2023 07:13:30 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 b22-20020aa78716000000b0063486255a87sm3783526pfo.142.2023.04.10.07.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 07:13:30 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH 1/4] target/riscv: smstateen check for fcsr
Date: Mon, 10 Apr 2023 19:43:13 +0530
Message-Id: <20230410141316.3317474-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230410141316.3317474-1-mchitale@ventanamicro.com>
References: <20230410141316.3317474-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 10 Apr 2023 14:13:34 -0000

If smstateen is implemented and sstateen0.fcsr is clear then the
floating point operations must return illegal instruction exception
or virtual instruction trap, if relevant.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/cpu.h |  3 +++
 target/riscv/csr.c | 25 ++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..132cf06ff2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -613,6 +613,9 @@ void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
                                                  target_ulong new_val,
                                                  target_ulong write_mask),
                                    void *rmw_fn_arg);
+RISCVException smstateen_acc_ok(CPURISCVState *env, int index, uint64_t bit);
+#else
+#define smstateen_acc_ok(env, index, bit) RISCV_EXCP_NONE
 #endif
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d522efc0b6..4979058434 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -43,7 +43,7 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 
 /* Predicates */
 #if !defined(CONFIG_USER_ONLY)
-static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
+RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
                                        uint64_t bit)
 {
     bool virt = riscv_cpu_virt_enabled(env);
@@ -83,6 +83,10 @@ static RISCVException fs(CPURISCVState *env, int csrno)
         !riscv_cpu_cfg(env)->ext_zfinx) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
+
+    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
+        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
+    }
 #endif
     return RISCV_EXCP_NONE;
 }
@@ -2056,6 +2060,9 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
 
     return write_mstateen(env, csrno, wr_mask, new_val);
 }
@@ -2092,6 +2099,10 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_mstateenh(env, csrno, wr_mask, new_val);
 }
 
@@ -2129,6 +2140,10 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_hstateen(env, csrno, wr_mask, new_val);
 }
 
@@ -2168,6 +2183,10 @@ static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_hstateenh(env, csrno, wr_mask, new_val);
 }
 
@@ -2215,6 +2234,10 @@ static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_sstateen(env, csrno, wr_mask, new_val);
 }
 
-- 
2.34.1


