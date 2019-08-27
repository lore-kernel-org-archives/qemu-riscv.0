Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i2dkS-0002fh-Dc
	for mharc-qemu-riscv@gnu.org; Tue, 27 Aug 2019 11:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56044)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chihmin.chao@sifive.com>) id 1i2dkP-0002cj-Ma
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 11:51:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1i2dkO-0005Zo-HE
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 11:51:05 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:35823)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1i2dkO-0005ZV-Bv
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 11:51:04 -0400
Received: by mail-io1-xd42.google.com with SMTP id b10so38395258ioj.2
 for <qemu-riscv@nongnu.org>; Tue, 27 Aug 2019 08:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v+lH8Rmoew2rqkppJIq9VYIhR98MkxmJCflZaHejMXM=;
 b=BXf0wgFU/Xjb7QZtSL7d6bIX2pa0hfSCY0bDGhQferoEj2kstXXnfA1/WRscJwh60C
 Q9eg/vn0wCdphHU/ASo8u3EaKSLG4kkqX+x3SALCQbPcie+grYOLRQwZ9KU2b/mTKUeq
 Xeg+8W7MiLRtablz5xqidnncSl6ENqQfriT4nlNIXYiQBHAz/ivXESBMludHbPToFpTz
 WUIdthv11SbFmdPBNARktLAGYsMh1vp4YYiTONzevsqAppHNs0X5Y8CgH3fbFBJkEvWG
 YBC8QsO68uiDNLHL9mo5VHihxZT4+AImynkdlUZAIuSzpLUz+/Ns3XO1j+VYm+BZfkEA
 a6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v+lH8Rmoew2rqkppJIq9VYIhR98MkxmJCflZaHejMXM=;
 b=ghbjD7nf4HnvRLPwYoxpMFBF9fgA+F5iWk2yLlCrLrKKNx0cBtIRU7/AfYGjQeQ8/V
 GOjWZnTbH1Bipks8+YGN3lFAMB44qNRgLmle3zLcDV/uujjkboiO6LDUzw6iV7ziXl1U
 YWiQnOjOjqmaUTXb03R3lWFiNhbR16oCIww0zEjx5EhfT5jDOpQL/KpNnYtg4z5O9rc9
 wcrib/qOSjgFi991UIUrSVhG8hSb2jHD5gRdw/RZFYcQ+KvncgXjiJDatvuzxkgMZ47Y
 yYr5I8rfw6cQ2fe1xfezuXa1lNlW/o0+oB817x/HCuL55gIwXWhfw20UCVLJovBaYl1H
 WNbw==
X-Gm-Message-State: APjAAAU0v1XmNqq+Apyz9chRnYwPFj53om4vCpOXbLhUqBoY/0F++Yi6
 LNlgiurq32hmgE816rBYE/XtePh2I9IdbW9F/l6liA==
X-Google-Smtp-Source: APXvYqzacKm4FYtxclYdKDgjQZnFnIPVeyN83/m+yGPla+26oZKxVenGpkrGAJmgRV7TewqnAdOnmPNJW3rbCIw0JOQ=
X-Received: by 2002:a02:a07:: with SMTP id 7mr23529361jaw.141.1566921063513;
 Tue, 27 Aug 2019 08:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1566603412.git.alistair.francis@wdc.com>
 <e959ee81e5121c74678d2383a28665e44db9e31d.1566603412.git.alistair.francis@wdc.com>
In-Reply-To: <e959ee81e5121c74678d2383a28665e44db9e31d.1566603412.git.alistair.francis@wdc.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Tue, 27 Aug 2019 23:50:52 +0800
Message-ID: <CAEiOBXX5RvuVjR805xnFDtGY-THYgUtiHvA-Yp-=NSP6SryUaA@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Anup.Patel@wdc.com, 
 Palmer Dabbelt <palmer@sifive.com>, Atish.Patra@wdc.com
Content-Type: multipart/alternative; boundary="00000000000061d97a05911b3d8f"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d42
Subject: Re: [Qemu-riscv] [PATCH v1 05/28] target/riscv: Add the Hypervisor
 CSRs to CPUState
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
X-List-Received-Date: Tue, 27 Aug 2019 15:51:07 -0000

--00000000000061d97a05911b3d8f
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 24, 2019 at 7:45 AM Alistair Francis <alistair.francis@wdc.com>
wrote:

> As the MIP CSR is 32-bits to allow atomic_read on 32-bit hosts the vsip
> is 32-bit as well.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3a95c41428..4c342e7a79 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -154,6 +154,23 @@ struct CPURISCVState {
>      target_ulong mcause;
>      target_ulong mtval;  /* since: priv-1.10.0 */
>
> +    /* Hypervisor CSRs */
> +    target_ulong hstatus;
> +    target_ulong hedeleg;
> +    target_ulong hideleg;
> +    target_ulong hgatp;
> +
> +    /* Virtual CSRs */
> +    target_ulong vsstatus;
> +    uint32_t vsip;
> +    target_ulong vsie;
> +    target_ulong vstvec;
> +    target_ulong vsscratch;
> +    target_ulong vsepc;
> +    target_ulong vscause;
> +    target_ulong vstval;
> +    target_ulong vsatp;
> +
>      target_ulong scounteren;
>      target_ulong mcounteren;
>
> --
> 2.22.0
>
>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

--00000000000061d97a05911b3d8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 24, 2019 at 7:45 AM Alist=
air Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com">alistair.franci=
s@wdc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">As the MIP CSR is 32-bits to allow atomic_read on 32-bit hosts t=
he vsip<br>
is 32-bit as well.<br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.h | 17 +++++++++++++++++<br>
=C2=A01 file changed, 17 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index 3a95c41428..4c342e7a79 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -154,6 +154,23 @@ struct CPURISCVState {<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mcause;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mtval;=C2=A0 /* since: priv-1.10.0 */<br>
<br>
+=C2=A0 =C2=A0 /* Hypervisor CSRs */<br>
+=C2=A0 =C2=A0 target_ulong hstatus;<br>
+=C2=A0 =C2=A0 target_ulong hedeleg;<br>
+=C2=A0 =C2=A0 target_ulong hideleg;<br>
+=C2=A0 =C2=A0 target_ulong hgatp;<br>
+<br>
+=C2=A0 =C2=A0 /* Virtual CSRs */<br>
+=C2=A0 =C2=A0 target_ulong vsstatus;<br>
+=C2=A0 =C2=A0 uint32_t vsip;<br>
+=C2=A0 =C2=A0 target_ulong vsie;<br>
+=C2=A0 =C2=A0 target_ulong vstvec;<br>
+=C2=A0 =C2=A0 target_ulong vsscratch;<br>
+=C2=A0 =C2=A0 target_ulong vsepc;<br>
+=C2=A0 =C2=A0 target_ulong vscause;<br>
+=C2=A0 =C2=A0 target_ulong vstval;<br>
+=C2=A0 =C2=A0 target_ulong vsatp;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0target_ulong scounteren;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mcounteren;<br>
<br>
-- <br>
2.22.0<br><br></blockquote><div><br></div><div>Reviewed-by: Chih-Min Chao &=
lt;<a href=3D"mailto:chihmin.chao@sifive.com" target=3D"_blank">chihmin.cha=
o@sifive.com</a>&gt;=C2=A0</div></div></div>

--00000000000061d97a05911b3d8f--

