Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nx9o0-0001O2-QF
	for mharc-qemu-riscv@gnu.org; Fri, 03 Jun 2022 12:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nx9n7-00017P-Tl
 for qemu-riscv@nongnu.org; Fri, 03 Jun 2022 12:04:50 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:46639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nx9n5-0008IG-0F
 for qemu-riscv@nongnu.org; Fri, 03 Jun 2022 12:04:49 -0400
Received: by mail-pf1-x429.google.com with SMTP id j6so7462441pfe.13
 for <qemu-riscv@nongnu.org>; Fri, 03 Jun 2022 09:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nasysuCBKrfsrbu7mpNIpX+EGhC6h3ddpRO8VJzngvw=;
 b=VJtHtkWfu/wFGCQ4anRNSzsJmQYh1EoCUpEebJLFTugqjEBeKgpdiCc3kGs3lSrJtO
 QUwnZkI3ovfHzFzKrIPhKq5rPc58F7lHUE5/wYdcJBt8m0U/z0I7c1o2WVA+p2pFdwXF
 lfAMafzDMGDANb2cHXOW7D7MKWOHAGChPDFbbUKbxeIiEi6tZ90oH/2iQftAHG4gKPKE
 9NRF1NrC12sy0OZSAqbAndiax0Eid0arWCN0hYMF5YlNZVm1KSJyZ2q/fd4hGtyqnyoj
 zLQ8akbL0y3CblcYbPre+zYckbN9bwLYmP11xGJ6IynmDsB8BsvDxihOu9SeU7PLXLHC
 akXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nasysuCBKrfsrbu7mpNIpX+EGhC6h3ddpRO8VJzngvw=;
 b=pVJ9RW/m6uZrANz3MmZ+jvi3LcHi1WBDV4KomZbEFFSO67ThIJ+/kEKnFxfesNmLKy
 AkbrBz8M0+DOFsMYFx6AyOAfeLfLCsLda28HdzuQQdDM0/ZkbagNA3WJIO64mrOj27uI
 xjMw0qhIgv3wzlA+8zzT3fVmMnvLvfmdbhG5FGSP34Nt7kSR4QGQWoAo6YvUTZjJ3Mvj
 QloUbIGLvoM8itHfwy776RcorDQQvQbw6giZ+7+1VDWbXMMVoUOjtHWfWXN56yV5utyZ
 UnpWUdwBnP6FCa4miobLwi8YCvMP8KhHOS8VSnoAf86+dJTj/Hg6jHS7C9I9aqDX6J95
 nkwg==
X-Gm-Message-State: AOAM530hvt3coI5oXlyVCh89Udq7Pko27axeBQQctIwxSpL0xp/Lg6B7
 00vRo8j44u/GHaUU+XFEfHFvRw==
X-Google-Smtp-Source: ABdhPJyNJDcqzANaGnu8HrRBfBb+oH2SZdihqW4LNsK0W6e8TUPiAzZ0VuWGNTekdm/TT0JsYUEN/Q==
X-Received: by 2002:a63:296:0:b0:3fc:aa42:5e8b with SMTP id
 144-20020a630296000000b003fcaa425e8bmr9514537pgc.519.1654272285455; 
 Fri, 03 Jun 2022 09:04:45 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([122.169.0.22])
 by smtp.googlemail.com with ESMTPSA id
 z12-20020a1709027e8c00b0016196bd15f4sm5638035pla.15.2022.06.03.09.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 09:04:44 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [RFC PATCH v5 3/4] target/riscv: smstateen check for fcsr
Date: Fri,  3 Jun 2022 21:34:24 +0530
Message-Id: <20220603160425.3667456-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220603160425.3667456-1-mchitale@ventanamicro.com>
References: <20220603160425.3667456-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pf1-x429.google.com
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
X-List-Received-Date: Fri, 03 Jun 2022 16:04:51 -0000

If smstateen is implemented and sstateen0.fcsr is clear
then the floating point operations must return illegal
instruction exception.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/csr.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ae91ae1f7e..8bbbed38ff 100644
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


