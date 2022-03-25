Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nXgDp-0003y6-Dn
	for mharc-qemu-riscv@gnu.org; Fri, 25 Mar 2022 05:27:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nXgDo-0003vC-7O
 for qemu-riscv@nongnu.org; Fri, 25 Mar 2022 05:27:04 -0400
Received: from [2607:f8b0:4864:20::631] (port=35366
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nXgDm-0004aQ-JA
 for qemu-riscv@nongnu.org; Fri, 25 Mar 2022 05:27:03 -0400
Received: by mail-pl1-x631.google.com with SMTP id y6so4882102plg.2
 for <qemu-riscv@nongnu.org>; Fri, 25 Mar 2022 02:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ENQeEzKipR32iSVnpoLguB1f+/Jsx8Ew2YSBbNagJBM=;
 b=Ty9nDaPiJ3oAb2Js4ww6sBuWpfzY2sl2sv89cd2GwSEKTVgjIA7AvDwm68RJC8bZgM
 gRB+jveQgVNYTsgH7aqa266CVQejblLWDBuyqvvu6P18V+ctwkpYzZ+uZVmG+N9YXQSh
 wCYVIcu50dAUz8xqu7UZpheb2bjK0x+vnRGONgPbtpBs8rCU9eowFgUU+GpG8jNzOrsV
 rV98Dmy+fq6QO8lmg48guM80imMRCYchluh2QDgheQlb/mqigDwlkx3TF33zjX+8jQvB
 5OpWUO5E4X99FZeJYAKbc214qaZ4nEmK1GkMDasWADfAiLJiElzg8q5LIGYL29fbbeVR
 5JEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ENQeEzKipR32iSVnpoLguB1f+/Jsx8Ew2YSBbNagJBM=;
 b=w2kY9GiCCklaW2rqAYvWQbeOU0aN/EAoluSO+wxEFE6rNKxbNh7TSqXM81//BP/MrS
 HH21PjO5gXXNyIoLMn1FjGao2dNC0AUgaTsJaKJ1vfr+6pw/z6K8bcDXXeNeoplvLExh
 T41SIF/Bhwubq65gNrB3v1B0ixr6V1A9YD9RGlWQXLNy+g/OId0q0w7KN92KpRqheu7V
 fGhwpvTAwrkU5GpVA+bdGW25ZQAGKv6Wa8c3Bk/7F3P3+lITaZpSV7PTADk3yhDJlhkv
 KZXi8Dw3Dm9FzQLfxKwEoxG4e5hr51HsSaENsUvM+xkkjYUX/dgRQtQrPwNeufbkaQur
 4Vlw==
X-Gm-Message-State: AOAM531iOuYqAlDz0KRfeObiwyDX55padQWupM5bDxQStn+0I12xtHu7
 Mqu4LLyYMngmH38ZzANOmtbHF38VOhDZDbl+
X-Google-Smtp-Source: ABdhPJyEcRLRw/QWInB8yb69JLd/Xy+kRUtxNrf9t7Q/XmOLmLeQsly4/yJuY9fiCQUUDvCrXwOVHQ==
X-Received: by 2002:a17:902:864b:b0:14c:d45e:a77b with SMTP id
 y11-20020a170902864b00b0014cd45ea77bmr10683087plt.143.1648200420786; 
 Fri, 25 Mar 2022 02:27:00 -0700 (PDT)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com.
 [209.85.215.178]) by smtp.gmail.com with ESMTPSA id
 e10-20020a17090a630a00b001c685cfd9d1sm5402698pjj.20.2022.03.25.02.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 02:26:59 -0700 (PDT)
Received: by mail-pg1-f178.google.com with SMTP id t4so2907006pgc.1;
 Fri, 25 Mar 2022 02:26:59 -0700 (PDT)
X-Received: by 2002:a63:d23:0:b0:382:70fa:2f0 with SMTP id
 c35-20020a630d23000000b0038270fa02f0mr7149762pgl.181.1648200419210; 
 Fri, 25 Mar 2022 02:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220325085902.29500-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220325085902.29500-1-liweiwei@iscas.ac.cn>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 25 Mar 2022 17:26:47 +0800
X-Gmail-Original-Message-ID: <CANzO1D1UUacJ=aTYTWxX9TCGwFhCeY1u6WMwvL6J3nfOA7eK=Q@mail.gmail.com>
Message-ID: <CANzO1D1UUacJ=aTYTWxX9TCGwFhCeY1u6WMwvL6J3nfOA7eK=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: optimize condition assign for scale < 0
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: multipart/alternative; boundary="000000000000817ef705db079063"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 25 Mar 2022 09:27:04 -0000

--000000000000817ef705db079063
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Fri, Mar 25, 2022 at 5:00 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:

> for some cases, scale is always equal or less than 0, since lmul is not
> larger than 3
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc
> b/target/riscv/insn_trans/trans_rvv.c.inc
> index 4ea7e41e1a..2878ca3132 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1198,7 +1198,7 @@ GEN_LDST_WHOLE_TRANS(vs8r_v, 8, true)
>  static inline uint32_t MAXSZ(DisasContext *s)
>  {
>      int scale = s->lmul - 3;
> -    return scale < 0 ? s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen <<
> scale;
> +    return s->cfg_ptr->vlen >> -scale;
>  }
>
>  static bool opivv_check(DisasContext *s, arg_rmrr *a)
> @@ -3597,8 +3597,7 @@ static bool trans_vrgather_vx(DisasContext *s,
> arg_rmrr *a)
>
>      if (a->vm && s->vl_eq_vlmax) {
>          int scale = s->lmul - (s->sew + 3);
> -        int vlmax = scale < 0 ?
> -                       s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen <<
> scale;
> +        int vlmax = s->cfg_ptr->vlen >> -scale;
>          TCGv_i64 dest = tcg_temp_new_i64();
>
>          if (a->rs1 == 0) {
> @@ -3630,8 +3629,7 @@ static bool trans_vrgather_vi(DisasContext *s,
> arg_rmrr *a)
>
>      if (a->vm && s->vl_eq_vlmax) {
>          int scale = s->lmul - (s->sew + 3);
> -        int vlmax = scale < 0 ?
> -                       s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen <<
> scale;
> +        int vlmax = s->cfg_ptr->vlen >> -scale;
>          if (a->rs1 >= vlmax) {
>              tcg_gen_gvec_dup_imm(MO_64, vreg_ofs(s, a->rd),
>                                   MAXSZ(s), MAXSZ(s), 0);
> --
> 2.17.1
>
>
>

--000000000000817ef705db079063
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"m=
ailto:frank.chang@sifive.com">frank.chang@sifive.com</a>&gt;<br></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar=
 25, 2022 at 5:00 PM Weiwei Li &lt;<a href=3D"mailto:liweiwei@iscas.ac.cn">=
liweiwei@iscas.ac.cn</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">for some cases, scale is always equal or less than 0, s=
ince lmul is not larger than 3<br>
<br>
Signed-off-by: Weiwei Li &lt;<a href=3D"mailto:liweiwei@iscas.ac.cn" target=
=3D"_blank">liweiwei@iscas.ac.cn</a>&gt;<br>
Signed-off-by: Junqiang Wang &lt;<a href=3D"mailto:wangjunqiang@iscas.ac.cn=
" target=3D"_blank">wangjunqiang@iscas.ac.cn</a>&gt;<br>
---<br>
=C2=A0target/riscv/insn_trans/trans_rvv.c.inc | 8 +++-----<br>
=C2=A01 file changed, 3 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tr=
ans/trans_rvv.c.inc<br>
index 4ea7e41e1a..2878ca3132 100644<br>
--- a/target/riscv/insn_trans/trans_rvv.c.inc<br>
+++ b/target/riscv/insn_trans/trans_rvv.c.inc<br>
@@ -1198,7 +1198,7 @@ GEN_LDST_WHOLE_TRANS(vs8r_v, 8, true)<br>
=C2=A0static inline uint32_t MAXSZ(DisasContext *s)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int scale =3D s-&gt;lmul - 3;<br>
-=C2=A0 =C2=A0 return scale &lt; 0 ? s-&gt;cfg_ptr-&gt;vlen &gt;&gt; -scale=
 : s-&gt;cfg_ptr-&gt;vlen &lt;&lt; scale;<br>
+=C2=A0 =C2=A0 return s-&gt;cfg_ptr-&gt;vlen &gt;&gt; -scale;<br>
=C2=A0}<br>
<br>
=C2=A0static bool opivv_check(DisasContext *s, arg_rmrr *a)<br>
@@ -3597,8 +3597,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rm=
rr *a)<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (a-&gt;vm &amp;&amp; s-&gt;vl_eq_vlmax) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int scale =3D s-&gt;lmul - (s-&gt;sew + 3=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int vlmax =3D scale &lt; 0 ?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0s-&gt;cfg_ptr-&gt;vlen &gt;&gt; -scale : s-&gt;cfg_ptr-&gt;vlen &=
lt;&lt; scale;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int vlmax =3D s-&gt;cfg_ptr-&gt;vlen &gt;&gt; =
-scale;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TCGv_i64 dest =3D tcg_temp_new_i64();<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (a-&gt;rs1 =3D=3D 0) {<br>
@@ -3630,8 +3629,7 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rm=
rr *a)<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (a-&gt;vm &amp;&amp; s-&gt;vl_eq_vlmax) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int scale =3D s-&gt;lmul - (s-&gt;sew + 3=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int vlmax =3D scale &lt; 0 ?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0s-&gt;cfg_ptr-&gt;vlen &gt;&gt; -scale : s-&gt;cfg_ptr-&gt;vlen &=
lt;&lt; scale;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int vlmax =3D s-&gt;cfg_ptr-&gt;vlen &gt;&gt; =
-scale;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (a-&gt;rs1 &gt;=3D vlmax) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_gvec_dup_imm(MO_64,=
 vreg_ofs(s, a-&gt;rd),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAXSZ(s), MAXSZ(s), 0);<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000817ef705db079063--

