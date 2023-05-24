Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8B3C77B7A
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 May 2023 05:36:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1hAD-0004kq-Ql; Wed, 24 May 2023 01:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q1h9w-0004ja-7L
 for qemu-riscv@nongnu.org; Wed, 24 May 2023 01:35:40 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q1h9u-0005Vh-6V
 for qemu-riscv@nongnu.org; Wed, 24 May 2023 01:35:39 -0400
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-439494cbfedso168849137.3
 for <qemu-riscv@nongnu.org>; Tue, 23 May 2023 22:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1684906536; x=1687498536;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HcmmS6W1Dr1XG/1SXPF0Jm9xXiHLTJHeCt9Suq6wYZU=;
 b=OtCN0qOnTJ3TJQFu57ucLnPLVHoWNq4c4kEefLdjBpXRyiiQ+m7pYRKi40VmJYlRpt
 XU/5Q2Juh5ksUJj/SqDfKO1StBx8SqIvwqJOUyjLf9SxQzCKUTDPV6TpFuZHZPaxQ/xt
 R3kjtdCUMAmJ+zXYgx/swf260hdpD/GlYcgeUgztEohxm2oZLZikE1skXhs/Q2m02gUX
 QWx5KxfTQEi72+ho9IJ82Pzsy1CsQW9Pb12GhpsOwEZf1mbQtXb6lK7g6HYZic0T+mgY
 sLvUi8TZl04el82itRHj6Eq3D+aGLvht27DHJwllnRkbZvGjfGqozksfZWqQoLPuvqYd
 twmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684906536; x=1687498536;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HcmmS6W1Dr1XG/1SXPF0Jm9xXiHLTJHeCt9Suq6wYZU=;
 b=VPJ3q7NPiEaFWEPtUeKLY8a0ye1KDXORABMQdhZ92Pe+CcnMvUarXrxxbMujKUf00r
 C9fb5juisKvoYnbD2OxTcICAKHfWMhAiSHxQsae1b9jZjJsttzu03yU+aKj/bYYFERPx
 y7wTYvYD0BWk2s3nSF2J8FoeVUsz54zPtmkbPpPahxpYGOKWncpQILX5mTnOKO4bxDC4
 JCcQs+J8XuOvM73doks7EXcnv+PYG7fnDeseSITDqHyy8WwSAM+AV/zvL9nAm4OZ7+tz
 Rsn44tZI16wL4qEHKLAoztRWBTi0eMIQmroT050nCLZPbviLgo2/7RiVjhhKnzRWfZ6k
 67iw==
X-Gm-Message-State: AC+VfDx5Zb/da2LiIGyxnKU+CYJGzco/LRe1/ybA8K4LPwE50eOnOJYi
 x7wLQ7IyfE0t6wdVrMymSb8cszMb4aINDwQ4JmFrhQ==
X-Google-Smtp-Source: ACHHUZ4RcZBa9l9/0yjZVcY2XARhUp1iJKozEz3rj9RShhzcBREEajc2XckGBMdGeAkZawrucSkwY3b+rfiUDsr5NMU=
X-Received: by 2002:a05:6102:3177:b0:42c:9864:3adf with SMTP id
 l23-20020a056102317700b0042c98643adfmr4081048vsm.31.1684906536373; Tue, 23
 May 2023 22:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230523114454.717708-1-tommy.wu@sifive.com>
 <20230523114454.717708-2-tommy.wu@sifive.com>
 <5d3558a0-8b7f-8b84-a4e0-a6f4404a56b6@iscas.ac.cn>
 <CANj3q_=E_TfaHLn4rHQp4jy5U0LXoXCFDjYVwh7c85h_oB_F7Q@mail.gmail.com>
 <cae11418-a33c-f35f-1604-a9b241f452a5@iscas.ac.cn>
In-Reply-To: <cae11418-a33c-f35f-1604-a9b241f452a5@iscas.ac.cn>
From: Tommy Wu <tommy.wu@sifive.com>
Date: Wed, 24 May 2023 13:35:26 +0800
Message-ID: <CANj3q_==LB7v7-OGtjWbNO5NUzTz--capnGZnnbiV+kru_Ayhg@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Add a function to refresh the dynamic
 CSRs xml.
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, frank.chang@sifive.com, 
 alistair.francis@wdc.com, apatel@ventanamicro.com, palmer@rivosinc.com, 
 dbarboza@ventanamicro.com, bin.meng@windriver.com, 
 zhiwei_liu@linux.alibaba.com
Content-Type: multipart/alternative; boundary="00000000000094af6605fc69df33"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=tommy.wu@sifive.com; helo=mail-vs1-xe30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_KAM_HTML_FONT_INVALID=0.01,
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

--00000000000094af6605fc69df33
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi WeiWei Li,


When the CPU is realizing, it will call `riscv_gen_dynamic_csr_xml` for the
first time with the correct `base_reg` value.

code flow :

riscv_cpu_realize

=E2=86=92 riscv_cpu_register_gdb_regs_for_features

     =E2=86=92 riscv_gen_dynamic_csr_xml

The functionality of `cpu->dyn_csr_base_reg` is to record the `base_reg`
from

`riscv_cpu_register_gdb_regs_for_features`.

When we try to refresh the dynamic CSRs xml, we will call the function
`riscv_gen_dynamic_csr_xml`

for the second time, and then we can give the correct `base_reg` value to
the function

`riscv_gen_dynamic_csr_xml`, because we've record this value in the `
cpu->dyn_csr_base_reg`.

Best Regards,

Tommy


On Wed, May 24, 2023 at 10:10=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> w=
rote:

>
> On 2023/5/24 09:59, Tommy Wu wrote:
> > Hi Weiwei Li,
> >
> > `dyn_csr_base_reg` will be used in `riscv_refresh_dynamic_csr_xml`
> > We can initialize this variable when the cpu is realized.
> I didn't find this initialization in following code.
> > And used this variable in `riscv_refresh_dynamic_csr_xml`.
>
> That's my question. In riscv_refresh_dynamic_csr_xml() ,
> cpu->dyn_csr_base_reg is passed to riscv_gen_dynamic_csr_xml() as base_re=
g.
>
> And then base_reg is assigned to cpu->dyn_csr_base_reg again in it. So
> it's unchanged in this progress.
>
> Another question is  dyn_csr_base_reg seems have no additional function
> currently.
>
> Regards,
>
> Weiwei Li
>
> >
> > Best regards,
> > Tommy
> >
> >
> > On Tue, May 23, 2023 at 10:38=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.c=
n> wrote:
> >
> >
> >     On 2023/5/23 19:44, Tommy Wu wrote:
> >     > When we change the cpu extension state after the cpu is
> >     > realized, we cannot print the value of some CSRs in the remote
> >     > gdb debugger. The root cause is that the dynamic CSR xml is
> >     > generated when the cpu is realized.
> >     >
> >     > This patch add a function to refresh the dynamic CSR xml after
> >     > the cpu is realized.
> >     >
> >     > Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> >     > Reviewed-by: Frank Chang <frank.chang@sifive.com>
> >     > ---
> >     >   target/riscv/cpu.h     |  2 ++
> >     >   target/riscv/gdbstub.c | 12 ++++++++++++
> >     >   2 files changed, 14 insertions(+)
> >     >
> >     > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >     > index de7e43126a..dc8e592275 100644
> >     > --- a/target/riscv/cpu.h
> >     > +++ b/target/riscv/cpu.h
> >     > @@ -494,6 +494,7 @@ struct ArchCPU {
> >     >       CPUNegativeOffsetState neg;
> >     >       CPURISCVState env;
> >     >
> >     > +    int dyn_csr_base_reg;
> >
> >     dyn_csr_base_reg  seems have no additional effect on the function.
> >
> >     And It remains unmodified in following
> >     riscv_refresh_dynamic_csr_xml().
> >
> >     Regards,
> >
> >     Weiwei Li
> >
> >     >       char *dyn_csr_xml;
> >     >       char *dyn_vreg_xml;
> >     >
> >     > @@ -781,6 +782,7 @@ void riscv_get_csr_ops(int csrno,
> >     riscv_csr_operations *ops);
> >     >   void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
> >     >
> >     >   void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
> >     > +void riscv_refresh_dynamic_csr_xml(CPUState *cs);
> >     >
> >     >   uint8_t satp_mode_max_from_map(uint32_t map);
> >     >   const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
> >     > diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> >     > index 524bede865..9e97ee2c35 100644
> >     > --- a/target/riscv/gdbstub.c
> >     > +++ b/target/riscv/gdbstub.c
> >     > @@ -230,6 +230,8 @@ static int
> >     riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
> >     >           bitsize =3D 64;
> >     >       }
> >     >
> >     > +    cpu->dyn_csr_base_reg =3D base_reg;
> >     > +
> >     >       g_string_printf(s, "<?xml version=3D\"1.0\"?>");
> >     >       g_string_append_printf(s, "<!DOCTYPE feature SYSTEM
> >     \"gdb-target.dtd\">");
> >     >       g_string_append_printf(s, "<feature
> >     name=3D\"org.gnu.gdb.riscv.csr\">");
> >     > @@ -349,3 +351,13 @@ void
> >     riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
> >     >                                    "riscv-csr.xml", 0);
> >     >       }
> >     >   }
> >     > +
> >     > +void riscv_refresh_dynamic_csr_xml(CPUState *cs)
> >     > +{
> >     > +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> >     > +    if (!cpu->dyn_csr_xml) {
> >     > +        g_assert_not_reached();
> >     > +    }
> >     > +    g_free(cpu->dyn_csr_xml);
> >     > +    riscv_gen_dynamic_csr_xml(cs, cpu->dyn_csr_base_reg);
> >     > +}
> >
>
>

--00000000000094af6605fc69df33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-314a45fe-7fff-75e1-2b=
57-58eb012ba379"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline;=
white-space:pre-wrap">Hi WeiWei Li,</span></p><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt=
;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:no=
rmal;vertical-align:baseline;white-space:pre-wrap"><br></span></p><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span sty=
le=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-v=
ariant-alternates:normal;vertical-align:baseline;white-space:pre-wrap">When=
 the CPU is realizing, it will call `riscv_gen_dynamic_csr_xml` for the fir=
st time with the correct `base_reg` value.</span></p><br><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fon=
t-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-al=
ternates:normal;vertical-align:baseline;white-space:pre-wrap">code flow :=
=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline;=
white-space:pre-wrap">riscv_cpu_realize</span></p><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:=
11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-variant-alternate=
s:normal;vertical-align:baseline;white-space:pre-wrap">=E2=86=92 riscv_cpu_=
register_gdb_regs_for_features</span></p><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font=
-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;=
vertical-align:baseline;white-space:pre-wrap">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=E2=86=92 riscv_gen_dynamic_csr_xml</span></p><br><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alte=
rnates:normal;vertical-align:baseline;white-space:pre-wrap">The functionali=
ty of `</span><span style=3D"font-size:11pt;font-family:Arial;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;vertical-align:baseline;white-space:pre-wrap">cpu-&gt;dyn_csr_base_reg</s=
pan><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-variant-alternates:normal;vertical-align:baseline;white-space:p=
re-wrap">` is to record the `base_reg` from</span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alte=
rnates:normal;vertical-align:baseline;white-space:pre-wrap">`riscv_cpu_regi=
ster_gdb_regs_for_features`.</span></p><br><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fo=
nt-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;vertical-align:baseline;white-space:pre-wrap">When we try to refresh the =
dynamic CSRs xml, we will call the function `riscv_gen_dynamic_csr_xml`</sp=
an></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-variant-alternates:normal;vertical-align:baseline;white-spac=
e:pre-wrap">for the second time, and then we can give the correct `base_reg=
` value to the function</span></p><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;vertica=
l-align:baseline;white-space:pre-wrap">`riscv_gen_dynamic_csr_xml`, because=
 we&#39;ve record this value in the </span><span style=3D"background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;font=
-variant-alternates:normal;font-size:11pt;font-family:Arial;color:rgb(0,0,0=
);vertical-align:baseline;white-space:pre-wrap">`</span><span style=3D"font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;font-size:11pt;font-family:Arial;vertical-align:baseline;white-s=
pace:pre-wrap">cpu-&gt;dyn_csr_base_reg</span><span style=3D"background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;font-size:11pt;font-family:Arial;color:rgb(0,=
0,0);vertical-align:baseline;white-space:pre-wrap">`.</span></p><br><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline;white-space:pre-wrap">B=
est Regards,</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;colo=
r:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;vertical-align:bas=
eline;white-space:pre-wrap">Tommy</span></p></span><br class=3D"gmail-Apple=
-interchange-newline"></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Wed, May 24, 2023 at 10:10=E2=80=AFAM Weiwei Li &l=
t;<a href=3D"mailto:liweiwei@iscas.ac.cn">liweiwei@iscas.ac.cn</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 2023/5/24 09:59, Tommy Wu wrote:<br>
&gt; Hi=C2=A0Weiwei Li,<br>
&gt;<br>
&gt; `dyn_csr_base_reg` will be used in `riscv_refresh_dynamic_csr_xml`<br>
&gt; We can initialize this variable when the cpu is realized.<br>
I didn&#39;t find this initialization in following code.<br>
&gt; And used this variable in `riscv_refresh_dynamic_csr_xml`.<br>
<br>
That&#39;s my question. In riscv_refresh_dynamic_csr_xml() , <br>
cpu-&gt;dyn_csr_base_reg is passed to riscv_gen_dynamic_csr_xml() as base_r=
eg.<br>
<br>
And then base_reg is assigned to cpu-&gt;dyn_csr_base_reg again in it. So <=
br>
it&#39;s unchanged in this progress.<br>
<br>
Another question is=C2=A0 dyn_csr_base_reg seems have no additional functio=
n <br>
currently.<br>
<br>
Regards,<br>
<br>
Weiwei Li<br>
<br>
&gt;<br>
&gt; Best=C2=A0regards,<br>
&gt; Tommy<br>
&gt;<br>
&gt;<br>
&gt; On Tue, May 23, 2023 at 10:38=E2=80=AFPM Weiwei Li &lt;<a href=3D"mail=
to:liweiwei@iscas.ac.cn" target=3D"_blank">liweiwei@iscas.ac.cn</a>&gt; wro=
te:<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2023/5/23 19:44, Tommy Wu wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; When we change the cpu extension state after t=
he cpu is<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; realized, we cannot print the value of some CS=
Rs in the remote<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; gdb debugger. The root cause is that the dynam=
ic CSR xml is<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; generated when the cpu is realized.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This patch add a function to refresh the dynam=
ic CSR xml after<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; the cpu is realized.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Tommy Wu &lt;<a href=3D"mailto:=
tommy.wu@sifive.com" target=3D"_blank">tommy.wu@sifive.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Reviewed-by: Frank Chang &lt;<a href=3D"mailto=
:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0target/riscv/gdbstub.c | 12 ++++++=
++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A02 files changed, 14 insertions(+)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/target/riscv/cpu.h b/target/riscv=
/cpu.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index de7e43126a..dc8e592275 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/target/riscv/cpu.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/target/riscv/cpu.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -494,6 +494,7 @@ struct ArchCPU {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CPUNegativeOffsetSta=
te neg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CPURISCVState env;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 int dyn_csr_base_reg;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0dyn_csr_base_reg=C2=A0 seems have no additional eff=
ect on the function.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0And It remains unmodified in following<br>
&gt;=C2=A0 =C2=A0 =C2=A0riscv_refresh_dynamic_csr_xml().<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Weiwei Li<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char *dyn_csr_xml;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char *dyn_vreg_xml;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -781,6 +782,7 @@ void riscv_get_csr_ops(int=
 csrno,<br>
&gt;=C2=A0 =C2=A0 =C2=A0riscv_csr_operations *ops);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0void riscv_set_csr_ops(int csrno, =
riscv_csr_operations *ops);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0void riscv_cpu_register_gdb_regs_f=
or_features(CPUState *cs);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +void riscv_refresh_dynamic_csr_xml(CPUState *=
cs);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0uint8_t satp_mode_max_from_map(uin=
t32_t map);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0const char *satp_mode_str(uint8_t =
satp_mode, bool is_32_bit);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/target/riscv/gdbstub.c b/target/r=
iscv/gdbstub.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 524bede865..9e97ee2c35 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/target/riscv/gdbstub.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/target/riscv/gdbstub.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -230,6 +230,8 @@ static int<br>
&gt;=C2=A0 =C2=A0 =C2=A0riscv_gen_dynamic_csr_xml(CPUState *cs, int base_re=
g)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitsiz=
e =3D 64;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 cpu-&gt;dyn_csr_base_reg =3D ba=
se_reg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0g_string_printf(s, &=
quot;&lt;?xml version=3D\&quot;1.0\&quot;?&gt;&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0g_string_append_prin=
tf(s, &quot;&lt;!DOCTYPE feature SYSTEM<br>
&gt;=C2=A0 =C2=A0 =C2=A0\&quot;gdb-target.dtd\&quot;&gt;&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0g_string_append_prin=
tf(s, &quot;&lt;feature<br>
&gt;=C2=A0 =C2=A0 =C2=A0name=3D\&quot;org.gnu.gdb.riscv.csr\&quot;&gt;&quot=
;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -349,3 +351,13 @@ void<br>
&gt;=C2=A0 =C2=A0 =C2=A0riscv_cpu_register_gdb_regs_for_features(CPUState *=
cs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;riscv-csr.xml&quot;, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +void riscv_refresh_dynamic_csr_xml(CPUState *=
cs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 if (!cpu-&gt;dyn_csr_xml) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reac=
hed();<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 g_free(cpu-&gt;dyn_csr_xml);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 riscv_gen_dynamic_csr_xml(cs, c=
pu-&gt;dyn_csr_base_reg);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +}<br>
&gt;<br>
<br>
</blockquote></div>

--00000000000094af6605fc69df33--

