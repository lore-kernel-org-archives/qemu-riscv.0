Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9685AC47258
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 11:11:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rSEgF-0003Ar-Sb; Tue, 23 Jan 2024 06:10:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rSEfz-0002qw-KN
 for qemu-riscv@nongnu.org; Tue, 23 Jan 2024 06:10:45 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rSEfw-0004Nh-59
 for qemu-riscv@nongnu.org; Tue, 23 Jan 2024 06:10:42 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-338aca547d9so3308865f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 23 Jan 2024 03:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706008235; x=1706613035;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a6UoAAKm1BSVru2djWDEvJDwpv7xKurDJDJjWffjIbA=;
 b=DcAkNhnYQUEA1KZukWTKB3AmzF7Zj8nqeFywO0L5/Fa3MSZtmpCVIdVVVIZnUvyVlO
 7J3z43vT4LfsMhBcLsNRxSzY0woANDtoMeFwmxsmWKa3lvni7RB+sIPD8x3j6ZNo/3Va
 m65rQtr9lV61Hb4WYViMlK5fppuOIkoLHSB5or2oqAK2IIqkVLZHvwVrmX51P4epQuuY
 E9he1lYJPuL9uKrT5J/KodpIshmfwvAfkYdFdjBN3ZQnu1hfm0cKSRE83t4hEJCwB7fV
 Sy6gey1JsVzF3aZf+XrLG//Jl7v6Hxf+GcxLhbC6FZMPQ5P3/P5eHTE8AVp7Z6z/Ia14
 +sHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706008235; x=1706613035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a6UoAAKm1BSVru2djWDEvJDwpv7xKurDJDJjWffjIbA=;
 b=MnGONBY98QK1pVb8EjKLXWsFLNAtDWmgX7Z3nW3mRvfRmhVm5cui0pyh1b44zPeHji
 qMz9sYvxOzhxBenTCexghh6WB8hkYzFcQZD/q6BbzhTYqrh56Pwftg3oBLy3mKi1DOHy
 KcjeTRxTEuMDBsJsAmsp0aeu8AryLg6Dgsvg95guNl+3VI8Hyk3vwDu67FxDEgk3atHb
 tehjK26YsCZry0Jjg3dwDCD/PuEXTZIUa89TlPQVvrlkObudmzOPOKSEKy2DLr3mFsMc
 d9duQKgYGNA/BXuBuG+RdGycl1UleyKa1/V/OaI9B2Ll5bLL8EMrhZvHUwxttv0RWBcx
 Nrcg==
X-Gm-Message-State: AOJu0YwJY9jPOrhejE4WlDAaRNBWfJLWTr85+0hESqAbjZgTPs4TJ5UI
 CWNaMoWNQfhA7i9v2GcRCcyCW+DqtzZwcIRpjCu9KwKSylihesAOFwmVK+Ami4w=
X-Google-Smtp-Source: AGHT+IGXQ9R9gZGixdo57qdApxgwlFBEkkow5z3BRcUSXlogUwHnrwj53SC89qJ6MRyFXrZrKKC5ow==
X-Received: by 2002:a05:6000:108a:b0:337:bfd9:bd48 with SMTP id
 y10-20020a056000108a00b00337bfd9bd48mr1568534wrw.62.1706008235559; 
 Tue, 23 Jan 2024 03:10:35 -0800 (PST)
Received: from rockhopper.. (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a5d4c4f000000b00337d6f0013esm12288013wrt.107.2024.01.23.03.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 03:10:35 -0800 (PST)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH v3 3/3] target/riscv: Expose Zaamo and Zalrsc extensions
Date: Tue, 23 Jan 2024 11:10:30 +0000
Message-ID: <20240123111030.15074-4-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123111030.15074-1-rbradford@rivosinc.com>
References: <20240123111030.15074-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=rbradford@rivosinc.com; helo=mail-wr1-x432.google.com
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

Expose the newly added extensions to the guest and allow their control
through the CPU properties.

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
---
 target/riscv/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8d3ec74a1c..604baf53c8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -103,7 +103,9 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause),
     ISA_EXT_DATA_ENTRY(zihpm, PRIV_VERSION_1_12_0, ext_zihpm),
     ISA_EXT_DATA_ENTRY(zmmul, PRIV_VERSION_1_12_0, ext_zmmul),
+    ISA_EXT_DATA_ENTRY(zaamo, PRIV_VERSION_1_12_0, ext_zaamo),
     ISA_EXT_DATA_ENTRY(zacas, PRIV_VERSION_1_12_0, ext_zacas),
+    ISA_EXT_DATA_ENTRY(zalrsc, PRIV_VERSION_1_12_0, ext_zalrsc),
     ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
     ISA_EXT_DATA_ENTRY(zfa, PRIV_VERSION_1_12_0, ext_zfa),
     ISA_EXT_DATA_ENTRY(zfbfmin, PRIV_VERSION_1_12_0, ext_zfbfmin),
@@ -1491,6 +1493,9 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
     MULTI_EXT_CFG_BOOL("x-smaia", ext_smaia, false),
     MULTI_EXT_CFG_BOOL("x-ssaia", ext_ssaia, false),
 
+    MULTI_EXT_CFG_BOOL("x-zaamo", ext_zaamo, false),
+    MULTI_EXT_CFG_BOOL("x-zalrsc", ext_zalrsc, false),
+
     MULTI_EXT_CFG_BOOL("x-zvfh", ext_zvfh, false),
     MULTI_EXT_CFG_BOOL("x-zvfhmin", ext_zvfhmin, false),
 
-- 
2.43.0


