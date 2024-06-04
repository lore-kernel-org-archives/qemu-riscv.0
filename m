Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3FCC25B74
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 06:23:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sENZM-00079P-OU; Tue, 04 Jun 2024 02:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sENZL-000798-Et
 for qemu-riscv@nongnu.org; Tue, 04 Jun 2024 02:22:51 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sENZJ-0006g5-SJ
 for qemu-riscv@nongnu.org; Tue, 04 Jun 2024 02:22:51 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2c217727902so556801a91.1
 for <qemu-riscv@nongnu.org>; Mon, 03 Jun 2024 23:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717482168; x=1718086968; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qq2F16iGLWJ1JpPy/R68fie0tbSa93MUzDYcvl7x2d0=;
 b=NmaKXZ6UNV2BAWAcGUfDlGqNeXzAy7fObrIz856EUw1b1HcNeAUKuGmuoWzyN8hHem
 R76Rw5iJ92WVOn/IAemY9TmjV6lNFpgEVuZbpXBIT6RmKxgwqGgWW8EWaFU2VHFWtC+3
 a9Fx9c/MNuy3jTcddWpqB5TlrF972zKVWI0shRKvCC9r58A/+CL7Caft6e1ku5zuph+9
 Nsb4vjkVO/NmoF/3STmygPtTJtjNvVZ3SbDKnh07cfYuwUASqF7GslmJdg9jOOQqW1Xq
 U02q5MKoNQukvlkJVrS5ovnRx4nzXyegQrHs9BzR60ov4YMnJJjsQH3fXCTeqMOLijI1
 0aAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717482168; x=1718086968;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qq2F16iGLWJ1JpPy/R68fie0tbSa93MUzDYcvl7x2d0=;
 b=DpiGX6Gt7WBC1TbwM+hbNPvruCjd5x8kqr/zVh9D9GaCfNRUz4HQLei+A4T0z0cHE6
 lbjJOtb1YSKMOCFwzbJirACF/aziE3bNaw7u89Z14wD7xpmLNiHu/7SiCM8UO8Ur0sx7
 NNlHh0SoXT34Fhsn0UddBVF8V1peWoIHI+9hM9J2wyW+mOPoOomL1m8Rc9F/sKboa/Rp
 vfODdGFMw/dsRwEeDqqArsa/BrsBkGIvbe/cUkv4kNFopYTaELJoZF8rtdO9CeUOFLuU
 RPGm8KxKcTZkJC36kb4HurJRyEJvRdBvu7SPa3Oq6I3cQ5hx0HNhANGx/OP+Er1JZIWu
 IbsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJekrR65PV+Uy8pITe/RB7vYlfvAXnjOcDVkr/ah34ba4DME9cdHqPdJBwHgJGnb5ZVQCCr9ISYNvdYuOrfW/zqoP0A58=
X-Gm-Message-State: AOJu0Yw2D009yu0jgpM+/rKCmtPOFfVPA8p4IZsRC8kpvKw52cKgoU4/
 tSpFyExcYvBPuCLB6idnTbc7x3pNerCBbczaEU7TLYRmxnkl0d2MpMwNkYzuja8=
X-Google-Smtp-Source: AGHT+IEeQ5JTMwH32iAMPQTYmqnN+2FxxrkJsVFayPwlsAyj8/cVnUuvYzBDkCIHRIML4v8xVA4ddw==
X-Received: by 2002:a17:90a:1fc2:b0:2c1:972b:4910 with SMTP id
 98e67ed59e1d1-2c1dc56cd13mr9127499a91.2.1717482168372; 
 Mon, 03 Jun 2024 23:22:48 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c1dcb56014sm7115617a91.25.2024.06.03.23.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 23:22:48 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Fea.Wang" <fea.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v3 5/6] target/riscv: Add MEDELEGH, HEDELEGH csrs for RV32
Date: Tue,  4 Jun 2024 14:27:46 +0800
Message-Id: <20240604062747.9212-6-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604062747.9212-1-fea.wang@sifive.com>
References: <20240604062747.9212-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=fea.wang@sifive.com; helo=mail-pj1-x1034.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Based on privileged spec 1.13, the RV32 needs to implement MEDELEGH
and HEDELEGH for exception codes 32-47 for reserving and exception codes
48-63 for custom use. Add the CSR number though the implementation is
just reading zero and writing ignore. Besides, for accessing HEDELEGH, it
should be controlled by mstateen0 'P1P13' bit.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h |  2 ++
 target/riscv/csr.c      | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 28bd3fb0b4..f888025c59 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -156,6 +156,8 @@
 
 /* 32-bit only */
 #define CSR_MSTATUSH        0x310
+#define CSR_MEDELEGH        0x312
+#define CSR_HEDELEGH        0x612
 
 /* Machine Trap Handling */
 #define CSR_MSCRATCH        0x340
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 3dcfb343fe..d480feb94d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3222,6 +3222,33 @@ static RISCVException write_hedeleg(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_hedelegh(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    RISCVException ret;
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_P1P13);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    /* Reserved, now read zero */
+    *val = 0;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_hedelegh(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    RISCVException ret;
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_P1P13);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    /* Reserved, now write ignore */
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException rmw_hvien64(CPURISCVState *env, int csrno,
                                     uint64_t *ret_val,
                                     uint64_t new_val, uint64_t wr_mask)
@@ -4626,6 +4653,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
 
     [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,
                           write_mstatush                                   },
+    [CSR_MEDELEGH]    = { "medelegh",   any32, read_zero, write_ignore,
+                          .min_priv_ver = PRIV_VERSION_1_13_0              },
+    [CSR_HEDELEGH]    = { "hedelegh",   hmode32, read_hedelegh, write_hedelegh,
+                          .min_priv_ver = PRIV_VERSION_1_13_0              },
 
     /* Machine Trap Handling */
     [CSR_MSCRATCH] = { "mscratch", any,  read_mscratch, write_mscratch,
-- 
2.34.1


