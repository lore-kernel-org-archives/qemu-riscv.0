Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jE3Ua-00089V-79
	for mharc-qemu-riscv@gnu.org; Tue, 17 Mar 2020 00:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45404)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1jE3UX-00087c-Bv
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 00:06:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1jE3UV-00029R-37
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 00:06:08 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38693)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1jE3UU-0001zC-O1
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 00:06:06 -0400
Received: by mail-pg1-x536.google.com with SMTP id x7so10972902pgh.5
 for <qemu-riscv@nongnu.org>; Mon, 16 Mar 2020 21:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=iNBqy/EyGYwQ63RRDbQPMjqB6icieu8FIzbCkicjV2c=;
 b=LHF/9M3V35NDN33t2dJlKN+4XJNsJBwuofv/9JOiPoQAAZgdD7tCc44RM/+Osu1Rc9
 A9yOtIJRV2gqQLWWVdmkEdJVdJU/noxzE4iuTp03mRVjsmfgbO+9b0v5HSuAeHyWAdxe
 8l5L4+FJUKUoQJc5LfLlvpuXQR3M4NGS0K21i1GW+UiyH/3OVMSGfADu/LuChAQYKnT8
 eQnvWS6r+lp+qKfEsBrsleE2CbonzEueYlHR9xq9fUBDEyg8AOAo4Fw/x9iaOPRgC/gU
 VJbIxLLQ+D2kS3/fcCKsj6vMNjBbLCyQKA6LSMUU7K+ypiNvvi02G4JvA1sX6BBuNXHG
 FVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=iNBqy/EyGYwQ63RRDbQPMjqB6icieu8FIzbCkicjV2c=;
 b=OK3BMVPucrxCTxZPPC3ERisDTnyJiwbrAsV6oedX7ZKyJOOviJMK3baUdQqwr1kwYG
 99S6dAJfqkuw8Q/SFaJwJb8yM68nq86vNQloCd0IbGrgqTjol3AbH2ZZPXUIZhEnPtsW
 Rdqa8foPgYvJe3iEKoz2ghkF4gZAeyAc8FUInrR0Mu+nK6qmgSQL20Vf7DmR2oUctPko
 X4ihj7NpQlWNjw9JIdwjHrFAlSuxqRU5O/HBYS83gL+z8qHC+Bm3jaTNKh1kT6ws7yyl
 LpXw54rr3NiGOxOsTydezVBEiNbj7klim7xgOBpmuskaOu9lyfK86OTqmThjEq8ylBcl
 T7YA==
X-Gm-Message-State: ANhLgQ3DEMnOZfciFSbSrYB3ordixkr6t6D+ANKwIR/goEPMLyJRqzUn
 JSs2fASjXqNKu+qQ68AYkYGYg0tY6ZhOMg==
X-Google-Smtp-Source: ADFU+vu4KijjLwxveeTDD/6FM+mzdNt3hMowVffwXj0NpXu0qmYVmSpKZuJWn4gXGUoXt+B+HNV7tQ==
X-Received: by 2002:a63:28c:: with SMTP id 134mr3009660pgc.165.1584417961985; 
 Mon, 16 Mar 2020 21:06:01 -0700 (PDT)
Received: from localhost (c-67-161-15-180.hsd1.ca.comcast.net. [67.161.15.180])
 by smtp.gmail.com with ESMTPSA id 26sm849506pgs.85.2020.03.16.21.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 21:06:01 -0700 (PDT)
Subject: [PULL] RISC-V Patches for the 5.0 Soft Freeze, Part 5
Date: Mon, 16 Mar 2020 21:05:41 -0700
Message-Id: <20200317040547.222501-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::536
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
X-List-Received-Date: Tue, 17 Mar 2020 04:06:10 -0000

The following changes since commit a98135f727595382e200d04c2996e868b7925a01:

  Merge remote-tracking branch 'remotes/kraxel/tags/vga-20200316-pull-request' into staging (2020-03-16 14:55:59 +0000)

are available in the Git repository at:

  git@github.com:palmer-dabbelt/qemu.git tags/riscv-for-master-5.0-sf5

for you to fetch changes up to c5969a3a3c2cb9ea02ffb7e86acb059d3cf8c264:

  target/riscv: Fix VS mode interrupts forwarding. (2020-03-16 17:03:51 -0700)

----------------------------------------------------------------
RISC-V Patches for the 5.0 Soft Freeze, Part 5

This tag contains the last of the patches I'd like to target for the 5.0 soft
freeze.  At this point we're mostly collecting fixes, but there are a few new
features.  The changes include:

* An OpenSBI update, including the various bits necessary to put CI together
  and an image for the 32-bit sifive_u board.
* A fix that disallows TSR when outside of machine mode.
* A fix for VS-mode interrupt forwarding.

----------------------------------------------------------------
Alistair Francis (1):
      target/riscv: Correctly implement TSR trap

Bin Meng (4):
      roms: opensbi: Upgrade from v0.5 to v0.6
      roms: opensbi: Add 32-bit firmware image for sifive_u machine
      riscv: sifive_u: Update BIOS_FILENAME for 32-bit
      gitlab-ci.yml: Add jobs to build OpenSBI firmware binaries

Rajnesh Kanwal (1):
      target/riscv: Fix VS mode interrupts forwarding.

 .gitlab-ci-opensbi.yml                       |  63 +++++++++++++++++++++++++++
 .gitlab-ci.d/opensbi/Dockerfile              |  33 ++++++++++++++
 .gitlab-ci.yml                               |   1 +
 Makefile                                     |   2 +-
 hw/riscv/sifive_u.c                          |   6 ++-
 pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin | Bin 0 -> 49472 bytes
 pc-bios/opensbi-riscv32-virt-fw_jump.bin     | Bin 40984 -> 41280 bytes
 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin | Bin 49160 -> 53760 bytes
 pc-bios/opensbi-riscv64-virt-fw_jump.bin     | Bin 45064 -> 49664 bytes
 roms/Makefile                                |   7 +++
 roms/opensbi                                 |   2 +-
 target/riscv/cpu_helper.c                    |   9 +++-
 target/riscv/op_helper.c                     |   2 +-
 13 files changed, 120 insertions(+), 5 deletions(-)
 create mode 100644 .gitlab-ci-opensbi.yml
 create mode 100644 .gitlab-ci.d/opensbi/Dockerfile
 create mode 100644 pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin


