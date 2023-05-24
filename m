Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213E3C77B7E
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 May 2023 02:00:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1dmq-0006u1-L2; Tue, 23 May 2023 21:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q1dmo-0006tU-CF
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 21:59:34 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q1dmm-0003ox-Iq
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 21:59:34 -0400
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-437df8c864bso130896137.1
 for <qemu-riscv@nongnu.org>; Tue, 23 May 2023 18:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1684893571; x=1687485571;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZfJcgXUarV83iXX5buusi5S0c342ea7yX5a9TKFopP4=;
 b=dURV2sC6gz1s5UDHcolfnsJ7ClN7ZyoBMEMlY4Ch+lFEWrLX7RI/daXQPI5ISku21I
 AEfplnAuay/ajU+wjlU1j3ei0xn3jxwJJaZT6rm+XV4mk7IZOzyYNKw1+NwjGk4hxBx8
 ZSRkGK5tLCDdoES8bq3uVdo6eOENigVXGkUHl5qcj+NlvkOP5/qLGEpqEcEhNMztjSFT
 +HPLyxoO8gEZgpj2mGHRKx23VuYZL1TLQmQmT7JIpWmWKKckgk9QfxrZhuqItmkelTSp
 cQULm5wLubObsAe0GS2FnCo28t9Jg7Rfl4AeQ43z1eC3x1FCnOr48/l29cNCW6fr56l5
 IFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684893571; x=1687485571;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZfJcgXUarV83iXX5buusi5S0c342ea7yX5a9TKFopP4=;
 b=P6LqUfxrBEUXZyvwJJnJw5L2L9CKM5NSrwBLVCOuRGYFGu99sz3EZoShkfSWEuzXus
 Vy79umYC12Xt2A4/rcKuZGXM2jsQsTWxhT2OrbFmdJAl2w70v2lF6ArUEFWUQEYAaTMJ
 dZYBDKWsTmzZFzaYwf6/V90dC6u63Fd/sQZq7h0SOemah18oa2xhVm1pgzM/lMfa9ur8
 CbBgYzvrliMYeL90UecBQSns8O/ouQfRjUKMsw5Flh1g0kz5EbRDu0vdrMrocIcjYVx8
 ihSEWiKF1g730LXeG9QE5wBF4hq3AK+TyHLQ0AGG2rqpO1b9coEOGr4YKdijNXZM7cMk
 7vcQ==
X-Gm-Message-State: AC+VfDy5qTF7aFUx00S6ZT1yZqpH4rbx67sduqC31aPHZyoFSODaxTOo
 w0NTXYwtR97ufTfhZUWP9yitEeBjRqC11MVIiBRtUA56AEu2Gyv6C5Dy/Q==
X-Google-Smtp-Source: ACHHUZ4Y4CXtWSTEac9l/RKNnitB3SJOeI54YHViyXMjMhCd8/W51rLzEGkk110vaiFgYT+d/xarwDaWkPUOJZeJTrk=
X-Received: by 2002:a67:f3d3:0:b0:436:22fe:1d9 with SMTP id
 j19-20020a67f3d3000000b0043622fe01d9mr4674210vsn.10.1684893571337; Tue, 23
 May 2023 18:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230523114454.717708-1-tommy.wu@sifive.com>
 <20230523114454.717708-2-tommy.wu@sifive.com>
 <5d3558a0-8b7f-8b84-a4e0-a6f4404a56b6@iscas.ac.cn>
In-Reply-To: <5d3558a0-8b7f-8b84-a4e0-a6f4404a56b6@iscas.ac.cn>
From: Tommy Wu <tommy.wu@sifive.com>
Date: Wed, 24 May 2023 09:59:21 +0800
Message-ID: <CANj3q_=E_TfaHLn4rHQp4jy5U0LXoXCFDjYVwh7c85h_oB_F7Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Add a function to refresh the dynamic
 CSRs xml.
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, frank.chang@sifive.com, 
 alistair.francis@wdc.com, apatel@ventanamicro.com, palmer@rivosinc.com, 
 dbarboza@ventanamicro.com, bin.meng@windriver.com, 
 zhiwei_liu@linux.alibaba.com
Content-Type: multipart/alternative; boundary="000000000000cdf15a05fc66da67"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=tommy.wu@sifive.com; helo=mail-vs1-xe30.google.com
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

--000000000000cdf15a05fc66da67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Weiwei Li,

`dyn_csr_base_reg` will be used in `riscv_refresh_dynamic_csr_xml`
We can initialize this variable when the cpu is realized. And used this
variable in `riscv_refresh_dynamic_csr_xml`.

Best regards,
Tommy


On Tue, May 23, 2023 at 10:38=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> w=
rote:

>
> On 2023/5/23 19:44, Tommy Wu wrote:
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
> >   target/riscv/cpu.h     |  2 ++
> >   target/riscv/gdbstub.c | 12 ++++++++++++
> >   2 files changed, 14 insertions(+)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index de7e43126a..dc8e592275 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -494,6 +494,7 @@ struct ArchCPU {
> >       CPUNegativeOffsetState neg;
> >       CPURISCVState env;
> >
> > +    int dyn_csr_base_reg;
>
> dyn_csr_base_reg  seems have no additional effect on the function.
>
> And It remains unmodified in following riscv_refresh_dynamic_csr_xml().
>
> Regards,
>
> Weiwei Li
>
> >       char *dyn_csr_xml;
> >       char *dyn_vreg_xml;
> >
> > @@ -781,6 +782,7 @@ void riscv_get_csr_ops(int csrno,
> riscv_csr_operations *ops);
> >   void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
> >
> >   void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
> > +void riscv_refresh_dynamic_csr_xml(CPUState *cs);
> >
> >   uint8_t satp_mode_max_from_map(uint32_t map);
> >   const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
> > diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> > index 524bede865..9e97ee2c35 100644
> > --- a/target/riscv/gdbstub.c
> > +++ b/target/riscv/gdbstub.c
> > @@ -230,6 +230,8 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs,
> int base_reg)
> >           bitsize =3D 64;
> >       }
> >
> > +    cpu->dyn_csr_base_reg =3D base_reg;
> > +
> >       g_string_printf(s, "<?xml version=3D\"1.0\"?>");
> >       g_string_append_printf(s, "<!DOCTYPE feature SYSTEM
> \"gdb-target.dtd\">");
> >       g_string_append_printf(s, "<feature
> name=3D\"org.gnu.gdb.riscv.csr\">");
> > @@ -349,3 +351,13 @@ void
> riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
> >                                    "riscv-csr.xml", 0);
> >       }
> >   }
> > +
> > +void riscv_refresh_dynamic_csr_xml(CPUState *cs)
> > +{
> > +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> > +    if (!cpu->dyn_csr_xml) {
> > +        g_assert_not_reached();
> > +    }
> > +    g_free(cpu->dyn_csr_xml);
> > +    riscv_gen_dynamic_csr_xml(cs, cpu->dyn_csr_base_reg);
> > +}
>
>

--000000000000cdf15a05fc66da67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Weiwei Li,<div><br></div><div>`dyn_csr_base_reg` w=
ill be used in `<span style=3D"color:rgb(0,0,0)">riscv_refresh_dynamic_csr_=
xml`</span><br></div><div><font color=3D"#000000">We can initialize this va=
riable when the cpu is realized. And used this variable in `</font><span st=
yle=3D"color:rgb(0,0,0)">riscv_refresh_dynamic_csr_xml`.</span></div><div><=
span style=3D"color:rgb(0,0,0)"><br></span></div><div><span style=3D"color:=
rgb(0,0,0)">Best=C2=A0regards,</span></div><div><span style=3D"color:rgb(0,=
0,0)">Tommy</span></div><div><span style=3D"color:rgb(0,0,0)"><br></span></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Tue, May 23, 2023 at 10:38=E2=80=AFPM Weiwei Li &lt;<a href=3D"mailt=
o:liweiwei@iscas.ac.cn">liweiwei@iscas.ac.cn</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><br>
On 2023/5/23 19:44, Tommy Wu wrote:<br>
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
&gt;=C2=A0 =C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
&gt;=C2=A0 =C2=A0target/riscv/gdbstub.c | 12 ++++++++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 14 insertions(+)<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index de7e43126a..dc8e592275 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -494,6 +494,7 @@ struct ArchCPU {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CPUNegativeOffsetState neg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CPURISCVState env;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 int dyn_csr_base_reg;<br>
<br>
dyn_csr_base_reg=C2=A0 seems have no additional effect on the function.<br>
<br>
And It remains unmodified in following riscv_refresh_dynamic_csr_xml().<br>
<br>
Regards,<br>
<br>
Weiwei Li<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char *dyn_csr_xml;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char *dyn_vreg_xml;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -781,6 +782,7 @@ void riscv_get_csr_ops(int csrno, riscv_csr_operat=
ions *ops);<br>
&gt;=C2=A0 =C2=A0void riscv_set_csr_ops(int csrno, riscv_csr_operations *op=
s);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0void riscv_cpu_register_gdb_regs_for_features(CPUState *cs=
);<br>
&gt; +void riscv_refresh_dynamic_csr_xml(CPUState *cs);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0uint8_t satp_mode_max_from_map(uint32_t map);<br>
&gt;=C2=A0 =C2=A0const char *satp_mode_str(uint8_t satp_mode, bool is_32_bi=
t);<br>
&gt; diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c<br>
&gt; index 524bede865..9e97ee2c35 100644<br>
&gt; --- a/target/riscv/gdbstub.c<br>
&gt; +++ b/target/riscv/gdbstub.c<br>
&gt; @@ -230,6 +230,8 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs,=
 int base_reg)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitsize =3D 64;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;dyn_csr_base_reg =3D base_reg;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0g_string_printf(s, &quot;&lt;?xml version=3D=
\&quot;1.0\&quot;?&gt;&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0g_string_append_printf(s, &quot;&lt;!DOCTYPE=
 feature SYSTEM \&quot;gdb-target.dtd\&quot;&gt;&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0g_string_append_printf(s, &quot;&lt;feature =
name=3D\&quot;org.gnu.gdb.riscv.csr\&quot;&gt;&quot;);<br>
&gt; @@ -349,3 +351,13 @@ void riscv_cpu_register_gdb_regs_for_features(CPU=
State *cs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;riscv-csr.xml=
&quot;, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0}<br>
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
&gt; +}<br>
<br>
</blockquote></div>

--000000000000cdf15a05fc66da67--

