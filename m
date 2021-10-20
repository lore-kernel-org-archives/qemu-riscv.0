Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md1mB-0006HV-38
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 22:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1md1m9-0006Gp-B5
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 22:56:21 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:37584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1md1m7-0002ND-17
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 22:56:20 -0400
Received: by mail-io1-xd36.google.com with SMTP id m20so22732576iol.4
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 19:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9kAQSOVoVrd0txXtaNAFZgLXmrjimgvUH2FrYtXT//g=;
 b=VH7yTj6wanZyqmjiMvYQi4aUpuXor2MYzcj9yevXmoSe2RErlWH+ZkH0koCOrKgbNk
 4ZTbn+mESQyrwf4BYGlCFaSSy7xcSagx8lwSP21ihxG/h2rWPzFivvsE7fMP4BB7KawJ
 +ES1ujj21WJJc8fxJs8AqAgRcZ19A+7ge5icXMzA0BXHPvOZdePupc5RWNaACJGSfNNM
 +W/PsIevJprhatq7U1wSo8akSxLuZMx9v6xrisg5Ok1V740DCtcEGrA2MsQ942g0HP/t
 hbcn4f2mYWPVvA+d66aPUttJHr5fS2faTg4CUAkSyioxDU3o01AsTZF6QE2NLUMwRBdz
 dFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9kAQSOVoVrd0txXtaNAFZgLXmrjimgvUH2FrYtXT//g=;
 b=mnFCs5XEZn1mKGATps58KbWOrEAj6/K++q0vj5XlqDPFvFO9PU1jw6u3JuyV9j8uTD
 j9BvxYwZoT20iq/9qFEM8BiEafa1rK/hbNSQg8veHwBNPdYCj776en3xojktbkRDa8/a
 bhX0nF85IgCz2cOIRTl4FKaq/mXo9WHHUgddZREWwv5dbLBNj4+qiCmrOMZr7P6EZntd
 mdUo5+cIC3YzqUYckllUuSjq5oroe02l8asKb+eg3DHbrFWLOGeDS+GIGzxr26j6mZRO
 2WDX6EKZNS3NNsI5dnJs/FLXzF+aH9++LQ9RGQrMdhYlez6GFW5cRPSbafKwuG5fLF1u
 GOdQ==
X-Gm-Message-State: AOAM531+E+9C1mMpOkxn3/VDN6Wt5A7Gxd2AyGWaQ27n1mbPEOsgls8i
 GUjElWrEfg0h4d3xWyTOd1yZWwCUy8997/+0nxuesA==
X-Google-Smtp-Source: ABdhPJwa9x8lhHPPODeKqpoGjllpDxyp1HMDMN0h5g4Qqj6M941LprNQacda0EEX6WuEgXUclvqgDNLXolBaSDl7zjY=
X-Received: by 2002:a05:6602:2ac8:: with SMTP id
 m8mr22379592iov.112.1634698577059; 
 Tue, 19 Oct 2021 19:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211016085428.3001501-1-frank.chang@sifive.com>
 <20211016085428.3001501-3-frank.chang@sifive.com>
In-Reply-To: <20211016085428.3001501-3-frank.chang@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 20 Oct 2021 10:56:06 +0800
Message-ID: <CAE_xrPg0Lhn3=83mBJmCMymiO9GgbMZv+LDLX13_azdPdfgXxg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] target/riscv: change the api for RVF/RVD fmin/fmax
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000003b6d05cebfecef"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=frank.chang@sifive.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 02:56:21 -0000

--000000000000003b6d05cebfecef
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 16, 2021 at 4:54 PM <frank.chang@sifive.com> wrote:

> From: Chih-Min Chao <chihmin.chao@sifive.com>
>
> The sNaN propagation behavior has been changed since
> cd20cee7 in https://github.com/riscv/riscv-isa-manual.
>
> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/fpu_helper.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index 8700516a14c..d62f4709002 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -174,14 +174,18 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_t
> rs1, uint64_t rs2)
>  {
>      float32 frs1 = check_nanbox_s(rs1);
>      float32 frs2 = check_nanbox_s(rs2);
> -    return nanbox_s(float32_minnum(frs1, frs2, &env->fp_status));
> +    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
> +                    float32_minnum(frs1, frs2, &env->fp_status) :
> +                    float32_minimum_number(frs1, frs2, &env->fp_status));
>  }
>
>  uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
>      float32 frs1 = check_nanbox_s(rs1);
>      float32 frs2 = check_nanbox_s(rs2);
> -    return nanbox_s(float32_maxnum(frs1, frs2, &env->fp_status));
> +    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
> +                    float32_maxnum(frs1, frs2, &env->fp_status) :
> +                    float32_maximum_number(frs1, frs2, &env->fp_status));
>  }
>
>  uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)
> @@ -283,12 +287,16 @@ uint64_t helper_fdiv_d(CPURISCVState *env, uint64_t
> frs1, uint64_t frs2)
>
>  uint64_t helper_fmin_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>  {
> -    return float64_minnum(frs1, frs2, &env->fp_status);
> +    return env->priv_ver < PRIV_VERSION_1_11_0 ?
> +            float64_minnum(frs1, frs2, &env->fp_status) :
> +            float64_minimum_number(frs1, frs2, &env->fp_status);
>  }
>
>  uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>  {
> -    return float64_maxnum(frs1, frs2, &env->fp_status);
> +    return env->priv_ver < PRIV_VERSION_1_11_0 ?
> +            float64_maxnum(frs1, frs2, &env->fp_status) :
> +            float64_maximum_number(frs1, frs2, &env->fp_status);
>  }
>
>  uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)
> --
> 2.25.1
>
>
If we have decided to tie RVF with Privilege spec version for now as
discussed in:
https://patchew.org/QEMU/20211015065500.3850513-1-frank.chang@sifive.com/20211015065500.3850513-3-frank.chang@sifive.com/
then I think this patch doesn't require any further changes, right?

Regards,
Frank Chang

--000000000000003b6d05cebfecef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Oct 16, 2021 at 4:54 PM &lt;<a hr=
ef=3D"mailto:frank.chang@sifive.com">frank.chang@sifive.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Chih-Min Chao &lt;<a href=3D"mailto:chihmin.chao@sifive.co=
m" target=3D"_blank">chihmin.chao@sifive.com</a>&gt;<br>
<br>
The sNaN propagation behavior has been changed since<br>
cd20cee7 in <a href=3D"https://github.com/riscv/riscv-isa-manual" rel=3D"no=
referrer" target=3D"_blank">https://github.com/riscv/riscv-isa-manual</a>.<=
br>
<br>
Signed-off-by: Chih-Min Chao &lt;<a href=3D"mailto:chihmin.chao@sifive.com"=
 target=3D"_blank">chihmin.chao@sifive.com</a>&gt;<br>
Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" ta=
rget=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/fpu_helper.c | 16 ++++++++++++----<br>
=C2=A01 file changed, 12 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c<br>
index 8700516a14c..d62f4709002 100644<br>
--- a/target/riscv/fpu_helper.c<br>
+++ b/target/riscv/fpu_helper.c<br>
@@ -174,14 +174,18 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_t r=
s1, uint64_t rs2)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0float32 frs1 =3D check_nanbox_s(rs1);<br>
=C2=A0 =C2=A0 =C2=A0float32 frs2 =3D check_nanbox_s(rs2);<br>
-=C2=A0 =C2=A0 return nanbox_s(float32_minnum(frs1, frs2, &amp;env-&gt;fp_s=
tatus));<br>
+=C2=A0 =C2=A0 return nanbox_s(env-&gt;priv_ver &lt; PRIV_VERSION_1_11_0 ?<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 floa=
t32_minnum(frs1, frs2, &amp;env-&gt;fp_status) :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 floa=
t32_minimum_number(frs1, frs2, &amp;env-&gt;fp_status));<br>
=C2=A0}<br>
<br>
=C2=A0uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2=
)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0float32 frs1 =3D check_nanbox_s(rs1);<br>
=C2=A0 =C2=A0 =C2=A0float32 frs2 =3D check_nanbox_s(rs2);<br>
-=C2=A0 =C2=A0 return nanbox_s(float32_maxnum(frs1, frs2, &amp;env-&gt;fp_s=
tatus));<br>
+=C2=A0 =C2=A0 return nanbox_s(env-&gt;priv_ver &lt; PRIV_VERSION_1_11_0 ?<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 floa=
t32_maxnum(frs1, frs2, &amp;env-&gt;fp_status) :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 floa=
t32_maximum_number(frs1, frs2, &amp;env-&gt;fp_status));<br>
=C2=A0}<br>
<br>
=C2=A0uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)<br>
@@ -283,12 +287,16 @@ uint64_t helper_fdiv_d(CPURISCVState *env, uint64_t f=
rs1, uint64_t frs2)<br>
<br>
=C2=A0uint64_t helper_fmin_d(CPURISCVState *env, uint64_t frs1, uint64_t fr=
s2)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return float64_minnum(frs1, frs2, &amp;env-&gt;fp_status);<b=
r>
+=C2=A0 =C2=A0 return env-&gt;priv_ver &lt; PRIV_VERSION_1_11_0 ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 float64_minnum(frs1, frs2, &amp;=
env-&gt;fp_status) :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 float64_minimum_number(frs1, frs=
2, &amp;env-&gt;fp_status);<br>
=C2=A0}<br>
<br>
=C2=A0uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t fr=
s2)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return float64_maxnum(frs1, frs2, &amp;env-&gt;fp_status);<b=
r>
+=C2=A0 =C2=A0 return env-&gt;priv_ver &lt; PRIV_VERSION_1_11_0 ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 float64_maxnum(frs1, frs2, &amp;=
env-&gt;fp_status) :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 float64_maximum_number(frs1, frs=
2, &amp;env-&gt;fp_status);<br>
=C2=A0}<br>
<br>
=C2=A0uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)<br>
-- <br>
2.25.1<br>
<br></blockquote><div><br></div><div>If we have decided to tie RVF with Pri=
vilege spec version for now as discussed in:</div><div><a href=3D"https://p=
atchew.org/QEMU/20211015065500.3850513-1-frank.chang@sifive.com/20211015065=
500.3850513-3-frank.chang@sifive.com/">https://patchew.org/QEMU/20211015065=
500.3850513-1-frank.chang@sifive.com/20211015065500.3850513-3-frank.chang@s=
ifive.com/</a><br></div><div>then I think this patch doesn&#39;t require=C2=
=A0any further changes, right?</div><div><br></div><div>Regards,</div><div>=
Frank Chang</div></div></div>

--000000000000003b6d05cebfecef--

