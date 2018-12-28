Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gd0U2-0005fF-Qy
	for mharc-qemu-riscv@gnu.org; Fri, 28 Dec 2018 17:19:58 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gd0Tx-0005Iz-BY
	for qemu-riscv@nongnu.org; Fri, 28 Dec 2018 17:19:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gd0KJ-00089R-GW
	for qemu-riscv@nongnu.org; Fri, 28 Dec 2018 17:09:58 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37389)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jimw@sifive.com>) id 1gd0KJ-00089A-8k
	for qemu-riscv@nongnu.org; Fri, 28 Dec 2018 17:09:55 -0500
Received: by mail-pf1-x444.google.com with SMTP id y126so10954557pfb.4
	for <qemu-riscv@nongnu.org>; Fri, 28 Dec 2018 14:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=x17XQ6UQmauR8+ZZ5LTwqqaT4VVIPE+TmiRaJUTnjcM=;
	b=PPUTS78r26cJpv0wpcvBs41ar1ER6NPVwh2nd3CA/zlH9aledjp4auqKbsejZKTI4c
	rGqAh1oej+wtMI+MLOdokkUJYKBBxZYfAl+UYbNgKascB+EqWGgWxaFGkBARlhMyCh0P
	40LyLw71KViDRTH5cxl0yGXLnuKXMyqyTGJ5RYUJvTU9aNZgNrkIK0ruU9xTtx7mFWMl
	r2Tshg7Uv7B+s1PzOMJH9dT9BzRYgaJIrQLh8ZtaWfcS03WEpzwdN79L1DB45SlDTWc9
	J8+kd/UTIVN5cL4tzmw2PCaN4fR3MmYhZX5Q+P7y+srUdAfRV2WpUcI6H7ECqn6qL7NR
	CaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=x17XQ6UQmauR8+ZZ5LTwqqaT4VVIPE+TmiRaJUTnjcM=;
	b=Gyi26pR5sFKQD5nPllSqdt2sghQQZ1uxQhZ2cNT3g35ocf/ZouBlls0/TFe5TQ/z/2
	ibNCRujyTikfG5SYk5hpiaAeTx7wA/UcoKQ92wBVPCyfPGuKLJMLd26n78T6Q6HognuM
	f2vqMisnoCjNfZlV29zePBOoVQVjP/SZQCR9mPC/6Ne6aeUk+uzBAkO7suYRYcyo+rq1
	Uyw2KUYlaDZrGoMz96wfVThfgdE8yPnT43r+q5+av4NrA9zr0upTppEbYIgPQpKfuIQI
	3kVMd3iMsVJFaVGIlSmQameU6s+1OOZsgphAjViW+mJCfEJoUiksuxSWoriH9ZJ8Dqlt
	CKag==
X-Gm-Message-State: AJcUukcyKBsdFyqMZ5+VnqLTV5gauQi6l3y8PtcjBSFljITMOEMb7UlK
	7/K5BUe0nQXYNdTBxkzrPqIAdA==
X-Google-Smtp-Source: ALg8bN7MDM9AbTaUj5iHUJQ8Ofj5h9baQO6AJWHkIWxRnPAPvc+gXL6Tr4hfE6/oIKddgmg31YEEqw==
X-Received: by 2002:a63:5761:: with SMTP id h33mr27858886pgm.283.1546034994330;
	Fri, 28 Dec 2018 14:09:54 -0800 (PST)
Received: from rohan.sifive.com ([12.206.222.5])
	by smtp.gmail.com with ESMTPSA id
	t67sm78745929pfd.90.2018.12.28.14.09.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Dec 2018 14:09:53 -0800 (PST)
From: Jim Wilson <jimw@sifive.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Jim Wilson <jimw@sifive.com>
Date: Fri, 28 Dec 2018 14:09:51 -0800
Message-Id: <20181228220951.4962-1-jimw@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAFyWVaai=5K7j8w+Abpk9jxGyKuo4v9w2BgmDbY=_29+Q++Jyw@mail.gmail.com>
References: <CAFyWVaai=5K7j8w+Abpk9jxGyKuo4v9w2BgmDbY=_29+Q++Jyw@mail.gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-riscv] [PATCH 3/5 v2] RISC-V: Map gdb CSR reg numbers to hw
 reg numbers.
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
X-List-Received-Date: Fri, 28 Dec 2018 22:19:57 -0000

The gdb CSR xml file has registers in documentation order, not numerical
order, so we need a table to map the register numbers.  This also adds
some missing CSR_* register macros.

Signed-off-by: Jim Wilson <jimw@sifive.com>
---
 target/riscv/cpu_bits.h |  35 ++++++-
 target/riscv/csr-map.h  | 248 ++++++++++++++++++++++++++++++++++++++++++++++++
 target/riscv/gdbstub.c  |   1 +
 3 files changed, 282 insertions(+), 2 deletions(-)
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
index 0000000..cce32fd
--- /dev/null
+++ b/target/riscv/csr-map.h
@@ -0,0 +1,248 @@
+/*
+ * The GDB CSR xml files list them in documentation order, not numerical order,
+ * and are missing entries for unnamed CSRs.  So we need to map the gdb numbers
+ * to the hardware numbers.
+ */
+
+int csr_register_map[] = {
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


