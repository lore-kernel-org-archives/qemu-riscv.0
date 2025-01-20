Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB2CC02181
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 20:49:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tZyiD-0007l9-2c; Mon, 20 Jan 2025 15:49:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tZyi5-0007PU-2D
 for qemu-riscv@nongnu.org; Mon, 20 Jan 2025 15:49:25 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tZyi2-0006Oj-D3
 for qemu-riscv@nongnu.org; Mon, 20 Jan 2025 15:49:24 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2165cb60719so80775565ad.0
 for <qemu-riscv@nongnu.org>; Mon, 20 Jan 2025 12:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1737406161; x=1738010961; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k61SOT55tEchcCOAJasCWVeJl795sl3BG5VEaxPqZrA=;
 b=AKqxVdGYXeK8FP0ZaLhYR2TfEL5DxKzLqRtoRVJ/djqJhLCSXAQTWGEwHb/Tx9V4hX
 TUlCvkkuayTtGfQN4l3cUubkGTdpSrg5nMkyTk9vH1Ag/SAyoe1VKW2OeqqoMs40ViJu
 VcvLN3fsa8ouRINyYR2Ho0Vw5B8s6iXWD8LOux4yTSNQvVXZK4aeFPNmHj3F2XPqeEAo
 w3dph8OuT+Wy+wPzc6lpW5vppD3qnJ1cgZxzSHvYf78QiPJDGf1vrjw5Ko3kLOGaizHF
 uFe8OGs3k4r8rWnCqvsJTizuzKfoPrxQ3YH0BD09bXFfNEBugOmJBlVNSOx59gobqimu
 Nwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737406161; x=1738010961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k61SOT55tEchcCOAJasCWVeJl795sl3BG5VEaxPqZrA=;
 b=ryrcyL6RGK6zDOWh8yAFAKqusEAmkCcBdJNuB+T3RlRvMDYf2NezlbNY0P3FAgFfGT
 fPvbx5nqBCPy2bzfkSIgl0UMQv0c26RgZz7PQpZc/099fdbjeEUBAEtAkKMhgj7e6x+2
 Epb426al8/x5gChO4HcIjf4sc9wN72w5yeXYIaYO2QskOabdMvl3V9gWBT/H+8L31hQ+
 n050mfwwWuEzNS4Lb96O66J92gpj8vHUWl5zrNfhc2W/7A4UnEgcNl9YnnhJ83O3bb65
 DlrtxHT3LpDR0A7qvB6C8wnLZZAT/pUVR1IMii+BH7Tx911nnJN+W6c1XDiGxt4LJyOV
 AYGA==
X-Gm-Message-State: AOJu0Yx5UkTREWeI3AZbZPUc+UhgpiDjt/N/FqlH75CBwJj3mOKO0pBO
 J6pQYZpEXLBgszU9amceynlRT+C4vokGA1VufzE9zQ85bAPiswpBoB9AgOVc/WI=
X-Gm-Gg: ASbGnctnMCwyLWeBmdDrd2BNXVwuPPtlO+TYYCiFtFf22ioD82VdLsikoUn8G5GDRev
 DgsyS/SMB/MgETApwzIiUuymSi6e9yxqPUsAw25R9yXzz4uJOFIKiRHdOn4ZWMhLVNCOVe7Ms56
 ROjx4TT9mQbSEYCjYRbvpqX9csQGntMeaKMA/0ar1YZrT8gG/WpkAPKyL3l16q8E1AlIx9AKk5h
 JDKvVmzfNHvj9KLcRQxR2cAV97M/QZnXL8ZlhxRrjpZt5oF8iLDgWzxRQzd9OSCVOdkIuXYNg==
X-Google-Smtp-Source: AGHT+IGtuukGcSUmWnykLMPXW8Lx6HsIlWQ8GcCSKIGy785sd6lHUQ6LpW3YTlEHnvNrY4HP6ixtuQ==
X-Received: by 2002:a17:902:fc48:b0:215:787a:f91a with SMTP id
 d9443c01a7336-21c355eabe6mr257812495ad.44.1737406161159; 
 Mon, 20 Jan 2025 12:49:21 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2cea08e4sm64865025ad.7.2025.01.20.12.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 12:49:20 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 1/2] target/riscv/debug.c: use wp size = 4 for 32-bit CPUs
Date: Mon, 20 Jan 2025 17:49:09 -0300
Message-ID: <20250120204910.1317013-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120204910.1317013-1-dbarboza@ventanamicro.com>
References: <20250120204910.1317013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The mcontrol select bit (19) is always zero, meaning our triggers will
always match virtual addresses. In this condition, if the user does not
specify a size for the trigger, the access size defaults to XLEN.

At this moment we're using def_size = 8 regardless of CPU XLEN. Use
def_size = 4 in case we're running 32 bits.

Fixes: 95799e36c1 ("target/riscv: Add initial support for the Sdtrig extension")
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/debug.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index f6241a80be..9db4048523 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -478,7 +478,7 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
     bool enabled = type2_breakpoint_enabled(ctrl);
     CPUState *cs = env_cpu(env);
     int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
-    uint32_t size;
+    uint32_t size, def_size;
 
     if (!enabled) {
         return;
@@ -501,7 +501,9 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
             cpu_watchpoint_insert(cs, addr, size, flags,
                                   &env->cpu_watchpoint[index]);
         } else {
-            cpu_watchpoint_insert(cs, addr, 8, flags,
+            def_size = riscv_cpu_mxl(env) == MXL_RV64 ? 8 : 4;
+
+            cpu_watchpoint_insert(cs, addr, def_size, flags,
                                   &env->cpu_watchpoint[index]);
         }
     }
-- 
2.47.1


