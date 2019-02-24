Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gxofo-0002Ew-Bw
	for mharc-qemu-riscv@gnu.org; Sun, 24 Feb 2019 02:58:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amagdy.afifi@gmail.com>) id 1gxofm-0002Dh-Fu
	for qemu-riscv@nongnu.org; Sun, 24 Feb 2019 02:58:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amagdy.afifi@gmail.com>) id 1gxofl-0005wV-7i
	for qemu-riscv@nongnu.org; Sun, 24 Feb 2019 02:58:06 -0500
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:32861)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <amagdy.afifi@gmail.com>)
	id 1gxofi-0005pw-9O; Sun, 24 Feb 2019 02:58:02 -0500
Received: by mail-qt1-x841.google.com with SMTP id z39so7279512qtz.0;
	Sat, 23 Feb 2019 23:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OV8TpkXQoTn+qwr2MGXGGSmey70poW+UyAU4L/87z1I=;
	b=WGpfUxoeph40jowFQ6YY09qTN/DB+MIU4va2meDy5MVZmd1qdoLmzF1QmSFJCF07uv
	Gv7mmJ+YInNIZ40j5WlMlfDLfGENVLqqEDbj1tifH2Y9gVi1f+pokTT3ReuvxYL3VEWV
	nxVVUfayPb/zX7jV+pBnQn3wop//+j/orHUu1hHgU4v73NMSJBKXVTX3Mv/jP356lDlj
	MWtrxQukUNb65NQMMpHQTvADQVUEO2z/39LbunDDBPAc+texeOJ5JMd7QjK8+vTrCoxt
	71ZAE46rWOkmtG9QS4El5U6lJPEUExuMQoUZ5bo7nqcT/DQ4TxXrYY8jV/ipL6NKnM+N
	J3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OV8TpkXQoTn+qwr2MGXGGSmey70poW+UyAU4L/87z1I=;
	b=HKdeDjPPYafJWHoHfTnsPdEmAUwLApfs50iVld8qpRLGckEihLihVtrIHkp7BvxEMZ
	A9ndh33rgxgKPraMEg/nVWrXrCSObKnYx/JVhhYvSI2NeolVnX6KRqD0QjNmpUrTI415
	PfBJOo/RoopH8x1CMvHtJlkNzVAnQa+L83HTcgnI4vuG96xSj3Uv9WRVxjlduK1ENDr4
	Sibk1HuVaqsFe1TaJs48rQLwBJo1fgp02ku+207tCvsKb7bwWwFYGyEYhCUDV8TKCSqh
	3XzbV2Yv6cbktsIOMapN04frIrKfetfwJ1cqZvF6UHaxsjm0Inh/ny5kgViF9Oafnl7M
	b3/Q==
X-Gm-Message-State: AHQUAuaYOADd0NcymYtjqjVGepqn5On4BrdBTkrvUgZ0HZ3TpTE4EXxK
	EgRj9gOHxSgo5CP62KjtciSIBND522xHfQUCalY=
X-Google-Smtp-Source: AHgI3IZDNdME0dImKFiyjv+k7lnCDbbD1j2bgIRHi/Yp1w9SDcbHtTwyQGBFGuHNxZNUsAarpiuC1iNaCRdkDA1lgbo=
X-Received: by 2002:a0c:8889:: with SMTP id 9mr9532600qvn.122.1550995079148;
	Sat, 23 Feb 2019 23:57:59 -0800 (PST)
MIME-Version: 1.0
References: <20190222162555.13764-1-amagdy.afifi@gmail.com>
	<20190222162555.13764-2-amagdy.afifi@gmail.com>
	<f782bdde-2a42-c612-5769-1cde42e7c2a4@linaro.org>
In-Reply-To: <f782bdde-2a42-c612-5769-1cde42e7c2a4@linaro.org>
From: Amed Magdy <amagdy.afifi@gmail.com>
Date: Sun, 24 Feb 2019 09:57:47 +0200
Message-ID: <CAKV=O7mWBKQzVJRJT-bGW0Ojvb7eFraGniqG1-qPidZWHtp8Ew@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu, 
	kbastian@mail.uni-paderborn.de, palmer@sifive.com, mjc@sifive.com, 
	Alistair.Francis@wdc.com
Content-Type: multipart/alternative; boundary="000000000000bdb81105829f2e28"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::841
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv: Add proper alignment
 check and pending 'C' extension upon misa writes
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
X-List-Received-Date: Sun, 24 Feb 2019 07:58:07 -0000

--000000000000bdb81105829f2e28
Content-Type: text/plain; charset="UTF-8"

Thank you for your review and feedback, Richard.
As Eric mentioned, this is the first time contribution. I have been
exploring Qemu for some time and try to understand main flow, internals,
..etc.

>  You cannot manipulate env like this during translation.

>  Neither the write to env->pc_next nor the read from env->pending_rvc
here will
>  be in any synchronization with the execution of write_misa.

Does this applies for translated code in a single translation block only or
for different TBs also ?

So should I manipulate "env" from translation context through helpers only
? for example:

TCGv temp;
tcg_gen_movi_tl(temp, ctx->pc_succ_insn);
gen_helper_next_pc(cpu_env, temp);

while the helper function definition like that:
void helper_next_pc(CPURISCVState *env, target_ulong pc_next)
{
    env->pc_next = pc_next;
}

and the same to read "env->pending_rvc"

I'm thinking of a way to add 'C' extension at run time through waiting the
correct aligned instruction, which I believe it might be after branch
something quite similar to switching between ARM and THUMB states in ARM,
for misa 'RVC' enable to take effect since it will be no possibility to
check alignment with 'C' extension.

Thanks,
Ahmed


On Sat, 23 Feb 2019 at 01:57, Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/22/19 8:25 AM, amagdy.afifi@gmail.com wrote:
> > @@ -373,9 +373,10 @@ static int write_misa(CPURISCVState *env, int
> csrno, target_ulong val)
> >      }
> >
> >      /* Suppress 'C' if next instruction is not aligned
> > -       TODO: this should check next_pc */
> > -    if ((val & RVC) && (GETPC() & ~3) != 0) {
> > +       check next target pc */
> > +    if ((val & RVC) && (env->pc_next & 3) != 0) {
> >          val &= ~RVC;
> > +        env->pending_rvc = 1;
> >      }
> >
> >      /* misa.MXL writes are not supported by QEMU */
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index 2321bba..c9d84ea 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -1999,20 +1999,26 @@ static void decode_RV32_64G(DisasContext *ctx)
> >      }
> >  }
> >
> > -static void decode_opc(DisasContext *ctx)
> > +static void decode_opc(DisasContext *ctx, CPUState *cpu)
> >  {
> > +    CPURISCVState *env = cpu->env_ptr;
> >      /* check for compressed insn */
> >      if (extract32(ctx->opcode, 0, 2) != 3) {
> >          if (!has_ext(ctx, RVC)) {
> >              gen_exception_illegal(ctx);
> >          } else {
> > -            ctx->pc_succ_insn = ctx->base.pc_next + 2;
> > +            env->pc_next = ctx->pc_succ_insn = ctx->base.pc_next + 2;
> >              decode_RV32_64C(ctx);
> >          }
> >      } else {
> > -        ctx->pc_succ_insn = ctx->base.pc_next + 4;
> > +        env->pc_next = ctx->pc_succ_insn = ctx->base.pc_next + 4;
> >          decode_RV32_64G(ctx);
> >      }
> > +    /* check pending RVC */
> > +    if (env->pending_rvc && ((env->pc_next & 3) != 0)) {
> > +        env->misa |= RVC;
> > +        env->pending_rvc = 0;
>
> You cannot manipulate env like this during translation.
>
> Neither the write to env->pc_next nor the read from env->pending_rvc here
> will
> be in any synchronization with the execution of write_misa.
>
> What semantics are you attempting to implement wrt setting/clearing RVC
> from MISA?
>
> > @@ -2061,7 +2067,7 @@ static void riscv_tr_translate_insn
> >      CPURISCVState *env = cpu->env_ptr;
> >
> >      ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
> > -    decode_opc(ctx);
> > +    decode_opc(ctx, cpu);
>
> This is exactly the reason why cpu is *not* passed down to decode_opc, so
> that
> you cannot make this kind of mistake.
>
>
> r~
>

--000000000000bdb81105829f2e28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Thank you for your revie=
w and feedback, Richard.</div><div dir=3D"ltr">As Eric mentioned, this is t=
he first time contribution. I have been exploring Qemu for some time and tr=
y to understand main flow, internals, ..etc.</div><div dir=3D"ltr"><div><br=
></div><div>&gt;=C2=A0 You cannot manipulate env like this during translati=
on.<br><br>&gt;=C2=A0 Neither the write to env-&gt;pc_next nor the read fro=
m env-&gt;pending_rvc here will<br>&gt;=C2=A0 be in any synchronization wit=
h the execution of write_misa.=C2=A0</div><div>=C2=A0<br></div><div>Does th=
is applies for translated code in a single translation block only or for di=
fferent TBs also ?</div><div><br></div><div>So should I manipulate &quot;en=
v&quot; from translation context through helpers only ? for=C2=A0example:</=
div><div><br></div><div>TCGv temp;</div><div><div>tcg_gen_movi_tl(temp, ctx=
-&gt;pc_succ_insn);</div><div>gen_helper_next_pc(cpu_env, temp);</div></div=
><div><br></div><div>while the helper function definition like that:</div><=
div><div>void helper_next_pc(CPURISCVState *env, target_ulong pc_next)</div=
><div>{</div><div>=C2=A0 =C2=A0 env-&gt;pc_next =3D pc_next;</div><div>}</d=
iv></div><div><br></div><div>and the same to read &quot;env-&gt;pending_rvc=
&quot;</div><div><br></div><div>I&#39;m thinking of a way to add &#39;C&#39=
; extension at run time through waiting the correct aligned instruction, wh=
ich I believe it might be after branch something quite similar to switching=
 between ARM and THUMB states in ARM, for misa &#39;RVC&#39; enable to take=
 effect since it will be no possibility to check alignment with &#39;C&#39;=
 extension.</div><div><br></div><div>Thanks,</div><div>Ahmed</div><div><br>=
</div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Sat, 23 Feb 2019 at 01:57, Richard Henderson &lt;<a hr=
ef=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 2=
/22/19 8:25 AM, <a href=3D"mailto:amagdy.afifi@gmail.com" target=3D"_blank"=
>amagdy.afifi@gmail.com</a> wrote:<br>
&gt; @@ -373,9 +373,10 @@ static int write_misa(CPURISCVState *env, int csr=
no, target_ulong val)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Suppress &#39;C&#39; if next instruction is not=
 aligned<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0TODO: this should check next_pc */<br>
&gt; -=C2=A0 =C2=A0 if ((val &amp; RVC) &amp;&amp; (GETPC() &amp; ~3) !=3D =
0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0check next target pc */<br>
&gt; +=C2=A0 =C2=A0 if ((val &amp; RVC) &amp;&amp; (env-&gt;pc_next &amp; 3=
) !=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val &amp;=3D ~RVC;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;pending_rvc =3D 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* misa.MXL writes are not supported by QEMU */<br=
>
&gt; diff --git a/target/riscv/translate.c b/target/riscv/translate.c<br>
&gt; index 2321bba..c9d84ea 100644<br>
&gt; --- a/target/riscv/translate.c<br>
&gt; +++ b/target/riscv/translate.c<br>
&gt; @@ -1999,20 +1999,26 @@ static void decode_RV32_64G(DisasContext *ctx)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void decode_opc(DisasContext *ctx)<br>
&gt; +static void decode_opc(DisasContext *ctx, CPUState *cpu)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 CPURISCVState *env =3D cpu-&gt;env_ptr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* check for compressed insn */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (extract32(ctx-&gt;opcode, 0, 2) !=3D 3) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!has_ext(ctx, RVC)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_exception_illegal(=
ctx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;pc_succ_insn =3D ct=
x-&gt;base.pc_next + 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;pc_next =3D ctx-&gt=
;pc_succ_insn =3D ctx-&gt;base.pc_next + 2;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 decode_RV32_64C(ctx);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;pc_succ_insn =3D ctx-&gt;base.pc_=
next + 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;pc_next =3D ctx-&gt;pc_succ_insn =
=3D ctx-&gt;base.pc_next + 4;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 decode_RV32_64G(ctx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 /* check pending RVC */<br>
&gt; +=C2=A0 =C2=A0 if (env-&gt;pending_rvc &amp;&amp; ((env-&gt;pc_next &a=
mp; 3) !=3D 0)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;misa |=3D RVC;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;pending_rvc =3D 0;<br>
<br>
You cannot manipulate env like this during translation.<br>
<br>
Neither the write to env-&gt;pc_next nor the read from env-&gt;pending_rvc =
here will<br>
be in any synchronization with the execution of write_misa.<br>
<br>
What semantics are you attempting to implement wrt setting/clearing RVC fro=
m MISA?<br>
<br>
&gt; @@ -2061,7 +2067,7 @@ static void riscv_tr_translate_insn<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CPURISCVState *env =3D cpu-&gt;env_ptr;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ctx-&gt;opcode =3D cpu_ldl_code(env, ctx-&gt;base.=
pc_next);<br>
&gt; -=C2=A0 =C2=A0 decode_opc(ctx);<br>
&gt; +=C2=A0 =C2=A0 decode_opc(ctx, cpu);<br>
<br>
This is exactly the reason why cpu is *not* passed down to decode_opc, so t=
hat<br>
you cannot make this kind of mistake.<br>
<br>
<br>
r~<br>
</blockquote></div>

--000000000000bdb81105829f2e28--

