Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3445EC4167B
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:48:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxS7-0004KL-Bl; Mon, 06 Nov 2023 06:07:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxS5-0004IS-No
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:07:29 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxS3-0004iT-Rr
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:07:29 -0500
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c50906f941so62088961fa.2
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268845; x=1699873645; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2OUN8qI3wvvK+6EjwaYybG9IZ1pKduK7zbEAWLMDuTw=;
 b=cMd584eRRikVJ08Fhohp3sLzYJje/Z+0re04hf+g5hslNQMvTma0FD1eEY58Z8Pg9b
 O5eGjcBnUFqaeg4heKG6qSGWgGPCaGJ2RQyHOGynPx5l2NFylAp1U7KfHy5UdBcVrGl2
 YvnNB9NN3GhMTZekkjXV2ePWDwl/iTZrVl2r/igkGjonp/Vc8hmC06M4+u5m3t8Tw+Qv
 s0GUWD+xQGy5fjHvQOrLhuw2Vx8D7h4oBB8CciSuC7oNUMJsXlpSDOLyogPGx6wR7ONK
 BsqoRqGB7fFMQ4e+L55zHqa1INsOchiSl+djjTlo+AIKNMbqo+7zmXGBQy4fH4subREF
 zqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268845; x=1699873645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2OUN8qI3wvvK+6EjwaYybG9IZ1pKduK7zbEAWLMDuTw=;
 b=IGDVfitW02/bhdrHBEcQvbMeyf5I+O8y3nMLDt/Ehv+Y/e5gldFfWgJPKd8MaoMy1w
 DTwon/Tuaje/MvRh5/jMkO8GEsetBre7w05s1bfBnfrlm13t6X1Zv0eHQAT3Hv9bsKZS
 Tc1WRugUAQRtdXUOKE6hkDiEZSZycRmkE6A9MSTmH3XyJ4ernk06EddY2rhxEqymymen
 zhb/LG64jzLj3cfa3Z7Q+pSU2V3WBSX5MTcocDCEsN9AqB5vXvcl3W5qqLpDkarQvHYP
 025xQlUHmcMDZUuEmy3pW1VtKPO3fB/VS108k9m1tYps3OMDZhbJ1uNcL2xs+OEvnmzQ
 tqKg==
X-Gm-Message-State: AOJu0YxmbdLcVNYyrFF2Tk2n49C4Izioqg5C5DOi2jJQhc8KhTFY4Utr
 m26I9DvzcQ5vP/2HiXDF7gnocg==
X-Google-Smtp-Source: AGHT+IFLhhaF5dO3+8DYorxoIdQA7+GAd7X/cQ5bFHpXQKo5JyRHH2aTx5vdNP64N0ZZh22eyd9tMw==
X-Received: by 2002:a2e:3816:0:b0:2c5:8a0:b502 with SMTP id
 f22-20020a2e3816000000b002c508a0b502mr21890109lja.48.1699268845464; 
 Mon, 06 Nov 2023 03:07:25 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c1c0800b004063977eccesm11981849wms.42.2023.11.06.03.07.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:07:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 33/60] hw/ppc/e500: Restrict ppce500_init_mpic_kvm() to KVM
Date: Mon,  6 Nov 2023 12:03:05 +0100
Message-ID: <20231106110336.358-34-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Inline and guard the single call to kvm_openpic_connect_vcpu()
allows to remove kvm-stub.c.

Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20231003070427.69621-3-philmd@linaro.org>
---
 hw/ppc/e500.c          |  4 ++++
 target/ppc/kvm-stub.c  | 19 -------------------
 target/ppc/meson.build |  2 +-
 3 files changed, 5 insertions(+), 20 deletions(-)
 delete mode 100644 target/ppc/kvm-stub.c

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index e04114fb3c..384226296b 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -834,6 +834,7 @@ static DeviceState *ppce500_init_mpic_qemu(PPCE500MachineState *pms,
 static DeviceState *ppce500_init_mpic_kvm(const PPCE500MachineClass *pmc,
                                           IrqLines *irqs, Error **errp)
 {
+#ifdef CONFIG_KVM
     DeviceState *dev;
     CPUState *cs;
 
@@ -854,6 +855,9 @@ static DeviceState *ppce500_init_mpic_kvm(const PPCE500MachineClass *pmc,
     }
 
     return dev;
+#else
+    g_assert_not_reached();
+#endif
 }
 
 static DeviceState *ppce500_init_mpic(PPCE500MachineState *pms,
diff --git a/target/ppc/kvm-stub.c b/target/ppc/kvm-stub.c
deleted file mode 100644
index b98e1d404f..0000000000
--- a/target/ppc/kvm-stub.c
+++ /dev/null
@@ -1,19 +0,0 @@
-/*
- * QEMU KVM PPC specific function stubs
- *
- * Copyright Freescale Inc. 2013
- *
- * Author: Alexander Graf <agraf@suse.de>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "hw/ppc/openpic_kvm.h"
-
-int kvm_openpic_connect_vcpu(DeviceState *d, CPUState *cs)
-{
-    return -EINVAL;
-}
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index 97ceb6e7c0..eab4e3e1b3 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -30,7 +30,7 @@ gen = [
 ]
 ppc_ss.add(when: 'CONFIG_TCG', if_true: gen)
 
-ppc_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
+ppc_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
 ppc_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user_only_helper.c'))
 
 ppc_system_ss = ss.source_set()
-- 
2.41.0


