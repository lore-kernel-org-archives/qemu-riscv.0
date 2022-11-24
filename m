Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyAl5-0004Hc-3V
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 06:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkq-0003lo-L8
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:50:56 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkl-0004rK-Kk
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:50:56 -0500
Received: by mail-wr1-x431.google.com with SMTP id g12so2095353wrs.10
 for <qemu-riscv@nongnu.org>; Thu, 24 Nov 2022 03:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MFE1O9xiQQWnFHGp/WY//FqcZkxp+HYvGoY9ooQPAPM=;
 b=UFoApCbZLIbcIY+4buWocXk7sDktO+kT7xCKWW5EPBLTiw9MEOFWxSARVXfa9b3T+y
 X78+zmD+JXHVTJA2Lg6G1RHB5upnsrfX85qgS4yyB41ILAqmsDTR0bJ8RbF5yI4T/9Bb
 gr+W22QsJBF/6iw2zcgtF+5fx53v9EJ4XUNt88v/ImJ5GMZV41Bk/F5Mi7mHx1sGw7G3
 WnCWvBoE9sjw6tARR/rvp7lV7J5wSu6E/TFBYnYfiAQ/4t6W+RALRAqUg6BLSxpbUcjb
 Sa8cTGQ4hCm8KWmxxJneCqMh0gYoP982i4SHB1FQ6IUG2sW/sAMYjy6Vx6GlI6oc8Xi+
 IS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MFE1O9xiQQWnFHGp/WY//FqcZkxp+HYvGoY9ooQPAPM=;
 b=Q5iU4ctY+cCTXPW04dxPOtFuuI4wOor43p/5ha11QegnutYu8JaShatRQuKpnoLdVI
 fQn+Duni6RWZo97xVV2WqRPtc1/2TYAtXchku1NhEs/lXnrPAjtJFkEX2B0Tq7utKP4A
 D3tGQeSM5RTk+ppNVzIuyolktxB6MjTYUhPej/iFxAamok423mX8aiQmAYDVVZzVtUcY
 XATkTxxVBPnJzGe2M5TJkdu3FZAeMdcPMvUnzA+uzQ6KqM3K7fpTmJZZfrDX2L0jsJGQ
 5eOPKo4zdI7qED6bXXpteLTG/YgglsJ51YVviqCD0PO4UAkGZshGk44lDlLVQKaFWkyx
 W1hQ==
X-Gm-Message-State: ANoB5pkvylziAoYUoYaPyabozU8lq6I5oqGnePlI9g0wL/WuFKE+4skk
 Zxf2tZadzGroOTUH0jeIFvczcg==
X-Google-Smtp-Source: AA0mqf6IZXgIAVAK489mgoh3lTXHM021njbA+3C8u9cZLlfMoW3P2+i57eP/9hPwceSTr/Sd7PMmuw==
X-Received: by 2002:adf:b649:0:b0:241:cefe:239b with SMTP id
 i9-20020adfb649000000b00241cefe239bmr13801986wre.531.1669290648550; 
 Thu, 24 Nov 2022 03:50:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:47 -0800 (PST)
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
Subject: [PATCH for-8.0 15/19] target/rx: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:18 +0000
Message-Id: <20221124115023.2437291-16-peter.maydell@linaro.org>
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
X-List-Received-Date: Thu, 24 Nov 2022 11:50:56 -0000

Convert the rx CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/rx/cpu-qom.h |  4 ++--
 target/rx/cpu.c     | 13 ++++++++-----
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/target/rx/cpu-qom.h b/target/rx/cpu-qom.h
index 4533759d966..1c8466a1870 100644
--- a/target/rx/cpu-qom.h
+++ b/target/rx/cpu-qom.h
@@ -31,7 +31,7 @@ OBJECT_DECLARE_CPU_TYPE(RXCPU, RXCPUClass, RX_CPU)
 /*
  * RXCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A RX CPU model.
  */
@@ -41,7 +41,7 @@ struct RXCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 #endif
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 9003c6e9fed..219ef28e463 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -62,14 +62,16 @@ static bool rx_cpu_has_work(CPUState *cs)
         (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR);
 }
 
-static void rx_cpu_reset(DeviceState *dev)
+static void rx_cpu_reset_hold(Object *obj)
 {
-    RXCPU *cpu = RX_CPU(dev);
+    RXCPU *cpu = RX_CPU(obj);
     RXCPUClass *rcc = RX_CPU_GET_CLASS(cpu);
     CPURXState *env = &cpu->env;
     uint32_t *resetvec;
 
-    rcc->parent_reset(dev);
+    if (rcc->parent_phases.hold) {
+        rcc->parent_phases.hold(obj);
+    }
 
     memset(env, 0, offsetof(CPURXState, end_reset_fields));
 
@@ -215,11 +217,12 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     CPUClass *cc = CPU_CLASS(klass);
     RXCPUClass *rcc = RX_CPU_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     device_class_set_parent_realize(dc, rx_cpu_realize,
                                     &rcc->parent_realize);
-    device_class_set_parent_reset(dc, rx_cpu_reset,
-                                  &rcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, rx_cpu_reset_hold, NULL,
+                                       &rcc->parent_phases);
 
     cc->class_by_name = rx_cpu_class_by_name;
     cc->has_work = rx_cpu_has_work;
-- 
2.25.1


