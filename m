Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liaql-0003uF-3p
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 06:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liaqi-0003nu-HF; Mon, 17 May 2021 06:51:48 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liaqg-0006FU-Eo; Mon, 17 May 2021 06:51:48 -0400
Received: by mail-wr1-x430.google.com with SMTP id h4so5850832wrt.12;
 Mon, 17 May 2021 03:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4J6gCjiLvFV0qYFBY/UaRpAcHcZtCFan7YLoPArbzt0=;
 b=MLgm96ViwoMhrCHAotIusRn781Lh7mbyKi1yRHhJpNsGcSWVQbCBJw136f9y8s2NIS
 75U7aWpQBrU6EShJpkydGYHqGeGs7NzMkihuXM8IiT5KLFZ5lYlmj4lJlx23m8cM4oD7
 vxdTXGc9+rFhPMwZ0f8bIsJtPhW2B8f4ksNgmBG0Kk8LgRWf7lCa84piLlGOdC8At/2Y
 l7E1fJ4TwWgR+GuNDfKZcdO7wDxOAf0d9JF85zO7m51xYeyPw1gxiQ+Y0yk6B/t3jYWJ
 cuwwu4Um409hvCOsyOiaAgHcLO/yenD7a27KkselbcV6BUu0nV4kCaoAPGPNB+FygwTc
 sTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=4J6gCjiLvFV0qYFBY/UaRpAcHcZtCFan7YLoPArbzt0=;
 b=miD2bBPkTJefTj3JIDRrN4lH8h6MXNKObVzB/UrzJBJZ7sy79U1YroI9+cnfOZA8Za
 IasdHDXtyWPYMb6VSeyjmxGtIO4yLxEsKqjyAn9b0iqtqoBtJCEXZwHjvddSRzx+dqh0
 O+kdsrVZ4NX6bpLcV9O1zUJr8YvNa+IX5OqyEQXl8gwR3RLaYeWfZOa695HE6/duCjS5
 gSmi7ytNnlY6Gvnkun5hqDJwt+1pIPvscL/RFMqwo/bl+EhgYuc3kF//xYaVDZrAOQYP
 y/nXtR/f1uy7TSDEkhhjKYUZr5RDKUWyrTOXsl2tFPy6gGz1evTgHQrA0PX9zCzWAFo4
 gErg==
X-Gm-Message-State: AOAM530eHBLJeyoAZd0BKTta+CDOGcT7iUUHLT7t1dbyoC04edOfyd1t
 gCEl4OOSHJZatbEXtKug6NTWse5jwJqlCw==
X-Google-Smtp-Source: ABdhPJwdLu7IqD4M1rKKG98o2wSTJCgvwDt8vAMV5pg9B7v5qNMqDrdmpPNQKJfGMLB9uxNpvSIXaw==
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr18022588wrr.215.1621248703243; 
 Mon, 17 May 2021 03:51:43 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id z8sm16706698wrw.74.2021.05.17.03.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:51:42 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 00/23] cpu: Introduce SysemuCPUOps structure
Date: Mon, 17 May 2021 12:51:17 +0200
Message-Id: <20210517105140.1062037-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
X-List-Received-Date: Mon, 17 May 2021 10:51:49 -0000

Missing review: 2-5 (new) and 13=0D
=0D
Hi,=0D
=0D
This series is inspired on Claudio TCG work.=0D
=0D
Instead of separate TCG from other accelerators, here we=0D
separate sysemu operations (system VS user).=0D
=0D
Since v6:=0D
- Rebased (3 targets removed, Claudio's target/i386 series merged)=0D
- Addressed Richard & David comments=0D
=0D
Since v5:=0D
- Rework patch 10 after Peter Maydell explanation on v3:=0D
  https://www.mail-archive.com/qemu-devel@nongnu.org/msg800849.html=0D
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
001/23:[down] 'NOTFORMERGE target/arm: Restrict MTE code to softmmu'=0D
002/23:[down] 'cpu: Restrict target cpu_do_transaction_failed() handlers to=
 s=3D=0D
ysemu'=0D
003/23:[down] 'cpu: Restrict target cpu_do_unaligned_access() handlers to s=
ys=3D=0D
emu'=0D
004/23:[down] 'cpu: Remove duplicated 'sysemu/hw_accel.h' header'=0D
005/23:[down] 'cpu: Split as cpu-common / cpu-sysemu'=0D
006/23:[0002] [FC] 'cpu: Un-inline cpu_get_phys_page_debug and cpu_asidx_fr=
om=3D=0D
_attrs'=0D
007/23:[0010] [FC] 'cpu: Introduce cpu_virtio_is_big_endian()'=0D
008/23:[0088] [FC] 'cpu: Directly use cpu_write_elf*() fallback handlers in=
 p=3D=0D
lace'=0D
009/23:[0022] [FC] 'cpu: Directly use get_paging_enabled() fallback handler=
s =3D=0D
in place'=0D
010/23:[0026] [FC] 'cpu: Directly use get_memory_mapping() fallback handler=
s =3D=0D
in place'=0D
011/23:[0007] [FC] 'cpu: Assert DeviceClass::vmsd is NULL on user emulation=
'=0D
012/23:[0004] [FC] 'cpu: Rename CPUClass vmsd -> legacy_vmsd'=0D
013/23:[down] 'cpu: Move AVR target vmsd field from CPUClass to DeviceClass=
'=0D
014/23:[0014] [FC] 'cpu: Introduce SysemuCPUOps structure'=0D
015/23:[0003] [FC] 'cpu: Move CPUClass::vmsd to SysemuCPUOps'=0D
016/23:[0002] [FC] 'cpu: Move CPUClass::virtio_is_big_endian to SysemuCPUOp=
s'=0D
017/23:[----] [--] 'cpu: Move CPUClass::get_crash_info to SysemuCPUOps'=0D
018/23:[----] [-C] 'cpu: Move CPUClass::write_elf* to SysemuCPUOps'=0D
019/23:[----] [--] 'cpu: Move CPUClass::asidx_from_attrs to SysemuCPUOps'=0D
020/23:[0055] [FC] 'cpu: Move CPUClass::get_phys_page_debug to SysemuCPUOps=
'=0D
021/23:[----] [--] 'cpu: Move CPUClass::get_memory_mapping to SysemuCPUOps'=
=0D
022/23:[----] [--] 'cpu: Move CPUClass::get_paging_enabled to SysemuCPUOps'=
=0D
023/23:[0012] [FC] 'cpu: Restrict "hw/core/sysemu-cpu-ops.h" to target/cpu.=
c'=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (23):=0D
  NOTFORMERGE target/arm: Restrict MTE code to softmmu=0D
  cpu: Restrict target cpu_do_transaction_failed() handlers to sysemu=0D
  cpu: Restrict target cpu_do_unaligned_access() handlers to sysemu=0D
  cpu: Remove duplicated 'sysemu/hw_accel.h' header=0D
  cpu: Split as cpu-common / cpu-sysemu=0D
  cpu: Un-inline cpu_get_phys_page_debug and cpu_asidx_from_attrs=0D
  cpu: Introduce cpu_virtio_is_big_endian()=0D
  cpu: Directly use cpu_write_elf*() fallback handlers in place=0D
  cpu: Directly use get_paging_enabled() fallback handlers in place=0D
  cpu: Directly use get_memory_mapping() fallback handlers in place=0D
  cpu: Assert DeviceClass::vmsd is NULL on user emulation=0D
  cpu: Rename CPUClass vmsd -> legacy_vmsd=0D
  cpu: Move AVR target vmsd field from CPUClass to DeviceClass=0D
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
 include/hw/core/cpu.h            |  92 +++++---------------=0D
 include/hw/core/sysemu-cpu-ops.h |  92 ++++++++++++++++++++=0D
 include/migration/vmstate.h      |   2 -=0D
 target/alpha/cpu.h               |  12 ++-=0D
 target/arm/cpu.h                 |   9 +-=0D
 target/arm/internals.h           |   2 +=0D
 target/avr/cpu.h                 |   1 +=0D
 target/cris/cpu.h                |   7 +-=0D
 target/hexagon/cpu.h             |   3 +=0D
 target/hppa/cpu.h                |   5 +-=0D
 target/i386/cpu.h                |   9 +-=0D
 target/m68k/cpu.h                |  10 ++-=0D
 target/microblaze/cpu.h          |  11 +--=0D
 target/mips/cpu.h                |   3 +=0D
 target/mips/tcg/tcg-internal.h   |   6 +-=0D
 target/nios2/cpu.h               |   4 +-=0D
 target/openrisc/cpu.h            |   6 +-=0D
 target/ppc/cpu.h                 |   5 +-=0D
 target/ppc/internal.h            |   2 +=0D
 target/riscv/cpu.h               |  21 +++--=0D
 target/rx/cpu.h                  |   5 ++=0D
 target/s390x/cpu.h               |   3 +=0D
 target/s390x/internal.h          |   2 +=0D
 target/sh4/cpu.h                 |  11 ++-=0D
 target/sparc/cpu.h               |  14 +--=0D
 target/tricore/cpu.h             |   5 ++=0D
 target/xtensa/cpu.h              |  19 ++--=0D
 cpu.c                            |  18 ++--=0D
 hw/core/{cpu.c =3D3D> cpu-common.c}  | 116 -------------------------=0D
 hw/core/cpu-sysemu.c             | 145 +++++++++++++++++++++++++++++++=0D
 hw/virtio/virtio.c               |   4 +-=0D
 stubs/vmstate.c                  |   2 -=0D
 target/alpha/cpu.c               |   8 +-=0D
 target/arm/cpu.c                 |  18 ++--=0D
 target/arm/tlb_helper.c          |   4 +-=0D
 target/avr/cpu.c                 |   8 +-=0D
 target/avr/machine.c             |   4 +-=0D
 target/cris/cpu.c                |   8 +-=0D
 target/hppa/cpu.c                |   8 +-=0D
 target/i386/cpu.c                |  28 +++---=0D
 target/m68k/cpu.c                |   8 +-=0D
 target/microblaze/cpu.c          |   8 +-=0D
 target/microblaze/helper.c       |  35 ++++----=0D
 target/mips/cpu.c                |  10 ++-=0D
 target/nios2/cpu.c               |   8 +-=0D
 target/openrisc/cpu.c            |   8 +-=0D
 target/ppc/excp_helper.c         |   3 +-=0D
 target/riscv/cpu.c               |  14 ++-=0D
 target/rx/cpu.c                  |  10 ++-=0D
 target/s390x/cpu.c               |  14 ++-=0D
 target/sh4/cpu.c                 |  11 ++-=0D
 target/sparc/cpu.c               |  10 ++-=0D
 target/sparc/ldst_helper.c       |   5 +-=0D
 target/tricore/cpu.c             |   6 +-=0D
 target/xtensa/cpu.c              |  10 ++-=0D
 target/ppc/translate_init.c.inc  |  20 +++--=0D
 hw/core/meson.build              |   3 +-=0D
 target/arm/meson.build           |   6 +-=0D
 58 files changed, 587 insertions(+), 334 deletions(-)=0D
 create mode 100644 include/hw/core/sysemu-cpu-ops.h=0D
 rename hw/core/{cpu.c =3D3D> cpu-common.c} (73%)=0D
 create mode 100644 hw/core/cpu-sysemu.c=0D
=0D
--=3D20=0D
2.26.3=0D
=0D

