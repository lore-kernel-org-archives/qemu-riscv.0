Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51EECCF9E0
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:12:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vCNCr-0005tc-HF; Fri, 24 Oct 2025 15:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNCp-0005sp-IO
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:12:07 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNCl-0006DR-TJ
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:12:06 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-475db4ad7e4so589035e9.3
 for <qemu-riscv@nongnu.org>; Fri, 24 Oct 2025 12:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761333122; x=1761937922; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=khQ4f+JLpb7fh8Bk0A11QSSL3qpoF8Qk2ODQYUaP4ck=;
 b=ALG0TTGap+2fbqxReEqD73Rm+xljM/4kQC1p3bfSPq80OflGJXJ347XZdyByBrUCyP
 z8aYhOCh2SXFuI/FgMJfJOcQGqbg0VkECyL6VB+5yNba7NCDljv9UXxaUMV2M4x7SYLl
 0FYHMwJ4lSPXkDP4rxwO67puYTYdY1obr2QeWVbcKwyJHQXObrh2ORXEjzpVZLBAjKbT
 MWNNHvI6gMjsDrOdqsCmCGWtPckBcrUOxlMmzdMu/E4mXmKHhgrLxLj/SfqpMxCWPp8N
 mhL41+YwznCMK2VLTQhraOLd5xtRC4FASB0vorqvn4paTLVAGN7/YRHo88WldAT6ieio
 NknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761333122; x=1761937922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=khQ4f+JLpb7fh8Bk0A11QSSL3qpoF8Qk2ODQYUaP4ck=;
 b=vR4s35Zw9K89Aw+NJS4HGb7Kw6R1h21ngTAru15qZHx47fCmWrLh0iijWEPZ0cfxg6
 WK2Azvy79vND6KJrxnxqNqRcjTrCiJjxODOFTLU/2d2nBPC/j3HpGEJAPlUeFyOUr5Wi
 jw/Lg2xeeaFALdRbU90xR4LEXjkKzkldsw9GnJBsPwegu3ASw6YUixm2erTY7Br8i1Zr
 5QnKcmNhb8p97nSRUNbtOa50rIs6ExtT2Hhq+kCm1myo4HyuUr4Fj+NQZvbfztd8bQJZ
 lhqsW6FY5sdA+b/rMpmGuagvEgpwmaOcwZHk/zK8pVQxDvf5TmJAuZbwdJlBdac/km+a
 ryXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU20LLt4uyLHJLUFOOatYi5nM8E+n/t9yP6GmATHtCwhEzi9DbtecLEyP5WbMYn7k+w1vb8j0xTW4o@nongnu.org
X-Gm-Message-State: AOJu0YxFEQxhYs2xlOQPBkp4b4//mRmmGfaFCD9Ynqy5IZ6eROx2vyK5
 OhdcLq1n6rpumic+sj4FekXgMm4UGASP/8Ilkcq7BVWey/RVbYCX7NISqoTEahPQETM=
X-Gm-Gg: ASbGncuhW8aswumKfWo1luSZHPLkfxnPx1uLd8nncTZsKhz5T+9sCx94M36WpJWsSUW
 zVug3vyao6z8Gpp96O0Axc+S/YM7CNJDsU6tVp4RHl/H/vct4DTCGx36YcDS0iYEWSvSaTCDW3y
 5EHI3tLnSVQNzqojUFr+sn9N5+sOm5G/B2sCww9sYEpY3HkuOxcm0SYb4roWX8ye6AFZrhJjhUp
 Sqv09WlAYNVO7/IaKuUIOLzRuam6dc41Pxo4IILwecbgT28+b6yJxap0mcB/N6BecCIIZGMmYbK
 scLMDT3BWW02OqT8qNTrentUTd99+NsZW+X3paHaX5TKJZb+1uYOw8nMqABFONDEJpmfb0qqhwp
 t2KZwcyGNOaHo55RJsChzoCaUwvKk69/fIp/VFq+nQt2ixw1KnhUvCUWZxIHr5bg+hcBD5amSz0
 /ovowiG4sZVgUku64P55PIDLjVVjzeg4/T4ntnGPdVt/8ST7BmVXEw4eYcBQGPsUOGuzAEU8s=
X-Google-Smtp-Source: AGHT+IHv4l1XosmJ+AbMe81Cl8qn4LTSeuXJyvjLUOdckWaUg/XuRfICJNFoWIyYFbUOLQVYHPdHwQ==
X-Received: by 2002:a05:600c:4f09:b0:471:a73:9c49 with SMTP id
 5b1f17b1804b1-475caf930dfmr70530855e9.2.1761333121675; 
 Fri, 24 Oct 2025 12:12:01 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475caf15b10sm123156845e9.11.2025.10.24.12.12.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:12:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 05/27] hw/timer/hpet: Use proper SysBus accessors
Date: Fri, 24 Oct 2025 21:03:52 +0200
Message-ID: <20251024190416.8803-6-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
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

SysBusDevice::mmio[] is kind of internal. Use the proper
sysbus_mmio_get_region() accessor.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/hpet.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 1acba4fa9db..4ed79d72620 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -655,6 +655,7 @@ static void hpet_reset(DeviceState *d)
 {
     HPETState *s = HPET(d);
     SysBusDevice *sbd = SYS_BUS_DEVICE(d);
+    MemoryRegion *mr = sysbus_mmio_get_region(sbd, 0);
     int i;
 
     for (i = 0; i < s->num_timers; i++) {
@@ -677,7 +678,7 @@ static void hpet_reset(DeviceState *d)
     s->hpet_offset = 0ULL;
     s->config = 0ULL;
     hpet_fw_cfg.hpet[s->hpet_id].event_timer_block_id = (uint32_t)s->capability;
-    hpet_fw_cfg.hpet[s->hpet_id].address = sbd->mmio[0].addr;
+    hpet_fw_cfg.hpet[s->hpet_id].address = mr->addr;
 
     /* to document that the RTC lowers its output on reset as well */
     s->rtc_irq_level = 0;
-- 
2.51.0


