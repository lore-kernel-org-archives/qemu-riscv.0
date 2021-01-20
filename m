Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l2Gh8-0006DE-Lx
	for mharc-qemu-riscv@gnu.org; Wed, 20 Jan 2021 11:50:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l2Gh3-0006C5-CH; Wed, 20 Jan 2021 11:50:54 -0500
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:40876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l2Ggq-0006zA-U2; Wed, 20 Jan 2021 11:50:53 -0500
Received: by mail-io1-xd2a.google.com with SMTP id n2so30989084iom.7;
 Wed, 20 Jan 2021 08:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S9yKx8zfi7WoRXw5NiDvyCSzXomfvms+mBgGTw8hc50=;
 b=MWpPvSvIR/W7e0DCT8ap3ZCaP/hec5KLWyK/aU9GaYoaCGtOSbN06pQ9G9wQow2Q0g
 RN388BdK4XmQIpnW3q2kvfHIJOx0Vo7VXAlk+M6GPZ7G9tk73Jc3Yhq8TvyhuRgGSf77
 h0Bs6SciXdD3uuWsAjSGf2rNxHcd6/2/UPwAgA/ovHnj3kATW8WGSHQ9gOu7TlFmJ3x+
 bjeTv5XspdcacoreIIgSjwrGMcuD371zrKcP0s3JXIkCuVEaQMF1TN0ZHUpCp1ZrQOF9
 AhVDgRkPSw11cSiiwfAvAJifM2OPXMzpDcBib4l3KUqsAMtbJflvTciakPMTTMhhbJ+m
 A6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S9yKx8zfi7WoRXw5NiDvyCSzXomfvms+mBgGTw8hc50=;
 b=rKETBgPvQkddk8BMF+WeJ9/Sbm3OaziW/HG3oLJ6E+0dcY0HhsSGOtow0DYc8pZSUG
 o1Wh0eV/jZ+VCMZy+42+L6Mo7zu6QDI9jAD2aq58MF4VPoozEHgSjc+z38KCO6DcHW2y
 5SK38CwqqmR0RfzFDrRPcK1T4BCbQOKstzYliDJTwrJGpJEKx11x2/OqOrW9Pg1xO7XY
 yzNYP5+l6YI7ZKynF6KqDgAbzEC2KCikpZGmO5P5Wfz44PaxaSBEbf/Tec1vnfU7EIMd
 UB017rixmSbex+EdfM9+VNTzkf6L7ISfVsQZ+I/1EIqWp94xz6StSI5Xkmn3H/KLtwM7
 4vkw==
X-Gm-Message-State: AOAM5328nv2c0nQFLwo5oBo/C2YgOn16pk4nmuNtcjc5q8F+G2dMJ6bK
 hMzubCdzCFTv8oUUewT9tB6J7aLiIgk+LdFIifg=
X-Google-Smtp-Source: ABdhPJzAR/M3LNWgKs/ioyqzIyRJtIMd6TGHALjFVc7AqsxlPiMaPNAXjVGOF2NWb4NryPgDWQQ3s/2cwdvmj8hAw9E=
X-Received: by 2002:a92:8455:: with SMTP id l82mr8666605ild.40.1611161433745; 
 Wed, 20 Jan 2021 08:50:33 -0800 (PST)
MIME-Version: 1.0
References: <20210119234438.10132-1-bmeng.cn@gmail.com>
In-Reply-To: <20210119234438.10132-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Jan 2021 08:50:07 -0800
Message-ID: <CAKmqyKNiAymEGF7pGERUQvJx7Gto7yuu-pLsnhaSCu5gMPF2XA@mail.gmail.com>
Subject: Re: [PATCH] roms/opensbi: Upgrade from v0.8 to v0.9
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 20 Jan 2021 16:50:56 -0000

On Tue, Jan 19, 2021 at 3:46 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Upgrade OpenSBI from v0.8 to v0.9 and the pre-built bios images.
>
> The v0.9 release includes the following commits:
>
> 35bc810 docs/platform: Update QEMU parameter for fw_payload
> 78afe11 config.mk: Update QEMU run command for generic and sifive fu540 platforms
> ec3e5b1 docs/platform: sifive_fu540: Update U-Boot instructions
> 7d61a68 README.md: fix markdown link formatting
> a5f9104 lib/utils: fdt: Update FDT expand size to 1024 for reserved memory node
> ec1abf6 include: sbi_bitops: Remove dead shift assignment in ffs/fls
> 8e47649 lib: Add sbi_strncmp implementation
> 2845d2d lib: utils: Add a macro in libfdt_env.h for strncmp
> 2cfd2fc lib: utils: Use strncmp in fdt_parse_hart_id()
> 937caee lib: sbi_misaligned_ldst: Determine transformed instruction length correctly
> 4b18a2a firmware: fw_base: Improve exception stack setup in trap handler
> 9d56961 lib: sbi_trap: Fix hstatus.SPVP update in sbi_trap_redirect()
> d7f87d9 platform: kendryte/k210: fixup FDT
> e435ba0 lib: sbi_init: Avoid thundering hurd problem with coldboot_lock
> 4f3bad6 lib: sbi: Handle the case where MTVAL has illegal instruction address
> 7b0b289 lib: sbi: Remove redundant SBI_HART_HAS_PMP feature
> 74d1db7 lib: sbi: Improve PMP CSR detection and progamming
> 2c341f7 lib: sbi: Detect and print MHPM counters at boot-time
> 162d453 include: sbi: Few cosmetic changes in riscv_encoding.h
> ebc8ebc lib: sbi: Improve HPM CSR read/write emulation
> dcb10c0 lib: sbi: Don't handle VS-mode ecall in sbi_trap_handler()
> bef63d6 include: Rename ECALL defines to match latest RISC-V spec
> c1c7c3e lib: sbi_trap: Allow M-mode to M-mode ECALLs
> 6734304 lib: sbi: Allow specifying start mode to sbi_hsm_hart_start() API
> 7ccf6bf lib: sbi: Allow specifying mode in sbi_hart_pmp_check_addr() API
> 9f935a4 lib: utils: Improve fdt_cpu_fixup() implementation
> 172fa16 lib: sbi: Ensure coldboot HART supports next privilege mode
> aaeca7e platform: generic: Don't mark non-MMU HARTs as invalid
> 7701ea1 lib: sbi: Fix PMP CSR detection
> 79bf80b lib: sbi_scratch: typo scatch
> a04c465 makefile: fix clean directive
> af4b50f Makefile: Build ELF, BIN and LD script in platform build directory
> 6ca0969 firmware: Add common FW_FDT_PATH compile-time option
> 9c07c51 firmware: Remove FW_PAYLOAD_FDT_PATH compile-time option
> e9a4bfb Makefile: Allow padding zeros when converting DTB to C source
> a0f2d4a platform: kendryte/k210: Add some padding for FDT fixups
> dbeeacb include: sbi: Remove redundant includes from sbi_platform.h
> a12d46a include: sbi: Remove pmp_region callbacks from sbi_platform_operations
> a126886 lib: sbi: Configure PMP late in coldboot and warmboot path
> f81d6f6 lib: sbi: Remove redundant hartid parameter from sbi_hart_init()
> 8b65005 include: sbi: Make hartmask pointer const in sbi_hartmask_test_hart()
> b1678af lib: sbi: Add initial domain support
> e73b92d lib: sbi: Extend sbi_hsm_hart_started_mask() for domains
> 3a30d2c lib: sbi: Extend sbi_hsm_hart_start() for domains
> 530e95b lib: sbi: Optimize sbi_hsm_hart_started_mask() implementation
> 3e20037 lib: sbi: Extend sbi_system_reset() for domains
> 5edbb7c lib: utils: Update fdt_reserved_memory_fixup() to use current domain
> 5fd99db lib: utils: Update fdt_cpu_fixup() to use current domain
> e856462 lib: sbi: Remove redundant sbi_hart_pmp_xyz() functions
> c10c30b lib: sbi: Configure PMP based on domain memory regions
> c347408 lib: sbi: Display domain details in boot prints
> fdf5d5c docs: Add initial documentation for domain support
> 74c0ea1 lib: utils: Implement "ranges" property parsing
> bf21632 lib: sbi: Detect PMP granularity and number of address bits
> a809f40 lib: sbi: Improve boot time print with additional PMP information
> 914f81f Makefile: Add option to use toolchain default ABI and ISA string
> 48616b3 lib: sbi: Improve boot prints in cold boot sequence
> 781cafd docs: fix a typo error
> 54a7734 include: sbi: Add SBI SRST extension related defines
> c4acc60 include: sbi: Remove opensbi specific reset type defines
> da07479 platform: Remove dummy system reset functions
> 5c429ae lib: sbi: Improve system reset platform operations
> 548d03e lib: sbi: Implement System Reset (SRST) SBI extension
> 2677324 firmware: fw_base: Optimize trap handler for RV32 systems
> 8d2edc4 lib: sbi: Fix sbi_hart_switch_mode() for u-mode
> 3d921fa lib: sbi: Fix typo in sbi_domain_finalize()
> 4e37022 lib: sbi: Fix domain_count check in sbi_domain_finalize()
> c709d40 lib: sbi: Auto start domain only if boot HART within limits
> c1f6d89 include: sbi: Use lower bits for domain memory region permissions
> 62ea4f4 lib: sbi: Override domain boot HART when coldboot HART assigned to it
> 555e737 lib: sbi: Add error prints in sbi_domain_finalize()
> 9b65dca include: sbi: Add domains_init() platform operation
> c0d2baa docs: Add domain device tree binding documentation
> ba741ea lib: utils: Add helper routines to populate domains from FDT
> 4fffb53 platform: generic: Populate domains from FDT
> e7da0b4 lib: utils/libfdt: Upgrade to v1.6.0 release
> 2179777 lib: utils: Allow FDT domain iteration functions to fail
> 7baccfc lib: sbi: Add function to register new domain
> 6fc1986 lib: utils: Remove fdt_domain_get() function
> a029bd9 lib: sbi: Remove domain_get() platform callback function
> 7dcb1e1 lib: sbi: Fix sign-extension in sbi_misaligned_load_handler()
> 80bc506 lib: sbi: Replace args with trap registers in ecall handler
> b7df5e4 lib: sbi: Introduce sbi_trap_exit() API
> 12394a2 lib: sbi: Allow custom local TLB flush function
> 0d49c3b lib: utils: Fix shakti uart implementation
> db56341 lib: sbi: Allow platforms to provide root domain memory regions
> e884416 include: sbi: No need to pack struct sbi_trap_regs
> 386eba2 include: sbi: No need to pack struct sbi_scratch
> 1bbf361 include: sbi: Don't pack struct sbi_platform and sbi_platform_operations
> da5293f platform: template: Fix compile error
> 234ed8e include: Bump-up version to 0.9
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> ---
> - please pull the full contents from https://github.com/lbmeng/qemu/
>   opensbi branch
>
>  .../opensbi-riscv32-generic-fw_dynamic.bin    | Bin 62144 -> 78680 bytes
>  .../opensbi-riscv32-generic-fw_dynamic.elf    | Bin 558668 -> 727464 bytes
>  .../opensbi-riscv64-generic-fw_dynamic.bin    | Bin 70792 -> 75096 bytes
>  .../opensbi-riscv64-generic-fw_dynamic.elf    | Bin 620424 -> 781264 bytes
>  roms/opensbi                                  |   2 +-
>  5 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin b/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
> index 23b4dfb3b9..ae651e2993 100644
> Binary files a/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin and b/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin differ
> diff --git a/pc-bios/opensbi-riscv32-generic-fw_dynamic.elf b/pc-bios/opensbi-riscv32-generic-fw_dynamic.elf
> index eb9ebf5674..3250d89408 100644
> Binary files a/pc-bios/opensbi-riscv32-generic-fw_dynamic.elf and b/pc-bios/opensbi-riscv32-generic-fw_dynamic.elf differ
> diff --git a/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin b/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin
> index 16c0cf4d0a..f039884483 100644
> Binary files a/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin and b/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin differ
> diff --git a/pc-bios/opensbi-riscv64-generic-fw_dynamic.elf b/pc-bios/opensbi-riscv64-generic-fw_dynamic.elf
> index 642a64e240..ef261c98d1 100644
> Binary files a/pc-bios/opensbi-riscv64-generic-fw_dynamic.elf and b/pc-bios/opensbi-riscv64-generic-fw_dynamic.elf differ
> diff --git a/roms/opensbi b/roms/opensbi
> index a98258d0b5..234ed8e427 160000
> --- a/roms/opensbi
> +++ b/roms/opensbi
> @@ -1 +1 @@
> -Subproject commit a98258d0b537a295f517bbc8d813007336731fa9
> +Subproject commit 234ed8e427f4d92903123199f6590d144e0d9351
> --
> 2.25.1
>
>

