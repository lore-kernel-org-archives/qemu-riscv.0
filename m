Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7clp-0002lR-Oc
	for mharc-qemu-riscv@gnu.org; Wed, 12 Jan 2022 07:30:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7cli-0002iY-Iv
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 07:30:23 -0500
Received: from [2607:f8b0:4864:20::62a] (port=45834
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7clc-0004e6-Uo
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 07:30:22 -0500
Received: by mail-pl1-x62a.google.com with SMTP id g5so3863916plo.12
 for <qemu-riscv@nongnu.org>; Wed, 12 Jan 2022 04:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZwgiA1UGREZ5ZhsnOv2p0kUtfkuPXu5HT8e1eq6XggM=;
 b=ac6DYpSiIqQC17957lpW3835wv620oEIb0Mlz6BT6Z+DPhKUU0aYF3VP4n8YMR5bj2
 p+iV3NMeCkLbpcn6ktOZ7QvxJpw2/ktHlhWBlXAxrJR/wyfWtKKLW7FPn8QYwiFKbrgj
 GPShPEws9bs5L5gBxbw6Yib6QTmn0NsVkm+7LBNnTych/cvr7gmXXHIMAocet9Eo96o+
 I31dujOmMg3EERfxRx/A4ZKeWWvpwuiijjssQIMTV2x1Lg/xR3e5VIoTRhCft4TQeyYo
 BwdIX2P2U3/LNAScCrh5TnwTf3a0lslJP72YPM9MzqJZy1OF740S39x8AHZEZVcaMcnI
 Emnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZwgiA1UGREZ5ZhsnOv2p0kUtfkuPXu5HT8e1eq6XggM=;
 b=eAv5vQBhUx/b0ZoO8lnzbBIju29KjDrvQqkYX79J33Hmqe7tjkyM0H6m1Ha51QfxIQ
 Iwll8shglnph3HkifS/27BS95AaInsTlxEpA/30XuOtTsAF9tcwksY4pNIQ9/pKVVvOc
 eFYzzgVzVMGIHYLOPZ/Or5GQq2wnDQxeh28cQ8huBZJZDNabKrjwsIzZcTpOp5HpIk4z
 8LOxdUMcPJxPvzakcR7+i91Swh08i55yEUPzgFcLoX9N5K3Y5o7manh/AMHQPQRGIa6+
 mFrChNs/oyDZZoAwO5ODs6ao2HBeWEoYXVNixxvatftz0xIgsowaryVjhAOXmY23lQso
 sP7g==
X-Gm-Message-State: AOAM532vT5gemuu5vFWL9V/dkKSM05Jx+aoCKhrLwK81vqEZqXQIkqUx
 feELSlX7f1iVqJ40Mvz8A4Ab+/DMXet1YU2M
X-Google-Smtp-Source: ABdhPJzv7h1/wtle0jnqUWLc01dCQFxkq5sfStOm5/7KLFliS0LVd5cH+WdVl9vsfjNqleI2ymhu0Q==
X-Received: by 2002:a63:2a0d:: with SMTP id q13mr8235622pgq.513.1641990608207; 
 Wed, 12 Jan 2022 04:30:08 -0800 (PST)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com.
 [209.85.216.50])
 by smtp.gmail.com with ESMTPSA id 32sm2605078pgs.48.2022.01.12.04.30.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 04:30:07 -0800 (PST)
Received: by mail-pj1-f50.google.com with SMTP id
 l16-20020a17090a409000b001b2e9628c9cso4409183pjg.4; 
 Wed, 12 Jan 2022 04:30:06 -0800 (PST)
X-Received: by 2002:a17:902:ab8e:b0:14a:2fef:2cf3 with SMTP id
 f14-20020a170902ab8e00b0014a2fef2cf3mr9212328plr.52.1641990606472; Wed, 12
 Jan 2022 04:30:06 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-2-anup@brainfault.org>
In-Reply-To: <20211230123539.52786-2-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 12 Jan 2022 20:29:55 +0800
X-Gmail-Original-Message-ID: <CANzO1D1JEbp7wtAx9C_reZVTyBW8K6CYjFDGouzbOUOyuwV3ng@mail.gmail.com>
Message-ID: <CANzO1D1JEbp7wtAx9C_reZVTyBW8K6CYjFDGouzbOUOyuwV3ng@mail.gmail.com>
Subject: Re: [PATCH v6 01/23] target/riscv: Fix trap cause for RV32 HS-mode
 CSR access from RV64 HS-mode
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d2cd4e05d561baaa"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 12 Jan 2022 12:30:24 -0000

--000000000000d2cd4e05d561baaa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:37=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Anup Patel <anup.patel@wdc.com>
>
> We should be returning illegal instruction trap when RV64 HS-mode tries
> to access RV32 HS-mode CSR.
>
> Fixes: d6f20dacea51 ("target/riscv: Fix 32-bit HS mode access permissions=
")
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 146447eac5..fd7110c38b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -182,7 +182,7 @@ static RISCVException hmode(CPURISCVState *env, int
> csrno)
>  static RISCVException hmode32(CPURISCVState *env, int csrno)
>  {
>      if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
> -        if (riscv_cpu_virt_enabled(env)) {
> +        if (!riscv_cpu_virt_enabled(env)) {
>              return RISCV_EXCP_ILLEGAL_INST;
>          } else {
>              return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> --
> 2.25.1
>
>
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--000000000000d2cd4e05d561baaa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Anup Patel &lt;<a href=3D"mailto:anup@bra=
infault.org">anup@brainfault.org</a>&gt; =E6=96=BC 2021=E5=B9=B412=E6=9C=88=
30=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:37=E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com=
" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
<br>
We should be returning illegal instruction trap when RV64 HS-mode tries<br>
to access RV32 HS-mode CSR.<br>
<br>
Fixes: d6f20dacea51 (&quot;target/riscv: Fix 32-bit HS mode access permissi=
ons&quot;)<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=
=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
Reviewed-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D"_=
blank">bmeng.cn@gmail.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/csr.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index 146447eac5..fd7110c38b 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -182,7 +182,7 @@ static RISCVException hmode(CPURISCVState *env, int csr=
no)<br>
=C2=A0static RISCVException hmode32(CPURISCVState *env, int csrno)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (riscv_cpu_mxl(env) !=3D MXL_RV32) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!riscv_cpu_virt_enabled(env)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_ILLEGAL_I=
NST;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_VIRT_INST=
RUCTION_FAULT;<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt;<a href=
=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com=
</a>&gt;=C2=A0</div></div></div>

--000000000000d2cd4e05d561baaa--

