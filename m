Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4DFC47077
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 00:29:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rMzxI-0001Tc-N2; Mon, 08 Jan 2024 19:26:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rMzxG-0001Sk-Vc
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 19:26:54 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rMzxC-0001aU-GJ
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 19:26:53 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-204520717b3so1839430fac.0
 for <qemu-riscv@nongnu.org>; Mon, 08 Jan 2024 16:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704760009; x=1705364809;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BMnZ0K3fI2+fY94GIWe8LOsWCKtmeJVuoaCcNcFECq0=;
 b=Q8cECWHah1eFErbOqMH2Dmss4vDIPnSrGDyHgW+rUpj+Rh/M/GWWerbPds4RgfbIrY
 gfaszcFIhi/hhfWDiHw+sNiueqA2ofq/zs+bJwWj92efQMaGn8A4JnQ4dDnqAZTxw2Bw
 MDCJSCPMaAeBB3aAG43FezHiH38ViE0MBFXb9SCZmIDBu0+YmBl9HfFdNholw+R8C6UJ
 Iw3yzIEa4thsT/gOyWexpaA1K0xtD7GZKOvxo50OEjMF8ewdKkdz9WLgm0zawwu/5VWN
 +nRuO57tBdza5y/Juy7rKjlIU0QNHSvgDndM8elkVI87SCOHcQA+gR7Wc4ITNh57C2fY
 Ae+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704760009; x=1705364809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BMnZ0K3fI2+fY94GIWe8LOsWCKtmeJVuoaCcNcFECq0=;
 b=Tn/qqEd5HlApas4j+BHJTindWUotP3k/jPkRFknhKcS2UlR4hL4hrhcqveYPt15PJ3
 6rx25jlAC985tvFxZO3PYCmxrv5kK7gK1xW2sJgwD9LnzB4zPdhclEu0KQiwpAOX8v1H
 uW5J38erA2aqFJOVuN9cdeYyWbnpiQmLiC4hO3vwg+PJiBPm0AJESsnse0ivRexpK7Kd
 ZM/hGN5kHAHTiXAvAbZxbXtTRNytn/K9lE4zKfWw/7lwcZpm1/IpcVFFFJRWYydv++lH
 CVJ2edusJbpn2G0/WkpB0z1SMqUucm1HUWIEROcRUH4rOXapNHZTLYlx8NrNb1TWlwtR
 7fmQ==
X-Gm-Message-State: AOJu0YxNL7hw2PLQSXOBkibvR07EWzY0iGYQEFxjd9f4Ckri0nIkpOb5
 m1Zan63kaLfYeBB319aSosohrMqKI+rzXQ==
X-Google-Smtp-Source: AGHT+IFJDrQC3VVDRNy8V+Tq5gxeqAOO1bb0PVD2Hq7x5+Gmo7FcZK9nlwls6fdZwC7OopBHNq28qg==
X-Received: by 2002:a05:6870:a79f:b0:204:76d:dbe1 with SMTP id
 x31-20020a056870a79f00b00204076ddbe1mr5329798oao.61.1704760009192; 
 Mon, 08 Jan 2024 16:26:49 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 wp12-20020a056871a9cc00b002042cafdc52sm219917oab.2.2024.01.08.16.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 16:26:48 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: 
Cc: Kaiwen Xue <kaiwenx@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 kaiwenxue1@gmail.com
Subject: [PATCH v4 2/5] target/riscv: Add cycle & instret privilege mode
 filtering properties
Date: Mon,  8 Jan 2024 16:25:51 -0800
Message-Id: <20240109002554.646572-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109002554.646572-1-atishp@rivosinc.com>
References: <20240109002554.646572-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=atishp@rivosinc.com; helo=mail-oa1-x36.google.com
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

This adds the properties for ISA extension smcntrpmf. Patches
implementing it will follow.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
---
 target/riscv/cpu.c     | 2 ++
 target/riscv/cpu_cfg.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 83c7c0cf07be..501ae560ec29 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -144,6 +144,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
+    ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
     ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
@@ -1296,6 +1297,7 @@ const char *riscv_get_misa_ext_description(uint32_t bit)
 const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
+    MULTI_EXT_CFG_BOOL("smcntrpmf", ext_smcntrpmf, false),
     MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
     MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
     MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index f4605fb190b9..00c34fdd3209 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -72,6 +72,7 @@ struct RISCVCPUConfig {
     bool ext_zihpm;
     bool ext_smstateen;
     bool ext_sstc;
+    bool ext_smcntrpmf;
     bool ext_svadu;
     bool ext_svinval;
     bool ext_svnapot;
-- 
2.34.1


