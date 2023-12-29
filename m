Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95282C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 00:51:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rJ14W-0007Ah-86; Thu, 28 Dec 2023 19:49:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rJ14N-000765-9h
 for qemu-riscv@nongnu.org; Thu, 28 Dec 2023 19:49:47 -0500
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rJ14K-0003Yo-Hy
 for qemu-riscv@nongnu.org; Thu, 28 Dec 2023 19:49:47 -0500
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1f055438492so4829289fac.3
 for <qemu-riscv@nongnu.org>; Thu, 28 Dec 2023 16:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703810983; x=1704415783;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RMkfNrfu3BNKw2loqhAx42IyUfatsJHkamEf6PqwbN8=;
 b=tP4juECapUT4ERK7D1Ss0/FkPVnSjXNCKJ6vw3wUsf2Wha50kZGNdMv9zO2nwia/jt
 C906HUgDFd9QnR9Fo/b2TAxSLhVZhnCPAOxTp9lPiMwQBUCJw/3BRPswX+Ztjyi6XvpE
 9yUDkGeicpZr6f6pH7cJ3aEL2vft7ksq6Uz7ETNSuXlgnp1KKhFKkqFLsBqj+G8/bxaX
 zL/Uu6kAcdXfWMvF82eqhgqrKeDxsKsLT7n82QOPgJLA7C+eiC9fqsQpXdcpLQZzhvYd
 VeO6Qx11LbB5aA9G3FVOIeAOguTzOdyNP+4XFmaaQ6DPjRGlbpT/2D2kBkpV8SCx1Fhb
 nz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703810983; x=1704415783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RMkfNrfu3BNKw2loqhAx42IyUfatsJHkamEf6PqwbN8=;
 b=aPs0RSxeJ7AOq9SwoTwCRuz9Ck7+0Z/ZYAxmmHbKJShqg7NWybFWYdxm3uvQwf6bxc
 JuqoE8nU3FSYgDikYJfasVarUfIWlOQC1jTd9n9PDY/ZMowmD/nzOc2ekzXAxZKZiQIb
 ElNimAHYgp5ipOktuZIP9qRsIdGP+AFN/EHCrPWoACDPL6PaVc0aj76r5o3oKFgNxL+q
 VIxgvGakH5VEaj46dK/7tWgIuuA2DnToefIocUooiQ1aQKnIpO0quSZPVn9bsOwTjRS7
 Yt29c1E8ucmF3tf1SYK7Nl+9lWfslFZL/EvT9Ep9N6d8/kIudF4ZoNcQ+CVV1mEg+L/9
 dW6g==
X-Gm-Message-State: AOJu0Yw3/fS7zt0HPn1aILCz02rEJWTjqTwtQbL7V9pmI4c2qyMbf/CG
 r71/jHC2iNFv2nq+ullLBLLdTnz0Yb2llw==
X-Google-Smtp-Source: AGHT+IESfxvG0hyWuhfrVeEknOiYltMDC7AvZekIdengdxZDKtW9wM91p/aHZDn5TeogIWr1it8Ytg==
X-Received: by 2002:a05:6870:e2d4:b0:204:427d:7fd6 with SMTP id
 w20-20020a056870e2d400b00204427d7fd6mr12591915oad.33.1703810983428; 
 Thu, 28 Dec 2023 16:49:43 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 ms25-20020a0568706b9900b0020463640518sm2636007oab.14.2023.12.28.16.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Dec 2023 16:49:43 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, kaiwenxue1@gmail.com
Subject: [v2 4/5] target/riscv: Add cycle & instret privilege mode filtering
 support
Date: Thu, 28 Dec 2023 16:49:28 -0800
Message-Id: <20231229004929.3842055-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229004929.3842055-1-atishp@rivosinc.com>
References: <20231229004929.3842055-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=atishp@rivosinc.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Kaiwen Xue <kaiwenx@rivosinc.com>

QEMU only calculates dummy cycles and instructions, so there is no
actual means to stop the icount in QEMU. Hence this patch merely adds
the functionality of accessing the cfg registers, and cause no actual
effects on the counting of cycle and instret counters.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
---
 target/riscv/cpu.c |  1 +
 target/riscv/csr.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 54395f95b299..d24f7ff8b55b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1297,6 +1297,7 @@ const char *riscv_get_misa_ext_description(uint32_t bit)
 const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
+    MULTI_EXT_CFG_BOOL("smcntrpmf", ext_smcntrpmf, false),
     MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
     MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
     MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 283468bbc652..618e801a7612 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -233,6 +233,27 @@ static RISCVException sscofpmf_32(CPURISCVState *env, int csrno)
     return sscofpmf(env, csrno);
 }
 
+static RISCVException smcntrpmf(CPURISCVState *env, int csrno)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+
+    if (!cpu->cfg.ext_smcntrpmf) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException smcntrpmf_32(CPURISCVState *env, int csrno)
+{
+    if (riscv_cpu_mxl(env) != MXL_RV32) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return smcntrpmf(env, csrno);
+}
+
+
 static RISCVException any(CPURISCVState *env, int csrno)
 {
     return RISCV_EXCP_NONE;
@@ -818,6 +839,54 @@ static int read_hpmcounterh(CPURISCVState *env, int csrno, target_ulong *val)
 
 #else /* CONFIG_USER_ONLY */
 
+static int read_mcyclecfg(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mcyclecfg;
+    return RISCV_EXCP_NONE;
+}
+
+static int write_mcyclecfg(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mcyclecfg = val;
+    return RISCV_EXCP_NONE;
+}
+
+static int read_mcyclecfgh(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mcyclecfgh;
+    return RISCV_EXCP_NONE;
+}
+
+static int write_mcyclecfgh(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mcyclecfgh = val;
+    return RISCV_EXCP_NONE;
+}
+
+static int read_minstretcfg(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->minstretcfg;
+    return RISCV_EXCP_NONE;
+}
+
+static int write_minstretcfg(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->minstretcfg = val;
+    return RISCV_EXCP_NONE;
+}
+
+static int read_minstretcfgh(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->minstretcfgh;
+    return RISCV_EXCP_NONE;
+}
+
+static int write_minstretcfgh(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->minstretcfgh = val;
+    return RISCV_EXCP_NONE;
+}
+
 static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong *val)
 {
     int evt_index = csrno - CSR_MCOUNTINHIBIT;
@@ -4922,6 +4991,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                              write_mcountinhibit,
                              .min_priv_ver = PRIV_VERSION_1_11_0       },
 
+    [CSR_MCYCLECFG]      = { "mcyclecfg",   smcntrpmf, read_mcyclecfg,
+                             write_mcyclecfg,
+                             .min_priv_ver = PRIV_VERSION_1_12_0       },
+    [CSR_MINSTRETCFG]    = { "minstretcfg", smcntrpmf, read_minstretcfg,
+                             write_minstretcfg,
+                             .min_priv_ver = PRIV_VERSION_1_12_0       },
+
     [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_mhpmevent,
                              write_mhpmevent                           },
     [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_mhpmevent,
@@ -4981,6 +5057,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MHPMEVENT31]    = { "mhpmevent31",    any,    read_mhpmevent,
                              write_mhpmevent                           },
 
+    [CSR_MCYCLECFGH]     = { "mcyclecfgh",   smcntrpmf_32, read_mcyclecfgh,
+                             write_mcyclecfgh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
+    [CSR_MINSTRETCFGH]   = { "minstretcfgh", smcntrpmf_32, read_minstretcfgh,
+                             write_minstretcfgh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
+
     [CSR_MHPMEVENT3H]    = { "mhpmevent3h",    sscofpmf_32,  read_mhpmeventh,
                              write_mhpmeventh,
                              .min_priv_ver = PRIV_VERSION_1_12_0        },
-- 
2.34.1


