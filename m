Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvHsi-0004Vx-1Y
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 05:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50507)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hvHse-0004VV-UJ
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 05:05:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hvHsd-0005N7-K3
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 05:05:12 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:34843)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hvHsd-0005Md-Dz
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 05:05:11 -0400
Received: by mail-ot1-x344.google.com with SMTP id j19so24754415otq.2
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 02:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qNq/VVIozly4mU8URRv7Bc0mAKFdRAYpb0niVPiozRw=;
 b=TnJEJHzarJ+WYBX53OG/C2T06NDVOp32B35WHIOwcRZB1PP2hHWGEN/67tjNTXS50g
 1D945yJHnUfiJHABW3MJKMJiOjtFN+9HtQsku7Qp10hoiIJOr2lNK7IWM5a6IT/Bqsw4
 QHkxOUz7iTcpacpTrBSXBxrrzvsJVDNpp6d4bmOUBM09tAGVWcH6pMAPqWa4qpsf8ruL
 e3H32OQDqUX0P07MjGN/SIv2zmBvH3aCbXcyOdS6SHBexxZar1+SqLcRduAn6DHnEE4J
 F68HEuErXrdde6VXyb9dDgiIVxucH6/1v5A3JcyCh0yZeNSGqN30fHGdkKyzisJu8b0H
 FIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qNq/VVIozly4mU8URRv7Bc0mAKFdRAYpb0niVPiozRw=;
 b=ozfgeXcExTPUksc2pGlgbMmTXccm/Py3l3LtshlLZW6/aBJA9y0x8J057+BNweVRBM
 jPcFg4HvLiZN+50s2QgODoJQwldvJLqZTIgvBc8dq2Rf01ZwRyT/lukeu67FXwBH2QKP
 7OGZBpJWts3NMgTvTjvM2Gp4XM6cyots3bkNNBQI51OkSIZ/n3SlfVqoqjVe195Zpp2m
 z5v2MHUPVwtVuOfjFHcKC25QD6ORpmTVqtc/Q7GmT94C5rYr6rCojDfZ3Xkyzq7qdxeb
 MyiCUS/t3Wi37cRAKckoHWA705P+YmkTlFlHq/rHpY62rh9y7Zp39ALHCO2DCWo8nSdU
 u6QA==
X-Gm-Message-State: APjAAAWFoEOaQSqAmOp7aGPjGkWOCIrtnWlaMeZ2S01w6AvMNv474B0j
 gZEQ0QK1+idgce1wHby7TvyMaScVrYOleantMOMdcg==
X-Google-Smtp-Source: APXvYqx90EOWpkch2Mnv4OC0JIVdbuQK3ezkcBdWFwl5ju7J2vW0+gBuDU7etJm9fjrscZvDG7voFweUo17WJY3Frcg=
X-Received: by 2002:a5e:a70b:: with SMTP id b11mr3594694iod.286.1565168710141; 
 Wed, 07 Aug 2019 02:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
 <1565163924-18621-28-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565163924-18621-28-git-send-email-bmeng.cn@gmail.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Wed, 7 Aug 2019 17:04:59 +0800
Message-ID: <CAEiOBXVzf_+akk3Kz9K8DjJtydUHg47ev-G49mTCpn1iG_ghKw@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000fbfb8f058f833c90"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-riscv] [PATCH v2 27/28] riscv: virt: Change create_fdt()
 to return void
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
X-List-Received-Date: Wed, 07 Aug 2019 09:05:14 -0000

--000000000000fbfb8f058f833c90
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 7, 2019 at 3:54 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> There is no need to return fdt at the end of create_fdt() because
> it's already saved in s->fdt. Other machines (sifive_u, spike)
> don't do it neither.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
> Changes in v2: None
>
>  hw/riscv/virt.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 2f75195..6bfa721 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -112,7 +112,7 @@ static void create_pcie_irq_map(void *fdt, char
> *nodename,
>                             0x1800, 0, 0, 0x7);
>  }
>
> -static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry
> *memmap,
> +static void create_fdt(RISCVVirtState *s, const struct MemmapEntry
> *memmap,
>      uint64_t mem_size, const char *cmdline)
>  {
>      void *fdt;
> @@ -316,8 +316,6 @@ static void *create_fdt(RISCVVirtState *s, const
> struct MemmapEntry *memmap,
>          qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
>      }
>      g_free(nodename);
> -
> -    return fdt;
>  }
>
>
> @@ -373,7 +371,6 @@ static void riscv_virt_board_init(MachineState
> *machine)
>      size_t plic_hart_config_len;
>      int i;
>      unsigned int smp_cpus = machine->smp.cpus;
> -    void *fdt;
>
>      /* Initialize SOC */
>      object_initialize_child(OBJECT(machine), "soc", &s->soc,
> sizeof(s->soc),
> @@ -392,7 +389,7 @@ static void riscv_virt_board_init(MachineState
> *machine)
>          main_mem);
>
>      /* create device tree */
> -    fdt = create_fdt(s, memmap, machine->ram_size,
> machine->kernel_cmdline);
> +    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
>
>      /* boot rom */
>      memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
> @@ -411,9 +408,9 @@ static void riscv_virt_board_init(MachineState
> *machine)
>              hwaddr end = riscv_load_initrd(machine->initrd_filename,
>                                             machine->ram_size,
> kernel_entry,
>                                             &start);
> -            qemu_fdt_setprop_cell(fdt, "/chosen",
> +            qemu_fdt_setprop_cell(s->fdt, "/chosen",
>                                    "linux,initrd-start", start);
> -            qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
> +            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
>                                    end);
>          }
>      }
> --
> 2.7.4
>
>
>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

--000000000000fbfb8f058f833c90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 7, 2019 at 3:54 PM Bin Me=
ng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">There is no =
need to return fdt at the end of create_fdt() because<br>
it&#39;s already saved in s-&gt;fdt. Other machines (sifive_u, spike)<br>
don&#39;t do it neither.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D=
"_blank">bmeng.cn@gmail.com</a>&gt;<br>
---<br>
<br>
Changes in v2: None<br>
<br>
=C2=A0hw/riscv/virt.c | 11 ++++-------<br>
=C2=A01 file changed, 4 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c<br>
index 2f75195..6bfa721 100644<br>
--- a/hw/riscv/virt.c<br>
+++ b/hw/riscv/virt.c<br>
@@ -112,7 +112,7 @@ static void create_pcie_irq_map(void *fdt, char *nodena=
me,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x1800, 0, 0, 0x7);<br>
=C2=A0}<br>
<br>
-static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memma=
p,<br>
+static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap=
,<br>
=C2=A0 =C2=A0 =C2=A0uint64_t mem_size, const char *cmdline)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0void *fdt;<br>
@@ -316,8 +316,6 @@ static void *create_fdt(RISCVVirtState *s, const struct=
 MemmapEntry *memmap,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_fdt_setprop_string(fdt, &quot;/chose=
n&quot;, &quot;bootargs&quot;, cmdline);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0g_free(nodename);<br>
-<br>
-=C2=A0 =C2=A0 return fdt;<br>
=C2=A0}<br>
<br>
<br>
@@ -373,7 +371,6 @@ static void riscv_virt_board_init(MachineState *machine=
)<br>
=C2=A0 =C2=A0 =C2=A0size_t plic_hart_config_len;<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
=C2=A0 =C2=A0 =C2=A0unsigned int smp_cpus =3D machine-&gt;smp.cpus;<br>
-=C2=A0 =C2=A0 void *fdt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Initialize SOC */<br>
=C2=A0 =C2=A0 =C2=A0object_initialize_child(OBJECT(machine), &quot;soc&quot=
;, &amp;s-&gt;soc, sizeof(s-&gt;soc),<br>
@@ -392,7 +389,7 @@ static void riscv_virt_board_init(MachineState *machine=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0main_mem);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* create device tree */<br>
-=C2=A0 =C2=A0 fdt =3D create_fdt(s, memmap, machine-&gt;ram_size, machine-=
&gt;kernel_cmdline);<br>
+=C2=A0 =C2=A0 create_fdt(s, memmap, machine-&gt;ram_size, machine-&gt;kern=
el_cmdline);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* boot rom */<br>
=C2=A0 =C2=A0 =C2=A0memory_region_init_rom(mask_rom, NULL, &quot;riscv_virt=
_board.mrom&quot;,<br>
@@ -411,9 +408,9 @@ static void riscv_virt_board_init(MachineState *machine=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr end =3D riscv_load_i=
nitrd(machine-&gt;initrd_filename,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 machine-&gt;ram_size, kernel_entry,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &amp;start);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot=
;/chosen&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(s-&gt;fdt,=
 &quot;/chosen&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;linux,initrd-star=
t&quot;, start);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot=
;/chosen&quot;, &quot;linux,initrd-end&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(s-&gt;fdt,=
 &quot;/chosen&quot;, &quot;linux,initrd-end&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0end);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.7.4<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Chih-Min Chao &lt;<a href=
=3D"mailto:chihmin.chao@sifive.com" target=3D"_blank">chihmin.chao@sifive.c=
om</a>&gt;=C2=A0=C2=A0</div></div></div>

--000000000000fbfb8f058f833c90--

