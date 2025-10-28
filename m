Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A473CCF9EB
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 18:34:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDoWi-0007Io-1z; Tue, 28 Oct 2025 14:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoVb-0006QN-Vk
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:33:30 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoVQ-0004C5-Tq
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:33:25 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-427084a641aso4668315f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 11:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761676385; x=1762281185; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7j5BIJP17+UqRO/W8Lo+TNqHDVnZzxsQi9DL2cIQNS0=;
 b=uUSZq0AZ2+NE+FjHjxXlJPjfvrdR9V5t0OUJQvQqNjGbOWmMRlH4OJ9+ytdatimHjl
 tt53IUpylOvKrcq1orPIVFtN82oM390AsP/Ddyflngw1vv65v9b+hXHRBJMEYlFFGPiT
 +JVDF3Ja38+yuVlv4s5Od2vcfh6+5J49W65bU/672MzlJd4wr6ydVV8l1WtqIffdm/if
 W4JR23oQ/N6+SeC+FTRkAGRDt/KxEh4RijhPEM3XI4edArJ4PRRobPURjqqTX551LwhK
 255B1361Jy41nUJxd6gXlIiF0BPqozgl5o1Y3SWGgdvbQqHq7ERhGj4ofQsB6T/b86bP
 qoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761676385; x=1762281185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7j5BIJP17+UqRO/W8Lo+TNqHDVnZzxsQi9DL2cIQNS0=;
 b=Xpd5mIm/kohTaauzOWByLGQbCVEiFIukx7lzFDT75aBrKMBGckwAaKPTBoNXapUIGU
 Atd4B2cTyiOleQA31URSFz2Qr2UCE46wivCQQmRodchSH1DSXCJbXEoaLVRXgtyMNXf3
 7Tz5jhtMetQH09qPekkckCyLlNvUoKqUFoQuI1U9X9rOS8Ku1deUlot6i07rON7/UOVH
 zWuBSUWez6ybAJk0/jXqGy8oflK903jAS+HASVh5bbwX6WBiLqLThAsDEfvZJhibkGBs
 koorxKU11+sif7LDfoSdda75goJonrrVHRit35ZzcWIgcmtr4V99mpG/C93KFaL3pHkF
 RB/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVbwMJoogP2tEjkrB69OoPeU8yP7zZJLe26CpMXWIkkktLnVuJvE88giceL12d3rfyAItui9HfzFx/@nongnu.org
X-Gm-Message-State: AOJu0YyZqItTYG9PF7icowpmXEKi0zeBNrG+eSDfxZk3RFABE3g5i/Bl
 8P6GUkEdvRyM+YcadzuU9kIX1LQBEPHRtXSGygf0b+fEs0WjXilziMt5B9b2u83waGI=
X-Gm-Gg: ASbGncuMnw6wSZS+Eho6M8tlT7+wiSh48HRso/N4jGITyxpOGNlAjRz7lBtgu33L+5H
 czxRCRdodm22FtPBkprANIDXAzus/HNPU1IXRa17yDE6jk5mCQ8Qu53X1D67gB1HmDezfIQpN6C
 +t/TdNB9Y/ywHzkQYgR+xJe/XxGNxE4bqytyfra2tTfRfVLz3kbCCRqYTD/siypOFetT39bu5wH
 yzXfki/TSz7MHdpSRZqdfXv8QZpXCNVn7exqJZxF62E5jx8rCZ7eWfGA7eWqAIWMa169eVcji/G
 k8RWpVx0LzeQUi1yaZsTGvldKCuSgtzJl9qWzhDd7KyN5FpBqCI5XdgcoXuc+Zex5tdKqZAeZx2
 dpWa104OvkW25oDMtQpGLw27d0p40ZtIurc5+6mhufALphYbUg2fnObQmzqMZ+Xe3RaKLYy9O1e
 jw5VXX6rbZemY00XlLBnxcFzJSyx8SD2dql5hafjKaTbb9WZFwyIqm1/S9Ni9n
X-Google-Smtp-Source: AGHT+IHGiWmEGr7Mocg3dTC4g97uHTSqAkS1iH5OLYhopZsv0+nhnWDP5kXiVjZvDYeQlZsSjlXfNw==
X-Received: by 2002:a05:6000:2313:b0:429:8d21:572a with SMTP id
 ffacd0b85a97d-429aefbdb9amr35337f8f.34.1761676385531; 
 Tue, 28 Oct 2025 11:33:05 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7b43sm22092394f8f.6.2025.10.28.11.33.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:33:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 17/25] hw/timer/hpet: Use memory_region_get_address()
Date: Tue, 28 Oct 2025 19:12:51 +0100
Message-ID: <20251028181300.41475-18-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

MemoryRegion::addr is private data of MemoryRegion, use
memory_region_get_address() to access it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/hpet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index c1b96d0a89f..e2cd0c9cccb 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -677,7 +677,7 @@ static void hpet_reset(DeviceState *d)
     s->hpet_offset = 0ULL;
     s->config = 0ULL;
     hpet_fw_cfg.hpet[s->hpet_id].event_timer_block_id = (uint32_t)s->capability;
-    hpet_fw_cfg.hpet[s->hpet_id].address = mr->addr;
+    hpet_fw_cfg.hpet[s->hpet_id].address = memory_region_get_address(mr);
 
     /* to document that the RTC lowers its output on reset as well */
     s->rtc_irq_level = 0;
-- 
2.51.0


