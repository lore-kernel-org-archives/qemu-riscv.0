Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbrLo-0004ME-SA
	for mharc-qemu-riscv@gnu.org; Thu, 21 May 2020 15:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrLm-0004Ij-Uf
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 15:59:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32893
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrLg-0008H7-WD
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 15:59:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590091163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=guRcykgqBUf/uuxJ52t2kwsJO8KdY5hMp8f0NDASSU0=;
 b=QtdiZID7766kibU6lUOXH9rhJs/d2RbJkY1h7nTIv33r5UrG8b8I6L7Ztrh6XUHXq4t/5M
 X9X8JfGeQRHdN6UKeX5LC5i0D3yEpX3HlAqm+hw2huCh8lztfisnmbntR7JXr2sSVrjGPW
 iSA5p0Zec9+LGbw1DG0nwsR/0ROdNOQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-fhPtDsiFOuGzLrgaaGSDoA-1; Thu, 21 May 2020 15:59:16 -0400
X-MC-Unique: fhPtDsiFOuGzLrgaaGSDoA-1
Received: by mail-wr1-f69.google.com with SMTP id e1so869580wrm.3
 for <qemu-riscv@nongnu.org>; Thu, 21 May 2020 12:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=guRcykgqBUf/uuxJ52t2kwsJO8KdY5hMp8f0NDASSU0=;
 b=X6Zj8loVM3BK26CsbkcsdYw/oTbV4jM01aATN/0NNCW6UAjyXKAtJQSU0SU5BelCXH
 VmKspt8R5iCMwW7WU7IgHBXL8iPkDtd+t3+OJrZqryxRL8EzNBpZtZ/HirL6iHgDy8zt
 NZTwqo1+B49PrPjEkRp0ZUYdRt3hT83eFOeoeN8ECA9Qh+zTy2SRgnepU89w4Lnlhj9s
 218h625T/2xwpmqt2rAC3B5cSjtmyh3/Wj52/EVcTOay9MdQgIrOE1PRm+8ebg2rA9zn
 4ejqvWRMNdZMZeftXlYwerkgsy3yJ6SdyzUzqEFX+A4d073PDqJ1BVQu1josKIbSU938
 qPZQ==
X-Gm-Message-State: AOAM532rZ9+gFLje0mmmZDRERxB9lZW224Sg4JxdlFrT5ae6Clb+AA7T
 cGIRjRqc6gl18BDs5ncaIgLPnq6vtoRLmPYmRSq3ATIm/TI+Xq2p0yVIRH1maZZCpK/wzJnAmHa
 Fu3Api1wk7zBiUE0=
X-Received: by 2002:adf:8041:: with SMTP id 59mr215563wrk.278.1590091155007;
 Thu, 21 May 2020 12:59:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzc3hVTKc/Qtox4biKZbXuH5ZWECFJX98tmcBQ+e5NAjkjfbKYU2ze4WONqRKcqmiBIpmU7lA==
X-Received: by 2002:adf:8041:: with SMTP id 59mr215534wrk.278.1590091154541;
 Thu, 21 May 2020 12:59:14 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id e21sm7338181wme.34.2020.05.21.12.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 12:59:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Michael Walle <michael@walle.cc>, Marek Vasut <marex@denx.de>,
 qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 00/11] accel: Allow targets to use Kconfig,
 disable semihosting by default
Date: Thu, 21 May 2020 21:59:00 +0200
Message-Id: <20200521195911.19685-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 01:44:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 21 May 2020 19:59:31 -0000

Missing review: patch #9 'rules.mak: Add base-arch rule'
and patch #11 'semihosting: Make the feature depend of TCG'

This series include generic patches I took of the KVM/ARM
specific series which will follow.

- List orphan accelerators in MAINTAINERS
- Add accel/Kconfig
- Allow targets to use their how Kconfig
- Enforce semihosting on architecture where required,
  disable it elsewhere

Since v2:
- Addressed Thomas review comments
- Fixed problem when including TARGET instead of BASE_TARGET

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

$ git backport-diff -u v2 -r v3
Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/11:[----] [--] 'MAINTAINERS: Fix KVM path expansion glob'
002/11:[0002] [FC] 'MAINTAINERS: Add an 'overall' entry for accelerators'
003/11:[----] [-C] 'MAINTAINERS: Add an entry for the HAX accelerator'
004/11:[----] [--] 'accel/tcg: Add stub for probe_access()'
005/11:[----] [--] 'Makefile: Remove dangerous EOL trailing backslash'
006/11:[----] [--] 'Makefile: Write MINIKCONF variables as one entry per line'
007/11:[----] [--] 'accel/Kconfig: Extract accel selectors into their own config'
008/11:[----] [--] 'accel/Kconfig: Add the TCG selector'
009/11:[down] 'rules.mak: Add base-arch() rule'
010/11:[0002] [FC] 'Makefile: Allow target-specific optional Kconfig'
011/11:[0014] [FC] 'hw/semihosting: Make the feature depend of TCG, and allow to disable it'

Philippe Mathieu-Daudé (11):
  MAINTAINERS: Fix KVM path expansion glob
  MAINTAINERS: Add an 'overall' entry for accelerators
  MAINTAINERS: Add an entry for the HAX accelerator
  accel/tcg: Add stub for probe_access()
  Makefile: Remove dangerous EOL trailing backslash
  Makefile: Write MINIKCONF variables as one entry per line
  accel/Kconfig: Extract accel selectors into their own config
  accel/Kconfig: Add the TCG selector
  rules.mak: Add base-arch() rule
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
 rules.mak                               | 16 ++++++++++++++++
 accel/stubs/tcg-stub.c                  |  7 +++++++
 Kconfig.host                            |  7 -------
 MAINTAINERS                             | 19 ++++++++++++++++++-
 accel/Kconfig                           |  9 +++++++++
 hw/semihosting/Kconfig                  |  4 +++-
 target/arm/Kconfig                      |  2 ++
 target/lm32/Kconfig                     |  2 ++
 target/m68k/Kconfig                     |  2 ++
 target/mips/Kconfig                     |  2 ++
 target/nios2/Kconfig                    |  2 ++
 target/riscv/Kconfig                    |  2 ++
 target/xtensa/Kconfig                   |  2 ++
 20 files changed, 78 insertions(+), 25 deletions(-)
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


