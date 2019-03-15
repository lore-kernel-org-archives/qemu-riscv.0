Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4mdQ-0003O7-MI
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 09:12:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chihmin.chao@sifive.com>) id 1h4mdJ-0003JF-Pt
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 09:12:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chihmin.chao@sifive.com>) id 1h4mdF-0004yz-13
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 09:12:21 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:41920)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
	id 1h4mdE-0004xz-Gd
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 09:12:16 -0400
Received: by mail-pf1-x442.google.com with SMTP id d25so6322120pfn.8
	for <qemu-riscv@nongnu.org>; Fri, 15 Mar 2019 06:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BvLk6DZP5QpQ+qJNcnHdtcPffNKqdftl6440W8LQCEo=;
	b=kyki/bEDaQB1BmgvIkukL3A7/lTTqbDJM84AE6fTyZcekPz7eEDrmzSVdpOCAEm3IM
	i/EJddjk/6w6ZM8192AaLaIcEc5EIDE4BfkZakUl8AZrblxvAZUAIcM5u21AH3F7rI8l
	XI4Xw4jZq69GDVElwG3D6YpBYUL7+PlZBYE/biFSbGKQTO5vEqiyE+fNun5WMJbdhtx8
	AbaizAM+zjryprlRvOD9m0rID6t0rMNMFGaaF44tK3xYj1x0jBAEkvXKEON2Rom1RNxW
	yk7zurUEx/xBh7tHKdpHkD+t+l6M+ysFOFoX4CFQFMDKQ6ToXOOM0xNB7vsWlzm3R9xx
	lduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BvLk6DZP5QpQ+qJNcnHdtcPffNKqdftl6440W8LQCEo=;
	b=LoRswc/i4wu8p2DCRhXxr38deo/9NQUZWSKFEJLx+0dAOO+1upFYQiL8Ofo5aF2zO9
	vlT2083K+gAIKnFB0d32HeusDOM3PGPV6RP4q27b//DhpFHrpz0JrEQkuV0YKmTUKSeq
	rQO8CZC2zZUAAr3vN5rVcdM4fD+DHyoDxlTlGiG5sBMNgF4jqlJgNPTwSgw8wfTSn2Ja
	RAZOoIsQgUcu5KZeg/8do1zGLZKwI+poHIabBBxHg7eDh/wWu9pSzdwLdLewPCv/nZd1
	xrRk2VLGL50k2HtFUt6F7g9Y1S1wot4T3kXLs6tg7XumYuOo+IF1Epxd3ws2QMveR13h
	kS0A==
X-Gm-Message-State: APjAAAXOJzYrbngUXoqbjyBJG6Bu4LpUCUXzvy8mxEX6yO+XJOVAXP2j
	xEi7EA47XbyY7TVGPQXV/oQt/tdy6Mhc5Q==
X-Google-Smtp-Source: APXvYqwcLuihl53y2K6sy3933XRjYCHrFnKnHyttXxFimBBbwTmh33IBLMGfPucgwcRhB20NfWT0Hw==
X-Received: by 2002:a17:902:d710:: with SMTP id
	w16mr3366678ply.198.1552645664114; 
	Fri, 15 Mar 2019 03:27:44 -0700 (PDT)
Received: from gamma06.internal.sifive.com ([64.62.193.194])
	by smtp.gmail.com with ESMTPSA id
	f15sm2225401pfa.11.2019.03.15.03.27.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Mar 2019 03:27:43 -0700 (PDT)
From: Chih-Min Chao <chihmin.chao@sifive.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Jim Wilson <jimw@sifive.com>,
	Chih-Min Chao <chihmin.chao@sifive.com>
Date: Fri, 15 Mar 2019 03:26:56 -0700
Message-Id: <1552645619-18244-3-git-send-email-chihmin.chao@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552645619-18244-1-git-send-email-chihmin.chao@sifive.com>
References: <1552645619-18244-1-git-send-email-chihmin.chao@sifive.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-riscv] [PATCH v5 2/5] RISC-V: Add 64-bit gdb xml files.
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
X-List-Received-Date: Fri, 15 Mar 2019 13:12:26 -0000

From: Jim Wilson <jimw@sifive.com>

Signed-off-by: Jim Wilson <jimw@sifive.com>
Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
---
 configure                   |   1 +
 gdb-xml/riscv-32bit-fpu.xml |   6 +-
 gdb-xml/riscv-64bit-cpu.xml |  47 +++++++++
 gdb-xml/riscv-64bit-csr.xml | 250 ++++++++++++++++++++++++++++++++++++++++++++
 gdb-xml/riscv-64bit-fpu.xml |  56 ++++++++++
 5 files changed, 357 insertions(+), 3 deletions(-)
 create mode 100644 gdb-xml/riscv-64bit-cpu.xml
 create mode 100644 gdb-xml/riscv-64bit-csr.xml
 create mode 100644 gdb-xml/riscv-64bit-fpu.xml

diff --git a/configure b/configure
index aed149b..613dd2f 100755
--- a/configure
+++ b/configure
@@ -7521,6 +7521,7 @@ case "$target_name" in
     TARGET_BASE_ARCH=riscv
     TARGET_ABI_DIR=riscv
     mttcg=yes
+    gdb_xml_files="riscv-64bit-cpu.xml riscv-64bit-fpu.xml riscv-64bit-csr.xml"
     target_compiler=$cross_cc_riscv64
   ;;
   sh4|sh4eb)
diff --git a/gdb-xml/riscv-32bit-fpu.xml b/gdb-xml/riscv-32bit-fpu.xml
index 32a1dee..1eaae91 100644
--- a/gdb-xml/riscv-32bit-fpu.xml
+++ b/gdb-xml/riscv-32bit-fpu.xml
@@ -44,7 +44,7 @@
   <reg name="ft10" bitsize="32" type="ieee_single"/>
   <reg name="ft11" bitsize="32" type="ieee_single"/>
 
-  <reg name="fflags" bitsize="32" type="int"/>
-  <reg name="frm" bitsize="32" type="int"/>
-  <reg name="fcsr" bitsize="32" type="int"/>
+  <reg name="fflags" bitsize="32" type="int" regnum="66"/>
+  <reg name="frm" bitsize="32" type="int" regnum="67"/>
+  <reg name="fcsr" bitsize="32" type="int" regnum="68"/>
 </feature>
diff --git a/gdb-xml/riscv-64bit-cpu.xml b/gdb-xml/riscv-64bit-cpu.xml
new file mode 100644
index 0000000..b8aa424
--- /dev/null
+++ b/gdb-xml/riscv-64bit-cpu.xml
@@ -0,0 +1,47 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
+
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!-- Register numbers are hard-coded in order to maintain backward
+     compatibility with older versions of tools that didn't use xml
+     register descriptions.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.riscv.cpu">
+  <reg name="zero" bitsize="64" type="int" regnum="0"/>
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
index 0000000..6aa4bed
--- /dev/null
+++ b/gdb-xml/riscv-64bit-csr.xml
@@ -0,0 +1,250 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
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
index 0000000..794854c
--- /dev/null
+++ b/gdb-xml/riscv-64bit-fpu.xml
@@ -0,0 +1,56 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
+
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!-- Register numbers are hard-coded in order to maintain backward
+     compatibility with older versions of tools that didn't use xml
+     register descriptions.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.riscv.fpu">
+
+  <union id="riscv_double">
+    <field name="float" type="ieee_single"/>
+    <field name="double" type="ieee_double"/>
+  </union>
+
+  <reg name="ft0" bitsize="64" type="riscv_double" regnum="33"/>
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
+  <reg name="fflags" bitsize="32" type="int" regnum="66"/>
+  <reg name="frm" bitsize="32" type="int" regnum="67"/>
+  <reg name="fcsr" bitsize="32" type="int" regnum="68"/>
+</feature>
-- 
2.7.4


