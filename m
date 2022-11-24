Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyAkn-0003ej-4W
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 06:50:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAka-0003WQ-LU
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:50:43 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkW-0004rv-Qp
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:50:40 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so3774999wma.1
 for <qemu-riscv@nongnu.org>; Thu, 24 Nov 2022 03:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lxcgvzwggkDla5d1Sb8Xn1+c+5tt8+jDbD3DONm2szU=;
 b=KDti8LMDP9qmDFJWzbaK5euUkCQCDTawxBacqMpqCIk9xr/PbtChFnvEyzmDd1f2Mp
 Al8GwgwJUUY3434vcwY9xwBpfQD7ZNnw1uawDzNKmVnp1gYXg5q2je5isKRmdTlq2jQp
 SCMYkIN7y/5WRj/8qnYbCgwA+gpVqhniXkmWEiXvwtMjM0l9aKbwkDLzvkAlNErz5Xth
 Rm4XxrwMIYTVf860P8muGy5EXedup8NjKGIqM6F0pIxjnoJORBmslkp5VtlgTmfTAWxq
 iq05HKgNFyILOkQfUOdfpldBVT+JrqS4oBeZWI4BBBmcqJOtFd44O1U90eeepXL36kqK
 KQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lxcgvzwggkDla5d1Sb8Xn1+c+5tt8+jDbD3DONm2szU=;
 b=uJnRq15m8nA81UKeQJFXlpsYkletxBAwB614VHuR311ogH/YnyX7lyMrMA5+Oiq5cR
 RaFLk/0kWRAYcYblBEvoF29sOLdM5LeSKxNIhkeQvda3y99M7UQMHJDkLrQL/CIRqfKl
 VOQWLQY7wWJk9sjGGhxyTMOS3dbHoyfNL2Pz1Isye7Fq9F9xsMxio6/KWUZBPAhTADRC
 KX3qhH+509hWS4UfiCkD3eqdTKWya+j7HnONYAsfHOceeikWycdl67YI/jav33JF/Gqk
 Ld73ozLon3YBIJCnV8w6HgCcW3ZgBIDD97LEgvle3soEPjFZJ46e07mfpSaBipSw+bbQ
 v7vA==
X-Gm-Message-State: ANoB5pnVv5FX+ecGvaPUWCS+bHM1+auKa8EKxzESbNT5g9NvN/w1+asY
 IWVdwlChAdOdM0UXeCq5IOsBWg==
X-Google-Smtp-Source: AA0mqf43UsB3ETM6tnMRs2wZAk6ihYspQnwxGBK2BmvArOAccIDuRfX6vIRNVL5nXq6pB0TP++MgMw==
X-Received: by 2002:a05:600c:1c92:b0:3cf:88cf:1f8e with SMTP id
 k18-20020a05600c1c9200b003cf88cf1f8emr14329910wms.9.1669290633481; 
 Thu, 24 Nov 2022 03:50:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:32 -0800 (PST)
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
Subject: [PATCH for-8.0 05/19] target/hexagon: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:08 +0000
Message-Id: <20221124115023.2437291-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
X-List-Received-Date: Thu, 24 Nov 2022 11:50:48 -0000

Convert the hexagon CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/hexagon/cpu.h |  2 +-
 target/hexagon/cpu.c | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 2a65a57bab3..794a0453fd4 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -137,7 +137,7 @@ typedef struct HexagonCPUClass {
     CPUClass parent_class;
     /*< public >*/
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 } HexagonCPUClass;
 
 struct ArchCPU {
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 03221fbdc28..658ca4ff783 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -281,14 +281,16 @@ static void hexagon_restore_state_to_opc(CPUState *cs,
     env->gpr[HEX_REG_PC] = data[0];
 }
 
-static void hexagon_cpu_reset(DeviceState *dev)
+static void hexagon_cpu_reset_hold(Object *obj)
 {
-    CPUState *cs = CPU(dev);
+    CPUState *cs = CPU(obj);
     HexagonCPU *cpu = HEXAGON_CPU(cs);
     HexagonCPUClass *mcc = HEXAGON_CPU_GET_CLASS(cpu);
     CPUHexagonState *env = &cpu->env;
 
-    mcc->parent_reset(dev);
+    if (mcc->parent_phases.hold) {
+        mcc->parent_phases.hold(obj);
+    }
 
     set_default_nan_mode(1, &env->fp_status);
     set_float_detect_tininess(float_tininess_before_rounding, &env->fp_status);
@@ -339,11 +341,13 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
     HexagonCPUClass *mcc = HEXAGON_CPU_CLASS(c);
     CPUClass *cc = CPU_CLASS(c);
     DeviceClass *dc = DEVICE_CLASS(c);
+    ResettableClass *rc = RESETTABLE_CLASS(c);
 
     device_class_set_parent_realize(dc, hexagon_cpu_realize,
                                     &mcc->parent_realize);
 
-    device_class_set_parent_reset(dc, hexagon_cpu_reset, &mcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, hexagon_cpu_reset_hold, NULL,
+                                       &mcc->parent_phases);
 
     cc->class_by_name = hexagon_cpu_class_by_name;
     cc->has_work = hexagon_cpu_has_work;
-- 
2.25.1


