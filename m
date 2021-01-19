Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l20gp-0004ar-D7
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 18:45:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l20gg-0004Yj-LZ; Tue, 19 Jan 2021 18:45:28 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:40138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l20gb-0007Wg-3G; Tue, 19 Jan 2021 18:45:26 -0500
Received: by mail-pj1-x1034.google.com with SMTP id m5so952828pjv.5;
 Tue, 19 Jan 2021 15:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V/fg3AUvuwaUWMgqGrqHAkx8f+EPWopwpZRBlX46oGA=;
 b=uoq5X6w0FpXQCoGWmt9Ep+UBiU3NdBztUzKR4kiVbzy0LKgQkJp1q03CWIRbn19f4a
 JB3hOXmOmsE1x00ohLywvA65HUha/Szf8+eiGetRZ909mYN0/C3jsjtopIlL0yLsTNem
 uM2WyGdNm7e8+zx3aMWO17IZaA/cEX9n5lJo/ptt7wJF76LYjAZ7eJIM8Z8uTgkGxcQp
 OAbM6MEP0wyOgwzj1/spb5q+bb/2RfUarsSSS0f6zBT1v8dFiYtAbv6HXxSV6ynvem6M
 AQcLpgeNfV0usuHhLuVU4QLRvY59PrSQSq8UkeIN+R4P7oVMjKFYOtxbl3IrLkjnDjnH
 tDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V/fg3AUvuwaUWMgqGrqHAkx8f+EPWopwpZRBlX46oGA=;
 b=FRz3Ph5t9FjZ/r3xF1cqLMTTINg2JmCikJyeg4oZdZ1akzzEw1VPqGZY4a4PbEyZr8
 Q3bP2ph5Ge7AI9x4p5FNn12riH6scFrxnQ/n6YSfF0gQbEMjSelaFLKpDOpsRya+oJbh
 78xfhemXNjcm0Z3nEtcx3U+ZbzQ3pUGbGMkY/3CHRiPNZWSjq6zo6iG2b68lu0ykOtV8
 URO72OE2iztaJLnuUxCiWh1gk+8YSO/q9o78fnffUBTS1S/r2gHWzJi12kD96usHvP5+
 MSk57Z7+BNr7F49b4z3tsP+AzVKAKNDJv3bsYv4ElwNOFDOoq7kA4Yo+ojXT/SIcfKQ5
 3mdA==
X-Gm-Message-State: AOAM5307EObbDl1dwT1da38e3xLjK1kKNpDnJccFtzHw/nKEYrLdMXVw
 luao9kIwzBbuxs1OWF/2Yw0=
X-Google-Smtp-Source: ABdhPJzCKqAX73folGg4kMMVXSqzePuiRLxswSSVaR0J0imOdMnEeHBHMasPRm5p3LbS9pdTf0VrXg==
X-Received: by 2002:a17:90a:d189:: with SMTP id
 fu9mr2271203pjb.98.1611099919236; 
 Tue, 19 Jan 2021 15:45:19 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t1sm189260pfq.154.2021.01.19.15.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 15:45:18 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] roms/opensbi: Upgrade from v0.8 to v0.9
Date: Wed, 20 Jan 2021 07:44:38 +0800
Message-Id: <20210119234438.10132-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 19 Jan 2021 23:45:31 -0000

From: Bin Meng <bin.meng@windriver.com>

Upgrade OpenSBI from v0.8 to v0.9 and the pre-built bios images.

The v0.9 release includes the following commits:

35bc810 docs/platform: Update QEMU parameter for fw_payload
78afe11 config.mk: Update QEMU run command for generic and sifive fu540 platforms
ec3e5b1 docs/platform: sifive_fu540: Update U-Boot instructions
7d61a68 README.md: fix markdown link formatting
a5f9104 lib/utils: fdt: Update FDT expand size to 1024 for reserved memory node
ec1abf6 include: sbi_bitops: Remove dead shift assignment in ffs/fls
8e47649 lib: Add sbi_strncmp implementation
2845d2d lib: utils: Add a macro in libfdt_env.h for strncmp
2cfd2fc lib: utils: Use strncmp in fdt_parse_hart_id()
937caee lib: sbi_misaligned_ldst: Determine transformed instruction length correctly
4b18a2a firmware: fw_base: Improve exception stack setup in trap handler
9d56961 lib: sbi_trap: Fix hstatus.SPVP update in sbi_trap_redirect()
d7f87d9 platform: kendryte/k210: fixup FDT
e435ba0 lib: sbi_init: Avoid thundering hurd problem with coldboot_lock
4f3bad6 lib: sbi: Handle the case where MTVAL has illegal instruction address
7b0b289 lib: sbi: Remove redundant SBI_HART_HAS_PMP feature
74d1db7 lib: sbi: Improve PMP CSR detection and progamming
2c341f7 lib: sbi: Detect and print MHPM counters at boot-time
162d453 include: sbi: Few cosmetic changes in riscv_encoding.h
ebc8ebc lib: sbi: Improve HPM CSR read/write emulation
dcb10c0 lib: sbi: Don't handle VS-mode ecall in sbi_trap_handler()
bef63d6 include: Rename ECALL defines to match latest RISC-V spec
c1c7c3e lib: sbi_trap: Allow M-mode to M-mode ECALLs
6734304 lib: sbi: Allow specifying start mode to sbi_hsm_hart_start() API
7ccf6bf lib: sbi: Allow specifying mode in sbi_hart_pmp_check_addr() API
9f935a4 lib: utils: Improve fdt_cpu_fixup() implementation
172fa16 lib: sbi: Ensure coldboot HART supports next privilege mode
aaeca7e platform: generic: Don't mark non-MMU HARTs as invalid
7701ea1 lib: sbi: Fix PMP CSR detection
79bf80b lib: sbi_scratch: typo scatch
a04c465 makefile: fix clean directive
af4b50f Makefile: Build ELF, BIN and LD script in platform build directory
6ca0969 firmware: Add common FW_FDT_PATH compile-time option
9c07c51 firmware: Remove FW_PAYLOAD_FDT_PATH compile-time option
e9a4bfb Makefile: Allow padding zeros when converting DTB to C source
a0f2d4a platform: kendryte/k210: Add some padding for FDT fixups
dbeeacb include: sbi: Remove redundant includes from sbi_platform.h
a12d46a include: sbi: Remove pmp_region callbacks from sbi_platform_operations
a126886 lib: sbi: Configure PMP late in coldboot and warmboot path
f81d6f6 lib: sbi: Remove redundant hartid parameter from sbi_hart_init()
8b65005 include: sbi: Make hartmask pointer const in sbi_hartmask_test_hart()
b1678af lib: sbi: Add initial domain support
e73b92d lib: sbi: Extend sbi_hsm_hart_started_mask() for domains
3a30d2c lib: sbi: Extend sbi_hsm_hart_start() for domains
530e95b lib: sbi: Optimize sbi_hsm_hart_started_mask() implementation
3e20037 lib: sbi: Extend sbi_system_reset() for domains
5edbb7c lib: utils: Update fdt_reserved_memory_fixup() to use current domain
5fd99db lib: utils: Update fdt_cpu_fixup() to use current domain
e856462 lib: sbi: Remove redundant sbi_hart_pmp_xyz() functions
c10c30b lib: sbi: Configure PMP based on domain memory regions
c347408 lib: sbi: Display domain details in boot prints
fdf5d5c docs: Add initial documentation for domain support
74c0ea1 lib: utils: Implement "ranges" property parsing
bf21632 lib: sbi: Detect PMP granularity and number of address bits
a809f40 lib: sbi: Improve boot time print with additional PMP information
914f81f Makefile: Add option to use toolchain default ABI and ISA string
48616b3 lib: sbi: Improve boot prints in cold boot sequence
781cafd docs: fix a typo error
54a7734 include: sbi: Add SBI SRST extension related defines
c4acc60 include: sbi: Remove opensbi specific reset type defines
da07479 platform: Remove dummy system reset functions
5c429ae lib: sbi: Improve system reset platform operations
548d03e lib: sbi: Implement System Reset (SRST) SBI extension
2677324 firmware: fw_base: Optimize trap handler for RV32 systems
8d2edc4 lib: sbi: Fix sbi_hart_switch_mode() for u-mode
3d921fa lib: sbi: Fix typo in sbi_domain_finalize()
4e37022 lib: sbi: Fix domain_count check in sbi_domain_finalize()
c709d40 lib: sbi: Auto start domain only if boot HART within limits
c1f6d89 include: sbi: Use lower bits for domain memory region permissions
62ea4f4 lib: sbi: Override domain boot HART when coldboot HART assigned to it
555e737 lib: sbi: Add error prints in sbi_domain_finalize()
9b65dca include: sbi: Add domains_init() platform operation
c0d2baa docs: Add domain device tree binding documentation
ba741ea lib: utils: Add helper routines to populate domains from FDT
4fffb53 platform: generic: Populate domains from FDT
e7da0b4 lib: utils/libfdt: Upgrade to v1.6.0 release
2179777 lib: utils: Allow FDT domain iteration functions to fail
7baccfc lib: sbi: Add function to register new domain
6fc1986 lib: utils: Remove fdt_domain_get() function
a029bd9 lib: sbi: Remove domain_get() platform callback function
7dcb1e1 lib: sbi: Fix sign-extension in sbi_misaligned_load_handler()
80bc506 lib: sbi: Replace args with trap registers in ecall handler
b7df5e4 lib: sbi: Introduce sbi_trap_exit() API
12394a2 lib: sbi: Allow custom local TLB flush function
0d49c3b lib: utils: Fix shakti uart implementation
db56341 lib: sbi: Allow platforms to provide root domain memory regions
e884416 include: sbi: No need to pack struct sbi_trap_regs
386eba2 include: sbi: No need to pack struct sbi_scratch
1bbf361 include: sbi: Don't pack struct sbi_platform and sbi_platform_operations
da5293f platform: template: Fix compile error
234ed8e include: Bump-up version to 0.9

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---
- please pull the full contents from https://github.com/lbmeng/qemu/
  opensbi branch

 .../opensbi-riscv32-generic-fw_dynamic.bin    | Bin 62144 -> 78680 bytes
 .../opensbi-riscv32-generic-fw_dynamic.elf    | Bin 558668 -> 727464 bytes
 .../opensbi-riscv64-generic-fw_dynamic.bin    | Bin 70792 -> 75096 bytes
 .../opensbi-riscv64-generic-fw_dynamic.elf    | Bin 620424 -> 781264 bytes
 roms/opensbi                                  |   2 +-
 5 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin b/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
index 23b4dfb3b9..ae651e2993 100644
Binary files a/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin and b/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin differ
diff --git a/pc-bios/opensbi-riscv32-generic-fw_dynamic.elf b/pc-bios/opensbi-riscv32-generic-fw_dynamic.elf
index eb9ebf5674..3250d89408 100644
Binary files a/pc-bios/opensbi-riscv32-generic-fw_dynamic.elf and b/pc-bios/opensbi-riscv32-generic-fw_dynamic.elf differ
diff --git a/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin b/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin
index 16c0cf4d0a..f039884483 100644
Binary files a/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin and b/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin differ
diff --git a/pc-bios/opensbi-riscv64-generic-fw_dynamic.elf b/pc-bios/opensbi-riscv64-generic-fw_dynamic.elf
index 642a64e240..ef261c98d1 100644
Binary files a/pc-bios/opensbi-riscv64-generic-fw_dynamic.elf and b/pc-bios/opensbi-riscv64-generic-fw_dynamic.elf differ
diff --git a/roms/opensbi b/roms/opensbi
index a98258d0b5..234ed8e427 160000
--- a/roms/opensbi
+++ b/roms/opensbi
@@ -1 +1 @@
-Subproject commit a98258d0b537a295f517bbc8d813007336731fa9
+Subproject commit 234ed8e427f4d92903123199f6590d144e0d9351
-- 
2.25.1


