Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWtY0-000572-My
	for mharc-qemu-riscv@gnu.org; Tue, 11 Dec 2018 20:42:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gWtLy-0001eu-6y
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 20:30:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gWtLt-000145-3k
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 20:30:20 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:33982)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jimw@sifive.com>) id 1gWtLq-00012q-Nh
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 20:30:16 -0500
Received: by mail-pf1-x443.google.com with SMTP id h3so8029787pfg.1
	for <qemu-riscv@nongnu.org>; Tue, 11 Dec 2018 17:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qU085jk4syZyh1olSQ5W0VU8BR7fc0Jrs5HxRsy2/ak=;
	b=U2tP34qMIjNdOf1Wsi5kKqkAFqQpilevN/eMOSRPQYWs3jP/DRApVxMVtid46ssKfX
	AgUhFnjoWKFJw13lODqec8EG3HEoQ4fp98enkeksmNBklkR/bRf2pRoMAGjhOI6U/nTJ
	y0DG6w53e/nIidzos7l5uQ6tGTDGW80sUeTamttsd8eArk0zC/czsdedRRC/QzmVHhQb
	wA4OUGH4m9ij+mzuhSsxvCmwCxg+TyaDa7VoYFuYqqVQL9OsZ/a1U7LhNMHMWtX3QB3j
	m5og3ssj3GClwaiNHJNh737FwvciAE2mIMS5FqRmpE7X71gACsj6MVpa0sZzngfsssU1
	r1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qU085jk4syZyh1olSQ5W0VU8BR7fc0Jrs5HxRsy2/ak=;
	b=jxERj4LcpHLvC6/9tSF/DG6vFnuc9G52Js5J+Jlr4dYWtaidJnlIzq/1ve8kXK+loV
	OH6pp7RHBD2VCsJV37rY3U+Lxbi7wcw2jYu3Yj6XZsdJ4EfCJFQIRhQIYufO4xLyahOg
	5Y9prV9dZoNy5yH10nG3Gdm33P8BfB6tGonOC9DRX4405UR7kqeVhdqan86CzB1xQ2XU
	7XEdFJpgK7z45g3u/z29JrX87NiwXOFq0IPp25g1BVMbaWOevgfzng5YsXyvukVZL1Tf
	8ODRHbcixaTIabxWaS/k4Va4InI/H5C1uUwz0DCipRMyM9Ea0FcCPsdbZQ+r15Tnav72
	N8lg==
X-Gm-Message-State: AA+aEWZUzjtVVADul9SCHVkU2KoiFM/vrdsBCF2amCqLunOYu4uuudk0
	09blu5i7Y6mFuT1Xt58yp/zbgDgIFpzfQA==
X-Google-Smtp-Source: AFSGD/VQtunl65afQnWZzllx6alvQrzf58qJLC+himBpzwwQZf3OUI3oUqt+TmcaPoxUBXaaG0MLYg==
X-Received: by 2002:a63:db48:: with SMTP id x8mr16105695pgi.365.1544578213296; 
	Tue, 11 Dec 2018 17:30:13 -0800 (PST)
Received: from rohan.hsd1.ca.comcast.net
	([2601:646:c100:8240:316a:e169:23a5:398])
	by smtp.gmail.com with ESMTPSA id
	u186sm22946955pfu.51.2018.12.11.17.30.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Dec 2018 17:30:12 -0800 (PST)
From: Jim Wilson <jimw@sifive.com>
To: qemu-riscv@nongnu.org
Cc: Jim Wilson <jimw@sifive.com>
Date: Tue, 11 Dec 2018 17:30:08 -0800
Message-Id: <20181212013008.3713-1-jimw@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAFyWVaYFqbGoGkksxYKDJZejOhGOSk6qkEcRm4J4YDwG-pYN=A@mail.gmail.com>
References: <CAFyWVaYFqbGoGkksxYKDJZejOhGOSk6qkEcRm4J4YDwG-pYN=A@mail.gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
X-Mailman-Approved-At: Tue, 11 Dec 2018 20:42:42 -0500
Subject: [Qemu-riscv] [PATCH 3/5] RISC-V: Map gdb CSR reg numbers to hw reg
 numbers.
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Dec 2018 01:30:25 -0000

The gdb CSR xml file has registers in documentation order, not numerical
order, so we need a table to map the register numbers.  This also adds
some missing CSR_* register macros.

Signed-off-by: Jim Wilson <jimw@sifive.com>
---
 target/riscv/cpu_bits.h |  35 ++++++-
 target/riscv/csr-map.h  | 247 ++++++++++++++++++++++++++++++++++++++++++++++++
 target/riscv/gdbstub.c  |   1 +
 3 files changed, 281 insertions(+), 2 deletions(-)
 create mode 100644 target/riscv/csr-map.h

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 5439f47..316d500 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -135,16 +135,22 @@
 /* Legacy Counter Setup (priv v1.9.1) */
 #define CSR_MUCOUNTEREN     0x320
 #define CSR_MSCOUNTEREN     0x321
+#define CSR_MHCOUNTEREN     0x322
 
 /* Machine Trap Handling */
 #define CSR_MSCRATCH        0x340
 #define CSR_MEPC            0x341
 #define CSR_MCAUSE          0x342
-#define CSR_MBADADDR        0x343
+#define CSR_MTVAL           0x343
 #define CSR_MIP             0x344
 
+/* Legacy Machine Trap Handling (priv v1.9.1) */
+#define CSR_MBADADDR        0x343
+
 /* Supervisor Trap Setup */
 #define CSR_SSTATUS         0x100
+#define CSR_SEDELEG         0x102
+#define CSR_SIDELEG         0x103
 #define CSR_SIE             0x104
 #define CSR_STVEC           0x105
 #define CSR_SCOUNTEREN      0x106
@@ -153,9 +159,12 @@
 #define CSR_SSCRATCH        0x140
 #define CSR_SEPC            0x141
 #define CSR_SCAUSE          0x142
-#define CSR_SBADADDR        0x143
+#define CSR_STVAL           0x143
 #define CSR_SIP             0x144
 
+/* Legacy Supervisor Trap Handling (priv v1.9.1) */
+#define CSR_SBADADDR        0x143
+
 /* Supervisor Protection and Translation */
 #define CSR_SPTBR           0x180
 #define CSR_SATP            0x180
@@ -282,6 +291,28 @@
 #define CSR_MHPMCOUNTER30H  0xb9e
 #define CSR_MHPMCOUNTER31H  0xb9f
 
+/* Legacy Hypervisor Trap Setup (priv v1.9.1) */
+#define CSR_HSTATUS         0x200
+#define CSR_HEDELEG         0x202
+#define CSR_HIDELEG         0x203
+#define CSR_HIE             0x204
+#define CSR_HTVEC           0x205
+
+/* Legacy Hypervisor Trap Handling (priv v1.9.1) */
+#define CSR_HSCRATCH        0x240
+#define CSR_HEPC            0x241
+#define CSR_HCAUSE          0x242
+#define CSR_HBADADDR        0x243
+#define CSR_HIP             0x244
+
+/* Legacy Machine Protection and Translation (priv v1.9.1) */
+#define CSR_MBASE           0x380
+#define CSR_MBOUND          0x381
+#define CSR_MIBASE          0x382
+#define CSR_MIBOUND         0x383
+#define CSR_MDBASE          0x384
+#define CSR_MDBOUND         0x385
+
 /* mstatus CSR bits */
 #define MSTATUS_UIE         0x00000001
 #define MSTATUS_SIE         0x00000002
diff --git a/target/riscv/csr-map.h b/target/riscv/csr-map.h
new file mode 100644
index 0000000..f172479
--- /dev/null
+++ b/target/riscv/csr-map.h
@@ -0,0 +1,247 @@
+/* The GDB CSR xml files list them in documentation order, not numerical order,
+   and are missing entries for unnamed CSRs.  So we need to map the gdb numbers
+   to the hardware numbers.  */
+
+int csr_register_map[] =
+{
+    CSR_USTATUS,
+    CSR_UIE,
+    CSR_UTVEC,
+    CSR_USCRATCH,
+    CSR_UEPC,
+    CSR_UCAUSE,
+    CSR_UTVAL,
+    CSR_UIP,
+    CSR_FFLAGS,
+    CSR_FRM,
+    CSR_FCSR,
+    CSR_CYCLE,
+    CSR_TIME,
+    CSR_INSTRET,
+    CSR_HPMCOUNTER3,
+    CSR_HPMCOUNTER4,
+    CSR_HPMCOUNTER5,
+    CSR_HPMCOUNTER6,
+    CSR_HPMCOUNTER7,
+    CSR_HPMCOUNTER8,
+    CSR_HPMCOUNTER9,
+    CSR_HPMCOUNTER10,
+    CSR_HPMCOUNTER11,
+    CSR_HPMCOUNTER12,
+    CSR_HPMCOUNTER13,
+    CSR_HPMCOUNTER14,
+    CSR_HPMCOUNTER15,
+    CSR_HPMCOUNTER16,
+    CSR_HPMCOUNTER17,
+    CSR_HPMCOUNTER18,
+    CSR_HPMCOUNTER19,
+    CSR_HPMCOUNTER20,
+    CSR_HPMCOUNTER21,
+    CSR_HPMCOUNTER22,
+    CSR_HPMCOUNTER23,
+    CSR_HPMCOUNTER24,
+    CSR_HPMCOUNTER25,
+    CSR_HPMCOUNTER26,
+    CSR_HPMCOUNTER27,
+    CSR_HPMCOUNTER28,
+    CSR_HPMCOUNTER29,
+    CSR_HPMCOUNTER30,
+    CSR_HPMCOUNTER31,
+    CSR_CYCLEH,
+    CSR_TIMEH,
+    CSR_INSTRETH,
+    CSR_HPMCOUNTER3H,
+    CSR_HPMCOUNTER4H,
+    CSR_HPMCOUNTER5H,
+    CSR_HPMCOUNTER6H,
+    CSR_HPMCOUNTER7H,
+    CSR_HPMCOUNTER8H,
+    CSR_HPMCOUNTER9H,
+    CSR_HPMCOUNTER10H,
+    CSR_HPMCOUNTER11H,
+    CSR_HPMCOUNTER12H,
+    CSR_HPMCOUNTER13H,
+    CSR_HPMCOUNTER14H,
+    CSR_HPMCOUNTER15H,
+    CSR_HPMCOUNTER16H,
+    CSR_HPMCOUNTER17H,
+    CSR_HPMCOUNTER18H,
+    CSR_HPMCOUNTER19H,
+    CSR_HPMCOUNTER20H,
+    CSR_HPMCOUNTER21H,
+    CSR_HPMCOUNTER22H,
+    CSR_HPMCOUNTER23H,
+    CSR_HPMCOUNTER24H,
+    CSR_HPMCOUNTER25H,
+    CSR_HPMCOUNTER26H,
+    CSR_HPMCOUNTER27H,
+    CSR_HPMCOUNTER28H,
+    CSR_HPMCOUNTER29H,
+    CSR_HPMCOUNTER30H,
+    CSR_HPMCOUNTER31H,
+    CSR_SSTATUS,
+    CSR_SEDELEG,
+    CSR_SIDELEG,
+    CSR_SIE,
+    CSR_STVEC,
+    CSR_SCOUNTEREN,
+    CSR_SSCRATCH,
+    CSR_SEPC,
+    CSR_SCAUSE,
+    CSR_STVAL,
+    CSR_SIP,
+    CSR_SATP,
+    CSR_MVENDORID,
+    CSR_MARCHID,
+    CSR_MIMPID,
+    CSR_MHARTID,
+    CSR_MSTATUS,
+    CSR_MISA,
+    CSR_MEDELEG,
+    CSR_MIDELEG,
+    CSR_MIE,
+    CSR_MTVEC,
+    CSR_MCOUNTEREN,
+    CSR_MSCRATCH,
+    CSR_MEPC,
+    CSR_MCAUSE,
+    CSR_MTVAL,
+    CSR_MIP,
+    CSR_PMPCFG0,
+    CSR_PMPCFG1,
+    CSR_PMPCFG2,
+    CSR_PMPCFG3,
+    CSR_PMPADDR0,
+    CSR_PMPADDR1,
+    CSR_PMPADDR2,
+    CSR_PMPADDR3,
+    CSR_PMPADDR4,
+    CSR_PMPADDR5,
+    CSR_PMPADDR6,
+    CSR_PMPADDR7,
+    CSR_PMPADDR8,
+    CSR_PMPADDR9,
+    CSR_PMPADDR10,
+    CSR_PMPADDR11,
+    CSR_PMPADDR12,
+    CSR_PMPADDR13,
+    CSR_PMPADDR14,
+    CSR_PMPADDR15,
+    CSR_MCYCLE,
+    CSR_MINSTRET,
+    CSR_MHPMCOUNTER3,
+    CSR_MHPMCOUNTER4,
+    CSR_MHPMCOUNTER5,
+    CSR_MHPMCOUNTER6,
+    CSR_MHPMCOUNTER7,
+    CSR_MHPMCOUNTER8,
+    CSR_MHPMCOUNTER9,
+    CSR_MHPMCOUNTER10,
+    CSR_MHPMCOUNTER11,
+    CSR_MHPMCOUNTER12,
+    CSR_MHPMCOUNTER13,
+    CSR_MHPMCOUNTER14,
+    CSR_MHPMCOUNTER15,
+    CSR_MHPMCOUNTER16,
+    CSR_MHPMCOUNTER17,
+    CSR_MHPMCOUNTER18,
+    CSR_MHPMCOUNTER19,
+    CSR_MHPMCOUNTER20,
+    CSR_MHPMCOUNTER21,
+    CSR_MHPMCOUNTER22,
+    CSR_MHPMCOUNTER23,
+    CSR_MHPMCOUNTER24,
+    CSR_MHPMCOUNTER25,
+    CSR_MHPMCOUNTER26,
+    CSR_MHPMCOUNTER27,
+    CSR_MHPMCOUNTER28,
+    CSR_MHPMCOUNTER29,
+    CSR_MHPMCOUNTER30,
+    CSR_MHPMCOUNTER31,
+    CSR_MCYCLEH,
+    CSR_MINSTRETH,
+    CSR_MHPMCOUNTER3H,
+    CSR_MHPMCOUNTER4H,
+    CSR_MHPMCOUNTER5H,
+    CSR_MHPMCOUNTER6H,
+    CSR_MHPMCOUNTER7H,
+    CSR_MHPMCOUNTER8H,
+    CSR_MHPMCOUNTER9H,
+    CSR_MHPMCOUNTER10H,
+    CSR_MHPMCOUNTER11H,
+    CSR_MHPMCOUNTER12H,
+    CSR_MHPMCOUNTER13H,
+    CSR_MHPMCOUNTER14H,
+    CSR_MHPMCOUNTER15H,
+    CSR_MHPMCOUNTER16H,
+    CSR_MHPMCOUNTER17H,
+    CSR_MHPMCOUNTER18H,
+    CSR_MHPMCOUNTER19H,
+    CSR_MHPMCOUNTER20H,
+    CSR_MHPMCOUNTER21H,
+    CSR_MHPMCOUNTER22H,
+    CSR_MHPMCOUNTER23H,
+    CSR_MHPMCOUNTER24H,
+    CSR_MHPMCOUNTER25H,
+    CSR_MHPMCOUNTER26H,
+    CSR_MHPMCOUNTER27H,
+    CSR_MHPMCOUNTER28H,
+    CSR_MHPMCOUNTER29H,
+    CSR_MHPMCOUNTER30H,
+    CSR_MHPMCOUNTER31H,
+    CSR_MHPMEVENT3,
+    CSR_MHPMEVENT4,
+    CSR_MHPMEVENT5,
+    CSR_MHPMEVENT6,
+    CSR_MHPMEVENT7,
+    CSR_MHPMEVENT8,
+    CSR_MHPMEVENT9,
+    CSR_MHPMEVENT10,
+    CSR_MHPMEVENT11,
+    CSR_MHPMEVENT12,
+    CSR_MHPMEVENT13,
+    CSR_MHPMEVENT14,
+    CSR_MHPMEVENT15,
+    CSR_MHPMEVENT16,
+    CSR_MHPMEVENT17,
+    CSR_MHPMEVENT18,
+    CSR_MHPMEVENT19,
+    CSR_MHPMEVENT20,
+    CSR_MHPMEVENT21,
+    CSR_MHPMEVENT22,
+    CSR_MHPMEVENT23,
+    CSR_MHPMEVENT24,
+    CSR_MHPMEVENT25,
+    CSR_MHPMEVENT26,
+    CSR_MHPMEVENT27,
+    CSR_MHPMEVENT28,
+    CSR_MHPMEVENT29,
+    CSR_MHPMEVENT30,
+    CSR_MHPMEVENT31,
+    CSR_TSELECT,
+    CSR_TDATA1,
+    CSR_TDATA2,
+    CSR_TDATA3,
+    CSR_DCSR,
+    CSR_DPC,
+    CSR_DSCRATCH,
+    CSR_HSTATUS,
+    CSR_HEDELEG,
+    CSR_HIDELEG,
+    CSR_HIE,
+    CSR_HTVEC,
+    CSR_HSCRATCH,
+    CSR_HEPC,
+    CSR_HCAUSE,
+    CSR_HBADADDR,
+    CSR_HIP,
+    CSR_MBASE,
+    CSR_MBOUND,
+    CSR_MIBASE,
+    CSR_MIBOUND,
+    CSR_MDBASE,
+    CSR_MDBOUND,
+    CSR_MUCOUNTEREN,
+    CSR_MSCOUNTEREN,
+    CSR_MHCOUNTEREN,
+};
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 4f919b6..71c3eb1 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -20,6 +20,7 @@
 #include "qemu-common.h"
 #include "exec/gdbstub.h"
 #include "cpu.h"
+#include "csr-map.h"
 
 int riscv_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
-- 
2.7.4


