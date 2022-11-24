Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyAl6-0004Ja-Cu
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 06:51:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkr-0003p5-Bm
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:50:57 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkl-0004sZ-Nj
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:50:57 -0500
Received: by mail-wr1-x42f.google.com with SMTP id n3so2128613wrp.5
 for <qemu-riscv@nongnu.org>; Thu, 24 Nov 2022 03:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S3Jdws9NvCIfw295ZttUjLBUb2PpFwX2bj3IRhSU5A8=;
 b=PkOsk4qVuo/MuRLFUJniiaA09XU9pH14Bhn2HS7I/15mFfImb8mD686rA2KBpENcoj
 t5B1+DHBIu16brPpTjDUITMB57t9XUxgKnKRtFaFh9Rp44tMptZnYrvLH9zVLMBjVSum
 Ne8gjKKk19bR+vIxZI82oXk8vLFtCmsa+gOoiuQIIpKZbu6cgfC6J8wVQb1aTA8gjXNg
 AO/ZvFT9OtwVTThpiJqfUy2DuJt4yHxKsmPI1wPjCMGAsOtvJYK5hXZo4TdivFtzGLw5
 YBvxhOXNFqm0qLhcryEQ2T1xH4fS9Jp5GfBSfYHd9VJAcDrcV39q5hNXVahey7IXyQNK
 g7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S3Jdws9NvCIfw295ZttUjLBUb2PpFwX2bj3IRhSU5A8=;
 b=0BLV9cYDbn2hVQ4lV9KpGCoNJqYXpcJYtRXiDINKk/LDY3d1qhO/tglDy4IMLj1RiL
 neFgDRRpH+AH9OVeVIh9Teu9JnQ+IKB6/T94HNtENkfF45Sc7aVPDjm1V6ll+tpU22dj
 +v+QaFBZcmrCSu3iAZKRfUymZxNU0DkZze7HGPDBdYEDfQE/xoFURSQ0ZxEvZHz9wuAU
 /m1d3WA4fR6QdO7PgKeab2zRAe+qE1HiNr/TImoAP/luSOCasWNu1Q+eN60Q39gNsgtJ
 ayT/TSzoed3V7zGxPgjXTqFZh5RWlwbCPUoXfOi5y2b9D5rmnVT94VYwfW4DlDjPEgBw
 hv9w==
X-Gm-Message-State: ANoB5pltfybIWgCefZ6sRtltuJfwa6Ag6nqYvqLaz2h3KxCwateF7SzX
 BwQnizU+wxwbpj6358k3xy75KA==
X-Google-Smtp-Source: AA0mqf5qcIbSCGNfiXHoG2UaLtMay8WHJrCcda6DZTa1qJy619qUhPGTm9xZ4A3W9zsIDfcbsyuTWA==
X-Received: by 2002:adf:f091:0:b0:241:b933:c416 with SMTP id
 n17-20020adff091000000b00241b933c416mr20770257wro.616.1669290649888; 
 Thu, 24 Nov 2022 03:50:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:49 -0800 (PST)
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
Subject: [PATCH for-8.0 16/19] target/sh4: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:19 +0000
Message-Id: <20221124115023.2437291-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
X-List-Received-Date: Thu, 24 Nov 2022 11:50:57 -0000

Convert the sh4 CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/sh4/cpu-qom.h |  4 ++--
 target/sh4/cpu.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/sh4/cpu-qom.h b/target/sh4/cpu-qom.h
index d4192d10908..89785a90f02 100644
--- a/target/sh4/cpu-qom.h
+++ b/target/sh4/cpu-qom.h
@@ -34,7 +34,7 @@ OBJECT_DECLARE_CPU_TYPE(SuperHCPU, SuperHCPUClass, SUPERH_CPU)
 /**
  * SuperHCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  * @pvr: Processor Version Register
  * @prr: Processor Revision Register
  * @cvr: Cache Version Register
@@ -47,7 +47,7 @@ struct SuperHCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 
     uint32_t pvr;
     uint32_t prr;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 453268392bf..951eb6b9c8d 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -87,14 +87,16 @@ static bool superh_cpu_has_work(CPUState *cs)
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
 
-static void superh_cpu_reset(DeviceState *dev)
+static void superh_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     SuperHCPU *cpu = SUPERH_CPU(s);
     SuperHCPUClass *scc = SUPERH_CPU_GET_CLASS(cpu);
     CPUSH4State *env = &cpu->env;
 
-    scc->parent_reset(dev);
+    if (scc->parent_phases.hold) {
+        scc->parent_phases.hold(obj);
+    }
 
     memset(env, 0, offsetof(CPUSH4State, end_reset_fields));
 
@@ -274,11 +276,13 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     SuperHCPUClass *scc = SUPERH_CPU_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, superh_cpu_realizefn,
                                     &scc->parent_realize);
 
-    device_class_set_parent_reset(dc, superh_cpu_reset, &scc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, superh_cpu_reset_hold, NULL,
+                                       &scc->parent_phases);
 
     cc->class_by_name = superh_cpu_class_by_name;
     cc->has_work = superh_cpu_has_work;
-- 
2.25.1


