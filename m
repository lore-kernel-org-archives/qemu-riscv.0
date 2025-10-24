Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC153CCF9E0
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:32:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vCNWN-0000l0-IR; Fri, 24 Oct 2025 15:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNWI-0000jR-RO
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:32:14 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNWG-0001KP-Ss
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:32:14 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-471193a9d9eso27275065e9.2
 for <qemu-riscv@nongnu.org>; Fri, 24 Oct 2025 12:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761334331; x=1761939131; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5PQvFv3KYt9affpbRt+SdFadtQ6SLXOOKaJGxhZMFw4=;
 b=ltc9ljk0XhRbxFnG6VvaG4Vh6EmkAH1iqLpMWLqiSqEx0GOPAcwFs6rE3ZPaWRl/lD
 iQFISzv2a413k2ZjHpzEI9hK33Nf1Z4l7oXSK8iIuU6QQ7ViQe+g1KKPBDflKI2FWrLW
 ReKl61948B4D4nzynlcOkB66qKDeIxl6bLsGs36fg0mGJlUbM18WSIga/f6BZCUdJkIx
 tOfJJFsFojTUzC2lEv4/LGc8EA737llDfU6x1TuQQkQT4Ne6m0UlaEU7bIIBDGjfxTHh
 ST/98SfZSdlVhAnMJUyXkrFilRiqR12Huj7lYR+aTXFQCRWQEqT8ov+/tMxqpWUjsjjy
 IP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761334331; x=1761939131;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5PQvFv3KYt9affpbRt+SdFadtQ6SLXOOKaJGxhZMFw4=;
 b=Q2czRKE/3fqUjfOhgAlyT6fN+SHiGJqbEe70YPn7OnxjxRXbgcf797RjJJHnqQHgRH
 lVIRNOquUw6T1EMJz94dLXgKCs/KDPIB35o/gpkLodpmZ8V+HmFK4liZCSeeTlagIEAq
 DR8kp15hMkm6tnRlBNBfjVJ8OBTxO16njRNLGgjjfQyeGfOZuIHcPbxok9wOhLpv9/Xc
 wMGT8WWeqQPlWgg59FZ7E3VGzjtpVRgVtMz/+df4+SfrnK8nBFtz2gP5E5cDN5qF9JEz
 0bi85BAvmGl4kcMBynStCzkznvuh86TtjHqlr3iU/H7IYHP9K3fAyJ2I+XvYTQphdU02
 cxEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoN5BGYlldLEdvO31iykzDytZPa4neK7J+YonJt8YE78bRjMCcjIYkfsKfzoeDZBpxC5Y56ubr62ef@nongnu.org
X-Gm-Message-State: AOJu0YwQTbcVQBZ2gYwYDYRxGkYmoQXQvLx0i9yTXL0WkByBVI8lQlJQ
 KschHSpxkDXH8Cj3WHXN4xey0IKDYMt4N5nGJT2N/Q2q7YsYlRQ2Breuon0gmA0Q3T8=
X-Gm-Gg: ASbGncsdZLqq7ESMPwSnLZcWT8rYAh79DVSllxH4qWboOh0xWCgqcyVyZSxh1+mEVUl
 FtQv/6wJhhbTG8cAhiw0L/+hY1B5WTmQj1BGYYHwqXYcnhxz4hhPaNSiW8RpPi+DWKPhqvejKD5
 a5Cjlj0Y4DkP0zv4J1CieW58RYiAEGsc7XyB+wDlAqxsmBp9zxdASuAOFY6EETFA8yRnaWNe8oW
 zZHVxCKsoX7RX1PikFPmSYk+q7yYGtypAREgCnCWVRDFwbEbmaSIh/fPNgSggkZJZfOA/U5j486
 FGni5IcY9T+csbGIcjVCOGWhIxogXbuYothxbzRmmcPauTJ2jFWRCsF7zh3RxrThiSqXKGfli4U
 7HM8UVZvnh3loiIn66EdSMeLx9L4vZr8nvitMuwm2w4mUo1HzGbMAzfjTRwfI9gJV0zStxlg/aX
 QZiPpdPXc+YIm3WHjp8OSQOdC94LQ1IX9G4q9p03JJzJhmaXuM3Q==
X-Google-Smtp-Source: AGHT+IHzBFBxTwcnx5jxUEP6XJQmCf6wUV3hwfL9BoJ/otuH7ZCqfcBQTrLP8ONMEFAiO3sZ94W1hQ==
X-Received: by 2002:a05:600c:4510:b0:46e:1fb7:a1b3 with SMTP id
 5b1f17b1804b1-475d2ec5729mr30808125e9.23.1761334331350; 
 Fri, 24 Oct 2025 12:32:11 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b79cbsm18173f8f.4.2025.10.24.12.32.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:32:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH 18/27] hw/input/lassi: Include missing 'system/memory.h' header
Date: Fri, 24 Oct 2025 21:04:05 +0200
Message-ID: <20251024190416.8803-19-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

  In file included from ../../hw/input/lasips2.c:29:
  include/hw/input/lasips2.h:41:18: error: field has incomplete type 'MemoryRegion' (aka 'struct MemoryRegion')
     41 |     MemoryRegion reg;
        |                  ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/input/lasips2.h | 1 +
 include/hw/misc/lasi.h     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 01911c50f9b..3510216effd 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -22,6 +22,7 @@
 #include "exec/hwaddr.h"
 #include "hw/sysbus.h"
 #include "hw/input/ps2.h"
+#include "system/memory.h"
 
 #define TYPE_LASIPS2_PORT "lasips2-port"
 OBJECT_DECLARE_TYPE(LASIPS2Port, LASIPS2PortDeviceClass, LASIPS2_PORT)
diff --git a/include/hw/misc/lasi.h b/include/hw/misc/lasi.h
index 0bdfb11b501..70c99fc017e 100644
--- a/include/hw/misc/lasi.h
+++ b/include/hw/misc/lasi.h
@@ -15,6 +15,7 @@
 #include "system/address-spaces.h"
 #include "hw/pci/pci_host.h"
 #include "hw/boards.h"
+#include "system/memory.h"
 
 #define TYPE_LASI_CHIP "lasi-chip"
 OBJECT_DECLARE_SIMPLE_TYPE(LasiState, LASI_CHIP)
-- 
2.51.0


