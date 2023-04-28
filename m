Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psRKw-0004Kk-95
	for mharc-qemu-riscv@gnu.org; Fri, 28 Apr 2023 12:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1psRKu-0004KD-Gg
 for qemu-riscv@nongnu.org; Fri, 28 Apr 2023 12:52:44 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1psRKs-0005tG-D4
 for qemu-riscv@nongnu.org; Fri, 28 Apr 2023 12:52:44 -0400
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-38e04d1b2b4so124525b6e.3
 for <qemu-riscv@nongnu.org>; Fri, 28 Apr 2023 09:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682700759; x=1685292759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FJg9Z757wkoktYD9WwpmRyspyW4Py5K0/MXLwUgCBlw=;
 b=TKBy0uYQj0FW5tqHBPhs0Tj8KeGxwDHHD6P0S5x3c6HyId32CM+qaLOaRWjl4MEc+M
 nzEJH3SdJw/PXHSINgfSm0rXaJiNUzKhm7QJ9DITLwsRkoZZc1110dZ0oIMyV95ABwX/
 tflBSFQGPi1+lUcnpkmesZGxBYFsF5kAeKKW17PYSHKVuEOG2EOga5POfkj1t7iWHlhl
 6jXBA3dpfFVVHu8Bm8SPW4VW/hvb2BwmCQco3wJJNnd+73xVVO9vgxNc+U9kxHvUJFjL
 FtockBCTahDZb1DNnbrrfSw1GjZzYqk6C/5baW3S7rxhkcocZybQ40rrW2Qae6u7JTQa
 NhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682700759; x=1685292759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FJg9Z757wkoktYD9WwpmRyspyW4Py5K0/MXLwUgCBlw=;
 b=XzFMo+YDEVK4faomvE638xDg0E6AeXdLDQs7KocSIGlln/4ioqQ3YgvXI4yqF4NhW0
 mLpslft40wBz2lGpwjxVzOkgkFRj5F8rYe5pFm7SFN3HflWvG7KGSZjohuNtVk9bEuSn
 rhbYgIo9IEraTEI4bKtxS/Fu0Qz5dJ2z1Y5x6+xbFPCZXFACIr+bHK6LvSMc7pYHfkIY
 cI1nBkH3pPV9JL/L9MjIXi/hGybuXv+gIHFnkly+DfxnibZIuMcJ4aTCjl5SQ/Rgc4U9
 ppmAE28TN55dCQrQMbaIaH34Sn+Uj1M2BfrzOZJddyCy/jlRtEhRJRtOhf0a19O/Vct8
 SojA==
X-Gm-Message-State: AC+VfDxg6eq2a2Yg4vNpJqHhz2PMgNmmKPozpU0C2WtpJ2GQeyH2ocsh
 eE+IHknzq+dsDpti0vqDi08P9Q==
X-Google-Smtp-Source: ACHHUZ6nl3mJ3PtbmdY7Ypc9R0cIjqjdJZCOG8x3I4UI2scjGfNswL3Uxesx+mU+3fS6AhR/45naDw==
X-Received: by 2002:aca:f01:0:b0:38c:398e:6afd with SMTP id
 1-20020aca0f01000000b0038c398e6afdmr2585752oip.53.1682700757871; 
 Fri, 28 Apr 2023 09:52:37 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 c10-20020a4a4f0a000000b005462a25c4f9sm9665764oob.9.2023.04.28.09.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 09:52:37 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 1/4] target/riscv: smstateen check for fcsr
Date: Fri, 28 Apr 2023 22:22:08 +0530
Message-Id: <20230428165212.2800669-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428165212.2800669-1-mchitale@ventanamicro.com>
References: <20230428165212.2800669-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oi1-x233.google.com
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
X-List-Received-Date: Fri, 28 Apr 2023 16:52:44 -0000

If smstateen is implemented and smtateen0.fcsr is clear and misa.F
is off then the floating point operations must return illegal
instruction exception or virtual instruction trap, if relevant.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/csr.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4451bd1263..3f6b824bd2 100644
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
@@ -2100,6 +2104,9 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
 
     return write_mstateen(env, csrno, wr_mask, new_val);
 }
@@ -2173,6 +2180,10 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_hstateen(env, csrno, wr_mask, new_val);
 }
 
@@ -2259,6 +2270,10 @@ static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
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


