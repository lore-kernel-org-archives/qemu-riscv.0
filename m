Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyAkw-000406-8S
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 06:51:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkn-0003gn-Te
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:50:53 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkk-0004yB-R1
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:50:53 -0500
Received: by mail-wr1-x42b.google.com with SMTP id s5so2148076wru.1
 for <qemu-riscv@nongnu.org>; Thu, 24 Nov 2022 03:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tG2fS0Ltkyr6tkHuh7vNt9h6i4sUuPkno+hjIAk+/wY=;
 b=L3exwr8j7qW5/Y+l7P/HD6TGh97pFUliprBCrqZZ+PpR0xrhaN33PDSw7Lawxh2HtJ
 FAFa6a/wPj8GgPI43cEKfJeAMoc7Q8r2uL1xdiKuQxoaTTp2/F6yDV4Pm0ji007jNpZ8
 v8d4ysyCn73fYtM1JS/C76fioSFs3tbfB6jt1Lq8L18UsPzYi0Kj+WMnbpeCn6ON03Lx
 ogY/zSKXwQHjR6R+XfJKrIjuoawgJLOkJTN+Q+eGcq1KelfkD/U3szbS25NDiFOf1f9I
 Rjh6A8scYs7Z0yYgPuxkiKxwENCUI/tABqchPYcAU23ZBSph/gB9dEeUA6QjG32/Bp9J
 +ryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tG2fS0Ltkyr6tkHuh7vNt9h6i4sUuPkno+hjIAk+/wY=;
 b=LNVty+zxHQS7s6A+ndjl1wR5vyl0ABTiXktM4Wp9Yx89Qt41F29xL4EYQ6i64Z1rjq
 eJLAR8EF3smzJyL/o6Fnd2n7SMeYnA8yLsdr1nzkT6fDva67PXFmgtdlTaUrlvl5qavh
 QzCN5MT1zRzGXlZHDXb1O0h4taFioFZwSPrYTdKYSMmR2UnhV05GeRHOPlTBJKVN2CIP
 iSzcpB1l6oZC4e7PTM346LYaZczxwTyUA4E/iRe+P04Iu60qkJ+XcHIlds0Njc1pludo
 BeA5BNYWaB1jAKPwWpqtXQfidI/yygR8gNNsQGQNTK2LAIzRjiD3sRMtozkNZBJDtICm
 hTYA==
X-Gm-Message-State: ANoB5plDsz8eqKmsab1T5AS3p6VQrHYjIgmFmSpHY+BRFiH8JEHEZsgJ
 78MO5TbI0WCiTCotmOREqbdu6Q==
X-Google-Smtp-Source: AA0mqf5f/yavwCzVqASrpfQWTo1t22nlKCR1Vj7cAHPImfT0AAqehciFBVInBgsZReaWGxKriBCfgg==
X-Received: by 2002:adf:ee84:0:b0:241:e3b9:388a with SMTP id
 b4-20020adfee84000000b00241e3b9388amr7632130wro.252.1669290645620; 
 Thu, 24 Nov 2022 03:50:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:45 -0800 (PST)
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
Subject: [PATCH for-8.0 13/19] target/ppc: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:16 +0000
Message-Id: <20221124115023.2437291-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
X-List-Received-Date: Thu, 24 Nov 2022 11:50:54 -0000

Convert the ppc CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/ppc/cpu-qom.h  |  4 ++--
 target/ppc/cpu_init.c | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 89ff88f28c9..0fbd8b72468 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -143,7 +143,7 @@ typedef struct PPCHash64Options PPCHash64Options;
 /**
  * PowerPCCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A PowerPC CPU model.
  */
@@ -154,7 +154,7 @@ struct PowerPCCPUClass {
 
     DeviceRealize parent_realize;
     DeviceUnrealize parent_unrealize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
     void (*parent_parse_features)(const char *type, char *str, Error **errp);
 
     uint32_t pvr;
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index cbf00813743..95d25856a0e 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7031,16 +7031,18 @@ static bool ppc_cpu_has_work(CPUState *cs)
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
 
-static void ppc_cpu_reset(DeviceState *dev)
+static void ppc_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     PowerPCCPU *cpu = POWERPC_CPU(s);
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
     CPUPPCState *env = &cpu->env;
     target_ulong msr;
     int i;
 
-    pcc->parent_reset(dev);
+    if (pcc->parent_phases.hold) {
+        pcc->parent_phases.hold(obj);
+    }
 
     msr = (target_ulong)0;
     msr |= (target_ulong)MSR_HVB;
@@ -7267,6 +7269,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, ppc_cpu_realize,
                                     &pcc->parent_realize);
@@ -7275,7 +7278,8 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     pcc->pvr_match = ppc_pvr_match_default;
     device_class_set_props(dc, ppc_cpu_properties);
 
-    device_class_set_parent_reset(dc, ppc_cpu_reset, &pcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, ppc_cpu_reset_hold, NULL,
+                                       &pcc->parent_phases);
 
     cc->class_by_name = ppc_cpu_class_by_name;
     cc->has_work = ppc_cpu_has_work;
-- 
2.25.1


