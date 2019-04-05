Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hCCtR-0002fo-8c
	for mharc-qemu-riscv@gnu.org; Thu, 04 Apr 2019 20:39:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hCCtO-0002fZ-AE
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 20:39:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hCCtN-0002zq-Dx
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 20:39:38 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:36425)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1hCCtN-0002wx-61
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 20:39:37 -0400
Received: by mail-pf1-x42d.google.com with SMTP id z5so2260245pfn.3
	for <qemu-riscv@nongnu.org>; Thu, 04 Apr 2019 17:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:mime-version:content-transfer-encoding:cc
	:from:to; bh=xBcSx1NuN+sLuSutJPr9vM3zpuUc7W5f8kTqR5tR3Hc=;
	b=TjhcyztmZVmxFdA62RPF9Ac6JCMwM/a2uIzgasPLiuaajCczXrCoM1DGbAkNpTWQQO
	9yRTBez33BCodwbxmcBgVB6D8jVU0GHO1nyyegPJlgIvVnZCUMA4GIB9Pm9wUvBJB87i
	v+Ng8d2iPTZdY7F3DLKCK6ldzbaLnw8n8mVKkcHUpf/uxKNsuw2ov7h+XWkI9fZJ6zCx
	1RAaNMa257cH20cZliI4ReJ1+KoMVZfHnEEN21SO7J4/cueBkl9qdQofoiDbbKV1AKjW
	zVFwvWwXwcsoKP3PIVenWePqTjsXSAG7+tYZHU/f8SIEw9rLVxAwm7zXgnwXh3iC2ULY
	fDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=xBcSx1NuN+sLuSutJPr9vM3zpuUc7W5f8kTqR5tR3Hc=;
	b=tQFDUmJtb9NFHGOhOxfjQppAXJrkNmIq/WsPYVbyIaHdVolZODmEfQu1DL/7LhrtvB
	1/ahvx6IHES7CTAmjmKTaI5JCpdTfE47r5SUHcQZ0S9pk3m9GJdrUyt4Yag2FuL2kyyV
	53XcdVW5gN2iO1n0CU/btYTf93Z+FUC5sJ1jObnIp51AHLBtdFDsdR0U4ztDi9ZMUk++
	EkSnhJzKkUn7MBTufnDEelcYokIySG6E4juAfvk/rYFcQkVmBWFxacaRqCu7nT3F9BEp
	e+b5cXF1GQxM4lrDtfFv+qMIWNXn27vw2CKU/8F5/CxSX25PKl8Aug3Z9ai//e5ZUGAx
	gntQ==
X-Gm-Message-State: APjAAAUQMmb4XZtld+b4Pje6YpDqy5dT12gDWabcn3zWDJpPshFYfpE7
	UudzktzWsLhf0TS6EAFTkzulqC2ZCUtkFQ==
X-Google-Smtp-Source: APXvYqwnHP9b/IL2x3q8hKme0KwXl87gTmZqcL5rjp7xpLQRiWQ+wactcWHYCRqEh8/TFdLyH5I/IQ==
X-Received: by 2002:a63:494f:: with SMTP id y15mr9050666pgk.56.1554424775825; 
	Thu, 04 Apr 2019 17:39:35 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	g4sm36262606pfm.115.2019.04.04.17.39.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Apr 2019 17:39:34 -0700 (PDT)
Date: Thu,  4 Apr 2019 17:39:22 -0700
Message-Id: <20190405003924.1906-1-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42d
Subject: [Qemu-riscv] [PULL] RISC-V Patches for 4.0-rc3, v2
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
X-List-Received-Date: Fri, 05 Apr 2019 00:39:39 -0000

The following changes since commit 061b51e9195670e9d190cdec46fabcb3c77763fb:

  Update version for v4.0.0-rc2 release (2019-04-02 17:01:20 +0100)

are available in the Git repository at:

  git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.0-rc3-v2

for you to fetch changes up to 79bcac250f96ba1d4fdecfdc6e3363c9024703a4:

  riscv: plic: Log guest errors (2019-04-04 16:36:21 -0700)

----------------------------------------------------------------
RISC-V Patches for 4.0-rc3, v2

This patch set contains a pair of tightly coupled PLIC bug fixes:

* We were calculating the PLIC addresses incorrectly.
* We were installing the wrong number of PLIC interrupts.

The two bugs togther resulted in a mostly-working system, but they're
impossible to seperate because fixing one bug would result in
significant breakage.  As a result they're in the same patch.

There is also a cleanup to use qemu_log_mask(LOG_GUEST_ERROR,...) for
error reporting.

As far as I know these are the last outstanding RISC-V patches for 4.0.

v2 no longer fails "make check" for me... sorry!

----------------------------------------------------------------
Alistair Francis (2):
      riscv: plic: Fix incorrect irq calculation
      riscv: plic: Log guest errors

 hw/riscv/sifive_plic.c      | 16 +++++++++++-----
 include/hw/riscv/sifive_e.h |  2 +-
 include/hw/riscv/sifive_u.h |  4 ++--
 include/hw/riscv/virt.h     |  2 +-
 4 files changed, 15 insertions(+), 9 deletions(-)


