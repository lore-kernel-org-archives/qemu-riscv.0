Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npR1v-0001tO-NE
	for mharc-qemu-riscv@gnu.org; Fri, 13 May 2022 04:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1npR1d-0001or-8x
 for qemu-riscv@nongnu.org; Fri, 13 May 2022 04:51:54 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:35720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1npR1b-0005Lr-0r
 for qemu-riscv@nongnu.org; Fri, 13 May 2022 04:51:52 -0400
Received: by mail-pg1-x52e.google.com with SMTP id a191so6934561pge.2
 for <qemu-riscv@nongnu.org>; Fri, 13 May 2022 01:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LSmUF+hmv7upvYcG6HU2mXxsSVdsBJFg4wwadOy0Now=;
 b=J5NEDtTAEWalTnBEaoLN8172dy6az87AFhdbLNonrneh3FVQ54q84VQ1hyzv3dtT1+
 KM7a7nzUwGIPcUTxG229AR0MtS4hT1WCLxJT9kpn0uWUIEbmrFDVTJ3qGAbwsejqb5kd
 +vu2WV6lx0Cnndtr2NgO3EBHcpquYJbxDdWTX8CPz4DU5B0gi+0Bx/ydyt9Hp4LbOuF/
 LJhUmWxOs2LpOXl5vsf9wbW9nUMF6qMAg+srZNJ+hJ+kjHcB71LOMeCNs2kkTaeVrsiJ
 MhyzQgVQt/ZTe5AjsZFPTrKnEZ0D9D9dpQJSqnFYnUQ0ykcTs1wNLNhh7V/WNGutWksQ
 vrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LSmUF+hmv7upvYcG6HU2mXxsSVdsBJFg4wwadOy0Now=;
 b=v0LRpnOVDWGwDFscqa7BqlE9y6Y3QT4eVoXkUUXRtLvEfQehGGAnDPX304Fx3KyrEQ
 30J0AWrfrlxci4rvz9bldxTolmto/eGAQNQPPHg+o1iBhIPGuacljQ1HhDHLlAY4a6Im
 p1QJy5toSQlRc53duXls2nTrqLheuhnYBUz9p+ZmznE3IhV6EMZwrlJ1vXCPkgC/OQsU
 kuHhpq+FzxfR64mfeLxa1At5G6MfclP5juHDixIg4529Fl9TVoKXXcujXoyTM/HFagV2
 8D77J3XgyMqK5rJ5U/P+blhMus1jmHD8ITQ0hCe0DKlOb7nw+V7d4ZOs10HWjkmJeBCI
 +2qw==
X-Gm-Message-State: AOAM533mf01DzP/X/bWyrEfNge2HmSC0+8HnTn2zSIbGCyReJBBejTk2
 sNurrxL1SYzHBMa8y5Z1AqNKlPwaeHc1pg==
X-Google-Smtp-Source: ABdhPJwoOgZCtZoXLcsa+Sv5FMeHgsbG11xHiojp8EYZY6b6rgWYnvQnvgzA5ZjPU/huUO2r1JSmYw==
X-Received: by 2002:a05:6a00:1a89:b0:50d:fee4:cdb1 with SMTP id
 e9-20020a056a001a8900b0050dfee4cdb1mr3485563pfv.85.1652431909696; 
 Fri, 13 May 2022 01:51:49 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com
 ([2401:4900:198a:9865:5430:73db:b48f:47ad])
 by smtp.googlemail.com with ESMTPSA id
 a3-20020a1709027d8300b0015e8d4eb26dsm1253734plm.183.2022.05.13.01.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 01:51:49 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [RFC PATCH v4 3/4] target/riscv: smstateen check for fcsr
Date: Fri, 13 May 2022 14:21:24 +0530
Message-Id: <20220513085125.403037-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220513085125.403037-1-mchitale@ventanamicro.com>
References: <20220513085125.403037-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pg1-x52e.google.com
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
X-List-Received-Date: Fri, 13 May 2022 08:51:55 -0000

If smstateen is implemented and sstateen0.fcsr is clear
then the floating point operations must return illegal
instruction exception.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/csr.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d4920b3fa4..5032e48517 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -77,6 +77,10 @@ static RISCVException fs(CPURISCVState *env, int csrno)
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
@@ -1700,6 +1704,10 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
                        (1UL << SMSTATEEN0_HSENVCFG);
 
     reg = &env->mstateen[csrno - CSR_MSTATEEN0];
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     write_smstateen(env, reg, wr_mask, new_val);
 
     return RISCV_EXCP_NONE;
@@ -1724,6 +1732,10 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
     reg = &env->mstateen[csrno - CSR_MSTATEEN0H];
     val = (uint64_t)new_val << 32;
     val |= *reg & 0xFFFFFFFF;
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     write_smstateen(env, reg, wr_mask, val);
 
     return RISCV_EXCP_NONE;
@@ -1745,6 +1757,10 @@ static RISCVException write_hstateen(CPURISCVState *env, int csrno,
                        (1UL << SMSTATEEN0_HSENVCFG);
     int index = csrno - CSR_HSTATEEN0;
 
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     reg = &env->hstateen[index];
     wr_mask &= env->mstateen[index];
     write_smstateen(env, reg, wr_mask, new_val);
@@ -1769,6 +1785,10 @@ static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
     uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
                        (1UL << SMSTATEEN0_HSENVCFG);
 
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     reg = &env->hstateen[index];
     val = (uint64_t)new_val << 32;
     val |= *reg & 0xFFFFFFFF;
@@ -1794,6 +1814,10 @@ static RISCVException write_sstateen(CPURISCVState *env, int csrno,
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
2.25.1


