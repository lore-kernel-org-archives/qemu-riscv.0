Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyAkR-0003O8-H9
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 06:50:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkP-0003Ld-UB
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:50:30 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkO-0004ow-4I
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 06:50:29 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso1077000wmo.1
 for <qemu-riscv@nongnu.org>; Thu, 24 Nov 2022 03:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uuMgKH+3fxzrMAWB3ctjGbRmQ7Bt4fbv5IUickRCrxw=;
 b=BB++zy2w2VqVmaabat7qSgdOI39bEbIx2kWIePXP9cbOvAK78MkkVm37XABBRDF6vj
 OlnCYQSEZdLO+0VuQC7+xUROY7KKpgFOGeOGVNmtK6UxwIBZq3IhG5gXuyWbf5SgU5Gd
 XILAJCgVg/gvSYIsFIJLdv14B09nFXPwggKzNrIKydYwgKGzH1smiC9RkU7a4U9g+dVX
 49NPsBI8YnCzPks1UZYValv86KPn3BpIJyjNaDFktuJUOt095g9T3jBXW/0u7hHp1QiG
 jeqS1depmZ2B4vqCVUhDn/yhH7wvU1v55tpESvXyMeg22hFtDK6z/d273H4rJp27MFbo
 KAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uuMgKH+3fxzrMAWB3ctjGbRmQ7Bt4fbv5IUickRCrxw=;
 b=3u+WrmAC8QaK5drV+FIe0zCM5h5cNd20dHxxQpdYGwsNVO9ILgadk8dPgGfOwx0Xpn
 s4wZVopf/5/PAMZOKujSJ4WAJSI/lazgDnCTG+I9LH/MLj434Utq5xVs0yTi+bb0KV1L
 LThkI918JF6hUcRuTwqhr5g8NO2CEkub08b1kzXLRc9fTuB4DVfRXpQ/JSI4lGlylpPP
 mX4bKF4DhzHMCrNOXzW0fuGY8f20OVo6FGNekRJYp72TnXUKyF5N/L2rIxqgwlQXl9DZ
 4IndJdpQ9wLklqC2zFUukY60AdKy52we24nGmQOs3fBfkNam/GE/5tEg+POPwKey0W7j
 rhTw==
X-Gm-Message-State: ANoB5plJA5tceOIaCrb7dfg4gDNWj582uKfh6v0OxUDmDmbAdCXf/R6K
 XrcIIy9/x8jiM57Ecl0xrxdlsw==
X-Google-Smtp-Source: AA0mqf53mW7KIw+TvwqPtV751NhcTPCKzg2AFJ7rrnusUE35k6ONGPXSVcwPd39PHp/aTQcv9KznTg==
X-Received: by 2002:a05:600c:35c8:b0:3cf:cf89:2f02 with SMTP id
 r8-20020a05600c35c800b003cfcf892f02mr12691218wmq.2.1669290626201; 
 Thu, 24 Nov 2022 03:50:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH for-8.0 00/19] Convert most CPU classes to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:03 +0000
Message-Id: <20221124115023.2437291-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Nov 2022 11:50:30 -0000

This patchset converts the TYPE_CPU base class and most subclasses
to use 3-phase reset. (The exception is s390, which is doing
something a bit odd with its reset, so the conversion there isn't
going to be simple like these others. So I'll do that one
separately.)

The rationale here is that we should be able to get rid of
all the remaining uses of device_class_set_parent_reset()
and remove/simplify some of the transitional code that's
currently bridging between "legacy" reset and 3-phase reset.

NB: even with this series, it's not possible to usefully do
anything requiring 3-phase reset of a CPU yet, because all
CPU objects get ad-hoc reset by some code somewhere doing
a cpu_reset() call on them, which will just do all 3 phases
in order. I would like to try to address that eventually,
but it's not trivial.

thanks
-- PMM

Peter Maydell (19):
  hw/core/cpu-common: Convert TYPE_CPU class to 3-phase reset
  target/arm: Convert to 3-phase reset
  target/avr: Convert to 3-phase reset
  target/cris: Convert to 3-phase reset
  target/hexagon: Convert to 3-phase reset
  target/i386: Convert to 3-phase reset
  target/loongarch: Convert to 3-phase reset
  target/m68k: Convert to 3-phase reset
  target/microblaze: Convert to 3-phase reset
  target/mips: Convert to 3-phase reset
  target/nios2: Convert to 3-phase reset
  target/openrisc: Convert to 3-phase reset
  target/ppc: Convert to 3-phase reset
  target/riscv: Convert to 3-phase reset
  target/rx: Convert to 3-phase reset
  target/sh4: Convert to 3-phase reset
  target/sparc: Convert to 3-phase reset
  target/tricore: Convert to 3-phase reset
  target/xtensa: Convert to 3-phase reset

 target/arm/cpu-qom.h        |  4 ++--
 target/avr/cpu-qom.h        |  4 ++--
 target/cris/cpu-qom.h       |  4 ++--
 target/hexagon/cpu.h        |  2 +-
 target/i386/cpu-qom.h       |  4 ++--
 target/loongarch/cpu.h      |  4 ++--
 target/m68k/cpu-qom.h       |  4 ++--
 target/microblaze/cpu-qom.h |  4 ++--
 target/mips/cpu-qom.h       |  4 ++--
 target/nios2/cpu.h          |  4 ++--
 target/openrisc/cpu.h       |  4 ++--
 target/ppc/cpu-qom.h        |  4 ++--
 target/riscv/cpu.h          |  4 ++--
 target/rx/cpu-qom.h         |  4 ++--
 target/sh4/cpu-qom.h        |  4 ++--
 target/sparc/cpu-qom.h      |  4 ++--
 target/tricore/cpu-qom.h    |  2 +-
 target/xtensa/cpu-qom.h     |  4 ++--
 hw/core/cpu-common.c        |  7 ++++---
 target/arm/cpu.c            | 13 +++++++++----
 target/avr/cpu.c            | 13 +++++++++----
 target/cris/cpu.c           | 12 ++++++++----
 target/hexagon/cpu.c        | 12 ++++++++----
 target/i386/cpu.c           | 12 ++++++++----
 target/loongarch/cpu.c      | 12 ++++++++----
 target/m68k/cpu.c           | 12 ++++++++----
 target/microblaze/cpu.c     | 12 ++++++++----
 target/mips/cpu.c           | 12 ++++++++----
 target/nios2/cpu.c          | 12 ++++++++----
 target/openrisc/cpu.c       | 12 ++++++++----
 target/ppc/cpu_init.c       | 12 ++++++++----
 target/riscv/cpu.c          | 12 ++++++++----
 target/rx/cpu.c             | 13 ++++++++-----
 target/sh4/cpu.c            | 12 ++++++++----
 target/sparc/cpu.c          | 12 ++++++++----
 target/tricore/cpu.c        | 12 ++++++++----
 target/xtensa/cpu.c         | 12 ++++++++----
 37 files changed, 184 insertions(+), 110 deletions(-)

-- 
2.25.1


