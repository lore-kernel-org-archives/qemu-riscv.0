Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE2FC3DA49
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 23:31:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sWOyJ-0003qu-9T; Tue, 23 Jul 2024 19:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sWOxr-00029d-Vi
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2024 19:30:41 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sWOxo-0007ws-01
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2024 19:30:39 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-70d1d818c42so1880617b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 23 Jul 2024 16:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721777429; x=1722382229;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fzpl2FDaqQI90Wgs2VAECd6YBhDpt1N/LBc0wkqE4+E=;
 b=bAHZWqWnN1FcfROYNmkrw/jtSbsqy2nZ0siQGnk+Qc3wOCHCNF2U3CUQZap8I2QVMs
 +LtXIMz3sHKd6VQg3UcwZYJZmxHGb1dtAc8GzCq5xzsOkpkjuagL93TsrdOExOpjH9gV
 2QhUxpAB2vJXAPJ8RZ/sgDoLfBUWf/Ahkvgkk/htzavp+BLxeSLEbdGdGZSxKUT0uqbo
 cHyPI8+rvpGSIZaPAPC6A+9brJQOh9+pc+/OpP7zRJzZ5NqUe5q+shiMTADeCRIUiSbQ
 aN94a1Dw+HTv0Zsq4g0WnsOZf/fMDPAFd58OsYaMXAdgwNo9ssE1LGZHLyN7AapryfT5
 jtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721777429; x=1722382229;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fzpl2FDaqQI90Wgs2VAECd6YBhDpt1N/LBc0wkqE4+E=;
 b=gtiZq8hK7EwsbTISYPbpge7YeABuiEIXxGqp6r/hKfRgPeEmlVGTTh6nh28Mf4jju7
 phemXHWQYGjspK9CIebzmMDjT4oC9e5ny6QzeuGlB72GYMKw5w5ldPhSachO42+ifkf4
 wd1QcBPUenpdjJKFfFGc80nV1VGTCVmqOfWZyRXPbHfWC1KQG0sgVMZFIiuuOOnVs4eq
 arSz/Gfjy9HGXNHf2p9TtHrnzN9Hmeo57x18v3slU8gs/N3BkSeGpdzRurzGXJSyBDDt
 TX0qGM1ln4Jnx7Qt+uy2t7EgPSgA9jzQdii2qvTABrBMIqtEAfWgtoE7bE0O5BxENZGF
 QP1g==
X-Gm-Message-State: AOJu0Yy3fZ/EDf9uc2wTxky+BOkeNpMv8yVzHoXqsdDLbYVv0/LwZTQO
 8DnUEcwU0/j4GTFQ5RxJimc04vG7I4CdzuvMei1MyjJTHroaAIZjbc9d4u+3iOU=
X-Google-Smtp-Source: AGHT+IH0NWVEl40As2AO92BFslELDwbnckmlPe6E/sFRyPxqj/0QZptSc68983+kEZoJL52gCPSmBw==
X-Received: by 2002:a05:6a21:9688:b0:1c0:f5be:a3ca with SMTP id
 adf61e73a8af0-1c461972facmr603979637.30.1721777428792; 
 Tue, 23 Jul 2024 16:30:28 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cdb74e894csm179217a91.41.2024.07.23.16.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 16:30:27 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 23 Jul 2024 16:30:05 -0700
Subject: [PATCH v2 08/13] target/riscv: Add configuration for S[m|s]csrind,
 Smcdeleg/Ssccfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240723-counter_delegation-v2-8-c4170a5348ca@rivosinc.com>
References: <20240723-counter_delegation-v2-0-c4170a5348ca@rivosinc.com>
In-Reply-To: <20240723-counter_delegation-v2-0-c4170a5348ca@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Add configuration options so that they can be enabled/disabld from
qemu commandline.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ac2dce734d80..1731dc461376 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1477,6 +1477,10 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
     MULTI_EXT_CFG_BOOL("smcntrpmf", ext_smcntrpmf, false),
+    MULTI_EXT_CFG_BOOL("smcsrind", ext_smcsrind, false),
+    MULTI_EXT_CFG_BOOL("smcdeleg", ext_smcdeleg, false),
+    MULTI_EXT_CFG_BOOL("sscsrind", ext_sscsrind, false),
+    MULTI_EXT_CFG_BOOL("ssccfg", ext_ssccfg, false),
     MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
     MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
     MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),

-- 
2.34.1


