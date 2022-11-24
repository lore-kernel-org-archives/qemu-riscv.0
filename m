Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyAkl-0003cG-VZ
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 06:50:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkZ-0003WL-Dg
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:50:41 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkT-0004qj-DM
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:50:39 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 l39-20020a05600c1d2700b003cf93c8156dso1059845wms.4
 for <qemu-riscv@nongnu.org>; Thu, 24 Nov 2022 03:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+6WeqXETEAN/JcQ5LzZg6NwphS26sTdkAogbV0qOYE4=;
 b=rwRVagaBLVz6jP/hsd7gDhmw4fr2FJ9MF3b1SaUrsyVjHlkg8DvPxh0PziMvz+wiTF
 ifosIa4hC0XFMhEMA5bvvP7bnmsR+GLasGAuNSZgExMGe+OVn+ZQWMBESx1wg5Eesj4F
 z+VsVrEmtUu1XoLR+XqK5RvA71Z2eDyKzINZfWOjZAIbapFtl6HwxTDc4Vp+cA6LFH2M
 v4qxIScGBgKoBJKv1UVxng4R4uLmwRIy9t4xZJAVYh19GifXwhitqkvzwVEc4vX+8jTK
 b3XSlIDKFEaVBS4sCXcIFIzLuPRolC++6YCFSvbRcm9+Z7vdyGWQ6NJ308GXHvR6kIET
 PAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+6WeqXETEAN/JcQ5LzZg6NwphS26sTdkAogbV0qOYE4=;
 b=YjlAeCLMKynflJDTsOxx+WKl44VxofBA+dTYyJZaf86Va15efJTMEc9lQktPHNCEKf
 fnjipwNJ74X3hspCahDpnP9AqvRrYTWZ4IieDg1u4ZZtcjQyC1f83MWSFvS4WPTu1gqv
 q24vgq/na21vrX+QyMm54VqtKaUwliWd5QabkIS8sCEtB0ZZbyPvHui3NZZWaZ9c+n+a
 BabuKrEqiWOfR5Qg7CdLz8oPe2JncVTxJNuLtIZJdRrzjimJhryjbnuPEC8LzHT0jWgD
 sHhCHZAbID5j18MWXPmaJmnC+yKQ4F5YuwsxFNApbrX1A9Iqt+Xw9EyHKWY/NXpNCbrj
 pC6g==
X-Gm-Message-State: ANoB5pmVVapzK57QrQxwFb/m4+kErN8s5qA4j24Mhrgm1r/qnoaHCVlV
 SbWDaIuJasgpq0YlA8cfdVVNeg==
X-Google-Smtp-Source: AA0mqf7n2cewtNRfcDNXrXFO0ZeJyHmEVBHD7yJeqJ/mrtgJ/JZpoP/FZ2ZOvVJ38lotr2UJ4Z9x8Q==
X-Received: by 2002:a1c:7c01:0:b0:3b3:3256:647 with SMTP id
 x1-20020a1c7c01000000b003b332560647mr9510555wmc.197.1669290630701; 
 Thu, 24 Nov 2022 03:50:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:30 -0800 (PST)
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
Subject: [PATCH for-8.0 03/19] target/avr: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:06 +0000
Message-Id: <20221124115023.2437291-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 24 Nov 2022 11:50:46 -0000

Convert the avr CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/avr/cpu-qom.h |  4 ++--
 target/avr/cpu.c     | 13 +++++++++----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/avr/cpu-qom.h b/target/avr/cpu-qom.h
index b5c3507d6d7..01ea5f160b6 100644
--- a/target/avr/cpu-qom.h
+++ b/target/avr/cpu-qom.h
@@ -31,7 +31,7 @@ OBJECT_DECLARE_CPU_TYPE(AVRCPU, AVRCPUClass, AVR_CPU)
 /**
  *  AVRCPUClass:
  *  @parent_realize: The parent class' realize handler.
- *  @parent_reset: The parent class' reset handler.
+ *  @parent_phases: The parent class' reset phase handlers.
  *
  *  A AVR CPU model.
  */
@@ -40,7 +40,7 @@ struct AVRCPUClass {
     CPUClass parent_class;
     /*< public >*/
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index c7295b488d1..d0139804b9f 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -67,14 +67,16 @@ static void avr_restore_state_to_opc(CPUState *cs,
     env->pc_w = data[0];
 }
 
-static void avr_cpu_reset(DeviceState *ds)
+static void avr_cpu_reset_hold(Object *obj)
 {
-    CPUState *cs = CPU(ds);
+    CPUState *cs = CPU(obj);
     AVRCPU *cpu = AVR_CPU(cs);
     AVRCPUClass *mcc = AVR_CPU_GET_CLASS(cpu);
     CPUAVRState *env = &cpu->env;
 
-    mcc->parent_reset(ds);
+    if (mcc->parent_phases.hold) {
+        mcc->parent_phases.hold(obj);
+    }
 
     env->pc_w = 0;
     env->sregI = 1;
@@ -223,9 +225,12 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     AVRCPUClass *mcc = AVR_CPU_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, avr_cpu_realizefn, &mcc->parent_realize);
-    device_class_set_parent_reset(dc, avr_cpu_reset, &mcc->parent_reset);
+
+    resettable_class_set_parent_phases(rc, NULL, avr_cpu_reset_hold, NULL,
+                                       &mcc->parent_phases);
 
     cc->class_by_name = avr_cpu_class_by_name;
 
-- 
2.25.1


