Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FD4C5AD4E
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 06:00:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtJ3C-0007V2-Bw; Mon, 10 Aug 2026 01:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wtJ37-0007TP-So
 for qemu-riscv@nongnu.org; Mon, 10 Aug 2026 01:59:51 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wtJ35-0008BL-VD
 for qemu-riscv@nongnu.org; Mon, 10 Aug 2026 01:59:49 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6a0794669a6so2045254a12.2
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 22:59:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786341586; cv=none;
 d=google.com; s=arc-20260327;
 b=GJm6zaDxoUXYwSvZKBQrRB9+0E9RtAik0YKB+twp0DxHXq4C8P0s5vChSmfSNsjQvc
 7pTQPFEKk2clAHDv08bzRWAWvZrSfbMWkHKvJSQ0ITy7hg3gRmhU623dEQDyWt0XVNbz
 CJjk5/M7xq4XlUfXXBVSVWYW5MC3zUkf5TEFAtZRT7ZR7kuPuTN4mAsoaOqsayZrk7+B
 OVIG7aonJI4k0zpR0QL7UBKZW4hLbhhPzb5YACaAma46668jcOK9Nrk3fi40br1Gpjvz
 whCM0IiTtWF6JjT1X/EiXDnxtcok1Jq6MY4IAvE2r1O5Lj2S4hDHMUvLdcVEe07wzkzX
 7mng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=qNKYrIqi4VQVj1jd9Wxmt3C/DiIje5TlJdX3XScfTyg=;
 fh=QkaxFSXMp6z8dmOuEXQfKn/Rp+q+CBpU1Vs4sl77//8=;
 b=VXml20ZBqmx/IqyS5xOLOTlNUHpG2fSZptzuguG770Jsd7aGlNblR0kG0hqRjfrx2C
 KfdKN+vlsvLayuhOPURNPimC3IrQo+XY8yaurTg0QqKTdjf0Mh8PBQdcRew6IizeAynS
 0kVGHcCr7YzDw808sOGsunWF4V6DTmfIK28kCmIfqZG2S0wwXQfQSEBJff0zqI/urvwR
 Zp4KrLVEoFFlwyznrJKJPJcF4l1zo9p3LYx0I1SRLcr9n69QbHaR5WPvO+gUtaUy4PPo
 GskPIOxN2a6vOeZ5KL2Ss2gZKCnfvpYeaX3qszaeoLzwB+xtArLdMmFfwG3Yq8laPspU
 yUNw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1786341586; x=1786946386; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=qNKYrIqi4VQVj1jd9Wxmt3C/DiIje5TlJdX3XScfTyg=;
 b=dGTD4gKFGYgNHYPVwM/U+9EkZutFid+lVMyoDocnkqBJbP+ATaYoFgEjobZpAVUeKK
 /c2TTKU+vyLe3vKUPVHTlDKlB/r3ylHiZn0sUGifpBJsuazyQ24XfoMU3os1aQlzckw7
 eW9ry/J/Sjlg7FGVClGCFhDmvmh45pLVab9O5PnIBOdAXGXEiUkDePjKr9XlefIZUoeA
 DopWkHR+u6OdICpv51OVBJJByxwQ1gwaElGK9+3mcxPha1UewAZQ1ktEecZi/09TYcXP
 Uz5eA0RM8KYThIgg2C2gDCxX22/BPKl0IJU9aArCH+JUvIi4jiTpKl/N0MbMAh8R/Kgh
 rdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786341586; x=1786946386;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=qNKYrIqi4VQVj1jd9Wxmt3C/DiIje5TlJdX3XScfTyg=;
 b=mZqhfpxAm56oBgZ2Ihqz3lJ1xDlh3Q3pWS6JREZuzmff228dzb2UKMFy7WNcWwjM0L
 YOV5Obbk9wJ+kx1RizLfGAbJASId2kDhBM+lQWHLuZ0f0bGP2C63hTpg+8m3xcgP4bH1
 +3FnbWpEG+oFpac7rLJ7kJ9h6QWpLy5u01ODio6De+/1N0jBubuTx1SiBlpfJXh1x2Yz
 iKZShS785L8d94PLlcaGT2Uj8wIMDXo3E8LdwqTRJ9yos6eqznDP2w3ZBQnPKCTdz6dE
 2q+8+YZ9W2+Jul8BZsSkg4y1f/IV1hP64YV4WtDTWa4y4/akRbXoAgdk4VEZjLwXxgsQ
 Cgnw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrrwR4+RP4UF5+svCSLtaO0Fu3K6Mn6YHS+2MuoI32YkWLaKxlpez5UPgv9VRMI8FP1J/QiJBmDtxPE@nongnu.org
X-Gm-Message-State: AOJu0YxTfexdBZ/ONyCuD7HahmC9Entpk6PGSSzXYM+uu0rBHLcA5Z2G
 ryl3J+K3gxnK9ihH8DGlMSP700vO+5HAR7TMd2Dd7lTq2nhxqnGV7st61QzWmAqkJd9jvV0Zl5m
 3NhVTORgqdI+MxIbBHz2oshiCeXmkAgdwqRZ03b8qqQ==
X-Gm-Gg: AR+sD132kd9diaxftC2PiFTcEv8EHjd30USjxpcDG+85E7cqFP8wAgsVijLxmeMhVbV
 VIvaODmc/QWJ+KzLrGj4A4s5yZNk/J3FH4Dtls5Z5KYYaRTPZKtJ6xnh6XYbncos7UsKMseENV8
 Hj09hfWvJNShysM3ftkW8kIinEKz7PZ1OwwozK97ezYa9/0puEkt5up0H2Mjv64RkBfyuvMuiz6
 PzPi6VyU6S5D5g5YSxQoPKXZWqPyV9Nkq6Vur5/ZB/LYDzV0C4RNe0qi2sNSqn7VeK1+kUq2aq7
 +V2RRTE0Sli9OXxvtpY9IWmqii+i0DDCiOJicZXgkK1sSP3kOqm9G3+ytw==
X-Received: by 2002:a17:907:3cc4:b0:c12:3059:4071 with SMTP id
 a640c23a62f3a-c2087572c2bmr934037766b.15.1786341580766; Sun, 09 Aug 2026
 22:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260805164345.698208-1-frank.chang@sifive.com>
 <20260805164345.698208-2-frank.chang@sifive.com>
 <a26fb578-54bd-40c4-ab4f-59ee61f3c843@oss.qualcomm.com>
In-Reply-To: <a26fb578-54bd-40c4-ab4f-59ee61f3c843@oss.qualcomm.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 10 Aug 2026 13:59:29 +0800
X-Gm-Features: AUfX_mxpY9unEVo-3UXk2lCX_rrnbjJNp7EJGgcqWeSlknGIQ-W_Udl8ngwoCPY
Message-ID: <CAE_xrPhGq0v_-b8PGj2rdfv7qZ_pkBmz-XTFHzOQou8UB-f8OQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/8] target/riscv: Add Zicclsm CPU option
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, 
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>,
 Max Chou <max.chou@sifive.com>
Content-Type: multipart/alternative; boundary="0000000000005e8e4c0658ab0ff4"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=frank.chang@sifive.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--0000000000005e8e4c0658ab0ff4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Fri, Aug 7, 2026 at 9:49=E2=80=AFPM Daniel Henrique Barboza <
daniel.barboza@oss.qualcomm.com> wrote:

> Hi Frank!
>
> On 8/5/2026 1:43 PM, frank.chang@sifive.com wrote:
> > From: Frank Chang <frank.chang@sifive.com>
> >
> > Add Zicclsm CPU option so that user can turn on/off misaligned loads
> > and stores support.
> >
> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
> > Reviewed-by: Max Chou <max.chou@sifive.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >   target/riscv/cpu_cfg_fields.h.inc | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/target/riscv/cpu_cfg_fields.h.inc
> b/target/riscv/cpu_cfg_fields.h.inc
> > index 9eb47af0a76..f8c27a574f8 100644
> > --- a/target/riscv/cpu_cfg_fields.h.inc
> > +++ b/target/riscv/cpu_cfg_fields.h.inc
> > @@ -139,6 +139,8 @@ BOOL_FIELD(has_priv_1_11)
> >   /* Always enabled for TCG if has_priv_1_11 */
> >   BOOL_FIELD(ext_ziccrse)
> >
> > +BOOL_FIELD(ext_zicclsm)
> > +
>
> This is a needed step but, as is, it's not adding a new CPU option for
> users as
> the commit msg says.  This is being done in patch 7.
>
> I think this change should be squashed into patch 2, where ext_zicclsm is
> being
> added in eligible CPUs.
>

Thanks for the review.

I've squashed patch 1 into patch 2 and sent out the v8 patchset:
https://lore.kernel.org/qemu-riscv/20260810055618.1175500-1-frank.chang@sif=
ive.com/

Regards,
Frank Chang


>
>
> Thanks,
> Daniel
>
> >   /* Vendor-specific custom extensions */
> >   BOOL_FIELD(ext_xtheadba)
> >   BOOL_FIELD(ext_xtheadbb)
>
>

--0000000000005e8e4c0658ab0ff4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Daniel,</div><br><div class=3D"gmail_q=
uote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, A=
ug 7, 2026 at 9:49=E2=80=AFPM Daniel Henrique Barboza &lt;<a href=3D"mailto=
:daniel.barboza@oss.qualcomm.com">daniel.barboza@oss.qualcomm.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Frank!<=
br>
<br>
On 8/5/2026 1:43 PM, <a href=3D"mailto:frank.chang@sifive.com" target=3D"_b=
lank">frank.chang@sifive.com</a> wrote:<br>
&gt; From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" target=
=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; <br>
&gt; Add Zicclsm CPU option so that user can turn on/off misaligned loads<b=
r>
&gt; and stores support.<br>
&gt; <br>
&gt; Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.co=
m" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; Reviewed-by: Max Chou &lt;<a href=3D"mailto:max.chou@sifive.com" targe=
t=3D"_blank">max.chou@sifive.com</a>&gt;<br>
&gt; Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@w=
dc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu_cfg_fields.h.inc | 2 ++<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_=
fields.h.inc<br>
&gt; index 9eb47af0a76..f8c27a574f8 100644<br>
&gt; --- a/target/riscv/cpu_cfg_fields.h.inc<br>
&gt; +++ b/target/riscv/cpu_cfg_fields.h.inc<br>
&gt; @@ -139,6 +139,8 @@ BOOL_FIELD(has_priv_1_11)<br>
&gt;=C2=A0 =C2=A0/* Always enabled for TCG if has_priv_1_11 */<br>
&gt;=C2=A0 =C2=A0BOOL_FIELD(ext_ziccrse)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +BOOL_FIELD(ext_zicclsm)<br>
&gt; +<br>
<br>
This is a needed step but, as is, it&#39;s not adding a new CPU option for =
users as<br>
the commit msg says.=C2=A0 This is being done in patch 7.<br>
<br>
I think this change should be squashed into patch 2, where ext_zicclsm is b=
eing<br>
added in eligible CPUs.<br></blockquote><div><br></div><div>Thanks for the =
review.</div><div><br></div><div>I&#39;ve squashed patch 1 into patch 2 and=
 sent out the v8 patchset:</div><div><a href=3D"https://lore.kernel.org/qem=
u-riscv/20260810055618.1175500-1-frank.chang@sifive.com/">https://lore.kern=
el.org/qemu-riscv/20260810055618.1175500-1-frank.chang@sifive.com/</a></div=
><div><br></div><div>Regards,</div><div>Frank Chang</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
Thanks,<br>
Daniel<br>
<br>
&gt;=C2=A0 =C2=A0/* Vendor-specific custom extensions */<br>
&gt;=C2=A0 =C2=A0BOOL_FIELD(ext_xtheadba)<br>
&gt;=C2=A0 =C2=A0BOOL_FIELD(ext_xtheadbb)<br>
<br>
</blockquote></div></div>

--0000000000005e8e4c0658ab0ff4--

