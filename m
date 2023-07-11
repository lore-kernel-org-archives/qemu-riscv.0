Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2B4EB64DD
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 12:16:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJCHQ-0001UV-6d; Tue, 11 Jul 2023 08:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qJCHG-0001Rc-Pm
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 08:15:41 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qJCH2-0005La-AJ
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 08:15:33 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbc244d384so57811895e9.0
 for <qemu-riscv@nongnu.org>; Tue, 11 Jul 2023 05:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689077718; x=1691669718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UaLFn1nG0baOids45BFvGGXesNjHPpz9SvJuwJCFeRI=;
 b=Vlg2K71MG1unvjEgk8zP4Ujf9Rc16a/GDW5suKI30ZH2ACWTEnZYdJOT6ksQ6i8Uye
 35P8Kb02uPHBI9zfM4+EeQD7/9KLnTqGdRTs5gpJhuyjRugqpH7yz1oMQYPzwe58Ge03
 KU0DNul4OWebluv8slUxhxG44OsNjn5hNzeWYKPEyI2X5eTVKd/eqQQ5rXJtpZ2OiLBv
 /CCLU/hBiuUMYTWHXeGGZ/Ez0D7GbnwpqGvn3R1UKQ+OL278jmjfAzqz7PnI1rBknbvD
 12bvAGcFxCRVBvxp3WUPHl0U+fQ2GqP6Th/8oybuTYebXzuqU4NSHDY2RVl0bSU4AmNJ
 6Qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689077718; x=1691669718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UaLFn1nG0baOids45BFvGGXesNjHPpz9SvJuwJCFeRI=;
 b=MpXJpUrr6dtFzpthC+iPjJLvMDsbFxQ0QX9hrfzi7X9bPHb1G4RTHGbfy5p03QGD53
 ukldcCNTwK917KWURexKmf60nYPNvwtApS70he0dQIyIu54p41M7PZHh6aLpsJieoaz2
 iC/RPBgB32cyHsPPQkYMOaGzgpLVSCll6VHObMIIOtGzzefph/1LpaeDD0wQFubl12Jx
 LvvUHDkU1Hc8aI+ZTjIL8K49FoubI4hemsh/je+QBtE0WzCUaETxziAZ33f4yhxO3nhE
 XB2Cz9P/8h0wzhsmcUFzZeQaBaM0qK3WGJ7srpsDARP8OJ7MKXBOarKQvfTw8WXej5Z+
 pcnA==
X-Gm-Message-State: ABy/qLanjvzzU+uf/p7ZgypMXBaO0L1AwqbTDKXYUACm9FtOCIJMRgTj
 9Wk3td1DZ33zDk1htjuCQ6iHaA==
X-Google-Smtp-Source: APBJJlEcK8+2CSJGN94SI+hiS2ZqUQ9BruVrW+1LHgBAAvy6dq66Xa31XSMaxtR2E78+7Oj3wH/luQ==
X-Received: by 2002:a05:600c:244:b0:3fb:b1af:a455 with SMTP id
 4-20020a05600c024400b003fbb1afa455mr13210185wmj.5.1689077718548; 
 Tue, 11 Jul 2023 05:15:18 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.194.156])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a1ced03000000b003fc0062f0f8sm2429685wmh.9.2023.07.11.05.15.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Jul 2023 05:15:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 04/16] target/riscv: Restrict 'rv128' machine to TCG
 accelerator
Date: Tue, 11 Jul 2023 14:14:41 +0200
Message-Id: <20230711121453.59138-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230711121453.59138-1-philmd@linaro.org>
References: <20230711121453.59138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
index 5712a54404..faf703afcb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -495,6 +495,7 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
 #endif
 }
 
+#ifdef CONFIG_TCG
 static void rv128_base_cpu_init(Object *obj)
 {
     if (qemu_tcg_mttcg_enabled()) {
@@ -513,7 +514,10 @@ static void rv128_base_cpu_init(Object *obj)
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
@@ -595,7 +599,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     cpu->cfg.ext_icsr = true;
     cpu->cfg.pmp = true;
 }
-#endif
+#endif /* !TARGET_RISCV64 */
 
 #if defined(CONFIG_KVM)
 static void riscv_host_cpu_init(Object *obj)
@@ -2274,8 +2278,10 @@ static const TypeInfo riscv_cpu_type_infos[] = {
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


