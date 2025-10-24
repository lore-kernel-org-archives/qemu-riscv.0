Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7C5CCF9E3
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:37:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vCNb3-0004UU-58; Fri, 24 Oct 2025 15:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNao-0004O0-Ht
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:36:55 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNam-0002Ob-EP
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:36:53 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-475dc6029b6so257055e9.0
 for <qemu-riscv@nongnu.org>; Fri, 24 Oct 2025 12:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761334611; x=1761939411; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iuKy0g+dMDyAMbvGqcOb5ITf53v59XT0OsM1YVfVPZ4=;
 b=oTB9ZWbnToMek/5JTYuyZOT3utcvQtljJi74RjFO+RaG+Na9TgygppO7BvydGvhk5W
 8blVYsJksBDkeCW8742MayzOAlHYStofRm1ELZMBjo+0KnyoL5iObTHrRiWjadMHerDD
 LmmSZuBKucZLx7/fct60MdPkI3S0Sp7nre7G5idwqQgOSplRLDX2AafM7JcuIuMyP9Cx
 4p+WVrgXFW64oUn0mV66IpSwcqc+N5TG5s6yfDL0nY7YOZqRcOHoyjzyJQ+ZRoBDxOCG
 qtSXqDjr/1nhK+dFuheGSbGM/9UTZBG4PQ8tUp2479G75X2JIdb2I2mgxuY5U8y/mEGi
 Q5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761334611; x=1761939411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iuKy0g+dMDyAMbvGqcOb5ITf53v59XT0OsM1YVfVPZ4=;
 b=o3xcdRgoOAxU9sC58wqZmEoZaBKb4q+B4VP1XkX+t9EP0iepjK339pNaEvHg9ZwWsp
 IiIkJzr6gD2nSVzFu7GPABEweYcbqecnsbwVYo4ikOZD2X/fOFbBjGfWcbDgzN9HD6MB
 oJ7f/Zbm+AOpQZEcYVP/Hk0ejoX0ZDMen7yZJIPPpelAQ29UtO9oJSdpr+GLemzmmNgD
 q+ouMkyZcoKhtTay3tbQ/Namq9RRNHJ5Ggl+BbIhBhoQlITPmgnF3CgoyKMHCcah3cIz
 D8FbL21uu72Arf5a5IoqDgPww3b0672R7sm0PHO0PKHoc46nq5XoFwrp57JOIsZi/rDP
 Ys4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpcSRZ/IqbpFHE0MTztV3/w9RLD9S0tTUV29TdRnUWUPGTDJ4gofA6SXxYpqcrawbTxqpWZLb/iemo@nongnu.org
X-Gm-Message-State: AOJu0YzsvkQHriCSvt5DuVhg9JrCmpmvVbspkGg6eqZatPa3kTzR+2jG
 0G3GjxMkZmqYV1Ya5TR4gFW15VZzD/MKNkEiq5IKQ6GxadJiSENXWgtUNnH+N/w/A0A=
X-Gm-Gg: ASbGnct3fRwzrTpYtOMU/YEwzYE0tZG9L1ntfbCB5Mg6dldaCvFJ3OR2Xxqnfcy3rOE
 ZqdTc+xFpuNW9tm9Zt48GJxLl5CE6B6u/ukx9B7VdfY48RkIf+Nh72Jz6Lzmgp00QHRHZ/GoQ2u
 2vHrXdRmatDxH+yod7jetAQNIrRpmChEfu7ethi3tqOluoLbevR9Cb3elLsqZ7dOefFpTXNCuf/
 xsS99RNGbnBFDn5GzP+g3UcVypKc+rfALZOO43bnA36RAktFmzZfpGyiR12MJ4Zdmca+cnDy1RD
 MmMNvp/rpaj4tpP4Z4wSktLNidyiLklMqONNB1uxqJdXRsW7JkfkoFUpFySTRCET7ckkU8eUEzI
 uDZG5Bddpr/1wQYlkAh2U7hXpquT9/NQfTwWMfixkJyUsPcYoyXqYDmI0Vjr9I2DI/UsJaKOpnL
 l7LQI7SgLDJQT8yiZFOtlhuhgMsU2fPm/8W4Jy1bKqGVixAzKSxZ2XXJ9C7GLF
X-Google-Smtp-Source: AGHT+IHYynbuB5rRGbqbFy5ojmEbJmXDvxXJmiYAbYABkcHYoo++O7Xy/oS3GB0YuzDkIoX7m/FWNg==
X-Received: by 2002:a05:600c:64c4:b0:471:60c:1501 with SMTP id
 5b1f17b1804b1-475d2ecaedemr37411605e9.28.1761334610566; 
 Fri, 24 Oct 2025 12:36:50 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c4369b33sm162574345e9.14.2025.10.24.12.36.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:36:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 21/27] hw/rtc/m48t59: Include missing 'system/memory.h' header
Date: Fri, 24 Oct 2025 21:04:08 +0200
Message-ID: <20251024190416.8803-22-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

"system/memory.h" header is indirectly pulled by "hw/sysbus.h".
Include it explicitly to avoid when refactoring the latter:

  In file included from ../../hw/rtc/m48t59.c:41:
  ../../hw/rtc/m48t59-internal.h:44:18: error: field has incomplete type 'MemoryRegion' (aka 'struct MemoryRegion')
     44 |     MemoryRegion iomem;
        |                  ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/rtc/m48t59-internal.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/rtc/m48t59-internal.h b/hw/rtc/m48t59-internal.h
index cd648241e98..791c15b7184 100644
--- a/hw/rtc/m48t59-internal.h
+++ b/hw/rtc/m48t59-internal.h
@@ -26,6 +26,8 @@
 #ifndef HW_M48T59_INTERNAL_H
 #define HW_M48T59_INTERNAL_H
 
+#include "system/memory.h"
+
 /*
  * The M48T02, M48T08 and M48T59 chips are very similar. The newer '59 has
  * alarm and a watchdog timer and related control registers. In the
-- 
2.51.0


