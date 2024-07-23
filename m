Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F3CC3DA49
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 23:30:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sWOxr-00024B-32; Tue, 23 Jul 2024 19:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sWOxa-00020K-Ow
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2024 19:30:22 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sWOxX-0007nN-Vh
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2024 19:30:22 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2cb63ceff6dso3352288a91.1
 for <qemu-riscv@nongnu.org>; Tue, 23 Jul 2024 16:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721777417; x=1722382217;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lNRGvwJvd6a6G7pngvPVFSLDlElUvvSu62TJByB++KY=;
 b=S95pfgR6z4BcF3q9Fg8PDl8MQZCuGqvMNJVjcUi4VUx0LVQbTx/24yY6etmWo25Yz7
 0K4e7IuJrr5wO05CRghN4cBb+bBsMh4wnOIuv+E6Ba3/71zu0yCswfLyYtlmLcZuccb5
 oxRWSoT5j4EZS/iYYDr2tObchdr/i0uFXqfEplklJvwqglQXDJwLFozyuurq777q00ym
 xuBCxvaWpqDwLuvxcKS+lPSBY9iVNqiLlmM0ef9nRcMGms9GLo3nF+42U7QtQf/nSlHc
 4NigQT+Zlv6zIkY9GRksjw89ZzzelbFrXNZdiotrVQz+URKG4gO+C5cLg9UUpNW/XaYP
 PH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721777417; x=1722382217;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lNRGvwJvd6a6G7pngvPVFSLDlElUvvSu62TJByB++KY=;
 b=ndZ5OHZh7sBAfbj5g60iAfyGWyZtbk6xrXDoRuTHr1D+AQT7BOlXwI3pufcaSeEWx1
 D54qFfmoznAkCBTZmF5q8W3MaG+P101HJ9EEfTL9f+mso0M5xYIFetN2ItwMf57uF/6e
 U8YrfaHQcz0MlxUAD++blbi+Y/Brfe9lxvxh3UHguvLQy2qGyMMo0mtJ5sz7gFMq9ptX
 NuSrpBHlA5WX3/+hLz2+4Ww4wleVwIi6WRIDZwCCvlEyXEBrA1VPrkEarCbedwAajgrK
 OxkA7MovZ+YDUmdhrW6vylV8t5Lcbwem2+RTzHsG1RBLt6q4PHiYjf6KudZboPjUcrgl
 t9IQ==
X-Gm-Message-State: AOJu0Yyb61R8tz2y1jLSIYsCJ4C0ubfUimzMRwHjoyXmPDSaogTmYTiR
 QNo8SKVllQTH3XEHK2OtkwQZ8xqS9OveGY9DGQHAuHlyulqnDLc/ESBXWEdTJps=
X-Google-Smtp-Source: AGHT+IF1w8noqVocF3lV+ZJLzFoeKSDfbDj1N65r4YOPVLI1PEnkezhMXL/JyxsvzL5DhFsShYmkyA==
X-Received: by 2002:a17:90a:f10a:b0:2c8:f3b4:425 with SMTP id
 98e67ed59e1d1-2cdb515ea88mr613216a91.23.1721777417650; 
 Tue, 23 Jul 2024 16:30:17 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cdb74e894csm179217a91.41.2024.07.23.16.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 16:30:16 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 23 Jul 2024 16:29:58 -0700
Subject: [PATCH v2 01/13] target/riscv: Add properties for Indirect CSR
 Access extension
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240723-counter_delegation-v2-1-c4170a5348ca@rivosinc.com>
References: <20240723-counter_delegation-v2-0-c4170a5348ca@rivosinc.com>
In-Reply-To: <20240723-counter_delegation-v2-0-c4170a5348ca@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This adds the properties for sxcsrind. Definitions of new registers and
implementations will come with future patches.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
---
 target/riscv/cpu.c     | 2 ++
 target/riscv/cpu_cfg.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a90808a3bace..ebc19090b40d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -183,12 +183,14 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
     ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
+    ISA_EXT_DATA_ENTRY(smcsrind, PRIV_VERSION_1_12_0, ext_smcsrind),
     ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(ssccptr, PRIV_VERSION_1_11_0, has_priv_1_11),
     ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
     ISA_EXT_DATA_ENTRY(sscounterenw, PRIV_VERSION_1_12_0, has_priv_1_12),
+    ISA_EXT_DATA_ENTRY(sscsrind, PRIV_VERSION_1_12_0, ext_sscsrind),
     ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
     ISA_EXT_DATA_ENTRY(sstvala, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(sstvecd, PRIV_VERSION_1_12_0, has_priv_1_12),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 8b272fb826ef..b8a5174bc871 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -77,6 +77,8 @@ struct RISCVCPUConfig {
     bool ext_smstateen;
     bool ext_sstc;
     bool ext_smcntrpmf;
+    bool ext_smcsrind;
+    bool ext_sscsrind;
     bool ext_svadu;
     bool ext_svinval;
     bool ext_svnapot;

-- 
2.34.1


