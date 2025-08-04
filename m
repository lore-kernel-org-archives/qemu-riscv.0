Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888C3C87FCF
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 15:01:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uiweb-0003CX-1e; Mon, 04 Aug 2025 10:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uivKt-0000cG-2a
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 09:34:44 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uivKq-00007T-Gz
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 09:34:41 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-458b885d6eeso11927095e9.3
 for <qemu-riscv@nongnu.org>; Mon, 04 Aug 2025 06:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754314479; x=1754919279; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Uzbc/9L5Pzkd4K6o0zmm99krPdgkAOBzf5hBdRfajU=;
 b=UbqGDXIcpJluEzFdOg505sxM49p0GdbFz6afW+XE25/GFxW1dAZY+Bni+f8POrZ0dK
 lppaCeJcQRL+Zph2/iNPw+z9k8QvpiLsRw3ZSSuE8oIHaxd80VBh4Pm+/SRnb7yc+RUy
 G7GebPGjiSJYYPvlia8RShDgALPdAv68ffQwNGJHLy7R9WZ/s3hvzWow3gT3Bzm//I40
 5ZxCWruZxOtAViiCMoZV/SkJ/ckR6p8x8CLWyZAl/39g1uSl9VSWXgO4ZWNPR+4Df9gd
 gdM/RA6l+VvYfzdShvoMJ3k48wPAaIFyzDp+AtE1AC2T6YQFQ+woZbNHwwaKaHG7MSZq
 vgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754314479; x=1754919279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Uzbc/9L5Pzkd4K6o0zmm99krPdgkAOBzf5hBdRfajU=;
 b=YguOfMmC+sGvD4aIpMcIXGCdcC1Knp/R+tagg04YFng98jAWHcP02cRCyGtEROimJE
 v46DByWCdXVZM/MrtLz0xI986ilUohKw5VHJXmmWqoVAivtsyZfYvoo5j7Y8Cbs37NiL
 WVfpxoPik+6FETVGvDH65OO9ouc+ngjJEAIkielMAiuCEuE4zqd9pXrwpab8c2lAk5Bh
 trIsqGE6EqNQ84f04mdv7QVCMOszLwzj6FqJvVWWvX+jMUFFAgrJNSQmWOIeLkDdz8fl
 0CfzLwZkaVtM5pg6UcvL0scyVzRdY8lUvCSzDug4Qn+T1z/W5GMTrODO/93gwaLInmlu
 zIFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrwV+LjEuIwCf2jnvsGOcknu1Y2iimCSyc9mKccOZpYypakrzGiDI8YLhSSEHPexl9N+XadIYubFvV@nongnu.org
X-Gm-Message-State: AOJu0Ywnrxz9Q1gnpL2xYiINm1PrOLmmfK8s08kx+Wp8QfLegPTMC/9L
 rNV5yn9gQu4reFuudmqB06CKdhlputhL+Lergs1gU9AU5zq1+8EBXwW+aS1IEBCj7gc=
X-Gm-Gg: ASbGncu7rqQzipHpxNzKAZKdvPt4Zb6xPhCDYUWpBuSoaP4nlAC9E1lGnSlRy9Hj9fY
 i+ShhDcTIcbj+a7CIUJTwg1oSBscVronqGDzzIk/k5MyZlOaka7kv+f8FelmwNazup9Kx1HTq3M
 YSZGHebVzxfbLxcIeX1wZ/8jsNlS+FU1GGe0ixjl8LJ47TilYAxECnW8LtOZCEhUczS9b8z/kBt
 CI95jnIjzoKivf9WpmxzF68lOEFs74/S2RbyFJkyd7yxAU0LLFRa58N226DymRf1BimZF0ML+KV
 hCvpOhUpsDo0H+uvjnyP4wjD5C0jqmVWLgEoZGIRvwq5F33MMC8GHDZoFxZZtveDzoKxChoFGUq
 +TYMvjeyZdkeKMdrT2o4ScQHCMjLMvAmFJypwVcVnCUH/HgcU40i48w6vD9eiFAZRW24CmyPeIN
 81OlTBkEU=
X-Google-Smtp-Source: AGHT+IHdQV3ZZ7y0hcsW5s0sE6REmong0zZ6FpRzcsHdqr0+Z8yx2mEad8dQ6KedYSuApn3+hceRpw==
X-Received: by 2002:a05:600c:1554:b0:456:1514:5b04 with SMTP id
 5b1f17b1804b1-458b6b316a2mr72524415e9.21.1754314478960; 
 Mon, 04 Aug 2025 06:34:38 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458f713eb44sm69385015e9.14.2025.08.04.06.34.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Aug 2025 06:34:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH-for-10.1 v2 06/11] hw/sd/sdcard: Use complete SEND_OP_COND
 implementation in SPI mode
Date: Mon,  4 Aug 2025 15:34:00 +0200
Message-ID: <20250804133406.17456-7-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250804133406.17456-1-philmd@linaro.org>
References: <20250804133406.17456-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

While spi_cmd_SEND_OP_COND() is incomplete, sd_cmd_SEND_OP_COND()
is, except it doesn't return the correct value in SPI mode.
Correct and use, removing the need for spi_cmd_SEND_OP_COND().

Fixes: 775616c3ae8 ("Partial SD card SPI mode support")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 01ec6d951c8..df2a272c6a2 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1414,14 +1414,6 @@ static sd_rsp_type_t sd_cmd_GO_IDLE_STATE(SDState *sd, SDRequest req)
     return sd_is_spi(sd) ? sd_r1 : sd_r0;
 }
 
-/* CMD1 */
-static sd_rsp_type_t spi_cmd_SEND_OP_COND(SDState *sd, SDRequest req)
-{
-    sd->state = sd_transfer_state;
-
-    return sd_r1;
-}
-
 /* CMD2 */
 static sd_rsp_type_t sd_cmd_ALL_SEND_CID(SDState *sd, SDRequest req)
 {
@@ -2046,6 +2038,9 @@ static sd_rsp_type_t sd_cmd_SEND_OP_COND(SDState *sd, SDRequest req)
         sd->state = sd_ready_state;
     }
 
+    if (sd_is_spi(sd)) {
+        return sd_r1;
+    }
     return sd_r3;
 }
 
@@ -2590,7 +2585,7 @@ static const SDProto sd_proto_spi = {
     .name = "SPI",
     .cmd = {
         [0]  = {0,  sd_spi, "GO_IDLE_STATE", sd_cmd_GO_IDLE_STATE},
-        [1]  = {0,  sd_spi, "SEND_OP_COND", spi_cmd_SEND_OP_COND},
+        [1]  = {0,  sd_spi, "SEND_OP_COND", sd_cmd_SEND_OP_COND},
         [5]  = {9,  sd_spi, "IO_SEND_OP_COND", sd_cmd_optional},
         [6]  = {10, sd_spi, "SWITCH_FUNCTION", sd_cmd_SWITCH_FUNCTION},
         [8]  = {0,  sd_spi, "SEND_IF_COND", sd_cmd_SEND_IF_COND},
@@ -2626,7 +2621,7 @@ static const SDProto sd_proto_spi = {
         [13] = {8,  sd_spi, "SD_STATUS", sd_acmd_SD_STATUS},
         [22] = {8,  sd_spi, "SEND_NUM_WR_BLOCKS", sd_acmd_SEND_NUM_WR_BLOCKS},
         [23] = {8,  sd_spi, "SET_WR_BLK_ERASE_COUNT", sd_acmd_SET_WR_BLK_ERASE_COUNT},
-        [41] = {8,  sd_spi, "SEND_OP_COND", spi_cmd_SEND_OP_COND},
+        [41] = {8,  sd_spi, "SEND_OP_COND", sd_cmd_SEND_OP_COND},
         [42] = {8,  sd_spi, "SET_CLR_CARD_DETECT", sd_acmd_SET_CLR_CARD_DETECT},
         [51] = {8,  sd_spi, "SEND_SCR", sd_acmd_SEND_SCR},
     },
-- 
2.49.0


