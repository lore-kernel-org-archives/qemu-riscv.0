Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0qjI-0000HC-Al
	for mharc-qemu-riscv@gnu.org; Sat, 16 Jan 2021 13:55:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0qjF-0000Gu-UO; Sat, 16 Jan 2021 13:55:18 -0500
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:35258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0qjB-0004jJ-J3; Sat, 16 Jan 2021 13:55:17 -0500
Received: by mail-io1-xd2a.google.com with SMTP id y19so24863205iov.2;
 Sat, 16 Jan 2021 10:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vlA+5I0hQh+0V2R5GVVGQy3XMpLGEJI71yMm2qbh9dM=;
 b=SoWjXs74++hvTeK6VyLnGAvtyyE+xDqy9hCco1J+G2fzZYwJXZ8JZZanUYze/MbmGp
 c0eIZnAjMXHIp/OWRuAx0aNnCzFisZoEKikVgZWciyneGHiuLZq6v/WNKXTi83eRjTWP
 haYkPyEsyP1u+GJLIcBCmCd0eHaKm6JmqcvaX16CTOlscx8mHUsY5JPZ2NZzaTYlTInC
 vsTPsBQlcq3/+DynPrncheGz7DJxuptK9Uw0DuRZ7Q3XwZ9qeHs3Bl0zQNpStThtGRUr
 lNFgfzfu1E3Zcvx6pHAT1s/wRnlQonLbdsOSZ0z4GWTME8bdOofTaH1A+GQTRapdZUG8
 pOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vlA+5I0hQh+0V2R5GVVGQy3XMpLGEJI71yMm2qbh9dM=;
 b=kSP09zskymaLTAKQrSgXA78KvxXYmxnuBz99vU8qbO/ZLlugU/dD4c8LpPedbp9UbC
 PIcAlnGm90TxWZ1EGnfXs4P60pYD3IGLckWF9pFgQXSVwZoA5Yd3qyw8rokUjorJGvPz
 8hZjJETHJM0uWau/RjbeD1OA+o06mhwKcqUl4Ouv89QOOyOjlzt2gz6AVD68s/3otiHq
 AB23UgJCybJaiODGchcRLqbXxvxIzQloUMI6opjQTjmVTFOIfAwAyUaa9ZUzYfOrMdeS
 FIdiv6LWslpVFSgDCr364BFV0N+EvuRp4MEXUPrQ3cDIsKZlxTsRn/+0RDPgfJ1pTiX7
 FNQg==
X-Gm-Message-State: AOAM532lH2bmBvRyXnArzKJ4mo3gR4zkDA72fQDAp80gzN5sTaFW/v+Y
 DYdOotQow41AzSxT5Jpvz22yqzw0t2kY/uvJUpQ=
X-Google-Smtp-Source: ABdhPJx3AOQChy4jzT9d8CT1ClfIPjETHcDDp5BCC6Cp5HMjwAPzNthNQrGeBX181p6Jbp6uhuEy0SOm8uDgpTtVsdc=
X-Received: by 2002:a05:6e02:194f:: with SMTP id
 x15mr15897881ilu.177.1610823311811; 
 Sat, 16 Jan 2021 10:55:11 -0800 (PST)
MIME-Version: 1.0
References: <20210116054123.5457-1-bmeng.cn@gmail.com>
 <20210116054123.5457-3-bmeng.cn@gmail.com>
In-Reply-To: <20210116054123.5457-3-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 16 Jan 2021 10:54:44 -0800
Message-ID: <CAKmqyKNaS=Xct=ve9XuXZm1Ok0ZdaQC2dXaq__UoP7KzkpEm+w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv: Remove built-in GDB XML files for
 CSRs
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Jim Wilson <jimw@sifive.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
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
X-List-Received-Date: Sat, 16 Jan 2021 18:55:18 -0000

On Fri, Jan 15, 2021 at 9:42 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Now that we have switched to generate the RISC-V CSR XML dynamically,
> remove the built-in hardcoded XML files.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> ---
>
> (no changes since v1)
>
>  .../targets/riscv32-linux-user.mak            |   2 +-
>  default-configs/targets/riscv32-softmmu.mak   |   2 +-
>  .../targets/riscv64-linux-user.mak            |   2 +-
>  default-configs/targets/riscv64-softmmu.mak   |   2 +-
>  gdb-xml/riscv-32bit-csr.xml                   | 250 ------------------
>  gdb-xml/riscv-64bit-csr.xml                   | 250 ------------------
>  6 files changed, 4 insertions(+), 504 deletions(-)
>  delete mode 100644 gdb-xml/riscv-32bit-csr.xml
>  delete mode 100644 gdb-xml/riscv-64bit-csr.xml
>
> diff --git a/default-configs/targets/riscv32-linux-user.mak b/default-configs/targets/riscv32-linux-user.mak
> index dfb259e8aa..07e6ca13f3 100644
> --- a/default-configs/targets/riscv32-linux-user.mak
> +++ b/default-configs/targets/riscv32-linux-user.mak
> @@ -1,4 +1,4 @@
>  TARGET_ARCH=riscv32
>  TARGET_BASE_ARCH=riscv
>  TARGET_ABI_DIR=riscv
> -TARGET_XML_FILES= gdb-xml/riscv-32bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-32bit-csr.xml gdb-xml/riscv-32bit-virtual.xml
> +TARGET_XML_FILES= gdb-xml/riscv-32bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-32bit-virtual.xml
> diff --git a/default-configs/targets/riscv32-softmmu.mak b/default-configs/targets/riscv32-softmmu.mak
> index 9446d96d13..d8b71cddcd 100644
> --- a/default-configs/targets/riscv32-softmmu.mak
> +++ b/default-configs/targets/riscv32-softmmu.mak
> @@ -1,5 +1,5 @@
>  TARGET_ARCH=riscv32
>  TARGET_BASE_ARCH=riscv
>  TARGET_SUPPORTS_MTTCG=y
> -TARGET_XML_FILES= gdb-xml/riscv-32bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-32bit-csr.xml gdb-xml/riscv-32bit-virtual.xml
> +TARGET_XML_FILES= gdb-xml/riscv-32bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-32bit-virtual.xml
>  TARGET_NEED_FDT=y
> diff --git a/default-configs/targets/riscv64-linux-user.mak b/default-configs/targets/riscv64-linux-user.mak
> index b13895f3b0..191c2c483f 100644
> --- a/default-configs/targets/riscv64-linux-user.mak
> +++ b/default-configs/targets/riscv64-linux-user.mak
> @@ -1,4 +1,4 @@
>  TARGET_ARCH=riscv64
>  TARGET_BASE_ARCH=riscv
>  TARGET_ABI_DIR=riscv
> -TARGET_XML_FILES= gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-csr.xml gdb-xml/riscv-64bit-virtual.xml
> +TARGET_XML_FILES= gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-virtual.xml
> diff --git a/default-configs/targets/riscv64-softmmu.mak b/default-configs/targets/riscv64-softmmu.mak
> index d809bd666a..7c0e7eeb42 100644
> --- a/default-configs/targets/riscv64-softmmu.mak
> +++ b/default-configs/targets/riscv64-softmmu.mak
> @@ -1,5 +1,5 @@
>  TARGET_ARCH=riscv64
>  TARGET_BASE_ARCH=riscv
>  TARGET_SUPPORTS_MTTCG=y
> -TARGET_XML_FILES= gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-csr.xml gdb-xml/riscv-64bit-virtual.xml
> +TARGET_XML_FILES= gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-virtual.xml
>  TARGET_NEED_FDT=y
> diff --git a/gdb-xml/riscv-32bit-csr.xml b/gdb-xml/riscv-32bit-csr.xml
> deleted file mode 100644
> index da1bf19e2f..0000000000
> --- a/gdb-xml/riscv-32bit-csr.xml
> +++ /dev/null
> @@ -1,250 +0,0 @@
> -<?xml version="1.0"?>
> -<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
> -
> -     Copying and distribution of this file, with or without modification,
> -     are permitted in any medium without royalty provided the copyright
> -     notice and this notice are preserved.  -->
> -
> -<!DOCTYPE feature SYSTEM "gdb-target.dtd">
> -<feature name="org.gnu.gdb.riscv.csr">
> -  <reg name="ustatus" bitsize="32"/>
> -  <reg name="uie" bitsize="32"/>
> -  <reg name="utvec" bitsize="32"/>
> -  <reg name="uscratch" bitsize="32"/>
> -  <reg name="uepc" bitsize="32"/>
> -  <reg name="ucause" bitsize="32"/>
> -  <reg name="utval" bitsize="32"/>
> -  <reg name="uip" bitsize="32"/>
> -  <reg name="fflags" bitsize="32"/>
> -  <reg name="frm" bitsize="32"/>
> -  <reg name="fcsr" bitsize="32"/>
> -  <reg name="cycle" bitsize="32"/>
> -  <reg name="time" bitsize="32"/>
> -  <reg name="instret" bitsize="32"/>
> -  <reg name="hpmcounter3" bitsize="32"/>
> -  <reg name="hpmcounter4" bitsize="32"/>
> -  <reg name="hpmcounter5" bitsize="32"/>
> -  <reg name="hpmcounter6" bitsize="32"/>
> -  <reg name="hpmcounter7" bitsize="32"/>
> -  <reg name="hpmcounter8" bitsize="32"/>
> -  <reg name="hpmcounter9" bitsize="32"/>
> -  <reg name="hpmcounter10" bitsize="32"/>
> -  <reg name="hpmcounter11" bitsize="32"/>
> -  <reg name="hpmcounter12" bitsize="32"/>
> -  <reg name="hpmcounter13" bitsize="32"/>
> -  <reg name="hpmcounter14" bitsize="32"/>
> -  <reg name="hpmcounter15" bitsize="32"/>
> -  <reg name="hpmcounter16" bitsize="32"/>
> -  <reg name="hpmcounter17" bitsize="32"/>
> -  <reg name="hpmcounter18" bitsize="32"/>
> -  <reg name="hpmcounter19" bitsize="32"/>
> -  <reg name="hpmcounter20" bitsize="32"/>
> -  <reg name="hpmcounter21" bitsize="32"/>
> -  <reg name="hpmcounter22" bitsize="32"/>
> -  <reg name="hpmcounter23" bitsize="32"/>
> -  <reg name="hpmcounter24" bitsize="32"/>
> -  <reg name="hpmcounter25" bitsize="32"/>
> -  <reg name="hpmcounter26" bitsize="32"/>
> -  <reg name="hpmcounter27" bitsize="32"/>
> -  <reg name="hpmcounter28" bitsize="32"/>
> -  <reg name="hpmcounter29" bitsize="32"/>
> -  <reg name="hpmcounter30" bitsize="32"/>
> -  <reg name="hpmcounter31" bitsize="32"/>
> -  <reg name="cycleh" bitsize="32"/>
> -  <reg name="timeh" bitsize="32"/>
> -  <reg name="instreth" bitsize="32"/>
> -  <reg name="hpmcounter3h" bitsize="32"/>
> -  <reg name="hpmcounter4h" bitsize="32"/>
> -  <reg name="hpmcounter5h" bitsize="32"/>
> -  <reg name="hpmcounter6h" bitsize="32"/>
> -  <reg name="hpmcounter7h" bitsize="32"/>
> -  <reg name="hpmcounter8h" bitsize="32"/>
> -  <reg name="hpmcounter9h" bitsize="32"/>
> -  <reg name="hpmcounter10h" bitsize="32"/>
> -  <reg name="hpmcounter11h" bitsize="32"/>
> -  <reg name="hpmcounter12h" bitsize="32"/>
> -  <reg name="hpmcounter13h" bitsize="32"/>
> -  <reg name="hpmcounter14h" bitsize="32"/>
> -  <reg name="hpmcounter15h" bitsize="32"/>
> -  <reg name="hpmcounter16h" bitsize="32"/>
> -  <reg name="hpmcounter17h" bitsize="32"/>
> -  <reg name="hpmcounter18h" bitsize="32"/>
> -  <reg name="hpmcounter19h" bitsize="32"/>
> -  <reg name="hpmcounter20h" bitsize="32"/>
> -  <reg name="hpmcounter21h" bitsize="32"/>
> -  <reg name="hpmcounter22h" bitsize="32"/>
> -  <reg name="hpmcounter23h" bitsize="32"/>
> -  <reg name="hpmcounter24h" bitsize="32"/>
> -  <reg name="hpmcounter25h" bitsize="32"/>
> -  <reg name="hpmcounter26h" bitsize="32"/>
> -  <reg name="hpmcounter27h" bitsize="32"/>
> -  <reg name="hpmcounter28h" bitsize="32"/>
> -  <reg name="hpmcounter29h" bitsize="32"/>
> -  <reg name="hpmcounter30h" bitsize="32"/>
> -  <reg name="hpmcounter31h" bitsize="32"/>
> -  <reg name="sstatus" bitsize="32"/>
> -  <reg name="sedeleg" bitsize="32"/>
> -  <reg name="sideleg" bitsize="32"/>
> -  <reg name="sie" bitsize="32"/>
> -  <reg name="stvec" bitsize="32"/>
> -  <reg name="scounteren" bitsize="32"/>
> -  <reg name="sscratch" bitsize="32"/>
> -  <reg name="sepc" bitsize="32"/>
> -  <reg name="scause" bitsize="32"/>
> -  <reg name="stval" bitsize="32"/>
> -  <reg name="sip" bitsize="32"/>
> -  <reg name="satp" bitsize="32"/>
> -  <reg name="mvendorid" bitsize="32"/>
> -  <reg name="marchid" bitsize="32"/>
> -  <reg name="mimpid" bitsize="32"/>
> -  <reg name="mhartid" bitsize="32"/>
> -  <reg name="mstatus" bitsize="32"/>
> -  <reg name="misa" bitsize="32"/>
> -  <reg name="medeleg" bitsize="32"/>
> -  <reg name="mideleg" bitsize="32"/>
> -  <reg name="mie" bitsize="32"/>
> -  <reg name="mtvec" bitsize="32"/>
> -  <reg name="mcounteren" bitsize="32"/>
> -  <reg name="mscratch" bitsize="32"/>
> -  <reg name="mepc" bitsize="32"/>
> -  <reg name="mcause" bitsize="32"/>
> -  <reg name="mtval" bitsize="32"/>
> -  <reg name="mip" bitsize="32"/>
> -  <reg name="pmpcfg0" bitsize="32"/>
> -  <reg name="pmpcfg1" bitsize="32"/>
> -  <reg name="pmpcfg2" bitsize="32"/>
> -  <reg name="pmpcfg3" bitsize="32"/>
> -  <reg name="pmpaddr0" bitsize="32"/>
> -  <reg name="pmpaddr1" bitsize="32"/>
> -  <reg name="pmpaddr2" bitsize="32"/>
> -  <reg name="pmpaddr3" bitsize="32"/>
> -  <reg name="pmpaddr4" bitsize="32"/>
> -  <reg name="pmpaddr5" bitsize="32"/>
> -  <reg name="pmpaddr6" bitsize="32"/>
> -  <reg name="pmpaddr7" bitsize="32"/>
> -  <reg name="pmpaddr8" bitsize="32"/>
> -  <reg name="pmpaddr9" bitsize="32"/>
> -  <reg name="pmpaddr10" bitsize="32"/>
> -  <reg name="pmpaddr11" bitsize="32"/>
> -  <reg name="pmpaddr12" bitsize="32"/>
> -  <reg name="pmpaddr13" bitsize="32"/>
> -  <reg name="pmpaddr14" bitsize="32"/>
> -  <reg name="pmpaddr15" bitsize="32"/>
> -  <reg name="mcycle" bitsize="32"/>
> -  <reg name="minstret" bitsize="32"/>
> -  <reg name="mhpmcounter3" bitsize="32"/>
> -  <reg name="mhpmcounter4" bitsize="32"/>
> -  <reg name="mhpmcounter5" bitsize="32"/>
> -  <reg name="mhpmcounter6" bitsize="32"/>
> -  <reg name="mhpmcounter7" bitsize="32"/>
> -  <reg name="mhpmcounter8" bitsize="32"/>
> -  <reg name="mhpmcounter9" bitsize="32"/>
> -  <reg name="mhpmcounter10" bitsize="32"/>
> -  <reg name="mhpmcounter11" bitsize="32"/>
> -  <reg name="mhpmcounter12" bitsize="32"/>
> -  <reg name="mhpmcounter13" bitsize="32"/>
> -  <reg name="mhpmcounter14" bitsize="32"/>
> -  <reg name="mhpmcounter15" bitsize="32"/>
> -  <reg name="mhpmcounter16" bitsize="32"/>
> -  <reg name="mhpmcounter17" bitsize="32"/>
> -  <reg name="mhpmcounter18" bitsize="32"/>
> -  <reg name="mhpmcounter19" bitsize="32"/>
> -  <reg name="mhpmcounter20" bitsize="32"/>
> -  <reg name="mhpmcounter21" bitsize="32"/>
> -  <reg name="mhpmcounter22" bitsize="32"/>
> -  <reg name="mhpmcounter23" bitsize="32"/>
> -  <reg name="mhpmcounter24" bitsize="32"/>
> -  <reg name="mhpmcounter25" bitsize="32"/>
> -  <reg name="mhpmcounter26" bitsize="32"/>
> -  <reg name="mhpmcounter27" bitsize="32"/>
> -  <reg name="mhpmcounter28" bitsize="32"/>
> -  <reg name="mhpmcounter29" bitsize="32"/>
> -  <reg name="mhpmcounter30" bitsize="32"/>
> -  <reg name="mhpmcounter31" bitsize="32"/>
> -  <reg name="mcycleh" bitsize="32"/>
> -  <reg name="minstreth" bitsize="32"/>
> -  <reg name="mhpmcounter3h" bitsize="32"/>
> -  <reg name="mhpmcounter4h" bitsize="32"/>
> -  <reg name="mhpmcounter5h" bitsize="32"/>
> -  <reg name="mhpmcounter6h" bitsize="32"/>
> -  <reg name="mhpmcounter7h" bitsize="32"/>
> -  <reg name="mhpmcounter8h" bitsize="32"/>
> -  <reg name="mhpmcounter9h" bitsize="32"/>
> -  <reg name="mhpmcounter10h" bitsize="32"/>
> -  <reg name="mhpmcounter11h" bitsize="32"/>
> -  <reg name="mhpmcounter12h" bitsize="32"/>
> -  <reg name="mhpmcounter13h" bitsize="32"/>
> -  <reg name="mhpmcounter14h" bitsize="32"/>
> -  <reg name="mhpmcounter15h" bitsize="32"/>
> -  <reg name="mhpmcounter16h" bitsize="32"/>
> -  <reg name="mhpmcounter17h" bitsize="32"/>
> -  <reg name="mhpmcounter18h" bitsize="32"/>
> -  <reg name="mhpmcounter19h" bitsize="32"/>
> -  <reg name="mhpmcounter20h" bitsize="32"/>
> -  <reg name="mhpmcounter21h" bitsize="32"/>
> -  <reg name="mhpmcounter22h" bitsize="32"/>
> -  <reg name="mhpmcounter23h" bitsize="32"/>
> -  <reg name="mhpmcounter24h" bitsize="32"/>
> -  <reg name="mhpmcounter25h" bitsize="32"/>
> -  <reg name="mhpmcounter26h" bitsize="32"/>
> -  <reg name="mhpmcounter27h" bitsize="32"/>
> -  <reg name="mhpmcounter28h" bitsize="32"/>
> -  <reg name="mhpmcounter29h" bitsize="32"/>
> -  <reg name="mhpmcounter30h" bitsize="32"/>
> -  <reg name="mhpmcounter31h" bitsize="32"/>
> -  <reg name="mhpmevent3" bitsize="32"/>
> -  <reg name="mhpmevent4" bitsize="32"/>
> -  <reg name="mhpmevent5" bitsize="32"/>
> -  <reg name="mhpmevent6" bitsize="32"/>
> -  <reg name="mhpmevent7" bitsize="32"/>
> -  <reg name="mhpmevent8" bitsize="32"/>
> -  <reg name="mhpmevent9" bitsize="32"/>
> -  <reg name="mhpmevent10" bitsize="32"/>
> -  <reg name="mhpmevent11" bitsize="32"/>
> -  <reg name="mhpmevent12" bitsize="32"/>
> -  <reg name="mhpmevent13" bitsize="32"/>
> -  <reg name="mhpmevent14" bitsize="32"/>
> -  <reg name="mhpmevent15" bitsize="32"/>
> -  <reg name="mhpmevent16" bitsize="32"/>
> -  <reg name="mhpmevent17" bitsize="32"/>
> -  <reg name="mhpmevent18" bitsize="32"/>
> -  <reg name="mhpmevent19" bitsize="32"/>
> -  <reg name="mhpmevent20" bitsize="32"/>
> -  <reg name="mhpmevent21" bitsize="32"/>
> -  <reg name="mhpmevent22" bitsize="32"/>
> -  <reg name="mhpmevent23" bitsize="32"/>
> -  <reg name="mhpmevent24" bitsize="32"/>
> -  <reg name="mhpmevent25" bitsize="32"/>
> -  <reg name="mhpmevent26" bitsize="32"/>
> -  <reg name="mhpmevent27" bitsize="32"/>
> -  <reg name="mhpmevent28" bitsize="32"/>
> -  <reg name="mhpmevent29" bitsize="32"/>
> -  <reg name="mhpmevent30" bitsize="32"/>
> -  <reg name="mhpmevent31" bitsize="32"/>
> -  <reg name="tselect" bitsize="32"/>
> -  <reg name="tdata1" bitsize="32"/>
> -  <reg name="tdata2" bitsize="32"/>
> -  <reg name="tdata3" bitsize="32"/>
> -  <reg name="dcsr" bitsize="32"/>
> -  <reg name="dpc" bitsize="32"/>
> -  <reg name="dscratch" bitsize="32"/>
> -  <reg name="hstatus" bitsize="32"/>
> -  <reg name="hedeleg" bitsize="32"/>
> -  <reg name="hideleg" bitsize="32"/>
> -  <reg name="hie" bitsize="32"/>
> -  <reg name="htvec" bitsize="32"/>
> -  <reg name="hscratch" bitsize="32"/>
> -  <reg name="hepc" bitsize="32"/>
> -  <reg name="hcause" bitsize="32"/>
> -  <reg name="hbadaddr" bitsize="32"/>
> -  <reg name="hip" bitsize="32"/>
> -  <reg name="mbase" bitsize="32"/>
> -  <reg name="mbound" bitsize="32"/>
> -  <reg name="mibase" bitsize="32"/>
> -  <reg name="mibound" bitsize="32"/>
> -  <reg name="mdbase" bitsize="32"/>
> -  <reg name="mdbound" bitsize="32"/>
> -  <reg name="mucounteren" bitsize="32"/>
> -  <reg name="mscounteren" bitsize="32"/>
> -  <reg name="mhcounteren" bitsize="32"/>
> -</feature>
> diff --git a/gdb-xml/riscv-64bit-csr.xml b/gdb-xml/riscv-64bit-csr.xml
> deleted file mode 100644
> index 6aa4bed9f5..0000000000
> --- a/gdb-xml/riscv-64bit-csr.xml
> +++ /dev/null
> @@ -1,250 +0,0 @@
> -<?xml version="1.0"?>
> -<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
> -
> -     Copying and distribution of this file, with or without modification,
> -     are permitted in any medium without royalty provided the copyright
> -     notice and this notice are preserved.  -->
> -
> -<!DOCTYPE feature SYSTEM "gdb-target.dtd">
> -<feature name="org.gnu.gdb.riscv.csr">
> -  <reg name="ustatus" bitsize="64"/>
> -  <reg name="uie" bitsize="64"/>
> -  <reg name="utvec" bitsize="64"/>
> -  <reg name="uscratch" bitsize="64"/>
> -  <reg name="uepc" bitsize="64"/>
> -  <reg name="ucause" bitsize="64"/>
> -  <reg name="utval" bitsize="64"/>
> -  <reg name="uip" bitsize="64"/>
> -  <reg name="fflags" bitsize="64"/>
> -  <reg name="frm" bitsize="64"/>
> -  <reg name="fcsr" bitsize="64"/>
> -  <reg name="cycle" bitsize="64"/>
> -  <reg name="time" bitsize="64"/>
> -  <reg name="instret" bitsize="64"/>
> -  <reg name="hpmcounter3" bitsize="64"/>
> -  <reg name="hpmcounter4" bitsize="64"/>
> -  <reg name="hpmcounter5" bitsize="64"/>
> -  <reg name="hpmcounter6" bitsize="64"/>
> -  <reg name="hpmcounter7" bitsize="64"/>
> -  <reg name="hpmcounter8" bitsize="64"/>
> -  <reg name="hpmcounter9" bitsize="64"/>
> -  <reg name="hpmcounter10" bitsize="64"/>
> -  <reg name="hpmcounter11" bitsize="64"/>
> -  <reg name="hpmcounter12" bitsize="64"/>
> -  <reg name="hpmcounter13" bitsize="64"/>
> -  <reg name="hpmcounter14" bitsize="64"/>
> -  <reg name="hpmcounter15" bitsize="64"/>
> -  <reg name="hpmcounter16" bitsize="64"/>
> -  <reg name="hpmcounter17" bitsize="64"/>
> -  <reg name="hpmcounter18" bitsize="64"/>
> -  <reg name="hpmcounter19" bitsize="64"/>
> -  <reg name="hpmcounter20" bitsize="64"/>
> -  <reg name="hpmcounter21" bitsize="64"/>
> -  <reg name="hpmcounter22" bitsize="64"/>
> -  <reg name="hpmcounter23" bitsize="64"/>
> -  <reg name="hpmcounter24" bitsize="64"/>
> -  <reg name="hpmcounter25" bitsize="64"/>
> -  <reg name="hpmcounter26" bitsize="64"/>
> -  <reg name="hpmcounter27" bitsize="64"/>
> -  <reg name="hpmcounter28" bitsize="64"/>
> -  <reg name="hpmcounter29" bitsize="64"/>
> -  <reg name="hpmcounter30" bitsize="64"/>
> -  <reg name="hpmcounter31" bitsize="64"/>
> -  <reg name="cycleh" bitsize="64"/>
> -  <reg name="timeh" bitsize="64"/>
> -  <reg name="instreth" bitsize="64"/>
> -  <reg name="hpmcounter3h" bitsize="64"/>
> -  <reg name="hpmcounter4h" bitsize="64"/>
> -  <reg name="hpmcounter5h" bitsize="64"/>
> -  <reg name="hpmcounter6h" bitsize="64"/>
> -  <reg name="hpmcounter7h" bitsize="64"/>
> -  <reg name="hpmcounter8h" bitsize="64"/>
> -  <reg name="hpmcounter9h" bitsize="64"/>
> -  <reg name="hpmcounter10h" bitsize="64"/>
> -  <reg name="hpmcounter11h" bitsize="64"/>
> -  <reg name="hpmcounter12h" bitsize="64"/>
> -  <reg name="hpmcounter13h" bitsize="64"/>
> -  <reg name="hpmcounter14h" bitsize="64"/>
> -  <reg name="hpmcounter15h" bitsize="64"/>
> -  <reg name="hpmcounter16h" bitsize="64"/>
> -  <reg name="hpmcounter17h" bitsize="64"/>
> -  <reg name="hpmcounter18h" bitsize="64"/>
> -  <reg name="hpmcounter19h" bitsize="64"/>
> -  <reg name="hpmcounter20h" bitsize="64"/>
> -  <reg name="hpmcounter21h" bitsize="64"/>
> -  <reg name="hpmcounter22h" bitsize="64"/>
> -  <reg name="hpmcounter23h" bitsize="64"/>
> -  <reg name="hpmcounter24h" bitsize="64"/>
> -  <reg name="hpmcounter25h" bitsize="64"/>
> -  <reg name="hpmcounter26h" bitsize="64"/>
> -  <reg name="hpmcounter27h" bitsize="64"/>
> -  <reg name="hpmcounter28h" bitsize="64"/>
> -  <reg name="hpmcounter29h" bitsize="64"/>
> -  <reg name="hpmcounter30h" bitsize="64"/>
> -  <reg name="hpmcounter31h" bitsize="64"/>
> -  <reg name="sstatus" bitsize="64"/>
> -  <reg name="sedeleg" bitsize="64"/>
> -  <reg name="sideleg" bitsize="64"/>
> -  <reg name="sie" bitsize="64"/>
> -  <reg name="stvec" bitsize="64"/>
> -  <reg name="scounteren" bitsize="64"/>
> -  <reg name="sscratch" bitsize="64"/>
> -  <reg name="sepc" bitsize="64"/>
> -  <reg name="scause" bitsize="64"/>
> -  <reg name="stval" bitsize="64"/>
> -  <reg name="sip" bitsize="64"/>
> -  <reg name="satp" bitsize="64"/>
> -  <reg name="mvendorid" bitsize="64"/>
> -  <reg name="marchid" bitsize="64"/>
> -  <reg name="mimpid" bitsize="64"/>
> -  <reg name="mhartid" bitsize="64"/>
> -  <reg name="mstatus" bitsize="64"/>
> -  <reg name="misa" bitsize="64"/>
> -  <reg name="medeleg" bitsize="64"/>
> -  <reg name="mideleg" bitsize="64"/>
> -  <reg name="mie" bitsize="64"/>
> -  <reg name="mtvec" bitsize="64"/>
> -  <reg name="mcounteren" bitsize="64"/>
> -  <reg name="mscratch" bitsize="64"/>
> -  <reg name="mepc" bitsize="64"/>
> -  <reg name="mcause" bitsize="64"/>
> -  <reg name="mtval" bitsize="64"/>
> -  <reg name="mip" bitsize="64"/>
> -  <reg name="pmpcfg0" bitsize="64"/>
> -  <reg name="pmpcfg1" bitsize="64"/>
> -  <reg name="pmpcfg2" bitsize="64"/>
> -  <reg name="pmpcfg3" bitsize="64"/>
> -  <reg name="pmpaddr0" bitsize="64"/>
> -  <reg name="pmpaddr1" bitsize="64"/>
> -  <reg name="pmpaddr2" bitsize="64"/>
> -  <reg name="pmpaddr3" bitsize="64"/>
> -  <reg name="pmpaddr4" bitsize="64"/>
> -  <reg name="pmpaddr5" bitsize="64"/>
> -  <reg name="pmpaddr6" bitsize="64"/>
> -  <reg name="pmpaddr7" bitsize="64"/>
> -  <reg name="pmpaddr8" bitsize="64"/>
> -  <reg name="pmpaddr9" bitsize="64"/>
> -  <reg name="pmpaddr10" bitsize="64"/>
> -  <reg name="pmpaddr11" bitsize="64"/>
> -  <reg name="pmpaddr12" bitsize="64"/>
> -  <reg name="pmpaddr13" bitsize="64"/>
> -  <reg name="pmpaddr14" bitsize="64"/>
> -  <reg name="pmpaddr15" bitsize="64"/>
> -  <reg name="mcycle" bitsize="64"/>
> -  <reg name="minstret" bitsize="64"/>
> -  <reg name="mhpmcounter3" bitsize="64"/>
> -  <reg name="mhpmcounter4" bitsize="64"/>
> -  <reg name="mhpmcounter5" bitsize="64"/>
> -  <reg name="mhpmcounter6" bitsize="64"/>
> -  <reg name="mhpmcounter7" bitsize="64"/>
> -  <reg name="mhpmcounter8" bitsize="64"/>
> -  <reg name="mhpmcounter9" bitsize="64"/>
> -  <reg name="mhpmcounter10" bitsize="64"/>
> -  <reg name="mhpmcounter11" bitsize="64"/>
> -  <reg name="mhpmcounter12" bitsize="64"/>
> -  <reg name="mhpmcounter13" bitsize="64"/>
> -  <reg name="mhpmcounter14" bitsize="64"/>
> -  <reg name="mhpmcounter15" bitsize="64"/>
> -  <reg name="mhpmcounter16" bitsize="64"/>
> -  <reg name="mhpmcounter17" bitsize="64"/>
> -  <reg name="mhpmcounter18" bitsize="64"/>
> -  <reg name="mhpmcounter19" bitsize="64"/>
> -  <reg name="mhpmcounter20" bitsize="64"/>
> -  <reg name="mhpmcounter21" bitsize="64"/>
> -  <reg name="mhpmcounter22" bitsize="64"/>
> -  <reg name="mhpmcounter23" bitsize="64"/>
> -  <reg name="mhpmcounter24" bitsize="64"/>
> -  <reg name="mhpmcounter25" bitsize="64"/>
> -  <reg name="mhpmcounter26" bitsize="64"/>
> -  <reg name="mhpmcounter27" bitsize="64"/>
> -  <reg name="mhpmcounter28" bitsize="64"/>
> -  <reg name="mhpmcounter29" bitsize="64"/>
> -  <reg name="mhpmcounter30" bitsize="64"/>
> -  <reg name="mhpmcounter31" bitsize="64"/>
> -  <reg name="mcycleh" bitsize="64"/>
> -  <reg name="minstreth" bitsize="64"/>
> -  <reg name="mhpmcounter3h" bitsize="64"/>
> -  <reg name="mhpmcounter4h" bitsize="64"/>
> -  <reg name="mhpmcounter5h" bitsize="64"/>
> -  <reg name="mhpmcounter6h" bitsize="64"/>
> -  <reg name="mhpmcounter7h" bitsize="64"/>
> -  <reg name="mhpmcounter8h" bitsize="64"/>
> -  <reg name="mhpmcounter9h" bitsize="64"/>
> -  <reg name="mhpmcounter10h" bitsize="64"/>
> -  <reg name="mhpmcounter11h" bitsize="64"/>
> -  <reg name="mhpmcounter12h" bitsize="64"/>
> -  <reg name="mhpmcounter13h" bitsize="64"/>
> -  <reg name="mhpmcounter14h" bitsize="64"/>
> -  <reg name="mhpmcounter15h" bitsize="64"/>
> -  <reg name="mhpmcounter16h" bitsize="64"/>
> -  <reg name="mhpmcounter17h" bitsize="64"/>
> -  <reg name="mhpmcounter18h" bitsize="64"/>
> -  <reg name="mhpmcounter19h" bitsize="64"/>
> -  <reg name="mhpmcounter20h" bitsize="64"/>
> -  <reg name="mhpmcounter21h" bitsize="64"/>
> -  <reg name="mhpmcounter22h" bitsize="64"/>
> -  <reg name="mhpmcounter23h" bitsize="64"/>
> -  <reg name="mhpmcounter24h" bitsize="64"/>
> -  <reg name="mhpmcounter25h" bitsize="64"/>
> -  <reg name="mhpmcounter26h" bitsize="64"/>
> -  <reg name="mhpmcounter27h" bitsize="64"/>
> -  <reg name="mhpmcounter28h" bitsize="64"/>
> -  <reg name="mhpmcounter29h" bitsize="64"/>
> -  <reg name="mhpmcounter30h" bitsize="64"/>
> -  <reg name="mhpmcounter31h" bitsize="64"/>
> -  <reg name="mhpmevent3" bitsize="64"/>
> -  <reg name="mhpmevent4" bitsize="64"/>
> -  <reg name="mhpmevent5" bitsize="64"/>
> -  <reg name="mhpmevent6" bitsize="64"/>
> -  <reg name="mhpmevent7" bitsize="64"/>
> -  <reg name="mhpmevent8" bitsize="64"/>
> -  <reg name="mhpmevent9" bitsize="64"/>
> -  <reg name="mhpmevent10" bitsize="64"/>
> -  <reg name="mhpmevent11" bitsize="64"/>
> -  <reg name="mhpmevent12" bitsize="64"/>
> -  <reg name="mhpmevent13" bitsize="64"/>
> -  <reg name="mhpmevent14" bitsize="64"/>
> -  <reg name="mhpmevent15" bitsize="64"/>
> -  <reg name="mhpmevent16" bitsize="64"/>
> -  <reg name="mhpmevent17" bitsize="64"/>
> -  <reg name="mhpmevent18" bitsize="64"/>
> -  <reg name="mhpmevent19" bitsize="64"/>
> -  <reg name="mhpmevent20" bitsize="64"/>
> -  <reg name="mhpmevent21" bitsize="64"/>
> -  <reg name="mhpmevent22" bitsize="64"/>
> -  <reg name="mhpmevent23" bitsize="64"/>
> -  <reg name="mhpmevent24" bitsize="64"/>
> -  <reg name="mhpmevent25" bitsize="64"/>
> -  <reg name="mhpmevent26" bitsize="64"/>
> -  <reg name="mhpmevent27" bitsize="64"/>
> -  <reg name="mhpmevent28" bitsize="64"/>
> -  <reg name="mhpmevent29" bitsize="64"/>
> -  <reg name="mhpmevent30" bitsize="64"/>
> -  <reg name="mhpmevent31" bitsize="64"/>
> -  <reg name="tselect" bitsize="64"/>
> -  <reg name="tdata1" bitsize="64"/>
> -  <reg name="tdata2" bitsize="64"/>
> -  <reg name="tdata3" bitsize="64"/>
> -  <reg name="dcsr" bitsize="64"/>
> -  <reg name="dpc" bitsize="64"/>
> -  <reg name="dscratch" bitsize="64"/>
> -  <reg name="hstatus" bitsize="64"/>
> -  <reg name="hedeleg" bitsize="64"/>
> -  <reg name="hideleg" bitsize="64"/>
> -  <reg name="hie" bitsize="64"/>
> -  <reg name="htvec" bitsize="64"/>
> -  <reg name="hscratch" bitsize="64"/>
> -  <reg name="hepc" bitsize="64"/>
> -  <reg name="hcause" bitsize="64"/>
> -  <reg name="hbadaddr" bitsize="64"/>
> -  <reg name="hip" bitsize="64"/>
> -  <reg name="mbase" bitsize="64"/>
> -  <reg name="mbound" bitsize="64"/>
> -  <reg name="mibase" bitsize="64"/>
> -  <reg name="mibound" bitsize="64"/>
> -  <reg name="mdbase" bitsize="64"/>
> -  <reg name="mdbound" bitsize="64"/>
> -  <reg name="mucounteren" bitsize="64"/>
> -  <reg name="mscounteren" bitsize="64"/>
> -  <reg name="mhcounteren" bitsize="64"/>
> -</feature>
> --
> 2.25.1
>
>

