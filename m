Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C212C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 00:50:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rJ14R-00079Q-Gn; Thu, 28 Dec 2023 19:49:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rJ14K-000746-Cv
 for qemu-riscv@nongnu.org; Thu, 28 Dec 2023 19:49:44 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rJ14H-0003Xy-Ss
 for qemu-riscv@nongnu.org; Thu, 28 Dec 2023 19:49:43 -0500
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3bbc5636b8eso1069304b6e.2
 for <qemu-riscv@nongnu.org>; Thu, 28 Dec 2023 16:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703810980; x=1704415780;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AVDVq7i2S5ZvAV5+/0uStEZfRYh+joB7RC2I6xYSmWs=;
 b=pLEklrLMcGH4kA7Rg3InuPLfFmWVtoY/E+ML65js05ds9ZPx+gaVkiXqofR7HEKyw0
 i51aODLzO8rBmrHeI9aAunKPpECBhoZDlDF5RUkjIYMA+YXQeIMINqtgEf+6LHI4f+DK
 u8GJZamnpGHUrchYdjSNFNjYK3U9w+/K9zZYGX70jzFML9gqjfZ2HiMOHGNuikdfqTh2
 kC6rTYCWsuyUIqOi4SyA6uLJ+eRzNPokdXU4BiBDebDb7HRAg//k6yO5aKPGFr84CV/L
 zBKZPsNPtTzKKb+u2nw6adrEujNhMbds4afBbkcjZoBhK3P1TBTcUqU62k4XwBNiaJlu
 Ww8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703810980; x=1704415780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AVDVq7i2S5ZvAV5+/0uStEZfRYh+joB7RC2I6xYSmWs=;
 b=BhjjTkZ9BpRFHiS8JJ5u8h4rZtUm7QyBfsFdoaLRTzvJC1L5K3lzFommEmxQhdGuub
 LeOgw3Bz8aXA7To7aaWJZQqr7pnYzVWTGv+BORPr5ryQSy87rJUDszRw4F0dlkbZk/Ly
 1yvXcDVnpHTDqGPX/WX7YZt9bNCTboXk/nRepqYfDpfDB8dcIoGd5MIJZ6ULQ5LQtoLB
 esz5EGSMOcG0D4qcai4RoCzbw2O2kYT1CT2CHSw+2pXFIGpfjcEgCmqXyiNKlsXx9N7H
 6mm/X7A4imunREJEKht9Rc6ich8JJ1H0YVFkUREwE0T36aRwd78NIF1O3sEwkUfI+eJ8
 N5/Q==
X-Gm-Message-State: AOJu0YzEUpty36TJb4VYAlbeKQ3bZap5483Wi7Lr67YTnV0rbV45ZGw2
 SEDNKG4z6FFPe2vdfpQIW941s4bwdPhOrA==
X-Google-Smtp-Source: AGHT+IHWb9ejX4nvJMZdiv+nytwJIMdIVj9026wj8WCQ11QoIxppgyIV+Hh28xeMB/3hSSYLmoEDtg==
X-Received: by 2002:a05:6870:3b1b:b0:1fb:75b:2b87 with SMTP id
 gh27-20020a0568703b1b00b001fb075b2b87mr6338096oab.67.1703810980436; 
 Thu, 28 Dec 2023 16:49:40 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 ms25-20020a0568706b9900b0020463640518sm2636007oab.14.2023.12.28.16.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Dec 2023 16:49:40 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, kaiwenxue1@gmail.com
Subject: [v2 2/5] target/riscv: Add cycle & instret privilege mode filtering
 properties
Date: Thu, 28 Dec 2023 16:49:26 -0800
Message-Id: <20231229004929.3842055-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229004929.3842055-1-atishp@rivosinc.com>
References: <20231229004929.3842055-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=atishp@rivosinc.com; helo=mail-oi1-x22c.google.com
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
 target/riscv/cpu.c     | 3 ++-
 target/riscv/cpu_cfg.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 83c7c0cf07be..da3f05cd5373 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -148,6 +148,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
+    ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
     ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
     ISA_EXT_DATA_ENTRY(svadu, PRIV_VERSION_1_12_0, ext_svadu),
     ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
@@ -1296,6 +1297,7 @@ const char *riscv_get_misa_ext_description(uint32_t bit)
 const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
+    DEFINE_PROP_BOOL("smcntrpmf", RISCVCPU, cfg.ext_smcntrpmf, false),
     MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
     MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
     MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
@@ -1308,7 +1310,6 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("zve64f", ext_zve64f, false),
     MULTI_EXT_CFG_BOOL("zve64d", ext_zve64d, false),
     MULTI_EXT_CFG_BOOL("sstc", ext_sstc, true),
-
     MULTI_EXT_CFG_BOOL("smepmp", ext_smepmp, false),
     MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
     MULTI_EXT_CFG_BOOL("svadu", ext_svadu, true),
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


