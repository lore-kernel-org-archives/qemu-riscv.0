Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DB5C0218B
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 23:47:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tb6tC-0007KI-99; Thu, 23 Jan 2025 18:45:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb6t5-0006xb-Gu
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2025 18:45:27 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb6t3-0004J6-Tq
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2025 18:45:27 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so10710685e9.3
 for <qemu-riscv@nongnu.org>; Thu, 23 Jan 2025 15:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737675924; x=1738280724; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MdlpzTogAHHu3L1/GbHJ1cNEJlm92RpTH1AYDuj/6CU=;
 b=HlEzBrFeis/p/buZw/+pZg3M/SggCMDoWtcQvpJcnopGfawipph5W67X9NZRIF9mTS
 ttHPhnczkEesa1KfHEIwEnmWFTHkGVwIclAHmEEDMG+/wavln9s+ytd+ySYM7wVdPSra
 QudrTjPD6hVdTSUa5+39bPw8EEf5hYG16u0xjRHaFCO99fOnkHdN84YGKMhInBBksIxP
 0g/jNbjxHZ73WoXtvxLw7a9RSUF2H03m9XjNOpLGQVySTZiDEnFGK9DmMZEx5hXfsPre
 oqfU9V4SC+x9DNQTK94w3a3FOvi37+R7BA2TWWPh84n/SRiJDjZv1iqDHJI2fsfCDDp6
 HjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737675924; x=1738280724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MdlpzTogAHHu3L1/GbHJ1cNEJlm92RpTH1AYDuj/6CU=;
 b=DC7e5Oi1jiDZeL998YKgsnPhDg8Q6gRMg7MUNbZ6GgbFV/Ewr+oqJCcw06nCo9QicB
 MZQmQzAuTETRXBbXdRBo0+9o4g4WIPOVCJQr5D/3fXhjbK/uecIxqodRugyR+44ltYbC
 uxaQgIJqvgRXK3HNpJsmpcguQ2jRqOochtCI+3AZA+ZSWhe1DsHxUKel2ieFlu9cRFaG
 KV+mFrg+0DWdA9pRdjjUXlEcJmLMuIu90/yq199E/YvBHA5Mfh36/fzd05c/VDFU9d/K
 mfC/kh3xzke8t7JMo8O01ROUAVvLl4XxjXssScH4qfkl4aIXJ7qN8rhHlRED7kdWvve3
 8i1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuoxS34XXzhLzyTwI6Cw8g3QUQ3pezqdA5B5lVbDNsPKV8cembxzRaENVAu8Mso4EFh52coayX8TjI@nongnu.org
X-Gm-Message-State: AOJu0YwxUFZyKrFtefG0zZPjQNjSeg1HX7r4i8A4yRw1XT599E9krzV1
 fgKTsysGlXl+Q80Nwg40o7FekBDyeVpmIYNboyYidPpQaGCalX0bU5NE5pQ70iI=
X-Gm-Gg: ASbGncsqxMrKxH9mrkFYo0XFuprqMWvoRY+a+sA3g9EJx3YFT29iH37CUlPn55FwpKp
 FT5V9qohaPY2KX/v/4u0o9ild/HvKma4xcSKXspzbbyStVrm8jNUsWjvrJrREHexWthJXWP51Jj
 ri8StdOfWeLKfpJJjgWxhBP8x6wMV6Fzw4oiPoi2ggFDNQSxr190H2XP3vc5y9vAlAMbYjN9qgT
 qU1bLwjl3VLBQDTFHYsZoV6g3YM47cVenpbZiBMmS3MSoK0D1APdppzCoUy2P1e1fAd7kfp8HG6
 jOpOwjp4PCdP4HsonAem5+CQDQ1vvw038tQmr4DGWNLXn2Ic76hriO8=
X-Google-Smtp-Source: AGHT+IEwKoXpxcAtZxGgBrKoty0PAI7DEzj3vUSJHkmHg5BnQeEwYri/vD7fXqCVh16ykXZTkiP5lQ==
X-Received: by 2002:a05:600c:1987:b0:436:faf1:9da with SMTP id
 5b1f17b1804b1-438913c68ebmr255744445e9.2.1737675924510; 
 Thu, 23 Jan 2025 15:45:24 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4fa416sm6932195e9.6.2025.01.23.15.45.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:45:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 12/20] accel/accel-cpu-target.h: Include missing 'cpu.h' header
Date: Fri, 24 Jan 2025 00:44:06 +0100
Message-ID: <20250123234415.59850-13-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
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

CPU_RESOLVING_TYPE is declared per target in "cpu.h". Include
it (along with "qom/object.h") to avoid when moving code around:

  include/accel/accel-cpu-target.h:26:50: error: expected ')'
     26 | DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
        |                                                  ^
  include/accel/accel-cpu-target.h:23:33: note: expanded from macro 'TYPE_ACCEL_CPU'
     23 | #define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
        |                                 ^
  include/accel/accel-cpu-target.h:26:1: note: to match this '('
     26 | DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
        | ^
  include/qom/object.h:196:14: note: expanded from macro 'DECLARE_CLASS_CHECKERS'
    196 |     { return OBJECT_GET_CLASS(ClassType, obj, TYPENAME); } \
        |              ^
  include/qom/object.h:558:5: note: expanded from macro 'OBJECT_GET_CLASS'
    558 |     OBJECT_CLASS_CHECK(class, object_get_class(OBJECT(obj)), name)
        |     ^
  include/qom/object.h:544:74: note: expanded from macro 'OBJECT_CLASS_CHECK'
    544 |     ((class_type *)object_class_dynamic_cast_assert(OBJECT_CLASS(class), (name), \
        |                                                                          ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/accel/accel-cpu-target.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/accel/accel-cpu-target.h b/include/accel/accel-cpu-target.h
index 0a8e518600d..37dde7fae3e 100644
--- a/include/accel/accel-cpu-target.h
+++ b/include/accel/accel-cpu-target.h
@@ -20,6 +20,9 @@
  * subclasses in target/, or the accel implementation itself in accel/
  */
 
+#include "qom/object.h"
+#include "cpu.h"
+
 #define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
 #define ACCEL_CPU_NAME(name) (name "-" TYPE_ACCEL_CPU)
 typedef struct AccelCPUClass AccelCPUClass;
-- 
2.47.1


