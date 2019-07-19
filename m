Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hoIAl-00008C-8q
	for mharc-qemu-riscv@gnu.org; Thu, 18 Jul 2019 21:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60584)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hoIAi-00005t-S7
 for qemu-riscv@nongnu.org; Thu, 18 Jul 2019 21:58:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hoIAh-00044H-Ob
 for qemu-riscv@nongnu.org; Thu, 18 Jul 2019 21:58:56 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45704)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hoIAh-00043l-H8
 for qemu-riscv@nongnu.org; Thu, 18 Jul 2019 21:58:55 -0400
Received: by mail-pf1-f193.google.com with SMTP id r1so13429934pfq.12
 for <qemu-riscv@nongnu.org>; Thu, 18 Jul 2019 18:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=hSbI1JsNs5NsFvsTzbpntiaxfpkHeY0oROh+yL6YZmE=;
 b=guo5+9YeyxXr+88LF2V7V5eyA/0TOQ22RAI0OP0o64IyYor9DW5sqpi95NUE2E8hwD
 4p8tQsFo8CmpU2sVOsX63kp3aci13x+ypf2KlHOoOs2U5ivVkayeq+TILD69lxlW+Tsk
 oE1NZxp+8zWP+xDNy4+9hZm2NLoPCMwAFGzZUEc1S/+fWEXiRg2gazOOIUuNFwwB7vHB
 SKlJiYtyFl+nSPrV6S6Wq8tUgb/4T5ddwz3pCve9ZAmahdQwhCtZ9ZgAlLiw2Sxcam3v
 qviZsfd4a0zKWpJ87IptKER4Nl3m4RBxrflAQvGQxxgwD36IzUWZppckOg9UeClrk9Cu
 A/bg==
X-Gm-Message-State: APjAAAV6k6zrVMd8uxTWKTb/YowcOSmkQh1UFAmc+1rOZb4vn68fOOgK
 f70H0Gs/Pc2ckPrs0q384gs=
X-Google-Smtp-Source: APXvYqwQMbGGuJxUyLagjKnmxuLWjErGDolexIX7ttEdQrb8fj6Q3nn0Yill1ZWO0KWOk1rQ2MRaOg==
X-Received: by 2002:a63:7d05:: with SMTP id y5mr51652547pgc.425.1563501533434; 
 Thu, 18 Jul 2019 18:58:53 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id s6sm44244879pfs.122.2019.07.18.18.58.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 18:58:53 -0700 (PDT)
Date: Thu, 18 Jul 2019 18:58:09 -0700
Message-Id: <20190719015811.14776-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.193
Subject: [Qemu-riscv] [PULL] RISC-V Patches for 4.2-rc2
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
X-List-Received-Date: Fri, 19 Jul 2019 01:58:57 -0000

The following changes since commit 0b18cfb8f1828c905139b54c8644b0d8f4aad879:

  Update version for v4.1.0-rc1 release (2019-07-16 18:01:28 +0100)

are available in the Git repository at:

  git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.1-rc2

for you to fetch changes up to fdd1bda4b47cfbec61d0e63a516c614feea0b00b:

  hw/riscv: Load OpenSBI as the default firmware (2019-07-18 14:18:45 -0700)

----------------------------------------------------------------
RISC-V Patches for 4.2-rc2

This contains a pair of patches that add OpenSBI support to QEMU on
RISC-V targets.  The patches have been floating around for a bit, but
everything seems solid now.  These pass my standard test of booting
OpenEmbedded, and also works when I swap around the various command-line
arguments to use the new boot method.

----------------------------------------------------------------
Alistair Francis (2):
      roms: Add OpenSBI version 0.4
      hw/riscv: Load OpenSBI as the default firmware

 .gitmodules                                  |   3 ++
 LICENSE                                      |  21 +++++++----
 Makefile                                     |   5 ++-
 hw/riscv/boot.c                              |  54 +++++++++++++++++++++++++++
 hw/riscv/sifive_u.c                          |   7 ++--
 hw/riscv/virt.c                              |  11 ++++--
 include/hw/riscv/boot.h                      |   3 ++
 pc-bios/README                               |  11 ++++++
 pc-bios/opensbi-riscv32-virt-fw_jump.bin     | Bin 0 -> 36888 bytes
 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin | Bin 0 -> 40968 bytes
 pc-bios/opensbi-riscv64-virt-fw_jump.bin     | Bin 0 -> 40968 bytes
 qemu-deprecated.texi                         |  20 ++++++++++
 roms/Makefile                                |  48 ++++++++++++++++++------
 roms/opensbi                                 |   1 +
 14 files changed, 157 insertions(+), 27 deletions(-)
 create mode 100755 pc-bios/opensbi-riscv32-virt-fw_jump.bin
 create mode 100755 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
 create mode 100755 pc-bios/opensbi-riscv64-virt-fw_jump.bin
 create mode 160000 roms/opensbi
From Palmer Dabbelt <palmer@sifive.com> # This line is ignored.
From: Palmer Dabbelt <palmer@sifive.com>
Reply-To: 
Subject: 
In-Reply-To: 



