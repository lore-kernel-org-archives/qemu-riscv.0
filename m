Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyAlA-0004N1-7O
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 06:51:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkv-0003yb-CW
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:51:01 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkp-000522-Em
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:51:01 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so3765436wmb.2
 for <qemu-riscv@nongnu.org>; Thu, 24 Nov 2022 03:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CJxN8OwLvz4RIGrwju4T4c5A0ASCmNoxWaI71mOwfMg=;
 b=WYCZu0FBoPLym6lgz2W4phD1L4vtnHcb9H8Jd2tcm2xIojsGTcWN0xG3UI2tfP+jle
 l9oT48HYjdf/xL48l5BQFqOS+i6ZmpnnVk3t1sE0KokrFOWeRFx+N9UmfwW4bqfcoomj
 rQgVoL/lgb27BNAvGD6SBVvhgDQM+CrqXxZ9zwqopKmWwODz1ouLzbhCase9ybioYvGZ
 vWWVrbupwi091AAcoQxPNckEynMUUEZ2W+gl9a3M1loa2nR8ZQN5ISu/PdHYXorelk/y
 MCRN6wz4P7F20jHbjnj7SxGCk9BvLP3qs/zRg8O09nCJKN60ig4WFV/CdaTqGId4yWmP
 SZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CJxN8OwLvz4RIGrwju4T4c5A0ASCmNoxWaI71mOwfMg=;
 b=6tT1CDZ4ba5erLmah4BUNdN8/UqBnbWk8XQ7hdOTu7CVFsYeRf6gjWD0crYZVmbcE9
 VajZWuJN0n7omfeJfOiiROfJ6iCl2Leb7RTqYHtq6mnnWr1pURXGJWBlLyuX0zo0SsFg
 NRB6eFKAnIDsFSJyNwaoAixlfx6CkvwHTE75TndXbjqEJa/FlJzz0RKNl4WfDO1tyL++
 0B/KY5RW5L3PYHYorVjPk2NGRrsLipshGI2hAtzNTPTiCgD2/uIjCkzpNk49vXzN6lAv
 6+IC2Ndpw2FuvodwZb+fypg275tO2k/wqsROBy/uzZxAwmB4hOALfZzAuX2uyJV0h36A
 DQDw==
X-Gm-Message-State: ANoB5pkGpyAJmGhGrICFjGqRjBRbT97msoQ4jgPFvwC1U54fOMfwdw3u
 c/1uK8LZTLy4znn8lv3XwJXpKg==
X-Google-Smtp-Source: AA0mqf7EPxDZ/HGZK0wIFPJP8zrrYafw7pd0hNY0Y59CTlBvWAp0cbdpsR0dIYwfg60b9gBaI/zYNw==
X-Received: by 2002:a05:600c:18a1:b0:3cf:a9d5:36c7 with SMTP id
 x33-20020a05600c18a100b003cfa9d536c7mr9505500wmp.13.1669290654048; 
 Thu, 24 Nov 2022 03:50:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:53 -0800 (PST)
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
Subject: [PATCH for-8.0 19/19] target/xtensa: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:22 +0000
Message-Id: <20221124115023.2437291-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
X-List-Received-Date: Thu, 24 Nov 2022 11:51:01 -0000

Convert the xtensa CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/xtensa/cpu-qom.h |  4 ++--
 target/xtensa/cpu.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/xtensa/cpu-qom.h b/target/xtensa/cpu-qom.h
index 4fc35ee49b8..419c7d8e4a3 100644
--- a/target/xtensa/cpu-qom.h
+++ b/target/xtensa/cpu-qom.h
@@ -41,7 +41,7 @@ typedef struct XtensaConfig XtensaConfig;
 /**
  * XtensaCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  * @config: The CPU core configuration.
  *
  * An Xtensa CPU model.
@@ -52,7 +52,7 @@ struct XtensaCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 
     const XtensaConfig *config;
 };
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 09923301c40..2dc8f2d232f 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -85,16 +85,18 @@ bool xtensa_abi_call0(void)
 }
 #endif
 
-static void xtensa_cpu_reset(DeviceState *dev)
+static void xtensa_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     XtensaCPU *cpu = XTENSA_CPU(s);
     XtensaCPUClass *xcc = XTENSA_CPU_GET_CLASS(cpu);
     CPUXtensaState *env = &cpu->env;
     bool dfpu = xtensa_option_enabled(env->config,
                                       XTENSA_OPTION_DFP_COPROCESSOR);
 
-    xcc->parent_reset(dev);
+    if (xcc->parent_phases.hold) {
+        xcc->parent_phases.hold(obj);
+    }
 
     env->pc = env->config->exception_vector[EXC_RESET0 + env->static_vectors];
     env->sregs[LITBASE] &= ~1;
@@ -240,11 +242,13 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     XtensaCPUClass *xcc = XTENSA_CPU_CLASS(cc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, xtensa_cpu_realizefn,
                                     &xcc->parent_realize);
 
-    device_class_set_parent_reset(dc, xtensa_cpu_reset, &xcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, xtensa_cpu_reset_hold, NULL,
+                                       &xcc->parent_phases);
 
     cc->class_by_name = xtensa_cpu_class_by_name;
     cc->has_work = xtensa_cpu_has_work;
-- 
2.25.1


