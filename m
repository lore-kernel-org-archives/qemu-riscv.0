Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFF3C02182
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 17:07:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taHi8-0003xL-7U; Tue, 21 Jan 2025 12:06:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1taHi6-0003wt-EC
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 12:06:42 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1taHi2-0006Za-0X
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 12:06:39 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-216426b0865so101876155ad.0
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 09:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1737479196; x=1738083996; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k61SOT55tEchcCOAJasCWVeJl795sl3BG5VEaxPqZrA=;
 b=bRdZ4RIjzru82U7P4tZmM+LF9HUTm1AdrVBh0mYHUgs/R8XPZUsBppPiF44jH9+rXJ
 BETOamb8VcQMivk6cNaeR4q8xwJj3un/1bdMqnNswCOZsdFilOHxQAiVkWiMr20Wvk2w
 /zIPEQqnTCaicfSdGqgak5IRJX3XCqDYXypXuNazl0u5nHH9D7Ns2I9PWRjCn4r0gYlM
 RmH4GEzZNAO75lobspbisUM9PKLElIVpq9J7vivl761+qx/JTEdlNsQjJTGXs+9N7syB
 GWvHDv6co1j6wjCYJchbp2M+wm3cFrrPX2UoRJA2YgIIGKsqXwhmisedX4TQExtPT4ER
 jfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737479196; x=1738083996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k61SOT55tEchcCOAJasCWVeJl795sl3BG5VEaxPqZrA=;
 b=pRIlQrlmpmqPnc++CedIwnhLFvF6ml7OQF5yuBJMbRNTtlj9EfYGc1iikszsMh7uma
 9YdylqIobMWHuv0NuQtkdowrWeyOd6e+3hgh7MPsnKdU/6gj0685vfZbO0twfkvvK77M
 FOaRL1oyUu196NBPoEENCHxq4OQLF3MMGVoUBvcInWSrECJJrnhHK27FsCLCW/70tK7X
 KF7HCygjnm4EKmY173/VJBjEbZLNe18hVp6bEzFb4sIXiSNRVWweaRud95Z/rZCY5dte
 BnyXmFRoHrva784iMcvAs/Dxkm4DLX5XH+5AVCCsvpdcHxedcml6W6kv0u2tPevq9i3X
 f1zA==
X-Gm-Message-State: AOJu0YyTuE1q8xiKE9Qm8FR4NHFEr+sT5n81qC0NQtHodtIDLg0NHHmm
 bUSjYS0rnllFyC6S8xLp0pyk7hrRixy1YyqP8QY/GCc7p+XhfHoXz5IT8zsPXf4=
X-Gm-Gg: ASbGnctPxrkT+Ja9maOYEb1B446VfAH2dJlJTcilXnZvUw/+zyyikVZN+096PdnM7SL
 3VJtB6j4s5hB8njDsf9opI26oJhgEkxg3/SRt513F+8TMYTvbW1WAnahOY8GcQKoSwbGWzs+uX8
 4ae13PkCSO/DtA3vBX3MeLrju1+8ZFetWQmF+uS3G61noQ9Ao5spJTS9CPitNy5Brr3Otc0fpbR
 XUB4it/B2lZz4QhHOaEOe4dTI6iU2tHIyXxYB1VPSTPwTUyfBo5CPIeGFyG2bssXWOApPjb
X-Google-Smtp-Source: AGHT+IGZK8UOcIVBs2yqLfhcVzKzV8SfWjepcKwXgCX461HkOYsbkLZNNmgW0vyp9cijxUIQ2ST1kg==
X-Received: by 2002:a17:902:e5c3:b0:216:30f9:93d4 with SMTP id
 d9443c01a7336-21c351bcd36mr209315695ad.8.1737479196590; 
 Tue, 21 Jan 2025 09:06:36 -0800 (PST)
Received: from grind.. ([191.202.238.10]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2cfbbdf0sm80657825ad.105.2025.01.21.09.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 09:06:36 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 1/2] target/riscv/debug.c: use wp size = 4 for 32-bit CPUs
Date: Tue, 21 Jan 2025 14:06:25 -0300
Message-ID: <20250121170626.1992570-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121170626.1992570-1-dbarboza@ventanamicro.com>
References: <20250121170626.1992570-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x636.google.com
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


