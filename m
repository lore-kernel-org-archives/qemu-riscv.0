Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i4Fzu-0007m5-SJ
	for mharc-qemu-riscv@gnu.org; Sat, 31 Aug 2019 22:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47685)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i4Fzf-0007c6-VL
 for qemu-riscv@nongnu.org; Sat, 31 Aug 2019 22:53:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i4Fzd-0006Oj-Ps
 for qemu-riscv@nongnu.org; Sat, 31 Aug 2019 22:53:31 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:36445)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i4Fzb-0006HW-1T; Sat, 31 Aug 2019 22:53:27 -0400
Received: by mail-pg1-x542.google.com with SMTP id l21so5497546pgm.3;
 Sat, 31 Aug 2019 19:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=xlgH8lN38PwpSGAUVEbYDnXmkbyjLfnSXA45vjpEO5E=;
 b=C6jOqQo02nQ63Ai4BrWEMgaZAT/wKv6D1flF4MpgkW36u3B2BMk5rDBql3Mlcrpewc
 j6aJhsTLlvMTNJD2Y1fzzZJm8JBimvvPQe79SRGHrhpLv6ks767OUjf8Bgk+xA+j1zgE
 Mkr6A3acQl0chAHfMo1XKN3Y2a3SDG/wI+PYewpTz0V8a9R9FzUpCT6m2JRkVPo9WSBQ
 82xmc88fpkvMvUddkJynZB4Dg73DzP3X2tBvcJa3YkQrZiwzKJUpJCjzIrsAwBI0Xu8l
 VAqQwYVh9MnteFv4Ym9lPgFytZnd+/UoFL+CkA5tal8Tgxtz0pLDgXAvJbiVQw79oy8N
 JquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=xlgH8lN38PwpSGAUVEbYDnXmkbyjLfnSXA45vjpEO5E=;
 b=XcCYN5FQj/dzm4TMMs6v/sVc8pIhp5yaA9BznWymiObVZSlyhxxhcpDY5PsaHk9rBv
 4Gxx8EzgIx+6u88kCP4c7n2DyaORE9Pfvc8htS5FB4f4/0+u9+Z4FWfBmVVp76E6aBTD
 gn8sH8gaufMyD1bRx3ZE7eqmYUyVtzDX2/f76AMRdaEmVX6ETL9k2OG6WHwJPzDmgNeb
 /1fLECID9RffgmPPKnfPzJFuxZ7bvTA+Gdl2yT0VxjO+ZOp4IrFeOHarR+MSlNd32Yhi
 RPfGAWnwt3wgi+d9bPuCgvNCZuwnQoA21/NJhEmgvEp6MGE4nBv904lX/lNN0FH57fXN
 14LA==
X-Gm-Message-State: APjAAAUH3IETUwWcJnk6wPli2Aq7GG5pUxBTrI6YRShIzzzQr9oFX1lI
 mO8ey1o3gdbqImrKXM1vHKY=
X-Google-Smtp-Source: APXvYqznUefm6O8r8C5nE3acqpcVTIBNzeH9cWD8ZSefTVCcgw1ph6k7qfKOGaWxsLulDxnpkF1yPA==
X-Received: by 2002:a62:174a:: with SMTP id 71mr28097382pfx.140.1567306406309; 
 Sat, 31 Aug 2019 19:53:26 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id p10sm11453307pff.132.2019.08.31.19.53.25
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 31 Aug 2019 19:53:25 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Sat, 31 Aug 2019 19:52:48 -0700
Message-Id: <1567306391-2682-8-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1567306391-2682-1-git-send-email-bmeng.cn@gmail.com>
References: <1567306391-2682-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-riscv] [PATCH v7 07/30] riscv: roms: Remove executable
 attribute of opensbi images
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
X-List-Received-Date: Sun, 01 Sep 2019 02:53:35 -0000

Like other binary files, the executable attribute of opensbi images
should not be set.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4:
- new patch to remove executable attribute of opensbi images

Changes in v3: None
Changes in v2: None

 pc-bios/opensbi-riscv32-virt-fw_jump.bin     | Bin
 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin | Bin
 pc-bios/opensbi-riscv64-virt-fw_jump.bin     | Bin
 3 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 pc-bios/opensbi-riscv32-virt-fw_jump.bin
 mode change 100755 => 100644 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
 mode change 100755 => 100644 pc-bios/opensbi-riscv64-virt-fw_jump.bin

diff --git a/pc-bios/opensbi-riscv32-virt-fw_jump.bin b/pc-bios/opensbi-riscv32-virt-fw_jump.bin
old mode 100755
new mode 100644
diff --git a/pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin b/pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
old mode 100755
new mode 100644
diff --git a/pc-bios/opensbi-riscv64-virt-fw_jump.bin b/pc-bios/opensbi-riscv64-virt-fw_jump.bin
old mode 100755
new mode 100644
-- 
2.7.4


