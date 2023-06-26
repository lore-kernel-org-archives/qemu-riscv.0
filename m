Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2FBEB64D7
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 23:21:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDvVg-0004dS-3d; Mon, 26 Jun 2023 19:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qDvVe-0004d3-SQ
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 19:20:38 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qDvVd-0008St-41
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 19:20:38 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-991fe70f21bso63871966b.3
 for <qemu-riscv@nongnu.org>; Mon, 26 Jun 2023 16:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687821636; x=1690413636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9n9ArHz60JzWE1yJqemnhDvR/HZJtedzb/UUiT/wvC8=;
 b=bxzSKNJ73QcO7iLvYeLyG0dnR9SiUgtOksbo/GmR2Ym9lThpIqrHxVbGGVKvbSA5GQ
 Xw5HbE3nOapG4+8j6SNoD/WZXLNoe13LvtFYkNHec0enGQahL2NilnahIfw0Nc0AkdD/
 sMGLPM9JlT+LnKA2vURENJe0c82DuW/xiDz5dYA3CU/CExV0E7k3cM0vw9Fg1E8FeOhI
 kTfR21jy/Cw34CLeD0b91H1Hjux3QJ9bJDygJ88GhgPQPiKyyTAKa7+BTxSl3njPbVWv
 Axv/D5toJR1VO5+aT2vV6SjpHOB1ZrBhE9oW565pNSREEojW+3tNVzh9PhMEXCYER8EF
 KT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687821636; x=1690413636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9n9ArHz60JzWE1yJqemnhDvR/HZJtedzb/UUiT/wvC8=;
 b=LnAbuT4acJZl7Q6/gmzHivIZNeCe+e65fnjDEVEMQ+P017+UARj64kWSUhwmJwP+8p
 3tRTA86e799J64Q+agynEIzx5oXC3COUH3HOl1ngXy2r/pkVYz51ZW7Ks9zCSzJPPiqu
 i9ANdu6SrnIfYeiZ/ZKCftkZOXQw0MS/3Buy/CU7DVMwVy7C1HUruBash1KupCQ8Y4Gj
 KbMI8MW2zGa44GUrEM+bm8xpfH8hx6FuP2CZPghuzLuNWOWdphFzdSDzHvWHMcSU0hnW
 j5a7DiOByLJyBpGkJsG/F6pDXrIOtrsqJj2Skl6740rmtIeYsn3fEh+jWJvZwLkcreYS
 ZFYw==
X-Gm-Message-State: AC+VfDz090YzwPqVDzCvJWqmFA+Xi3b2NFviSWcPiTSW+PqLz7IVyZ4j
 73HW+nX2PMB9FVkNnRZirHFsbQ==
X-Google-Smtp-Source: ACHHUZ4Z3DeaFCYasucsNa5YAKRmI776qMi5ID9ep5a+fWS9eld+Go6WRb9RUECWpdZcSvJjiOvRtA==
X-Received: by 2002:a17:907:2e0b:b0:992:1308:f551 with SMTP id
 ig11-20020a1709072e0b00b009921308f551mr117254ejc.9.1687821635934; 
 Mon, 26 Jun 2023 16:20:35 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.226])
 by smtp.gmail.com with ESMTPSA id
 rn19-20020a170906d93300b0098822e05eddsm3753487ejb.100.2023.06.26.16.20.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Jun 2023 16:20:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org
Subject: [PATCH 04/16] target/riscv: Restrict 'rv128' machine to TCG
 accelerator
Date: Tue, 27 Jun 2023 01:19:55 +0200
Message-Id: <20230626232007.8933-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230626232007.8933-1-philmd@linaro.org>
References: <20230626232007.8933-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
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
---
 target/riscv/cpu.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 175dbc9826..7f281cdcf6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -473,6 +473,7 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
 #endif
 }
 
+#ifdef CONFIG_TCG
 static void rv128_base_cpu_init(Object *obj)
 {
     if (qemu_tcg_mttcg_enabled()) {
@@ -491,7 +492,10 @@ static void rv128_base_cpu_init(Object *obj)
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
@@ -573,7 +577,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     cpu->cfg.ext_icsr = true;
     cpu->cfg.pmp = true;
 }
-#endif
+#endif /* !TARGET_RISCV64 */
 
 #if defined(CONFIG_KVM)
 static void riscv_host_cpu_init(Object *obj)
@@ -1947,8 +1951,10 @@ static const TypeInfo riscv_cpu_type_infos[] = {
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


