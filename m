Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4raM-0000Cu-4Y
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 14:29:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h4raI-00008n-ED
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 14:29:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h4raF-0007zY-1E
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 14:29:34 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:42563)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1h4ra9-0007wz-2M; Fri, 15 Mar 2019 14:29:25 -0400
Received: by mail-lf1-x144.google.com with SMTP id p1so7528812lfk.9;
	Fri, 15 Mar 2019 11:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xoNiEOCSmehivzMLOn7EmNw3jgsfqiorJK3kitq9Cyg=;
	b=Wxtv0zKNn8B9Ffzms4AykMdcSJxZgmTvCfudQMh9FKAYAaSZNeyafY1a6DMYvCHE5R
	9k8dyFC5JzqG2ACLRp4DV1FQrtTBS92M7nyXq7tzRHsystxI+/4KuG36zcngPju4vOug
	5mR2KJwpnUCJEjl8bNQcT8CfEVjSZfn+kdEfiySKHU6yIp1HuNklfrNKIVAcRP2Tjksm
	KUOCm74mEqk/5iom8yBqWRdzsDPrm/+sY7GylL8RTDOY2upl9c+MMtnlE6rHruVyEmVR
	Rp/FdJN4S2L8PrWBIPSKPuBDwSaqeDB3Enjs0WIHsnmV5LEksyBD/LbxLtTn+k2qOhhI
	4wxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xoNiEOCSmehivzMLOn7EmNw3jgsfqiorJK3kitq9Cyg=;
	b=nKBzs+X6AjAXtu8riSYkpyYRDPouFZQKfRzmDmNxgHkhsRGVEHlR+kl/iWvDBNy8Xz
	hMWSx66KvzcByJvuAjGWOpVBg+eBHkflV5pfuLTbDSty+qCRXETCN1IM7Kvaic0ZeF0c
	s8ZvHhaY9yu8Nejsd6iOxWojVS+OZXZRJ9WkdWoaBWZfLqpD2oBvK1GXNIJUwpeQjqXK
	2C/CQqR80h6xCxbef0QcQYTuWb1BP2wfFnkLf+aKkhBj/ZwsIptAlYnJV7jm8YxI0jxJ
	Fd9Hckn8FnLgunolsMo6W9in+oLDP7W2AtvvTbWD5gnONkTtIoA29xbcFQ9jWbdNvj2H
	L9jQ==
X-Gm-Message-State: APjAAAWhLbPs4PasyabIYeE/r19avOMs+NDJn2IAUFW+rXr3HHjsyS8a
	yI8X/8EN9aYAhTGabqn3wPznhQANiVzl55+Pb6A=
X-Google-Smtp-Source: APXvYqxVqxMLkf0IElpewzOLZ763TXLPvMfqSYLJpjZmEbOnLfDaafVgCYt2O/qoACefoZa7aOgBbO95TF6l7Hh4du0=
X-Received: by 2002:ac2:5449:: with SMTP id d9mr2916401lfn.162.1552674563419; 
	Fri, 15 Mar 2019 11:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <1552645619-18244-1-git-send-email-chihmin.chao@sifive.com>
	<1552645619-18244-2-git-send-email-chihmin.chao@sifive.com>
In-Reply-To: <1552645619-18244-2-git-send-email-chihmin.chao@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Mar 2019 11:28:12 -0700
Message-ID: <CAKmqyKP88xYiyDzuSf6ddyBqL9-JKTF9tSe=4TN8arTqBjLG2g@mail.gmail.com>
To: Chih-Min Chao <chihmin.chao@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>, Jim Wilson <jimw@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 1/5] RISC-V: Add 32-bit gdb
 xml files.
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
X-List-Received-Date: Fri, 15 Mar 2019 18:29:37 -0000

On Fri, Mar 15, 2019 at 7:42 AM Chih-Min Chao <chihmin.chao@sifive.com> wrote:
>
> From: Jim Wilson <jimw@sifive.com>
>
> Signed-off-by: Jim Wilson <jimw@sifive.com>
> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>

This looks good, I didn't dig into every register here, but I'm
assuming it's correct.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair


> ---
>  configure                   |   1 +
>  gdb-xml/riscv-32bit-cpu.xml |  47 +++++++++
>  gdb-xml/riscv-32bit-csr.xml | 250 ++++++++++++++++++++++++++++++++++++++++++++
>  gdb-xml/riscv-32bit-fpu.xml |  50 +++++++++
>  4 files changed, 348 insertions(+)
>  create mode 100644 gdb-xml/riscv-32bit-cpu.xml
>  create mode 100644 gdb-xml/riscv-32bit-csr.xml
>  create mode 100644 gdb-xml/riscv-32bit-fpu.xml
>
> diff --git a/configure b/configure
> index 7071f52..aed149b 100755
> --- a/configure
> +++ b/configure
> @@ -7514,6 +7514,7 @@ case "$target_name" in
>      TARGET_BASE_ARCH=riscv
>      TARGET_ABI_DIR=riscv
>      mttcg=yes
> +    gdb_xml_files="riscv-32bit-cpu.xml riscv-32bit-fpu.xml riscv-32bit-csr.xml"
>      target_compiler=$cross_cc_riscv32
>    ;;
>    riscv64)
> diff --git a/gdb-xml/riscv-32bit-cpu.xml b/gdb-xml/riscv-32bit-cpu.xml
> new file mode 100644
> index 0000000..0d07aae
> --- /dev/null
> +++ b/gdb-xml/riscv-32bit-cpu.xml
> @@ -0,0 +1,47 @@
> +<?xml version="1.0"?>
> +<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
> +
> +     Copying and distribution of this file, with or without modification,
> +     are permitted in any medium without royalty provided the copyright
> +     notice and this notice are preserved.  -->
> +
> +<!-- Register numbers are hard-coded in order to maintain backward
> +     compatibility with older versions of tools that didn't use xml
> +     register descriptions.  -->
> +
> +<!DOCTYPE feature SYSTEM "gdb-target.dtd">
> +<feature name="org.gnu.gdb.riscv.cpu">
> +  <reg name="zero" bitsize="32" type="int" regnum="0"/>
> +  <reg name="ra" bitsize="32" type="code_ptr"/>
> +  <reg name="sp" bitsize="32" type="data_ptr"/>
> +  <reg name="gp" bitsize="32" type="data_ptr"/>
> +  <reg name="tp" bitsize="32" type="data_ptr"/>
> +  <reg name="t0" bitsize="32" type="int"/>
> +  <reg name="t1" bitsize="32" type="int"/>
> +  <reg name="t2" bitsize="32" type="int"/>
> +  <reg name="fp" bitsize="32" type="data_ptr"/>
> +  <reg name="s1" bitsize="32" type="int"/>
> +  <reg name="a0" bitsize="32" type="int"/>
> +  <reg name="a1" bitsize="32" type="int"/>
> +  <reg name="a2" bitsize="32" type="int"/>
> +  <reg name="a3" bitsize="32" type="int"/>
> +  <reg name="a4" bitsize="32" type="int"/>
> +  <reg name="a5" bitsize="32" type="int"/>
> +  <reg name="a6" bitsize="32" type="int"/>
> +  <reg name="a7" bitsize="32" type="int"/>
> +  <reg name="s2" bitsize="32" type="int"/>
> +  <reg name="s3" bitsize="32" type="int"/>
> +  <reg name="s4" bitsize="32" type="int"/>
> +  <reg name="s5" bitsize="32" type="int"/>
> +  <reg name="s6" bitsize="32" type="int"/>
> +  <reg name="s7" bitsize="32" type="int"/>
> +  <reg name="s8" bitsize="32" type="int"/>
> +  <reg name="s9" bitsize="32" type="int"/>
> +  <reg name="s10" bitsize="32" type="int"/>
> +  <reg name="s11" bitsize="32" type="int"/>
> +  <reg name="t3" bitsize="32" type="int"/>
> +  <reg name="t4" bitsize="32" type="int"/>
> +  <reg name="t5" bitsize="32" type="int"/>
> +  <reg name="t6" bitsize="32" type="int"/>
> +  <reg name="pc" bitsize="32" type="code_ptr"/>
> +</feature>
> diff --git a/gdb-xml/riscv-32bit-csr.xml b/gdb-xml/riscv-32bit-csr.xml
> new file mode 100644
> index 0000000..da1bf19
> --- /dev/null
> +++ b/gdb-xml/riscv-32bit-csr.xml
> @@ -0,0 +1,250 @@
> +<?xml version="1.0"?>
> +<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
> +
> +     Copying and distribution of this file, with or without modification,
> +     are permitted in any medium without royalty provided the copyright
> +     notice and this notice are preserved.  -->
> +
> +<!DOCTYPE feature SYSTEM "gdb-target.dtd">
> +<feature name="org.gnu.gdb.riscv.csr">
> +  <reg name="ustatus" bitsize="32"/>
> +  <reg name="uie" bitsize="32"/>
> +  <reg name="utvec" bitsize="32"/>
> +  <reg name="uscratch" bitsize="32"/>
> +  <reg name="uepc" bitsize="32"/>
> +  <reg name="ucause" bitsize="32"/>
> +  <reg name="utval" bitsize="32"/>
> +  <reg name="uip" bitsize="32"/>
> +  <reg name="fflags" bitsize="32"/>
> +  <reg name="frm" bitsize="32"/>
> +  <reg name="fcsr" bitsize="32"/>
> +  <reg name="cycle" bitsize="32"/>
> +  <reg name="time" bitsize="32"/>
> +  <reg name="instret" bitsize="32"/>
> +  <reg name="hpmcounter3" bitsize="32"/>
> +  <reg name="hpmcounter4" bitsize="32"/>
> +  <reg name="hpmcounter5" bitsize="32"/>
> +  <reg name="hpmcounter6" bitsize="32"/>
> +  <reg name="hpmcounter7" bitsize="32"/>
> +  <reg name="hpmcounter8" bitsize="32"/>
> +  <reg name="hpmcounter9" bitsize="32"/>
> +  <reg name="hpmcounter10" bitsize="32"/>
> +  <reg name="hpmcounter11" bitsize="32"/>
> +  <reg name="hpmcounter12" bitsize="32"/>
> +  <reg name="hpmcounter13" bitsize="32"/>
> +  <reg name="hpmcounter14" bitsize="32"/>
> +  <reg name="hpmcounter15" bitsize="32"/>
> +  <reg name="hpmcounter16" bitsize="32"/>
> +  <reg name="hpmcounter17" bitsize="32"/>
> +  <reg name="hpmcounter18" bitsize="32"/>
> +  <reg name="hpmcounter19" bitsize="32"/>
> +  <reg name="hpmcounter20" bitsize="32"/>
> +  <reg name="hpmcounter21" bitsize="32"/>
> +  <reg name="hpmcounter22" bitsize="32"/>
> +  <reg name="hpmcounter23" bitsize="32"/>
> +  <reg name="hpmcounter24" bitsize="32"/>
> +  <reg name="hpmcounter25" bitsize="32"/>
> +  <reg name="hpmcounter26" bitsize="32"/>
> +  <reg name="hpmcounter27" bitsize="32"/>
> +  <reg name="hpmcounter28" bitsize="32"/>
> +  <reg name="hpmcounter29" bitsize="32"/>
> +  <reg name="hpmcounter30" bitsize="32"/>
> +  <reg name="hpmcounter31" bitsize="32"/>
> +  <reg name="cycleh" bitsize="32"/>
> +  <reg name="timeh" bitsize="32"/>
> +  <reg name="instreth" bitsize="32"/>
> +  <reg name="hpmcounter3h" bitsize="32"/>
> +  <reg name="hpmcounter4h" bitsize="32"/>
> +  <reg name="hpmcounter5h" bitsize="32"/>
> +  <reg name="hpmcounter6h" bitsize="32"/>
> +  <reg name="hpmcounter7h" bitsize="32"/>
> +  <reg name="hpmcounter8h" bitsize="32"/>
> +  <reg name="hpmcounter9h" bitsize="32"/>
> +  <reg name="hpmcounter10h" bitsize="32"/>
> +  <reg name="hpmcounter11h" bitsize="32"/>
> +  <reg name="hpmcounter12h" bitsize="32"/>
> +  <reg name="hpmcounter13h" bitsize="32"/>
> +  <reg name="hpmcounter14h" bitsize="32"/>
> +  <reg name="hpmcounter15h" bitsize="32"/>
> +  <reg name="hpmcounter16h" bitsize="32"/>
> +  <reg name="hpmcounter17h" bitsize="32"/>
> +  <reg name="hpmcounter18h" bitsize="32"/>
> +  <reg name="hpmcounter19h" bitsize="32"/>
> +  <reg name="hpmcounter20h" bitsize="32"/>
> +  <reg name="hpmcounter21h" bitsize="32"/>
> +  <reg name="hpmcounter22h" bitsize="32"/>
> +  <reg name="hpmcounter23h" bitsize="32"/>
> +  <reg name="hpmcounter24h" bitsize="32"/>
> +  <reg name="hpmcounter25h" bitsize="32"/>
> +  <reg name="hpmcounter26h" bitsize="32"/>
> +  <reg name="hpmcounter27h" bitsize="32"/>
> +  <reg name="hpmcounter28h" bitsize="32"/>
> +  <reg name="hpmcounter29h" bitsize="32"/>
> +  <reg name="hpmcounter30h" bitsize="32"/>
> +  <reg name="hpmcounter31h" bitsize="32"/>
> +  <reg name="sstatus" bitsize="32"/>
> +  <reg name="sedeleg" bitsize="32"/>
> +  <reg name="sideleg" bitsize="32"/>
> +  <reg name="sie" bitsize="32"/>
> +  <reg name="stvec" bitsize="32"/>
> +  <reg name="scounteren" bitsize="32"/>
> +  <reg name="sscratch" bitsize="32"/>
> +  <reg name="sepc" bitsize="32"/>
> +  <reg name="scause" bitsize="32"/>
> +  <reg name="stval" bitsize="32"/>
> +  <reg name="sip" bitsize="32"/>
> +  <reg name="satp" bitsize="32"/>
> +  <reg name="mvendorid" bitsize="32"/>
> +  <reg name="marchid" bitsize="32"/>
> +  <reg name="mimpid" bitsize="32"/>
> +  <reg name="mhartid" bitsize="32"/>
> +  <reg name="mstatus" bitsize="32"/>
> +  <reg name="misa" bitsize="32"/>
> +  <reg name="medeleg" bitsize="32"/>
> +  <reg name="mideleg" bitsize="32"/>
> +  <reg name="mie" bitsize="32"/>
> +  <reg name="mtvec" bitsize="32"/>
> +  <reg name="mcounteren" bitsize="32"/>
> +  <reg name="mscratch" bitsize="32"/>
> +  <reg name="mepc" bitsize="32"/>
> +  <reg name="mcause" bitsize="32"/>
> +  <reg name="mtval" bitsize="32"/>
> +  <reg name="mip" bitsize="32"/>
> +  <reg name="pmpcfg0" bitsize="32"/>
> +  <reg name="pmpcfg1" bitsize="32"/>
> +  <reg name="pmpcfg2" bitsize="32"/>
> +  <reg name="pmpcfg3" bitsize="32"/>
> +  <reg name="pmpaddr0" bitsize="32"/>
> +  <reg name="pmpaddr1" bitsize="32"/>
> +  <reg name="pmpaddr2" bitsize="32"/>
> +  <reg name="pmpaddr3" bitsize="32"/>
> +  <reg name="pmpaddr4" bitsize="32"/>
> +  <reg name="pmpaddr5" bitsize="32"/>
> +  <reg name="pmpaddr6" bitsize="32"/>
> +  <reg name="pmpaddr7" bitsize="32"/>
> +  <reg name="pmpaddr8" bitsize="32"/>
> +  <reg name="pmpaddr9" bitsize="32"/>
> +  <reg name="pmpaddr10" bitsize="32"/>
> +  <reg name="pmpaddr11" bitsize="32"/>
> +  <reg name="pmpaddr12" bitsize="32"/>
> +  <reg name="pmpaddr13" bitsize="32"/>
> +  <reg name="pmpaddr14" bitsize="32"/>
> +  <reg name="pmpaddr15" bitsize="32"/>
> +  <reg name="mcycle" bitsize="32"/>
> +  <reg name="minstret" bitsize="32"/>
> +  <reg name="mhpmcounter3" bitsize="32"/>
> +  <reg name="mhpmcounter4" bitsize="32"/>
> +  <reg name="mhpmcounter5" bitsize="32"/>
> +  <reg name="mhpmcounter6" bitsize="32"/>
> +  <reg name="mhpmcounter7" bitsize="32"/>
> +  <reg name="mhpmcounter8" bitsize="32"/>
> +  <reg name="mhpmcounter9" bitsize="32"/>
> +  <reg name="mhpmcounter10" bitsize="32"/>
> +  <reg name="mhpmcounter11" bitsize="32"/>
> +  <reg name="mhpmcounter12" bitsize="32"/>
> +  <reg name="mhpmcounter13" bitsize="32"/>
> +  <reg name="mhpmcounter14" bitsize="32"/>
> +  <reg name="mhpmcounter15" bitsize="32"/>
> +  <reg name="mhpmcounter16" bitsize="32"/>
> +  <reg name="mhpmcounter17" bitsize="32"/>
> +  <reg name="mhpmcounter18" bitsize="32"/>
> +  <reg name="mhpmcounter19" bitsize="32"/>
> +  <reg name="mhpmcounter20" bitsize="32"/>
> +  <reg name="mhpmcounter21" bitsize="32"/>
> +  <reg name="mhpmcounter22" bitsize="32"/>
> +  <reg name="mhpmcounter23" bitsize="32"/>
> +  <reg name="mhpmcounter24" bitsize="32"/>
> +  <reg name="mhpmcounter25" bitsize="32"/>
> +  <reg name="mhpmcounter26" bitsize="32"/>
> +  <reg name="mhpmcounter27" bitsize="32"/>
> +  <reg name="mhpmcounter28" bitsize="32"/>
> +  <reg name="mhpmcounter29" bitsize="32"/>
> +  <reg name="mhpmcounter30" bitsize="32"/>
> +  <reg name="mhpmcounter31" bitsize="32"/>
> +  <reg name="mcycleh" bitsize="32"/>
> +  <reg name="minstreth" bitsize="32"/>
> +  <reg name="mhpmcounter3h" bitsize="32"/>
> +  <reg name="mhpmcounter4h" bitsize="32"/>
> +  <reg name="mhpmcounter5h" bitsize="32"/>
> +  <reg name="mhpmcounter6h" bitsize="32"/>
> +  <reg name="mhpmcounter7h" bitsize="32"/>
> +  <reg name="mhpmcounter8h" bitsize="32"/>
> +  <reg name="mhpmcounter9h" bitsize="32"/>
> +  <reg name="mhpmcounter10h" bitsize="32"/>
> +  <reg name="mhpmcounter11h" bitsize="32"/>
> +  <reg name="mhpmcounter12h" bitsize="32"/>
> +  <reg name="mhpmcounter13h" bitsize="32"/>
> +  <reg name="mhpmcounter14h" bitsize="32"/>
> +  <reg name="mhpmcounter15h" bitsize="32"/>
> +  <reg name="mhpmcounter16h" bitsize="32"/>
> +  <reg name="mhpmcounter17h" bitsize="32"/>
> +  <reg name="mhpmcounter18h" bitsize="32"/>
> +  <reg name="mhpmcounter19h" bitsize="32"/>
> +  <reg name="mhpmcounter20h" bitsize="32"/>
> +  <reg name="mhpmcounter21h" bitsize="32"/>
> +  <reg name="mhpmcounter22h" bitsize="32"/>
> +  <reg name="mhpmcounter23h" bitsize="32"/>
> +  <reg name="mhpmcounter24h" bitsize="32"/>
> +  <reg name="mhpmcounter25h" bitsize="32"/>
> +  <reg name="mhpmcounter26h" bitsize="32"/>
> +  <reg name="mhpmcounter27h" bitsize="32"/>
> +  <reg name="mhpmcounter28h" bitsize="32"/>
> +  <reg name="mhpmcounter29h" bitsize="32"/>
> +  <reg name="mhpmcounter30h" bitsize="32"/>
> +  <reg name="mhpmcounter31h" bitsize="32"/>
> +  <reg name="mhpmevent3" bitsize="32"/>
> +  <reg name="mhpmevent4" bitsize="32"/>
> +  <reg name="mhpmevent5" bitsize="32"/>
> +  <reg name="mhpmevent6" bitsize="32"/>
> +  <reg name="mhpmevent7" bitsize="32"/>
> +  <reg name="mhpmevent8" bitsize="32"/>
> +  <reg name="mhpmevent9" bitsize="32"/>
> +  <reg name="mhpmevent10" bitsize="32"/>
> +  <reg name="mhpmevent11" bitsize="32"/>
> +  <reg name="mhpmevent12" bitsize="32"/>
> +  <reg name="mhpmevent13" bitsize="32"/>
> +  <reg name="mhpmevent14" bitsize="32"/>
> +  <reg name="mhpmevent15" bitsize="32"/>
> +  <reg name="mhpmevent16" bitsize="32"/>
> +  <reg name="mhpmevent17" bitsize="32"/>
> +  <reg name="mhpmevent18" bitsize="32"/>
> +  <reg name="mhpmevent19" bitsize="32"/>
> +  <reg name="mhpmevent20" bitsize="32"/>
> +  <reg name="mhpmevent21" bitsize="32"/>
> +  <reg name="mhpmevent22" bitsize="32"/>
> +  <reg name="mhpmevent23" bitsize="32"/>
> +  <reg name="mhpmevent24" bitsize="32"/>
> +  <reg name="mhpmevent25" bitsize="32"/>
> +  <reg name="mhpmevent26" bitsize="32"/>
> +  <reg name="mhpmevent27" bitsize="32"/>
> +  <reg name="mhpmevent28" bitsize="32"/>
> +  <reg name="mhpmevent29" bitsize="32"/>
> +  <reg name="mhpmevent30" bitsize="32"/>
> +  <reg name="mhpmevent31" bitsize="32"/>
> +  <reg name="tselect" bitsize="32"/>
> +  <reg name="tdata1" bitsize="32"/>
> +  <reg name="tdata2" bitsize="32"/>
> +  <reg name="tdata3" bitsize="32"/>
> +  <reg name="dcsr" bitsize="32"/>
> +  <reg name="dpc" bitsize="32"/>
> +  <reg name="dscratch" bitsize="32"/>
> +  <reg name="hstatus" bitsize="32"/>
> +  <reg name="hedeleg" bitsize="32"/>
> +  <reg name="hideleg" bitsize="32"/>
> +  <reg name="hie" bitsize="32"/>
> +  <reg name="htvec" bitsize="32"/>
> +  <reg name="hscratch" bitsize="32"/>
> +  <reg name="hepc" bitsize="32"/>
> +  <reg name="hcause" bitsize="32"/>
> +  <reg name="hbadaddr" bitsize="32"/>
> +  <reg name="hip" bitsize="32"/>
> +  <reg name="mbase" bitsize="32"/>
> +  <reg name="mbound" bitsize="32"/>
> +  <reg name="mibase" bitsize="32"/>
> +  <reg name="mibound" bitsize="32"/>
> +  <reg name="mdbase" bitsize="32"/>
> +  <reg name="mdbound" bitsize="32"/>
> +  <reg name="mucounteren" bitsize="32"/>
> +  <reg name="mscounteren" bitsize="32"/>
> +  <reg name="mhcounteren" bitsize="32"/>
> +</feature>
> diff --git a/gdb-xml/riscv-32bit-fpu.xml b/gdb-xml/riscv-32bit-fpu.xml
> new file mode 100644
> index 0000000..32a1dee
> --- /dev/null
> +++ b/gdb-xml/riscv-32bit-fpu.xml
> @@ -0,0 +1,50 @@
> +<?xml version="1.0"?>
> +<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
> +
> +     Copying and distribution of this file, with or without modification,
> +     are permitted in any medium without royalty provided the copyright
> +     notice and this notice are preserved.  -->
> +
> +<!-- Register numbers are hard-coded in order to maintain backward
> +     compatibility with older versions of tools that didn't use xml
> +     register descriptions.  -->
> +
> +<!DOCTYPE feature SYSTEM "gdb-target.dtd">
> +<feature name="org.gnu.gdb.riscv.fpu">
> +  <reg name="ft0" bitsize="32" type="ieee_single" regnum="33"/>
> +  <reg name="ft1" bitsize="32" type="ieee_single"/>
> +  <reg name="ft2" bitsize="32" type="ieee_single"/>
> +  <reg name="ft3" bitsize="32" type="ieee_single"/>
> +  <reg name="ft4" bitsize="32" type="ieee_single"/>
> +  <reg name="ft5" bitsize="32" type="ieee_single"/>
> +  <reg name="ft6" bitsize="32" type="ieee_single"/>
> +  <reg name="ft7" bitsize="32" type="ieee_single"/>
> +  <reg name="fs0" bitsize="32" type="ieee_single"/>
> +  <reg name="fs1" bitsize="32" type="ieee_single"/>
> +  <reg name="fa0" bitsize="32" type="ieee_single"/>
> +  <reg name="fa1" bitsize="32" type="ieee_single"/>
> +  <reg name="fa2" bitsize="32" type="ieee_single"/>
> +  <reg name="fa3" bitsize="32" type="ieee_single"/>
> +  <reg name="fa4" bitsize="32" type="ieee_single"/>
> +  <reg name="fa5" bitsize="32" type="ieee_single"/>
> +  <reg name="fa6" bitsize="32" type="ieee_single"/>
> +  <reg name="fa7" bitsize="32" type="ieee_single"/>
> +  <reg name="fs2" bitsize="32" type="ieee_single"/>
> +  <reg name="fs3" bitsize="32" type="ieee_single"/>
> +  <reg name="fs4" bitsize="32" type="ieee_single"/>
> +  <reg name="fs5" bitsize="32" type="ieee_single"/>
> +  <reg name="fs6" bitsize="32" type="ieee_single"/>
> +  <reg name="fs7" bitsize="32" type="ieee_single"/>
> +  <reg name="fs8" bitsize="32" type="ieee_single"/>
> +  <reg name="fs9" bitsize="32" type="ieee_single"/>
> +  <reg name="fs10" bitsize="32" type="ieee_single"/>
> +  <reg name="fs11" bitsize="32" type="ieee_single"/>
> +  <reg name="ft8" bitsize="32" type="ieee_single"/>
> +  <reg name="ft9" bitsize="32" type="ieee_single"/>
> +  <reg name="ft10" bitsize="32" type="ieee_single"/>
> +  <reg name="ft11" bitsize="32" type="ieee_single"/>
> +
> +  <reg name="fflags" bitsize="32" type="int"/>
> +  <reg name="frm" bitsize="32" type="int"/>
> +  <reg name="fcsr" bitsize="32" type="int"/>
> +</feature>
> --
> 2.7.4
>
>

