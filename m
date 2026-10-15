Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD82CC6B33
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:28:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHIeP-0001L5-Rc; Thu, 15 Oct 2026 06:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIeK-0001EE-EU
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:25:24 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIeI-0003iX-2s
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:25:23 -0400
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a018792ab3so41419265e9.0
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 03:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792059920; x=1792664720;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=55Fgqc9VQyRpyCCP2Jau8AxqRXuSeRGIW2uq0lzhQEw=;
 b=A7B70qPIpp4X/TgYJhwcJTxNeIVYaBz3ocHwSNJG9hAFrVhUWB4/npCq2+D5nCNYtZ
 TGzCQWTXdtlr1rI6wY6SbB6YMuPC3hhShVEgVQ0hGHGIyFJd70c7LNZ7igLRNXmwNOnf
 3QqSX+GjTmA0qlcbKa8t7EudR6VFG+3Bnn/SXSGqILcTXpiCnKofPAhCAMQCJ9TAnjFE
 j2F6OsPeSsNy0voRLGojczojlZzEbmUKNAHfsW7IfbhS/F0Eti7rvwIkzlLJ1eMFbtzS
 RgQbh2dmK6xtPj48/N5p+mnY5LwOfubQrJQVT8AcTm6F5cT1ZHlYgMnfDuvVugXW1Hu7
 +qmw==
X-Forwarded-Encrypted: i=1;
 AKwUvBw4m0q+Tdc24lzBVj3hXqF0pN2C7hOGjwU4oy7vaYkC/W+FVEEhd+YJ1wEpiy4b1JsWRWYGW7eIm/hL@nongnu.org
X-Gm-Message-State: AFq9FYJHBxONSzp/jQSxqhkYasau2bm1tcBl3WoMvPSCGg1f5OW90Ae/
 DLdw6fBK74QS7pymPUsbq+CbPSmKCGFAcbZTtovh+qtn56/bzXYkXWqO
X-Gm-Gg: AYBFou2Xxt/aa51rbq4Zfim2HslDQHqSBgAlvSflArbgAMDcDafUzYiYU21ZAzeSCqx
 Q82zUR0b+ina2FaRVJNtbIrKd2PjDIScTTnv1pYfU6QFqhIqCAmnQO91L5qu9CIxOes7l7VbXTG
 yyI6uTdVkfu9zZZUZrc9+fB2Qe/leRecnv3E6sGGF594WwpE87BLyXfbfakPZ6c+WR7qCfoZhxJ
 HTTvwQXCpkSaoZER4vu9+Fh7YbM++1cCjlYf5oio9f9n7M7pfi8vkG6MDi5UF82HJIocDFVEJzF
 JTnpL4v91ydHPaOCkqAUCuCS18eIgi+vKjCHbmStxE8ZTBmvot6wjOfEDyrTx5vFzMgFdZbzfUA
 6zO/dF7wqcmP7ZcfoowOon7beo3e9OPizzuZ6/N75VrRebCXDuNiOKGp6rxCfqgXpghhNPNTZn7
 J+QM+7BvewsbeGoBK4j72K8bCjM5WNigIBBmcPApMR/0/hCqF1bY/IWDCym1HN8wshgzgVMJFnP
 cBFCiZhVB+6YyHkSoZQDxOECz4X9J9SyM4SRwY3WEP7A1M=
X-Received: by 2002:a05:600c:8b65:b0:49e:6683:d23c with SMTP id
 5b1f17b1804b1-4a18e3ef1bdmr345050635e9.0.1792059920506; 
 Thu, 15 Oct 2026 03:25:20 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd9b8ebdsm69844415e9.10.2026.10.15.03.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:25:20 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:27:58 +0200
Subject: [PATCH v3 11/50] hw/rtc: ds1338: prefix the file-local helpers
 with ds1338_
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261015-bmc-minerva-v3-11-7d50c8a108e5@free.fr>
References: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
In-Reply-To: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056475; l=2103;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=FMkjbHnVM4vN5NqR+DRLvhBEQGGHcj2pwxki5uk8mq4=;
 b=oQPF/Etz71xicNB2QlisxChLVRN5OlR6W/80dZOYIHylDcRQVDf4DPkC+7UrrjtqtsysWc3Z9
 jXlZ3BFuIi1AxggnbHO64G+FloWEpuBocXWQ7t2jTq+F5MqHxFgDK1a
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.51; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f51.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Two static helpers predate the rest of the file and carry no device
prefix.

Reviewed-by: Cédric Le Goater <clg@redhat.com>
Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/rtc/ds1338.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index 74aee6c746..1755a3a37c 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -57,7 +57,7 @@ static const VMStateDescription vmstate_ds1338 = {
     }
 };
 
-static void capture_current_time(DS1338State *s)
+static void ds1338_capture_current_time(DS1338State *s)
 {
     /* Capture the current time into the secondary registers
      * which will be actually read by the data transfer operation.
@@ -85,7 +85,7 @@ static void capture_current_time(DS1338State *s)
     s->nvram[6] = to_bcd(now.tm_year - 100);
 }
 
-static void inc_regptr(DS1338State *s)
+static void ds1338_inc_regptr(DS1338State *s)
 {
     /* The register pointer wraps around after 0x3F; wraparound
      * causes the current time/date to be retransferred into
@@ -93,7 +93,7 @@ static void inc_regptr(DS1338State *s)
      */
     s->ptr = (s->ptr + 1) & (NVRAM_SIZE - 1);
     if (!s->ptr) {
-        capture_current_time(s);
+        ds1338_capture_current_time(s);
     }
 }
 
@@ -108,7 +108,7 @@ static int ds1338_event(I2CSlave *i2c, enum i2c_event event)
          * START_SEND, because the guest can't get at that data
          * without going through a START_RECV which would overwrite it.
          */
-        capture_current_time(s);
+        ds1338_capture_current_time(s);
         break;
     case I2C_START_SEND:
         s->addr_byte = true;
@@ -129,7 +129,7 @@ static uint8_t ds1338_recv(I2CSlave *i2c)
 
     trace_ds1338_recv(s->ptr, res);
 
-    inc_regptr(s);
+    ds1338_inc_regptr(s);
     return res;
 }
 
@@ -204,7 +204,7 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
     } else {
         s->nvram[s->ptr] = data;
     }
-    inc_regptr(s);
+    ds1338_inc_regptr(s);
     return 0;
 }
 

-- 
2.53.0-Meta


