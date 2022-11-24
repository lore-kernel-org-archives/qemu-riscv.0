Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyAkw-0003zg-3A
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 06:51:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkl-0003cA-Sk
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:50:51 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkf-0004rH-HO
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:50:51 -0500
Received: by mail-wr1-x432.google.com with SMTP id x17so2124685wrn.6
 for <qemu-riscv@nongnu.org>; Thu, 24 Nov 2022 03:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5KqcOcEgIFi0TOph9IghaJwhk/riQMZsEbqVRIdHQT0=;
 b=ApUEl7XienxaTZM34NxC40iIUE3iPt4pf0H75DjK1W/AiYLYUPiGbsZ3zUdJaGuXaw
 ZVQUK01taqHHpAU1BjMhZvTBZXYiHQ7fRLUhxHe1+dRWOOn2am7I53H+okPQ+Gfwguir
 eZ9AG+ZWs2nx6Mo7V6ZP4qLgeoE1FwfV00T6b207whdoWidowz9eHGn5aZcFYuhOlshb
 zIS0nR5c73PWxb3Hj7xDM1F+mPKXCcviZJ1xXNWqkbI3Iu4+c5qcXCUo4Z7c1pvqqxI3
 0R5o8rkCKU9dCr/M4o2RAnTiXgf8qfEvdpS+Rxh4DBYGYAoqDFa4edteV5LR4hIdzuTs
 yrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5KqcOcEgIFi0TOph9IghaJwhk/riQMZsEbqVRIdHQT0=;
 b=iZw/KD/WQnGxcnemuzIL8guOyFQwpHL5nJ0D2MwAlATpoVvjd1rewwGvLS93fkwDY7
 k9u3bzTpr+gnqcm8PdfICEFZSfuOp4+BrUMq1MxTmoT+OVyLBtR5AFAjBZuB1I9iKeIv
 nLgekuqx/wR8bEcCaCknSFEhbawhpbRYcrqX5/HyQGWt/uDiuFBLxQD48aTQFd2aMERd
 Z9yf/oNIEwHMEYXTDv/73JAugCXump0Bb1Kf9qb69o2UtAKqagI1zDBd2SvcuB2h1ey3
 mEU9NON9VOyC1vXDSeoxdq1wZPH3L+29UGz1AnfPSSE7GThEa7kl7+Prb1LTuIkUl+3D
 pxtg==
X-Gm-Message-State: ANoB5pnftWPzLs6CdyPqwM+FMJzNbTzGrIQiO/1J4LOUMivvdayQVUN+
 4bBtTV5c7mXVBWMaG7x14P5N1Q==
X-Google-Smtp-Source: AA0mqf7T70Ny510EyQ2/rB8va+6V0WbLEvdSgAUx64Qv4N9SVpjX7aQxSkfJzVbzZBhMLWeEik/fHw==
X-Received: by 2002:a05:6000:1d94:b0:238:3d85:8e2c with SMTP id
 bk20-20020a0560001d9400b002383d858e2cmr20372497wrb.650.1669290644214; 
 Thu, 24 Nov 2022 03:50:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:43 -0800 (PST)
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
Subject: [PATCH for-8.0 12/19] target/openrisc: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:15 +0000
Message-Id: <20221124115023.2437291-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
X-List-Received-Date: Thu, 24 Nov 2022 11:50:52 -0000

Convert the openrisc CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/openrisc/cpu.h |  4 ++--
 target/openrisc/cpu.c | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index 1d5efa5ca2f..5f607497052 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -34,7 +34,7 @@ OBJECT_DECLARE_CPU_TYPE(OpenRISCCPU, OpenRISCCPUClass, OPENRISC_CPU)
 /**
  * OpenRISCCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A OpenRISC CPU model.
  */
@@ -44,7 +44,7 @@ struct OpenRISCCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 #define TARGET_INSN_START_EXTRA_WORDS 1
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index de0176cd20c..4c11a1f7ada 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -70,13 +70,15 @@ static void openrisc_disas_set_info(CPUState *cpu, disassemble_info *info)
     info->print_insn = print_insn_or1k;
 }
 
-static void openrisc_cpu_reset(DeviceState *dev)
+static void openrisc_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     OpenRISCCPU *cpu = OPENRISC_CPU(s);
     OpenRISCCPUClass *occ = OPENRISC_CPU_GET_CLASS(cpu);
 
-    occ->parent_reset(dev);
+    if (occ->parent_phases.hold) {
+        occ->parent_phases.hold(obj);
+    }
 
     memset(&cpu->env, 0, offsetof(CPUOpenRISCState, end_reset_fields));
 
@@ -229,10 +231,12 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     OpenRISCCPUClass *occ = OPENRISC_CPU_CLASS(oc);
     CPUClass *cc = CPU_CLASS(occ);
     DeviceClass *dc = DEVICE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, openrisc_cpu_realizefn,
                                     &occ->parent_realize);
-    device_class_set_parent_reset(dc, openrisc_cpu_reset, &occ->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, openrisc_cpu_reset_hold, NULL,
+                                       &occ->parent_phases);
 
     cc->class_by_name = openrisc_cpu_class_by_name;
     cc->has_work = openrisc_cpu_has_work;
-- 
2.25.1


