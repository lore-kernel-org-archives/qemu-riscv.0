Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC29C87FD2
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 21:49:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uhb8G-0007b3-Rs; Thu, 31 Jul 2025 17:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uhapC-0000WE-8m
 for qemu-riscv@nongnu.org; Thu, 31 Jul 2025 17:28:30 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uhapA-0007tc-7b
 for qemu-riscv@nongnu.org; Thu, 31 Jul 2025 17:28:29 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b783d851e6so187702f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 31 Jul 2025 14:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753997306; x=1754602106; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3YPXddK5v6Xqtrub7LpqRKl+Wnp2Pnfr2Y1mDvAIzEY=;
 b=guikIQ796S6Q8ndeZxADvDj0htenmATMken99Mucg0v+Stbqxk/3znVEpqW5ODP42n
 xm7c6TZ1lEeWArjI46/U1/vHrYVEOe/U+Wg6+wF+E9nu1RzYXMbMkO5khQ+RAM1AWukb
 JCPRVD+oBxXuSXXk1TRJ4GKY2pHLm0NRp7RFrfTOd0QcOUOaQvkg+FnsSIKL5VBYM0fu
 5xo8qQuWItrmCW4R7fZruMDcBzJyy1lUX0tV/7Kl5ztulWx8OxuGMj57fX0pjiTfF1P2
 7+AfyHCwX8FdeRUgL1nIGTfTd/NRI6gW3fpGjjxpJlOARz4FvPN659TaqP3EzVovcJO1
 mzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753997306; x=1754602106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3YPXddK5v6Xqtrub7LpqRKl+Wnp2Pnfr2Y1mDvAIzEY=;
 b=c36OZ3FjSOv0BlmoDRlU06LwoMURwWMduL89vzh5sXpearRZ3rE2+wrbM5IYwE+9zB
 1Op9pKVaLJfMWkxFkyh3E0jjEzzXbhIRc8bajjwsKJehlZExw2pqXvjp0qNLYrbyjOiO
 xeZHj4CVtVcZNe37KhESbKJ7/yvnlf1hMQksXrCE7QE0mwl9eQ6y7EyxjKe9C4hgWVBj
 XS9gz5rC2XGLupi2HhgvgCj9xFYo5a46jKB/zOPXgp/IyLqtSiBru69NAeLJ5GdhiEV3
 ODNIp/K+VNPUgOWrYyZC5UfEVSBlu98MZ/f2JmBVQJXXKayHHnBJ2OvRy0Cjh/Ca6Ytn
 QUoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwYGS5wi0S68fJuXpYN55cMgwe+s7R+X3j08tRQMbdTncRyqe5WYDUtN/HEvfB/Q6z0BL33GBxv4KH@nongnu.org
X-Gm-Message-State: AOJu0YwM2NPm9p5N6pIyYevx9Ex2HLrBLNIoRXyQU6B6hpOht817i5JY
 L52DL89tMMBzBfua/rynArjHYbJcqUgVwfh927P1Sek3a3a3g+5tN9d1qtcMKjEAWmo=
X-Gm-Gg: ASbGncvZfCmD8YUOj+dy0oEmi0g/Y1R1qFVIhV8nWEajJI7NLYHAFL+gdit+dIJxFQ4
 Uh0Oyl6zWjva0uF51lDrK9MYS/aXfrWZt3mpkK3y81vSc/YQlxJt3WGwZRa/XvH9g4sM/pfAvTb
 lu/i3cFrdFr7Z6aeJ9GcJs14PpDGYAjBCHSwmuGbXdKisPd94tT6uV66dZICz1nWCZHJ3unFulm
 E3WPTqeioPWyhcUdNAFzK1IZyOXoICMxpoXu8FK/Q9RwBUM/CAUstzKC9YmQlyk16w+q1PZQp08
 gKIo5UD4Xdbj97Lnx/9RuKi07aUl5ECG3h9WZ6ER2e7Rcw+sUq1K2AtqxaMsLurgqpaMVzXUzH8
 4mQXe0YLPnVA2LodGr03MwlFK6oeNOZ6DQpMeJKUce7yaXv2tXeb8V3lIDZgVjvfoAa4ZHvkNT6
 yTaDCBYCE=
X-Google-Smtp-Source: AGHT+IGI/zApcUREjex3r/KFRt72ym9B43x474plpmVmVHVsNwAXFaOO3Mt4foWnSu7ahDM6LVfaiw==
X-Received: by 2002:adf:e9ca:0:b0:3a4:ef70:e0e1 with SMTP id
 ffacd0b85a97d-3b795022391mr6020703f8f.55.1753997306488; 
 Thu, 31 Jul 2025 14:28:26 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abec8sm3742066f8f.8.2025.07.31.14.28.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Jul 2025 14:28:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Weiwei Li <liwei1518@gmail.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 03/11] hw/sd/sdcard: Propagate response size to
 sd_response_r*_make()
Date: Thu, 31 Jul 2025 23:27:58 +0200
Message-ID: <20250731212807.2706-4-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250731212807.2706-1-philmd@linaro.org>
References: <20250731212807.2706-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

All sd_response_r*_make() fill the @response buffer. Now that
sd_do_command() knows the buffer size, propagate it to the
response fillers and assert for any overflow.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c | 40 ++++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 1d88aee38d5..22bdb4ca3ab 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -729,34 +729,52 @@ static int sd_req_crc_validate(SDRequest *req)
     return sd_crc7(buffer, 5) != req->crc;  /* TODO */
 }
 
-static void sd_response_r1_make(SDState *sd, uint8_t *response)
+static size_t sd_response_r1_make(SDState *sd, uint8_t *response, size_t respsz)
 {
+    size_t rsplen = 4;
+
+    assert(respsz >= 4);
     stl_be_p(response, sd->card_status);
 
     /* Clear the "clear on read" status bits */
     sd->card_status &= ~CARD_STATUS_C;
+
+    return rsplen;
 }
 
-static void sd_response_r3_make(SDState *sd, uint8_t *response)
+static size_t sd_response_r3_make(SDState *sd, uint8_t *response, size_t respsz)
 {
+    size_t rsplen = 4;
+
+    assert(respsz >= rsplen);
     stl_be_p(response, sd->ocr & ACMD41_R3_MASK);
+
+    return rsplen;
 }
 
-static void sd_response_r6_make(SDState *sd, uint8_t *response)
+static size_t sd_response_r6_make(SDState *sd, uint8_t *response, size_t respsz)
 {
     uint16_t status;
 
+    assert(respsz >= 4);
     status = ((sd->card_status >> 8) & 0xc000) |
              ((sd->card_status >> 6) & 0x2000) |
               (sd->card_status & 0x1fff);
     sd->card_status &= ~(CARD_STATUS_C & 0xc81fff);
     stw_be_p(response + 0, sd->rca);
     stw_be_p(response + 2, status);
+
+    return 4;
 }
 
-static void sd_response_r7_make(SDState *sd, uint8_t *response)
+static size_t sd_response_r7_make(SDState *sd, uint8_t *response, size_t respsz)
 {
+    size_t rsplen = 4;
+
+    assert(respsz >= rsplen);
     stl_be_p(response, sd->vhs);
+
+    return rsplen;
 }
 
 static uint32_t sd_blk_len(SDState *sd)
@@ -2207,33 +2225,31 @@ send_response:
     switch (rtype) {
     case sd_r1:
     case sd_r1b:
-        sd_response_r1_make(sd, response);
-        rsplen = 4;
+        rsplen = sd_response_r1_make(sd, response, respsz);
         break;
 
     case sd_r2_i:
+        assert(respsz >= 16);
         memcpy(response, sd->cid, sizeof(sd->cid));
         rsplen = 16;
         break;
 
     case sd_r2_s:
+        assert(respsz >= 16);
         memcpy(response, sd->csd, sizeof(sd->csd));
         rsplen = 16;
         break;
 
     case sd_r3:
-        sd_response_r3_make(sd, response);
-        rsplen = 4;
+        rsplen = sd_response_r3_make(sd, response, respsz);
         break;
 
     case sd_r6:
-        sd_response_r6_make(sd, response);
-        rsplen = 4;
+        rsplen = sd_response_r6_make(sd, response, respsz);
         break;
 
     case sd_r7:
-        sd_response_r7_make(sd, response);
-        rsplen = 4;
+        rsplen = sd_response_r7_make(sd, response, respsz);
         break;
 
     case sd_r0:
-- 
2.49.0


