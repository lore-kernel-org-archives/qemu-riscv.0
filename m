Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZfAO-0001Tn-7v
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 15:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfAM-0001QL-BH; Thu, 22 Apr 2021 15:39:10 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfAK-00051M-EM; Thu, 22 Apr 2021 15:39:10 -0400
Received: by mail-wr1-x42a.google.com with SMTP id c15so37001023wro.13;
 Thu, 22 Apr 2021 12:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Di5CVuHkPTstCgi4wiTFFGkNABVnXzKxgPBAohmkqxA=;
 b=VSTdnSakHaep8OstChohV1qU7S7ATWfEkHMXgubymd9VP84+T06SmAvNobWGCEQkg3
 oEkGF+pPgSueAWEDWVr5vU3AbVqh3Fi1ZmsqfQXdr/T1PJb+B+DvXHdWIQpIvZPjLaDZ
 ko9d2fF5Z9FTi4/vfBJUvAPejb5iM2VI1GYrtPb7SCICOMzrqXXZx+KU4nBiaZvlEDkT
 1Y94yESqnTzxN1XZ6Ue6CJdwe0wZtdJTxojZ4X0rFfILi5nPfhr9MQiXTQKquWHqAeeu
 BA/gRptNqxCdQNmHv+RvX7SAWqoQfu7lnXgAjhsnsf48GXZCfCZUj+Ln4SoO/uC8DhyW
 hVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Di5CVuHkPTstCgi4wiTFFGkNABVnXzKxgPBAohmkqxA=;
 b=PBrhnY5+QWcdT/RdMr3iOFsjTz4zWmAu74qpWlzTjSUMZ/ahxdbpGaZrw+x43Djr1T
 9qJW9eR2yP2qmnYWoBoPTTSXXYhAqDlLJ1h8e4IpHDq796KpotQwXE0kHKVkbnAPvVek
 9CuIBlNZy8ccuyx42jzCR5hgSwVbBhtTqpanku3NIsRehKwu0qDTvcLkAtwJ03WeVrmo
 9h5jarJsBzbRqAvh1ITAIILP6JkugBpDB4mnuD1eOEC1LKsZtqB2ZX3jvfAhEX8EBu5K
 +F761fqKEFAkZpNXv440GfjwtFTCvgxCQutlFMT55jlj81tRUk4R6sWmkfwDSAwUWkSW
 +1bg==
X-Gm-Message-State: AOAM5338ynivDMXG0VyotdblbNX0OkBqo5IhnaDzW3hBZ/2hYpzQAila
 hDNi+xYdPD0hovmLSfZxIuPwpJonpsUKnQ==
X-Google-Smtp-Source: ABdhPJzz1EcoVwVkwzS0YKOWRNoxBlOvwVCdfpg3vdvQRRu3wDiCBcftkEJ3r1Bw77M3Q/JIdiX/OQ==
X-Received: by 2002:a5d:69ca:: with SMTP id s10mr41174wrw.78.1619120344588;
 Thu, 22 Apr 2021 12:39:04 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f1sm5167228wru.60.2021.04.22.12.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 12:39:03 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-riscv@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 00/18] cpu: Introduce SysemuCPUOps structure
Date: Thu, 22 Apr 2021 21:38:44 +0200
Message-Id: <20210422193902.2644064-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
X-List-Received-Date: Thu, 22 Apr 2021 19:39:10 -0000

Missing review: patch 6, 7, 8, 10=0D
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
001/18:[----] [--] 'cpu: Un-inline cpu_get_phys_page_debug and cpu_asidx_fr=
om=3D=0D
_attrs'=0D
002/18:[----] [--] 'cpu: Introduce cpu_virtio_is_big_endian()'=0D
003/18:[----] [--] 'cpu: Directly use cpu_write_elf*() fallback handlers in=
 p=3D=0D
lace'=0D
004/18:[----] [--] 'cpu: Directly use get_paging_enabled() fallback handler=
s =3D=0D
in place'=0D
005/18:[----] [--] 'cpu: Directly use get_memory_mapping() fallback handler=
s =3D=0D
in place'=0D
006/18:[down] 'cpu: Assert DeviceClass::vmsd is NULL on user emulation'=0D
007/18:[down] 'cpu: Rename CPUClass vmsd -> legacy_vmsd'=0D
008/18:[down] 'cpu/{avr,lm32,moxie}: Set DeviceClass vmsd field (not CPUCla=
ss=3D=0D
 one)'=0D
009/18:[0010] [FC] 'cpu: Introduce SysemuCPUOps structure'=0D
010/18:[0118] [FC] 'cpu: Move CPUClass::vmsd to SysemuCPUOps'=0D
011/18:[----] [-C] 'cpu: Move CPUClass::virtio_is_big_endian to SysemuCPUOp=
s'=0D
012/18:[----] [-C] 'cpu: Move CPUClass::get_crash_info to SysemuCPUOps'=0D
013/18:[----] [-C] 'cpu: Move CPUClass::write_elf* to SysemuCPUOps'=0D
014/18:[----] [--] 'cpu: Move CPUClass::asidx_from_attrs to SysemuCPUOps'=0D
015/18:[0002] [FC] 'cpu: Move CPUClass::get_phys_page_debug to SysemuCPUOps=
'=0D
016/18:[----] [--] 'cpu: Move CPUClass::get_memory_mapping to SysemuCPUOps'=
=0D
017/18:[----] [--] 'cpu: Move CPUClass::get_paging_enabled to SysemuCPUOps'=
=0D
018/18:[----] [--] 'cpu: Restrict "hw/core/sysemu-cpu-ops.h" to target/cpu.=
c'=0D
=0D
CI: https://gitlab.com/philmd/qemu/-/pipelines/290833005=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (18):=0D
  cpu: Un-inline cpu_get_phys_page_debug and cpu_asidx_from_attrs=0D
  cpu: Introduce cpu_virtio_is_big_endian()=0D
  cpu: Directly use cpu_write_elf*() fallback handlers in place=0D
  cpu: Directly use get_paging_enabled() fallback handlers in place=0D
  cpu: Directly use get_memory_mapping() fallback handlers in place=0D
  cpu: Assert DeviceClass::vmsd is NULL on user emulation=0D
  cpu: Rename CPUClass vmsd -> legacy_vmsd=0D
  cpu/{avr,lm32,moxie}: Set DeviceClass vmsd field (not CPUClass one)=0D
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
 include/hw/core/sysemu-cpu-ops.h |  90 ++++++++++++++++++++++++=0D
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
 cpu.c                            |  17 ++---=0D
 hw/core/cpu.c                    | 113 +++++++++++++++++--------------=0D
 hw/virtio/virtio.c               |   4 +-=0D
 stubs/vmstate.c                  |   2 -=0D
 target/alpha/cpu.c               |   8 ++-=0D
 target/arm/cpu.c                 |  18 +++--=0D
 target/avr/cpu.c                 |   8 ++-=0D
 target/cris/cpu.c                |   8 ++-=0D
 target/hppa/cpu.c                |   8 ++-=0D
 target/i386/cpu.c                |  28 +++++---=0D
 target/lm32/cpu.c                |  10 ++-=0D
 target/m68k/cpu.c                |   8 ++-=0D
 target/microblaze/cpu.c          |   8 ++-=0D
 target/mips/cpu.c                |  10 ++-=0D
 target/moxie/cpu.c               |   8 ++-=0D
 target/nios2/cpu.c               |   8 ++-=0D
 target/openrisc/cpu.c            |   8 ++-=0D
 target/riscv/cpu.c               |  16 +++--=0D
 target/rx/cpu.c                  |  10 ++-=0D
 target/s390x/cpu.c               |  14 ++--=0D
 target/sh4/cpu.c                 |  11 ++-=0D
 target/sparc/cpu.c               |  10 ++-=0D
 target/tricore/cpu.c             |   6 +-=0D
 target/unicore32/cpu.c           |  10 ++-=0D
 target/xtensa/cpu.c              |  10 ++-=0D
 target/ppc/translate_init.c.inc  |  20 +++---=0D
 52 files changed, 430 insertions(+), 196 deletions(-)=0D
 create mode 100644 include/hw/core/sysemu-cpu-ops.h=0D
=0D
--=3D20=0D
2.26.3=0D
=0D

