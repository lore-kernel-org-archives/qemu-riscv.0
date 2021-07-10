Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m2EXM-00006v-Rc
	for mharc-qemu-riscv@gnu.org; Sat, 10 Jul 2021 11:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1m2EXL-00006e-PM
 for qemu-riscv@nongnu.org; Sat, 10 Jul 2021 11:04:59 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:43688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1m2EXJ-0001EO-Jy
 for qemu-riscv@nongnu.org; Sat, 10 Jul 2021 11:04:59 -0400
Received: by mail-pg1-x52e.google.com with SMTP id y4so10634588pgl.10
 for <qemu-riscv@nongnu.org>; Sat, 10 Jul 2021 08:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jPlPeCVYlQvb5i2Gecd/5N70Lmg/f9+8hHCIY2oTTZo=;
 b=Td85Io886L+gnhSbivtv906cEPTubS2vyzNGRzQ2hG6FqlDmyi+M4hTZdkAdcqhtCa
 JPdN5BX/YHedZcu93Rujr4A+y8YXJxUM5aYoCBb0SzQ/Ur3aRnGO3IM8rDMVgeiN2MQd
 62VXtWjdkOiW3acVgsUElWc4PDZQK6L/Y4p4DdC5PrtgoUps5jkd++4+nkIvrM6AeRMy
 4v4EfAA92Fa0JL4lQ/X7kAaPLPqKjEQ4zvtIro1PQObZN2dgBgnhKxlu/NfcaU/wO8uX
 RMopbb3P6Nv9YzxCtVLjeFElK3XG6l8L41fCXc3NcQo1aQYx6ANymkT92B2RqBLDxZRV
 Ga9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jPlPeCVYlQvb5i2Gecd/5N70Lmg/f9+8hHCIY2oTTZo=;
 b=muadp3dvxlGpYa33ixrZl2BoGaw8oRKRwhkKsF6LOqZ7VZl8e1vSu5sTaCxsx4Akg6
 EI8Gx97pDADDl+a9EUTYgnsy29OvQ/z9GQwdJEfFqmIDodjLh/SCzQ3V1gNsIAvh2RH/
 DZWAYDWA+lN0tHIDEFEB9Wgm86PsJBzaK+Z9kNWHNxN5SxLYZnYkdfHwMhX7jOeGGcHn
 BcWfdwfU3VWN1akYFTPNtPl3Mz4aNn2JZ04Jn/tlZFvLHRLxqbsZm3XgBRaOSDdlb5F5
 NV6Vw1tROiuLUQQfzcN9O7kec0WjuU9ruQJD2BGO05d3qfa7yLTL63iDLJiHIJ6lowUn
 K/yA==
X-Gm-Message-State: AOAM533KCFtg/Pgq1kQi9StVFO2zdmdmBv37sYkVVL8U18a93e+zawtw
 1Obz6MbWEJXdD2AZm4VKYw9S+Q==
X-Google-Smtp-Source: ABdhPJwcEBB6ES+fZgJ+lPRJytRCYkohKT2970xdfYiwkJNATUSiKzBLG040Qur5oIe2QdnsORUiFw==
X-Received: by 2002:a63:d60b:: with SMTP id q11mr43827633pgg.270.1625929496284; 
 Sat, 10 Jul 2021 08:04:56 -0700 (PDT)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com.
 [209.85.210.171])
 by smtp.gmail.com with ESMTPSA id b33sm11232098pgb.92.2021.07.10.08.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Jul 2021 08:04:55 -0700 (PDT)
Received: by mail-pf1-f171.google.com with SMTP id b12so11634580pfv.6;
 Sat, 10 Jul 2021 08:04:55 -0700 (PDT)
X-Received: by 2002:a63:655:: with SMTP id 82mr12467700pgg.133.1625929495457; 
 Sat, 10 Jul 2021 08:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-7-zhiwei_liu@c-sky.com>
In-Reply-To: <20210409074857.166082-7-zhiwei_liu@c-sky.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sat, 10 Jul 2021 23:04:44 +0800
X-Gmail-Original-Message-ID: <CANzO1D2t_Pwbfv7YBu5GqV6qyyDqWmRf0y2ocu+_swnxStJxFA@mail.gmail.com>
Message-ID: <CANzO1D2t_Pwbfv7YBu5GqV6qyyDqWmRf0y2ocu+_swnxStJxFA@mail.gmail.com>
Subject: Re: [RFC PATCH 06/11] target/riscv: Update CSR xtvec in CLIC mode
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
Content-Type: multipart/alternative; boundary="00000000000001b38205c6c636d1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52e.google.com
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
X-List-Received-Date: Sat, 10 Jul 2021 15:05:00 -0000

--00000000000001b38205c6c636d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=889=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:51=E5=AF=AB=E9=81=93=EF=BC=9A

> The new CLIC interrupt-handling mode is encoded as a new state in the
> existing WARL xtvec register, where the low two bits of are 11.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/csr.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index f6c84b9fe4..39ff72041a 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -637,9 +637,18 @@ static int read_mtvec(CPURISCVState *env, int csrno,
> target_ulong *val)
>
>  static int write_mtvec(CPURISCVState *env, int csrno, target_ulong val)
>  {
> -    /* bits [1:0] encode mode; 0 =3D direct, 1 =3D vectored, 2 >=3D rese=
rved */
> +    /*
> +     * bits [1:0] encode mode; 0 =3D direct, 1 =3D vectored, 3 =3D CLIC,
> +     * others reserved
> +     */
>      if ((val & 3) < 2) {
>          env->mtvec =3D val;
>

We might need to zero new fields in mcause when set back to basic mode:

Section 4.7:
When basic mode is written to xtvec,
the new xcause state fields (mhinv and mpil) are zeroed.
The other new xcause fields, mpp and mpie, appear as zero in the xcause CSR
but the corresponding state bits in the mstatus register are not cleared.


> +    } else if ((val & 1) && env->clic) {
> +        /*
> +         * If only CLIC mode is supported, writes to bit 1 are also
> ignored and
> +         * it is always set to one. CLIC mode hardwires xtvec bits 2-5 t=
o
> zero.
> +         */
> +        env->mtvec =3D ((val & ~0x3f) << 6) | (0b000011);
>      } else {
>          qemu_log_mask(LOG_UNIMP, "CSR_MTVEC: reserved mode not
> supported\n");
>      }
> @@ -837,9 +846,18 @@ static int read_stvec(CPURISCVState *env, int csrno,
> target_ulong *val)
>
>  static int write_stvec(CPURISCVState *env, int csrno, target_ulong val)
>  {
> -    /* bits [1:0] encode mode; 0 =3D direct, 1 =3D vectored, 2 >=3D rese=
rved */
> +    /*
> +     * bits [1:0] encode mode; 0 =3D direct, 1 =3D vectored, 3 =3D CLIC,
> +     * others reserved
> +     */
>      if ((val & 3) < 2) {
>          env->stvec =3D val;
>

Same to write_mtvec()

Regards,
Frank Chang


> +    } else if ((val & 1) && env->clic) {
> +        /*
> +         * If only CLIC mode is supported, writes to bit 1 are also
> ignored and
> +         * it is always set to one. CLIC mode hardwires xtvec bits 2-5 t=
o
> zero.
> +         */
> +        env->stvec =3D ((val & ~0x3f) << 6) | (0b000011);
>      } else {
>          qemu_log_mask(LOG_UNIMP, "CSR_STVEC: reserved mode not
> supported\n");
>      }
> --
> 2.25.1
>
>
>

--00000000000001b38205c6c636d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_l=
iu@c-sky.com">zhiwei_liu@c-sky.com</a>&gt; =E6=96=BC 2021=E5=B9=B44=E6=9C=
=889=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:51=E5=AF=AB=E9=81=93=
=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">The new CLIC interrupt-handling mode is encoded as a n=
ew state in the<br>
existing WARL xtvec register, where the low two bits of are 11.<br>
<br>
Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" targe=
t=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/csr.c | 22 ++++++++++++++++++++--<br>
=C2=A01 file changed, 20 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index f6c84b9fe4..39ff72041a 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -637,9 +637,18 @@ static int read_mtvec(CPURISCVState *env, int csrno, t=
arget_ulong *val)<br>
<br>
=C2=A0static int write_mtvec(CPURISCVState *env, int csrno, target_ulong va=
l)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 /* bits [1:0] encode mode; 0 =3D direct, 1 =3D vectored, 2 &=
gt;=3D reserved */<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* bits [1:0] encode mode; 0 =3D direct, 1 =3D vectored=
, 3 =3D CLIC,<br>
+=C2=A0 =C2=A0 =C2=A0* others reserved<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0if ((val &amp; 3) &lt; 2) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;mtvec =3D val;<br></blockquote><d=
iv><br></div><div>We might need to zero new fields in mcause when set back =
to basic mode:</div><div><br></div><div>Section 4.7:</div><div>When basic m=
ode is written to xtvec,</div><div>the new xcause state fields (mhinv and m=
pil) are zeroed.</div><div>The other new xcause fields, mpp and mpie, appea=
r as zero in the xcause CSR</div><div>but the corresponding state bits in t=
he mstatus register are not cleared.</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 } else if ((val &amp; 1) &amp;&amp; env-&gt;clic) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If only CLIC mode is supported, writes=
 to bit 1 are also ignored and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* it is always set to one. CLIC mode har=
dwires xtvec bits 2-5 to zero.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mtvec =3D ((val &amp; ~0x3f) &lt;&lt; =
6) | (0b000011);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_UNIMP, &quot;CSR_MTVEC:=
 reserved mode not supported\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -837,9 +846,18 @@ static int read_stvec(CPURISCVState *env, int csrno, t=
arget_ulong *val)<br>
<br>
=C2=A0static int write_stvec(CPURISCVState *env, int csrno, target_ulong va=
l)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 /* bits [1:0] encode mode; 0 =3D direct, 1 =3D vectored, 2 &=
gt;=3D reserved */<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* bits [1:0] encode mode; 0 =3D direct, 1 =3D vectored=
, 3 =3D CLIC,<br>
+=C2=A0 =C2=A0 =C2=A0* others reserved<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0if ((val &amp; 3) &lt; 2) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;stvec =3D val;<br></blockquote><d=
iv><br></div><div>Same to write_mtvec()</div><div><br></div><div>Regards,</=
div><div>Frank Chang</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
+=C2=A0 =C2=A0 } else if ((val &amp; 1) &amp;&amp; env-&gt;clic) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If only CLIC mode is supported, writes=
 to bit 1 are also ignored and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* it is always set to one. CLIC mode har=
dwires xtvec bits 2-5 to zero.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;stvec =3D ((val &amp; ~0x3f) &lt;&lt; =
6) | (0b000011);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_UNIMP, &quot;CSR_STVEC:=
 reserved mode not supported\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--00000000000001b38205c6c636d1--

