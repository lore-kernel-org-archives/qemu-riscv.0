Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gaNH1-0001IV-Mx
	for mharc-qemu-riscv@gnu.org; Fri, 21 Dec 2018 11:03:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNGz-0001H9-Nu
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:03:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNGy-000418-UD
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:03:37 -0500
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:41490)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gaNGy-0003zu-Oj
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:03:36 -0500
Received: by mail-qt1-x82a.google.com with SMTP id l12so6163111qtf.8
	for <qemu-riscv@nongnu.org>; Fri, 21 Dec 2018 08:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=RQpnr+T97+tng7kZjR3X+orZ553r6cnvrdttQSiSflU=;
	b=g+CtIovDslBhu8oe4Brbc+4OqMV7upbNlULerLsouCEDTVZ7nJcGDTzHwAhYfGeIIW
	KNUtSewMbxyQkZ57xd+9DI6W5Uat9VqZpj2Or/eSP5rPuzjz/ZS0t38py1z1X/Fu9KMq
	WVDj2aehxr1AcKMnKlozoMxUIlCcu4Ldca1QhZLE5IYWugIcvnSLDd8wJfNtV/obhNfV
	4wjT17sfxj69sKfq3ElVpZq1LCYHNAOCqoP7BLl4E8u+l0qXjrpi7PzmbWt62ZZCr+4G
	QgSYug/v5VAnqpf0q19wAd1DDlV/4B6mh4bxxCdUFcoZeIbM7IurcLfK9qUT5Ls2rGWO
	ZmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=RQpnr+T97+tng7kZjR3X+orZ553r6cnvrdttQSiSflU=;
	b=a7Nn1hLyI67ORiXHtnODx+WfmGQz/zs3GJG6IFopsQKK9uMqABn9g7vibXPtO67bLh
	oSqeXsc4Mkmq5LO4U0vLTgM8ydTFjLWt3g5O5y5T4F1IiuEKyy4K0EXWeCVXjuFU7hLI
	vXzPX0e7EzWoLhrLY7j+HjkAhaUNOcM6meZBa6Hu4KdtbXc1excNlc9bJH5sq4hGnhyQ
	Gh0pPuoHF9ubVojyDWX0j17XcR6JrZ6xMjr4aqe6U1TYratbBZWISxqrXftAy1A1WjLz
	TI4fJ7r2ZWShD0edFeYQnaEGdfDVc0T+lI5SUkByby7O8GXFXQQWP8qpRKDqXRHoMcov
	C/bA==
X-Gm-Message-State: AJcUukfQR8m/2hKFTiyzQZlfSg5veUdxjaFfGwWHUNbn+w6TvLshXIpq
	xedOx6gkViafT1aUuLrmbIjmzA==
X-Google-Smtp-Source: ALg8bN79Y8p9/u9HelCjMbB83Y/6zBMHo4v+o4uQTya/ckx7QdQAjzJ4A2B9j/HfSc50GGvN/4r20Q==
X-Received: by 2002:a0c:bb82:: with SMTP id i2mr2911319qvg.159.1545408216196; 
	Fri, 21 Dec 2018 08:03:36 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	t43sm7969787qtc.53.2018.12.21.08.03.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Dec 2018 08:03:35 -0800 (PST)
Date: Fri, 21 Dec 2018 08:02:55 -0800
Message-Id: <20181221160307.14819-3-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181221160307.14819-1-palmer@sifive.com>
References: <20181221160307.14819-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::82a
Subject: [Qemu-riscv] [PULL 02/14] hw/riscv/virt: Adjust memory layout
 spacing
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
X-List-Received-Date: Fri, 21 Dec 2018 16:03:38 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Andrea Bolognani <abologna@redhat.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/virt.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2b38f890702c..6b6fa39aaa38 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -47,14 +47,14 @@ static const struct MemmapEntry {
     hwaddr base;
     hwaddr size;
 } virt_memmap[] = {
-    [VIRT_DEBUG] =    {        0x0,      0x100 },
-    [VIRT_MROM] =     {     0x1000,    0x11000 },
-    [VIRT_TEST] =     {   0x100000,     0x1000 },
-    [VIRT_CLINT] =    {  0x2000000,    0x10000 },
-    [VIRT_PLIC] =     {  0xc000000,  0x4000000 },
-    [VIRT_UART0] =    { 0x10000000,      0x100 },
-    [VIRT_VIRTIO] =   { 0x10001000,     0x1000 },
-    [VIRT_DRAM] =     { 0x80000000,        0x0 },
+    [VIRT_DEBUG] =       {        0x0,         0x100 },
+    [VIRT_MROM] =        {     0x1000,       0x11000 },
+    [VIRT_TEST] =        {   0x100000,        0x1000 },
+    [VIRT_CLINT] =       {  0x2000000,       0x10000 },
+    [VIRT_PLIC] =        {  0xc000000,     0x4000000 },
+    [VIRT_UART0] =       { 0x10000000,         0x100 },
+    [VIRT_VIRTIO] =      { 0x10001000,        0x1000 },
+    [VIRT_DRAM] =        { 0x80000000,           0x0 },
 };
 
 static uint64_t load_kernel(const char *kernel_filename)
-- 
2.18.1


