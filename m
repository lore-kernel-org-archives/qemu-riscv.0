Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD62C5321E
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 15:30:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sibfd-00086R-2g; Mon, 26 Aug 2024 11:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sibfb-00084x-NU
 for qemu-riscv@nongnu.org; Mon, 26 Aug 2024 11:30:15 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sibfZ-0003bY-Lr
 for qemu-riscv@nongnu.org; Mon, 26 Aug 2024 11:30:15 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-7141b04e7a3so3642442b3a.3
 for <qemu-riscv@nongnu.org>; Mon, 26 Aug 2024 08:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724686212; x=1725291012;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/xTvsa+ViAqHINj5oJb/iz6qO9j2BBr+FG4wAjwt7ac=;
 b=l2pnxELVSFt7Wn4v13X6dOR4Lw8kR4P2bvPMPZbIWUaKIKSUCsknz+ICd6dE/Js5Ke
 /Ji8MJx9vPcky5QMXB7jpCbK1xrahAsVQLrxWDHkloZ7IZOtLWuhbwtw5Nipo7R7yEs8
 se8YVTBSGxwoURtBHk4dfW5II8W5RLu0mTkiHSFJKWDuvKChuv1MaLanll5HAGzeodQc
 CDgKUNSNzolschT+F/h5PizMRTQcgWtBM3ZdNedFHK8PI9qzOpxxCwALfAIFJvSnnz4C
 dY5nxuuor6JlVwCXkCPDZOsF/5bTf3blxciWRsaQ9+OECbxQ5SwP39OnEZ+iHjeo43MM
 0P2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724686212; x=1725291012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/xTvsa+ViAqHINj5oJb/iz6qO9j2BBr+FG4wAjwt7ac=;
 b=iBOI/8lCYAC1f+1vHPyGZevF5I7yT7rTS1EsvnbaM5f5gwxWkLW689ZgxtllN8xL+7
 Vh2qNa7F7T/9xs0Kigi/ueveCTaf5KoivLjesAA85KMXwZnYs/0FvzR7W/E2HD1AQTOi
 8YbWIm638X19mFkpxQSQ+hOJqYDKnNxcGjR6/KqZrxfXjogIGc2u8e2liWIGwQiDSunN
 PsKzUD9hKTkTc6cfz++HZU14euc89Vi04LfCnUozNMDFFpPQm050V/4H0ewRWoKltrFo
 jOXmWzp3GPN3kgj+JThIei6VTN90JXZmjnp/5tN9A84Yq2gSrDwjDQqXq9Jh7mH8T8A6
 jMeg==
X-Gm-Message-State: AOJu0Ywawd4HacB643o9+tgB1LBSp+I6SRVNYa0KgL4wDq3DAD3tYh2g
 4zPTH/tje32OQPtHycSUYQruY8bZWwvyGoGjFOmEOWgWV39KA2ToXdCG3Mny5XzqcimkFQD5mWo
 B
X-Google-Smtp-Source: AGHT+IGXZOD7lUonxiusPhafAwxJOXgJrPe/DG7AJ19264w8bUDd0a5Ps6ejf+fZRFPnoLlpUrw6WQ==
X-Received: by 2002:a05:6a21:e591:b0:1c0:e46a:1643 with SMTP id
 adf61e73a8af0-1cc89dd1588mr12856982637.31.1724686211705; 
 Mon, 26 Aug 2024 08:30:11 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7143422eaabsm7396525b3a.12.2024.08.26.08.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 08:30:11 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 richard.henderson@linaro.org, kito.cheng@sifive.com,
 Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v9 01/17] target/riscv: Add zicfilp extension
Date: Mon, 26 Aug 2024 08:29:33 -0700
Message-ID: <20240826152949.294506-2-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240826152949.294506-1-debug@rivosinc.com>
References: <20240826152949.294506-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=debug@rivosinc.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

zicfilp [1] riscv cpu extension enables forward control flow integrity.
If enabled, all indirect calls must land on a landing pad instruction.

This patch sets up space for zicfilp extension in cpuconfig. zicfilp
is dependend on zicsr.

[1] - https://github.com/riscv/riscv-cfi

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Co-developed-by: Jim Shu <jim.shu@sifive.com>
Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
---
 target/riscv/cpu.c         | 2 ++
 target/riscv/cpu_cfg.h     | 1 +
 target/riscv/tcg/tcg-cpu.c | 5 +++++
 3 files changed, 8 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 33ef4eb795..5dfb3f39ab 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -106,6 +106,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(ziccif, PRIV_VERSION_1_11_0, has_priv_1_11),
     ISA_EXT_DATA_ENTRY(zicclsm, PRIV_VERSION_1_11_0, has_priv_1_11),
     ISA_EXT_DATA_ENTRY(ziccrse, PRIV_VERSION_1_11_0, has_priv_1_11),
+    ISA_EXT_DATA_ENTRY(zicfilp, PRIV_VERSION_1_12_0, ext_zicfilp),
     ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
     ISA_EXT_DATA_ENTRY(zicntr, PRIV_VERSION_1_12_0, ext_zicntr),
     ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_zicsr),
@@ -1472,6 +1473,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
     MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
+    MULTI_EXT_CFG_BOOL("zicfilp", ext_zicfilp, false),
     MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
     MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
     MULTI_EXT_CFG_BOOL("zihintpause", ext_zihintpause, true),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 120905a254..88d5defbb5 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -67,6 +67,7 @@ struct RISCVCPUConfig {
     bool ext_zicbom;
     bool ext_zicbop;
     bool ext_zicboz;
+    bool ext_zicfilp;
     bool ext_zicond;
     bool ext_zihintntl;
     bool ext_zihintpause;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index b8814ab753..ed19586c9d 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -623,6 +623,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->pmu_avail_ctrs = 0;
     }
 
+    if (cpu->cfg.ext_zicfilp && !cpu->cfg.ext_zicsr) {
+        error_setg(errp, "zicfilp extension requires zicsr extension");
+        return;
+    }
+
     /*
      * Disable isa extensions based on priv spec after we
      * validated and set everything we need.
-- 
2.44.0


