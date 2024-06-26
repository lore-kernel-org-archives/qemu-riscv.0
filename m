Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DBDC27C4F
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 00:01:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sMcWD-0007jq-QS; Wed, 26 Jun 2024 19:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sMcWC-0007j2-Au
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2024 19:57:40 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sMcWA-0005Vv-Nt
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2024 19:57:40 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-7226821ad86so1813736a12.2
 for <qemu-riscv@nongnu.org>; Wed, 26 Jun 2024 16:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719446257; x=1720051057;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Dcs/5wo8w4jnpox/cnnAoXBeRu2+A0hvbvgwT7rlU+A=;
 b=OrQq6U1B3K7LKajzjyB63Vjwp7IP6YB5XD4T1D9QRmF8sHXtpYW71yBaJDs96K04BM
 P4RP1PsAwpkm3P6cLk3Sj4kIYaLTw/OEdFk1RMYd55fLNrKVr2ZpDSUuLLG0EmQTA/pX
 h7T8Rkh9G/xbCr26MdLsqMrjLTpymv/71LbSMlHhDIu318WVOVh1iHxalz8gQ51sA2xD
 PNRRkbGRbNse6Vuj6GZ2qGmgtqSl3vXeF5DMXH9WCZh8mTKtwJac+gMBTk0G7VlmIVR4
 QVL1kmueRjf21LHqEPKvRA1+9typ8YrdyQz2Wsxx2ZRQjD2RFu3adZdX5oqcaZeMcrgT
 l08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719446257; x=1720051057;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dcs/5wo8w4jnpox/cnnAoXBeRu2+A0hvbvgwT7rlU+A=;
 b=IKwlcFoKxP7GD/FZrIdaCwBL10TFGnwFHCRcxoaZ1vW/277oBIBENEH7aJux5NWhNt
 rxAN5FbZFi6XeaG76UGX+wWTRmzukfFwh3x0Jnr9YEH2KGvzAhQcyxLJHkwQTDwu87kN
 XPOO538fZYam9imyRg7dnMTe7fySFsRYATNT97/gRLpDO5S/o0XgjwuUy2HpOn8S2uGk
 5p1GbHgTMhdMAehYtpHLpXdRWHPRqKC4qyMEWyvFBbVSc3rERYuzq74lzXkfgnEDV9ob
 GIe9IuTkvBeUnCZoxIVo96HnWi9bPAVylF7k3qaKySCFWdQawR6Dj41gWIPnIgD9+G24
 LquA==
X-Gm-Message-State: AOJu0YzCpoSUhgo7+RqHAIzw5ohzCUkOifTklq1HbEIdNFGGncz6cedo
 mU1JkzflTzPZoIe1eC7wTV78G/3R800Em3MM/NIqozYC6JCBT719vVv0b+5Zrv6zUmhATkeYt9S
 M
X-Google-Smtp-Source: AGHT+IEWRy4DnBkR5f3gYjIQegvcvcObv3OJLffac97wKDkQO1vWxSgTZQVFBjy8xCGJvGeEk2sWmg==
X-Received: by 2002:a05:6a20:3d8a:b0:1bd:6c3:9cfc with SMTP id
 adf61e73a8af0-1bd06c39d89mr12374189637.54.1719446256943; 
 Wed, 26 Jun 2024 16:57:36 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1faac998398sm630965ad.225.2024.06.26.16.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 16:57:36 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 26 Jun 2024 16:57:23 -0700
Subject: [PATCH v7 03/11] target/riscv: Add cycle & instret privilege mode
 filtering properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-smcntrpmf_v7-v7-3-bb0f10af7fa9@rivosinc.com>
References: <20240626-smcntrpmf_v7-v7-0-bb0f10af7fa9@rivosinc.com>
In-Reply-To: <20240626-smcntrpmf_v7-v7-0-bb0f10af7fa9@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>, 
 Atish Patra <atishp@rivosinc.com>, palmer@dabbelt.com, liwei1518@gmail.com, 
 zhiwei_liu@linux.alibaba.com, bin.meng@windriver.com, 
 dbarboza@ventanamicro.com, alistair.francis@wdc.com, 
 Kaiwen Xue <kaiwenx@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x536.google.com
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
index 4760cb2cc17f..ef50130a91e7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -178,6 +178,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
+    ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
     ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
@@ -1467,6 +1468,7 @@ const char *riscv_get_misa_ext_description(uint32_t bit)
 const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
+    MULTI_EXT_CFG_BOOL("smcntrpmf", ext_smcntrpmf, false),
     MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
     MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
     MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index fb7eebde523b..b1376beb1dab 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -74,6 +74,7 @@ struct RISCVCPUConfig {
     bool ext_ztso;
     bool ext_smstateen;
     bool ext_sstc;
+    bool ext_smcntrpmf;
     bool ext_svadu;
     bool ext_svinval;
     bool ext_svnapot;

-- 
2.34.1


