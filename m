Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iVTQR-0006DY-Bu
	for mharc-qemu-riscv@gnu.org; Thu, 14 Nov 2019 23:41:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49693)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iVTQN-00067c-RR
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2019 23:41:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iVTQM-00088k-Pr
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2019 23:41:35 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41739)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iVTQM-00087X-Kw
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2019 23:41:34 -0500
Received: by mail-pf1-x441.google.com with SMTP id p26so5788948pfq.8
 for <qemu-riscv@nongnu.org>; Thu, 14 Nov 2019 20:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=yJmFGNtNtQHlzjVVr4hwH9M3d1nwvxRmf94Oh4rJpwo=;
 b=AMim9xq815tsn4O5H5tDMqF1UnAhJj5F+zOO2DNu9WEaWGlQbrnXfTswBb0CTO+1SC
 poJkmwKWX1O/v53fNVfE4C5i2zS1qHUvjDfafvdwAPjiqt21s+S+lL6YqHIC9XC97q3L
 o0xOGoMJuymVbcNcqeSVCBhPSvXxUGwKo+ksJtTXjXpPemxprOCagZprkPCWeokYCTRP
 T+ct/oKk/3VbPDQIhBH0SiRmHd4H6SRRNFHZph4yfNTwRM1zdVZT6AM0vW3cY2RIaWCB
 KG0gnAjfvXT6MRQB+Di+hIoagjpzqitsQYeHzycgdHGkJbOesYoRjC9mufxSicy5Uyj2
 kTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=yJmFGNtNtQHlzjVVr4hwH9M3d1nwvxRmf94Oh4rJpwo=;
 b=dt36dhk/PgmzvZe1e5N+xY1FXhR2c5llIvwxEjPeBB1jhXrau8QkXGpzPPkyZb1K5s
 FbRQW01EuetG3nZ7soX3gYxCzDrMUagX2c7C7LHx9Tpy5QlFKw20BUFt4vvSA1N20Q1q
 0yJrbFFj7VRcJGwi1djTiWwccgM88n6EV54UMD2RHDyivI51CihL0p/RsrTfUWXhleIu
 MXBPTWLX7Nl1gWfchNseGVfjzDVrc38eZG6gAFG9F5XWZFhO2GhQMAypeKS+v70zv8WX
 7Y9RCiahxKtyFfE0FhyD9c0riWFkq8NvCkvQh/91lJm1wDa4S7ICi6x26B8vGNd469hW
 SNqQ==
X-Gm-Message-State: APjAAAVN+Yj8mEZ5WOa+7+M4VVpyO1FQJQZj/MzqTB7oTtnRiEHBKTM+
 gNz1L2dl9SDx87Tco6uDYS+EYronc6M=
X-Google-Smtp-Source: APXvYqxbKd1TFdCqMbXM2y9ZJTrDogpyWftF9XsfvMYQKcU88HNWUWIBwXns0RzzyFTe+y3VcxLKIw==
X-Received: by 2002:a62:1c91:: with SMTP id
 c139mr15259349pfc.175.1573792893099; 
 Thu, 14 Nov 2019 20:41:33 -0800 (PST)
Received: from localhost (c-67-161-15-180.hsd1.ca.comcast.net. [67.161.15.180])
 by smtp.gmail.com with ESMTPSA id 67sm9182645pjz.27.2019.11.14.20.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 20:41:32 -0800 (PST)
Subject: [PULL 4/4] riscv/virt: Increase flash size
Date: Thu, 14 Nov 2019 20:41:04 -0800
Message-Id: <20191115044104.4197-5-palmer@dabbelt.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191115044104.4197-1-palmer@dabbelt.com>
References: <20191115044104.4197-1-palmer@dabbelt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Nov 2019 04:41:37 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Coreboot developers have requested that they have at least 32MB of flash
to load binaries. We currently have 32MB of flash, but it is split in
two to allow loading two flash binaries. Let's increase the flash size
from 32MB to 64MB to ensure we have a single region that is 32MB.

No QEMU release has include flash in the RISC-V virt machine, so this
isn't a breaking change.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index cc8f311e6bbb..23f340df193e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -62,7 +62,7 @@ static const struct MemmapEntry {
     [VIRT_PLIC] =        {  0xc000000,     0x4000000 },
     [VIRT_UART0] =       { 0x10000000,         0x100 },
     [VIRT_VIRTIO] =      { 0x10001000,        0x1000 },
-    [VIRT_FLASH] =       { 0x20000000,     0x2000000 },
+    [VIRT_FLASH] =       { 0x20000000,     0x4000000 },
     [VIRT_DRAM] =        { 0x80000000,           0x0 },
     [VIRT_PCIE_MMIO] =   { 0x40000000,    0x40000000 },
     [VIRT_PCIE_PIO] =    { 0x03000000,    0x00010000 },
-- 
2.21.0


