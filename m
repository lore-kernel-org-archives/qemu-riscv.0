Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133C1C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:59:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmR9-0003Dm-KM; Fri, 05 Jan 2024 10:48:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQ2-0006Wh-KA
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:47:36 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQ0-0004Ez-KF
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:47:34 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d89446895so4072635e9.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469650; x=1705074450; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3QQ/o8R5/vZPDmg4xKxtglyBmLRK3vBkRVa+vx66Ggc=;
 b=gzNgdQPXPyjo0e59+p2+dOCfBNfxyuQQCVoz1hYTsUQgktONxBoVkdqtkzt2RqWLX0
 UphElLe0/bONr7wFZY77YWN/JtT49wtgD3wopOUbKNxq818eaLpq04F28C5XYAyVEEDv
 4KymZ7QFi3RxRWrHaKFSscJ4lGAuUQVfqTz7cajRwr+b3zxWpIaNt5A+H0FpClFs/tlK
 vLlzlloKi87hyq0XFqCBZW65CQNFnJq7Y2blXFKtOcZ1Q8ujbyjZJgazTpGvA7NihO+8
 drOCpcCrZDE8Vs8YiKYiq+dvTYLaDkjkvjtncRRMbmtPF7N/lXgZBcsX8Tuhts15qdCn
 Tgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469650; x=1705074450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3QQ/o8R5/vZPDmg4xKxtglyBmLRK3vBkRVa+vx66Ggc=;
 b=CL5WWpPgsdX57nqw7dCv4VdIX5hrsesiLRYFUrwC5Tc7kAN10b7U7NCBbZQQ8kW1rG
 Gk2la15SSHF2nX7386AjZx/B5vUmogxdlp45WM1qSF1ed+763PAO7fHokP7e2kbjtqyk
 poM1SZgp0ajMscoAyUeFC5Pw+uPco80pxS0uoj0enoP56ymc7Ni2zqY4kV/9JXpPzYLM
 icQW6E4xb05gQJaJrDGSE1nBVIBiyrSSOc1E0qPP4dwiwmiGhf5C5Uzrqc2XafoXXGN0
 3w7cpuSRwPlwlxpjI0zb5/hqjyWUqWRiRFtPaKKKxFnJCvJ/XMbTufSh7A1DwDbD0Eeg
 WVBw==
X-Gm-Message-State: AOJu0Yxvfwargw5mIOb7Mf1auAkf4zdmNiKmWGWFZHH60u1YU42VVIVI
 n1o/CzfLBRYIx6MC7sOXnmJf4DQGwCBG7g==
X-Google-Smtp-Source: AGHT+IE0NVRH1AsKnMTaK60vgA9dgB0tn9TEVo7as9L+MBZ95qRbYdTbsnbpI/cUI4AvDNkqubBNdA==
X-Received: by 2002:a05:600c:3112:b0:40d:62f7:3097 with SMTP id
 g18-20020a05600c311200b0040d62f73097mr1318661wmo.130.1704469650602; 
 Fri, 05 Jan 2024 07:47:30 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 cx12-20020a056000092c00b00336b702af06sm1613139wrb.16.2024.01.05.07.47.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:47:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PULL 40/71] hw/ppc/spapr_cpu_core: Access QDev properties with
 proper API
Date: Fri,  5 Jan 2024 16:42:33 +0100
Message-ID: <20240105154307.21385-41-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

CPUState::start_powered_off field is part of the internal
implementation of a QDev CPU. It is exposed as the QDev
"start-powered-off" property. External components should
use the qdev properties API to access it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
Message-Id: <20231123143813.42632-2-philmd@linaro.org>
---
 hw/ppc/spapr_cpu_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 710078e9f7..5aa1ed474a 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -306,7 +306,7 @@ static PowerPCCPU *spapr_create_vcpu(SpaprCpuCore *sc, int i, Error **errp)
      * All CPUs start halted. CPU0 is unhalted from the machine level reset code
      * and the rest are explicitly started up by the guest using an RTAS call.
      */
-    cs->start_powered_off = true;
+    qdev_prop_set_bit(DEVICE(obj), "start-powered-off", true);
     cs->cpu_index = cc->core_id + i;
     if (!spapr_set_vcpu_id(cpu, cs->cpu_index, errp)) {
         return NULL;
-- 
2.41.0


