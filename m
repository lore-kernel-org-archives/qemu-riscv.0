Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991CAC369DC
	for <qemu-riscv@archiver.kernel.org>; Sun,  4 May 2025 20:58:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uBgOz-0008Qe-KH; Sun, 04 May 2025 16:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uBgOt-0008Ni-GT
 for qemu-riscv@nongnu.org; Sun, 04 May 2025 16:57:27 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uBgOr-0006xA-JE
 for qemu-riscv@nongnu.org; Sun, 04 May 2025 16:57:27 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-736c3e7b390so4222774b3a.2
 for <qemu-riscv@nongnu.org>; Sun, 04 May 2025 13:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746392243; x=1746997043; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TIQELB2tRYMc57jWwkjeMWxsQZONjOqCuvRT3H/S0gQ=;
 b=GAZluYBCncTuczWvE4cR417NM6PCdrwlFl4Q4DRzu1w9PwzhzgzYniqJ65+2D2PbnY
 sE3BHBga0e4Z18GDsxK+xextGbzghbcGjnKt4lC8doe17n6VnxTOhotNNlSj0OvXFYwU
 bZK7BwrpbVFlo70kuMlv5EgnxLTJoo0vgVshnvOmN6zf55eiQXhCpyaBkzsR8P7SX9Nc
 0GQnNad+GNJNqGKOiL3taDAZ/CQHWXAcKeh3YyWkE9rWdMnEgSzTa+EJBTRAS/C7IuhH
 qF5R7yaWV5fH5Ur6jrlIvixuH0TzHurdnbcE+bIXDnNG/iOUY4esE4D1O2dGmL5C2Kjd
 0AJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746392243; x=1746997043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TIQELB2tRYMc57jWwkjeMWxsQZONjOqCuvRT3H/S0gQ=;
 b=bbFNb5GbA6eHhbZ1Xv9iucyEKTrrHLky/SoLvw218vsThrJ5ShP2hR4ih1x6KJpQwB
 x2Ihhi32mnFba/qU1ljcQS7mqk1MMUMr2PJpv58XY3+ur/scKv/5TlAZe04+6qeZbs0R
 v9FCyPtfehsULgRUVuKzv/X01NUrQBAOB6tfs5SzvtbhYjA9+zuN0zTgLqZzUh2SiQV1
 ubvU1WlU0bo1V0BlHauf4DaMZcCd0ttFNqgUr8B3M8w/3am9Hpc2H8G+jQZ1QsbdrmhR
 ksw4xayg/hFNerRCFelOqxhTK7NVDjw6aM6aQpqxD6emxEuJNMsdhMT/GGI4ACPT8Psn
 MJZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5Ksnntc04trkXv2CDqzbddGS7fRjnjmsiLv8qCifQY7Qr+hS5bH8b/0CPQS8x4UiMAoi2Y4tdS6fr@nongnu.org
X-Gm-Message-State: AOJu0YzSMmpJW7xYO4SEE4hY/GRIupnFED9AdCLcecp8W1NQNIrOwjHl
 Y6WpJAfZJrIby2EYX6QdcSHV2HUiS3LwKQ8xtvxWlfQf4a+CAjtYt0GHq8IId4w=
X-Gm-Gg: ASbGnct3y6hMrzx0HKQhWmIBem9iUrYHiTvlqkyCgDIg552/DxsbAlIzkXn5uOiXrKU
 UX9a3y5CB2HmQUsng4QXgfMN2mvfY2e5o3MdmI/ENbhOodB3C0tNds2Y+P5wRkk0Ry9yV5H2wJW
 4F62eoxp5fC9TmhLt1e1uwvmrwEyRmyIq4kPH/JYAt8STpwKA9yKhhYIWuYqWtJSqwBO7Bdg5q5
 XP6WQgadraSUfEUHVrXiCj/vHj8votO2pQO0cHSqFFVfw3we7Td37sP9DiMYTsALaNHw4oUNe43
 5MUhw7YJRERm5azlw3DM6iyuj6dEvhxsXOdnemUHCnXin13q8abNJ5IoqqB+bVPILRZNoJmkB+m
 bvero7B09Gg==
X-Google-Smtp-Source: AGHT+IGiSjkXytY1Cg6vGzsn2xbomthAKGNmZRcrP49T+TKpnUIiJFeqJTYknXQEL19xxMCfWdJS8Q==
X-Received: by 2002:a17:90b:578f:b0:2ee:f076:20f1 with SMTP id
 98e67ed59e1d1-30a6174fda0mr9082464a91.0.1746392242797; 
 Sun, 04 May 2025 13:57:22 -0700 (PDT)
Received: from stoup.. (71-212-47-143.tukw.qwest.net. [71.212.47.143])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e150eadfcsm41346425ad.32.2025.05.04.13.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 13:57:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: foss@percivaleng.com,
	qemu-riscv@nongnu.org
Subject: [PATCH 09/12] target/riscv: Fill in TCGCPUOps.pointer_wrap
Date: Sun,  4 May 2025 13:57:10 -0700
Message-ID: <20250504205714.3432096-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504205714.3432096-1-richard.henderson@linaro.org>
References: <20250504205714.3432096-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Check 32 vs 64-bit and pointer masking state.

Cc: qemu-riscv@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/tcg-cpu.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 55e00972b7..267186e5e3 100644
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


