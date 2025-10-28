Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FC3CCD1BF
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 18:16:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDoFL-0008Qg-5R; Tue, 28 Oct 2025 14:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoE6-0007iB-Ux
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:15:23 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoDz-0001wR-V9
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:15:22 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-475dc0ed8aeso33510075e9.2
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 11:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761675307; x=1762280107; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zA8SKmOgkqXDGcERg1H6mkjaSwJToDep8qiHL7yl9oQ=;
 b=kxf2Gi8s4AXIQUzGKJMNUAQE2EeJ4nKagRDiI81YYeAKnKnY7DJBHdxYkaQVVEy+q6
 xLQUPFAM6vmjvXixGDJRHeVU0y4y/u8OgScq3YYVGkmrJhapuhTnZe72smNYYpfGdrPD
 obBvya28p0wQHPbX+djEBGaKruCprqsksemVjDceMVbsvFqIYdoCeehORMFXBVoB/lwM
 s7wUut9A9baN2M3UzbtqvgznUJ7uhw5Mv9HkKiiDfQSAfSZDi95mts+u25tuIuR8+YGu
 VgWVSYtW/pQJXmBkl9/Ve7qb5HFNJoDCIZiWaphW8yaaLY4daQxaG97j5d0YCtF2Iwes
 pUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761675307; x=1762280107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zA8SKmOgkqXDGcERg1H6mkjaSwJToDep8qiHL7yl9oQ=;
 b=AIOwm9h2WbXSAs7NGxzCR8kQJWZwVOPUyg9fFjbgrKcUYsiGLfVxJXzEZ2W7nDgTvr
 QIDSJnsLyzduboWrOvUQhKJEtNUj7fYLas93vNOrEx+/FQUAsMqxE2FVZeIoQa5Fgy/s
 xEzc7rFJ7TMD5BqHGUUmS1y2pc0hIKjm/iBzSJ0/Hhj0D9EJ282MCLgo/OPoUmlTGaEq
 eLvO0AiIpQF4SzQRETy6PTfblrjYwtWqERskD3QLV3wOwrkWYJD17ZEUvfaspULXfsVm
 W+e0Pwe0XB6ZedIhNhGjz20iiGnd8xjGhz1JGQfPa8Y49zZr9K9nAdQ4iPxAmjEgDaKD
 hcxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXppP5UnNmxOvCcTPw+D9z/8zjScEVgk0ggM6yaSiQiTxdcM+mqznITDKHSb77HlGbNr0Un4bTBeXlZ@nongnu.org
X-Gm-Message-State: AOJu0YzweWQ9OFZJwKN9NdlRNTs5lF+WaXu7x7Fpa2MG/0rb6AMk60nh
 yO1afD351iI9mVNTz8LQ1pgWEbm72k5oajFnRZfkFHJIpQ4BzoBxHH6xahz4d5qk3RZjfZF3qPJ
 Ni1p7Lh4=
X-Gm-Gg: ASbGncu03KLDSXd8FKhMkFcnVI1zpwPc9VabnPOiljk+oHok9TMF4sq5sWcW0k2YoSB
 Pc2XpU/WS5hSyyYeJYKNbnno9DkLEehbBvBUvE5zJqLlvQzcuSvuFd/14+zSb0mXCxQXo3cLOyM
 oRyuksLKbCYkuMXOj9X4x8x7GoMNUsp2fmm8qAH1Ir32PxJSjEd0A505QGcwy1WLtY6yt0Yxmxb
 hd6fNx/heI02YmPbihkymuM1EMpgtbWFURKoHjMX0iGZnARd46rqblZsKBSNEq7Dkg6az1+0hHD
 b4w+1RLB4nAY1q/sZ2fF05B7Kbwpoegn9VLHonM9NL8xQfz/jEHI/6ZOQcuYOCob5xipXtYLhm2
 PXcl5ODOwb6joeMSAbP8NzexZO5YO68perQgEeeh7h8l7XVwK24WchqFgWnRXJhB+lc5IZXjtH8
 fAZWmyzBACgepM6HnZHPRSoyqaH3NCh2gwuubwpXYbCSMZr/FwY3hyMwa7x9G3
X-Google-Smtp-Source: AGHT+IHGa7i8N5C193MPmkOywSRQJAfkqFaPiX57WAZi/cfIO5WheZGBTLOuNNoY3ewFL4QjIRNsZw==
X-Received: by 2002:a05:600c:1549:b0:471:1306:aa0f with SMTP id
 5b1f17b1804b1-4771e20e400mr3209855e9.38.1761675307364; 
 Tue, 28 Oct 2025 11:15:07 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47718489d96sm26888875e9.0.2025.10.28.11.15.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:15:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v3 02/25] hw/i386/ioapic: Use proper SysBus accessors
Date: Tue, 28 Oct 2025 19:12:36 +0100
Message-ID: <20251028181300.41475-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

SysBusDevice::mmio[] is private data of SysBusDevice, use
sysbus_mmio_get_region() to access it.

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


