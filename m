Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyAkt-0003tz-Ld
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 06:50:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkb-0003Wb-U5
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:50:45 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkX-0004sb-RO
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:50:41 -0500
Received: by mail-wr1-x435.google.com with SMTP id i12so2186660wrb.0
 for <qemu-riscv@nongnu.org>; Thu, 24 Nov 2022 03:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q3oxmV+LQyJX4gwRTeeLTi9bBMYt6AFHuvPAkxNrKQk=;
 b=KF5tC616vplC3BrqVFj/zt75ZDrB4Tj9mZKmdjFUICCKLmp0De/sBJvmajFEUDioQE
 9tGRRNrhFIr1lXZinR2gjl3jseN8fNZozx0Cd1VlpsiFTsfmwgE4E5OaG31GTDFeeIqp
 tqpLelPlq2SuZvJgo96z8RRBWSxvavVS4ld1fsTZWYL7BCwT8RBQsNPwr66pcxjcl1dm
 VaJijjIyGlyUtxXUaLz2tPJMYbG7mNI48EYN2CRkusNCYu5vQq5Xg1PpY5zOkXWm7Sx+
 A92HHR7rZJaOTw/o5slS9bHxgdtei12q9vwmeWaZJ5tVYw9UPRtJZpIyqmS5yAjEO4/7
 JNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q3oxmV+LQyJX4gwRTeeLTi9bBMYt6AFHuvPAkxNrKQk=;
 b=X9cpeJFv/QBpay0XIE0RrRUqF64ooPREyMarqq3bI3MOUJHsz4qotW7M4lGCz4MNq0
 RyN3uoCdSFiEJyh3XmZ91bBrlBX6IiHUAtnc+n0FzE4paW8mlciAGVfmcjFY/4RYCDqq
 FmZDqAZyUn2HK3iiqeh4EDLXTH51nT3m+nYRWGSxo8a6bCQwCsn8zpaVQy+xf8g7yoyH
 f7IDcJAdtudOxDk4ucSvdK4szvj55zXI9lpZcFcHn1Xgzk3qIaKo3mZK0bxnwhP18gkU
 lnA+j18AWnWu2em4zoKwoyKrQtm/ECAdhN3zTtXV1mtXnB863pFZBEMzqKEWDJ72EHv+
 R4vg==
X-Gm-Message-State: ANoB5pnblXYpFhkrd43Hsc2L58z5ZhlUTSIsX4+eZaKMCOlrQbErqr1g
 kWKgAf4P4y1TEUv7vCQ8HX0ZeA==
X-Google-Smtp-Source: AA0mqf62RV0Xbmp3BupoS03uz8bV7zcQqfKOIODMqeR9EajcmtjVwo3k7MhREMA9kw1QAHZFOmiskA==
X-Received: by 2002:adf:edd1:0:b0:241:7d0a:65ef with SMTP id
 v17-20020adfedd1000000b002417d0a65efmr12760334wro.491.1669290635680; 
 Thu, 24 Nov 2022 03:50:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:34 -0800 (PST)
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
Subject: [PATCH for-8.0 06/19] target/i386: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:09 +0000
Message-Id: <20221124115023.2437291-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
X-List-Received-Date: Thu, 24 Nov 2022 11:50:49 -0000

Convert the i386 CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/i386/cpu-qom.h |  4 ++--
 target/i386/cpu.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
index c557a522e1e..2350f4ae609 100644
--- a/target/i386/cpu-qom.h
+++ b/target/i386/cpu-qom.h
@@ -42,7 +42,7 @@ typedef struct X86CPUModel X86CPUModel;
  * @migration_safe: See CpuDefinitionInfo::migration_safe
  * @static_model: See CpuDefinitionInfo::static
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * An x86 CPU model or family.
  */
@@ -67,7 +67,7 @@ struct X86CPUClass {
 
     DeviceRealize parent_realize;
     DeviceUnrealize parent_unrealize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 22b681ca37d..8f618cf0b25 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5878,9 +5878,9 @@ static void x86_cpu_set_sgxlepubkeyhash(CPUX86State *env)
 #endif
 }
 
-static void x86_cpu_reset(DeviceState *dev)
+static void x86_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     X86CPU *cpu = X86_CPU(s);
     X86CPUClass *xcc = X86_CPU_GET_CLASS(cpu);
     CPUX86State *env = &cpu->env;
@@ -5888,7 +5888,9 @@ static void x86_cpu_reset(DeviceState *dev)
     uint64_t xcr0;
     int i;
 
-    xcc->parent_reset(dev);
+    if (xcc->parent_phases.hold) {
+        xcc->parent_phases.hold(obj);
+    }
 
     memset(env, 0, offsetof(CPUX86State, end_reset_fields));
 
@@ -7112,6 +7114,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     X86CPUClass *xcc = X86_CPU_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
     FeatureWord w;
 
     device_class_set_parent_realize(dc, x86_cpu_realizefn,
@@ -7120,7 +7123,8 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
                                       &xcc->parent_unrealize);
     device_class_set_props(dc, x86_cpu_properties);
 
-    device_class_set_parent_reset(dc, x86_cpu_reset, &xcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, x86_cpu_reset_hold, NULL,
+                                       &xcc->parent_phases);
     cc->reset_dump_flags = CPU_DUMP_FPU | CPU_DUMP_CCOP;
 
     cc->class_by_name = x86_cpu_class_by_name;
-- 
2.25.1


