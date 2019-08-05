Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hug4L-0004tL-5A
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 12:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38647)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <fintelia@gmail.com>) id 1hug4G-0004pz-A1
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:42:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fintelia@gmail.com>) id 1hug4D-0000cg-MF
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:42:40 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:42197)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <fintelia@gmail.com>)
 id 1hug4B-0000bf-FU; Mon, 05 Aug 2019 12:42:35 -0400
Received: by mail-lj1-x241.google.com with SMTP id t28so79838574lje.9;
 Mon, 05 Aug 2019 09:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hrz37h6pLeTULUQB3j1QQgTdX0pcQyrRA2ZObpkQpNw=;
 b=l1UsnEicm68pYjGummRwSXH82atr2jnneyblBdKY9xTPumrIWN6ffygeArxwgoUsJG
 UjMrYulxxfOObOZwstu0tOAq/dPL+epagC8trT8w78tuwLPHGaKCtQzwhqmslHTzDEBQ
 TevQAeJ3cSFNbYITjmW3vjdvPkVCtHSTvfzALc8Axzwe6PAbAKolanTKTvQKW95Ndgsq
 DM7rGFEEs13e4y/ZQgvTnBYlsThn8sxfJ4Yi+w+9HwC49IMI4oLuOWE8AFlETuLPKCA6
 Dzlxl8TLK/Uxul78lqV6q6cUNLCtxkm3+wrSJL5CXr6yPhY2aESxkyemoceb/0iMdbcc
 CR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hrz37h6pLeTULUQB3j1QQgTdX0pcQyrRA2ZObpkQpNw=;
 b=krRwdg3YdJUeUvufNbSgTDkrQMu9r+v+4cMenuOLqqrfaXKJCR5AeA3XBN/ZZiqHcZ
 LvJhJL/ZTezgcIRf44P+qlATqJ6F6k6HUd35MFoypW01a5zHSfISNY7PcpaK0zOUz9II
 LoqiTWcBSuBtGyaCbLR+o3kBUXNjwl/c2aIA6K/SS3Ocp/4bLADTXElkPT81ltPMgaWe
 JeZSmJqm5x0fKS21GLiunZMyLfWbjfkVxhZvDP9f2qhJm2D6B1WN5GBlYhfLdkGaLeQ9
 xLhaEuFyGM/utDQXuh3LxJNb6ZDGWHtmaJ/gzPxrGWg+X0hITOtnKUpT/urEflPrtHAt
 G2nA==
X-Gm-Message-State: APjAAAXAyXTdLKYGf1A54B9MuCm4xv+8sHqlE352ZAYTJCuUhCsyFQGU
 YEDu4Qk7olKvCCjYFPzGZ8jVzwIl0UmRjmA7f4A=
X-Google-Smtp-Source: APXvYqxpg0xIa6I9cLfbY6VVZnVuvJ3VLX4/ON5rTgb6vTrCYmt2Ilf74IIUZNcn2akkAVuXItORl97tDD63e2r9K3M=
X-Received: by 2002:a2e:4794:: with SMTP id
 u142mr79906227lja.222.1565023353013; 
 Mon, 05 Aug 2019 09:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
 <1565020823-24223-8-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565020823-24223-8-git-send-email-bmeng.cn@gmail.com>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Mon, 5 Aug 2019 12:41:47 -0400
Message-ID: <CANnJOVHeoqJ9pxVur3tTzEHf2kPBw4zHaiEzaUxgOvnTQJEVjQ@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000058ac0058f6165f8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-riscv] [PATCH 07/28] riscv: sifive_u: Set the minimum
 number of cpus to 2
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
X-List-Received-Date: Mon, 05 Aug 2019 16:42:42 -0000

--000000000000058ac0058f6165f8
Content-Type: text/plain; charset="UTF-8"

I'm not familiar with QEMU conventions on this, but would it make sense to
require having exactly 5 CPUs to match the real board?

Jonathan


On Mon, Aug 5, 2019 at 12:05 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> It is not useful if we only have one management CPU.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
>  hw/riscv/sifive_u.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 08d406f..206eccc 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -428,6 +428,8 @@ static void riscv_sifive_u_machine_init(MachineClass
> *mc)
>       * management CPU.
>       */
>      mc->max_cpus = 5;
> +    /* It is not useful if we only have one management CPU */
> +    mc->min_cpus = 2;
>  }
>
>  DEFINE_MACHINE("sifive_u", riscv_sifive_u_machine_init)
> --
> 2.7.4
>
>
>

--000000000000058ac0058f6165f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m not familiar with QEMU conventions on this, b=
ut would it make sense to require having exactly 5 CPUs to match the real b=
oard?</div><div><br></div><div>Jonathan<br></div><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 5, 2019 =
at 12:05 PM Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">It is not useful if we only have one management CPU.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D=
"_blank">bmeng.cn@gmail.com</a>&gt;<br>
---<br>
<br>
=C2=A0hw/riscv/sifive_u.c | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c<br>
index 08d406f..206eccc 100644<br>
--- a/hw/riscv/sifive_u.c<br>
+++ b/hw/riscv/sifive_u.c<br>
@@ -428,6 +428,8 @@ static void riscv_sifive_u_machine_init(MachineClass *m=
c)<br>
=C2=A0 =C2=A0 =C2=A0 * management CPU.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;max_cpus =3D 5;<br>
+=C2=A0 =C2=A0 /* It is not useful if we only have one management CPU */<br=
>
+=C2=A0 =C2=A0 mc-&gt;min_cpus =3D 2;<br>
=C2=A0}<br>
<br>
=C2=A0DEFINE_MACHINE(&quot;sifive_u&quot;, riscv_sifive_u_machine_init)<br>
-- <br>
2.7.4<br>
<br>
<br>
</blockquote></div>

--000000000000058ac0058f6165f8--

