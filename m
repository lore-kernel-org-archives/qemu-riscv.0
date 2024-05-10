Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC4CC25B4F
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 May 2024 06:53:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s5K8Z-0001hO-Gk; Fri, 10 May 2024 02:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1s5K8X-0001h4-Of
 for qemu-riscv@nongnu.org; Fri, 10 May 2024 02:53:45 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1s5K8W-0004q2-3x
 for qemu-riscv@nongnu.org; Fri, 10 May 2024 02:53:45 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6f4e59081e6so92102b3a.3
 for <qemu-riscv@nongnu.org>; Thu, 09 May 2024 23:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1715324023; x=1715928823; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wQ6x5YYUL/lDfqaZOQY3/NuL3tGGxwqwExXQMFAPOo4=;
 b=RMF999yi/chZfC8i/HeNzcQiqg1lAuGEi3BOO9cJ4RKvj1Lc9B/v5GX2LiXErQC8U2
 Lfe/gyy34/pJJEcrtgSgCDMCAxbFVLejI89MQuNrxkQvxd474MchAxmOPe8nJxpQE2yx
 1BdTexk2OMvSpvmWUOPboQjMN+6iUUQCG6i5FzgTDcOXg7YaRneAfJNUUVjX7lCrl9ON
 voph5xTr4FB0ZcUX50x+xUt2nvqS7WzD5i7/Ky99S2CPRdaA74mxAMBLAHy1o9KjutUB
 IUK34oNvUgzfVpw2cgNtUwDgPP4vRvWPlgzkLRzqTU6QOuxCXq1K3p5WyF3d4fDsqprg
 o09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715324023; x=1715928823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wQ6x5YYUL/lDfqaZOQY3/NuL3tGGxwqwExXQMFAPOo4=;
 b=sUNbXyCDOYZrMWHPvweICJGofJ2zytfq5ycbgkbCTuzw6pXF5teHpXKm6NLO35bMsJ
 cHnyEnoz/Mz9HRx2YuYEcVP/9QEPb6b68c/NNCvBedizG4eYMczdi8ws0rDYkSB9EKzI
 r7ZORou0eUsr3Au9qaKqNcADtlgdQEB/zawLoMCEH7LDHt6PtrdtB9VPtIk0Vo9j+EVI
 PRGVde8qJEjLHABVxB/XvLrYcoIEHALC+qEGNteT7TBko028frEq6mylBHztF8ZJHlkr
 5lL2GovIGHh2r38y2sIErqOPyr05p6vNsRFcXkXeajCqlBwwSGaQvnwjeTTFKITJylm5
 k8xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX44qw7JuzxvuVG4nHMd9KHfxTRoOBw96bvyjTZN+eX1gWuHS46Goj0m3aeJxkZlf8gZ35eDiTm7xDzMzDG+TjH5gP8wbI=
X-Gm-Message-State: AOJu0YzWxV7vfJCuZ2Xg8fG4DVv1sBIE2fKtwvTaonk1nUZetQstZwzr
 GyqMhP38Gnspnk0Io/2Lm7xkIHl4k7eXlNXtrmwGZTgg3LbBE8AXPvHYUauVYKk=
X-Google-Smtp-Source: AGHT+IFHmlCOLyDzgMs9n27eOyHn22NwhAbhtFCaEYhwZn0J1+DEzVbg5zOaQoLE2fRFmtdpJSawgQ==
X-Received: by 2002:a05:6a21:680b:b0:1ac:e07f:e3aa with SMTP id
 adf61e73a8af0-1afde1b7264mr2328560637.48.1715324022840; 
 Thu, 09 May 2024 23:53:42 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bf31a7asm25579175ad.140.2024.05.09.23.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 23:53:42 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Fea.Wang" <fea.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 4/5] target/riscv: Add MEDELEGH, HEDELEGH csrs for RV32
Date: Fri, 10 May 2024 14:58:54 +0800
Message-Id: <20240510065856.2436870-5-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240510065856.2436870-1-fea.wang@sifive.com>
References: <20240510065856.2436870-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=fea.wang@sifive.com; helo=mail-pf1-x42a.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Based on privileged spec 1.13, the RV32 needs to implement MEDELEGH
and HEDELEGH for exception codes 32-47 for reserving and exception codes
48-63 for custom use. Add the CSR number though the implementation is
just reading zero and writing ignore. Besides, for accessing HEDELEGH, it
should be controlled by mstateen0 'P1P13' bit.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
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
index d844ce770e..4d7313f456 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3227,6 +3227,33 @@ static RISCVException write_hedeleg(CPURISCVState *env, int csrno,
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
@@ -4674,6 +4701,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
 
     [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,
                           write_mstatush                                   },
+    [CSR_MEDELEGH]    = { "medelegh",   any32, read_zero, write_ignore,
+                          .min_priv_ver = PRIV_VERSION_1_13_0              },
+    [CSR_HEDELEGH]    = { "hedelegh",   any32, read_hedelegh, write_hedelegh,
+                          .min_priv_ver = PRIV_VERSION_1_13_0              },
 
     /* Machine Trap Handling */
     [CSR_MSCRATCH] = { "mscratch", any,  read_mscratch, write_mscratch,
-- 
2.34.1


