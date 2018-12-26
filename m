Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gcCrK-0004Ak-U2
	for mharc-qemu-riscv@gnu.org; Wed, 26 Dec 2018 12:20:43 -0500
Received: from eggs.gnu.org ([208.118.235.92]:47881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrD-00043e-HX
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrB-0007om-T7
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:34 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:46752)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gcCrB-0007ev-Lq
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:33 -0500
Received: by mail-qt1-x835.google.com with SMTP id y20so17814041qtm.13
	for <qemu-riscv@nongnu.org>; Wed, 26 Dec 2018 09:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=RQpnr+T97+tng7kZjR3X+orZ553r6cnvrdttQSiSflU=;
	b=KbV3afr2rwq5w9EvjaTF6FG+R//LBMKA3D6WHE3U0KTYDKPXpbzKfy6IfXomvHJfgD
	3LjRJ7P5zZxBM6t77ldsZhNi9SJ5eDO/CS9qiGol52iPpFt8BGBV7y3wTtfses3YLBx4
	vasCTwcRr5/0rH6L1oEZ38uojBNtSzot8rTrQrn78exjQpFUVOkrvsnQ5W3Wl352ayd3
	NzHH235Dd/dSvQmVB5rYE6wbxGNkHnMwHue6C1XROXnZEPtFbxXXQ+Bchb0t9Uf+dNfY
	daX1bkA+05D5ooOgOAbXY9CpabGWqwGLvNWHsP8iAoMDkJNSXlDifgQqJ0u59Mr6tyKP
	xXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=RQpnr+T97+tng7kZjR3X+orZ553r6cnvrdttQSiSflU=;
	b=fU7O/2xXdel2t5YuYWjChqSy+C4a+uUKS7oZk6dL8OxQwfdhm6KVedT9BUX4IYWUTM
	End6VHiAwjv7jhHC5u7AlNSMh/IqnK4jIWalL4NJd5HAzkEAs0QXfaqmDuoB8v6113BA
	+M3Cpy4VAc6fqDWpHJ+yfcvVOkVj/eZBybaRIITLcxg4mIafkXk+ANjgm6wGs7aA/E8Z
	Aa7A0udQrGrRL7SdQkmQtp3+KRIX5x8mbbXmqD1bt9CDfLtB0BWEYgMltOstErOgn4Un
	pjuLlz1qnROAonApOj3ZyDnK2isOgolI/TLG6WQVUrvPCU1K7YMs/UGx8//s8pLyDmvO
	2ulQ==
X-Gm-Message-State: AJcUukc+5Ybe1CIX8VsEvzK6M2CUH7JOX+uO+IHudnAV2vX5Fh3NF4DO
	VHIqUd6/f0Fk7aPu/aG0jeE+MVg37rE=
X-Google-Smtp-Source: ALg8bN72pFwkqWrh6zqWJIVGhTSXNe2wFzNF0fveGg5C9qMuJBFRNoqOiUvCzfcyDDZW5YX2yiLXtw==
X-Received: by 2002:a0c:e105:: with SMTP id w5mr19343819qvk.234.1545844817643; 
	Wed, 26 Dec 2018 09:20:17 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	w52sm15800625qtc.51.2018.12.26.09.20.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 09:20:16 -0800 (PST)
Date: Wed, 26 Dec 2018 09:19:53 -0800
Message-Id: <20181226172005.26990-3-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181226172005.26990-1-palmer@sifive.com>
References: <20181226172005.26990-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::835
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
X-List-Received-Date: Wed, 26 Dec 2018 17:20:36 -0000

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


