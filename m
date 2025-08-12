Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7834AC87FCB
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 13:50:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ulpNf-0002Sv-JF; Tue, 12 Aug 2025 09:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulpNc-0002Ry-1u
 for qemu-riscv@nongnu.org; Tue, 12 Aug 2025 09:49:32 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulpNR-0005D0-BN
 for qemu-riscv@nongnu.org; Tue, 12 Aug 2025 09:49:31 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b913b7dbe3so310214f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 12 Aug 2025 06:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755006557; x=1755611357; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xIFWjdnlfJkUuXmB+qiWsTetFCi9OyczEwhVE30q1+k=;
 b=sZ/it/ib4l4w+mGLGkiYEeIrZBveOb2YSfV2ffrev1XD7hF9F8qq1hYCOw5VfIIJwn
 zfZ3vg9Eu9tsHtHIU5UvjRfdWgWe5WGq/8jfQN/mS8LH1iGQFaGiixWQZWvBK5mY5kE5
 tyzZ2ccy38A0W0Bmc+G1yvKjyuAdToQIBMTT0CSVT/vQtV32qeJVTCM/K2K4sB4NHadB
 23VVBUgR0S0e5rpEzzQKLRkEYn6bdM9jzZzckLuipjT4C2kKyziGHKW+wiKvaR2RIK7K
 aYu8uDfv6goPvM4mjqYz3u0V84Q+2Gt/I4A0N3z5mGoWXOISJDDlrisxJJUsK1zn4Ita
 2cnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755006557; x=1755611357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xIFWjdnlfJkUuXmB+qiWsTetFCi9OyczEwhVE30q1+k=;
 b=F4gfxQSSOOsXo2jz52eTRpe/n3PKhg3/5nHMlp+16yXX7ocky6NkQqiLGT0Sr5q7LG
 CSdDFRyX0VmJBktQXdmhs2dJETSJVBopnAyzvyv0gxya2STdR/x87+DyzqExCktRDh1o
 +NxsASJbqOncxxqJwricMVZLPKzkXNHMTA9WAjQYfzZrShxGjp14cLjACS/kdCjol5I/
 2JkzJRy1n46eEstjt8mnMwMKrgFbKbgXW2MKstQp/wrjH0G7Ypp8rCabl1mDkfkbSZOY
 Ns4j2nmCJFophTbUziZ4p1SWlP834LPvXyrjf7rNyWTdHc69hRGaaZ+uGHckRapcev9h
 fvEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6Emtk4F+gn+o1U4FNTGishuKAq/wQxXo1MFheTdBh79FzqLcY1SEPhIakgQr1d4CM9WQqRyz9vF/n@nongnu.org
X-Gm-Message-State: AOJu0YzE6IhNDndxEqWnW1EwJac9EOcHqbBy7kbQhU5J2IeNHIm/VC6S
 UL8+lfxWmf4IpkVZr9Q6STzO42CF0q+55bipxllm5Bkg9GMTQXJsPxtLptvDG4+5Hr8=
X-Gm-Gg: ASbGnctA2MxxSLSKZw3lcbzXDgNThilAe1uETyRAXGCCYeKBkh5BfbdjapdwK/9Msts
 SaPgLjmFfMpZQshQdE3tHco7YQgpOBv4fSJ2ZPMVvQ5hW7lziICg3d6imqqYXAl45Cs6IaOg9MZ
 TakY6qjqyyoidLH41AlfraQ32OzF99YPiXK/8vKirw0rGG+9gU5TuJgihy/+w/gyceL+Ehyb0pV
 5lCG1d7wjgjRzwX6BG6CcNEgUJviQZB2uSFKo3QJRRg4MKz0GjT4hRcoO72DHTJC4YaoXBqTuQV
 WOlrdTzEWGuJBAHpv4bBIVz6jIOJhdVo21K3LZ+9F54n53aHwJGsZwOM5qaoaTo9e431/cz8aUR
 68vBeeDTzPHsRLYGCqGfp1iboYADVdYrXTxWGA7rqfurDKPQXjRhL2A0Y/u6G/w7Pn9/cwMMT
X-Google-Smtp-Source: AGHT+IE8pu3OXbeG+jBBuMKXuDz/4BnMWqDYUQjlDIS+PqeYTGB7oKj7J3/KJN/C/WOp93Ycp4Y0+A==
X-Received: by 2002:a5d:5f45:0:b0:3a5:3a03:79c1 with SMTP id
 ffacd0b85a97d-3b900b55170mr12238385f8f.48.1755006557198; 
 Tue, 12 Aug 2025 06:49:17 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5869cccsm327936025e9.17.2025.08.12.06.49.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Aug 2025 06:49:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Guenter Roeck <linux@roeck-us.net>, Weiwei Li <liwei1518@gmail.com>,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair@alistair23.me>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org
Subject: [PATCH-for-10.1 v2 1/3] hw/sd/ssi-sd: Return noise (dummy byte) when
 no card connected
Date: Tue, 12 Aug 2025 15:49:07 +0200
Message-ID: <20250812134909.69531-2-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250812134909.69531-1-philmd@linaro.org>
References: <20250812134909.69531-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

Commit 1585ab9f1ba ("hw/sd/sdcard: Fill SPI response bits in card
code") exposed a bug in the SPI adapter: if no SD card is plugged,
we are returning "there is a card with an error". This is wrong,
we shouldn't return any particular packet response, but the noise
shifted on the MISO line. Return the dummy byte, otherwise we get:

  qemu-system-riscv64: ../hw/sd/ssi-sd.c:160: ssi_sd_transfer: Assertion `s->arglen > 0' failed.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Fixes: 775616c3ae8 ("Partial SD card SPI mode support")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/sd/ssi-sd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 594dead19ee..3aacbd03871 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -89,6 +89,10 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
     SDRequest request;
     uint8_t longresp[5];
 
+    if (!sdbus_get_inserted(&s->sdbus)) {
+        return SSI_DUMMY;
+    }
+
     /*
      * Special case: allow CMD12 (STOP TRANSMISSION) while reading data.
      *
-- 
2.49.0


