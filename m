Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C37C7EE25
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 08:38:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7Xd8-0008Rc-Ig; Fri, 09 Jun 2023 04:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q7Xd6-0008RD-Mt
 for qemu-riscv@nongnu.org; Fri, 09 Jun 2023 04:37:56 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q7Xd3-0002Zm-RY
 for qemu-riscv@nongnu.org; Fri, 09 Jun 2023 04:37:56 -0400
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-43b87490a27so525062137.0
 for <qemu-riscv@nongnu.org>; Fri, 09 Jun 2023 01:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1686299872; x=1688891872;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kKJgu0Y3h26oBcC7LozsU/J1Ar+vqf0d27xOH+ejCy8=;
 b=OY5vB9lol2EcVOnATr/S9xcrevPNcbmSx9BN/Di08fNHdgchDw4vyvC016MasCLAHA
 egpsR9D0Z9h0DOx3jC9B5gRSeSNbv8psxMkwTJoOdYPd8gJ5M/jO6BM4vMrlrwy9b9EA
 PFdiSIVdURZ0Xwd7MK3zDKIdBSLILUTQgzKQv26HNRpvEkd6g2Ir32dr6oAwM1oX7+Yb
 GNWG2fLF9WAhvvITN7PTASFjdJHhTRiGTxpoSCpsOAD1+9RlQLZUBflYEAC5UrNvhIqx
 rHpwf7nGm7oe6VUnbQXKH7OdcgbCjD5xnDQksrJfvLT0MaUHzrLBMo+Q4y+i2PrZnL13
 fvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686299872; x=1688891872;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kKJgu0Y3h26oBcC7LozsU/J1Ar+vqf0d27xOH+ejCy8=;
 b=bMBgHokv8gd9UJp2D+gvhJZPfnz0afBEQ9UbkNEk+xioMEkRdNRII8g1mWmeLHCtGa
 dW21myjm7Ew/wMmcApUtq0JsV9G1W9rQfZGTHzkyRt8fQzz8TWz53rJDObDKZxdRoYTL
 aCVGN6JNJwli6DugO1yGP6QkmwBKFE02r59NHjI/p9E6S0pZxVU1i22xYusxuBtjgef6
 5KLsHF9rWe632uC/rqDYzpnRPiUSn4+0bObvPJFO103avU7AePdeDQyEkj71uGkJ1Xxv
 1+MrxM/aSrwhJwHKK9y/VzeGlPY2WO/9agILkYt4L9CEYBhFeLavxJGuKK3EXuYNdgnt
 ykfw==
X-Gm-Message-State: AC+VfDzftUbIROTuLIj1jkKm6yq370aCoLQvfBMs3IMnm8ufTqhWYR+r
 SGqdTife2ZAVjfPa0g/bxuh4VyLSgouue55yV+V4Zw==
X-Google-Smtp-Source: ACHHUZ7tnDy2VT2LAW+rFEtZUmX6zcfD7rrKMxku+pCIUNAa7pGMQatRbfvZUZSsnrgrXmN1+C/HmuF+v3y8MJrDyVI=
X-Received: by 2002:a05:6102:34f9:b0:43b:458f:b078 with SMTP id
 bi25-20020a05610234f900b0043b458fb078mr522568vsb.30.1686299872113; Fri, 09
 Jun 2023 01:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230523114454.717708-1-tommy.wu@sifive.com>
 <20230523114454.717708-2-tommy.wu@sifive.com>
 <CAKmqyKOfkhN=3+asF-u3r7y83GiZjv34mv42Yp0Ye0NzUEnezQ@mail.gmail.com>
In-Reply-To: <CAKmqyKOfkhN=3+asF-u3r7y83GiZjv34mv42Yp0Ye0NzUEnezQ@mail.gmail.com>
From: Tommy Wu <tommy.wu@sifive.com>
Date: Fri, 9 Jun 2023 16:37:41 +0800
Message-ID: <CANj3q_ng7=2-gosL7HywNRVcqZqkK4aWodBNp6rjqV8OpMJDEA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Add a function to refresh the dynamic
 CSRs xml.
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, frank.chang@sifive.com, 
 alistair.francis@wdc.com, apatel@ventanamicro.com, palmer@rivosinc.com, 
 dbarboza@ventanamicro.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com
Content-Type: multipart/alternative; boundary="000000000000dcd43805fdae4838"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=tommy.wu@sifive.com; helo=mail-vs1-xe36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--000000000000dcd43805fdae4838
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alistair,
Thanks for the suggestion! Do you mean
```
    ...
    g_free(cpu->dyn_csr_xml);
    riscv_gen_dynamic_csr_xml(cs, cpu-> gdb_num_regs  -  CSR_TABLE_SIZE);
    ...
``` ?

Or maybe we don't need this refresh function, and just add ext_ssaia &
ext_smaia in the command line.

Best Regards,
Tommy

On Thu, May 25, 2023 at 10:33=E2=80=AFAM Alistair Francis <alistair23@gmail=
.com>
wrote:

> On Tue, May 23, 2023 at 9:46=E2=80=AFPM Tommy Wu <tommy.wu@sifive.com> wr=
ote:
> >
> > When we change the cpu extension state after the cpu is
> > realized, we cannot print the value of some CSRs in the remote
> > gdb debugger. The root cause is that the dynamic CSR xml is
> > generated when the cpu is realized.
> >
> > This patch add a function to refresh the dynamic CSR xml after
> > the cpu is realized.
> >
> > Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> > Reviewed-by: Frank Chang <frank.chang@sifive.com>
> > ---
> >  target/riscv/cpu.h     |  2 ++
> >  target/riscv/gdbstub.c | 12 ++++++++++++
> >  2 files changed, 14 insertions(+)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index de7e43126a..dc8e592275 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -494,6 +494,7 @@ struct ArchCPU {
> >      CPUNegativeOffsetState neg;
> >      CPURISCVState env;
> >
> > +    int dyn_csr_base_reg;
> >      char *dyn_csr_xml;
> >      char *dyn_vreg_xml;
> >
> > @@ -781,6 +782,7 @@ void riscv_get_csr_ops(int csrno,
> riscv_csr_operations *ops);
> >  void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
> >
> >  void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
> > +void riscv_refresh_dynamic_csr_xml(CPUState *cs);
> >
> >  uint8_t satp_mode_max_from_map(uint32_t map);
> >  const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
> > diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> > index 524bede865..9e97ee2c35 100644
> > --- a/target/riscv/gdbstub.c
> > +++ b/target/riscv/gdbstub.c
> > @@ -230,6 +230,8 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs,
> int base_reg)
> >          bitsize =3D 64;
> >      }
> >
> > +    cpu->dyn_csr_base_reg =3D base_reg;
> > +
> >      g_string_printf(s, "<?xml version=3D\"1.0\"?>");
> >      g_string_append_printf(s, "<!DOCTYPE feature SYSTEM
> \"gdb-target.dtd\">");
> >      g_string_append_printf(s, "<feature
> name=3D\"org.gnu.gdb.riscv.csr\">");
> > @@ -349,3 +351,13 @@ void
> riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
> >                                   "riscv-csr.xml", 0);
> >      }
> >  }
> > +
> > +void riscv_refresh_dynamic_csr_xml(CPUState *cs)
> > +{
> > +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> > +    if (!cpu->dyn_csr_xml) {
> > +        g_assert_not_reached();
> > +    }
> > +    g_free(cpu->dyn_csr_xml);
> > +    riscv_gen_dynamic_csr_xml(cs, cpu->dyn_csr_base_reg);
>
> I don't really understand why we need dyn_csr_base_reg, could we just
> use cs->gdb_num_regs directly here?
>
> Alistair
>
> > +}
> > --
> > 2.38.1
> >
> >
>

--000000000000dcd43805fdae4838
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alistair,<br>Thanks for the suggestion! Do you mean=C2=
=A0<div>```</div><div>=C2=A0 =C2=A0 ...</div><div>=C2=A0 =C2=A0 g_free(cpu-=
&gt;dyn_csr_xml);<br>=C2=A0 =C2=A0 riscv_gen_dynamic_csr_xml(cs, cpu-&gt;

gdb_num_regs=C2=A0 -=C2=A0 CSR_TABLE_SIZE);<br></div><div>=C2=A0 =C2=A0 ...=
</div><div>``` ?</div><div><br></div><div>Or maybe we don&#39;t need this r=
efresh function, and just add ext_ssaia=C2=A0&amp; ext_smaia in the command=
 line.</div><div><br>Best Regards,<br>Tommy</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 25, 2023 at 10=
:33=E2=80=AFAM Alistair Francis &lt;<a href=3D"mailto:alistair23@gmail.com"=
>alistair23@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Tue, May 23, 2023 at 9:46=E2=80=AFPM Tommy Wu &lt;<=
a href=3D"mailto:tommy.wu@sifive.com" target=3D"_blank">tommy.wu@sifive.com=
</a>&gt; wrote:<br>
&gt;<br>
&gt; When we change the cpu extension state after the cpu is<br>
&gt; realized, we cannot print the value of some CSRs in the remote<br>
&gt; gdb debugger. The root cause is that the dynamic CSR xml is<br>
&gt; generated when the cpu is realized.<br>
&gt;<br>
&gt; This patch add a function to refresh the dynamic CSR xml after<br>
&gt; the cpu is realized.<br>
&gt;<br>
&gt; Signed-off-by: Tommy Wu &lt;<a href=3D"mailto:tommy.wu@sifive.com" tar=
get=3D"_blank">tommy.wu@sifive.com</a>&gt;<br>
&gt; Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com"=
 target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
&gt;=C2=A0 target/riscv/gdbstub.c | 12 ++++++++++++<br>
&gt;=C2=A0 2 files changed, 14 insertions(+)<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index de7e43126a..dc8e592275 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -494,6 +494,7 @@ struct ArchCPU {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CPUNegativeOffsetState neg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CPURISCVState env;<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 int dyn_csr_base_reg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 char *dyn_csr_xml;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 char *dyn_vreg_xml;<br>
&gt;<br>
&gt; @@ -781,6 +782,7 @@ void riscv_get_csr_ops(int csrno, riscv_csr_operat=
ions *ops);<br>
&gt;=C2=A0 void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);<br=
>
&gt;<br>
&gt;=C2=A0 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);<br>
&gt; +void riscv_refresh_dynamic_csr_xml(CPUState *cs);<br>
&gt;<br>
&gt;=C2=A0 uint8_t satp_mode_max_from_map(uint32_t map);<br>
&gt;=C2=A0 const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);<br=
>
&gt; diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c<br>
&gt; index 524bede865..9e97ee2c35 100644<br>
&gt; --- a/target/riscv/gdbstub.c<br>
&gt; +++ b/target/riscv/gdbstub.c<br>
&gt; @@ -230,6 +230,8 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs,=
 int base_reg)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bitsize =3D 64;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;dyn_csr_base_reg =3D base_reg;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_string_printf(s, &quot;&lt;?xml version=3D\&quot=
;1.0\&quot;?&gt;&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_string_append_printf(s, &quot;&lt;!DOCTYPE featu=
re SYSTEM \&quot;gdb-target.dtd\&quot;&gt;&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_string_append_printf(s, &quot;&lt;feature name=
=3D\&quot;org.gnu.gdb.riscv.csr\&quot;&gt;&quot;);<br>
&gt; @@ -349,3 +351,13 @@ void riscv_cpu_register_gdb_regs_for_features(CPU=
State *cs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;riscv-csr.xml&=
quot;, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt; +<br>
&gt; +void riscv_refresh_dynamic_csr_xml(CPUState *cs)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
&gt; +=C2=A0 =C2=A0 if (!cpu-&gt;dyn_csr_xml) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 g_free(cpu-&gt;dyn_csr_xml);<br>
&gt; +=C2=A0 =C2=A0 riscv_gen_dynamic_csr_xml(cs, cpu-&gt;dyn_csr_base_reg)=
;<br>
<br>
I don&#39;t really understand why we need dyn_csr_base_reg, could we just<b=
r>
use cs-&gt;gdb_num_regs directly here?<br>
<br>
Alistair<br>
<br>
&gt; +}<br>
&gt; --<br>
&gt; 2.38.1<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--000000000000dcd43805fdae4838--

