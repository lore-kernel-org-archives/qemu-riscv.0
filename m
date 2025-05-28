Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51181C5AE59
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 May 2025 08:22:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uKBz7-0003xS-1A; Wed, 28 May 2025 04:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uKBwS-0008Qb-1r
 for qemu-riscv@nongnu.org; Wed, 28 May 2025 04:15:19 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uKBwE-0005Jl-KS
 for qemu-riscv@nongnu.org; Wed, 28 May 2025 04:15:14 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-450cb2ddd46so857045e9.2
 for <qemu-riscv@nongnu.org>; Wed, 28 May 2025 01:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748420087; x=1749024887; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GYj9gZK7rwvghXe4/pGvPJxZVsy5pAC3NZqaoEu66Ig=;
 b=sI+22Ttqm0xTBGeAYuXWszdGpoCfrn7Xbf7cfxm2btEjNtRBztx4lfHzSQYlXKhMwt
 spiI7n232K1iMz8mujZeFKrN4w+OEj1f9qW6lBzjcRO5/HKEc1jJLQYdIaaPsyH7czMX
 9kjljYdHiZTp6lgAg45ht+Kj+fn9Fg/HZcwNqDx5CwGVMIYoSzmRYyenWzo/i2gla7KQ
 Oqum9sg1N9yVsz0xOadG6JPs5eFHwjuDejV59LeGtTLR/Cmts+8dZsrWKgv1OTWafybT
 4G+ID7dqhW75k6zjS/21EOBaWFdEjX4AU+qqIjJzvlhgMj+co4Ko6NGFgoEissnB/2L4
 wMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748420087; x=1749024887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GYj9gZK7rwvghXe4/pGvPJxZVsy5pAC3NZqaoEu66Ig=;
 b=LfHsXGKvtHy5EutsfSGh9ZzsnnuTQexq/z3BoZLhLIW3ypJRzKovjKz8ggE6l5cdDI
 qrzaqWn8jWVT/z4eSRX4z3io8BnStiq4hKzq2WBiqhpBMUy3xi4DORs0E/w11iCMB6xX
 5IzdkmSB/4OwdOFFhlqKW0N/omTrtxYWF/5Zw/obfv4IshctsAPWe8l++3zvWKKJg8Xg
 8tsqoShkF7qR8FlO3vZk5OhfKlF2zvGpQt5DXpczerGbXbCftNX4dMy3KFtW7shHtDIE
 WzxFckiW8WH0C0WMVGmkPv+yo6dNYe3zIbylSHuAyoU8AhAp25yMGRvn/Gqye9XBiuVV
 n0yg==
X-Gm-Message-State: AOJu0YxieSuoqzhZVPF+X+7jeIPRYOfXCjwSBTWhrxoij1e5nG7EYt1P
 vT+PKsViDbLwAYnPTbxQvn0+ruwnrMlnVcq2gYv8lr3kWVf1Pt/p/EJxyGSRHLCJDhDf4N3ioGa
 l/DvF80QP/A==
X-Gm-Gg: ASbGncvQHuXhGZrRT5NvM8mj/t8VnWPumd9/rM7ROUgwhFegWIZszrQuDZboTaQ0dpw
 8N5tNrtIyqLZVLIgOBRJvmWee3aVtXYgJmUxG++ZBNE9I3a6NC32Yu2aJuWCdKEWTwSvGzvss70
 Npmw8X7dC4Kb+ItWooUkx76haw1RtXkw3YHy6as0FHpgrjDtwqULZ6RDDTkdVwV0irCeVSY1f0L
 ClRiZSW/LQ0wIC1PlKqOpbrkgYa8Vt4fmLVEEICT7by061h/zO9QfK3q7NXxJmeqPnbkD4gVP90
 gqt6xpVfr67vDHNjVYgoeByMBa+aFabXFV6Bv+vuidqHdE6vAzJoqRll
X-Google-Smtp-Source: AGHT+IFRz6SC9HM9VeqUQg3aGeuBc3TfWqiHb9vq4070cTkkX1MEe3O7JPA6czuWbq5DhNdJVipM1A==
X-Received: by 2002:a05:600c:8711:b0:43c:fceb:91a with SMTP id
 5b1f17b1804b1-44c919e141bmr138579005e9.11.1748420086846; 
 Wed, 28 May 2025 01:14:46 -0700 (PDT)
Received: from stoup.. ([195.53.115.74]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4500e1d85b5sm13178645e9.32.2025.05.28.01.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 01:14:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 25/28] target/riscv: Fill in TCGCPUOps.pointer_wrap
Date: Wed, 28 May 2025 09:14:07 +0100
Message-ID: <20250528081410.157251-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250528081410.157251-1-richard.henderson@linaro.org>
References: <20250528081410.157251-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Check 32 vs 64-bit and pointer masking state.

Cc: qemu-riscv@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/tcg-cpu.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 305912b8dd..55fd9e5584 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -237,6 +237,31 @@ static void riscv_restore_state_to_opc(CPUState *cs,
     env->excp_uw2 = data[2];
 }
 
+#ifndef CONFIG_USER_ONLY
+static vaddr riscv_pointer_wrap(CPUState *cs, int mmu_idx,
+                                vaddr result, vaddr base)
+{
+    CPURISCVState *env = cpu_env(cs);
+    uint32_t pm_len;
+    bool pm_signext;
+
+    if (cpu_address_xl(env) == MXL_RV32) {
+        return (uint32_t)result;
+    }
+
+    pm_len = riscv_pm_get_pmlen(riscv_pm_get_pmm(env));
+    if (pm_len == 0) {
+        return result;
+    }
+
+    pm_signext = riscv_cpu_virt_mem_enabled(env);
+    if (pm_signext) {
+        return sextract64(result, 0, 64 - pm_len);
+    }
+    return extract64(result, 0, 64 - pm_len);
+}
+#endif
+
 const TCGCPUOps riscv_tcg_ops = {
     .mttcg_supported = true,
     .guest_default_memory_order = 0,
@@ -250,6 +275,7 @@ const TCGCPUOps riscv_tcg_ops = {
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = riscv_cpu_tlb_fill,
+    .pointer_wrap = riscv_pointer_wrap,
     .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .cpu_exec_halt = riscv_cpu_has_work,
     .cpu_exec_reset = cpu_reset,
-- 
2.43.0


