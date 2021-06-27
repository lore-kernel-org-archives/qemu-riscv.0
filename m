Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lxOXm-0002EB-HA
	for mharc-qemu-riscv@gnu.org; Sun, 27 Jun 2021 02:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxOXl-0002Dl-AX
 for qemu-riscv@nongnu.org; Sun, 27 Jun 2021 02:45:25 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxOXi-0003fW-Qw
 for qemu-riscv@nongnu.org; Sun, 27 Jun 2021 02:45:24 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 m15-20020a17090a5a4fb029016f385ffad0so8245871pji.0
 for <qemu-riscv@nongnu.org>; Sat, 26 Jun 2021 23:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vCUlctquPUsep8fsouONy/A24jO0UHzx7f7q/ZIHUr8=;
 b=O499m3gjk9b01bGYXEZEhAjqFEWIFPqTf1zTR837VG85SsF1La1oWj0Vge9vqZqKA1
 A5w4I6SsrGc8r7FpmmHmbOkALpn98eAJUqV2jV0Wr3Pn/HyA6629rHt7UgtWtss63Lxz
 LFB+C2Yal3XBT1ONN67cTKRX5K9CuWamz7gGr/CJlG7NX8DU0UQbzHwyd00E+cjzwqqo
 deXK+j6qeSubvr9td4OiEO7brNWt+rKSOX7LtePLFF2pJNlmNVgdy/AV/04aMU223w45
 L55XaLW/2jaCvxAxBemc4x0BHT7vCuZKgWMX2Srumvsx+0PJCNvLOk7oTX7Hmf8yBIrf
 W8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vCUlctquPUsep8fsouONy/A24jO0UHzx7f7q/ZIHUr8=;
 b=UV0QZZEaC0ND88ksITPwc2ajFZIKwwM/9N7kMfDeeJry03MIwg9t1sCL7uR+v1CBDy
 ySUalSf/X6b6wgykUnOtB1U2Huu/tsO9Z6ZsU/KIPr4F8O0UTJXi1W9N9g2tsRwZTR9+
 7OlDI5cpfoYytaRIxTSANm3nedbLbRer2uPK1+pruwaV1cfeK0klW35Y1pkpnWKFXOKQ
 6hA/zRGjg9aR7FYzpbxpkongJnOURoSM0jXFrUKB9pJrzsiSb9bybIVE2vvTl10aQCLQ
 2pVICCZdaXWg80BTkqyJMRTTv+0L3bweNayEexsgHNOZWrF0TEZN3zXSLDUby5b7Cvd9
 VeUQ==
X-Gm-Message-State: AOAM5308xR3uz7t2H5ojyR06S6mjLqIwCq8wry4L0oircI5Nzd4mA98N
 D7jh6fn4sN3rnw9Awt4VEHwn1w==
X-Google-Smtp-Source: ABdhPJzDLOCM9b+0CN0BmN/dLBT8zdiUdAprOhPkxAbQWWYUxwP/pU3F62I6AdKOsgkkctw8KOltcA==
X-Received: by 2002:a17:90a:ce09:: with SMTP id
 f9mr27586629pju.47.1624776320013; 
 Sat, 26 Jun 2021 23:45:20 -0700 (PDT)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com.
 [209.85.216.43])
 by smtp.gmail.com with ESMTPSA id c24sm11167684pgj.11.2021.06.26.23.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Jun 2021 23:45:19 -0700 (PDT)
Received: by mail-pj1-f43.google.com with SMTP id
 13-20020a17090a08cdb029016eed209ca4so8234404pjn.1; 
 Sat, 26 Jun 2021 23:45:19 -0700 (PDT)
X-Received: by 2002:a17:90a:6be6:: with SMTP id
 w93mr20408794pjj.171.1624776319205; 
 Sat, 26 Jun 2021 23:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-6-zhiwei_liu@c-sky.com>
In-Reply-To: <20210409074857.166082-6-zhiwei_liu@c-sky.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 27 Jun 2021 14:45:08 +0800
X-Gmail-Original-Message-ID: <CANzO1D3o_hWzAwgqg5zkhHUE08yqe1eDS6RnJZYfLMyTRSmRww@mail.gmail.com>
Message-ID: <CANzO1D3o_hWzAwgqg5zkhHUE08yqe1eDS6RnJZYfLMyTRSmRww@mail.gmail.com>
Subject: Re: [RFC PATCH 05/11] target/riscv: Update CSR xip in CLIC mode
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
Content-Type: multipart/alternative; boundary="0000000000005887e205c5b9b7e0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 27 Jun 2021 06:45:25 -0000

--0000000000005887e205c5b9b7e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=889=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=EF=BC=9A

> The xip CSR appears hardwired to zero in CLIC mode, replaced by separate
> memory-mapped interrupt pendings (clicintip[i]). Writes to xip will be
> ignored and will not trap (i.e., no access faults).
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

---
>  target/riscv/csr.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 74bc7a08aa..f6c84b9fe4 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -735,6 +735,11 @@ static int rmw_mip(CPURISCVState *env, int csrno,
> target_ulong *ret_value,
>      target_ulong mask =3D write_mask & delegable_ints & ~env->miclaim;
>      uint32_t old_mip;
>
> +     /* The xip CSR appears hardwired to zero in CLIC mode. (Section 4.3=
)
> */
> +    if (riscv_clic_is_clic_mode(env)) {
> +        *ret_value =3D 0;
> +        return 0;
>

Should return RISCV_EXCP_NONE when you rebase to the latest master branch.
Same to rmw_sip().

Reviewed-by: Frank Chang <frank.chang@sifive.com>


> +    }
>      if (mask) {
>          old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_value & mask));
>      } else {
> @@ -922,6 +927,11 @@ static int rmw_sip(CPURISCVState *env, int csrno,
> target_ulong *ret_value,
>      if (riscv_cpu_virt_enabled(env)) {
>          ret =3D rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mask=
);
>      } else {
> +        /* The xip CSR appears hardwired to zero in CLIC mode. (Section
> 4.3) */
> +        if (riscv_clic_is_clic_mode(env)) {
> +            *ret_value =3D 0;
> +            return 0;
> +        }
>          ret =3D rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
>                        write_mask & env->mideleg & sip_writable_mask);
>      }
> --
> 2.25.1
>
>
>

--0000000000005887e205c5b9b7e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_l=
iu@c-sky.com">zhiwei_liu@c-sky.com</a>&gt; =E6=96=BC 2021=E5=B9=B44=E6=9C=
=889=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=
=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">The xip CSR appears hardwired to zero in CLIC mode, re=
placed by separate<br>
memory-mapped interrupt pendings (clicintip[i]). Writes to xip will be<br>
ignored and will not trap (i.e., no access faults).<br>
<br>
Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" targe=
t=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;</blockquote><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
---<br>
=C2=A0target/riscv/csr.c | 10 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index 74bc7a08aa..f6c84b9fe4 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -735,6 +735,11 @@ static int rmw_mip(CPURISCVState *env, int csrno, targ=
et_ulong *ret_value,<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mask =3D write_mask &amp; delegable_ints &=
amp; ~env-&gt;miclaim;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t old_mip;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0/* The xip CSR appears hardwired to zero in CLIC mode.=
 (Section 4.3) */<br>
+=C2=A0 =C2=A0 if (riscv_clic_is_clic_mode(env)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_value =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br></blockquote><div><br></div><div>=
<div>Should return=C2=A0RISCV_EXCP_NONE when you rebase to the latest maste=
r branch.</div><div>Same to=C2=A0rmw_sip().</div><div><br></div><div>Review=
ed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com">frank.chan=
g@sifive.com</a>&gt;<br></div></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0if (mask) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_mip =3D riscv_cpu_update_mip(cpu, mas=
k, (new_value &amp; mask));<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
@@ -922,6 +927,11 @@ static int rmw_sip(CPURISCVState *env, int csrno, targ=
et_ulong *ret_value,<br>
=C2=A0 =C2=A0 =C2=A0if (riscv_cpu_virt_enabled(env)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D rmw_vsip(env, CSR_VSIP, ret_value=
, new_value, write_mask);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The xip CSR appears hardwired to zero in CL=
IC mode. (Section 4.3) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_clic_is_clic_mode(env)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_value =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D rmw_mip(env, CSR_MSTATUS, ret_val=
ue, new_value,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0write_mask &amp; env-&gt;mideleg &amp; sip_writable_mask);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--0000000000005887e205c5b9b7e0--

