Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gm3za-000215-K6
	for mharc-qemu-riscv@gnu.org; Tue, 22 Jan 2019 16:53:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gm3zX-0001xT-3K
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 16:53:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gm3zT-0003hX-Fx
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 16:53:54 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:35705)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gm3zE-0003Ml-MM; Tue, 22 Jan 2019 16:53:38 -0500
Received: by mail-lf1-x142.google.com with SMTP id e26so74558lfc.2;
	Tue, 22 Jan 2019 13:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=G8k6Tisq+Zu0vl+OadFEeJdekQWy5Nr1vF21b24TWlA=;
	b=BkQPYooqaroDhYLMNMYFv9BqK+fppRfxsOW9JUTV8jmb03eREF0o+k3OkS4fB9JSlX
	GVwTRvmngQV4aLqSYYMxViReeLu8vX4D8us2UbpDj1HIi6tQ4LaWRtbr+NjZG7FL29rN
	pfd9WRd3uMQILUqjB4z98dOfE+69EW4Vm7+8lhz4oL/0HFyHoyc0UFXnYFTUqTLpoH1H
	ztZ3Unu6i+3frEJLYMpMgoBzpwTC6pYxUdixNKNNcQNuA89llLSQ8c76x5YHUe//wV7d
	/ZMMGRGa+Qkl86FPmJIFZlGc4Ts8IKq7xzTweZozrtz9sN/H3yRxQI3nbQ8WHAGS+ghX
	pLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=G8k6Tisq+Zu0vl+OadFEeJdekQWy5Nr1vF21b24TWlA=;
	b=DGGFYg3cJ1kFfhCXQMYdNbmiznbWlasrtfn7KiNM+Jq9JcDORo5Y2gXOiYcQyM5fb3
	dLGai1UFaMRPaD0f8vpvhaRsI2e6LKAwbc3I1ED81BkcX+mV/hiV4xUUW78qNgs2En1s
	Ea6+RvC9HbzuHre3n+Vvzz7fM8NPYRB8temKjeJWRRfg+kV9ukDQdla5SBzUVcKJL+1c
	yTvpsMBM5VBMNsfX1UzAD+AJvZ/6yoX/waUTyCMHG0l1Yjscw/dSlXlCPpPrm+ZI1lW1
	WRX2A4MjphrWIYqEWZQGQ148bt0sjc1pODCjSrSJGSTVaPNfzuoim/u9e1osL6Bh0m7E
	hfGw==
X-Gm-Message-State: AJcUukc826lqxm/3gx+yWq/+Zfl0vMy2GhMxQ5BIkzLmfj8HpYB9I5bl
	RS51tKAHXTeMabyBo1O6K3brdwbJ6oGIn3Q/1Nk=
X-Google-Smtp-Source: ALg8bN7PB/d0mm3ZlVbvApjXdfWBsahTf+i+IXBaR3uPYozj9iWsRlKIPqkYQ29mTgaQugcC188+tUwYZGEpd0s7xmY=
X-Received: by 2002:a19:c995:: with SMTP id z143mr19583870lff.79.1548194013636;
	Tue, 22 Jan 2019 13:53:33 -0800 (PST)
MIME-Version: 1.0
References: <CAFyWVaai=5K7j8w+Abpk9jxGyKuo4v9w2BgmDbY=_29+Q++Jyw@mail.gmail.com>
	<20181228220731.4753-1-jimw@sifive.com>
In-Reply-To: <20181228220731.4753-1-jimw@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Jan 2019 13:53:06 -0800
Message-ID: <CAKmqyKOVEsKCeqDbyg-5theoETCJLfi5c+9EteCzCWx0kRRrrw@mail.gmail.com>
To: Jim Wilson <jimw@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 1/5 v2] RISC-V: Add 32-bit gdb
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
X-List-Received-Date: Tue, 22 Jan 2019 21:53:57 -0000

On Fri, Dec 28, 2018 at 2:24 PM Jim Wilson <jimw@sifive.com> wrote:
>
> Signed-off-by: Jim Wilson <jimw@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  configure                   |   1 +
>  gdb-xml/riscv-32bit-cpu.xml |  43 ++++++++
>  gdb-xml/riscv-32bit-csr.xml | 250 ++++++++++++++++++++++++++++++++++++++++++++
>  gdb-xml/riscv-32bit-fpu.xml |  46 ++++++++
>  4 files changed, 340 insertions(+)
>  create mode 100644 gdb-xml/riscv-32bit-cpu.xml
>  create mode 100644 gdb-xml/riscv-32bit-csr.xml
>  create mode 100644 gdb-xml/riscv-32bit-fpu.xml
>
> diff --git a/configure b/configure
> index 224d307..4e05eed 100755
> --- a/configure
> +++ b/configure
> @@ -7208,6 +7208,7 @@ case "$target_name" in
>      TARGET_BASE_ARCH=riscv
>      TARGET_ABI_DIR=riscv
>      mttcg=yes
> +    gdb_xml_files="riscv-32bit-cpu.xml riscv-32bit-fpu.xml riscv-32bit-csr.xml"
>      target_compiler=$cross_cc_riscv32
>    ;;
>    riscv64)
> diff --git a/gdb-xml/riscv-32bit-cpu.xml b/gdb-xml/riscv-32bit-cpu.xml
> new file mode 100644
> index 0000000..c02f86c
> --- /dev/null
> +++ b/gdb-xml/riscv-32bit-cpu.xml
> @@ -0,0 +1,43 @@
> +<?xml version="1.0"?>
> +<!-- Copyright (C) 2018 Free Software Foundation, Inc.
> +
> +     Copying and distribution of this file, with or without modification,
> +     are permitted in any medium without royalty provided the copyright
> +     notice and this notice are preserved.  -->
> +
> +<!DOCTYPE feature SYSTEM "gdb-target.dtd">
> +<feature name="org.gnu.gdb.riscv.cpu">
> +  <reg name="zero" bitsize="32" type="int"/>
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
> index 0000000..4aea9e6
> --- /dev/null
> +++ b/gdb-xml/riscv-32bit-csr.xml
> @@ -0,0 +1,250 @@
> +<?xml version="1.0"?>
> +<!-- Copyright (C) 2018 Free Software Foundation, Inc.
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
> index 0000000..783287d
> --- /dev/null
> +++ b/gdb-xml/riscv-32bit-fpu.xml
> @@ -0,0 +1,46 @@
> +<?xml version="1.0"?>
> +<!-- Copyright (C) 2018 Free Software Foundation, Inc.
> +
> +     Copying and distribution of this file, with or without modification,
> +     are permitted in any medium without royalty provided the copyright
> +     notice and this notice are preserved.  -->
> +
> +<!DOCTYPE feature SYSTEM "gdb-target.dtd">
> +<feature name="org.gnu.gdb.riscv.fpu">
> +  <reg name="ft0" bitsize="32" type="ieee_single"/>
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

