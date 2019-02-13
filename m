Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwj6-0002Hc-EL
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:45:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwj2-0002Ax-R5
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwj0-0006xY-MF
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:28 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:37796)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwiy-0006kE-NV
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:26 -0500
Received: by mail-pg1-x52e.google.com with SMTP id q206so1305773pgq.4
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=25x7V8KWwYnf3xyK6lIJ9l+OPjNmGGMyIhByiwUhP2U=;
	b=GwAIH191D4ZO+CkbyX9HEP4NO101nCHiI830KQq5Tnugw3XNGNKm9iI8AQRoQxwdDl
	ERYUbYFoi0KoXEK9iPBuxhND5IgyykesNAWwlBMFwi5TzaFLp1/AXjdy73B16rnFO1v5
	4tCfeqYbMBvKRyILGlivw8wr2hyrJLbVZKf+iJDOn5FNHYEt2nxuVX/UuGJrOAN+aaap
	F/u83Ldo4TQW7TLfoc+oJe10Pzu3jyLh2keDKnuO2IaFwhOTFmJKp2GzH5Ur1YV1d1qI
	JSZNZy6/VcKNahNcYhyiB+xiyuZBj6Q9EnC+DDjM3pnEF2Jiv6MzdyW5D/GTMYXHM50O
	8G3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=25x7V8KWwYnf3xyK6lIJ9l+OPjNmGGMyIhByiwUhP2U=;
	b=B/W9DPPDFZoHEVU/8n0KfdrQPYWUTeZ3DCVKRY5FAdc7aH5WELV2H4g6OaWum3EsWt
	tLbhwiUtVfXBjZ9BOMM15NibcpkAcwjovl75e8iXfKC15DYvkioBaKHfzm2q2gw0UjDx
	nX5yqz0Xmp2Wx0mg4IU8J3E04k3hhKwJAPjReOirsfEd1lBALBZ5xFBkApEouftsnu2r
	EFL5N8nKuV/3bGpMZBUS4i/3ul+epib9UoUik8BmA6T2CxT66LwEZQKIa1s64YTMEd5D
	4vK5B48eaBP1BRu5KOzR3P0ExF9WMAtSkuKy0bJEpxHP65W6spPSKn1wd76HrhfHEVLc
	FRKg==
X-Gm-Message-State: AHQUAuauOlzTyiC54jdpHP3qfxhdb92Gjcu1Nzaz1BaCExYv9UPoJVpR
	wqwm0omzh9tOBFS5VO2oyGS0xZB7VMg=
X-Google-Smtp-Source: AHgI3IYXl6Jx2kZiRqqHg/mvzdAADr5I7F+qImZGQzWPHWcmVk+v1wbHSOQSybypZtnV9c1jQwYbNg==
X-Received: by 2002:a63:94:: with SMTP id 142mr1045901pga.74.1550072717575;
	Wed, 13 Feb 2019 07:45:17 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	f67sm23106570pff.29.2019.02.13.07.45.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:45:16 -0800 (PST)
Date: Wed, 13 Feb 2019 07:44:48 -0800
Message-Id: <20190213154450.14749-10-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213154450.14749-1-palmer@sifive.com>
References: <20190213154450.14749-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52e
Subject: [Qemu-riscv] [PULL 09/11] MAINTAINERS: Remove Michael Clark as a
 RISC-V Maintainer
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
X-List-Received-Date: Wed, 13 Feb 2019 15:45:29 -0000

Michael is no longer employed by SiFive and does not want to continue
maintianing the RISC-V port.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a2da141a928f..e170a4c73376 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -259,7 +259,6 @@ F: include/hw/ppc/
 F: disas/ppc.c
 
 RISC-V
-M: Michael Clark <mjc@sifive.com>
 M: Palmer Dabbelt <palmer@sifive.com>
 M: Alistair Francis <Alistair.Francis@wdc.com>
 M: Sagar Karandikar <sagark@eecs.berkeley.edu>
-- 
2.18.1


