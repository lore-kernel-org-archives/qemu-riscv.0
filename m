Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pnLsx-0001yo-8q
	for mharc-qemu-riscv@gnu.org; Fri, 14 Apr 2023 12:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnLsk-0001nb-W6
 for qemu-riscv@nongnu.org; Fri, 14 Apr 2023 12:02:39 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnLsi-0007GC-1s
 for qemu-riscv@nongnu.org; Fri, 14 Apr 2023 12:02:38 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-187a1387021so4847341fac.3
 for <qemu-riscv@nongnu.org>; Fri, 14 Apr 2023 09:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681488152; x=1684080152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WQVbdHSbmA0N99G9XPF6TNlMG0xte3LZeN6z59ov+BU=;
 b=CKbl05EwbGpv1672ElGDinynLnpWITeK/Hz8LH139VwpFsQhoH0fYmpOVvVuwqafXZ
 xgV4FXJYtLjI2slkG/JXrF6vw4d7rXNcm3BAiUpJiRbWxMglwxRu5RDHlFXPnRzOGEa1
 8C8fRol7vENWicDA7rh0AyWwA9ZEZR86GAkMy65ieOEnlrG+5mcX9NVvjdK+M01LxZS3
 fcrHOJojI4lMBfCMOqw2LgRLbLBdkdXcJE1MiYevAzEjt0Eqd1EB+DhG2U3B5GUjnQzu
 lwLBu4McBJCAuYNwi2ykudGtAk1LrbB0OFvKIF+IqCy+CzIX5Gj/3tQI9irgsE6sH6mG
 4LhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488152; x=1684080152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WQVbdHSbmA0N99G9XPF6TNlMG0xte3LZeN6z59ov+BU=;
 b=Ya9WJD+7fj7cGI+h0a6LV6Juxi0YS0GOeE/Zey79YsL2gAkEAvKGKgJ7HQhI8Z3Q5M
 piJCz2HRcMuxatt774AB5VIjWd5MXNL4fbBU42YzLcu2PwjmxewqCvmfBQmRc+97Jzmp
 Rcys+082XxVEbUMJ/XED4QZh6TwnCGhiwPXc4F11pC4zD3p0yqs2m2aLfmuUde0AcvuP
 1qguPSJIHZe3z7d9UEpORR+k8AWJHD6wQlD8GTg8SHtDmuclf5/5EzFyZdF5oLKjiAIZ
 RUNs20y154JnkNtHaqN6JAheLXA9SurJbiUKDuIjl/6X478Ukpd7ChvJKn2ow9n60LDF
 EFcQ==
X-Gm-Message-State: AAQBX9eqErpuncXwiwRTaGOhuaOH1LWqz6m4iKsnVUxMqPeBMOxAvfrx
 K4mpvmt3HTxDsHnu+Dyw/Kih7w==
X-Google-Smtp-Source: AKy350ag/su92qFhP7++e91lFdSfaje/inSkP2rzTqQ911z55exq5oB6Q7CTv/Szx0Zwd+eEnNVFRQ==
X-Received: by 2002:a05:6870:14d2:b0:17f:7dca:8926 with SMTP id
 l18-20020a05687014d200b0017f7dca8926mr4181249oab.20.1681488152316; 
 Fri, 14 Apr 2023 09:02:32 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 u6-20020a4a5706000000b00524fe20aee5sm1794323ooa.34.2023.04.14.09.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 09:02:32 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH v2 1/4] target/riscv: smstateen check for fcsr
Date: Fri, 14 Apr 2023 21:31:59 +0530
Message-Id: <20230414160202.1298242-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230414160202.1298242-1-mchitale@ventanamicro.com>
References: <20230414160202.1298242-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oa1-x31.google.com
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
X-List-Received-Date: Fri, 14 Apr 2023 16:02:39 -0000

If smstateen is implemented and smtateen0.fcsr is clear and misa.F
is off then the floating point operations must return illegal
instruction exception or virtual instruction trap, if relevant.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/csr.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f4d2dcfdc8..8ae9e95f9f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -82,6 +82,10 @@ static RISCVException fs(CPURISCVState *env, int csrno)
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
@@ -2081,6 +2085,9 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
 
     return write_mstateen(env, csrno, wr_mask, new_val);
 }
@@ -2117,6 +2124,10 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_mstateenh(env, csrno, wr_mask, new_val);
 }
 
@@ -2154,6 +2165,10 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_hstateen(env, csrno, wr_mask, new_val);
 }
 
@@ -2193,6 +2208,10 @@ static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_hstateenh(env, csrno, wr_mask, new_val);
 }
 
@@ -2240,6 +2259,10 @@ static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
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


