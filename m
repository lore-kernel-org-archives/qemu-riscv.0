Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZWra-0005Kx-Fs
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 06:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWrY-0005JS-Gu; Thu, 22 Apr 2021 06:47:12 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWrW-0004ls-G0; Thu, 22 Apr 2021 06:47:11 -0400
Received: by mail-wr1-x436.google.com with SMTP id e7so35324455wrs.11;
 Thu, 22 Apr 2021 03:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1FjTbZWlaDzjB4XfZIavO+fcsd1k5bmh94iSflYEZMY=;
 b=bhdc2ZdzEBY5DzjdXjWMK5U82Hx9K0EbdDsxIczYzsjsbnjQC5kTumQMkfQwwGgO9d
 a6TRxCSXtMLuv8Tt2OmSS5Vf1y2PgEWVc9x1v5E4cNSMQJ1db1Dpu4Z/4nM3AUQATdtQ
 vfp8X8w8lK8fie1VawEAobhsVynY/Bpo6PhVJANR5dW3XtA5SeKc00TO+ateOGC6mXAb
 QvXw4jUi1Ajkg2gyAzfjUrc4t0/KrNmfdF1ZrA0ikDC+0EIStn1GG66usM5WrsE7gDbO
 E704WxWUnN33b4IYlAgJy8Rdi/UmP98Ospo31dDOeIfyEzQGLUoSzPD+qB6bFg5UnHI2
 Sr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=1FjTbZWlaDzjB4XfZIavO+fcsd1k5bmh94iSflYEZMY=;
 b=lnn9WKmJFBLvLAg0+Ba1S5RH9UQiG8fZHNwN8xhL1K3UUoAT8zCWrcHCuCtTb/MqxM
 18h2LHhYtXe6TfizHY4Ywxp9q6rRq7c7lM/EXQvalASA9G9Xqk/zIuNjP93EWwMIC7yj
 IzwZJlaTMwrumB4ok0Wq3xNTWFp2f6QgmQsMy1M9BL463ppfPZfJzXoBuoBwHxTz0EML
 6GJ9q13ROsIQbKxbOnwFdRsMJ33kzk6R7ZgXggttqNtIP59lUj5hpoDhY1hweCqXL8PW
 DWJg4LMhD9lb1AWRXdXjoprZsJAg9MrfZAZrhUQm3Q4RLwxZ0lJGQJS7V9laG1qFNQNO
 BLOg==
X-Gm-Message-State: AOAM532ta0Vg7QIGWHDsdiJNC/d4Aa7YUOfeijFCplVsb+umL1QYg4/Y
 EbYL7LVYOusBqMzlqsne8aBg1KpwV3iuiw==
X-Google-Smtp-Source: ABdhPJx/bcz2EwUCsmeGy7GjwBa0/XJwxRZP9WhgwewjKCV+gfJ4OyR6cchCJ+itrhrQWy2lBFZonw==
X-Received: by 2002:adf:f289:: with SMTP id k9mr3459301wro.308.1619088427317; 
 Thu, 22 Apr 2021 03:47:07 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id z15sm2841020wrv.39.2021.04.22.03.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 03:47:06 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Juan Quintela <quintela@redhat.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-riscv@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 00/15] cpu: Introduce SysemuCPUOps structure
Date: Thu, 22 Apr 2021 12:46:49 +0200
Message-Id: <20210422104705.2454166-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 22 Apr 2021 10:47:13 -0000

Missing review: patch #7=0D
=0D
Hi,=0D
=0D
This series is inspired on Claudio TCG work.=0D
=0D
Instead of separate TCG from other accelerators, here we=0D
separate sysemu operations (system VS user).=0D
=0D
Patches 1-5 are generic cleanups.=0D
Patches 6-14 move from CPUClass to SysemuCPUOps=0D
Patch   15 restricts SysemuCPUOps to sysemu=0D
=0D
Since v4:=0D
- Removed watchpoint patches (need more work) (Richard)=0D
- Merged patch 1 & 7 "Move CPUClass::vmsd to SysemuCPUOps" (Eduardo)=0D
- Reworded cpu_virtio_is_big_endian description (Greg)=0D
- Move write_elf() in target/riscv/cpu.c (rebased on top of 43a965888)=0D
- Added R-b tags=0D
=0D
Since v3:=0D
- SysemuCPUOps const (Richard)=0D
- added missing xtensa #ifdef'ry=0D
- added missing aa64/sve #ifdef'ry=0D
- added Laurent R-b=0D
=0D
Since v2:=0D
- fixed lm32/unicore32=0D
- remove USER_ONLY ifdef'ry from "cpu.h" (Claudio)=0D
=0D
Since v1:=0D
- Name 'sysemu' (Claudio)=0D
- change each field progressively (Richard)=0D
=0D
$ git backport-diff=0D
Key:=0D
[----] : patches are identical=0D
[####] : number of functional differences between upstream/downstream patch=
=0D
[down] : patch is downstream-only=0D
The flags [FC] indicate (F)unctional and (C)ontextual differences, respecti=
ve=3D=0D
ly=0D
=0D
001/15:[----] [--] 'cpu: Un-inline cpu_get_phys_page_debug and cpu_asidx_fr=
om=3D=0D
_attrs'=0D
002/15:[----] [--] 'cpu: Introduce cpu_virtio_is_big_endian()'=0D
003/15:[----] [--] 'cpu: Directly use cpu_write_elf*() fallback handlers in=
 p=3D=0D
lace'=0D
004/15:[----] [--] 'cpu: Directly use get_paging_enabled() fallback handler=
s =3D=0D
in place'=0D
005/15:[----] [--] 'cpu: Directly use get_memory_mapping() fallback handler=
s =3D=0D
in place'=0D
006/15:[----] [-C] 'cpu: Introduce SysemuCPUOps structure'=0D
007/15:[0036] [FC] 'cpu: Move CPUClass::vmsd to SysemuCPUOps'=0D
008/15:[----] [--] 'cpu: Move CPUClass::virtio_is_big_endian to SysemuCPUOp=
s'=0D
009/15:[----] [--] 'cpu: Move CPUClass::get_crash_info to SysemuCPUOps'=0D
010/15:[0004] [FC] 'cpu: Move CPUClass::write_elf* to SysemuCPUOps'=0D
011/15:[----] [--] 'cpu: Move CPUClass::asidx_from_attrs to SysemuCPUOps'=0D
012/15:[----] [-C] 'cpu: Move CPUClass::get_phys_page_debug to SysemuCPUOps=
'=0D
013/15:[----] [--] 'cpu: Move CPUClass::get_memory_mapping to SysemuCPUOps'=
=0D
014/15:[----] [--] 'cpu: Move CPUClass::get_paging_enabled to SysemuCPUOps'=
=0D
015/15:[0003] [FC] 'cpu: Restrict "hw/core/sysemu-cpu-ops.h" to target/cpu.=
c'=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Supersedes: <20210303214708.1727801-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (15):=0D
  cpu: Un-inline cpu_get_phys_page_debug and cpu_asidx_from_attrs=0D
  cpu: Introduce cpu_virtio_is_big_endian()=0D
  cpu: Directly use cpu_write_elf*() fallback handlers in place=0D
  cpu: Directly use get_paging_enabled() fallback handlers in place=0D
  cpu: Directly use get_memory_mapping() fallback handlers in place=0D
  cpu: Introduce SysemuCPUOps structure=0D
  cpu: Move CPUClass::vmsd to SysemuCPUOps=0D
  cpu: Move CPUClass::virtio_is_big_endian to SysemuCPUOps=0D
  cpu: Move CPUClass::get_crash_info to SysemuCPUOps=0D
  cpu: Move CPUClass::write_elf* to SysemuCPUOps=0D
  cpu: Move CPUClass::asidx_from_attrs to SysemuCPUOps=0D
  cpu: Move CPUClass::get_phys_page_debug to SysemuCPUOps=0D
  cpu: Move CPUClass::get_memory_mapping to SysemuCPUOps=0D
  cpu: Move CPUClass::get_paging_enabled to SysemuCPUOps=0D
  cpu: Restrict "hw/core/sysemu-cpu-ops.h" to target/cpu.c=0D
=0D
 include/hw/core/cpu.h            |  92 ++++++-------------------=0D
 include/hw/core/sysemu-cpu-ops.h |  89 ++++++++++++++++++++++++=0D
 include/migration/vmstate.h      |   2 -=0D
 target/alpha/cpu.h               |   3 +=0D
 target/arm/cpu.h                 |   3 +=0D
 target/avr/cpu.h                 |   1 +=0D
 target/cris/cpu.h                |   3 +=0D
 target/hexagon/cpu.h             |   3 +=0D
 target/hppa/cpu.h                |   3 +=0D
 target/i386/cpu.h                |   3 +=0D
 target/lm32/cpu.h                |   3 +=0D
 target/m68k/cpu.h                |   3 +=0D
 target/microblaze/cpu.h          |   1 +=0D
 target/mips/cpu.h                |   3 +=0D
 target/moxie/cpu.h               |   3 +=0D
 target/nios2/cpu.h               |   1 +=0D
 target/openrisc/cpu.h            |   3 +=0D
 target/ppc/cpu.h                 |   3 +=0D
 target/riscv/cpu.h               |   3 +=0D
 target/rx/cpu.h                  |   1 +=0D
 target/s390x/cpu.h               |   3 +=0D
 target/sh4/cpu.h                 |   3 +=0D
 target/sparc/cpu.h               |   3 +=0D
 target/tricore/cpu.h             |   3 +=0D
 target/unicore32/cpu.h           |   3 +=0D
 target/xtensa/cpu.h              |   3 +=0D
 cpu.c                            |  19 +++---=0D
 hw/core/cpu.c                    | 113 +++++++++++++++++--------------=0D
 hw/virtio/virtio.c               |   4 +-=0D
 stubs/vmstate.c                  |   2 -=0D
 target/alpha/cpu.c               |  11 ++-=0D
 target/arm/cpu.c                 |  18 +++--=0D
 target/avr/cpu.c                 |   8 ++-=0D
 target/cris/cpu.c                |  11 ++-=0D
 target/hppa/cpu.c                |  11 ++-=0D
 target/i386/cpu.c                |  28 +++++---=0D
 target/lm32/cpu.c                |  10 ++-=0D
 target/m68k/cpu.c                |  11 ++-=0D
 target/microblaze/cpu.c          |  11 ++-=0D
 target/mips/cpu.c                |  10 ++-=0D
 target/moxie/cpu.c               |  10 +--=0D
 target/nios2/cpu.c               |  15 +++-=0D
 target/openrisc/cpu.c            |  11 ++-=0D
 target/riscv/cpu.c               |  16 +++--=0D
 target/rx/cpu.c                  |  16 ++++-=0D
 target/s390x/cpu.c               |  14 ++--=0D
 target/sh4/cpu.c                 |  11 ++-=0D
 target/sparc/cpu.c               |  10 ++-=0D
 target/tricore/cpu.c             |  13 +++-=0D
 target/unicore32/cpu.c           |   9 ++-=0D
 target/xtensa/cpu.c              |  11 ++-=0D
 target/ppc/translate_init.c.inc  |  20 +++---=0D
 52 files changed, 461 insertions(+), 206 deletions(-)=0D
 create mode 100644 include/hw/core/sysemu-cpu-ops.h=0D
=0D
--=3D20=0D
2.26.3=0D
=0D

