Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBqkd-0000C2-90
	for mharc-qemu-riscv@gnu.org; Wed, 03 Apr 2019 21:01:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hBqka-00007x-QJ
	for qemu-riscv@nongnu.org; Wed, 03 Apr 2019 21:01:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hBqkZ-0005lx-KC
	for qemu-riscv@nongnu.org; Wed, 03 Apr 2019 21:01:04 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:39565)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1hBqkT-0005UN-Fq
	for qemu-riscv@nongnu.org; Wed, 03 Apr 2019 21:00:59 -0400
Received: by mail-pl1-x630.google.com with SMTP id b65so268558plb.6
	for <qemu-riscv@nongnu.org>; Wed, 03 Apr 2019 18:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=kp/2ww7D8wznr9ieJRfHO2xePqDxheKA0ZBcJ6IoNBA=;
	b=PNpvcC5Y2to09FdzE5HFDRi/oePdPUppaCm1q2wCiRxLlzJ/txuGBcPoYBLivDFxw+
	b5XHrsz6DdZi7ZP+0bvrOQocu9IKjVuj7kqQWNRujuOturBqF1UGdIQ10pazVWwn44YU
	K02jqjoZbdGW6lW52VGoNNXUH10SE/fv5yKltOcdgHXvdUBKVh758dH7L3rdvq+onxY3
	ghZDG+OpeK4+UtdiWUL6eka8/YgT8UTZ//7+bg83K6Zp90QyNdYLxJWWoxf2c+yTwBYY
	kCcXDY29SqpeKc/VOBiDGZJsu+TaGlgdPNcbcRoIO2FczIrUJmTgq7XvvT9OPq6f4pAU
	7pxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=kp/2ww7D8wznr9ieJRfHO2xePqDxheKA0ZBcJ6IoNBA=;
	b=d1cUfHJBIeOWj2+87m7z0ZOpOmYcWyoVhb7syCBNP2JzVZz9kDVp/Yyr7+mzJ2eZS7
	qTp4/KMQiiCfn8ge9kQ7mc5iWc2C590j9WwvgfEcBW0HfEjdHzUpGkI1yOZpOyVpTo28
	GIM1SVHCl2m73UDRoxNs2R+9e2HY/Xqdl5vyJIT7tXxjdXCfhcG5MlGd/IVY9FnZtoDD
	2a6O/647ajsG6EaQOLEsFn7gfdCsV4o5VlVxS1H7+tyygk5ha36T5gFrppfYiaVtuvc0
	n5Wv3rnFnBPIQMuzNd6SUbE9jkkisG36n5+X9NmakUIDKJO6b4M8eTSqXvs+9D3iW8xo
	xM4w==
X-Gm-Message-State: APjAAAUAg6sCFvOXHAG5BQ69qFH5G/PxNHiOtDsh3QlcXD9Ku6q+GjgL
	ZLY6Jgm7kauJuzwMfsMp50F879laB8Aeqg==
X-Google-Smtp-Source: APXvYqxJee7gX9mK/TiVNe9edsxWGAO5MooEFtj5IE18lT5d0Bh+zx4HNsmyxTAgcoaHZOc6DmgVEA==
X-Received: by 2002:a17:902:7841:: with SMTP id
	e1mr3170476pln.303.1554339647776; 
	Wed, 03 Apr 2019 18:00:47 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	k6sm10341833pfj.173.2019.04.03.18.00.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 18:00:46 -0700 (PDT)
Date: Wed,  3 Apr 2019 17:55:23 -0700
Message-Id: <20190404005523.6513-3-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190404005523.6513-1-palmer@sifive.com>
References: <20190404005523.6513-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::630
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
X-List-Received-Date: Thu, 04 Apr 2019 01:01:06 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

Instead of using error_report() to print guest errors let's use
qemu_log_mask(LOG_GUEST_ERROR,...) to log the error.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_plic.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
index 70a85cd07578..7f373d6c9d2c 100644
--- a/hw/riscv/sifive_plic.c
+++ b/hw/riscv/sifive_plic.c
@@ -262,7 +262,9 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned size)
     }
 
 err:
-    error_report("plic: invalid register read: %08x", (uint32_t)addr);
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: Invalid register read 0x%" HWADDR_PRIx "\n",
+                  __func__, addr);
     return 0;
 }
 
@@ -289,7 +291,9 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
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
@@ -339,7 +343,9 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
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


