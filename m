Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA649C5478C
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 18:53:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rfP24-0000mc-Bf; Wed, 28 Feb 2024 13:51:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rfP22-0000lT-Hg
 for qemu-riscv@nongnu.org; Wed, 28 Feb 2024 13:51:54 -0500
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rfP20-0006u9-3Q
 for qemu-riscv@nongnu.org; Wed, 28 Feb 2024 13:51:54 -0500
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-364f794f237so605405ab.1
 for <qemu-riscv@nongnu.org>; Wed, 28 Feb 2024 10:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709146310; x=1709751110;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=905pMmDAunh5nIsFS3DLPx4ZT1e5JqkKJba1GCgIYNc=;
 b=xO/0NnmQncXCIxU5RdHBj2QTTdWIqkekNexT/7ScDnRWsQZ5kavIQmxr+bVxaWuXj9
 wFMe0XGHnnVB7BRnLNUAqkaTME/sXsI+iBVTbSOL4Jqdx4bPXooHT2L6L7pWHnXz8iV2
 xYIBuxyncv6KzBHmSkq9Zs8hs4dpKymbXd1+q1CauerUY+cJLwBwVFUSuaw/ZP8SDdnO
 rgD6r70tjIHVSMLqUzzYwmbaxd9UF2aY2LU57iC9EsooLUINxhj+5yEdEk2oaxOf07oW
 jH9oftbKc1XfNe2szexfRn1YD763QdhpOR9ksj4CNeViSUVftxGKVAyPwP6vFYT5vZEl
 3b+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709146310; x=1709751110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=905pMmDAunh5nIsFS3DLPx4ZT1e5JqkKJba1GCgIYNc=;
 b=JU+6QtoIZHyyltRDQ4uV+h0R1dKa43uZJ9R+5q/NrkX6CgMtQPDZ2pfNNu9ClApry1
 pRZ3B9Drzw2wmRPSmNypSL3mVduIZvLPe9Vl+t1fZFJSZHu1oS55SiFzse7yc4OzDRtb
 FweLxTvwscUrgKnr0CyVMbaE8v8Ewtc4SOQ5PLcFmIvA5ZcX5W3LtywXNCAler3PpCC2
 1NNnCOzrQqOp3M8uXWprGz6ori7w5gBc4fwDGP7gGizLRHd6HPmhNh9AsSyyeIjSh6Ea
 2bBUzTSojj5oRiE8Ut//hwePQh3ekhwzZuftD6wTTTjP0d1ZeIYm3moEygB5JLKCnu6k
 KSvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw5mJPkL0ZWcGTiv+UNZQ4YgIwP3u0Xp6t/mtLdsIsx7NZ2j2BxEv79KGwDwQv11BVkrVjZyxuzSSAQuSa6yquYZ02nhI=
X-Gm-Message-State: AOJu0YwU7FsOYhXepekxEHDga1ThJw2eYf4zTi/XL7L+pbxQKYdiJbAR
 /gXP7QpzJ6kvqJ4vN9EL/Vjig1m/CrbEUzPi1Ckb60XwHKiYkl0gLTHGmwtwAjU=
X-Google-Smtp-Source: AGHT+IGOZPVwhrgVdVZalS9avQitXnwjafgOydkdsKjokZodMvmu4yNfuyyxZgRkXL4J93BFjOgfuw==
X-Received: by 2002:a92:dccd:0:b0:364:1b46:607d with SMTP id
 b13-20020a92dccd000000b003641b46607dmr149147ilr.5.1709146310506; 
 Wed, 28 Feb 2024 10:51:50 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a635d54000000b005dbed0ffb10sm49562pgm.83.2024.02.28.10.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 10:51:50 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: 
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 kaiwenxue1@gmail.com
Subject: [PATCH v5 2/5] target/riscv: Add cycle & instret privilege mode
 filtering properties
Date: Wed, 28 Feb 2024 10:51:13 -0800
Message-Id: <20240228185116.1321730-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228185116.1321730-1-atishp@rivosinc.com>
References: <20240228185116.1321730-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=atishp@rivosinc.com; helo=mail-il1-x12e.google.com
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
index 1b8d001d237f..f9d3c80597fc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -169,6 +169,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
+    ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
     ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
@@ -1447,6 +1448,7 @@ const char *riscv_get_misa_ext_description(uint32_t bit)
 const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
+    MULTI_EXT_CFG_BOOL("smcntrpmf", ext_smcntrpmf, false),
     MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
     MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
     MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 833bf5821708..0828841445c5 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -73,6 +73,7 @@ struct RISCVCPUConfig {
     bool ext_zihpm;
     bool ext_smstateen;
     bool ext_sstc;
+    bool ext_smcntrpmf;
     bool ext_svadu;
     bool ext_svinval;
     bool ext_svnapot;
-- 
2.34.1


