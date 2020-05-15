Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jZdoq-0007C2-Cp
	for mharc-qemu-riscv@gnu.org; Fri, 15 May 2020 13:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdoo-0007AA-Cf
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:08:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22606
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdom-0002se-P3
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589562495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=26OkB+i/ad5joz/5qpHRwJv+k150oIYD4QiuOyitRcA=;
 b=E58pYU58QKzIjktgFcJcgcuRHByJ3jh53jQs6ZoUwUNW97BoOtF7BleLugEX6/vxsSyF7K
 LB3NIW4VshK2gif0AZGsqCxwTZNPXgK4TM/f1p5hXFdIk7jC8p3TC3xFmvL2xbjDbKfVSg
 69oCMZjpv1tjW3oOKsYC9AMX15zNLD4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-bJCxMX2XPQe5ddfiuOLOzw-1; Fri, 15 May 2020 13:08:08 -0400
X-MC-Unique: bJCxMX2XPQe5ddfiuOLOzw-1
Received: by mail-wr1-f72.google.com with SMTP id i9so1496316wrx.0
 for <qemu-riscv@nongnu.org>; Fri, 15 May 2020 10:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=26OkB+i/ad5joz/5qpHRwJv+k150oIYD4QiuOyitRcA=;
 b=NYvLTFd/Y6P1l/a/y2et/pnR02IIXoy+BPhPzz0cDTF4wqRj2c8QLoZt4ygOukJRIG
 XdR2PJdScGFkGEgul669Gj7XoOuwrSAZrj9MlOK9hmwmYJuvAWSWhyX2laZjA/1UsLT9
 F6AZ0jELqZaS65BGqGC7mvPCbpAbe7fPK+B4MOslftNaKpu32/k9chDTgqZ/IWf1cf7W
 HIk3LEmMyuTDUkbgQwFNL/LwPKvuFid4iQ7K0dQXJPCEiOt7esVJ8Ka7csh08/2+bk/X
 VHcQdjGHzUveubx8A4lFQ9Q2n8BnKlCX6NKbe6SwiDT89CIE8f08aRIq12sKd5CUFyT6
 dySg==
X-Gm-Message-State: AOAM531Wx/j2A4rKbS3Jpjt6D5hbzz/emTfaxwbShMCY6mghsqTOSb3M
 T4ooi4Xh7Us5Duqgj0UwpaH5sGBPHQEQDNFlqQHGkzUl9/arAJr2Th0hu187rkgm0I5NMiFWRXL
 nSFYgDUzu+xCQEBo=
X-Received: by 2002:adf:f3c5:: with SMTP id g5mr5184236wrp.163.1589562487179; 
 Fri, 15 May 2020 10:08:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmryfUMk6ADmORi3lXVAD0PX080iwYHmI+TSMJgDPYWDKRZqTqv4yQhjfdJ0nFKuALcQFsCw==
X-Received: by 2002:adf:f3c5:: with SMTP id g5mr5184202wrp.163.1589562486916; 
 Fri, 15 May 2020 10:08:06 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id g24sm4763681wrb.35.2020.05.15.10.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 10:08:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, qemu-riscv@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Marek Vasut <marex@denx.de>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 00/10] accel: Allow targets to use Kconfig,
 disable semihosting by default
Date: Fri, 15 May 2020 19:07:54 +0200
Message-Id: <20200515170804.5707-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 23:27:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Fri, 15 May 2020 17:08:18 -0000

This series include generic patches I took of the KVM/ARM
specific series which will follow.

- List orphan accelerators in MAINTAINERS
- Add accel/Kconfig
- Allow targets to use their how Kconfig
- Enforce semihosting on architecture where required,
  disable it elsewhere

Since v1:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg689024.html
- Drop HVF MAINTAINERS patch (merged elsewhere)
- Kconfig-select SEMIHOSTING (bonzini)
- Drop user-mode selection patches
- consider m68k/nios2/xtensa/riscv (pm215)
- reword Kconfig SEMIHOSTING description (pm215)
- reset some of rth R-b tags

Previous RFC for semihosting posted earlier:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg631218.html

$ git backport-diff -u v1 -r v2
Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/10:[----] [--] 'MAINTAINERS: Fix KVM path expansion glob'
002/10:[----] [-C] 'MAINTAINERS: Add an 'overall' entry for accelerators'
003/10:[----] [-C] 'MAINTAINERS: Add an entry for the HAX accelerator'
004/10:[down] 'accel/tcg: Add stub for probe_access()'
005/10:[down] 'Makefile: Remove dangerous EOL trailing backslash'
006/10:[0003] [FC] 'Makefile: Write MINIKCONF variables as one entry per line'
007/10:[----] [--] 'accel/Kconfig: Extract accel selectors into their own config'
008/10:[----] [--] 'accel/Kconfig: Add the TCG selector'
009/10:[down] 'Makefile: Allow target-specific optional Kconfig'
010/10:[0028] [FC] 'hw/semihosting: Make the feature depend of TCG, and allow to disable it'

Philippe Mathieu-Daudé (10):
  MAINTAINERS: Fix KVM path expansion glob
  MAINTAINERS: Add an 'overall' entry for accelerators
  MAINTAINERS: Add an entry for the HAX accelerator
  accel/tcg: Add stub for probe_access()
  Makefile: Remove dangerous EOL trailing backslash
  Makefile: Write MINIKCONF variables as one entry per line
  accel/Kconfig: Extract accel selectors into their own config
  accel/Kconfig: Add the TCG selector
  Makefile: Allow target-specific optional Kconfig
  hw/semihosting: Make the feature depend of TCG, and allow to disable
    it

 Makefile                                | 15 +++++++++++----
 default-configs/arm-softmmu.mak         |  1 -
 default-configs/lm32-softmmu.mak        |  2 --
 default-configs/m68k-softmmu.mak        |  2 --
 default-configs/mips-softmmu-common.mak |  3 ---
 default-configs/nios2-softmmu.mak       |  2 --
 default-configs/xtensa-softmmu.mak      |  2 --
 accel/stubs/tcg-stub.c                  |  7 +++++++
 Kconfig.host                            |  7 -------
 MAINTAINERS                             | 17 ++++++++++++++++-
 accel/Kconfig                           |  9 +++++++++
 hw/semihosting/Kconfig                  |  4 +++-
 target/arm/Kconfig                      |  2 ++
 target/lm32/Kconfig                     |  2 ++
 target/m68k/Kconfig                     |  2 ++
 target/mips/Kconfig                     |  2 ++
 target/nios2/Kconfig                    |  2 ++
 target/riscv/Kconfig                    |  2 ++
 target/xtensa/Kconfig                   |  2 ++
 19 files changed, 60 insertions(+), 25 deletions(-)
 create mode 100644 accel/Kconfig
 create mode 100644 target/arm/Kconfig
 create mode 100644 target/lm32/Kconfig
 create mode 100644 target/m68k/Kconfig
 create mode 100644 target/mips/Kconfig
 create mode 100644 target/nios2/Kconfig
 create mode 100644 target/riscv/Kconfig
 create mode 100644 target/xtensa/Kconfig

-- 
2.21.3


