Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyAl8-0004Li-O8
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 06:51:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAku-0003ws-5V
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:51:00 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAko-000517-2D
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:50:59 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 i64-20020a1c3b43000000b003d016c21100so3745033wma.3
 for <qemu-riscv@nongnu.org>; Thu, 24 Nov 2022 03:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DGCmc5zG7qiC9O+a1Tf+YC4O8NghpHhNCp4cgIMeJEM=;
 b=wAw5HxTRUcw0IdM23IH/clxdS6CtzahTsyWOEaUM+5oL5JVQ2eCbmTeZXfxUMUuTSu
 R3ijriwlBCg4SjzN474ER5ZCYVYS3+ozndMgAwF1aNGYunYox3GR5s13gLyCkIPp9ev5
 YNyYaOxu3iC7Psh+LFmJOccl5HNoE1E7JxKrWRR9+qiPRytxOoiqKw/+oW2fLdAp5X5N
 0jNQFoXaCHOxXdcwPkmmJyNIjCmAyQkty1KiDnTeDhHjrc4bSH2TAo6kgja3gk9niJit
 caHLQhgndfFzQzVNus/pLXiZPBupbzKneeUpqH3lknGbnF7SlVLYaqHjnxbTQc1dsYy+
 BRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DGCmc5zG7qiC9O+a1Tf+YC4O8NghpHhNCp4cgIMeJEM=;
 b=GCjlcD4d7339ro6tk7W2WTMar8LF4YlOwHbpFGXjyi3trd0vraD1cOEjSU/Kv0OEXp
 pD5Z7VUZD/yxhTbP6EN4oRv59N4sAfQ329rpyARrxpGqfkKlhHKibX/C3TE9RTMNLwwS
 LI+qglqRkpXNdBrFC1g+8FYVZxs7WH/Auzv4d0jDYJPFGGMefzF5gFl+igqvzwIIZyQu
 Gpc/OawGrYZsuOfyiS6sicFFxRwYXOYs7vsRPWmks+NVa9hlAi8ctgKgQhcdqlsocSjG
 BZJui/v3Z54iT6tD8dWLabE5wSXDJ+PmkPz+GnPGiIOGnlRT7nE9No/QyGzgPVk73NTq
 NJ7g==
X-Gm-Message-State: ANoB5pmBXnpTNQPk/QUcHkoAXpU45jjSFTR5zOi+nIQUacEpvrzZHsWx
 dEbIO8w2FSmyke1NnUipoQfydA==
X-Google-Smtp-Source: AA0mqf6YZB+B8KcDYlk1OLbMLma9JttmSr8Qco+popAtYfslC+YYEWBmIASYfOgzvbDEeiqljRhL8A==
X-Received: by 2002:a05:600c:1d93:b0:3cf:d0ba:e5ff with SMTP id
 p19-20020a05600c1d9300b003cfd0bae5ffmr23047297wms.36.1669290652711; 
 Thu, 24 Nov 2022 03:50:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:52 -0800 (PST)
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
Subject: [PATCH for-8.0 18/19] target/tricore: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:21 +0000
Message-Id: <20221124115023.2437291-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
X-List-Received-Date: Thu, 24 Nov 2022 11:51:00 -0000

Convert the tricore CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/tricore/cpu-qom.h |  2 +-
 target/tricore/cpu.c     | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/tricore/cpu-qom.h b/target/tricore/cpu-qom.h
index ee24e9fa76a..612731daa09 100644
--- a/target/tricore/cpu-qom.h
+++ b/target/tricore/cpu-qom.h
@@ -32,7 +32,7 @@ struct TriCoreCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 2c54a2825f8..594cd1efd5e 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -68,14 +68,16 @@ static void tricore_restore_state_to_opc(CPUState *cs,
     env->PC = data[0];
 }
 
-static void tricore_cpu_reset(DeviceState *dev)
+static void tricore_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     TriCoreCPU *cpu = TRICORE_CPU(s);
     TriCoreCPUClass *tcc = TRICORE_CPU_GET_CLASS(cpu);
     CPUTriCoreState *env = &cpu->env;
 
-    tcc->parent_reset(dev);
+    if (tcc->parent_phases.hold) {
+        tcc->parent_phases.hold(obj);
+    }
 
     cpu_state_reset(env);
 }
@@ -180,11 +182,13 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
     TriCoreCPUClass *mcc = TRICORE_CPU_CLASS(c);
     CPUClass *cc = CPU_CLASS(c);
     DeviceClass *dc = DEVICE_CLASS(c);
+    ResettableClass *rc = RESETTABLE_CLASS(c);
 
     device_class_set_parent_realize(dc, tricore_cpu_realizefn,
                                     &mcc->parent_realize);
 
-    device_class_set_parent_reset(dc, tricore_cpu_reset, &mcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, tricore_cpu_reset_hold, NULL,
+                                       &mcc->parent_phases);
     cc->class_by_name = tricore_cpu_class_by_name;
     cc->has_work = tricore_cpu_has_work;
 
-- 
2.25.1


