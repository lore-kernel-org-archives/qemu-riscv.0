Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hNfsZ-0004VJ-HF
	for mharc-qemu-riscv@gnu.org; Mon, 06 May 2019 11:50:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hNfsW-0004RY-Ek
	for qemu-riscv@nongnu.org; Mon, 06 May 2019 11:50:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hNfsV-0004t9-F1
	for qemu-riscv@nongnu.org; Mon, 06 May 2019 11:50:08 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:33358)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <fintelia@gmail.com>)
	id 1hNfsS-0004pe-Si; Mon, 06 May 2019 11:50:05 -0400
Received: by mail-lj1-x241.google.com with SMTP id f23so11550183ljc.0;
	Mon, 06 May 2019 08:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YzBFLfOBNQD3UddUpNEOA3LwTR9aw0kS6lW55P95JdU=;
	b=TXtUfHJ/tlWKxLsRSf+QeJx5I6bzJhk1v4+pIVoZW1xW+DqROBb60WeUw83Lkia3f4
	OsZIi6k6FwvsGs6SDYAyYXxslhnV3h8NTsMSOY9qQKFDyltbgZMIVpvNYM2nO1nJ8rNa
	lKVVgbvTkF0s22sqS0qi4RGvpjQl2l91tewQ3DR+7XW7l8xCULdDKbNRoasT5yuxXRJD
	PQO74p0ZYwrMuhhoePO/6c2iHpP+z2jml1c/n65nCTEdNRoaIs2dzsF08DrxIc5YtjJL
	gO0Sn9hoJuuFN7gHmIsyDMmgp9cVmGEz/mjfmgFDKqNWoYN1dbKTwSIYhcZxcDcYIjPy
	mXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YzBFLfOBNQD3UddUpNEOA3LwTR9aw0kS6lW55P95JdU=;
	b=LAOOh5y3/4HyT/Ke7V60kKOLPWBYL9q/NZLCmTLxjg3WQ/gm9luj77ENEH1a/8Q3n9
	45NSR2KaAQSVpcb6849+OI6eGWXBYUKzQMlx2hnVYwUA+UvDyVx+sN9ntOy4NGzKnnkP
	+Oa/4XjvA/vaeCqFad8XwLbCFupSEBBo/Ulxj4ZOXXzkvW7Wcz0Y8EpK4W6rlXyFsanA
	o2hWCwKOfoOWyh76fS2aRFR/0eS/plOGx6/7QsBmEur9N53DYlRnNIM2x93Vz9y2An1k
	Hz9wC2sPN6N3TbiAB4N3AsLlCBof9Q0Ux2nAcbeA6h5ZgIBq69Oo0/fHQ8B7SzR82JbG
	xjmw==
X-Gm-Message-State: APjAAAV7Ay+QUsSWzMLfG/lmYVVgCEcau+tG5KQ1MapOkcVli8WPxKIm
	PTaDa2gAzJCAEdwKzDkAlCCLFiYSosjUABHDqml1l6Kh
X-Google-Smtp-Source: APXvYqx1RtrxJfKjJfkhihbQFKc1dcpoKPxa9QVhhTV+VeD06/aRqU2juURTGWWoIOB0+bCTIvuYD8Q88yGP146kzIw=
X-Received: by 2002:a2e:9c51:: with SMTP id t17mr14240886ljj.104.1557157803107;
	Mon, 06 May 2019 08:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <CANnJOVFj9yhbjPY=_+LNDWwO=Q8jLFnH01AbTY8T0p=cmkrNiw@mail.gmail.com>
In-Reply-To: <CANnJOVFj9yhbjPY=_+LNDWwO=Q8jLFnH01AbTY8T0p=cmkrNiw@mail.gmail.com>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Mon, 6 May 2019 11:49:36 -0400
Message-ID: <CANnJOVFnA=MT5SnaskcafM5e1nCTzzcXpwKZfHM-2bSx3fnoEA@mail.gmail.com>
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	Palmer Dabbelt <palmer@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: multipart/alternative; boundary="000000000000b6a84805883a0d66"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-riscv] [PATCH for 4.1] target/riscv: Only flush TLB if
 SATP.ASID changes
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
X-List-Received-Date: Mon, 06 May 2019 15:50:09 -0000

--000000000000b6a84805883a0d66
Content-Type: text/plain; charset="UTF-8"

Argh, meant to include a signed off by line:

Signed-off-by: Jonathan Behrens <fintelia@gmail.com>

On Mon, May 6, 2019 at 11:31 AM Jonathan Behrens <fintelia@gmail.com> wrote:

> There is an analogous change for ARM here:
> https://patchwork.kernel.org/patch/10649857
> ---
>  target/riscv/csr.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 6083c782a1..1ec1222da1 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -732,7 +732,9 @@ static int write_satp(CPURISCVState *env, int csrno,
> target_ulong val)
>          if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
>              return -1;
>          } else {
> -            tlb_flush(CPU(riscv_env_get_cpu(env)));
> +            if((val ^ env->satp) & SATP_ASID) {
> +                tlb_flush(CPU(riscv_env_get_cpu(env)));
> +            }
>              env->satp = val;
>          }
>      }
> --
> 2.20.1
>
>

--000000000000b6a84805883a0d66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Argh, meant to include a signed off by line:<br></div=
><div dir=3D"ltr"><br></div><div dir=3D"ltr">Signed-off-by: Jonathan Behren=
s &lt;<a href=3D"mailto:fintelia@gmail.com" target=3D"_blank">fintelia@gmai=
l.com</a>&gt;</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, May 6, 2019 at 11:31 AM Jonathan Behrens &lt;<a href=
=3D"mailto:fintelia@gmail.com" target=3D"_blank">fintelia@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr">There is an analogous change for ARM here:<br><a =
href=3D"https://patchwork.kernel.org/patch/10649857" target=3D"_blank">http=
s://patchwork.kernel.org/patch/10649857</a><br>---<br>=C2=A0target/riscv/cs=
r.c | 4 +++-<br>=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br><br=
>diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>index 6083c782a1..=
1ec1222da1 100644<br>--- a/target/riscv/csr.c<br>+++ b/target/riscv/csr.c<b=
r>@@ -732,7 +732,9 @@ static int write_satp(CPURISCVState *env, int csrno, =
target_ulong val)<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (e=
nv-&gt;priv =3D=3D PRV_S &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_TVM)=
) {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return -1;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } els=
e {<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
tlb_flush(CPU(riscv_env_get_cpu(env)));<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if((val ^ env-&gt;satp) &amp; SATP_ASI=
D) {<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 tlb_flush(CPU(riscv_env_get_cpu(env)));<br>+=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env-&gt;sat=
p =3D val;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>=C2=A0=
=C2=A0=C2=A0=C2=A0 }<br>-- <br>2.20.1<br><br></div></div>
</blockquote></div></div>

--000000000000b6a84805883a0d66--

