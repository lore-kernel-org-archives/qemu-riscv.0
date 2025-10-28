Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34167CCF9E0
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 08:04:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDegi-0006oX-Ni; Tue, 28 Oct 2025 04:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDegf-0006jy-Ta
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 04:04:13 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDegb-0000rY-LF
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 04:04:13 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47117f92e32so50778275e9.1
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 01:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761638646; x=1762243446; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IXTrcwnFN2dR0ftftMdZpCG9tw6TOxe98L9iT4TQNSQ=;
 b=xwjN7urz36lJ850xMIPLl/RdKR+on8dA5wr8HTdI+xxQFqZBce9M1okYOQh/MENN6N
 6zInfb7jBBLe32wotLUtor/5MkEZEjf+ml0nyl0YxMZ5PY8yy7VwP6LnnPyrkBDhboDH
 nVRL9y41tX8dSLHzhF+5rnvu02LeNa09jPpSpRS12fJgeS6QAprWWQIFxMlwI6ew5Rhz
 1iN3Q7wMX0CRxpgFtD8REFjgGMrkHyMGlY0Hqe+20Cd3EYf5LICTLD1frPuAndDnkpOV
 fE72WjwISxEudLILZ8MopWfZ+E6ZlyQo0U1EEJ5Gt3vGfesz88sVvHBOphJVLtTrrjad
 2uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761638646; x=1762243446;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IXTrcwnFN2dR0ftftMdZpCG9tw6TOxe98L9iT4TQNSQ=;
 b=DyA2O4Jtz9BlNNEU6ep1ICtzfEvZXNyoApsMyA1iSFOWWL8NyYXZJRBcCk8pEJGQMs
 kBO5/RRtoqhQDAT6veKbsWn3q1rTaOG9POeYUHh4F2Bb+i8SqmZ7mQSASyNYw1Vtc41r
 fC74RpHXwGiVvVoxzJO5j94MdA9wxzMs1IVQoJJ0gN77vz+K/RCHwS4I1X0LS2q/LJHI
 b4zDxkwXfVTlbHgdf4e2Sc00NSRbAo2PXIeoFBAnzT+shnxTR1TPTNKwr+ESHLHyWQRX
 QGPNKwyX9ZSsWSt/HJJtbwRS09vehVk9ATRNQ6SVe/jkPKDm27umu8R9LCpLFa8/5XWd
 9ApQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwnWHk8TuaDzGMzv/M9ExuhmpKxnvRAqg2syl8NLPWAM+MpR78yAwtzdVR7bdb+HXtdRfOBXAm4Dkg@nongnu.org
X-Gm-Message-State: AOJu0YzRz9WcIKbYSWzMmdyEgEPySYRBtSmDprC3PDtWy5jFNbfi1Xxn
 1r1lpgQ/KRsqpDaNbtnkLENzCrlUQ+hq8ORdFpihqMmGmodJv4KY/GSwlJcCg/1iR2c=
X-Gm-Gg: ASbGncvrBq6GG3nHEPb739j8voDd+EYIwvQ6f64pzySEw92vDj26qFY3QOVgM9wwk7e
 Ib4Eqn55yFHfdKx68Aw+2M4RVGHBZCjglCSX9geV7KgLfR/UdFQknVQC3gaFnplpmxc2g86Netm
 FFBjqpBBITsX0SELr2p987nPqmEtlD79qlxMaLO55i+axuzGQdpChIvE2Jq467kPolDFqMusJvr
 s/SsnK9f759O5bIIIpGHjmuEbDoVRZuBHbzlMfr8/a+Ll3IsRFG07VcW/RUUqneFmb0YwPn2jyo
 WeWZ6uNfEHbgyHUeEci2FjhCHCjwtjbgRHGyfZuJVnkoNyBTr7O5TVpyRnWiY9WV/3l6gbtJCiQ
 OFZuE9Kkv0gdXS4bmGY6f5YYrOPcDydtX9a6b54HMhlX1EpfCbBACRrhWeeOqrlod4qrQ8DAnC9
 mp8ppiftO5Jcaz9e808FQZivYWRFNDZNJ4ONWZu5QZVR0OYW6+7F+REpw=
X-Google-Smtp-Source: AGHT+IFSc+GTUbGoMWV0djgdJjUsuRAV3TG84f4Wo0S16Hh+bXc/T+lXNDrAgKUF66mxAuI5Dv8UBw==
X-Received: by 2002:a05:600c:4e93:b0:471:9da:5232 with SMTP id
 5b1f17b1804b1-47717dfa486mr18951495e9.15.1761638646065; 
 Tue, 28 Oct 2025 01:04:06 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771843eabfsm14785185e9.2.2025.10.28.01.04.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 01:04:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 3/7] hw/i386/ioapic: Use proper SysBus accessors
Date: Tue, 28 Oct 2025 09:02:53 +0100
Message-ID: <20251028080258.23309-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028080258.23309-1-philmd@linaro.org>
References: <20251028080258.23309-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

SysBusDevice::mmio[] is kind of internal. Use the proper
sysbus_mmio_get_region() accessor.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/kvm/ioapic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
index 693ee978a12..0519432edbe 100644
--- a/hw/i386/kvm/ioapic.c
+++ b/hw/i386/kvm/ioapic.c
@@ -80,6 +80,7 @@ static void kvm_ioapic_put(IOAPICCommonState *s)
 {
     struct kvm_irqchip chip;
     struct kvm_ioapic_state *kioapic;
+    MemoryRegion *mr = sysbus_mmio_get_region(s->busdev, 0);
     int ret, i;
 
     chip.chip_id = KVM_IRQCHIP_IOAPIC;
@@ -87,7 +88,7 @@ static void kvm_ioapic_put(IOAPICCommonState *s)
 
     kioapic->id = s->id;
     kioapic->ioregsel = s->ioregsel;
-    kioapic->base_address = s->busdev.mmio[0].addr;
+    kioapic->base_address = mr->addr;
     kioapic->irr = s->irr;
     for (i = 0; i < IOAPIC_NUM_PINS; i++) {
         kioapic->redirtbl[i].bits = s->ioredtbl[i];
-- 
2.51.0


