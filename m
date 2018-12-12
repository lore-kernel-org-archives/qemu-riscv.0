Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWtY0-00056x-Jd
	for mharc-qemu-riscv@gnu.org; Tue, 11 Dec 2018 20:42:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gWtLT-0001ch-9m
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 20:29:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gWtLQ-0000si-SL
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 20:29:51 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:38232)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jimw@sifive.com>) id 1gWtLQ-0000sO-J4
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 20:29:48 -0500
Received: by mail-pg1-x541.google.com with SMTP id g189so7515893pgc.5
	for <qemu-riscv@nongnu.org>; Tue, 11 Dec 2018 17:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bVcRI7e5aNy6OUDWORsFH1hY3U1+ibFYIrDFXmwA4b4=;
	b=eZwboXaxVTfj9ycII3sc1HnQmLoxiBMiNVrm6I7Zevq+1deFxHfigke10kQ8fY+icb
	U2SEDyyBwMASpzn2jrSrJkBUKjrCHbQ1iv4voFqCBFDWr0/Mj3wyczaMKyQj5MJ9euAf
	SYFTLDMLkXTXiX7C+NjL4k08rLJ0oKUIOawKgCq5i9G7AEu01or03cuO3UYwp5sSAdJg
	OqOusmkL60kr2mO+YMHlvlClSuLZyAcSbY/wqAZuvaVXmdBOAoKufYZDNFPC4CE9kDu3
	JlvZPez+rzl9t8D2ZwmRnEseQ5g1rKlte+i6DeOHFYSkbcgC1juB1sNJ4dcPbRbp6SjQ
	h5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bVcRI7e5aNy6OUDWORsFH1hY3U1+ibFYIrDFXmwA4b4=;
	b=IwC2LgkC1qZyQG7AdbObD6x3PIio+0EIz3ceFm3clMgHjFY5ULoa2Or7/KH44g8Bye
	9ZMdGRdIkexbVQHkBk+7Z53ozoTy8kHq3YkMgQCY1qLtPI4YrKoIMRJ7jfS313zlAwKk
	Tjb5sE7Lz2QCwaAVnpKOFbqHkWHSnBqLPcVXGi5NH0EBtO1rhjaI7fXFduGneZOwsKVl
	JezXfBYfJYD51jC/TJOm41GvwNAFkfh5RAKBpTNFGAeuHt8Qq2eglZQcOLAkTn7FIA43
	uUGt6ex4mXOX/uI1xveaKoo9tCtyCFZsvTILiRy26LwmiW0T00gte41aHp9SjH4ZzAEJ
	owCg==
X-Gm-Message-State: AA+aEWaQ/690l0IaX/Mntfj8k0IHPDxekmaxg5v0JdHxNJezHtI1avc3
	RnsOjQnRwtz3b9Ea8CXrsr4iAUTA9RNkXg==
X-Google-Smtp-Source: AFSGD/Udtnbwn4UHw/0HMbJ40ksAb0Q66nfMK4TjtJUvm2IScSKG5FDF3DlLsb6xl80GsMbL5xm9+g==
X-Received: by 2002:a62:3305:: with SMTP id z5mr18863082pfz.112.1544578187322; 
	Tue, 11 Dec 2018 17:29:47 -0800 (PST)
Received: from rohan.hsd1.ca.comcast.net
	([2601:646:c100:8240:316a:e169:23a5:398])
	by smtp.gmail.com with ESMTPSA id
	e128sm21100735pfe.67.2018.12.11.17.29.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Dec 2018 17:29:46 -0800 (PST)
From: Jim Wilson <jimw@sifive.com>
To: qemu-riscv@nongnu.org
Cc: Jim Wilson <jimw@sifive.com>
Date: Tue, 11 Dec 2018 17:29:42 -0800
Message-Id: <20181212012942.3657-1-jimw@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAFyWVaYFqbGoGkksxYKDJZejOhGOSk6qkEcRm4J4YDwG-pYN=A@mail.gmail.com>
References: <CAFyWVaYFqbGoGkksxYKDJZejOhGOSk6qkEcRm4J4YDwG-pYN=A@mail.gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
X-Mailman-Approved-At: Tue, 11 Dec 2018 20:42:42 -0500
Subject: [Qemu-riscv] [PATCH 2/5] RISC-V: Add 64-bit gdb xml files.
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
X-List-Received-Date: Wed, 12 Dec 2018 01:29:53 -0000

Signed-off-by: Jim Wilson <jimw@sifive.com>
---
 configure                   |   1 +
 gdb-xml/riscv-64bit-cpu.xml |  43 ++++++++
 gdb-xml/riscv-64bit-csr.xml | 250 ++++++++++++++++++++++++++++++++++++++++++++
 gdb-xml/riscv-64bit-fpu.xml |  52 +++++++++
 4 files changed, 346 insertions(+)
 create mode 100644 gdb-xml/riscv-64bit-cpu.xml
 create mode 100644 gdb-xml/riscv-64bit-csr.xml
 create mode 100644 gdb-xml/riscv-64bit-fpu.xml

diff --git a/configure b/configure
index 413d162..9be0b3e 100755
--- a/configure
+++ b/configure
@@ -7179,6 +7179,7 @@ case "$target_name" in
     TARGET_BASE_ARCH=riscv
     TARGET_ABI_DIR=riscv
     mttcg=yes
+    gdb_xml_files="riscv-64bit-cpu.xml riscv-64bit-fpu.xml riscv-64bit-csr.xml"
     target_compiler=$cross_cc_riscv64
   ;;
   sh4|sh4eb)
diff --git a/gdb-xml/riscv-64bit-cpu.xml b/gdb-xml/riscv-64bit-cpu.xml
new file mode 100644
index 0000000..f37d7f3
--- /dev/null
+++ b/gdb-xml/riscv-64bit-cpu.xml
@@ -0,0 +1,43 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2018 Free Software Foundation, Inc.
+
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.riscv.cpu">
+  <reg name="zero" bitsize="64" type="int"/>
+  <reg name="ra" bitsize="64" type="code_ptr"/>
+  <reg name="sp" bitsize="64" type="data_ptr"/>
+  <reg name="gp" bitsize="64" type="data_ptr"/>
+  <reg name="tp" bitsize="64" type="data_ptr"/>
+  <reg name="t0" bitsize="64" type="int"/>
+  <reg name="t1" bitsize="64" type="int"/>
+  <reg name="t2" bitsize="64" type="int"/>
+  <reg name="fp" bitsize="64" type="data_ptr"/>
+  <reg name="s1" bitsize="64" type="int"/>
+  <reg name="a0" bitsize="64" type="int"/>
+  <reg name="a1" bitsize="64" type="int"/>
+  <reg name="a2" bitsize="64" type="int"/>
+  <reg name="a3" bitsize="64" type="int"/>
+  <reg name="a4" bitsize="64" type="int"/>
+  <reg name="a5" bitsize="64" type="int"/>
+  <reg name="a6" bitsize="64" type="int"/>
+  <reg name="a7" bitsize="64" type="int"/>
+  <reg name="s2" bitsize="64" type="int"/>
+  <reg name="s3" bitsize="64" type="int"/>
+  <reg name="s4" bitsize="64" type="int"/>
+  <reg name="s5" bitsize="64" type="int"/>
+  <reg name="s6" bitsize="64" type="int"/>
+  <reg name="s7" bitsize="64" type="int"/>
+  <reg name="s8" bitsize="64" type="int"/>
+  <reg name="s9" bitsize="64" type="int"/>
+  <reg name="s10" bitsize="64" type="int"/>
+  <reg name="s11" bitsize="64" type="int"/>
+  <reg name="t3" bitsize="64" type="int"/>
+  <reg name="t4" bitsize="64" type="int"/>
+  <reg name="t5" bitsize="64" type="int"/>
+  <reg name="t6" bitsize="64" type="int"/>
+  <reg name="pc" bitsize="64" type="code_ptr"/>
+</feature>
diff --git a/gdb-xml/riscv-64bit-csr.xml b/gdb-xml/riscv-64bit-csr.xml
new file mode 100644
index 0000000..a3de834
--- /dev/null
+++ b/gdb-xml/riscv-64bit-csr.xml
@@ -0,0 +1,250 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2018 Free Software Foundation, Inc.
+
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.riscv.csr">
+  <reg name="ustatus" bitsize="64"/>
+  <reg name="uie" bitsize="64"/>
+  <reg name="utvec" bitsize="64"/>
+  <reg name="uscratch" bitsize="64"/>
+  <reg name="uepc" bitsize="64"/>
+  <reg name="ucause" bitsize="64"/>
+  <reg name="utval" bitsize="64"/>
+  <reg name="uip" bitsize="64"/>
+  <reg name="fflags" bitsize="64"/>
+  <reg name="frm" bitsize="64"/>
+  <reg name="fcsr" bitsize="64"/>
+  <reg name="cycle" bitsize="64"/>
+  <reg name="time" bitsize="64"/>
+  <reg name="instret" bitsize="64"/>
+  <reg name="hpmcounter3" bitsize="64"/>
+  <reg name="hpmcounter4" bitsize="64"/>
+  <reg name="hpmcounter5" bitsize="64"/>
+  <reg name="hpmcounter6" bitsize="64"/>
+  <reg name="hpmcounter7" bitsize="64"/>
+  <reg name="hpmcounter8" bitsize="64"/>
+  <reg name="hpmcounter9" bitsize="64"/>
+  <reg name="hpmcounter10" bitsize="64"/>
+  <reg name="hpmcounter11" bitsize="64"/>
+  <reg name="hpmcounter12" bitsize="64"/>
+  <reg name="hpmcounter13" bitsize="64"/>
+  <reg name="hpmcounter14" bitsize="64"/>
+  <reg name="hpmcounter15" bitsize="64"/>
+  <reg name="hpmcounter16" bitsize="64"/>
+  <reg name="hpmcounter17" bitsize="64"/>
+  <reg name="hpmcounter18" bitsize="64"/>
+  <reg name="hpmcounter19" bitsize="64"/>
+  <reg name="hpmcounter20" bitsize="64"/>
+  <reg name="hpmcounter21" bitsize="64"/>
+  <reg name="hpmcounter22" bitsize="64"/>
+  <reg name="hpmcounter23" bitsize="64"/>
+  <reg name="hpmcounter24" bitsize="64"/>
+  <reg name="hpmcounter25" bitsize="64"/>
+  <reg name="hpmcounter26" bitsize="64"/>
+  <reg name="hpmcounter27" bitsize="64"/>
+  <reg name="hpmcounter28" bitsize="64"/>
+  <reg name="hpmcounter29" bitsize="64"/>
+  <reg name="hpmcounter30" bitsize="64"/>
+  <reg name="hpmcounter31" bitsize="64"/>
+  <reg name="cycleh" bitsize="64"/>
+  <reg name="timeh" bitsize="64"/>
+  <reg name="instreth" bitsize="64"/>
+  <reg name="hpmcounter3h" bitsize="64"/>
+  <reg name="hpmcounter4h" bitsize="64"/>
+  <reg name="hpmcounter5h" bitsize="64"/>
+  <reg name="hpmcounter6h" bitsize="64"/>
+  <reg name="hpmcounter7h" bitsize="64"/>
+  <reg name="hpmcounter8h" bitsize="64"/>
+  <reg name="hpmcounter9h" bitsize="64"/>
+  <reg name="hpmcounter10h" bitsize="64"/>
+  <reg name="hpmcounter11h" bitsize="64"/>
+  <reg name="hpmcounter12h" bitsize="64"/>
+  <reg name="hpmcounter13h" bitsize="64"/>
+  <reg name="hpmcounter14h" bitsize="64"/>
+  <reg name="hpmcounter15h" bitsize="64"/>
+  <reg name="hpmcounter16h" bitsize="64"/>
+  <reg name="hpmcounter17h" bitsize="64"/>
+  <reg name="hpmcounter18h" bitsize="64"/>
+  <reg name="hpmcounter19h" bitsize="64"/>
+  <reg name="hpmcounter20h" bitsize="64"/>
+  <reg name="hpmcounter21h" bitsize="64"/>
+  <reg name="hpmcounter22h" bitsize="64"/>
+  <reg name="hpmcounter23h" bitsize="64"/>
+  <reg name="hpmcounter24h" bitsize="64"/>
+  <reg name="hpmcounter25h" bitsize="64"/>
+  <reg name="hpmcounter26h" bitsize="64"/>
+  <reg name="hpmcounter27h" bitsize="64"/>
+  <reg name="hpmcounter28h" bitsize="64"/>
+  <reg name="hpmcounter29h" bitsize="64"/>
+  <reg name="hpmcounter30h" bitsize="64"/>
+  <reg name="hpmcounter31h" bitsize="64"/>
+  <reg name="sstatus" bitsize="64"/>
+  <reg name="sedeleg" bitsize="64"/>
+  <reg name="sideleg" bitsize="64"/>
+  <reg name="sie" bitsize="64"/>
+  <reg name="stvec" bitsize="64"/>
+  <reg name="scounteren" bitsize="64"/>
+  <reg name="sscratch" bitsize="64"/>
+  <reg name="sepc" bitsize="64"/>
+  <reg name="scause" bitsize="64"/>
+  <reg name="stval" bitsize="64"/>
+  <reg name="sip" bitsize="64"/>
+  <reg name="satp" bitsize="64"/>
+  <reg name="mvendorid" bitsize="64"/>
+  <reg name="marchid" bitsize="64"/>
+  <reg name="mimpid" bitsize="64"/>
+  <reg name="mhartid" bitsize="64"/>
+  <reg name="mstatus" bitsize="64"/>
+  <reg name="misa" bitsize="64"/>
+  <reg name="medeleg" bitsize="64"/>
+  <reg name="mideleg" bitsize="64"/>
+  <reg name="mie" bitsize="64"/>
+  <reg name="mtvec" bitsize="64"/>
+  <reg name="mcounteren" bitsize="64"/>
+  <reg name="mscratch" bitsize="64"/>
+  <reg name="mepc" bitsize="64"/>
+  <reg name="mcause" bitsize="64"/>
+  <reg name="mtval" bitsize="64"/>
+  <reg name="mip" bitsize="64"/>
+  <reg name="pmpcfg0" bitsize="64"/>
+  <reg name="pmpcfg1" bitsize="64"/>
+  <reg name="pmpcfg2" bitsize="64"/>
+  <reg name="pmpcfg3" bitsize="64"/>
+  <reg name="pmpaddr0" bitsize="64"/>
+  <reg name="pmpaddr1" bitsize="64"/>
+  <reg name="pmpaddr2" bitsize="64"/>
+  <reg name="pmpaddr3" bitsize="64"/>
+  <reg name="pmpaddr4" bitsize="64"/>
+  <reg name="pmpaddr5" bitsize="64"/>
+  <reg name="pmpaddr6" bitsize="64"/>
+  <reg name="pmpaddr7" bitsize="64"/>
+  <reg name="pmpaddr8" bitsize="64"/>
+  <reg name="pmpaddr9" bitsize="64"/>
+  <reg name="pmpaddr10" bitsize="64"/>
+  <reg name="pmpaddr11" bitsize="64"/>
+  <reg name="pmpaddr12" bitsize="64"/>
+  <reg name="pmpaddr13" bitsize="64"/>
+  <reg name="pmpaddr14" bitsize="64"/>
+  <reg name="pmpaddr15" bitsize="64"/>
+  <reg name="mcycle" bitsize="64"/>
+  <reg name="minstret" bitsize="64"/>
+  <reg name="mhpmcounter3" bitsize="64"/>
+  <reg name="mhpmcounter4" bitsize="64"/>
+  <reg name="mhpmcounter5" bitsize="64"/>
+  <reg name="mhpmcounter6" bitsize="64"/>
+  <reg name="mhpmcounter7" bitsize="64"/>
+  <reg name="mhpmcounter8" bitsize="64"/>
+  <reg name="mhpmcounter9" bitsize="64"/>
+  <reg name="mhpmcounter10" bitsize="64"/>
+  <reg name="mhpmcounter11" bitsize="64"/>
+  <reg name="mhpmcounter12" bitsize="64"/>
+  <reg name="mhpmcounter13" bitsize="64"/>
+  <reg name="mhpmcounter14" bitsize="64"/>
+  <reg name="mhpmcounter15" bitsize="64"/>
+  <reg name="mhpmcounter16" bitsize="64"/>
+  <reg name="mhpmcounter17" bitsize="64"/>
+  <reg name="mhpmcounter18" bitsize="64"/>
+  <reg name="mhpmcounter19" bitsize="64"/>
+  <reg name="mhpmcounter20" bitsize="64"/>
+  <reg name="mhpmcounter21" bitsize="64"/>
+  <reg name="mhpmcounter22" bitsize="64"/>
+  <reg name="mhpmcounter23" bitsize="64"/>
+  <reg name="mhpmcounter24" bitsize="64"/>
+  <reg name="mhpmcounter25" bitsize="64"/>
+  <reg name="mhpmcounter26" bitsize="64"/>
+  <reg name="mhpmcounter27" bitsize="64"/>
+  <reg name="mhpmcounter28" bitsize="64"/>
+  <reg name="mhpmcounter29" bitsize="64"/>
+  <reg name="mhpmcounter30" bitsize="64"/>
+  <reg name="mhpmcounter31" bitsize="64"/>
+  <reg name="mcycleh" bitsize="64"/>
+  <reg name="minstreth" bitsize="64"/>
+  <reg name="mhpmcounter3h" bitsize="64"/>
+  <reg name="mhpmcounter4h" bitsize="64"/>
+  <reg name="mhpmcounter5h" bitsize="64"/>
+  <reg name="mhpmcounter6h" bitsize="64"/>
+  <reg name="mhpmcounter7h" bitsize="64"/>
+  <reg name="mhpmcounter8h" bitsize="64"/>
+  <reg name="mhpmcounter9h" bitsize="64"/>
+  <reg name="mhpmcounter10h" bitsize="64"/>
+  <reg name="mhpmcounter11h" bitsize="64"/>
+  <reg name="mhpmcounter12h" bitsize="64"/>
+  <reg name="mhpmcounter13h" bitsize="64"/>
+  <reg name="mhpmcounter14h" bitsize="64"/>
+  <reg name="mhpmcounter15h" bitsize="64"/>
+  <reg name="mhpmcounter16h" bitsize="64"/>
+  <reg name="mhpmcounter17h" bitsize="64"/>
+  <reg name="mhpmcounter18h" bitsize="64"/>
+  <reg name="mhpmcounter19h" bitsize="64"/>
+  <reg name="mhpmcounter20h" bitsize="64"/>
+  <reg name="mhpmcounter21h" bitsize="64"/>
+  <reg name="mhpmcounter22h" bitsize="64"/>
+  <reg name="mhpmcounter23h" bitsize="64"/>
+  <reg name="mhpmcounter24h" bitsize="64"/>
+  <reg name="mhpmcounter25h" bitsize="64"/>
+  <reg name="mhpmcounter26h" bitsize="64"/>
+  <reg name="mhpmcounter27h" bitsize="64"/>
+  <reg name="mhpmcounter28h" bitsize="64"/>
+  <reg name="mhpmcounter29h" bitsize="64"/>
+  <reg name="mhpmcounter30h" bitsize="64"/>
+  <reg name="mhpmcounter31h" bitsize="64"/>
+  <reg name="mhpmevent3" bitsize="64"/>
+  <reg name="mhpmevent4" bitsize="64"/>
+  <reg name="mhpmevent5" bitsize="64"/>
+  <reg name="mhpmevent6" bitsize="64"/>
+  <reg name="mhpmevent7" bitsize="64"/>
+  <reg name="mhpmevent8" bitsize="64"/>
+  <reg name="mhpmevent9" bitsize="64"/>
+  <reg name="mhpmevent10" bitsize="64"/>
+  <reg name="mhpmevent11" bitsize="64"/>
+  <reg name="mhpmevent12" bitsize="64"/>
+  <reg name="mhpmevent13" bitsize="64"/>
+  <reg name="mhpmevent14" bitsize="64"/>
+  <reg name="mhpmevent15" bitsize="64"/>
+  <reg name="mhpmevent16" bitsize="64"/>
+  <reg name="mhpmevent17" bitsize="64"/>
+  <reg name="mhpmevent18" bitsize="64"/>
+  <reg name="mhpmevent19" bitsize="64"/>
+  <reg name="mhpmevent20" bitsize="64"/>
+  <reg name="mhpmevent21" bitsize="64"/>
+  <reg name="mhpmevent22" bitsize="64"/>
+  <reg name="mhpmevent23" bitsize="64"/>
+  <reg name="mhpmevent24" bitsize="64"/>
+  <reg name="mhpmevent25" bitsize="64"/>
+  <reg name="mhpmevent26" bitsize="64"/>
+  <reg name="mhpmevent27" bitsize="64"/>
+  <reg name="mhpmevent28" bitsize="64"/>
+  <reg name="mhpmevent29" bitsize="64"/>
+  <reg name="mhpmevent30" bitsize="64"/>
+  <reg name="mhpmevent31" bitsize="64"/>
+  <reg name="tselect" bitsize="64"/>
+  <reg name="tdata1" bitsize="64"/>
+  <reg name="tdata2" bitsize="64"/>
+  <reg name="tdata3" bitsize="64"/>
+  <reg name="dcsr" bitsize="64"/>
+  <reg name="dpc" bitsize="64"/>
+  <reg name="dscratch" bitsize="64"/>
+  <reg name="hstatus" bitsize="64"/>
+  <reg name="hedeleg" bitsize="64"/>
+  <reg name="hideleg" bitsize="64"/>
+  <reg name="hie" bitsize="64"/>
+  <reg name="htvec" bitsize="64"/>
+  <reg name="hscratch" bitsize="64"/>
+  <reg name="hepc" bitsize="64"/>
+  <reg name="hcause" bitsize="64"/>
+  <reg name="hbadaddr" bitsize="64"/>
+  <reg name="hip" bitsize="64"/>
+  <reg name="mbase" bitsize="64"/>
+  <reg name="mbound" bitsize="64"/>
+  <reg name="mibase" bitsize="64"/>
+  <reg name="mibound" bitsize="64"/>
+  <reg name="mdbase" bitsize="64"/>
+  <reg name="mdbound" bitsize="64"/>
+  <reg name="mucounteren" bitsize="64"/>
+  <reg name="mscounteren" bitsize="64"/>
+  <reg name="mhcounteren" bitsize="64"/>
+</feature>
diff --git a/gdb-xml/riscv-64bit-fpu.xml b/gdb-xml/riscv-64bit-fpu.xml
new file mode 100644
index 0000000..fb24b72
--- /dev/null
+++ b/gdb-xml/riscv-64bit-fpu.xml
@@ -0,0 +1,52 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2018 Free Software Foundation, Inc.
+
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.riscv.fpu">
+
+  <union id="riscv_double">
+    <field name="float" type="ieee_single"/>
+    <field name="double" type="ieee_double"/>
+  </union>
+
+  <reg name="ft0" bitsize="64" type="riscv_double"/>
+  <reg name="ft1" bitsize="64" type="riscv_double"/>
+  <reg name="ft2" bitsize="64" type="riscv_double"/>
+  <reg name="ft3" bitsize="64" type="riscv_double"/>
+  <reg name="ft4" bitsize="64" type="riscv_double"/>
+  <reg name="ft5" bitsize="64" type="riscv_double"/>
+  <reg name="ft6" bitsize="64" type="riscv_double"/>
+  <reg name="ft7" bitsize="64" type="riscv_double"/>
+  <reg name="fs0" bitsize="64" type="riscv_double"/>
+  <reg name="fs1" bitsize="64" type="riscv_double"/>
+  <reg name="fa0" bitsize="64" type="riscv_double"/>
+  <reg name="fa1" bitsize="64" type="riscv_double"/>
+  <reg name="fa2" bitsize="64" type="riscv_double"/>
+  <reg name="fa3" bitsize="64" type="riscv_double"/>
+  <reg name="fa4" bitsize="64" type="riscv_double"/>
+  <reg name="fa5" bitsize="64" type="riscv_double"/>
+  <reg name="fa6" bitsize="64" type="riscv_double"/>
+  <reg name="fa7" bitsize="64" type="riscv_double"/>
+  <reg name="fs2" bitsize="64" type="riscv_double"/>
+  <reg name="fs3" bitsize="64" type="riscv_double"/>
+  <reg name="fs4" bitsize="64" type="riscv_double"/>
+  <reg name="fs5" bitsize="64" type="riscv_double"/>
+  <reg name="fs6" bitsize="64" type="riscv_double"/>
+  <reg name="fs7" bitsize="64" type="riscv_double"/>
+  <reg name="fs8" bitsize="64" type="riscv_double"/>
+  <reg name="fs9" bitsize="64" type="riscv_double"/>
+  <reg name="fs10" bitsize="64" type="riscv_double"/>
+  <reg name="fs11" bitsize="64" type="riscv_double"/>
+  <reg name="ft8" bitsize="64" type="riscv_double"/>
+  <reg name="ft9" bitsize="64" type="riscv_double"/>
+  <reg name="ft10" bitsize="64" type="riscv_double"/>
+  <reg name="ft11" bitsize="64" type="riscv_double"/>
+
+  <reg name="fflags" bitsize="32" type="int"/>
+  <reg name="frm" bitsize="32" type="int"/>
+  <reg name="fcsr" bitsize="32" type="int"/>
+</feature>
-- 
2.7.4


