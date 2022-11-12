Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1otebV-0006Br-7t
	for mharc-qemu-riscv@gnu.org; Fri, 11 Nov 2022 19:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1otebU-0006Bb-52
 for qemu-riscv@nongnu.org; Fri, 11 Nov 2022 19:42:36 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1otebR-0000Xl-F7
 for qemu-riscv@nongnu.org; Fri, 11 Nov 2022 19:42:35 -0500
Received: by mail-lf1-x12c.google.com with SMTP id g7so10611025lfv.5
 for <qemu-riscv@nongnu.org>; Fri, 11 Nov 2022 16:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cBdMeS37oNGZt3NgNog3QT6hHe0lZT45XwQBkr6k/TM=;
 b=OKr7IBo1oak8UzFW3eo5mDQ2rphdz2ZMlyyjyyoU6N4m23bXN99n6+WzjHXEjKPqLy
 /c3pVZD+P17bKNjngzStbpKybxY7T1lCk1IKa+bSUIdnBDUApawXoCvhOXlGvXuuvE1/
 oVxe1nIN/Pj+stzgseFxcNrcuLe810i69GmwxpGvoY8fwUbNQEAM9MCOsqfmuD50dwZ4
 tgx0OxmEjcw2XpHdNxqERVw1mqH2FQkni2DZ5KfqwMiAquPVvdqTy+bQpAVU22vawjox
 t6uYue1bc0GgR4WHRHN+wi53a0/bshqYLO1slhkbh9ZACS7+fwcseYeOP9VAnaNkxU+N
 1k2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cBdMeS37oNGZt3NgNog3QT6hHe0lZT45XwQBkr6k/TM=;
 b=wRvjxlc5nu8KGCE4/Q46+WcFLnfYeZP+EWlVpXq5gc+nHt67w4T4wfc1fqM3/dXt9/
 yMY1Al+aw3jNCYgSEXOVqfAvaRF+iinrkQkU+G02eJFr4wINfUpVNEFQ4OVxH0EXvBN9
 ZT5lgTwTHz5SDSYZ0hEosfRsG3gXW939IqKjb2Uhpg4tgzcEI7/FFknrR7l3hhE00KbK
 sjwlBpA9dgn2sNs7Ge6N8iD/uusvl3y0MSv5OY1VffovIxVkNxw2bAApDWzOv0RKo9kg
 5RBmu21TgJSMpR65KWO0CflHxOt5Bf52eJpe3yMbt6ouewTVna4NwiiwZFxpkTgtJY1O
 9Ipw==
X-Gm-Message-State: ANoB5pkK0J4bMhSgq48EGntgNFANHVg7jmqgESOQK5Hw9pTdM1dQIGG6
 pzZY7qkkLhJdQqYLE3tDRhSbVyldMZKtqW/utPgHPQ==
X-Google-Smtp-Source: AA0mqf60+JoMoqBbLshbuehxMhgjsSkunyjI8VEBBkEp8PqwTjStxYiBZ1UrDXni+QYwMXxXSNRTSKjATCjl+XqYJu4=
X-Received: by 2002:ac2:5ca4:0:b0:494:6b75:2c1b with SMTP id
 e4-20020ac25ca4000000b004946b752c1bmr1644116lfq.478.1668213751084; Fri, 11
 Nov 2022 16:42:31 -0800 (PST)
MIME-Version: 1.0
References: <20221111201337.3320349-1-atishp@rivosinc.com>
 <CAEUhbmV5ZJ0YnrGEtqTJ9PCCdGsLjxpVnK2qHhc7H9XBDHDkhA@mail.gmail.com>
In-Reply-To: <CAEUhbmV5ZJ0YnrGEtqTJ9PCCdGsLjxpVnK2qHhc7H9XBDHDkhA@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 11 Nov 2022 16:42:19 -0800
Message-ID: <CAHBxVyEjk1WVDOi6jSz86gLXV50-aEnFmaYjDvQu7PSdng_NLQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Remove the redundant ipi-id property
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Anup Patel <apatel@ventanamicro.com>, qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000000b0ed605ed3b4896"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=atishp@rivosinc.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 12 Nov 2022 00:42:36 -0000

--0000000000000b0ed605ed3b4896
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 11, 2022 at 4:39 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> On Sat, Nov 12, 2022 at 4:14 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > The imsic DT binding has changed and no longer require an ipi-id.
>
> requires
>
>
Sure. Will fix it.


> Could you please put a link here to the upstream imsic DT binding for
> reference?
>
>
It's not merged yet. Here is the latest version:

https://lore.kernel.org/lkml/20221111044207.1478350-5-apatel@ventanamicro.com/


> > The latest IMSIC driver dynamically allocates ipi id if slow-ipi
> > is not defined.
> >
> > Get rid of the unused dt property which may lead to confusion.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  hw/riscv/virt.c         | 2 --
> >  include/hw/riscv/virt.h | 1 -
> >  2 files changed, 3 deletions(-)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index a5bc7353b412..0bc0964e42a8 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -546,8 +546,6 @@ static void create_fdt_imsic(RISCVVirtState *s,
> const MemMapEntry *memmap,
> >          riscv_socket_count(mc) * sizeof(uint32_t) * 4);
> >      qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
> >          VIRT_IRQCHIP_NUM_MSIS);
> > -    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id",
> > -        VIRT_IRQCHIP_IPI_MSI);
> >      if (riscv_socket_count(mc) > 1) {
> >          qemu_fdt_setprop_cell(mc->fdt, imsic_name,
> "riscv,hart-index-bits",
> >              imsic_num_bits(imsic_max_hart_per_socket));
> > diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> > index be4ab8fe7f71..62513e075c47 100644
> > --- a/include/hw/riscv/virt.h
> > +++ b/include/hw/riscv/virt.h
> > @@ -93,7 +93,6 @@ enum {
> >
> >  #define VIRT_PLATFORM_BUS_NUM_IRQS 32
> >
> > -#define VIRT_IRQCHIP_IPI_MSI 1
> >  #define VIRT_IRQCHIP_NUM_MSIS 255
> >  #define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
> >  #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
> > --
>
> Regards,
> Bin
>

--0000000000000b0ed605ed3b4896
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 11, 2022 at 4:39 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, Nov=
 12, 2022 at 4:14 AM Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com"=
 target=3D"_blank">atishp@rivosinc.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The imsic DT binding has changed and no longer require an ipi-id.<br>
<br>
requires<br>
<br></blockquote><div><br></div><div>Sure. Will fix it.</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
Could you please put a link here to the upstream imsic DT binding for refer=
ence?<br>
<br></blockquote><div><br></div><div>It&#39;s not merged yet. Here is the l=
atest version:</div><div><br></div><div><a href=3D"https://lore.kernel.org/=
lkml/20221111044207.1478350-5-apatel@ventanamicro.com/">https://lore.kernel=
.org/lkml/20221111044207.1478350-5-apatel@ventanamicro.com/</a><br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; The latest IMSIC driver dynamically allocates ipi id if slow-ipi<br>
&gt; is not defined.<br>
&gt;<br>
&gt; Get rid of the unused dt property which may lead to confusion.<br>
&gt;<br>
&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" =
target=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/riscv/virt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 --<br>
&gt;=C2=A0 include/hw/riscv/virt.h | 1 -<br>
&gt;=C2=A0 2 files changed, 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c<br>
&gt; index a5bc7353b412..0bc0964e42a8 100644<br>
&gt; --- a/hw/riscv/virt.c<br>
&gt; +++ b/hw/riscv/virt.c<br>
&gt; @@ -546,8 +546,6 @@ static void create_fdt_imsic(RISCVVirtState *s, co=
nst MemMapEntry *memmap,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_socket_count(mc) * sizeof(uint=
32_t) * 4);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(mc-&gt;fdt, imsic_name, &quo=
t;riscv,num-ids&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VIRT_IRQCHIP_NUM_MSIS);<br>
&gt; -=C2=A0 =C2=A0 qemu_fdt_setprop_cells(mc-&gt;fdt, imsic_name, &quot;ri=
scv,ipi-id&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 VIRT_IRQCHIP_IPI_MSI);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (riscv_socket_count(mc) &gt; 1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(mc-&gt;fdt, im=
sic_name, &quot;riscv,hart-index-bits&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 imsic_num_bits(imsic_m=
ax_hart_per_socket));<br>
&gt; diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h<br>
&gt; index be4ab8fe7f71..62513e075c47 100644<br>
&gt; --- a/include/hw/riscv/virt.h<br>
&gt; +++ b/include/hw/riscv/virt.h<br>
&gt; @@ -93,7 +93,6 @@ enum {<br>
&gt;<br>
&gt;=C2=A0 #define VIRT_PLATFORM_BUS_NUM_IRQS 32<br>
&gt;<br>
&gt; -#define VIRT_IRQCHIP_IPI_MSI 1<br>
&gt;=C2=A0 #define VIRT_IRQCHIP_NUM_MSIS 255<br>
&gt;=C2=A0 #define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV<br>
&gt;=C2=A0 #define VIRT_IRQCHIP_NUM_PRIO_BITS 3<br>
&gt; --<br>
<br>
Regards,<br>
Bin<br>
</blockquote></div></div>

--0000000000000b0ed605ed3b4896--

