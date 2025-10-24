Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61554CCD1BF
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:41:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vCNfL-0007xe-H5; Fri, 24 Oct 2025 15:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNfK-0007wU-Ot
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:41:34 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNfH-00034R-44
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:41:34 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-475ca9237c2so13335825e9.3
 for <qemu-riscv@nongnu.org>; Fri, 24 Oct 2025 12:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761334888; x=1761939688; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KpH1TjiIWYMoy+2aYVMfZHyQSqeUvDzN9D1JMZexHpc=;
 b=IPXmp0HdRJvYINqiR++Z3ZOpRlU+90GxkmTAs/RHEuJ+FyNZeeJg3WltINBPrdfZ2K
 gIKDzZDV2Bibd39TWHikf4FkOw6TvoqK41RbHth5AcG3GdY4wF49UyEavVBZa+h7Qjrg
 1FqhA52oHaL9uVBJIO+DiVCw2SrhfXgbN5uLUOPRg7w1f+KYLto++a77bkyhAOzY2emb
 eOzTqds/TAXbxn0NWg098/0TtHhCLGkcz3be8ugfx9r0U5Hnez7B9rH44rvK8PNWE5e2
 7re6abLK2MiW8FA1yvnRBM4W/hs6LSTU4Es3v1KDeiCs9kzK6vqqd5Mraof6gOuzVqEu
 W+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761334888; x=1761939688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KpH1TjiIWYMoy+2aYVMfZHyQSqeUvDzN9D1JMZexHpc=;
 b=Hw+puS0LTmvbD7UDi51D8LyjD07cqNJZl4b0uZPC/umLPoAkfwuJNoYC9piNgrPVGC
 llfc5PaMs02LWTuKdlw9RfMGdodNWzqac7xNfh1sW6EOWlN8FM1pRU1IWkMxJHfPuLM0
 HSAgyQDF8j0m0+w12L1shpMiNyzsR28X6tNoVeJJyYb+zSYyAB/1bkaLzkthUD8gkdvf
 2O/xQPlgnARQ0EB3c/eRiUaQcJ1nzibyzeEuReVzoG6ARXoB2TwvFs+1ZOFgEJnykJIU
 sUv1fCrZ7kLebKpRzegc53pzYu5MxzlWOE7Xu2CaWGE6/N9Od/GhKTk0Q2aehuICsSzh
 TJyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVOzad5LQlIfyNiDBvG3xGbSip6t0KLIKaCpUfvxV9w9Yzvm9vIwt9YoPLMkYSRvGVzl5bwQjrBrd2@nongnu.org
X-Gm-Message-State: AOJu0Yz3oFA2d8P6yuU2Q9xbtgTLdkL76pemooYDpbnS/IBUusI/q0a8
 AU8aSrNLwUZ+aSp9MhzLTNM0jVlKXucqSy2wus9fWLvwjarNP6H7MIHnTDEUrDudywY=
X-Gm-Gg: ASbGncuPrdpgOxQoOgeAtffe6QL6WNt0psxWzks6KbxpHPwtZN2aKd04outtghLE3J2
 gHXMvx9g9AK0XSYIPGBHQaQLS/OdMbKJdmHxv9hbJG/E6hIJWQn0SYscJ2wv2AMO2lcgl80NNsR
 /ie54u7d39HsSyEma5AJljBCjj4okTMeH4FGWupMLuqoqan5ljIqds9vRwtl3EjY27UMXbV+Vgu
 +5JaUeJvNUisLD+kACZnGn7zComb5hV1xzUnQIfriOYk/K3xHhZ6ktHTKiW/PMdOqZOgi6wZ4m0
 TCWcFgpquPA6uYEzpCYAm8VYVW5kM8Zyc5ZwZyt7dX5J0/Nm5Lg0JjoCj70w0eIwa5hbGykherh
 0thc6ONoFxsfw9/R4SaJSsXyhkkLIwbvu9yAY6/d7VsFMvQeBmlG38oV23iBBzH9RnBStlOA53i
 3JPMqM9WwmDpsZZIMv5kEOdxnEvWBDWsxM8//jX9dDj/GffEY3Acd8N0i//3iH
X-Google-Smtp-Source: AGHT+IH6/dZ1UCh6BkdG06z1NSspqbsgE2j1KQM2XnC+xyXgfkt/gcwR5yK/U9aRTqcDlnLNjY6/Jw==
X-Received: by 2002:a05:600c:3b82:b0:475:daa7:ec60 with SMTP id
 5b1f17b1804b1-475daa7ee4amr10581395e9.21.1761334888253; 
 Fri, 24 Oct 2025 12:41:28 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475cae9f571sm107387325e9.7.2025.10.24.12.41.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:41:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 24/27] hw/mips: Include missing 'system/memory.h' header
Date: Fri, 24 Oct 2025 21:04:11 +0200
Message-ID: <20251024190416.8803-25-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
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

"system/memory.h" header is indirectly pulled by "hw/sysbus.h".
Include it explicitly to avoid when refactoring the latter:

  In file included from ../../hw/misc/mips_itu.c:26:
  include/hw/misc/mips_itu.h:65:18: error: field has incomplete type 'MemoryRegion' (aka 'struct MemoryRegion')
     65 |     MemoryRegion storage_io;
        |                  ^
  In file included from ../../hw/misc/mips_cmgcr.c:17:
  include/hw/misc/mips_cmgcr.h:80:18: error: field has incomplete type 'MemoryRegion' (aka 'struct MemoryRegion')
     80 |     MemoryRegion iomem;
        |                  ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/misc/mips_cmgcr.h | 1 +
 include/hw/misc/mips_itu.h   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/hw/misc/mips_cmgcr.h b/include/hw/misc/mips_cmgcr.h
index db4bf5f4499..e15731f18ce 100644
--- a/include/hw/misc/mips_cmgcr.h
+++ b/include/hw/misc/mips_cmgcr.h
@@ -12,6 +12,7 @@
 
 #include "hw/sysbus.h"
 #include "qom/object.h"
+#include "system/memory.h"
 
 #define TYPE_MIPS_GCR "mips-gcr"
 OBJECT_DECLARE_SIMPLE_TYPE(MIPSGCRState, MIPS_GCR)
diff --git a/include/hw/misc/mips_itu.h b/include/hw/misc/mips_itu.h
index 27c9a1090d5..1a684d90a15 100644
--- a/include/hw/misc/mips_itu.h
+++ b/include/hw/misc/mips_itu.h
@@ -22,6 +22,7 @@
 
 #include "hw/sysbus.h"
 #include "qom/object.h"
+#include "system/memory.h"
 
 #define TYPE_MIPS_ITU "mips-itu"
 OBJECT_DECLARE_SIMPLE_TYPE(MIPSITUState, MIPS_ITU)
-- 
2.51.0


