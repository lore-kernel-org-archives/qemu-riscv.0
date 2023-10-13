Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F12DCDB47E
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 14:04:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrIl1-0008GZ-Gd; Fri, 13 Oct 2023 10:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIjp-0006Xg-MU
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:02:02 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIjh-0002DU-Lk
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:02:01 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-53da72739c3so3718474a12.3
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 07:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697205711; x=1697810511; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ct6nqOkWPITqikpho6LzBF9JTwL/xSnZhZ7aKNqCpWg=;
 b=uu4RGZRGD8JKoiIilgiVEOqLk6vLunYr366a1gSYzH5lZ3t3yOaKrgQXzmTY1MsBEG
 a9wX2y3pBGNbky+FcLJ3bsicE6sgrPlfUP3EXvhaf0Kg3VGeYqJEBvEcA7Z7kWe76iEj
 waGcDNMekdzg6KUvmL2CHX2/9xQ9/CCu4fj+nz+sPjJbh50Qcj5v0JYGiQORxYJYSYaI
 NjThwtS6S0NaPF8nk028CFw3CDue2CcrF2+0dBGJrJUdDGirO4xdENoLURcpwonJ2DQ2
 o6MJIb1YtXDDv5j1rLEycnwMTOXd2bcJ5SIKI9Orw99G9kVdZFbWT0f8W0/crVu0G4xo
 EAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205711; x=1697810511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ct6nqOkWPITqikpho6LzBF9JTwL/xSnZhZ7aKNqCpWg=;
 b=ahdPX3HFX6KcGkEtyLwi1pZgjnDj6KdVasvbU1Czh7WioSan875LuJD7ZoefM6jKXH
 Uy6F0MawGxUUYAy/+YCudwXZv+rJoZqiAWC8gkGPPuukAqcXyii3qLCo1nnM/Q8j8Pmz
 Rt2Kf6K5LvBkm2PrVyTkXNIvgtUwlC4AuvFJiRkI4iTkUHYNcUYMfTfHzpn1C3gu6FWV
 xzmaiw0vKcHbelWIFO+36FzGQsxDSRp7GCH52Aid9/4qGG6rIF1YVMuBOZhK58OX+cLo
 eoyC5kRWAJM6GxKef356VJLl+efurTvLCy7meUVliwQai9gOXr24LzsmZMRo4zpI+fs2
 zTuA==
X-Gm-Message-State: AOJu0YwdQRxavJsiVIIlCqhSE3UOYW6HxHE5Ro6bVLFuPmNpfkaZOf03
 NFUsRVqfYFGUTtaK8IWP46EC4Q==
X-Google-Smtp-Source: AGHT+IGOPusUHzEY1R72zUpJpEMvm/4R/rTEAMfKCQO/I2/uN+urSywi/N/wufEiFUOgDDrzyCvTYQ==
X-Received: by 2002:a05:6402:b18:b0:531:1875:bbc8 with SMTP id
 bm24-20020a0564020b1800b005311875bbc8mr23576375edb.19.1697205711335; 
 Fri, 13 Oct 2023 07:01:51 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 bm15-20020a0564020b0f00b005346925a474sm11552152edb.43.2023.10.13.07.01.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 07:01:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Marek Vasut <marex@denx.de>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 03/16] target/arm: Move internal declarations from
 'cpu-qom.h' to 'cpu.h'
Date: Fri, 13 Oct 2023 16:01:02 +0200
Message-ID: <20231013140116.255-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013140116.255-1-philmd@linaro.org>
References: <20231013140116.255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

These definitions and declarations are only used by
target/arm/, no need to expose them to generic hw/.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu-qom.h | 28 ----------------------------
 target/arm/cpu.h     | 28 ++++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index dfb9d5b827..35c3b0924e 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -35,9 +35,6 @@ typedef struct ARMCPUInfo {
     void (*class_init)(ObjectClass *oc, void *data);
 } ARMCPUInfo;
 
-void arm_cpu_register(const ARMCPUInfo *info);
-void aarch64_cpu_register(const ARMCPUInfo *info);
-
 /**
  * ARMCPUClass:
  * @parent_realize: The parent class' realize handler.
@@ -63,29 +60,4 @@ struct AArch64CPUClass {
     ARMCPUClass parent_class;
 };
 
-void register_cp_regs_for_features(ARMCPU *cpu);
-void init_cpreg_list(ARMCPU *cpu);
-
-/* Callback functions for the generic timer's timers. */
-void arm_gt_ptimer_cb(void *opaque);
-void arm_gt_vtimer_cb(void *opaque);
-void arm_gt_htimer_cb(void *opaque);
-void arm_gt_stimer_cb(void *opaque);
-void arm_gt_hvtimer_cb(void *opaque);
-
-#define ARM_AFF0_SHIFT 0
-#define ARM_AFF0_MASK  (0xFFULL << ARM_AFF0_SHIFT)
-#define ARM_AFF1_SHIFT 8
-#define ARM_AFF1_MASK  (0xFFULL << ARM_AFF1_SHIFT)
-#define ARM_AFF2_SHIFT 16
-#define ARM_AFF2_MASK  (0xFFULL << ARM_AFF2_SHIFT)
-#define ARM_AFF3_SHIFT 32
-#define ARM_AFF3_MASK  (0xFFULL << ARM_AFF3_SHIFT)
-#define ARM_DEFAULT_CPUS_PER_CLUSTER 8
-
-#define ARM32_AFFINITY_MASK (ARM_AFF0_MASK|ARM_AFF1_MASK|ARM_AFF2_MASK)
-#define ARM64_AFFINITY_MASK \
-    (ARM_AFF0_MASK|ARM_AFF1_MASK|ARM_AFF2_MASK|ARM_AFF3_MASK)
-#define ARM64_AFFINITY_INVALID (~ARM64_AFFINITY_MASK)
-
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fb1b08371c..06f92dacb9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1116,11 +1116,39 @@ struct ArchCPU {
     uint64_t gt_cntfrq_hz;
 };
 
+/* Callback functions for the generic timer's timers. */
+void arm_gt_ptimer_cb(void *opaque);
+void arm_gt_vtimer_cb(void *opaque);
+void arm_gt_htimer_cb(void *opaque);
+void arm_gt_stimer_cb(void *opaque);
+void arm_gt_hvtimer_cb(void *opaque);
+
 unsigned int gt_cntfrq_period_ns(ARMCPU *cpu);
 void gt_rme_post_el_change(ARMCPU *cpu, void *opaque);
 
 void arm_cpu_post_init(Object *obj);
 
+void arm_cpu_register(const ARMCPUInfo *info);
+void aarch64_cpu_register(const ARMCPUInfo *info);
+
+void register_cp_regs_for_features(ARMCPU *cpu);
+void init_cpreg_list(ARMCPU *cpu);
+
+#define ARM_AFF0_SHIFT 0
+#define ARM_AFF0_MASK  (0xFFULL << ARM_AFF0_SHIFT)
+#define ARM_AFF1_SHIFT 8
+#define ARM_AFF1_MASK  (0xFFULL << ARM_AFF1_SHIFT)
+#define ARM_AFF2_SHIFT 16
+#define ARM_AFF2_MASK  (0xFFULL << ARM_AFF2_SHIFT)
+#define ARM_AFF3_SHIFT 32
+#define ARM_AFF3_MASK  (0xFFULL << ARM_AFF3_SHIFT)
+#define ARM_DEFAULT_CPUS_PER_CLUSTER 8
+
+#define ARM32_AFFINITY_MASK (ARM_AFF0_MASK|ARM_AFF1_MASK|ARM_AFF2_MASK)
+#define ARM64_AFFINITY_MASK \
+    (ARM_AFF0_MASK|ARM_AFF1_MASK|ARM_AFF2_MASK|ARM_AFF3_MASK)
+#define ARM64_AFFINITY_INVALID (~ARM64_AFFINITY_MASK)
+
 uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz);
 
 #ifndef CONFIG_USER_ONLY
-- 
2.41.0


