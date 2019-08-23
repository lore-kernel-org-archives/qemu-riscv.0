Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i1Dcl-0001hz-CV
	for mharc-qemu-riscv@gnu.org; Fri, 23 Aug 2019 13:45:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60902)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1i1Dcf-0001bs-Va
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 13:45:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1i1Dcc-0003HF-T7
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 13:45:13 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:34936)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1i1DcQ-000323-Qa; Fri, 23 Aug 2019 13:44:59 -0400
Received: by mail-lj1-x241.google.com with SMTP id l14so9637733lje.2;
 Fri, 23 Aug 2019 10:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5h395QyvsypISitue18ufYU4FtEvsgcX0U8BKXBDgRg=;
 b=E9ljkotwZEcfQtlIwv7E6khqDaPPsNwcuXDc/3ojCt0/F+x0ZZm5eqvB2OCnJKrTRq
 mlWQsB+bgZHvz1ShIbUeP+li8zgjlYKFwTQaNkqwHzSlx0lJeMIL5j2fEApd8qPCkX1z
 4/q/3FIF8CXi4v2iLpeWQRpJh3zhvS6wL5XJ6GWm4Y77vFbYClXaB+LfbTXAkLNH5Gy1
 dYc34YEUdji5hpqvZSNedP3WUhYfywHUQqVrYxZcJzKLtJx0K4VVi6ZJaXLBvHi9Nfo8
 1ARIG0GbOnEOADRe7m9FOMzBqR0X47J8Os95K6P+YuRml54bB58pjeOqmPD5NnYezsMY
 DUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5h395QyvsypISitue18ufYU4FtEvsgcX0U8BKXBDgRg=;
 b=MPScLCgYgtj9nGZlBtDxTtCOSwSJ6QjwpRsW9qYAYw9odlef1W1uKwTxC4m5KUZ6zC
 6baH95YLyE2CnzEDr2Ss4QpIdU39lJ1xHNZkb1gsszAnkA+U8JmNVo9H0ilyagotZX4T
 d54KRelZXfOIwQ2DdvV4prH8vezikWCAB3GLpqxyjP+St8KHEMXfky3HW6WkdVyIJt+6
 R8WFKxC25thYdtjf8FLKM2H1tNplvqal10ciKVZl4H47VDBVfq8F0YHa69EaeYRio7qR
 Eaw23mf0CVWl83RXK2CiCIrNbsjwDuMBgfQz/G+7iYItTclSfzIfmzMItB0BIScdAI+O
 lz+A==
X-Gm-Message-State: APjAAAW++wsZEBdlVs5PNzlvAAwRerbxH0t3sjyrFi4tVnaE4QHErlgv
 HSlxIcWtXLJsRb+cA5F1R+zWrUJHhqdTpySK0jM=
X-Google-Smtp-Source: APXvYqzGrzOBLHNJC5nMwaTmWIqLXx46jlQnMAcvd8nXOv52SFuCqVQfOLWH32/0q0DVwXSqNfL+u2P/DMz92LOX2EQ=
X-Received: by 2002:a2e:8102:: with SMTP id d2mr3712371ljg.58.1566582297673;
 Fri, 23 Aug 2019 10:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <1566537069-22741-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1566537069-22741-1-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Aug 2019 10:40:51 -0700
Message-ID: <CAKmqyKMSBWrMOMgE5B6_mRro2M78qJgHNi9qEJbSVgcEiLW1iA@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 00/30] riscv: sifive_u:
 Improve the emulation fidelity of sifive_u machine
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
X-List-Received-Date: Fri, 23 Aug 2019 17:45:17 -0000

On Thu, Aug 22, 2019 at 10:15 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> As of today, the QEMU 'sifive_u' machine is a special target that does
> not boot the upstream OpenSBI/U-Boot firmware images built for the real
> SiFive HiFive Unleashed board. Hence OpenSBI supports a special platform
> "qemu/sifive_u". For U-Boot, the sifive_fu540_defconfig is referenced
> in the OpenSBI doc as its payload, but that does not boot at all due
> to various issues in current QEMU 'sifive_u' machine codes.
>
> This series aims to improve the emulation fidelity of sifive_u machine,
> so that the upstream OpenSBI, U-Boot and kernel images built for the
> SiFive HiFive Unleashed board can be used out of the box without any
> special hack.
>
> The major changes include:
> - Heterogeneous harts creation supported, so that we can create a CPU
>   that exactly mirrors the real hardware: 1 E51 + 4 U54.
> - Implemented a PRCI model for FU540
> - Implemented an OTP model for FU540, primarily used for storing serial
>   number of the board
> - Fixed GEM support that was seriously broken on sifive_u
> - Synced device tree with upstream Linux kernel on sifive_u
>
> OpenSBI v0.4 image built for sifive/fu540 is included as the default
> bios image for 'sifive_u' machine.
>
> The series is tested against OpenSBI v0.4 image for sifive/fu540
> paltform, U-Boot v2019.10-rc1 image for sifive_fu540_defconfig,
> and Linux kernel v5.3-rc3 image with the following patch:
>
> macb: Update compatibility string for SiFive FU540-C000 [1]
>
> OpenSBI + U-Boot, ping/tftpboot with U-Boot MACB driver works well.
> Boot Linux 64-bit defconfig image, verified that system console on
> the serial 0 and ping host work pretty well.
>
> An OpenSBI patch [2] was sent to drop the special "qemu/sifive_u" platform
> support in OpenSBI. The original plan was to get the drop patch applied
> after this QEMU series is merged. However after discussion in the OpenSBI
> mailing list, it seems the best option for us is to let OpenSBI continue
> shipping the special "qemu/sifive_u" platform support to work with QEMU
> version <= 4.1 and deprecate the support sometime in the future. A patch
> will need to be sent to OpenSBI mailing list to update its document.
>
> v4 is now rebased on Palmer's QEMU RISC-V repo "for-master" branch.
> Dropped the following v3 patch that was already done by someone else.
> - riscv: sifive_u: Generate an aliases node in the device tree
> - riscv: sifive_u: Support loading initramfs
>
> The following v3 patch was dropped too due to a different cluster approach
> suggested by Richard Henderson is used in v4:
> - riscv: hart: Support heterogeneous harts population
>
> [1]: https://patchwork.kernel.org/patch/11050003/
> [2]: http://lists.infradead.org/pipermail/opensbi/2019-August/000335.html
>
> Changes in v5:
> - new patch to change to use qemu_log_mask(LOG_GUEST_ERROR,...) instead
>   in various sifive models
> - new patch to remove the unnecessary include of target/riscv/cpu.h
> - change to use defines instead of enums
> - change to use qemu_log_mask(LOG_GUEST_ERROR,...) in sifive_u_prci
> - creating a 32-bit val variable and using that instead of casting
>   everywhere in sifive_u_prci_write()
> - move all register initialization to sifive_u_prci_reset() function
> - drop sifive_u_prci_create()
> - s/codes that worked/code that works/g
> - create sifive_u_prci block directly in the machine codes, instead
>   of calling sifive_u_prci_create()
> - change to use defines instead of enums
> - change to use qemu_log_mask(LOG_GUEST_ERROR,...) in sifive_u_otp
> - creating a 32-bit val variable and using that instead of casting
>   everywhere in sifive_u_otp_write()
> - move all register initialization to sifive_u_otp_reset() function
> - drop sifive_u_otp_create()
> - create sifive_u_otp block directly in the machine codes, instead
>   of calling sifive_u_otp_create()
> - add the missing "local-mac-address" property in the ethernet node
>
> Changes in v4:
> - remove 2 more "linux,phandle" instances in sifive_u.c and spike.c
>   after rebasing on Palmer's QEMU RISC-V tree
> - change create_fdt() to return void in sifive_u.c too, after rebasing
>   on Palmer's QEMU RISC-V tree
> - new patch to remove executable attribute of opensbi images
> - prefix all macros/variables/functions with SIFIVE_E/sifive_e
>   in the sifive_e_prci driver
> - new patch to add a "hartid-base" property to RISC-V hart array
> - changed to create clusters for each cpu type
> - prefix all macros/variables/functions with SIFIVE_U/sifive_u
>   in the sifive_u_prci driver
> - prefix all macros/variables/functions with SIFIVE_U/sifive_u
>   in the sifive_u_otp driver
> - new patch to remove handcrafted clock nodes for UART and ethernet
>
> Changes in v3:
> - changed to use macros for management and compute cpu count
> - use management cpu count + 1 for the min_cpus
> - update IRQ numbers of both UARTs to match hardware as well
>
> Changes in v2:
> - keep the PLIC compatible string unchanged as OpenSBI uses that
>   for DT fix up
> - drop patch "riscv: sifive: Move sifive_mmio_emulate() to a common place"
> - new patch "riscv: sifive_e: Drop sifive_mmio_emulate()"
> - fixed the "interrupts-extended" property size
> - update the file header to indicate at least 2 harts are created
> - use create_unimplemented_device() to create the GEM management
>   block instead of sifive_mmio_emulate()
> - add "phy-handle" property to the ethernet node
>
> Bin Meng (30):
>   riscv: hw: Remove superfluous "linux,phandle" property
>   riscv: hw: Use qemu_fdt_setprop_cell() for property with only 1 cell
>   riscv: hw: Remove not needed PLIC properties in device tree
>   riscv: hw: Change create_fdt() to return void
>   riscv: hw: Change to use qemu_log_mask(LOG_GUEST_ERROR,...) instead
>   riscv: hw: Remove the unnecessary include of target/riscv/cpu.h
>   riscv: roms: Remove executable attribute of opensbi images
>   riscv: sifive_u: Remove the unnecessary include of prci header
>   riscv: sifive: Rename sifive_prci.{c,h} to sifive_e_prci.{c,h}
>   riscv: sifive_e: prci: Fix a typo of hfxosccfg register programming
>   riscv: sifive_e: prci: Update the PRCI register block size
>   riscv: sifive_e: Drop sifive_mmio_emulate()
>   riscv: Add a sifive_cpu.h to include both E and U cpu type defines
>   riscv: hart: Extract hart realize to a separate routine
>   riscv: hart: Add a "hartid-base" property to RISC-V hart array
>   riscv: sifive_u: Update hart configuration to reflect the real FU540
>     SoC
>   riscv: sifive_u: Set the minimum number of cpus to 2
>   riscv: sifive_u: Update PLIC hart topology configuration string
>   riscv: sifive: Implement PRCI model for FU540
>   riscv: sifive_u: Generate hfclk and rtcclk nodes
>   riscv: sifive_u: Add PRCI block to the SoC
>   riscv: sifive_u: Reference PRCI clocks in UART and ethernet nodes
>   riscv: sifive_u: Update UART base addresses and IRQs
>   riscv: sifive_u: Change UART node name in device tree
>   riscv: roms: Update default bios for sifive_u machine
>   riscv: sifive: Implement a model for SiFive FU540 OTP
>   riscv: sifive_u: Instantiate OTP memory with a serial number
>   riscv: sifive_u: Fix broken GEM support
>   riscv: sifive_u: Remove handcrafted clock nodes for UART and ethernet
>   riscv: sifive_u: Update model and compatible strings in device tree

@Palmer, patches 1 - 11 are all reviewed and are good to go in. Can
you take them in your next PR?

That'll save Bin from continuing to send a 30 patch series :)

Alistair

