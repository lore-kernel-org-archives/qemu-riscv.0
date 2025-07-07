Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E3EC83F0D
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 17:26:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uYpXv-0003I7-U4; Mon, 07 Jul 2025 13:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpWk-0000v2-RC
 for qemu-riscv@nongnu.org; Mon, 07 Jul 2025 13:21:17 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpWe-0005CK-1o
 for qemu-riscv@nongnu.org; Mon, 07 Jul 2025 13:21:10 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4537deebb01so19781825e9.0
 for <qemu-riscv@nongnu.org>; Mon, 07 Jul 2025 10:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751908863; x=1752513663; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jqODDGmVZwWpLG85t5AjRhEjZXJgSLCLXmN69PZ4Bno=;
 b=zYT6tcE9nRHOtCk+jYfqKkZZ+8G6aPt22pNdoezSBiboDiQYRiqksYtmhvCUikolNP
 GLFCj1q754AzAOPSFs1FhSjSnY1Un8QBpPlt9Ys68b2W4g3EXes5aQtsirHvkuBsUUzc
 G6P2mAKXn/CzHwb5wNeo0DbJQiiWk0miFn60tVXC6XnP0A3jh+irRArmAgIh/dYFbZ7J
 zbEr0VMJ59ppcXeoVE3fvifa2cy68x5ABybjsz1Ip42w3oPfEOX2t7kxcl5jU3QADsVX
 EgvR1umfKKUSP/9W066kafJL/3Au7FkcvZZ+XqIomE5kTlQ++NKwRuZYEscnspUltgOJ
 b+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751908863; x=1752513663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jqODDGmVZwWpLG85t5AjRhEjZXJgSLCLXmN69PZ4Bno=;
 b=DeKDtEdbZKFDo5dpim1dVZDS63OhmGQuKkE717xofYhRGX/bPxmJRejg25CTocbzOi
 sfAnozQ5oRC/au0JQuWi5qyiH2X1aTIB4taWzB7BVZ6nzDeYZ+jgOipsNxNcgvlvRzKG
 Kf79Ap0r8CfdKY/UAxX2nq1PsxluN9sh0QdfTF//KnfQr+cbBpD6YCnQTZGUM6x5f1Vy
 o20g+jr0uJ1zxiBbFR1lLN4aLW1eYVyKVI5tYnBImUM8bC/8288TDVMr38Of3oTCmdUp
 40BCb50isXo958ubIWaEF55wtliY0+pwguqPkvJKjXWzKAZukJsGVUNdEl5csvuUSy8R
 xX9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+Tn5K8Q/Sos7ftckK98rK2f+oo/GGCpyZLkc+dNLPxbZABz2MEc0q8u3x+uOkDSQsGPyhx3DnEwGR@nongnu.org
X-Gm-Message-State: AOJu0YyfCCkgK9NXh8+468YHy92XDOaqUP6KR1M1H6d0c4duUwYEBdKU
 J0GQsNAqsmE1bXryAmbHkp0/kq9dZ5uTi/d1/SZmD+fmS3fc+l5Qq9CuWRm2DvsTBhs=
X-Gm-Gg: ASbGnctTA43LBLdOQw2v3Ak7PFZ6CYuXzjK8DS8jxWmJYz59co3kfLBw5V62Tn+vMue
 LHchECyCNP2KjFy3YfPG5dOWsKINVWDChcPb9U/owmlKns8NKBGSuzLRCYKyGXl4ctRbhxEL4G5
 M8OIEMOBrIyv+CPSZKc31uqdmVQeRPFlry2wYP3DRP/byz/EtUMrCRyhWLSoeI1oWWcJWdXJMGG
 k1asSCxSoV79Hqb6Wg3QarC4cNq/Tlvfy8iv772nNGgnsM2Y3NJvuBNeA3c8hd4nnjo1mx5bQre
 pDSbaX7JBpN3Bu33O+C9SCPvRUG5/HYkaR350WlIr02mNx8eiWYt+7ub2dZA08IhuTw1ro1dhQX
 WGrZ6c5rwF14iwVIYNs/mJBcac1NcR0IUVWQF
X-Google-Smtp-Source: AGHT+IH4AKONYKk8WayseeK6glA6RWMBLDwrfBPAg+NlginweazDCvf0XL2oKfGi1AQj0zCr2pB27w==
X-Received: by 2002:a05:600c:8885:b0:450:d5bf:6720 with SMTP id
 5b1f17b1804b1-454b5e9a2ffmr100958275e9.3.1751908863459; 
 Mon, 07 Jul 2025 10:21:03 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b161e8fcsm122271075e9.7.2025.07.07.10.21.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Jul 2025 10:21:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH-for-10.1 v6 10/14] hw/core/null-machine: Define machine as
 generic QOM type
Date: Mon,  7 Jul 2025 19:20:04 +0200
Message-ID: <20250707172009.3884-11-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707172009.3884-1-philmd@linaro.org>
References: <20250707172009.3884-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

While DEFINE_MACHINE() is a succinct macro, it doesn't
allow registering QOM interfaces to the defined machine.
Convert to the generic DEFINE_TYPES() in preparation to
register interfaces.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/core/null-machine.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index a6e477a2d88..3e03771d570 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -42,8 +42,10 @@ static void machine_none_init(MachineState *mch)
     }
 }
 
-static void machine_none_machine_init(MachineClass *mc)
+static void null_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "empty machine";
     mc->init = machine_none_init;
     mc->max_cpus = 1;
@@ -55,4 +57,12 @@ static void machine_none_machine_init(MachineClass *mc)
     mc->no_cdrom = 1;
 }
 
-DEFINE_MACHINE("none", machine_none_machine_init)
+static const TypeInfo null_machine_types[] = {
+    {
+        .name           = MACHINE_TYPE_NAME("none"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = null_machine_class_init,
+    },
+};
+
+DEFINE_TYPES(null_machine_types)
-- 
2.49.0


