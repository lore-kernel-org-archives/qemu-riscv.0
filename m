Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAEDC77B7C
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 May 2023 05:46:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1hKL-0006vP-VS; Wed, 24 May 2023 01:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q1hKK-0006vB-O2
 for qemu-riscv@nongnu.org; Wed, 24 May 2023 01:46:24 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q1hKI-0007Ep-KJ
 for qemu-riscv@nongnu.org; Wed, 24 May 2023 01:46:24 -0400
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-4394b1820a8so175243137.3
 for <qemu-riscv@nongnu.org>; Tue, 23 May 2023 22:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1684907181; x=1687499181;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=radNAYtu0GfQOXnTI+3xZLbNMitWxMN4jxjMBM7YFoc=;
 b=PPFmWUPbKGiEkaD4vxgaf7zwhpAGRZEpZrH2CQh+RSTJRC7mH6fRRAIEfBJAhhSxU2
 8shkzv26EhSmGi5wJ06zVphiUb36ibyqPxo+hK7vLWXfOByUIJay6OWUXou/tr5+T7Uv
 OQ45offh/ajemdhLZrJBmFaCngcoOMMULk8eNpeiB/ZkXHDC0n9Py+KecvogJ10mZ7MZ
 sPoIQP9/fUmrGTwmqGE8q2rijw3CF0/im14Q6knwRfybID3I8iHEW+b2Jj5rn4Yu4RQz
 1/FWUTnAaPmjMOPcSDFZHXj+MuK2/0jRa063MJgNEf1O1cDvzh/n9+uTX73RdsZQ2yz6
 wUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684907181; x=1687499181;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=radNAYtu0GfQOXnTI+3xZLbNMitWxMN4jxjMBM7YFoc=;
 b=fx7HNebkCb9Ni5fORg1Au0Ij66SfB/klfn+6Jb+sMDMc1A8cElSOJFRRywkjOC/jDI
 P/gERrmPc5UvCtsLtoxmUeSOBkHYlJAwLeKhjykg8NgiUuzo0rcARpixxV7MKj5NFMZU
 vMjijMuPdw21j6cQIh8o2RklgxcKkc+YInsWqm+J+fUtjVaHTuqi614n2G794cFZPjxQ
 wUSsDbr4nr1oqn3fB/Eh0HKmGuOUkEYG7/bZhkdeMt2J2od4aFNnbSfgNgGmqpUhr2h+
 veOD4ZpmeUORvk44ZPrHHfgqyiDW/LpzfnMoOrqKNz3tuGXQiti5q3qfC67pB2uG6RX0
 j5Gw==
X-Gm-Message-State: AC+VfDydbWtk4yvjyLXaknsOQhBqsnDzMG68KXfefGDngLC1Uv60InmR
 M1Yq0kJO+SQyNQtn65yg7LUEdjnSoELiXKgufXWsFw==
X-Google-Smtp-Source: ACHHUZ7odurnss66PZ0ozBzkKF94fAwWsA/havVC9oogfQKjAtnad0l70iSO7eUd1McN2EdEgleF755Ylyi/Qp9tVEc=
X-Received: by 2002:a67:ff8a:0:b0:439:47c3:a08e with SMTP id
 v10-20020a67ff8a000000b0043947c3a08emr2945610vsq.13.1684907181528; Tue, 23
 May 2023 22:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230523114454.717708-1-tommy.wu@sifive.com>
 <20230523114454.717708-3-tommy.wu@sifive.com>
 <a1c36ae3-7875-0178-fcca-33abed1816f2@iscas.ac.cn>
 <CANj3q_nn5puBEdfzCgwUtT9bkhUUzopf-2qa0xC7LcRs_i_uhw@mail.gmail.com>
 <858ea86b-0bd7-5101-2948-6d3f5aa55aec@iscas.ac.cn>
In-Reply-To: <858ea86b-0bd7-5101-2948-6d3f5aa55aec@iscas.ac.cn>
From: Tommy Wu <tommy.wu@sifive.com>
Date: Wed, 24 May 2023 13:46:11 +0800
Message-ID: <CANj3q_m655m5O4K3+Wcmzh-KCydw1iRWU7WDqAQTTvVNBWUvVA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/intc: riscv_imsic: Refresh the CSRs xml after
 updating the state of the cpu.
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, frank.chang@sifive.com, 
 alistair.francis@wdc.com, apatel@ventanamicro.com, palmer@rivosinc.com, 
 dbarboza@ventanamicro.com, bin.meng@windriver.com, 
 zhiwei_liu@linux.alibaba.com
Content-Type: multipart/alternative; boundary="00000000000009007005fc6a0688"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=tommy.wu@sifive.com; helo=mail-vs1-xe32.google.com
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

--00000000000009007005fc6a0688
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Weiwei Li,
You're right, it seems that we need to add a check in riscv_imsic.c
Thanks for the advice!

Best Regards,
Tommy

On Wed, May 24, 2023 at 10:35=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> w=
rote:

>
> On 2023/5/24 09:51, Tommy Wu wrote:
> > Hi Weiwei Li,
> > Yes, you're right,  `riscv_refresh_dynamic_csr_xml()`  can only be
> > called when
> > cpu->dyn_csr_xml isn't a NULL pointer here.
> >
> > The cpu->dyn_csr_xml will be set when the cpu is realized.
>
> Yeah, It will  be set only when Zicsr is supported.  And I think aia
> requires Zicsr.
>
> However, another question:  whether we should add a check in
> riscv_imsic.c that it requires Zicsr?
>
> Regards,
>
> Weiwei Li
>
> >
> > Best Regards,
> > Tommy
> >
> >
> > On Tue, May 23, 2023 at 10:44=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.c=
n> wrote:
> >
> >
> >     On 2023/5/23 19:44, Tommy Wu wrote:
> >     > Originally, when we set the ext_smaia to true, we still cannot
> >     print the
> >     > AIA CSRs in the remote gdb debugger, because the dynamic CSR xml =
is
> >     > generated when the cpu is realized.
> >     >
> >     > This patch refreshes the dynamic CSR xml after we update the
> >     ext_smaia,
> >     > so that we can print the AIA CSRs in the remote gdb debugger.
> >     >
> >     > Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> >     > Reviewed-by: Frank Chang <frank.chang@sifive.com>
> >     > ---
> >     >   hw/intc/riscv_imsic.c | 4 ++++
> >     >   1 file changed, 4 insertions(+)
> >     >
> >     > diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
> >     > index fea3385b51..97a51d535b 100644
> >     > --- a/hw/intc/riscv_imsic.c
> >     > +++ b/hw/intc/riscv_imsic.c
> >     > @@ -350,6 +350,10 @@ static void riscv_imsic_realize(DeviceState
> >     *dev, Error **errp)
> >     >           } else {
> >     >               rcpu->cfg.ext_smaia =3D true;
> >     >           }
> >     > +
> >     > +        /* Refresh the dynamic csr xml for the gdbstub. */
> >     > +        riscv_refresh_dynamic_csr_xml(cpu);
> >     > +
> >
> >     There is an assert in riscv_refresh_dynamic_csr_xml():
> >
> >     +    if (!cpu->dyn_csr_xml) {
> >     +        g_assert_not_reached();
> >     +    }
> >
> >     So I think riscv_refresh_dynamic_csr_xml() can only be called when
> >     cpu->dyn_csr_xml is true here.
> >
> >     Regards,
> >
> >     Weiwei Li
> >
> >     >           riscv_cpu_set_aia_ireg_rmw_fn(env, (imsic->mmode) ?
> >     PRV_M : PRV_S,
> >     >                                         riscv_imsic_rmw, imsic);
> >     >       }
> >
>
>

--00000000000009007005fc6a0688
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Weiwei Li,<br>You&#39;re right, it seems that we need t=
o add a check in riscv_imsic.c=C2=A0<div>Thanks for the advice!</div><div><=
br></div><div>Best Regards,</div><div>Tommy</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 24, 2023 at 10=
:35=E2=80=AFAM Weiwei Li &lt;<a href=3D"mailto:liweiwei@iscas.ac.cn">liweiw=
ei@iscas.ac.cn</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><br>
On 2023/5/24 09:51, Tommy Wu wrote:<br>
&gt; Hi Weiwei Li,<br>
&gt; Yes, you&#39;re right,=C2=A0 `riscv_refresh_dynamic_csr_xml()`=C2=A0 c=
an only be <br>
&gt; called when<br>
&gt; cpu-&gt;dyn_csr_xml isn&#39;t a NULL pointer here.<br>
&gt;<br>
&gt; The cpu-&gt;dyn_csr_xml will be set when the cpu is realized.<br>
<br>
Yeah, It will=C2=A0 be set only when Zicsr is supported.=C2=A0 And I think =
aia <br>
requires Zicsr.<br>
<br>
However, another question:=C2=A0 whether we should add a check in <br>
riscv_imsic.c that it requires Zicsr?<br>
<br>
Regards,<br>
<br>
Weiwei Li<br>
<br>
&gt;<br>
&gt; Best=C2=A0Regards,<br>
&gt; Tommy<br>
&gt;<br>
&gt;<br>
&gt; On Tue, May 23, 2023 at 10:44=E2=80=AFPM Weiwei Li &lt;<a href=3D"mail=
to:liweiwei@iscas.ac.cn" target=3D"_blank">liweiwei@iscas.ac.cn</a>&gt; wro=
te:<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2023/5/23 19:44, Tommy Wu wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Originally, when we set the ext_smaia to true,=
 we still cannot<br>
&gt;=C2=A0 =C2=A0 =C2=A0print the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; AIA CSRs in the remote gdb debugger, because t=
he dynamic CSR xml is<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; generated when the cpu is realized.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This patch refreshes the dynamic CSR xml after=
 we update the<br>
&gt;=C2=A0 =C2=A0 =C2=A0ext_smaia,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; so that we can print the AIA CSRs in the remot=
e gdb debugger.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Tommy Wu &lt;<a href=3D"mailto:=
tommy.wu@sifive.com" target=3D"_blank">tommy.wu@sifive.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Reviewed-by: Frank Chang &lt;<a href=3D"mailto=
:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0hw/intc/riscv_imsic.c | 4 ++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/hw/intc/riscv_imsic.c b/hw/intc/r=
iscv_imsic.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index fea3385b51..97a51d535b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/hw/intc/riscv_imsic.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/hw/intc/riscv_imsic.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -350,6 +350,10 @@ static void riscv_imsic_r=
ealize(DeviceState<br>
&gt;=C2=A0 =C2=A0 =C2=A0*dev, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else=
 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0rcpu-&gt;cfg.ext_smaia =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Refresh the dy=
namic csr xml for the gdbstub. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_refresh_dyn=
amic_csr_xml(cpu);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0There is an assert in riscv_refresh_dynamic_csr_xml=
():<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 if (!cpu-&gt;dyn_csr_xml) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached()=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0So I think riscv_refresh_dynamic_csr_xml() can only=
 be called when<br>
&gt;=C2=A0 =C2=A0 =C2=A0cpu-&gt;dyn_csr_xml is true here.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Weiwei Li<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_=
cpu_set_aia_ireg_rmw_fn(env, (imsic-&gt;mmode) ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0PRV_M : PRV_S,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_imsic_rmw, imsic);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
<br>
</blockquote></div>

--00000000000009007005fc6a0688--

