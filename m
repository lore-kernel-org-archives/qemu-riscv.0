Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFF3C001DD
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 18:32:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGOLS-0007ed-UV; Mon, 03 Jul 2023 14:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGOLR-0007e4-9R
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 14:32:17 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGOLP-0000E8-IZ
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 14:32:17 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31438512cafso1254292f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 11:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688409133; x=1691001133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KNXX9yjMUQcBLaEX0n22oT0yHELrjRtAMDfsIdBaNkY=;
 b=KIK5m6ETMi3E+DS0NOoaPhJTIaeZWsAbFYOV6Zl7AOmoiTcn8qvuL0HF+pnuVFScFG
 dagK5jUXqbUkBh/CoHtVTNrK5Zw8YVfRszT6X3I7J2y+JgZ7ak1OIwTX5AxRLKfZJse1
 EWs66tgk92rQ1CnP1vltH6gmx+vFVYlZuNXlRl5sTfE4nzmSeOJWqW/OhoiCeX1XP91e
 BCsyxZ1YR/EQynYeZ2xomyJXpZH9A1VE4rtdD3TNFlPkZpEPJBc5M9kJQfg5mAU8DMah
 0KQKxqwC1+GiTfkqYbXnA/CHoUHbKyS75aZMGaU1oIVMOthqNpFIYYkf5PAr+iOHlBKF
 Wjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688409133; x=1691001133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KNXX9yjMUQcBLaEX0n22oT0yHELrjRtAMDfsIdBaNkY=;
 b=WQjHScWFL+uMTaBRvFNjwJXkiyL4lVd6pGMIWzLOu5xRXjQ/DxuKrt5LYY3CEHoQXY
 epxUMuj4I169ksuze25PtNaAxHOVTT57iEQhPbHktQPkqS7RqRf5daOiPUL8/9CnRmGx
 KK8ybq8cOkDoCisGYfV3FCuiCjP1WDcLZJ8tGg0OGIk7OxlbH8NG/2dKq3n8iHBM8nu8
 W5tfBfYc1R576RX2yM3nb75BOogNq6cwiLyRo0BRnAd1fytxgQYUyEUIpsrPCgjGMxqt
 dR2gE3F1pqbd5lx7oaoBcd/cUArY0StgH33lCkVLJLW5XcgiUQP//e7DgViSVbl9OFBU
 eiEw==
X-Gm-Message-State: ABy/qLakUr1Qtvtg0feqJ8UghVIHj98dSig7Z72O3bZlXYU/GGe/Utaq
 AMhH8ZLzn2+7yH2dio/9EqD2OA==
X-Google-Smtp-Source: APBJJlHatMbhgx8arqDUSOAALOI8iktiuHwcIb3VHA/qra9oYQt49PQ0pLFIYvPi0+AxjH5Xon74jA==
X-Received: by 2002:a05:6000:924:b0:314:2c17:d921 with SMTP id
 cx4-20020a056000092400b003142c17d921mr6336643wrb.38.1688409133603; 
 Mon, 03 Jul 2023 11:32:13 -0700 (PDT)
Received: from localhost.localdomain ([176.176.178.91])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00314172ba213sm11770980wrn.108.2023.07.03.11.32.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Jul 2023 11:32:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v2 04/16] target/riscv: Restrict 'rv128' machine to TCG
 accelerator
Date: Mon,  3 Jul 2023 20:31:33 +0200
Message-Id: <20230703183145.24779-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230703183145.24779-1-philmd@linaro.org>
References: <20230703183145.24779-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We only build for 32/64-bit hosts, so TCG is required for
128-bit targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 174003348f..78ab61c274 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -498,6 +498,7 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
 #endif
 }
 
+#ifdef CONFIG_TCG
 static void rv128_base_cpu_init(Object *obj)
 {
     if (qemu_tcg_mttcg_enabled()) {
@@ -516,7 +517,10 @@ static void rv128_base_cpu_init(Object *obj)
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
 }
-#else
+#endif
+
+#else /* !TARGET_RISCV64 */
+
 static void rv32_base_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -598,7 +602,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     cpu->cfg.ext_icsr = true;
     cpu->cfg.pmp = true;
 }
-#endif
+#endif /* !TARGET_RISCV64 */
 
 #if defined(CONFIG_KVM)
 static void riscv_host_cpu_init(Object *obj)
@@ -2033,8 +2037,10 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_VEYRON_V1,        rv64_veyron_v1_cpu_init),
+#ifdef CONFIG_TCG
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
-#endif
+#endif /* CONFIG_TCG */
+#endif /* TARGET_RISCV64 */
 };
 
 DEFINE_TYPES(riscv_cpu_type_infos)
-- 
2.38.1


