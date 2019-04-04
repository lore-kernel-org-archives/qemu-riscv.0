Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBqkW-0008UA-PM
	for mharc-qemu-riscv@gnu.org; Wed, 03 Apr 2019 21:01:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hBqkT-0008Sw-IH
	for qemu-riscv@nongnu.org; Wed, 03 Apr 2019 21:00:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hBqkR-0005b3-Dj
	for qemu-riscv@nongnu.org; Wed, 03 Apr 2019 21:00:57 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:41795)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1hBqkL-0005PW-Ic
	for qemu-riscv@nongnu.org; Wed, 03 Apr 2019 21:00:50 -0400
Received: by mail-pg1-x541.google.com with SMTP id f6so326005pgs.8
	for <qemu-riscv@nongnu.org>; Wed, 03 Apr 2019 18:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:mime-version:content-transfer-encoding:cc
	:from:to; bh=QzgVTvtkYcaClV9ox8ihJNrfV9GwiuJCxeLPzizNnhA=;
	b=Xj+Stpdme4HX1mfz64v7zadxaQ/N43BN/YYT4rQrTgisBby+h265Rmz1Rw6n7ynAiy
	OS5x7K8OGXwZhll28OCJVUQ1xMz+8YLcdS/W0dztYXkQ4QEkjUx6n0g6xnRywd5qU1m0
	73a4m32y8j7awQZ72nZn38OYnXLafxZf/YUw/6F3y0LI8j2sKhopVt55hK5OByAHTCrC
	LfTSIIA7MZmoMrm/KekOWxDgdPasq/AVGE5++q7QcZlnXHYY6R3A/Am434MG7CTL2dRI
	vwVB0H1E/7mlhHAeT196+j0RBKggeorOrp0uZw/cNciBpzPvDddfcxPXDhUoV414wnr1
	P2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=QzgVTvtkYcaClV9ox8ihJNrfV9GwiuJCxeLPzizNnhA=;
	b=QLvEzTvslZNvnY4HEX+F4PYJ5yCFmzvTGkCKpwSW+PvLmhzBogaEUaEDpnUcpueNd+
	edGCRNonIOF3D4UPOdxLw9zwTHft3/4FnOsxFQekhzqEgRJoc9aTxoWEFnQR/QNx+6wN
	/Jw48KPVoBDpkEkRiCR9ZYCvE+w1QO+0O3PcHWFce6Wj2tAEn7gej7tzVXzW9ujDYos4
	3QTB45dRvzQojfQtki3JerNr8+K/jBHH2l21ioFpxF8JAg8rSGzwu1Sp75T3hOhXJYE7
	+c/tGdvk7ptJ2ANzG0khAWW81yjt234H9bqAQFWl2YHS8yiFC85kqaSLrqB2F97fdmT1
	1JVA==
X-Gm-Message-State: APjAAAV1P0wr++3kKNTGlKYR84AWf9tJv3MRtyWWkHGbPUbEAxOaceET
	/eeJ09lhDUkK/tVp18/js/q++fb6Ks1rNQ==
X-Google-Smtp-Source: APXvYqySOPbMKxXN2ht5xb3gA3H59Nr/FIUSD3WKAC9DXcdrt3NDNpEKR8pjF+GKnfzjnXIHqo/asg==
X-Received: by 2002:a62:304:: with SMTP id 4mr2630360pfd.99.1554339644322;
	Wed, 03 Apr 2019 18:00:44 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	c189sm25949214pfg.24.2019.04.03.18.00.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 18:00:43 -0700 (PDT)
Date: Wed,  3 Apr 2019 17:55:21 -0700
Message-Id: <20190404005523.6513-1-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-riscv] [PULL] RISC-V Patches for 4.0-rc3
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
X-List-Received-Date: Thu, 04 Apr 2019 01:00:59 -0000

The following changes since commit 49fc899f8d673dd9e73f3db0d9e9ea60b77c331b:

  Update version for v4.0.0-rc1 release (2019-03-26 17:02:29 +0000)

are available in the Git repository at:

  git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.0-rc3

for you to fetch changes up to b84ffcecdb7a6a3e9946d0d6d24703199c4880b3:

  riscv: plic: Log guest errors (2019-03-27 20:23:03 -0700)

----------------------------------------------------------------
RISC-V Patches for 4.0-rc3

This patch set contains a pair of tightly coupled PLIC bug fixes:

* We were calculating the PLIC addresses incorrectly.
* We were installing the wrong number of PLIC interrupts.

The two bugs togther resulted in a mostly-working system, but they're
impossible to seperate because fixing one bug would result in
significant breakage.  As a result they're in the same patch.

There is also a cleanup to use qemu_log_mask(LOG_GUEST_ERROR,...) for
error reporting.

As far as I know these are the last outstanding RISC-V patches for 4.0.

----------------------------------------------------------------
Alistair Francis (2):
      riscv: plic: Fix incorrect irq calculation
      riscv: plic: Log guest errors

 hw/riscv/sifive_plic.c      | 16 +++++++++++-----
 hw/riscv/sifive_u.c         |  2 +-
 include/hw/riscv/sifive_e.h |  2 +-
 include/hw/riscv/sifive_u.h |  4 ++--
 include/hw/riscv/virt.h     |  2 +-
 5 files changed, 16 insertions(+), 10 deletions(-)


