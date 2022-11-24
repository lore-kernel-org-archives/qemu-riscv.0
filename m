Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyAkn-0003fa-HJ
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 06:50:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkf-0003XK-S2
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:50:47 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkZ-0004ur-Qt
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:50:44 -0500
Received: by mail-wr1-x431.google.com with SMTP id x17so2124323wrn.6
 for <qemu-riscv@nongnu.org>; Thu, 24 Nov 2022 03:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tSG1Pvc6m8SnTYZhtJnHT4zBC5AegvUy/RzVsBJxFvM=;
 b=HisP1vEH09VESx7i8+MbNnveYSd6zREVfrB87gWzdyqhrcGoByZnE9EdQESORV2LVx
 y1/L69WKqJ8Y1S6NXzQyEAIeVs6UNdaq1C4MPWrkhq9Dw8vqaFcV2XjYSxKKpC28vLkH
 Khae5lsZKAheohs8dvRZcakjj3xMndKdpbIy3/S4cUQtiIKlLxFY2QMoj7rFfpJ//vjs
 SN1lIQRTpIPivuvQpfnNL5le3OoQCBqb7eZLzdYlJwv1wFM9zzLlrW0wVEjnEVrGr5cx
 7OUo1TFI1YUb7mCYNRmQUfwfv/0XFkPaJSKz4u07YNhv9bPoEA0kGxpRYGeql0dXUTyU
 0igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tSG1Pvc6m8SnTYZhtJnHT4zBC5AegvUy/RzVsBJxFvM=;
 b=QLoyG2JgAOE4lgnFaVSSpaekpPMY8yx9Cd2V5zbn37iuW0j97OXzvEHFCEWLZF5JAd
 WOoApafr1vr4klsU/9IqydcTLOc7AJ6s8e/704BW8xN4IFFkdfURmpBsdvVgNYWkJClT
 GbFFBj4y2RNG7klZEprmn79GHGaBtPn34Fwa7yMsGwA6AaJRQWMKyjy4jc/gLJh0fLwF
 HOxPsWzvTCT5p3w4D48mbzxewdphS+mcwKQ/OIalCngtRiIsd+25lnnzB/AaU1q8EklF
 ZpfikEp9qNJ3BaHHs85Rr6U3U+RD/YExmWYfWwP9nYeNlLn7Wzq52MjKJxa94V3gpTYU
 GlRg==
X-Gm-Message-State: ANoB5pkwmZc6y0XFVWL/p+VCB82Np6QcrxfdaKD11n29AdXhC3YF7fIG
 c1U7tT0pqdobJL+CppuCxVbZAA==
X-Google-Smtp-Source: AA0mqf475frrQw4TOF0CDBS6Naz4c2Z3TxwU3ZDvJZ5pbCg1Z2BCFqNgEWrUCdXhc1hj0S+hXS23OQ==
X-Received: by 2002:adf:e3d2:0:b0:241:d676:a787 with SMTP id
 k18-20020adfe3d2000000b00241d676a787mr12028072wrm.694.1669290638551; 
 Thu, 24 Nov 2022 03:50:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH for-8.0 08/19] target/m68k: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:11 +0000
Message-Id: <20221124115023.2437291-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
X-List-Received-Date: Thu, 24 Nov 2022 11:50:50 -0000

Convert the m68k CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/m68k/cpu-qom.h |  4 ++--
 target/m68k/cpu.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/m68k/cpu-qom.h b/target/m68k/cpu-qom.h
index cd9687192cd..0ec7750a926 100644
--- a/target/m68k/cpu-qom.h
+++ b/target/m68k/cpu-qom.h
@@ -30,7 +30,7 @@ OBJECT_DECLARE_CPU_TYPE(M68kCPU, M68kCPUClass, M68K_CPU)
 /*
  * M68kCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A Motorola 68k CPU model.
  */
@@ -40,7 +40,7 @@ struct M68kCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index b67ddea2aee..99af1ab541a 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -66,16 +66,18 @@ static void m68k_unset_feature(CPUM68KState *env, int feature)
     env->features &= ~BIT_ULL(feature);
 }
 
-static void m68k_cpu_reset(DeviceState *dev)
+static void m68k_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     M68kCPU *cpu = M68K_CPU(s);
     M68kCPUClass *mcc = M68K_CPU_GET_CLASS(cpu);
     CPUM68KState *env = &cpu->env;
     floatx80 nan = floatx80_default_nan(NULL);
     int i;
 
-    mcc->parent_reset(dev);
+    if (mcc->parent_phases.hold) {
+        mcc->parent_phases.hold(obj);
+    }
 
     memset(env, 0, offsetof(CPUM68KState, end_reset_fields));
 #ifdef CONFIG_SOFTMMU
@@ -552,10 +554,12 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     M68kCPUClass *mcc = M68K_CPU_CLASS(c);
     CPUClass *cc = CPU_CLASS(c);
     DeviceClass *dc = DEVICE_CLASS(c);
+    ResettableClass *rc = RESETTABLE_CLASS(c);
 
     device_class_set_parent_realize(dc, m68k_cpu_realizefn,
                                     &mcc->parent_realize);
-    device_class_set_parent_reset(dc, m68k_cpu_reset, &mcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, m68k_cpu_reset_hold, NULL,
+                                       &mcc->parent_phases);
 
     cc->class_by_name = m68k_cpu_class_by_name;
     cc->has_work = m68k_cpu_has_work;
-- 
2.25.1


