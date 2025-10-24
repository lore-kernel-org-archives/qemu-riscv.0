Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802A0CCF9E0
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:31:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vCNUx-0008IY-0h; Fri, 24 Oct 2025 15:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNUp-0008Hq-Hr
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:30:44 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNUn-0001By-5p
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:30:43 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46fcf9f63b6so14629985e9.2
 for <qemu-riscv@nongnu.org>; Fri, 24 Oct 2025 12:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761334239; x=1761939039; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aGzJrcygtK07BMsaHC12W4FKVVudp6KCMI+Hev9pyzM=;
 b=wNIGNsdagXbgu3xdWqM1kuUbn7q6hGeZ+H3vxXzlIgQoEeoczNwGQpAHIypo0TD4nm
 PsSdo2azHunDYWacHLsDMHwFPm1ZwcLa6nuPQGBy86terGjqxKjNpbjvOpfw0ZvD/gyb
 7TWng+1RoEcwwuYUVKvXnYyRaeIACqt48CMV5Zpj+w9DXLWknVgjGihJQGvtWL6gx7ki
 wpcg2u1R3extdcnVvJzpUQMN1C/JXEFQ7tkuuYucERiGvmjv1X8CyX9OTT2WAzpwaEXN
 T60yZ/YzxO/DtknqXsXY0gJ0NaDfSgoXYVqiuRLUzggkublN2Kwzu8FRfDKC8m3phuSl
 E6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761334239; x=1761939039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aGzJrcygtK07BMsaHC12W4FKVVudp6KCMI+Hev9pyzM=;
 b=V8XjNGXr30EmhP4KmVNvHItRN/YQ8M4qo/SFI8JD6dIwn3eQnYWCE43SrZA5VgFSlB
 g27+uNL9fDeDSXj2mfA+V5Y2zTTFC2uvUhzdGUdkMj4rMYVghka0nL14wAOsQU+BR5Cp
 Yv4SBSZSDiWp/E9vhM16D7VRxwGMvu01dLYlgrYYCuKPlWaXak6gWGyT1t9+i245S7Em
 gP898sSgBXTSa98yE5TuX7g6aduoZ7FTj8fubuAYbqxgmy3TraIZnhkE2xAJRZkxGXKa
 73VjFnOmmbqYBL9z5PSOYYVTQAvdh5egaSE80p/RHrU3cOOvFM9YRRf3q9HOizJPNCqy
 UQ8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyso6RQvr3sO5zdiadKwRPDWBlf/O2gBRSto8OWegTbNzB3PRmLfiSycJN66wQKh1/RdeJg4LaB5aG@nongnu.org
X-Gm-Message-State: AOJu0YylvAt/wFVOB35fm37rLJd/+P6aQz2QFOpI6hf5S+mzSP2RcxY9
 wqR7f4XEm+AoPSIoXEaHTZ3cNQArINwbPOThGvWT2y1Ro2o9QEceY+TWj4wgiZhAD5M=
X-Gm-Gg: ASbGnctQ3xd1NmETN8pP9VWdxNg/FP4kWSsDYGfrpCOj8S8Idb0KBz3zolJWbXW9Gcu
 GPdRq9SlU+yycm5dPn0DtWfnxGOi5XRbT+cYFYVL8gp6EUkBsKmTXl+htSYvHYi8Ecm1mV9FJQs
 50RK5Pn6sicqWmEu0q0HM/GWIG2I0fpqSBW+C4jVSbxofo2cYXsw3havTPbus1kL8bCxitFlDzd
 LVmcOTYKz0AxbBDkLVAJdkEnJPRtngI51g1EFlT2Tu0x7qRhj3+5T2VsNKpLCXnyggX+3ACoDIT
 soI3ZcauxvWoezOfFh6iqEyZlMiH1u9W9HwEEzavgpFx/HN2prPaagiyrsnAbBRzoN7RMoY2du8
 yF3b+Ids8jyRQI0nJpbfS4eSRPx4Fp+bIWO77CiMIZMVGenxvHvnoK8X8gU9rjqwYVn5NJf96jN
 iYtW+ARPiOOMLs11UWKMJhU9sq7W3cgoowNSGq6ePNOoLIBRzdnNKNkB9GNEMA
X-Google-Smtp-Source: AGHT+IHeUYsa+S4os0Sq093WpujmYJvXDYDlO0YQqlbbf1owcSqiCMQcX5+5X6h29uWYt8XZBWsQBA==
X-Received: by 2002:a05:600c:458b:b0:46e:4246:c90d with SMTP id
 5b1f17b1804b1-471178774bfmr208206745e9.11.1761334238713; 
 Fri, 24 Oct 2025 12:30:38 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dc0d1fb4sm1082595e9.2.2025.10.24.12.30.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:30:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 17/27] hw/avr: Include missing 'system/memory.h' header
Date: Fri, 24 Oct 2025 21:04:04 +0200
Message-ID: <20251024190416.8803-18-philmd@linaro.org>
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

  In file included from ../../hw/misc/avr_power.c:26:
  include/hw/misc/avr_power.h:40:18: error: field has incomplete type 'MemoryRegion' (aka 'struct MemoryRegion')
     40 |     MemoryRegion iomem;
        |                  ^
  In file included from ../../hw/timer/avr_timer16.c:39:
  include/hw/timer/avr_timer16.h:51:18: error: field has incomplete type 'MemoryRegion' (aka 'struct MemoryRegion')
     51 |     MemoryRegion iomem;
        |                  ^
  In file included from ../../hw/char/avr_usart.c:23:
  include/hw/char/avr_usart.h:67:18: error: field has incomplete type 'MemoryRegion' (aka 'struct MemoryRegion')
     67 |     MemoryRegion mmio;
        |                  ^
  include/qemu/typedefs.h:68:16: note: forward declaration of 'struct MemoryRegion'
     68 | typedef struct MemoryRegion MemoryRegion;
        |                ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/char/avr_usart.h    | 1 +
 include/hw/misc/avr_power.h    | 1 +
 include/hw/timer/avr_timer16.h | 1 +
 3 files changed, 3 insertions(+)

diff --git a/include/hw/char/avr_usart.h b/include/hw/char/avr_usart.h
index 0cc599e9b15..2d2fc0669f2 100644
--- a/include/hw/char/avr_usart.h
+++ b/include/hw/char/avr_usart.h
@@ -25,6 +25,7 @@
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
 #include "qom/object.h"
+#include "system/memory.h"
 
 /* Offsets of registers. */
 #define USART_DR   0x06
diff --git a/include/hw/misc/avr_power.h b/include/hw/misc/avr_power.h
index 388e421aa7b..a3d3d1de878 100644
--- a/include/hw/misc/avr_power.h
+++ b/include/hw/misc/avr_power.h
@@ -27,6 +27,7 @@
 
 #include "hw/sysbus.h"
 #include "qom/object.h"
+#include "system/memory.h"
 
 
 #define TYPE_AVR_MASK "avr-power"
diff --git a/include/hw/timer/avr_timer16.h b/include/hw/timer/avr_timer16.h
index a1a032a24dc..c08288d6227 100644
--- a/include/hw/timer/avr_timer16.h
+++ b/include/hw/timer/avr_timer16.h
@@ -31,6 +31,7 @@
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
 #include "qom/object.h"
+#include "system/memory.h"
 
 enum NextInterrupt {
     OVERFLOW,
-- 
2.51.0


