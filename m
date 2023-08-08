Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49DCC001B0
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 18:42:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTReS-0002ya-CA; Tue, 08 Aug 2023 14:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qTReJ-0002pZ-Dn
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 14:41:45 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qTReH-00030M-BS
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 14:41:43 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b9cf2b1309so1837751fa.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Aug 2023 11:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1691520099; x=1692124899;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zQgl6Z4e5MvN2Ks6H05IaX0j6bd0wj+zr33WoA3nBYM=;
 b=fA104ePwoJ/FGvWzvP/34Nis0+B4vwjv/wsCSAEzQ2Ye9CPRTeao4c68VcCFVy3xNE
 W0vdR3BAxQkvv2ay8aQjskbKfSPK+YZUjKt+r0ECJXrDPKGMRy4P4C8RCs3quRAcAIxc
 99kJy3RsDpHTfYrMqKz8azU3GN5Fv27rF7aA3tne+xiSIL0/fvzifGuLd/bflrVNPjMe
 KqqJiizwOK5NArE94rTgBgwt+bpH3RVl/6+qVLuIa6gL+glfrUzh+EiQmwd2wzyx4sk+
 oimfivu+qMMpL7B5vXroysLaxWDranjEa+oeiwXPND81src+r0SihKyRF2F29MNLBm1w
 GiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691520099; x=1692124899;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zQgl6Z4e5MvN2Ks6H05IaX0j6bd0wj+zr33WoA3nBYM=;
 b=UsTf4Xl0Yhk/vKj5ijAFeqHBE8A7qX7Hr1gDz9msyLnJVqFsjl5SI8zt+jPeiZPoLe
 gi2dWNWutM5HDcDMgrOqNU3FjHDTEioD7UeLVDyrCiFUOD9q+wghEUlcP54X6dR9vZHo
 HF9pCSJ72zsXZrwcTzDVjLoOygEBbQ8hSFU1TD6PICbmZo1g3k9vdfNFyXQjt1BGzUCf
 /9VGTAR2LyZLeUZ2QvJmkMbffK/LS2SAgclzZ9PPg411Wia3ezBkBJoXE4gv2OCl9DSl
 JIDBA+c0IN0K7rIvaKSWoomupbrVIpdglIpJ3wFdeR/1sLRivurtuS29OQpSs3v2m5JX
 wbbA==
X-Gm-Message-State: AOJu0YyZp7QiWgR9AMNhjBNvJQM64OdNDuVT/1Ig5YOBC9CgT3dEe4zX
 9lNp9D3ZTvAzoM+B4yxYjgpup7VX1TVfTkt35tuJXQ==
X-Google-Smtp-Source: AGHT+IHAcasSRlY3WUnE0HBh6CJeW0CSldGR8h7Is+li/KO+olc0+/JkuOBADs2kgkGA79sHH4QCXo0YQJ+dCLXKXRg=
X-Received: by 2002:a2e:81ce:0:b0:2b9:344c:181e with SMTP id
 s14-20020a2e81ce000000b002b9344c181emr213833ljg.19.1691520099378; Tue, 08 Aug
 2023 11:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230728082502.26439-1-jason.chien@sifive.com>
In-Reply-To: <20230728082502.26439-1-jason.chien@sifive.com>
From: Jason Chien <jason.chien@sifive.com>
Date: Wed, 9 Aug 2023 02:41:27 +0800
Message-ID: <CADr__8qvAUgO5QLCzzTZmQWeu4pi9kv7_fu1hbCj+Db1mGY4uA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/intc: Fix upper/lower mtime write calculation
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: multipart/alternative; boundary="000000000000a78b6d06026db67d"
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=jason.chien@sifive.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000a78b6d06026db67d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
The patch seems to be ignored. I am not sure who to ping. Could someone
please review this patch? Thank you!
patch link:
https://lore.kernel.org/qemu-devel/20230728082502.26439-1-jason.chien@sifiv=
e.com/

On Fri, Jul 28, 2023 at 4:25=E2=80=AFPM Jason Chien <jason.chien@sifive.com=
> wrote:

> When writing the upper mtime, we should keep the original lower mtime
> whose value is given by cpu_riscv_read_rtc() instead of
> cpu_riscv_read_rtc_raw(). The same logic applies to writes to lower mtime=
.
>
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> ---
>  hw/intc/riscv_aclint.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index b466a6abaf..bf77e29a70 100644
> --- a/hw/intc/riscv_aclint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -208,11 +208,12 @@ static void riscv_aclint_mtimer_write(void *opaque,
> hwaddr addr,
>          return;
>      } else if (addr =3D=3D mtimer->time_base || addr =3D=3D mtimer->time=
_base +
> 4) {
>          uint64_t rtc_r =3D cpu_riscv_read_rtc_raw(mtimer->timebase_freq)=
;
> +        uint64_t rtc =3D cpu_riscv_read_rtc(mtimer);
>
>          if (addr =3D=3D mtimer->time_base) {
>              if (size =3D=3D 4) {
>                  /* time_lo for RV32/RV64 */
> -                mtimer->time_delta =3D ((rtc_r & ~0xFFFFFFFFULL) | value=
) -
> rtc_r;
> +                mtimer->time_delta =3D ((rtc & ~0xFFFFFFFFULL) | value) =
-
> rtc_r;
>              } else {
>                  /* time for RV64 */
>                  mtimer->time_delta =3D value - rtc_r;
> @@ -220,7 +221,7 @@ static void riscv_aclint_mtimer_write(void *opaque,
> hwaddr addr,
>          } else {
>              if (size =3D=3D 4) {
>                  /* time_hi for RV32/RV64 */
> -                mtimer->time_delta =3D (value << 32 | (rtc_r & 0xFFFFFFF=
F))
> - rtc_r;
> +                mtimer->time_delta =3D (value << 32 | (rtc & 0xFFFFFFFF)=
) -
> rtc_r;
>              } else {
>                  qemu_log_mask(LOG_GUEST_ERROR,
>                                "aclint-mtimer: invalid time_hi write:
> %08x",
> --
> 2.17.1
>
>

--000000000000a78b6d06026db67d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br>The patch seems to be ignored. I am not sure who to=
 ping. Could someone please review this patch? Thank you!<br>patch link:=C2=
=A0<a href=3D"https://lore.kernel.org/qemu-devel/20230728082502.26439-1-jas=
on.chien@sifive.com/" target=3D"_blank">https://lore.kernel.org/qemu-devel/=
20230728082502.26439-1-jason.chien@sifive.com/</a><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 28, 2023=
 at 4:25=E2=80=AFPM Jason Chien &lt;<a href=3D"mailto:jason.chien@sifive.co=
m" target=3D"_blank">jason.chien@sifive.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">When writing the upper mtime, we=
 should keep the original lower mtime<br>
whose value is given by cpu_riscv_read_rtc() instead of<br>
cpu_riscv_read_rtc_raw(). The same logic applies to writes to lower mtime.<=
br>
<br>
Signed-off-by: Jason Chien &lt;<a href=3D"mailto:jason.chien@sifive.com" ta=
rget=3D"_blank">jason.chien@sifive.com</a>&gt;<br>
---<br>
=C2=A0hw/intc/riscv_aclint.c | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c<br>
index b466a6abaf..bf77e29a70 100644<br>
--- a/hw/intc/riscv_aclint.c<br>
+++ b/hw/intc/riscv_aclint.c<br>
@@ -208,11 +208,12 @@ static void riscv_aclint_mtimer_write(void *opaque, h=
waddr addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0} else if (addr =3D=3D mtimer-&gt;time_base || addr =3D=
=3D mtimer-&gt;time_base + 4) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t rtc_r =3D cpu_riscv_read_rtc_raw=
(mtimer-&gt;timebase_freq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t rtc =3D cpu_riscv_read_rtc(mtimer);<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (addr =3D=3D mtimer-&gt;time_base) {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (size =3D=3D 4) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* time_lo fo=
r RV32/RV64 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mtimer-&gt;time_de=
lta =3D ((rtc_r &amp; ~0xFFFFFFFFULL) | value) - rtc_r;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mtimer-&gt;time_de=
lta =3D ((rtc &amp; ~0xFFFFFFFFULL) | value) - rtc_r;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* time for R=
V64 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mtimer-&gt;ti=
me_delta =3D value - rtc_r;<br>
@@ -220,7 +221,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwa=
ddr addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (size =3D=3D 4) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* time_hi fo=
r RV32/RV64 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mtimer-&gt;time_de=
lta =3D (value &lt;&lt; 32 | (rtc_r &amp; 0xFFFFFFFF)) - rtc_r;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mtimer-&gt;time_de=
lta =3D (value &lt;&lt; 32 | (rtc &amp; 0xFFFFFFFF)) - rtc_r;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask=
(LOG_GUEST_ERROR,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;aclint-mtimer: invalid time_hi =
write: %08x&quot;,<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--000000000000a78b6d06026db67d--

