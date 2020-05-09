Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jXPEH-0003aI-BM
	for mharc-qemu-riscv@gnu.org; Sat, 09 May 2020 09:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jXPEF-0003Z9-KL; Sat, 09 May 2020 09:09:19 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jXPEE-0002qc-NB; Sat, 09 May 2020 09:09:19 -0400
Received: by mail-wm1-x344.google.com with SMTP id u127so13582294wmg.1;
 Sat, 09 May 2020 06:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iE1+mJklc9qKRY36HjqMYuwaM8rzjkNP3yQiEBI2qQE=;
 b=Gfp9lMbRlEqlUHuwAcIsNoFH99uSEOdkZZhVlXMQ7cyBLO1xcqqhkPG1yDHH82cj3i
 QYYh2RjNRr0wzlukYDiCw8B1S77cQQYGby3dna5vxspS+rXNGxHMzme+dtjlteb3F2WQ
 kckjhnnHULfUeGJMtBSWqTyrLYh/UcxdwT7+MFsTHUrh0Fz0OVujeNPZib/OIvuLpEDE
 IVwy7MuAjCAbEYfUfUMJHCxXpNAKEfOd8GL6nL+396vTBmPyr4uxBpp0KB34h7owFKNe
 DtbaRAp67mLJYmQay+4r6DKx6KNXJKYJz6suluGN5ZmDT9abA6HAtwjxjgLonrCHy9Z0
 Ok0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=iE1+mJklc9qKRY36HjqMYuwaM8rzjkNP3yQiEBI2qQE=;
 b=K17CqlDD0zCK+v4z4TuqvXiQY228i8jdfkcW7FOy9kkzsjfOI9y+jbgwJLHyy1XrNt
 GEVUN8eHQi6xNtwAZXLkG9i6+fnmuy6si/7TpXliBXIX+VQ7rGiQGOBL5H/tNSezVgEE
 YvS54/SqKUDSgGvaaw2ZkVf1C+dL492xz/3WQAN7e9SX3Dlum1zh8V0uupTNxgPTu9PH
 F02DxHRE9W6oJWd6LRKHkaEp8s6R+o19uy7qtOwBAvkIIY5edM86pTKDOHqDpR05U0kf
 sg5EBQUpML7VKRj1HqaJqMOnQRr1J1puiSPeRTFMohJ3ePw5Ebd8AROaT1IzPACA82Ry
 Ucmw==
X-Gm-Message-State: AGi0PuZ+tD/V5hhMSP2hIZ1UK/dHmdXmhg9JKtL3HyvsLzErg8fGdQij
 1BuLlBBbjCtrZ068ITpq+zBwMA2IMV8=
X-Google-Smtp-Source: APiQypIxSoJQrCineHduqmVzQFO86f/7GWszhtwChBJzs41MjCoAXBeO4O9AtUOwuPvrK3uUqfQyaA==
X-Received: by 2002:a7b:ce0b:: with SMTP id m11mr21875192wmc.67.1589029755117; 
 Sat, 09 May 2020 06:09:15 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id m65sm1411410wmm.17.2020.05.09.06.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 06:09:14 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Marek Vasut <marex@denx.de>, Alistair Francis <Alistair.Francis@wdc.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 00/11] exec/cpu: Poison 'hwaddr' type in user-mode emulation
Date: Sat,  9 May 2020 15:08:59 +0200
Message-Id: <20200509130910.26335-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Sat, 09 May 2020 13:09:20 -0000

The 'hwaddr' type declared in "exec/hwaddr.h" is meant for
system-mode emulation only. Poison it in user-mode code.

Philippe Mathieu-Daudé (11):
  plugins: Restrict functions handling hwaddr to system-mode
  sysemu/accel: Restrict machine methods to system-mode
  sysemu/tcg: Only declare tcg_allowed when TCG is available
  sysemu/hvf: Only declare hvf_allowed when HVF is available
  target/ppc: Restrict PPCVirtualHypervisorClass to system-mode
  target/s390x: Only compile decode_basedisp() on system-mode
  target/s390x/helper: Clean ifdef'ry
  target/s390x: Restrict system-mode declarations
  target/cpu: Restrict handlers using hwaddr type to system-mode
  exec: Use 'cpu-common.h' instead of system-mode specific 'hwaddr.h'
  exec/cpu-common: Poison hwaddr type in user-mode emulation

 include/disas/disas.h           |  2 +-
 include/exec/cpu-common.h       |  8 ++++++--
 include/hw/core/cpu.h           | 10 ++++++----
 include/qemu/qemu-plugin.h      |  2 ++
 include/sysemu/accel.h          |  4 +++-
 include/sysemu/hvf.h            |  6 +++---
 include/sysemu/tcg.h            |  2 +-
 target/alpha/cpu.h              |  4 +++-
 target/arm/cpu.h                |  6 +++---
 target/arm/internals.h          |  4 ++++
 target/cris/cpu.h               |  2 ++
 target/hppa/cpu.h               |  2 +-
 target/i386/cpu.h               |  2 ++
 target/m68k/cpu.h               |  7 ++++++-
 target/microblaze/cpu.h         |  5 ++++-
 target/mips/internal.h          |  2 +-
 target/nios2/cpu.h              |  5 ++++-
 target/openrisc/cpu.h           |  3 ++-
 target/ppc/cpu.h                |  6 +++---
 target/ppc/kvm_ppc.h            | 22 +++++++++++-----------
 target/riscv/cpu.h              | 20 ++++++++++----------
 target/s390x/internal.h         | 15 ++++++++++-----
 target/sh4/cpu.h                |  2 +-
 target/sparc/cpu.h              |  2 ++
 target/xtensa/cpu.h             | 12 +++++++-----
 plugins/api.c                   | 17 ++---------------
 target/hppa/cpu.c               |  4 +++-
 target/ppc/translate_init.inc.c |  6 +++++-
 target/s390x/helper.c           |  7 ++-----
 29 files changed, 110 insertions(+), 79 deletions(-)

-- 
2.21.3


