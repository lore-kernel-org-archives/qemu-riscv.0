Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA489C87FCB
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 15:03:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uiwfA-0007Ra-Gg; Mon, 04 Aug 2025 10:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uivKb-0000Go-18
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 09:34:26 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uivKX-0008Tk-SI
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 09:34:24 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-458bf6d69e4so17479825e9.2
 for <qemu-riscv@nongnu.org>; Mon, 04 Aug 2025 06:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754314459; x=1754919259; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2dyOWVcvS3LHGs+IU0J1k6trHAqIIeSYFGpWKRpV7ZE=;
 b=ssdNjGLcVL8I5cXX/AV3QQm7oQAQzlhepEoeEhjogOboqVA/xIZQBdwoAoC/nWnU8o
 bGVsqbchzS4sx1649mBY4PnNaFkRvKb5i/IyxsCqhirhZQdG7L3qFVYLH5eodP0W9ZVO
 FOnwegRVQdJXKXkVhhBqETeqLU+wwe6rSiibnVILqTc5XoI/2JmaIKu8ZiyzIRKwS+mM
 K1DwCCpG37R+jzvbA5Gwm2euWZi7pZ6Ppv7G03aItCKYvR1Ms7c0S3xMWOT8BFSB0/hg
 Pa3hwe2McUxdqhd8SF2dkV1DZK3Hou3DqQ4GWkzIwR8qU/+OlIahpMsayngUCXeMNig+
 +oEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754314459; x=1754919259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2dyOWVcvS3LHGs+IU0J1k6trHAqIIeSYFGpWKRpV7ZE=;
 b=xMXg2d72mvMvaud13HJuWkcoJt2lWZ3ZzTnzkWs7BekH3RoDrtK/m6DigzovGcmRqf
 kNS6bVF52qQt4RdW+yzdXmX/v7YwM7wewfIOakPHfrOkSpwDoc2wywvR7H7nrzWIpJPH
 679mX40dIi+EGzsWq8Qu9RL2nsBvACrDI4xK8qmDP91qw1fvSpEdYvsUPjqpjDiHwYeP
 4VPkwknK6nrGDwIVlkjDOOXM6qVihMs8XtcD/uQe1Bboo2beLxBfwWhb/cRdeZwoYjBq
 Cywu4JVduDYBlNxUNYLR3RWMsdTEMqNsxCvAGMx/uR2KzQYVbJlLaC6rt6f/zxaeyaFH
 CG/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv+s2xJLY36CbePJGod2HlZUK/JqTI3Z3HIwL7XvFiWnC+jX0GibABtComUq4BKkRrdr4Phf+kKLKf@nongnu.org
X-Gm-Message-State: AOJu0YzfjtL18oGU0rRiKTmtlUKDF9Wu2jZd79VdzseAsAgXawpXKQXR
 ZZmFBgD44jVzPPdjMqjS0xwDVdWyok2KcmW/iuKSepyDnUW5FqIapiwbCOaq2tXekZY=
X-Gm-Gg: ASbGncudOzdX3Kt3R+wweBLC+PrLd0Si0EIi4trDkA6qB6mO6wkLoHJ5zCHaziOhnKL
 b7sugczOXxEC08nON1L3U0TLsYxAWazjRXgr6oh83nbzKQffqvVLllC46sRVcmS3R4KSHZS111v
 CTR9twosxjEOEC9HMlwAEwcmFWDP3kxQyKcmyxJ9W0PzJAbF0nhJNt0vaX4pN3KPVYiTDZIAlbR
 B3HwF05WzZ9WXHRnTnv//2YJY//TW3R5CncoS5kn1tlLOhXx0Jpav6Y/086FvoAKw4kIFY/haj/
 AsHtxw3TKoDJ6SoV4T+YBS51PhbAXb+EkWQ5SRZj9EPAg1U0A9fDHuYRShDeddRWlFxjJizre0v
 s7W44VHS6V39QhZ40uTH9wiJ3ztr+CeWLsL1DtjVJb44YQJp/p6N8UAciO2gfO2FjI1pwWo7S
X-Google-Smtp-Source: AGHT+IF2KSgYGdZZejzrzoBG1FoE1yKJ/f3fzqhvBSqheXfFyuhXczZxBAmPLG53oyZtIFsfjZfoBw==
X-Received: by 2002:a05:600c:181d:b0:458:bbed:a827 with SMTP id
 5b1f17b1804b1-458bbedaab7mr44599235e9.1.1754314458838; 
 Mon, 04 Aug 2025 06:34:18 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abedesm15737999f8f.3.2025.08.04.06.34.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Aug 2025 06:34:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH-for-10.1 v2 02/11] hw/sd/sdcard: Factor sd_response_size() out
Date: Mon,  4 Aug 2025 15:33:56 +0200
Message-ID: <20250804133406.17456-3-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250804133406.17456-1-philmd@linaro.org>
References: <20250804133406.17456-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Set @rsplen once before switching to fill the response buffer.
This will allow to assert in a single place that the buffer is
big enough to be filled with the response.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 0bb385268ed..76ce54664f2 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -729,6 +729,33 @@ static int sd_req_crc_validate(SDRequest *req)
     return sd_crc7(buffer, 5) != req->crc;  /* TODO */
 }
 
+static size_t sd_response_size(SDState *sd, sd_rsp_type_t rtype)
+{
+    switch (rtype) {
+    case sd_r1:
+    case sd_r1b:
+        return 4;
+
+    case sd_r2_i:
+    case sd_r2_s:
+        return 16;
+
+    case sd_r3:
+    case sd_r7:
+        return 4;
+
+    case sd_r6:
+        return 4;
+
+    case sd_r0:
+    case sd_illegal:
+        return 0;
+
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static void sd_response_r1_make(SDState *sd, uint8_t *response)
 {
     stl_be_p(response, sd->card_status);
@@ -2203,36 +2230,32 @@ static int sd_do_command(SDState *sd, SDRequest *req,
     }
 
 send_response:
+    rsplen = sd_response_size(sd, rtype);
+
     switch (rtype) {
     case sd_r1:
     case sd_r1b:
         sd_response_r1_make(sd, response);
-        rsplen = 4;
         break;
 
     case sd_r2_i:
         memcpy(response, sd->cid, sizeof(sd->cid));
-        rsplen = 16;
         break;
 
     case sd_r2_s:
         memcpy(response, sd->csd, sizeof(sd->csd));
-        rsplen = 16;
         break;
 
     case sd_r3:
         sd_response_r3_make(sd, response);
-        rsplen = 4;
         break;
 
     case sd_r6:
         sd_response_r6_make(sd, response);
-        rsplen = 4;
         break;
 
     case sd_r7:
         sd_response_r7_make(sd, response);
-        rsplen = 4;
         break;
 
     case sd_r0:
@@ -2244,7 +2267,6 @@ send_response:
         sd->data_offset = 0;
         /* fall-through */
     case sd_illegal:
-        rsplen = 0;
         break;
     default:
         g_assert_not_reached();
-- 
2.49.0


