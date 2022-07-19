Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oDhA3-0002ZK-Eo
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jul 2022 02:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDhA1-0002WU-Ke; Tue, 19 Jul 2022 02:56:49 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDh9z-00025b-6w; Tue, 19 Jul 2022 02:56:49 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 d7-20020a17090a564700b001f209736b89so256815pji.0; 
 Mon, 18 Jul 2022 23:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XTiLivCzdrz5FQYFNTYYjeVtEdZzfUypVmoVavHQLYI=;
 b=AOUkQ6AmzIbvzxWlDhXbpEKuXbpMiANA6eR2/sgi/JvSpt7OhGgnU+Aiwr1j1lTLBu
 e5LCLjOm7NlHzc0yL8Tm6nCTTnUD41X2I6inPmF4sxfRtunLQVStH23vQI+9Q50dMzVh
 a0YOaRIFwdIbBSakyrvB8Pn0tnkKg4IwxLD3HwWC38XVKe/qSRTDyDUzDo+S5aWchToc
 VAx4PZmxg1ZCVo7RRrsPQOM9psESrbeHTlNSrfAi6OfwVuFWUgdL+zz0cYUwrgyHZ6ZN
 pdZ7EaU72+ANOIhKYjdXie75rMoHfjOHcq0WeUixeiVDFbOkxISD1Z+T9wjJ1DuBK+Ze
 ex8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XTiLivCzdrz5FQYFNTYYjeVtEdZzfUypVmoVavHQLYI=;
 b=xZFe0ghXcqwxfQsZylT6vRAe7938d/33HK+U0aC0Ata0ZPLn7WXgDVqm1xX+prNkB9
 HojPZ7OdUOW5v2EB+jAsi8enjDfPEJxDS4hbmyKws84+fd99EcBrR6jadFLZexLAgje0
 /ZdUY1h2R89CZWz7FG4tIgWfuxnOrf76pmC4vw8aKDtmyTgeUzX3FnlONZeq+7kXc0Q7
 cMbNVthlK1J8IxPZJPF63q4z8Q9yHLy7IBaHLTI71M8Qe+hGx32CGhMdwnEemXPZrp2h
 Dv1A4LzydNis8S6IlztWPCGPf3K9IqXJZFEh3VKXjx4YMEjSxo/PEWpf5N1Wy8jMDVam
 PTpg==
X-Gm-Message-State: AJIora92ggewbEUZmHo+TKUr55RED5KdKURIzh2lIvIRc40G8gkuoxE4
 ljhegRPYcmoGHZPG7xihkXQOAgCiflkvbnje9e4WrgirUD0=
X-Google-Smtp-Source: AGRyM1uLWFOGXBUsffKD9LKP/qYXd55+3JlLKEd2L6A0Kw/grTuK2puYJGFoGbydyx0jO2s8tGOGO1UnVUiTEVT7zfc=
X-Received: by 2002:a17:902:e5d1:b0:16b:ece4:79e6 with SMTP id
 u17-20020a170902e5d100b0016bece479e6mr32209401plf.83.1658213805407; Mon, 18
 Jul 2022 23:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220713090613.204046-1-bmeng.cn@gmail.com>
In-Reply-To: <20220713090613.204046-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jul 2022 16:56:19 +1000
Message-ID: <CAKmqyKM3vtdGyUVQ0cWrCBG+ik5ve-F_SNO-RY8DjdPxsq4ZCw@mail.gmail.com>
Subject: Re: [PATCH] roms/opensbi: Upgrade from v1.0 to v1.1
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 19 Jul 2022 06:56:50 -0000

On Wed, Jul 13, 2022 at 7:06 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Upgrade OpenSBI from v1.0 to v1.1 and the pre-built bios images.
>
> The v1.1 release includes the following commits:
>
> 5b99603 lib: utils/ipi: Fix size check in aclint_mswi_cold_init()
> 6dde435 lib: utils/sys: Extend HTIF library to allow custom base address
> 8257262 platform: sifive_fu740: do not use a global in da9063_reset/shutdown
> fb688d9 platform: sifive_fu740: fix reset when watchdog is running
> 5d025eb lib: fix pointer of type 'void *' used in arithmetic
> 632f593 lib: sbi: Map only the counters enabled in hardware
> 3b7c204 lib: sbi: Disable interrupt during config matching
> a26dc60 lib: sbi: Disable interrupt and inhibit counting in M-mode during init
> 5d53b55 Makefile: fix build with binutils 2.38
> 6ad8917 lib: fix compilation when strings.h is included
> ce4c018 lib: utils/serial: Round UART8250 baud rate divisor to nearest integer
> 01250d0 include: sbi: Add AIA related CSR defines
> 8f96070 lib: sbi: Detect AIA CSRs at boot-time
> 65b4c7c lib: sbi: Use AIA CSRs for local interrupts when available
> 222132f lib: sbi: Add sbi_trap_set_external_irqfn() API
> 5f56314 lib: utils/irqchip: Allow multiple FDT irqchip drivers
> 1050940 include: sbi: Introduce nascent_init() platform callback
> 55e79f8 lib: sbi: Enable mie.MEIE bit for IPIs based on external interrupts.
> 9f73669 lib: utils/irqchip: Add IMSIC library
> 811da5c lib: utils/irqchip: Add FDT based driver for IMSIC
> 7127aaa lib: utils: Disable appropriate IMSIC DT nodes in fdt_fixups()
> 9979265 lib: utils/irqchip: Add APLIC initialization library
> 3461219 lib: utils/irqchip: Add FDT based driver for APLIC
> 8e2ef4f lib: utils: Disable appropriate APLIC DT nodes in fdt_fixups()
> 3a69cc1 lib: sbi: fix typo in is_region_subset
> f2ccf2f lib: sbi: verbose sbi_domain_root_add_memregion
> f3f4604 lib: sbi: Add a simple external interrupt handling framework
> 4998a71 lib: utils: serial: Initial commit of xlnx-uartlite
> 2dfbd3c lib: pmp_set/pmp_get moved errors from runtime to compile time
> b6b7220 firmware: Fix code for accessing hart_count and stack_size
> d552fc8 lib: Add error messages via conditional compilation for the future
> 555bdb1 include: Use static asserts for SBI_PLATFORM_xxx_OFFSET defines
> 1b42d3a include: Use static asserts for SBI_SCRATCH_xxx_OFFSET defines
> 7924a0b include: Use static asserts for FW_DYNAMIC_INFO_xxx_OFFSET defines
> 722f80d include: Add defines for [m|h|s]envcfg CSRs
> 31fecad lib: sbi: Detect menvcfg CSR at boot time
> 47d6765 lib: sbi: Enable Zicbo[m|z] extensions in the menvcfg CSR
> 794986f lib: sbi: Enable Svpbmt extension in the menvcfg CSR
> 499601a lib: sbi: Add Smstateen extension defines
> d44568a lib: sbi: Detect Smstateen CSRs at boot-time
> 3383d6a lib: irqchip/imsic: configure mstateen
> 5c5cbb5 lib: utils/serial: support 'reg-offset' property
> c1e47d0 include: correct the definition of MSTATUS_VS
> 9cd95e1 lib: sbi/hart: preserve csr validation value
> 4035ae9 docs: pmu: Improve the PMU DT bindings
> d62f6da lib: sbi: Implement Sstc extension
> 474a9d4 lib: sbi: Fix mstatus_init() for RV32 when Sscofpmf is not available
> e576b3e include: sbi: Define SBI_PMU_HW_EVENT_MAX to 256
> b0c9df5 lib: sbi: Fix mhpmeventh access for rv32 in absence of sscofpmf
> 1a754bb lib: sbi: Detect and print privileged spec version
> 5a6be99 lib: sbi: Remove 's' and 'u' from misa_string() output
> 5b8b377 lib: sbi: Update the name of ISA string printed at boot time
> d4b563c lib: sbi: Remove MCOUNTEREN and SCOUNTEREN hart features
> dbc3d8f lib: sbi: Remove MCOUNTINHIBT hart feature
> 97a17c2 lib: sbi: Remove MENVCFG hart feature
> a6ab94f lib: sbi: Fix AIA feature detection
> cad6c91 lib: sbi: Convert hart features into hart extensions
> be4903a lib: sbi: Detect hart features only once for each hart
> 994ace3 lib: sbi: Add sbi_hart_update_extension() function
> 023f0ad lib: sbi_platform: Add callback to populate HART extensions
> f726f2d Makefile: Allow generated C source to be anywhere in build directory
> 7fb474b Makefile: Add support for generating C array at compile time
> 73cf511 lib: utils/reset: Generate FDT reset driver list at compile-time
> 1e62705 lib: utils/serial: Generate FDT serial driver list at compile-time
> bfeb305 lib: utils/timer: Generate FDT timer driver list at compile-time
> 3a69d12 lib: utils/irqchip: Generate FDT irqchip driver list at compile-time
> 4ee0c57 lib: utils/ipi: Generate FDT ipi driver list at compile-time
> 998ed43 lib: utils/i2c: Generate FDT i2c adapter driver list at compile-time
> 4eacd82 lib: utils/gpio: Generate FDT gpio driver list at compile-time
> a3a3c60 platform: generic: Generate platform override module list at compile-time
> 9a7a677 platform: generic: Move Sifive platform overrides into own directory
> 851c14d lib: utils/irqchip: fix typo when checking for CPU node
> 90a9dd2 lib: utils/fdt: introduce fdt_node_is_enabled()
> 616da52 lib: utils: check if CPU node is enabled
> 575bb4e platform: generic: check if CPU node is enabled
> 1bc67db lib: utils/fdt: rename fdt_parse_max_hart_id
> f067bb8 lib: sbi: fix system_opcode_insn
> fab0379 lib: utils/fdt: Require match data to be const
> 295e5f3 lib: sbi_timer: Drop unnecessary get_platform_ticks wrapper
> ff65bfe lib: sbi_illegal_insn: Constify illegal_insn_table
> cb8271c lib: sbi_illegal_insn: Add emulation for fence.tso
> adc3388 lib: sbi_trap: Redirect exception based on hedeleg
> ce1d618 platform: generic: add overrides for vendor extensions
> b20ed9f lib: sbi_hsm: Call a device hook during hart resume
> 79e42eb lib: sbi_hsm: Assume a consistent resume address
> 2ea7799 lib: irqchip/plic: Constify plic_data pointers
> 8c362e7 lib: irqchip/plic: Factor out a context init function
> 415ecf2 lib: irqchip/plic: Add context save/restore helpers
> 2b79b69 lib: irqchip/plic: Add priority save/restore helpers
> 69be3df lib: utils/irqchip: Add FDT wrappers for PLIC save/restore functions
> 5e56758 lib: utils/irqchip: Add wrapper for T-HEAD PLIC delegation
> 9dc5ec5 platform: Add HSM implementation for Allwinner D1
> 551c70c include: sbi: Add mtinst/htinst psuedoinstructions
> 187127f lib: sbi: Fixup tinst for exceptions in sbi_misaligned_*()
> a07402a lib: sbi: Fix tval and tinst for sbi_get_insn()
> c653001 lib: utils: Remove CSRs that set/clear an IMSIC interrupt file bits
> 7738345 lib: utils/timer: Add a separate compatible for the D1 CLINT
> d76a196 lib: irqchip/plic: fix typo in plic_warm_irqchip_init
> 6f1fe98 lib: utils/timer: Remove Allwinner D1 CLINT compatibles
> c6fdbcf include: sbi: Change spec version to 1.0
> 3f66465 lib: pmu: allow to use the highest available counter
> 4489876 include: Bump-up version to 1.1
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> please pull the full contents from https://github.com/lbmeng/qemu/ opensbi branch

Thanks!

Applied to riscv-to-apply.next

Alistair

