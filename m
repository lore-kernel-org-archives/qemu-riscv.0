Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE90EC25B74
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 03:40:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sEL1q-0002b0-Rb; Mon, 03 Jun 2024 23:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sEL1m-0002aS-Mi
 for qemu-riscv@nongnu.org; Mon, 03 Jun 2024 23:40:03 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sEL1k-0001Sp-2t
 for qemu-riscv@nongnu.org; Mon, 03 Jun 2024 23:40:01 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-4eb076bec24so239560e0c.1
 for <qemu-riscv@nongnu.org>; Mon, 03 Jun 2024 20:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717472398; x=1718077198; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ywD0AEzwMTWaV4kEEFN+fbfT/4B6k+gnMzX1Qh9U9pQ=;
 b=k4NsSwiOX0r0ZZNNxdHZ9+KJuYq3OFDVpWU4K2GKpVyzmrIcTKPSJsHfBcQsX8IqHN
 v/u0GXQ7w7g1KE4ohYfdp86yVWqLGPIHXmYoxIHQHzromCYeAtbznYJMm2rDKf1Az4mX
 5WjykRLN1Hnb83XyloPTdlDu3W+TsFxkQPJe4/Fg2kkTjVFqkgr9yuomz03bkKxGW524
 iN1//eG+jPRUHpBvN3aEfB4lPFTbjTb59IddZ8X/1SerDz1ArjoTxIm01QUzhfLpYbck
 SAk/VGeoCm87DfOtb/ZtLn3lHEFqCTDrLk5LtYC0jyktLQk8jn3OA5/1Nlb/j6psRlOQ
 AXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717472398; x=1718077198;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ywD0AEzwMTWaV4kEEFN+fbfT/4B6k+gnMzX1Qh9U9pQ=;
 b=dsm1B2bdgv0xsi1vUVnVUUxv/gJ6sbmbZvEp1GGS+r2fRyqzqwcncExvN/VdoF+J7q
 RWmJg6KG9a5wBKEa80yp26KE586lPIeCrQ0QqaOIvzBUnLPBZP3PVW9L7TiOD4Gd4u4q
 3NTu5CUuhoQATkdHOh+qezIH4QpR7gsdkgCH1yar4Aqd8d5huItdF9sGD9uEHAv6bwaY
 TkLJujfdXAInsAR/jXf9oYr1SAnvi6Jz8LDFRn/z7FfH61j2g42q0SgAk4CYrpKBFT0Y
 1O1kzT/WxHlkl5V8G3/pWjZ15NMa2IHRy+Fa7YgzJbFQIeLINIdS06bptSvIBDS3F7eF
 q8Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrwACuKrEqyXpwbjkLRAkSp3j60CUnGr8rPmrNNfnvcCqaCJZJMvtqa3f2P93B3c8oDRBb/IqCQC3hmXB3qLjlA40x9Sw=
X-Gm-Message-State: AOJu0Yx+Mz04i+CSoaPIyaxDKGOMePiFlKkqggLQGbOaYGlqrATdCMim
 /JDig6yJiya1lz2Et8sDDO4zvkCxoHzKRxeH7wYJMIZhnx+FfUrzmtjutB/eGIOBTBqKelTL64z
 E3BeFD5B1yv2dOvo7fYhi6kMgr+L5geActHlLmA==
X-Google-Smtp-Source: AGHT+IEmqA7xEEhWJ5Dgj2MY57LAqXVaoqAts3V0y666wbaoERgOHHWEoIjNo64T/0XSrLQHX6EJ2oPz3fd9+p9dcfY=
X-Received: by 2002:a05:6122:d13:b0:4de:d0ee:7751 with SMTP id
 71dfb90a1353d-4eb02f22afcmr11838073e0c.11.1717472398632; Mon, 03 Jun 2024
 20:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240515080605.2675399-1-fea.wang@sifive.com>
 <20240515080605.2675399-3-fea.wang@sifive.com>
 <CAKmqyKMPy40UQxvVAyuJ+tvC3-58nMvYB1UqMDcoDOT5_A8u1A@mail.gmail.com>
 <CAKmqyKP4pDZdq7mdouTOSznATuGg7jX4QurVvyVEFFRXF3ab4Q@mail.gmail.com>
In-Reply-To: <CAKmqyKP4pDZdq7mdouTOSznATuGg7jX4QurVvyVEFFRXF3ab4Q@mail.gmail.com>
From: Fea Wang <fea.wang@sifive.com>
Date: Tue, 4 Jun 2024 11:39:47 +0800
Message-ID: <CAKhCfseEKYxhv9WMW0HFsYjP=gbJWB5i2Lza0WPj9i-TS7xSLg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 2/5] target/riscv: Support the version for ss1p13
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Frank Chang <frank.chang@sifive.com>, Weiwei Li <liwei1518@gmail.com>, 
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>, Max Chou <max.chou@sifive.com>
Content-Type: multipart/alternative; boundary="0000000000003b869e061a0834fb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=fea.wang@sifive.com; helo=mail-vk1-xa2a.google.com
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

--0000000000003b869e061a0834fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Got it.
I will fix it in the next version of the patch series.

Sincerely,
Fea

On Tue, Jun 4, 2024 at 8:56=E2=80=AFAM Alistair Francis <alistair23@gmail.c=
om>
wrote:

> On Tue, Jun 4, 2024 at 10:46=E2=80=AFAM Alistair Francis <alistair23@gmai=
l.com>
> wrote:
> >
> > On Wed, May 15, 2024 at 6:02=E2=80=AFPM Fea.Wang <fea.wang@sifive.com> =
wrote:
> > >
> > > Add RISC-V privilege 1.13 support.
> > >
> > > Signed-off-by: Fea.Wang <fea.wang@sifive.com>
> > > Reviewed-by: Frank Chang <frank.chang@sifive.com>
> > > Reviewed-by:  Weiwei Li <liwei1518@gmail.com>
> > > Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> >
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Whoops, ignore this.
>
> >
> > Alistair
> >
> > > ---
> > >  target/riscv/cpu.c         | 6 +++++-
> > >  target/riscv/cpu.h         | 4 +++-
> > >  target/riscv/cpu_cfg.h     | 1 +
> > >  target/riscv/tcg/tcg-cpu.c | 4 ++++
> > >  4 files changed, 13 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index 6dd3d7f4a3..ee2ec4c4e5 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -1775,7 +1775,9 @@ static int priv_spec_from_str(const char
> *priv_spec_str)
> > >  {
> > >      int priv_version =3D -1;
> > >
> > > -    if (!g_strcmp0(priv_spec_str, PRIV_VER_1_12_0_STR)) {
> > > +    if (!g_strcmp0(priv_spec_str, PRIV_VER_1_13_0_STR)) {
> > > +        priv_version =3D PRIV_VERSION_1_13_0;
> > > +    } else if (!g_strcmp0(priv_spec_str, PRIV_VER_1_12_0_STR)) {
>
> This patch should be split in half. We only want to expose this to
> user after it has been implemented.
>
> Alistair
>
> > >          priv_version =3D PRIV_VERSION_1_12_0;
> > >      } else if (!g_strcmp0(priv_spec_str, PRIV_VER_1_11_0_STR)) {
> > >          priv_version =3D PRIV_VERSION_1_11_0;
> > > @@ -1795,6 +1797,8 @@ const char *priv_spec_to_str(int priv_version)
> > >          return PRIV_VER_1_11_0_STR;
> > >      case PRIV_VERSION_1_12_0:
> > >          return PRIV_VER_1_12_0_STR;
> > > +    case PRIV_VERSION_1_13_0:
> > > +        return PRIV_VER_1_13_0_STR;
> > >      default:
> > >          return NULL;
> > >      }
> > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > > index 140eb43fcb..f691c7d828 100644
> > > --- a/target/riscv/cpu.h
> > > +++ b/target/riscv/cpu.h
> > > @@ -96,12 +96,14 @@ extern RISCVCPUProfile *riscv_profiles[];
> > >  #define PRIV_VER_1_10_0_STR "v1.10.0"
> > >  #define PRIV_VER_1_11_0_STR "v1.11.0"
> > >  #define PRIV_VER_1_12_0_STR "v1.12.0"
> > > +#define PRIV_VER_1_13_0_STR "v1.13.0"
> > >  enum {
> > >      PRIV_VERSION_1_10_0 =3D 0,
> > >      PRIV_VERSION_1_11_0,
> > >      PRIV_VERSION_1_12_0,
> > > +    PRIV_VERSION_1_13_0,
> > >
> > > -    PRIV_VERSION_LATEST =3D PRIV_VERSION_1_12_0,
> > > +    PRIV_VERSION_LATEST =3D PRIV_VERSION_1_13_0,
> > >  };
> > >
> > >  #define VEXT_VERSION_1_00_0 0x00010000
> > > diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> > > index e1e4f32698..fb7eebde52 100644
> > > --- a/target/riscv/cpu_cfg.h
> > > +++ b/target/riscv/cpu_cfg.h
> > > @@ -136,6 +136,7 @@ struct RISCVCPUConfig {
> > >       * TCG always implement/can't be user disabled,
> > >       * based on spec version.
> > >       */
> > > +    bool has_priv_1_13;
> > >      bool has_priv_1_12;
> > >      bool has_priv_1_11;
> > >
> > > diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> > > index fa186093fb..f53422d605 100644
> > > --- a/target/riscv/tcg/tcg-cpu.c
> > > +++ b/target/riscv/tcg/tcg-cpu.c
> > > @@ -318,6 +318,10 @@ static void
> riscv_cpu_update_named_features(RISCVCPU *cpu)
> > >          cpu->cfg.has_priv_1_12 =3D true;
> > >      }
> > >
> > > +    if (cpu->env.priv_ver >=3D PRIV_VERSION_1_13_0) {
> > > +        cpu->cfg.has_priv_1_13 =3D true;
> > > +    }
> > > +
> > >      /* zic64b is 1.12 or later */
> > >      cpu->cfg.ext_zic64b =3D cpu->cfg.cbom_blocksize =3D=3D 64 &&
> > >                            cpu->cfg.cbop_blocksize =3D=3D 64 &&
> > > --
> > > 2.34.1
> > >
> > >
>

--0000000000003b869e061a0834fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Got it.<div>I will fix it in the next version of the patch=
 series.<div><br></div><div>Sincerely,</div><div>Fea</div></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun=
 4, 2024 at 8:56=E2=80=AFAM Alistair Francis &lt;<a href=3D"mailto:alistair=
23@gmail.com">alistair23@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Tue, Jun 4, 2024 at 10:46=E2=80=AFAM A=
listair Francis &lt;<a href=3D"mailto:alistair23@gmail.com" target=3D"_blan=
k">alistair23@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, May 15, 2024 at 6:02=E2=80=AFPM Fea.Wang &lt;<a href=3D"mailto=
:fea.wang@sifive.com" target=3D"_blank">fea.wang@sifive.com</a>&gt; wrote:<=
br>
&gt; &gt;<br>
&gt; &gt; Add RISC-V privilege 1.13 support.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Fea.Wang &lt;<a href=3D"mailto:fea.wang@sifive.com=
" target=3D"_blank">fea.wang@sifive.com</a>&gt;<br>
&gt; &gt; Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive=
.com" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; &gt; Reviewed-by:=C2=A0 Weiwei Li &lt;<a href=3D"mailto:liwei1518@gmai=
l.com" target=3D"_blank">liwei1518@gmail.com</a>&gt;<br>
&gt; &gt; Reviewed-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@linux.al=
ibaba.com" target=3D"_blank">zhiwei_liu@linux.alibaba.com</a>&gt;<br>
&gt;<br>
&gt; Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@w=
dc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
<br>
Whoops, ignore this.<br>
<br>
&gt;<br>
&gt; Alistair<br>
&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++=
++-<br>
&gt; &gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 +++=
-<br>
&gt; &gt;=C2=A0 target/riscv/cpu_cfg.h=C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt; &gt;=C2=A0 target/riscv/tcg/tcg-cpu.c | 4 ++++<br>
&gt; &gt;=C2=A0 4 files changed, 13 insertions(+), 2 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; &gt; index 6dd3d7f4a3..ee2ec4c4e5 100644<br>
&gt; &gt; --- a/target/riscv/cpu.c<br>
&gt; &gt; +++ b/target/riscv/cpu.c<br>
&gt; &gt; @@ -1775,7 +1775,9 @@ static int priv_spec_from_str(const char *p=
riv_spec_str)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 int priv_version =3D -1;<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 if (!g_strcmp0(priv_spec_str, PRIV_VER_1_12_0_STR)=
) {<br>
&gt; &gt; +=C2=A0 =C2=A0 if (!g_strcmp0(priv_spec_str, PRIV_VER_1_13_0_STR)=
) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv_version =3D PRIV_VERSION_1_13_0=
;<br>
&gt; &gt; +=C2=A0 =C2=A0 } else if (!g_strcmp0(priv_spec_str, PRIV_VER_1_12=
_0_STR)) {<br>
<br>
This patch should be split in half. We only want to expose this to<br>
user after it has been implemented.<br>
<br>
Alistair<br>
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv_version =3D PRIV_VERSION_1=
_12_0;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 } else if (!g_strcmp0(priv_spec_str, PRIV_VER=
_1_11_0_STR)) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv_version =3D PRIV_VERSION_1=
_11_0;<br>
&gt; &gt; @@ -1795,6 +1797,8 @@ const char *priv_spec_to_str(int priv_versi=
on)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PRIV_VER_1_11_0_STR;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 case PRIV_VERSION_1_12_0:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PRIV_VER_1_12_0_STR;<br>
&gt; &gt; +=C2=A0 =C2=A0 case PRIV_VERSION_1_13_0:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return PRIV_VER_1_13_0_STR;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; &gt; index 140eb43fcb..f691c7d828 100644<br>
&gt; &gt; --- a/target/riscv/cpu.h<br>
&gt; &gt; +++ b/target/riscv/cpu.h<br>
&gt; &gt; @@ -96,12 +96,14 @@ extern RISCVCPUProfile *riscv_profiles[];<br>
&gt; &gt;=C2=A0 #define PRIV_VER_1_10_0_STR &quot;v1.10.0&quot;<br>
&gt; &gt;=C2=A0 #define PRIV_VER_1_11_0_STR &quot;v1.11.0&quot;<br>
&gt; &gt;=C2=A0 #define PRIV_VER_1_12_0_STR &quot;v1.12.0&quot;<br>
&gt; &gt; +#define PRIV_VER_1_13_0_STR &quot;v1.13.0&quot;<br>
&gt; &gt;=C2=A0 enum {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 PRIV_VERSION_1_10_0 =3D 0,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 PRIV_VERSION_1_11_0,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 PRIV_VERSION_1_12_0,<br>
&gt; &gt; +=C2=A0 =C2=A0 PRIV_VERSION_1_13_0,<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 PRIV_VERSION_LATEST =3D PRIV_VERSION_1_12_0,<br>
&gt; &gt; +=C2=A0 =C2=A0 PRIV_VERSION_LATEST =3D PRIV_VERSION_1_13_0,<br>
&gt; &gt;=C2=A0 };<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #define VEXT_VERSION_1_00_0 0x00010000<br>
&gt; &gt; diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h<br>
&gt; &gt; index e1e4f32698..fb7eebde52 100644<br>
&gt; &gt; --- a/target/riscv/cpu_cfg.h<br>
&gt; &gt; +++ b/target/riscv/cpu_cfg.h<br>
&gt; &gt; @@ -136,6 +136,7 @@ struct RISCVCPUConfig {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* TCG always implement/can&#39;t be use=
r disabled,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* based on spec version.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; +=C2=A0 =C2=A0 bool has_priv_1_13;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 bool has_priv_1_12;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 bool has_priv_1_11;<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cp=
u.c<br>
&gt; &gt; index fa186093fb..f53422d605 100644<br>
&gt; &gt; --- a/target/riscv/tcg/tcg-cpu.c<br>
&gt; &gt; +++ b/target/riscv/tcg/tcg-cpu.c<br>
&gt; &gt; @@ -318,6 +318,10 @@ static void riscv_cpu_update_named_features(=
RISCVCPU *cpu)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.has_priv_1_12 =3D t=
rue;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 if (cpu-&gt;env.priv_ver &gt;=3D PRIV_VERSION_1_13=
_0) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.has_priv_1_13 =3D true;<=
br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* zic64b is 1.12 or later */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.ext_zic64b =3D cpu-&gt;cfg.cbom_b=
locksize =3D=3D 64 &amp;&amp;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.cbop_blocksize =3D=3D 64 &amp;&=
amp;<br>
&gt; &gt; --<br>
&gt; &gt; 2.34.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
</blockquote></div>

--0000000000003b869e061a0834fb--

