Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hdcTY-0002jX-G7
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jun 2019 11:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42221)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <fintelia@gmail.com>) id 1hdcTT-0002iJ-PD
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 11:26:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fintelia@gmail.com>) id 1hdcTP-0001uz-Sv
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 11:26:09 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:45034)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <fintelia@gmail.com>)
 id 1hdcTO-0001qT-Mx; Wed, 19 Jun 2019 11:26:06 -0400
Received: by mail-lj1-x244.google.com with SMTP id k18so3645260ljc.11;
 Wed, 19 Jun 2019 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+tJxGWSA2yNdf2ZcVYUY7snQkd1JLOOATxOxxF1lNXs=;
 b=a5TZ8NqJgKW6NFjFrUw20hLh43cxX3TqR8rMDafTaCuHQ3mTYvQlI0amc/LaZ9csgG
 c45AU8YlKMsHWoMpSIFVSeKM3Uf/4yH8ZwSm0IKPKo4lJACw54jBNgsrIGRuIYOR5JEV
 iVdr5aA6WldDcjT27Wa4CSxipvb4hmOxvC2XPR7bPBCtN+3hvC41+kMMGMZ5zcx+f5bm
 NyTZqNwtsDkkGQp9vYLAbFGtRVqeGEB7DW0lLcutwiGJyZzFnmCIlkHFZ16pi60ls/dp
 BIZt/DUk7sg7DBo2BRn27Vme352h16l1vZzPON++GllP7nLc1oVAj1P6oLK80esEN6k4
 epag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+tJxGWSA2yNdf2ZcVYUY7snQkd1JLOOATxOxxF1lNXs=;
 b=DHy6fPCzffcishQTqcB/G/sE1FW6MBh8doGjGKTLoeHlTCg6JCxbbwLHHFxuPaEUL5
 H0tYoeHmNOTGXgaHs3rmTghj8UNdSFkh/w/o50V+xrV++X9lujTU2aMjQ/5OWykMw7dA
 b58MRLo3G8vo1NFdeOJvd+zgYHdhujTfo373yb3zmITvPYfsaXkecU3fXWjMUFvJafvr
 xy4D4Rm6RY+/8KbxElOtLKUhL2yW42PQeLsqWX7CXC+78RolFJxtW+ghcsELomat5c6E
 p2p8L1F5oDwf3rfAIw/j8m4QNQn0VlYV2XmbYOrn9mEb9wdqNpxgfKxl9hXCnlYozqPn
 K18w==
X-Gm-Message-State: APjAAAVA39+YLuek/maGI0VD2zIyCMnuCyOorm+0BrtBT8HCwMAmC58L
 Vwrltj+a/tTxvODxnSG4rbvLRYdPbzkf1vj1p9c=
X-Google-Smtp-Source: APXvYqzdFf3c3/WbxZtKcddapJmbYmVoQK/a/adme6ZqVzfv/Djdh5h9dYO4i6o7kZYAHhqKU3/GpeSDkx2lZTQwrrs=
X-Received: by 2002:a2e:6348:: with SMTP id x69mr56899839ljb.186.1560957961111; 
 Wed, 19 Jun 2019 08:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560904640.git.alistair.francis@wdc.com>
 <e718da8df07915765217dece609255b6ad196955.1560904640.git.alistair.francis@wdc.com>
 <CAEUhbmUz5xHqhuEvDWHBTpKN+k3uuNPQxNCGFWOfR21hMhWtPw@mail.gmail.com>
In-Reply-To: <CAEUhbmUz5xHqhuEvDWHBTpKN+k3uuNPQxNCGFWOfR21hMhWtPw@mail.gmail.com>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Wed, 19 Jun 2019 11:25:32 -0400
Message-ID: <CANnJOVH34B0efKNSjNHD5ZmuWqAsybsmiwFXEQYvTye+oJBV=A@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair23@gmail.com>, 
 Palmer Dabbelt <palmer@sifive.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000c80f6b058baed8e6"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 2/5] hw/riscv: Add support
 for loading a firmware
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
X-List-Received-Date: Wed, 19 Jun 2019 15:26:14 -0000

--000000000000c80f6b058baed8e6
Content-Type: text/plain; charset="UTF-8"

I was actually just writing up the same thing.  Shifting all the addresses
in the ELF file by 2 or 4MB is somewhat surprising behavior, especially
because this will apply to segments that are mapped even at much higher
addresses. If you want a segment aligned to a 1GB superpage boundary you
now need to place it slightly below so that it will be bumped up to the
right place. Further, ANDing all addresses with 0x7fffffff makes it
impossible to map anything beyond the first 2GB of RAM.

Jonathan

On Wed, Jun 19, 2019 at 11:16 AM Bin Meng <bmeng.cn@gmail.com> wrote:

> On Wed, Jun 19, 2019 at 8:53 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > Add support for loading a firmware file for the virt machine and the
> > SiFive U. This can be run with the following command:
> >
> >     qemu-system-riscv64 -machine virt -bios fw_jump.elf -kernel vmlinux
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/boot.c         | 41 +++++++++++++++++++++++++++++++++++++++--
> >  hw/riscv/sifive_e.c     |  2 +-
> >  hw/riscv/sifive_u.c     |  6 +++++-
> >  hw/riscv/spike.c        |  6 +++---
> >  hw/riscv/virt.c         |  7 ++++++-
> >  include/hw/riscv/boot.h |  4 +++-
> >  6 files changed, 57 insertions(+), 9 deletions(-)
> >
> > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > index 62f94aaf8a..392ca0cb2e 100644
> > --- a/hw/riscv/boot.c
> > +++ b/hw/riscv/boot.c
> > @@ -23,13 +23,50 @@
> >  #include "exec/cpu-defs.h"
> >  #include "hw/loader.h"
> >  #include "hw/riscv/boot.h"
> > +#include "hw/boards.h"
> >  #include "elf.h"
> >
> > -target_ulong riscv_load_kernel(const char *kernel_filename)
> > +#if defined(TARGET_RISCV32)
> > +# define KERNEL_BOOT_ADDRESS 0x80400000
> > +#else
> > +# define KERNEL_BOOT_ADDRESS 0x80200000
> > +#endif
> > +
> > +static uint64_t kernel_translate(void *opaque, uint64_t addr)
> > +{
> > +    MachineState *machine = opaque;
> > +
> > +    /*
> > +     * If the user specified a firmware move the kernel to the offset
> > +     * start address.
> > +     */
>
> Why?
>
> > +    if (machine->firmware) {
> > +        return (addr & 0x7fffffff) + KERNEL_BOOT_ADDRESS;
>
> So with both "-bios" and "-kernel", the kernel address will be moved
> to another address other than 0x80200000 (for 64-bit). This does not
> look good to me.
>
> > +    } else {
> > +        return addr;
> > +    }
> > +}
> > +
>
> [snip]
>
> Regards,
> Bin
>
>

--000000000000c80f6b058baed8e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I was actually just writing up the same thing.=C2=A0 =
Shifting all the addresses in the ELF file by 2 or 4MB is somewhat surprisi=
ng behavior, especially because this will apply to segments that are mapped=
 even at much higher addresses. If you want a segment aligned to a 1GB supe=
rpage boundary you now need to place it slightly below so that it will be b=
umped up to the right place. Further, ANDing all addresses with <span class=
=3D"gmail-im">0x7fffffff</span> makes it impossible to map anything beyond =
the first 2GB of RAM.</div><div><br></div><div>Jonathan<br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Ju=
n 19, 2019 at 11:16 AM Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">b=
meng.cn@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Wed, Jun 19, 2019 at 8:53 AM Alistair Francis<br>
&lt;<a href=3D"mailto:alistair.francis@wdc.com" target=3D"_blank">alistair.=
francis@wdc.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Add support for loading a firmware file for the virt machine and the<b=
r>
&gt; SiFive U. This can be run with the following command:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0qemu-system-riscv64 -machine virt -bios fw_jump.elf=
 -kernel vmlinux<br>
&gt;<br>
&gt; Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis=
@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/riscv/boot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 41 ++++++++++=
+++++++++++++++++++++++++++++--<br>
&gt;=C2=A0 hw/riscv/sifive_e.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 hw/riscv/sifive_u.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++++-<br>
&gt;=C2=A0 hw/riscv/spike.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++---<br>
&gt;=C2=A0 hw/riscv/virt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++++=
+-<br>
&gt;=C2=A0 include/hw/riscv/boot.h |=C2=A0 4 +++-<br>
&gt;=C2=A0 6 files changed, 57 insertions(+), 9 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c<br>
&gt; index 62f94aaf8a..392ca0cb2e 100644<br>
&gt; --- a/hw/riscv/boot.c<br>
&gt; +++ b/hw/riscv/boot.c<br>
&gt; @@ -23,13 +23,50 @@<br>
&gt;=C2=A0 #include &quot;exec/cpu-defs.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/loader.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/riscv/boot.h&quot;<br>
&gt; +#include &quot;hw/boards.h&quot;<br>
&gt;=C2=A0 #include &quot;elf.h&quot;<br>
&gt;<br>
&gt; -target_ulong riscv_load_kernel(const char *kernel_filename)<br>
&gt; +#if defined(TARGET_RISCV32)<br>
&gt; +# define KERNEL_BOOT_ADDRESS 0x80400000<br>
&gt; +#else<br>
&gt; +# define KERNEL_BOOT_ADDRESS 0x80200000<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +static uint64_t kernel_translate(void *opaque, uint64_t addr)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 MachineState *machine =3D opaque;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* If the user specified a firmware move the kerne=
l to the offset<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* start address.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
<br>
Why?<br>
<br>
&gt; +=C2=A0 =C2=A0 if (machine-&gt;firmware) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (addr &amp; 0x7fffffff) + KERNEL_B=
OOT_ADDRESS;<br>
<br>
So with both &quot;-bios&quot; and &quot;-kernel&quot;, the kernel address =
will be moved<br>
to another address other than 0x80200000 (for 64-bit). This does not<br>
look good to me.<br>
<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return addr;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
<br>
[snip]<br>
<br>
Regards,<br>
Bin<br>
<br>
</blockquote></div>

--000000000000c80f6b058baed8e6--

