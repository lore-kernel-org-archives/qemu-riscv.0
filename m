Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15500EB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 06:34:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEOje-0002gv-6D; Wed, 28 Jun 2023 02:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEOjc-0002gJ-0A
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 02:33:00 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEOja-0002wT-6v
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 02:32:59 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fba5a8af2cso15915815e9.3
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 23:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687933976; x=1690525976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E9sCTggNurZWXESMN+if2ZIuv9/6vPN9d2Ktd0eVqSU=;
 b=gtVJdoC0cncKhmmHWybUb/1rphAKZXI8pMfRNpI6R00p14vCl554G8lSpin+j5E1+N
 mzVTnxWtv6aynUELLt1kYHfjzJla+627dDkUWX0I49Hhbi+pdI7RzE1lvtaQzIp4A/vj
 f4QU5634OJXonZ4DRZMI/zam6WZqNdCbgnbPzmLQSYBmIgJotNHI/k1TstfbRDTQIGd9
 uw5j7AEWWHgsdSuXZ52D4b32M8y8rw+Uh0j8gFOJtcEQ0v39lnNiMH54to3g5NIjrr59
 ZJQz82tU7atfg2kXQBWOQMS40b2XzKABBzkh4i4Dx3c0/22ceXXb1KqiDgk5/lOCOA5d
 Xy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687933976; x=1690525976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E9sCTggNurZWXESMN+if2ZIuv9/6vPN9d2Ktd0eVqSU=;
 b=LQFiXJs5qaYkfX7oaTLc0CpZHclIu3Ng4K5HvcucmfKydoxte4c3CHiGZ4+8hbWhUq
 9ukpQ6vwhlKgKfF83supbFELOX7TtkMR/TXrPJnQYrneBiH5Ax8n48wmwluwEASQTa5T
 TAHJKa+pr9MANKsZRHLve4/rplXRTH0NOqWbPYExXvAnBYeJ6HKzNKTP2UWKg2Q3Gi+C
 iJ2IWt58/NJyq+9K98M0/mMmCnh4iYa0vI7XmyJrl8jZLcYkBxVdi31ZJTsA0pXXyzSM
 S60umsG26+rghBtqFu1gyKdAp2I+ZtaH1ECuv1F53otYyKAGS2CQ6qQIjRR7MZOEXzQA
 u7Xg==
X-Gm-Message-State: AC+VfDwexqg8g/U1Ryc8KRLKWrlROD5AB/SESKyLYc1gP5UCor8Lkife
 Pbbyvm791ZSHU0Lz2LthQfFFD4u0S8BVmwr6+Io=
X-Google-Smtp-Source: ACHHUZ7S9li2rjvS5ciAHa6hYOfippk29zGrLSVjCb+Q6QGiqepK36bb/2f5w//LgN85QD4Fbsr/EQ==
X-Received: by 2002:a05:600c:2184:b0:3fa:770c:5918 with SMTP id
 e4-20020a05600c218400b003fa770c5918mr11954741wme.9.1687933976509; 
 Tue, 27 Jun 2023 23:32:56 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.207.229])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a056000194a00b0031134bcdacdsm12446215wry.42.2023.06.27.23.32.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Jun 2023 23:32:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 3/4] target/riscv: Restrict 'rv128' machine to TCG
 accelerator
Date: Wed, 28 Jun 2023 08:32:33 +0200
Message-Id: <20230628063234.32544-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230628063234.32544-1-philmd@linaro.org>
References: <20230628063234.32544-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index d9a3684b3e..5762ff68b4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -476,6 +476,7 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
 #endif
 }
 
+#ifdef CONFIG_TCG
 static void rv128_base_cpu_init(Object *obj)
 {
     if (qemu_tcg_mttcg_enabled()) {
@@ -494,7 +495,10 @@ static void rv128_base_cpu_init(Object *obj)
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
@@ -576,7 +580,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     cpu->cfg.ext_icsr = true;
     cpu->cfg.pmp = true;
 }
-#endif
+#endif /* !TARGET_RISCV64 */
 
 #if defined(CONFIG_KVM)
 static void riscv_host_cpu_init(Object *obj)
@@ -1951,8 +1955,10 @@ static const TypeInfo riscv_cpu_type_infos[] = {
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


