Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hCCtX-0002jM-D5
	for mharc-qemu-riscv@gnu.org; Thu, 04 Apr 2019 20:39:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hCCtS-0002gw-Ge
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 20:39:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hCCtR-0003Ih-Dw
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 20:39:42 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:43582)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1hCCtR-0003Cf-7Y
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 20:39:41 -0400
Received: by mail-pf1-x42b.google.com with SMTP id c8so2247186pfd.10
	for <qemu-riscv@nongnu.org>; Thu, 04 Apr 2019 17:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=0KFxRvtPVKexQ8LwFfKj/IAm9GYBQc7B3RcgR3vfV4c=;
	b=eWHG6nz0xeI2fQYubcku9OEhorB8SfZsrW30pfDQA3mLtwfqGlKM+Cdes7JK7uzixh
	DPQ0DhWErHTO1McHMJtRK3JNtBdqinImTRdWXaO7rqErmRHydUFnOPARwcid2kyEj6wE
	9fEi+A7sxSbV357MUTU2DpyPVFCtzP8ebVWJm8IS87tx1PCalXUSn6wHmhIUhXrXlOso
	bC+eN92c6JTI3aCqlccWwf79ahGrNF0VEtGr9jFPsr/TJxw134GCQZMB1XVDQ67p9BLf
	JGEWkeM7DwuOLyzySLw2nMBYMv3pOHXaLGJ3kvloY28HCUhENvHZOV8UpG0xpZBqxdV2
	+0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=0KFxRvtPVKexQ8LwFfKj/IAm9GYBQc7B3RcgR3vfV4c=;
	b=BymDFhPrPfgTrZmKFsIJWIxGu+OAEKQs+kSaRrQtVTf5ubx5+Vm+D9WsccJGcwumAr
	4COYlD2+SIISlF+VB8Ovfc6S58KYRxOjrGhZAA3qip98YcAgpNOh69Wm0iD2t1g82G2t
	FditdZICP5dvB2sb4tnq9d/GutDF0B2+jvRpgNVFRgIT/3BEmlEhrSjiD36EoJtPf5d7
	QOWrAJ4l0kewxaw2er1+3tAeTh0ifuSt4X0bPwQb02XP3kxXTXeGGM4hD1PCOMgLfw6m
	2aqxsjrx0agOxB/91uvWrwiQhwZDDxXoKc76DVokB7/lmRjwh5um/eqSzIn1tPRMkTcT
	uFtw==
X-Gm-Message-State: APjAAAUgJKLlGJA0CYr4yGJD5IVWk9h4M8b2uKhDhzOicDzL7v8fGc62
	hayhE1oIRrC0eSK/wKXhWjcVi+V8+tOkuQ==
X-Google-Smtp-Source: APXvYqwQR4PAgGMQeYPJyV2cpOIimiQ0sHh/FCawgm+xVhEkgP2RcUjii8eYQS5RSGJlLzp71NzdwA==
X-Received: by 2002:a65:5a81:: with SMTP id c1mr8948237pgt.391.1554424779795; 
	Thu, 04 Apr 2019 17:39:39 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	c17sm29392383pfd.76.2019.04.04.17.39.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Apr 2019 17:39:39 -0700 (PDT)
Date: Thu,  4 Apr 2019 17:39:24 -0700
Message-Id: <20190405003924.1906-3-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190405003924.1906-1-palmer@sifive.com>
References: <20190405003924.1906-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42b
Subject: [Qemu-riscv] [PULL 2/2] riscv: plic: Log guest errors
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2019 00:39:45 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

Instead of using error_report() to print guest errors let's use
qemu_log_mask(LOG_GUEST_ERROR,...) to log the error.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_plic.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
index 0315e035e5fb..07a032d93d2e 100644
--- a/hw/riscv/sifive_plic.c
+++ b/hw/riscv/sifive_plic.c
@@ -263,7 +263,9 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned size)
     }
 
 err:
-    error_report("plic: invalid register read: %08x", (uint32_t)addr);
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: Invalid register read 0x%" HWADDR_PRIx "\n",
+                  __func__, addr);
     return 0;
 }
 
@@ -290,7 +292,9 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
     } else if (addr >= plic->pending_base && /* 1 bit per source */
                addr < plic->pending_base + (plic->num_sources >> 3))
     {
-        error_report("plic: invalid pending write: %08x", (uint32_t)addr);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid pending write: 0x%" HWADDR_PRIx "",
+                      __func__, addr);
         return;
     } else if (addr >= plic->enable_base && /* 1 bit per source */
         addr < plic->enable_base + plic->num_addrs * plic->enable_stride)
@@ -340,7 +344,9 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
     }
 
 err:
-    error_report("plic: invalid register write: %08x", (uint32_t)addr);
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
+                  __func__, addr);
 }
 
 static const MemoryRegionOps sifive_plic_ops = {
-- 
2.19.2


