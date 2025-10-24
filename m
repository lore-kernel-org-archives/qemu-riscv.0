Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C06CCF9E0
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:20:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vCNKJ-0001eA-WB; Fri, 24 Oct 2025 15:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNKI-0001dj-Kz
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:19:50 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNKG-0007ll-Kh
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:19:50 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso27260155e9.0
 for <qemu-riscv@nongnu.org>; Fri, 24 Oct 2025 12:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761333587; x=1761938387; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zleqKSDiqV6ouXCL2Ql1+wJ3D/HsznftIZvTGyjA1o8=;
 b=bCkDVJ8NBUT3ftNmyNT8gF+Koc9BRr3ZjuAY33QfEDq8jMkBJVvmnW7KbJaPUgTNME
 rzQajE5y49O7rOekZ6V93a0E/YcJMbzYyp69oFvcyylp3yNK9KmzU4Cwx9aXF9xjD/pZ
 zqaIp40OteLle1Wk/PkKMtplI4/DbviNfZj25Y2iiJI7mpgGKtt60DOLgHAuacjHM9Nz
 IRMfGSgZMiAd+fv/nonJIuIBie5RlVqRpL4MDXowNxW2F0RLDGUTdhXmPSf600EdDRLv
 nsTszaJkVPKvJgh9l7i8pC32SEIyBOUt8Sc9kS6nxZZCPLB4TMYuy98Gyauhj8CIkxeG
 wCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761333587; x=1761938387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zleqKSDiqV6ouXCL2Ql1+wJ3D/HsznftIZvTGyjA1o8=;
 b=WEV5pjab6f5kN1F8SN0A7FihrrWhxv7BMib1co7gcRvpT8hcdIrYyvdd+jSx93SxlH
 fwIPsBDF92K2T2qRvrDrM8oOD+Ek0roerpyhyAlUh0Vb5e2qrvcm85EBEphSBqeXuwey
 EGnZmn/vQ1jM5t21Zk3j8V7kiHoQ+Q8smmbvJT/si4dSbYWVTcCaqZRDkmgC8bauPzKk
 Yg0YmQz4ZhOvxwUs4e35ecbnVIROnOMz7fk3zUWq5mrI1fUXI+AHNa05iu6iAyPe6Kkg
 /ueTww1WvMxWauIN8cuxXaltWZxYhKUK3qUaJF6kLKS2CAUyS/ASp8P2h5vMAvd6xYSb
 zi7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXQUxmU9hL3NU5YVrzSYC5CzaxTcya+NPmf5NIH+x1tSNaVc87Yvfae1woSOVsQVhrmDYHEHbIOH7t@nongnu.org
X-Gm-Message-State: AOJu0YytEyhhTbml2IFkkoM5K63nTDgaUMzqwwdDtBfSOrGdzV/yephf
 4DaZiSxAHbKpTB7ou/ubaH5Hke1UDkse/8F5Gbe9sUyoJW/V8dYCGHrN/R61jJwi0KWMug3VA5/
 qCnSnqXk=
X-Gm-Gg: ASbGncslQXm3JmIQQ2nKroTxvC++aVdCQU947ycidySMWJhYsxebc0A5B7Ko2j3M8OH
 0ZNB8y+JxZki3qR8BTGsDJDkCrRviWqn5qKTxMiJBhOkyRv5tMQYTFmuw2pTaVyAauW6DP4pdBB
 3MfkyBuFfJgBSQDw5Je2aoFnYRfAJC4uGBW/j/N1B7hDAFYsK6gDtd3f5iDa2M0I+sk8fAByyJ1
 F8hofvarh75RbaiJ5xEBibuTpPLJjHoeRKbzwjrEw6xorXJwIHZMcnb0FaRDan8IqFM0ZqA665a
 Fl07bw3lvoR3ykwH4yQNRXZHW9oTt2wvPp8fk5pX4+tGj6CicB7H+PWOb+MV8ZXk37lYbW+q36C
 /jNddoncA7biI1xUx6R46+wk8AbJqnOcDpTn25ZP6bUpRH2BHSPP6YURTiHhRfjl6f/F5bGdWyN
 rfD4Z5Lf8Kz4QpE7XGx1QQKJZz7Rqb8UoXzuQ+/MC7xwUXr/ZioGAAEEJ5oVBr
X-Google-Smtp-Source: AGHT+IHGwA1LU6+hLBZrPJrwX3FYLkn8oGJ8pXrlyqWkQmDZDbUjpAleQmiisYsyqpwE89HlnUBLcQ==
X-Received: by 2002:a05:600c:8214:b0:471:1306:aa14 with SMTP id
 5b1f17b1804b1-47117931e47mr214993075e9.40.1761333587126; 
 Fri, 24 Oct 2025 12:19:47 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475caf2ef9fsm105205925e9.13.2025.10.24.12.19.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:19:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH 10/27] hw/block/pflash: Include missing 'system/memory.h'
 header
Date: Fri, 24 Oct 2025 21:03:57 +0200
Message-ID: <20251024190416.8803-11-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

"system/memory.h" header is indirectly pulled by "hw/sysbus.h".
Include it explicitly to avoid when refactoring the latter:

  hw/block/pflash_cfi01.c:83:18: error: field has incomplete type 'MemoryRegion' (aka 'struct MemoryRegion')
     83 |     MemoryRegion mem;
        |                  ^
  hw/block/pflash_cfi02.c:100:18: error: field has incomplete type 'MemoryRegion' (aka 'struct MemoryRegion')
    100 |     MemoryRegion mem;
        |                  ^
  include/qemu/typedefs.h:68:16: note: forward declaration of 'struct MemoryRegion'
     68 | typedef struct MemoryRegion MemoryRegion;
        |                ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/pflash_cfi01.c | 1 +
 hw/block/pflash_cfi02.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 168101d8dfe..04c30d17a99 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -51,6 +51,7 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "system/blockdev.h"
+#include "system/memory.h"
 #include "system/runstate.h"
 #include "trace.h"
 
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 3244b699b98..a2106a7ed9b 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -42,6 +42,7 @@
 #include "qemu/bitmap.h"
 #include "qemu/timer.h"
 #include "system/block-backend.h"
+#include "system/memory.h"
 #include "qemu/host-utils.h"
 #include "qemu/module.h"
 #include "hw/sysbus.h"
-- 
2.51.0


