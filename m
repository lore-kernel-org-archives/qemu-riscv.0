Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iu39I-0001eK-Np
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jan 2020 18:41:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58796)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1iu39F-0001de-Oq
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 18:41:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1iu39D-0004pV-Dj
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 18:41:29 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:41182)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1iu39D-0004nk-54
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 18:41:27 -0500
Received: by mail-pg1-x52d.google.com with SMTP id x8so2374846pgk.8
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2020 15:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=l8zeeHKnAmjl/9UeIFXH4k1lG1fkY11IGAeo43g+xvU=;
 b=VBzSHgiFsSbLVaiwVPP+GhxosWfqeaOKrSrhLCxRlqQFs/VCkLrYKI8w1QO+opsUHZ
 aNe7TgSS74xARjz7k/lZ49JpNEJJ3NAfvktIvEYr6PICKoTEyVDk9B9+aoY8QgU83hQX
 lzyqquPBTtOSY2lQQexPx7wPw4tSkWKIjaG2qDg5doWOFRHLlYfwf7uEL7NKzn9dSBUf
 aXwsfvl5i47VVr5MOlF59m4lUjEI+a5/Lc6VOY6mUFWLete3kaGJN84CS2IakkVkiAeF
 4CguSDoVu82xuXstFZkobsckGCYbsA3ssWVgs8mIcPDIqC4Zvu1PUnackd3J2mKbPIEw
 mcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=l8zeeHKnAmjl/9UeIFXH4k1lG1fkY11IGAeo43g+xvU=;
 b=Rbogh7lB2tuC/cSnSQJQFVvJEY+AVR9GfCKBfRvIDe7oL+PD3wFPFg/apSk8uXUZ5N
 IZS0HfXK0s8+l7A++SrTqAOlAVR9mfB0D5k/cXdl15efXXfz/GtW/0VZs16OkqLF9PqG
 lYrYt1nTSNG7XlOajp6lLGslPOvqQIFizT0Y5nnvf/1v/XMPBdR/hcG/ao2oosgKzRA+
 6owDcj/syKhHf/S4DwCGm0lSDEmFjK1iZdygsTCNcp/QBMTSzKMZSA/eN35YeQqxGwb/
 vMm3yMGJIsGaM3lF7palmcTw6bs4r+o81zQHTdwUxY5AYCBMxH9hs1nWDWawDwS4Nu5Z
 3IkQ==
X-Gm-Message-State: APjAAAVQ3WEJmtrLrjL/mFVPm2+V2gg4AgAfX9kG8A0AZEnTTME8Anwy
 4ogE4juZoU5Ff+mYMY1pUja2tg==
X-Google-Smtp-Source: APXvYqz0FMQ6LkO586ry0H/ATGwznPi3vu9JI85siGF2NwLc/nOU/1JCKDvV0epFbsPUXXHECwmWoA==
X-Received: by 2002:a62:e511:: with SMTP id n17mr6776464pff.187.1579650083283; 
 Tue, 21 Jan 2020 15:41:23 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id 13sm44327657pfi.78.2020.01.21.15.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 15:41:22 -0800 (PST)
Subject: [PULL] RISC-V Patches for the 5.0 Soft Freeze, Part 1
Date: Tue, 21 Jan 2020 14:56:57 -0800
Message-Id: <20200121225703.148465-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52d
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
X-List-Received-Date: Tue, 21 Jan 2020 23:41:31 -0000

The following changes since commit 28b58f19d269633b3d14b6aebf1e92b3cd3ab56e:

  ui/gtk: Get display refresh rate with GDK version 3.22 or later (2020-01-16 14:03:45 +0000)

are available in the Git repository at:

  git@github.com:palmer-dabbelt/qemu.git tags/riscv-for-master-5.0-sf1

for you to fetch changes up to 82f014671cf057de51c4a577c9e2ad637dcec6f9:

  target/riscv: update mstatus.SD when FS is set dirty (2020-01-16 10:03:15 -0800)

----------------------------------------------------------------
RISC-V Patches for the 5.0 Soft Freeze, Part 1

This patch set contains a handful of collected fixes that I'd like to target
for the 5.0 soft freeze (I know that's a long way away, I just don't know what
else to call these):

* A fix for a memory leak initializing the sifive_u board.
* Fixes to privilege mode emulation related to interrupts and fstatus.

Notably absent is the H extension implementation.  That's pretty much reviewed,
but not quite ready to go yet and I didn't want to hold back these important
fixes.  This boots 32-bit and 64-bit Linux (buildroot this time, just for fun)
and passes "make check".

----------------------------------------------------------------
Pan Nengyuan (1):
      riscv/sifive_u: fix a memory leak in soc_realize()

ShihPo Hung (3):
      target/riscv: Fix tb->flags FS status
      target/riscv: fsd/fsw doesn't dirty FP state
      target/riscv: update mstatus.SD when FS is set dirty

Yiting Wang (1):
      riscv: Set xPIE to 1 after xRET

 hw/riscv/sifive_u.c                     | 1 +
 target/riscv/cpu.h                      | 5 +----
 target/riscv/csr.c                      | 3 +--
 target/riscv/insn_trans/trans_rvd.inc.c | 1 -
 target/riscv/insn_trans/trans_rvf.inc.c | 1 -
 target/riscv/op_helper.c                | 4 ++--
 target/riscv/translate.c                | 2 +-
 7 files changed, 6 insertions(+), 11 deletions(-)


