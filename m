Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llXnf-0005fk-U5
	for mharc-qemu-riscv@gnu.org; Tue, 25 May 2021 10:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llXnd-0005b9-89; Tue, 25 May 2021 10:12:49 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:33443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llXna-0006Ss-Kz; Tue, 25 May 2021 10:12:48 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 z137-20020a1c7e8f0000b02901774f2a7dc4so1745842wmc.0; 
 Tue, 25 May 2021 07:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iwB49LVCIjXSnzvqMm0GWsschCGQ4n6LHKQlhxMMr6M=;
 b=c3p4m7+vkuKfwCkMHcCrx/dQ4evMS36z6tWU/TnNKEjDgSX2G8hAxfK3y5E0wo9NH/
 7Ctjn0zkKMe+UKrMT/WF+hgg1/f9yfAD1nSoDUf6vOqlQhchFiIsb8FnFpBomlBuoNyg
 olZSbngeEIIxmToVRfJ3pb5qwdKqJBYX6KN1JuLIhad3NTwtannQRTx+GJOmFsGTwAwq
 ANknc0srYv8e8ehei3jG0ETGrysDwrrJlImvELi2wKtu5Gh9QVU0wBpMqpEsC1IQPwL7
 ZDJd8at1mS4qj+0VXWtCnG/LZd0eCLX7CUBDJSrVwmmg58zI6IcyqrLhimbrdMNfRSbm
 5LqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iwB49LVCIjXSnzvqMm0GWsschCGQ4n6LHKQlhxMMr6M=;
 b=bQ4hu4xwB093kxocODvxAnOTGk+8GtR4i7Fj/bd31kr4h82RX9lastiNqHCR/j6bmZ
 KWcz9cvgGL83jKX8LIHZ1ES/MBqPE4jvj0euDac3jsUtbszM8F8ixBDRMFlTW8d9Nyj0
 g0wOM8JF118zKgjxmpSVt2dIQOj/EgeQLhBUt/p8tUP1YCMCVRJyodRlnx8aC1OyxguJ
 XzOy0j6Nx6BkvDr2+WrS8Yl+aQcS7HW+rtKpsNyWyKxGkICEdXBeyIBJY7knGpP5rTiW
 SrQc5yd4YAEWAqex6BcR1ZT+Fh6Vb7IZKRrB4eegkxZxL+ljwCpubCVsypu8w3MJFABw
 ybxw==
X-Gm-Message-State: AOAM530T1lMGQ7IdBMZ85CY7quYpM+sGD1yb5vzX6IsTP0G42hGYXjZC
 9uhSiZ+VSZ2sKsUDP6A07PA=
X-Google-Smtp-Source: ABdhPJw9r8CP3XwHEY7CU72JdMsBVUKlUD99KLUgGGUQkveG0uQ5xJt5EAM/KE1YZKX7uesNtKxRhg==
X-Received: by 2002:a1c:b306:: with SMTP id c6mr4062347wmf.37.1621951963940;
 Tue, 25 May 2021 07:12:43 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id g10sm16542900wrq.12.2021.05.25.07.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 07:12:42 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v7 00/23] cpu: Introduce SysemuCPUOps structure
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210517105140.1062037-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4810c3c9-57c5-3355-9de7-5f45a0944ed6@amsat.org>
Date: Tue, 25 May 2021 16:12:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 25 May 2021 14:12:49 -0000

On 5/17/21 12:51 PM, Philippe Mathieu-Daudé wrote:
> Missing review: 2-5 (new) and 13

Ping for review? :)

> This series is inspired on Claudio TCG work.
> 
> Instead of separate TCG from other accelerators, here we
> separate sysemu operations (system VS user).
> 
> Since v6:
> - Rebased (3 targets removed, Claudio's target/i386 series merged)
> - Addressed Richard & David comments
> 
> Since v5:
> - Rework patch 10 after Peter Maydell explanation on v3:
>   https://www.mail-archive.com/qemu-devel@nongnu.org/msg800849.html
> 
> Since v4:
> - Removed watchpoint patches (need more work) (Richard)
> - Merged patch 1 & 7 "Move CPUClass::vmsd to SysemuCPUOps" (Eduardo)
> - Reworded cpu_virtio_is_big_endian description (Greg)
> - Move write_elf() in target/riscv/cpu.c (rebased on top of 43a965888)
> - Added R-b tags
> 
> Since v3:
> - SysemuCPUOps const (Richard)
> - added missing xtensa #ifdef'ry
> - added missing aa64/sve #ifdef'ry
> - added Laurent R-b
> 
> Since v2:
> - fixed lm32/unicore32
> - remove USER_ONLY ifdef'ry from "cpu.h" (Claudio)
> 
> Since v1:
> - Name 'sysemu' (Claudio)
> - change each field progressively (Richard)
> 
> $ git backport-diff
> Key:
> [----] : patches are identical
> [####] : number of functional differences between upstream/downstream patch
> [down] : patch is downstream-only
> The flags [FC] indicate (F)unctional and (C)ontextual differences, respective=
> ly
> 
> 001/23:[down] 'NOTFORMERGE target/arm: Restrict MTE code to softmmu'
> 002/23:[down] 'cpu: Restrict target cpu_do_transaction_failed() handlers to s=
> ysemu'
> 003/23:[down] 'cpu: Restrict target cpu_do_unaligned_access() handlers to sys=
> emu'
> 004/23:[down] 'cpu: Remove duplicated 'sysemu/hw_accel.h' header'
> 005/23:[down] 'cpu: Split as cpu-common / cpu-sysemu'
> 006/23:[0002] [FC] 'cpu: Un-inline cpu_get_phys_page_debug and cpu_asidx_from=
> _attrs'
> 007/23:[0010] [FC] 'cpu: Introduce cpu_virtio_is_big_endian()'
> 008/23:[0088] [FC] 'cpu: Directly use cpu_write_elf*() fallback handlers in p=
> lace'
> 009/23:[0022] [FC] 'cpu: Directly use get_paging_enabled() fallback handlers =
> in place'
> 010/23:[0026] [FC] 'cpu: Directly use get_memory_mapping() fallback handlers =
> in place'
> 011/23:[0007] [FC] 'cpu: Assert DeviceClass::vmsd is NULL on user emulation'
> 012/23:[0004] [FC] 'cpu: Rename CPUClass vmsd -> legacy_vmsd'
> 013/23:[down] 'cpu: Move AVR target vmsd field from CPUClass to DeviceClass'
> 014/23:[0014] [FC] 'cpu: Introduce SysemuCPUOps structure'
> 015/23:[0003] [FC] 'cpu: Move CPUClass::vmsd to SysemuCPUOps'
> 016/23:[0002] [FC] 'cpu: Move CPUClass::virtio_is_big_endian to SysemuCPUOps'
> 017/23:[----] [--] 'cpu: Move CPUClass::get_crash_info to SysemuCPUOps'
> 018/23:[----] [-C] 'cpu: Move CPUClass::write_elf* to SysemuCPUOps'
> 019/23:[----] [--] 'cpu: Move CPUClass::asidx_from_attrs to SysemuCPUOps'
> 020/23:[0055] [FC] 'cpu: Move CPUClass::get_phys_page_debug to SysemuCPUOps'
> 021/23:[----] [--] 'cpu: Move CPUClass::get_memory_mapping to SysemuCPUOps'
> 022/23:[----] [--] 'cpu: Move CPUClass::get_paging_enabled to SysemuCPUOps'
> 023/23:[0012] [FC] 'cpu: Restrict "hw/core/sysemu-cpu-ops.h" to target/cpu.c'
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daud=C3=A9 (23):
>   NOTFORMERGE target/arm: Restrict MTE code to softmmu
>   cpu: Restrict target cpu_do_transaction_failed() handlers to sysemu
>   cpu: Restrict target cpu_do_unaligned_access() handlers to sysemu
>   cpu: Remove duplicated 'sysemu/hw_accel.h' header
>   cpu: Split as cpu-common / cpu-sysemu
>   cpu: Un-inline cpu_get_phys_page_debug and cpu_asidx_from_attrs
>   cpu: Introduce cpu_virtio_is_big_endian()
>   cpu: Directly use cpu_write_elf*() fallback handlers in place
>   cpu: Directly use get_paging_enabled() fallback handlers in place
>   cpu: Directly use get_memory_mapping() fallback handlers in place
>   cpu: Assert DeviceClass::vmsd is NULL on user emulation
>   cpu: Rename CPUClass vmsd -> legacy_vmsd
>   cpu: Move AVR target vmsd field from CPUClass to DeviceClass
>   cpu: Introduce SysemuCPUOps structure
>   cpu: Move CPUClass::vmsd to SysemuCPUOps
>   cpu: Move CPUClass::virtio_is_big_endian to SysemuCPUOps
>   cpu: Move CPUClass::get_crash_info to SysemuCPUOps
>   cpu: Move CPUClass::write_elf* to SysemuCPUOps
>   cpu: Move CPUClass::asidx_from_attrs to SysemuCPUOps
>   cpu: Move CPUClass::get_phys_page_debug to SysemuCPUOps
>   cpu: Move CPUClass::get_memory_mapping to SysemuCPUOps
>   cpu: Move CPUClass::get_paging_enabled to SysemuCPUOps
>   cpu: Restrict "hw/core/sysemu-cpu-ops.h" to target/cpu.c
> 
>  include/hw/core/cpu.h            |  92 +++++---------------
>  include/hw/core/sysemu-cpu-ops.h |  92 ++++++++++++++++++++
>  include/migration/vmstate.h      |   2 -
>  target/alpha/cpu.h               |  12 ++-
>  target/arm/cpu.h                 |   9 +-
>  target/arm/internals.h           |   2 +
>  target/avr/cpu.h                 |   1 +
>  target/cris/cpu.h                |   7 +-
>  target/hexagon/cpu.h             |   3 +
>  target/hppa/cpu.h                |   5 +-
>  target/i386/cpu.h                |   9 +-
>  target/m68k/cpu.h                |  10 ++-
>  target/microblaze/cpu.h          |  11 +--
>  target/mips/cpu.h                |   3 +
>  target/mips/tcg/tcg-internal.h   |   6 +-
>  target/nios2/cpu.h               |   4 +-
>  target/openrisc/cpu.h            |   6 +-
>  target/ppc/cpu.h                 |   5 +-
>  target/ppc/internal.h            |   2 +
>  target/riscv/cpu.h               |  21 +++--
>  target/rx/cpu.h                  |   5 ++
>  target/s390x/cpu.h               |   3 +
>  target/s390x/internal.h          |   2 +
>  target/sh4/cpu.h                 |  11 ++-
>  target/sparc/cpu.h               |  14 +--
>  target/tricore/cpu.h             |   5 ++
>  target/xtensa/cpu.h              |  19 ++--
>  cpu.c                            |  18 ++--
>  hw/core/{cpu.c =3D> cpu-common.c}  | 116 -------------------------
>  hw/core/cpu-sysemu.c             | 145 +++++++++++++++++++++++++++++++
>  hw/virtio/virtio.c               |   4 +-
>  stubs/vmstate.c                  |   2 -
>  target/alpha/cpu.c               |   8 +-
>  target/arm/cpu.c                 |  18 ++--
>  target/arm/tlb_helper.c          |   4 +-
>  target/avr/cpu.c                 |   8 +-
>  target/avr/machine.c             |   4 +-
>  target/cris/cpu.c                |   8 +-
>  target/hppa/cpu.c                |   8 +-
>  target/i386/cpu.c                |  28 +++---
>  target/m68k/cpu.c                |   8 +-
>  target/microblaze/cpu.c          |   8 +-
>  target/microblaze/helper.c       |  35 ++++----
>  target/mips/cpu.c                |  10 ++-
>  target/nios2/cpu.c               |   8 +-
>  target/openrisc/cpu.c            |   8 +-
>  target/ppc/excp_helper.c         |   3 +-
>  target/riscv/cpu.c               |  14 ++-
>  target/rx/cpu.c                  |  10 ++-
>  target/s390x/cpu.c               |  14 ++-
>  target/sh4/cpu.c                 |  11 ++-
>  target/sparc/cpu.c               |  10 ++-
>  target/sparc/ldst_helper.c       |   5 +-
>  target/tricore/cpu.c             |   6 +-
>  target/xtensa/cpu.c              |  10 ++-
>  target/ppc/translate_init.c.inc  |  20 +++--
>  hw/core/meson.build              |   3 +-
>  target/arm/meson.build           |   6 +-
>  58 files changed, 587 insertions(+), 334 deletions(-)
>  create mode 100644 include/hw/core/sysemu-cpu-ops.h
>  rename hw/core/{cpu.c =3D> cpu-common.c} (73%)
>  create mode 100644 hw/core/cpu-sysemu.c
> 
> --=20
> 2.26.3
> 
> 

