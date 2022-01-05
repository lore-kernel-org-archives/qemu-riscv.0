Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4vZ6-0001N9-OW
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 20:58:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4vZ2-0001KS-3p; Tue, 04 Jan 2022 20:58:09 -0500
Received: from [2607:f8b0:4864:20::635] (port=36592
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4vYy-0006UY-Dm; Tue, 04 Jan 2022 20:58:07 -0500
Received: by mail-pl1-x635.google.com with SMTP id p14so28282619plf.3;
 Tue, 04 Jan 2022 17:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F17EinHZtTfDwj7QFmAyvip3X2c21fUQQH9RrWMK5IQ=;
 b=P1CxRoAGhsNKBRW2l3LO4eA43xe2WMLnkCrqhlPWFrJSlteqgMvph6RocKtXDlwT45
 24+rbPkV5IH5coDri4bZwF8G9Z4KNDK73dks/mVlpB4HygtGr/lcZULkujda7Dv787aq
 90tsl8fQeo0FrHNsAGcjXySDpIcCApTzoi6JWfve8LuEiPJHiGwpXCmsDIenT0KXi+8A
 ZD1gV8+PS4HY9YYsUy9IRG7AqUaHjgbBflRkK/Oa02+wIboIX83YaV6yfrKL42NSueQE
 3dPDdC56vjMVHsYjDcIEcEdhtRIGhYvilGvvDsobvA7hiqFCa1SIN2dGeWKwmUpn8OW+
 51eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F17EinHZtTfDwj7QFmAyvip3X2c21fUQQH9RrWMK5IQ=;
 b=GD/ImGCetFOIaevduXCmg/KCi5be8KJRwseItkpnqowEyB2lMoP1Jn8WJZoqymPy/j
 J3pA/1GnthFDUL/lWfqP6akP141raysXoK2JJTmxFhUJBhPr9NBrPrNBCnjjoctKs1FH
 F09lBNTwwuT+XCn0+E6NmzLOgpV09DX5lk6eFkXr7hro3YgToYgGQCI2tB8KPy9TRUEz
 8VNJmpQ9IpnXr1qAYUBKv4uyJcBiFRTJKS5/dpEFoa1xlQRBI4i7fnTqWInKfqf4glAg
 Fn8xkqmOKDggTJllnIW/ufY6D83F2ERY7Hrdz3eJVSjeiz8kKKhQxRacd38a0kw43Ufa
 lZSA==
X-Gm-Message-State: AOAM531YfKk6AcwXKeSrpr+Y2KnzK1TNlrx7GmFtQ9bPwGsvWxw/mXdp
 ThcmmyXjGnB3y+XayuWh/K4=
X-Google-Smtp-Source: ABdhPJy6nAqi9SXVVCphLgMWuIC4cWdn/qyaC8GvxmgoldBgExn7oGqf1kxAsUDhJEV26BcgxyVj5w==
X-Received: by 2002:a17:90a:d984:: with SMTP id
 d4mr1396156pjv.207.1641347877615; 
 Tue, 04 Jan 2022 17:57:57 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id l145sm42849956pfd.117.2022.01.04.17.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 17:57:57 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH] roms/opensbi: Upgrade from v0.9 to v1.0
Date: Wed,  5 Jan 2022 09:57:52 +0800
Message-Id: <20220105015752.752517-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 05 Jan 2022 01:58:11 -0000

Upgrade OpenSBI from v0.9 to v1.0 and the pre-built bios images.

The v1.0 release includes the following commits:

ec5274b platform: implement K210 system reset
5487cf0 include: sbi: Simplify HSM state define names
8df1f9a lib: sbi: Use SBI_HSM_STATE_xyz defines instead of SBI_STATE_xyz defines
7c867fd lib: sbi: Rename sbi_hsm_hart_started_mask() function
638c948 lib: sbi: Remove redundant sbi_hsm_hart_started() function
ca864a9 lib: sbi: Fix error codes returned by HSM start() and stop() functions
6290a22 include: sbi: Add HSM suspend related defines
4b05df6 lib: sbi: Add sbi_hart_reinit() function
807d71c include: sbi: Add hart_suspend() platform callback
7475689 lib: sbi: Implement SBI HSM suspend function
b9cf617 include: sbi: Upgrade SBI implementation version to v0.3
50d4fde lib: Remove redundant sbi_platform_ipi_clear() calls
ff5bd94 include: sbi: SBI function IDs for RFENCE extension
22d8ee9 firmware: Use lla to access all global symbols
0f20e8a firmware: Support position independent execution
ddad02d lib: sbi: illegal CSR 0x306 access in hpm_allowed()
bfc85c7 include: headers: Replace __ASSEMBLY__ with __ASSEMBLER__
9190ad1 lib/utils: Support the official clint DT bindings
ca3f358 lib/utils: Drop the 'compat' parameter of fdt_plic_fixup()
4edc822 lib/utils: Support fixing up the official DT bindings of PLIC
4ef2f5d firware: optimize the exception exit code
3d8a952 lib: fix csr detect support
e71a7c1 firmware: Remove redundant add instruction from trap restore path
d4a94ea include: types: Add __aligned(x) to define the minimum alignement
d0e406f include: sbi: Allow direct initialization via SPIN_LOCK_INIT()
4d8e2f1 lib: sbi: Replace test-and-set locks by ticket locks
70ffc3e lib: sbi: fix atomic_add_return
27a16b1 docs: fix link to OpenPiton documentation
b1df1ac lib: sbi: Domains can be registered only before finalizing domains
7495bce lib: sbi: Add sbi_domain_memregion_init() API
4dc0001 lib: sbi: Add sbi_domain_root_add_memregion() API
8b56980 lib: utils/sys: Add CLINT memregion in the root domain
fc37c97 lib: sbi: Make the root domain instance global variable
e7e4bcd lib: utils: Copy over restricted root domain memregions to FDT domains
f41196a lib: sbi: Make sbi_domain_memregion_initfw() a local function
c5d0645 lib: utils: Implement "64bit-mmio" property parsing
49e422c lib: utils: reset: Add T-HEAD sample platform reset driver
0d56293 lib: sbi: Fix sbi_domain_root_add_memregion() for merging memregions
bf3ef53 firmware: Enable FW_PIC by default
1db8436 platform: Remove platform/thead
6d1642f docs: generic: Add T-HEAD C9xx series processors
a3689db lib: sbi: Remove domains_root_regions() platform callback
068ca08 lib: sbi: Simplify console platform operations
559a8f1 lib: sbi: Simplify timer platform operations
dc39c7b lib: sbi: Simplify ipi platform operations
043d088 lib: sbi: Simplify system reset platform operations
a84a1dd lib: sbi: Simplify HSM platform operations
e9a27ab lib: sbi: Show devices provided by platform in boot prints
632e27b docs/platform: sifive_fu540: Update U-Boot defconfig name
117fb6d lib: utils/serial: Add support for Gaisler APBUART
552f53f docs: platform: Sort platform names
d4177e7 docs: platform: Describe sifive_fu540 as supported generic platform
26998f3 platform: Remove sifive/fu540 platform
f90c4c2 lib: sbi: Have spinlock checks return bool
e822b75 lib: utils/serial: Support Synopsys DesignWare APB UART
6139ab2 Makefile: unconditionally disable SSP
c9ef2bc lib: utils: Add strncpy macro to libfdt_env.h
ee7c2b2 lib: utils/fdt: Don't use sbi_string functions
fe92347 lib: utils/fdt: Replace strcmp with strncmp
b2dbbc0 lib: Check region base for merging in sbi_domain_root_add_memregion()
54d7def lib: utils: Try other FDT drivers when we see SBI_ENODEV
d9ba653 docs: debugging OpenSBI
66c4fca lib: utils: consider ':' in stdout-path
f30b189 lib: sbi_scratch: remove owner from sbi_scratch_alloc_offset
a03ea2e platform: andes/ae350: Cosmetic fixes in plicsw.c
b32fac4 docs/platform: andes-ae350: Fix missing spaces
de446cc platform: andes/ae350: Drop plicsw_get_pending()
434198e platform: andes/ae350: Drop plicsw_ipi_sync()
1da3d80 lib: sbi_scratch: zero out scratch memory on all harts
360ab88 lib: utils: missing initialization in thead_reset_init
79f9b42 lib: sbi: Fix GET_F64_REG inline assembly
eb90e0a lib: utils/libfdt: Upgrade to v1.6.1 release
cdcf907 lib: sign conflict in sbi_tlb_entry_process()
9901794 lib: sign conflict in wake_coldboot_harts()
11c345f lib: simplify sbi_fifo_inplace_update()
4519e29 lib: utils/timer: Add ACLINT MTIMER library
5a049fe lib: utils/ipi: Add ACLINT MSWI library
bd5d208 lib: utils: Add FDT parsing API common for both ACLINT and CLINT
56fc5f7 lib: utils/ipi: Add FDT based ACLINT MSWI IPI driver
03d6bb5 lib: utils/timer: Add FDT based ACLINT MTIMER driver
a731c7e platform: Replace CLINT library usage with ACLINT library
b7f2cd2 lib: utils: reset: unify naming of 'sifive_test' device
197e089 docs/platform: thead-c9xx: Remove FW_PIC=y
17e23b6 platform: generic: Terminate platform.name with null
3e8b31a docs: Add device tree bindings for SBI PMU extension
fde28fa lib: sbi: Detect mcountinihibit support at runtime
d3a96cc lib: sbi: Remove stray '\' character
0829f2b lib: sbi: Detect number of bits implemented in mhpmcounter
9c9b4ad lib: sbi: Disable m/scounteren & enable mcountinhibit
41ae63c include: Add a list empty check function
fd9116b lib: sbi: Remove redundant boot time print statement
49966db lib: sbi: Use csr_read/write_num to read/update PMU counters
e7cc7a3 lib: sbi: Add PMU specific platform hooks
13d40f2 lib: sbi: Add PMU support
ae72ec0 utils: fdt: Add fdt helper functions to parse PMU DT nodes
37f9b0f lib: sbi: Implement SBI PMU extension
764a17d lib: sbi: Implement firmware counters
ec1b8bb lib: sbi: Improve TLB function naming
0e12aa8 platform: generic: Add PMU support
14c7f71 firmware: Minor optimization in _scratch_init()
dafaa0f docs: Correct a typo in platform_guide.md
abfce9b docs: Make <xyz> visible in the rendered platform guide
dcb756b firmware: Remove the sanity checks in fw_save_info()
b88b366 firmware: Define a macro for version of struct fw_dynamic_info
a76ac44 lib: sbi: Fix sbi_pmu_exit() for systems not having MCOUNTINHIBIT csr
7f1be8a fw_base: Don't mark fw_platform_init as both global and weak
397afe5 fw_base: Put data in .data rather than .text
a3d328a firmware: Explicitly pass -pie to the linker, not just the driver
09ad811 firmware: Only default FW_PIC to y if supported
2942777 Makefile: Support building with Clang and LLVM binutils
17729d4 lib: utils: Drop dependency on libgcc by importing part of FreeBSD's libquad
e931f38 lib: utils/fdt: Add fdt_parse_phandle_with_args() API
36b8eff lib: utils/gpio: Add generic GPIO configuration library
c14f1fe lib: utils/gpio: Add simple FDT based GPIO framework
4c3df2a lib: utils/gpio: Add minimal SiFive GPIO driver
e3d6919 lib: utils/reset: Add generic GPIO reset driver
7210e90 firmware: use __SIZEOF_LONG__ for field offsets in fw_dynamic.h
f3a8f60 include: types: Use __builtin_offsetof when supported
8a1475b firmware: Remove the unhelpful alignment codes before fdt relocation
a4555e5 docs: Document parameters passed to firmware and alignment requirement
2c74dc3 docs: Document FW_PIC compile time option
81eb708 README: Update toolchain information
9890391 Makefile: Manually forward RELAX_FLAG to the assembler when linking with LLD
74db0ac firmware: use _fw_start for load address
217d5e4 generic: fu740: add workaround for CIP-1200 errata
ce03c88 lib: utils: remove unused variable in fdt_reset_init
e928472 lib: utils: support both of gpio-poweroff, gpio-reset
d244f3d lib: sbi: Fix bug in strncmp function when count is 0
47a4765 lib: utils/fdt: Change addr and size to uint64_t
e0d1b9d lib: utils/timer: Allow separate base addresses for MTIME and MTIMECMP
7a3a0cc lib: utils: Extend fdt_get_node_addr_size() for multiple register sets
f3a0eb8 lib: utils/fdt: Extend fdt_parse_aclint_node() function
b35f782 lib: utils/timer: Allow ACLINT MTIMER supporting only 32-bit MMIO
7aa6c9a lib: utils/timer: Simplify MTIMER synchronization
33eac76 lib: sbi: Fix bug in sbi_ecall_rfence that misses checking
ee27437 lib: sbi_trap: Restore redirect for access faults
b1d3e91 payloads/test: Add support for SBI v0.2 ecalls
bd316e2 lib: sbi: Correct typo in faults delegation CSR name
c262306 lib: sbi: protect dprintf output with spinlock
1718b16 lib: sbi: Checking fifo validness in sbi_fifo_is_empty and is_full
bd35521 lib: sbi: Refine the way to construct platform features
0274a96 lib: utils/reset: Sort fdt_reset driver list
395ff7e lib: utils/reset: Add a sunxi watchdog reset driver
3477f08 lib: sbi: fix ctz bug
12753d2 lib: sbi: add some macros to detect BUG at runtime
51113fe lib: sbi: Add BUG() macro for csr_read/write_num() and misa_string()
72154f4 lib: utils/fdt: Add fdt_parse_timebase_frequency() function
12e7af9 lib: sbi: Add timer frequency to struct sbi_timer_device
6355155 lib: sbi: Print timer frequency at boot time
9d0ab35 lib: sbi: Add generic timer delay loop function
fa59dd3 lib: utils/reset: use sbi_timer_mdelay() in gpio reset driver
754d511 lib: utils: identify supported GPIO reset methods
516161c lib: sbi: convert reset to list
9283d50 lib: sbi: add priority for reset handler
c38973e lib: sbi: Save context for all non-retentive suspend types
67cbbcb lib: sbi: system reset with invalid parameters
422eda4 Makefile: Add build time and compiler info string
78c2b19 lib: utils/irqchip: Automatically delegate T-HEAD PLIC access
309e8bd lib: utils/reset: Register separate GPIO system reset devices
723aa88 lib: sbi: Refine addr format in sbi_printf
c891acc include: sbi_utils: Introduce an helper to get fdt base address
013ba4e lib: sbi: Fix GPA passed to __sbi_hfence_gvma_xyz() functions
0979ffd lib: utils/gpio: use list for drivers
2fe2f55 lib: sbi: move sbi_boot_print_general()
57f094e platform: generic: move fdt_reset_init to final_init
be245ac lib: sbi: error handling in fdt_reset_init()
a74daf2 riscv: Add new CSRs introduced by Sscofpmf[1] extension
7084ad9 lib: sbi: Update csr_read/write_num for PMU
867c653 lib: sbi: Detect Sscofpmf extension at run time
9134c36 lib: sbi: Delegate PMU counter overflow interrupt to S mode
730f01b lib: sbi: Support sscofpmf extension in OpenSBI
2363f95 lib: sbi: Always enable access for all counters
0c304b6 lib: sbi: Allow programmable counters to monitor cycle/instret events
1e14732 lib: sbi: Reset the mhpmevent value upon counter reset
b628cfd lib: sbi: Counter info width should be zero indexed
b28f070 lib: sbi: Enable PMU extension for platforms without mcountinhibit
15906a3 lib: utils: Rename the prefix in PMU DT properties
b8845e4 lib: sbi: Fix initial value mask while updating the counters
31fe5a7 lib: sbi: Fix PMP address bits detection
94eba23 lib: utils/reset: add priority to gpio reset
1d462e0 lib: utils/reset: separate driver init func
2c964a2 lib: utils/i2c: Add generic I2C configuration library
6ca6bca lib: utils/i2c: Add simple FDT based I2C framework
13a1158 lib: utils/i2c: Add minimal SiFive I2C driver
f374496 platform: sifive_fu740: add platform reset driver
d335a17 lib: sbi: clear pmpcfg.A before setting in pmp_set()
52af6e4 lib: utils: Add LiteX UART support
22d556d lib: sbi: Fix spelling of "address" in sbi_domain.c
7a22c78 lib: sbi: Fix missing space
7e77706 lib: sbi: Resolve the uninitialized complaint in sbi_pmu
14faee6 lib: sbi: Improve fatal error handling
2428987 lib: pmu: support the event ID encoded by a bitmap.
66fbcc0 docs/platform: spike: Enhance Spike examples
460041c lib: pmu: check SSCOF before masking
69d7e53 Makefile: Fix -msave-restore compile warning with CLANG-10 (or lower)
d249d65 lib: sbi: Fix compile errors using -Os option
f270359 Makefile: Improve the method to disable -m(no-)save-restore option
2082153 lib: sbi: simplify pmp_set(), pmp_get()
d30bde3 firmware: Move memcpy/memset mapping to fw_base.S
48f91ee include: Bump-up version to 1.0

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---
please pull the full contents from https://github.com/lbmeng/qemu/
opensbi branch

 .../opensbi-riscv32-generic-fw_dynamic.bin    | Bin 78680 -> 108504 bytes
 .../opensbi-riscv32-generic-fw_dynamic.elf    | Bin 727464 -> 838904 bytes
 .../opensbi-riscv64-generic-fw_dynamic.bin    | Bin 75096 -> 105296 bytes
 .../opensbi-riscv64-generic-fw_dynamic.elf    | Bin 781264 -> 934696 bytes
 roms/opensbi                                  |   2 +-
 5 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin b/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
index ae651e2993..dba8e8655f 100644
Binary files a/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin and b/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin differ
diff --git a/pc-bios/opensbi-riscv32-generic-fw_dynamic.elf b/pc-bios/opensbi-riscv32-generic-fw_dynamic.elf
index 3250d89408..a19363e27c 100644
Binary files a/pc-bios/opensbi-riscv32-generic-fw_dynamic.elf and b/pc-bios/opensbi-riscv32-generic-fw_dynamic.elf differ
diff --git a/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin b/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin
index f039884483..f223e56991 100644
Binary files a/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin and b/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin differ
diff --git a/pc-bios/opensbi-riscv64-generic-fw_dynamic.elf b/pc-bios/opensbi-riscv64-generic-fw_dynamic.elf
index ef261c98d1..c59573d026 100644
Binary files a/pc-bios/opensbi-riscv64-generic-fw_dynamic.elf and b/pc-bios/opensbi-riscv64-generic-fw_dynamic.elf differ
diff --git a/roms/opensbi b/roms/opensbi
index 234ed8e427..48f91ee9c9 160000
--- a/roms/opensbi
+++ b/roms/opensbi
@@ -1 +1 @@
-Subproject commit 234ed8e427f4d92903123199f6590d144e0d9351
+Subproject commit 48f91ee9c960f048c4a7d1da4447d31e04931e38
-- 
2.25.1


