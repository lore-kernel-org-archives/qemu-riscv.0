Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38966CD98D2
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 10:30:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXcgB-0005vW-FB; Thu, 11 Jun 2026 06:30:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1wXcg0-0005tl-ON
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 06:30:29 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1wXcfy-0004qN-B2
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 06:30:19 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-68ced97b6eeso10551756a12.0
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 03:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1781173816; x=1781778616; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p77B0xYauOL4J7Ev1UzSvLivahywcH0/3Wx4E1msO2c=;
 b=XDiSaygPaZ3n0rwdQfUBwhwacqeLc0FPaBVUT9oY/858tPFBaBeYhFTIJ1J1L8YyRw
 oPsCOygYUdvaypid4f63i6YPyCDOnPBc2rBwRm3Nff3NIA4pA4hVoR5qWxD+ZRzA4ARC
 PwL32McqFh1eCBbgLz8q6vpgnYWeH7O34wHAkrTjBoWyUy0OoNUOaAtBQHk2CghNpW9U
 pbDpu7fSHqOUnL1XO8BB3eaIJuoisaRvJ4szfWZLMztiUUBLSpvr9LT4AVRCmWjyPm1I
 krEy8xfDACCgzW5mQ9c5jPzp61hvm0sOaKQAOB0rsgyf+rP4G9g6V8HtKqhUrw4Wo/8K
 oB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781173816; x=1781778616;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p77B0xYauOL4J7Ev1UzSvLivahywcH0/3Wx4E1msO2c=;
 b=gUxu3MZQs4z5W2lCOAMCmrmHTrg7Zkl0jI6fPBuoZEuSKkHIafVPsXIoUxAfgWExPY
 kLI0mEvo2TmDof3KWSGWM66sd/Y3I7mKMKEuHxe56NZJ3oACfoApup900HYd6ocNLiCw
 ndobFk+YxLDn7Wkw3ritgkSiWOms1uM0lWpGB8GAr6DsggOOwiTQ1QPKei9dgNXi3Ax3
 esBd1DltJrtNWOItC38YjAdHOAGaNoXKlucygHjv92gGeqEMop04/niI7PKSNpVNekJk
 Kh0tfeKYGK+lHSrJ9vbCU8o1OkWZcK1opppi4lPzfT97ngsR7kfRI8gF3TDLqzd51UBU
 mWAQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+kINX6icWozLSZmPbMyoV4JR3ghf5gKP247B3tBghFaoNauP83wQ3qUFXFz1i58YRFfCFMptWgJRqM@nongnu.org
X-Gm-Message-State: AOJu0YxJkT8myS6BpfkFw69SDny8Mw8BNloTfvIBuDIwyhBHlKVjnPUC
 4IKdec1n88HyVNk2ALVMsXtK31bJWGIiTL9buRqqqIdr9BjyCpX2p3F5VgQrOltOCPNwf3aU+4T
 3AAe+bwuApmJ4gEXNAc+sQKJaHJ9YpBngzqC7DbJG64R58UZO01uJdB5EMxwuGUyiqJBEAIl77C
 aGP0pnYCXjGpcUdWVp+s0uooXcaX0bEcNQu0/mSGhDshU=
X-Gm-Gg: Acq92OEWQgjjfc9877BYn9U53SztUTceypZ5tRYzHGJP+ngVuF3PNbtuOENjS61jgdW
 9iNt5Tczbed1GN7jSQJE58bEt/oKayAK+Hnal1ohUIaWp++TqqY2BEEzj9caP6MHA1wGLsOZsl6
 VFBBHk3vR1SBH1ZtOAeI0/vjjvTMDJTyw8T9gDf4XDstaE6SMKqVQMCp2lmqaPg8S6nYrF+alEK
 7VGodR5L9L9UstYpR3crjeXcW/pKbNcGdUArPt/30HhdSXUVEN1zsw75+jJ90YVjYxRe8Ghh2lL
 1+D4AFmDvTMFsMUUz/QLxBRGaCTuBtu8AzCVK06ts/+t1OZw/Quv1qEAnaX5cHcG0Y3fMu0bkx3
 Vl4Lf4RHunqM4uHBDOQxvRtH9ug1UxiIBrW4GvstCPBHImRBmyH7DCcb+RmYfdr4s2c3gPUP/LD
 cC2VhJgh8qjepciRXscoPXcYfOKGqtEWyUBqiMJF9ETQS5ik749pCbqIeF+vsrpwUahrKN3AU=
X-Received: by 2002:a05:6402:26c5:b0:67c:6836:7b0a with SMTP id
 4fb4d7f45d1cf-6930e33ad58mr1010762a12.23.1781173816372; 
 Thu, 11 Jun 2026 03:30:16 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-68e65b58596sm10777963a12.30.2026.06.11.03.30.14
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 03:30:14 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-68f36e1663cso13998873a12.3
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 03:30:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ9VKg2d30lFp0yQHWEcFehmSbcPQ3VPnYfT0QP0nPcLI7vx0rFFFYE+VkHpXIeA5gUTQm+bVNus2xFw@nongnu.org
X-Received: by 2002:a05:6402:1466:b0:691:956a:cf72 with SMTP id
 4fb4d7f45d1cf-6930e32ccc2mr974940a12.17.1781173814308; Thu, 11 Jun 2026
 03:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260318185238.99143-1-luisccunha8@gmail.com>
 <20260318185238.99143-3-luisccunha8@gmail.com>
In-Reply-To: <20260318185238.99143-3-luisccunha8@gmail.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Thu, 11 Jun 2026 18:30:02 +0800
X-Gmail-Original-Message-ID: <CAMXXpfZEr0aChYeq+HQRj3WnjtjiF-cqo8sd5HVbqP6S8z0VDg@mail.gmail.com>
X-Gm-Features: AVVi8CftBZgSovfDygZljDPOBtIbRXeRU2B7Bv1ik7oU_qqkIv74cJ7OpPvmnVM
Message-ID: <CAMXXpfZEr0aChYeq+HQRj3WnjtjiF-cqo8sd5HVbqP6S8z0VDg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/6] target/riscv: Add SPMP CSR configuration
To: luisccc <luisccunha8@gmail.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="0000000000007c35d10653f7d80a"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=jay.chang@sifive.com; helo=mail-ed1-x52c.google.com
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

--0000000000007c35d10653f7d80a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 3:46=E2=80=AFAM luisccc <luisccunha8@gmail.com> wro=
te:

> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> +static bool xiselect_spmp_range(target_ulong isel)
> +{
> +    return (ISELECT_SPMP_BASE <=3D isel &&
> +            isel <=3D ISELECT_SPMP_BASE + MAX_RISCV_SPMPS);
> +}
>
0 <=3D isel <=3D 64 indicates that there are 65 valid entries in total.

> +static int rmw_xireg_spmp(CPURISCVState *env, int csrno,
> +                        target_ulong isel, target_ulong *val,
> +                        target_ulong new_val, target_ulong wr_mask)
> +{
> +    int index =3D 0;
> +    bool m_mode_access =3D false;
> +
> +    /* Read 0 and write ignore if no rules are delegated */
> +    if (env->spmp_state.num_deleg_rules =3D=3D 0) {
> +        *val =3D 0;
>
Maybe we should avoid dereferencing NULL
if (val) {
*val =3D 0;
}

> +        return 0;
> +    }
> +
> +    index =3D isel - ISELECT_SPMP_BASE;
> +
> +    switch (csrno) {
> +    case CSR_MIREG:
> +        /* If M mode, signal it */
> +        m_mode_access =3D true;
> +        [[fallthrough]];
> +    case CSR_SIREG:
> +        if (val) {
> +            *val =3D spmpaddr_csr_read(env, index);
> +        }
> +
> +        spmpaddr_csr_write(env, index, new_val & wr_mask, m_mode_access)=
;
> +        break;
> +    case CSR_MIREG2:
> +        /* If M mode, signal it */
> +        m_mode_access =3D true;
> +        [[fallthrough]];
> +    case CSR_SIREG2:
> +        index =3D isel - ISELECT_SPMP_BASE;
>
Duplicate setting index ?

Spec says : The mireg3 through mireg6 are reserved.
Maybe
    /* Reserved as WPRI - read returns 0, write ignored */
    case CSR_SIREG3:
        /* fallthrough */
    case CSR_SIREG4 ... CSR_SIREG6:
        /* fallthrough */
    case CSR_MIREG3:
        /* fallthrough */
    case CSR_MIREG4 ... CSR_MIREG6:
        if (val) {
            *val =3D 0;
        }
        break;

--=20
> 2.43.0
>
>
>

--0000000000007c35d10653f7d80a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 19,=
 2026 at 3:46=E2=80=AFAM luisccc &lt;<a href=3D"mailto:luisccunha8@gmail.co=
m">luisccunha8@gmail.com</a>&gt; wrote:</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
+static bool xiselect_spmp_range(target_ulong isel)<br>
+{<br>
+=C2=A0 =C2=A0 return (ISELECT_SPMP_BASE &lt;=3D isel &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isel &lt;=3D ISELECT_SPMP_BASE +=
 MAX_RISCV_SPMPS);<br>
+}<br></blockquote><div><code class=3D"gmail-p8i6j0f">0 &lt;=3D isel &lt;=
=3D 64</code> indicates that there are 65 valid entries in total.</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
+static int rmw_xireg_spmp(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 target_ulong isel, target_ulong *val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 target_ulong new_val, target_ulong wr_mask)<br>
+{<br>
+=C2=A0 =C2=A0 int index =3D 0;<br>
+=C2=A0 =C2=A0 bool m_mode_access =3D false;<br>
+<br>
+=C2=A0 =C2=A0 /* Read 0 and write ignore if no rules are delegated */<br>
+=C2=A0 =C2=A0 if (env-&gt;spmp_state.num_deleg_rules =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D 0;<br></blockquote><div>Maybe we shou=
ld avoid dereferencing NULL<br>if (val) {</div><div>*val =3D 0;</div><div>}=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 index =3D isel - ISELECT_SPMP_BASE;<br>
+<br>
+=C2=A0 =C2=A0 switch (csrno) {<br>
+=C2=A0 =C2=A0 case CSR_MIREG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If M mode, signal it */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 m_mode_access =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [[fallthrough]];<br>
+=C2=A0 =C2=A0 case CSR_SIREG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D spmpaddr_csr_read(env, =
index);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 spmpaddr_csr_write(env, index, new_val &amp; w=
r_mask, m_mode_access);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CSR_MIREG2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If M mode, signal it */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 m_mode_access =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [[fallthrough]];<br>
+=C2=A0 =C2=A0 case CSR_SIREG2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 index =3D isel - ISELECT_SPMP_BASE;<br></block=
quote><div>Duplicate setting index ?</div><div><br>Spec says :=C2=A0The mir=
eg3 through mireg6 are reserved.<br>Maybe<br>=C2=A0 =C2=A0 /* Reserved as W=
PRI - read returns 0, write ignored */<br>=C2=A0 =C2=A0 case CSR_SIREG3:<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fallthrough */<br>=C2=A0 =C2=A0 case CSR_SI=
REG4 ... CSR_SIREG6:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fallthrough */<br>=
=C2=A0 =C2=A0 case CSR_MIREG3:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fallthroug=
h */<br>=C2=A0 =C2=A0 case CSR_MIREG4 ... CSR_MIREG6:<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (val) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D=
 0;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<=
br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
2.43.0<br>
<br>
<br>
</blockquote></div></div>

--0000000000007c35d10653f7d80a--

