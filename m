Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FADBCA1013
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 02:53:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uvRyw-0004nP-K3; Sun, 07 Sep 2025 22:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uvRyr-0004bp-6O
 for qemu-riscv@nongnu.org; Sun, 07 Sep 2025 22:51:45 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uvRyg-0003je-Cm
 for qemu-riscv@nongnu.org; Sun, 07 Sep 2025 22:51:43 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-7723cf6e4b6so2942254b3a.3
 for <qemu-riscv@nongnu.org>; Sun, 07 Sep 2025 19:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1757299887; x=1757904687; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LUMGEGv/qDfvCpbeAiUIIu2AO0GY+0XHtQjRlY6FQa8=;
 b=U9rcs6BzhTtWJ5trGUzc7CgiRJW0F/11wanP2HeEf6XsctgZfWHPd8LLLCylcLrbQx
 I2/wYJhQHzyNv2/S4wOyK9SpFVTETW17iRJVEV6QMD/r8rQYqgOES7+UBvRD4xZXsMPt
 6jyqSd0a4RfFdJfG7+eFQFjoJr3NkcsaSmXp54nZjqNbpXVMAgZ1VCNV7tDj3xIoPeRU
 IGDWb4vBQugNNc+gGa6l2z6ZLctTxofHfXYMHeNstx6iB+WAl0amAEDP0zQKaa1yYU2L
 1VPgRaTXAoZdGO5d4zfD/Gxktd6keLvoMUAn1ZRRGBAag4XwxvFm8TJsutDbyKkxGo7L
 3PGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757299887; x=1757904687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LUMGEGv/qDfvCpbeAiUIIu2AO0GY+0XHtQjRlY6FQa8=;
 b=eHofXQo+rB/XHK4/dFsz3i4WIH9vCeoRRPpJcarg+1pfs6htI6MZW5opUsWOsPcVlB
 4uAgrPIpXT1uXBKZtmHWWjPcau8lzgFiSdNlGQLAOsYDVoMKKqD7xOOHzS8WymEqbGhM
 FWi0q5UsHOaMurosaVZOAfgco9Is/yMFh2s6H/juj+seAFmWyPT+lmwAYeSjkdQfYh8l
 SiPGVMC5w7oXIVQ+debnno/Dlo6KlRmqvxN4ZPIOiBVrHlK2fHJykVk8avCyWzJLKdhT
 u+DKjpkvx721gLqd6A9ta7CWj3V8DRne/yKEktl4XPy6Ar8IjZ1FEcjYwsw1p7Qqv0mJ
 +YYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXM2J3prmtCGnD+tRe11FHncfR6ch+89ZN5JS7AjvyLK1LwZDGEloy5m+ZNTPti1OxXtDrU7VC9VOK@nongnu.org
X-Gm-Message-State: AOJu0Ywk8bMbuh9Q42+Ns+1K9mmvLWJQMJoK2Limp7Yqp77JqyzA7R1K
 8UZFnlHdNRRQHPfSvLf3ub22fpOpJARNTi8JLBK+yw7V2BR99fCdGa1GtjPuH6U++ik=
X-Gm-Gg: ASbGncsmNQZITiumlw/Ygfeg83dC80u4GKIO9REk3fcvscjt8a0p/iYhZjistGbuvVM
 qT5oh3BLry3pfDcG4sh/hWIX+qImDO7UEdCa1gOfEX4RB96Dp5pPLKYR2dL+xCsUyiqSDb/9+Ba
 7e2FGzRE1ref44jZ/1t9Ocr7BU9mNDw+MJ6s/X0k2hpM1q8BNkqLNQXvAnUArrQF/JX65DQ8ruY
 ugVyxHMus1EWidoL9JwQ8LVSCcfro4xnIPeMF+I7mU4jdHkh4rYkKjOlKrhZ1SO81MDxsejSMR1
 snAxqBp46r7KBvvcFGPVYmTQlPkaPM6AwdRnl6So7EhR5TW43ZvOSU67XKbJij/rDMNwRjIB7eN
 49qdvAJ24ciuLy9dP+HQPQoLyNuhc9oyjFKTC7yszmygJlI26/n+qW04znnQTtPJRgwkFzxqmqS
 YJ+w==
X-Google-Smtp-Source: AGHT+IH1n4+dL6pP75sZRfhkie6KaRuywQban2JGYjEn6GTWIj4OBEJuvBdqsekxd7+IxtqbVHH5CQ==
X-Received: by 2002:a05:6a00:3e14:b0:772:67f4:57 with SMTP id
 d2e1a72fcca58-7742dc9931bmr7102775b3a.7.1757299887085; 
 Sun, 07 Sep 2025 19:51:27 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-772306a1870sm26823834b3a.75.2025.09.07.19.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Sep 2025 19:51:26 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH v4 1/3] target/riscv: Add Zvqdotq cfg property
Date: Mon,  8 Sep 2025 10:51:15 +0800
Message-ID: <20250908025117.1728895-2-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908025117.1728895-1-max.chou@sifive.com>
References: <20250908025117.1728895-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

The Zvqdotq extension is the vector dot-product extension of RISC-V.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c                | 1 +
 target/riscv/cpu_cfg_fields.h.inc | 1 +
 target/riscv/tcg/tcg-cpu.c        | 5 +++++
 3 files changed, 7 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d055ddf462..d0909f7beb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -187,6 +187,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvksg, PRIV_VERSION_1_12_0, ext_zvksg),
     ISA_EXT_DATA_ENTRY(zvksh, PRIV_VERSION_1_12_0, ext_zvksh),
     ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
+    ISA_EXT_DATA_ENTRY(zvqdotq, PRIV_VERSION_1_13_0, ext_zvqdotq),
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(sdtrig, PRIV_VERSION_1_12_0, debug),
diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index e2d116f0df..5da59c22d6 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -100,6 +100,7 @@ BOOL_FIELD(ext_zvfbfmin)
 BOOL_FIELD(ext_zvfbfwma)
 BOOL_FIELD(ext_zvfh)
 BOOL_FIELD(ext_zvfhmin)
+BOOL_FIELD(ext_zvqdotq)
 BOOL_FIELD(ext_smaia)
 BOOL_FIELD(ext_ssaia)
 BOOL_FIELD(ext_smctr)
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 78fb279184..7015370ab0 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -767,6 +767,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_zvqdotq && !cpu->cfg.ext_zve32x) {
+        error_setg(errp, "Zvqdotq extension requires V or Zve* extensions");
+        return;
+    }
+
     if ((cpu->cfg.ext_zvbc || cpu->cfg.ext_zvknhb) && !cpu->cfg.ext_zve64x) {
         error_setg(
             errp,
-- 
2.39.3


