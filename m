Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ittRN-0003vV-I5
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jan 2020 08:19:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59310)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1ittRG-0003mD-O7
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 08:19:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1ittRD-0007B5-6e
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 08:19:26 -0500
Received: from rs224.mailgun.us ([209.61.151.224]:41393)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1ittRA-00077y-Bj
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 08:19:23 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1579612762; h=Content-Type: Cc: To: Subject: Message-ID: Date: From:
 In-Reply-To: References: MIME-Version: Sender;
 bh=FPLCMDiSkQF/kfQwaJ9geG60O7odRN9ix3UGXChDxjU=;
 b=Sl8+Tw/1oDbul2KalCwbrj6M9iCTp8SVnJpWVL02e7lf37ZjZmRfbvye4ZRgzp1HYW52GKgs
 Us730aMouqoVCn7aZdrlJGuHuFVUkmJRh3kwOJ7q8eKUOVlACKZya8olr0kRvv8Zfu+IWv07
 A4RF6BrVF5sKWO7xzFjfchur8SIiDdxRNId5ZxzwAqwCWccZKRuh6KbnaDJfG2MkjciKlY2v
 0mDfGTNux+MHdIRxRXkg8ruBegxcMqkO0UWdJGF1i5NIGqwPLjUJKu0AdLr5p5AUYPw19ZGk
 UNiXxH0fCZ7VbWwc0P1vmD63jt1Y1zRTbQ5SHXPfqZNUwUgMYRfI9Q==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mxa.mailgun.org with ESMTP id 5e26fa53.7fbc18108df0-smtp-out-n01;
 Tue, 21 Jan 2020 13:19:15 -0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id j1so2747219lja.2;
 Tue, 21 Jan 2020 05:19:15 -0800 (PST)
X-Gm-Message-State: APjAAAWx3JQUGinFyRg92BwSFG8JEhRPAAZy+vzue5kEUkWnGjlPJnEc
 ZAO5MFlXaumlAVjU6941iS7dIzy/4BHUvCypQBU=
X-Google-Smtp-Source: APXvYqyonyOKJN95NoJvd8Vm29+1Rvu04DJ5zbVd3JYirFsYel2VZW9aBjMECDY9eD1r7OJ2JLVavrk+fNjHkEC+Xys=
X-Received: by 2002:a05:651c:321:: with SMTP id
 b1mr16692354ljp.62.1579612754311; 
 Tue, 21 Jan 2020 05:19:14 -0800 (PST)
MIME-Version: 1.0
References: <62fcfe747245cf8edcabcbe8f1f0b59be035fad6.1579584948.git.alistair.francis@wdc.com>
In-Reply-To: <62fcfe747245cf8edcabcbe8f1f0b59be035fad6.1579584948.git.alistair.francis@wdc.com>
From: Jonathan Behrens <jonathan@fintelia.io>
Date: Tue, 21 Jan 2020 08:18:48 -0500
X-Gmail-Original-Message-ID: <CANnJOVFD5yH-fnfjO2u3zTBCgq-OVsBNZMB6-CKdXftU_03qzg@mail.gmail.com>
Message-ID: <CANnJOVFD5yH-fnfjO2u3zTBCgq-OVsBNZMB6-CKdXftU_03qzg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] target/riscv: Correctly implement TSR trap
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001a7e3d059ca64113"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.61.151.224
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
X-List-Received-Date: Tue, 21 Jan 2020 13:19:32 -0000

--0000000000001a7e3d059ca64113
Content-Type: text/plain; charset="UTF-8"

Looks good to me. Though this is I think the third bug in privilege
checking in op_helper.c which is only like 150 lines long total. It would
be really good to fully double check that there aren't any more lurking
there...

Reviewed-by: Jonathan Behrens <jonathan@fintelia.io
<palmerdabbelt@google.com>>

On Tue, Jan 21, 2020 at 12:45 AM Alistair Francis <alistair.francis@wdc.com>
wrote:

> As reported in: https://bugs.launchpad.net/qemu/+bug/1851939 we weren't
> correctly handling illegal instructions based on the value of MSTATUS_TSR
> and the current privledge level.
>
> This patch fixes the issue raised in the bug by raising an illegal
> instruction if TSR is set and we are in S-Mode.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/op_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 331cc36232..eed8eea6f2 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -83,7 +83,7 @@ target_ulong helper_sret(CPURISCVState *env,
> target_ulong cpu_pc_deb)
>      }
>
>      if (env->priv_ver >= PRIV_VERSION_1_10_0 &&
> -        get_field(env->mstatus, MSTATUS_TSR)) {
> +        get_field(env->mstatus, MSTATUS_TSR) && !(env->priv >= PRV_M)) {
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
>      }
>
> --
> 2.24.1
>
>
>

--0000000000001a7e3d059ca64113
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Looks good to me. Though this is I think the third bu=
g in privilege checking in op_helper.c which is only like 150 lines long to=
tal. It would be really good to fully double check that there aren&#39;t an=
y more lurking there...<br></div><div><br></div><div>Reviewed-by: Jonathan =
Behrens &lt;<a href=3D"mailto:jonathan@fintelia.io">jonathan@fintelia.io</a=
><a href=3D"mailto:palmerdabbelt@google.com" target=3D"_blank"></a>&gt;</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, Jan 21, 2020 at 12:45 AM Alistair Francis &lt;<a href=3D"mailto:a=
listair.francis@wdc.com">alistair.francis@wdc.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">As reported in: <a href=3D=
"https://bugs.launchpad.net/qemu/+bug/1851939" rel=3D"noreferrer" target=3D=
"_blank">https://bugs.launchpad.net/qemu/+bug/1851939</a> we weren&#39;t<br=
>
correctly handling illegal instructions based on the value of MSTATUS_TSR<b=
r>
and the current privledge level.<br>
<br>
This patch fixes the issue raised in the bug by raising an illegal<br>
instruction if TSR is set and we are in S-Mode.<br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/op_helper.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c<br>
index 331cc36232..eed8eea6f2 100644<br>
--- a/target/riscv/op_helper.c<br>
+++ b/target/riscv/op_helper.c<br>
@@ -83,7 +83,7 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong=
 cpu_pc_deb)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (env-&gt;priv_ver &gt;=3D PRIV_VERSION_1_10_0 &amp;&=
amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(env-&gt;mstatus, MSTATUS_TSR)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(env-&gt;mstatus, MSTATUS_TSR) &amp;&=
amp; !(env-&gt;priv &gt;=3D PRV_M)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_raise_exception(env, RISCV_EXCP_ILL=
EGAL_INST, GETPC());<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-- <br>
2.24.1<br>
<br>
<br>
</blockquote></div>

--0000000000001a7e3d059ca64113--

