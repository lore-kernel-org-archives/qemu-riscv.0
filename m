Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njjGA-0001Ol-Rs
	for mharc-qemu-riscv@gnu.org; Wed, 27 Apr 2022 11:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eop.chen@sifive.com>)
 id 1njjG9-0001JU-RF
 for qemu-riscv@nongnu.org; Wed, 27 Apr 2022 11:07:17 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:37434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eop.chen@sifive.com>)
 id 1njjG7-0005VZ-Ca
 for qemu-riscv@nongnu.org; Wed, 27 Apr 2022 11:07:17 -0400
Received: by mail-pf1-x436.google.com with SMTP id bo5so1830951pfb.4
 for <qemu-riscv@nongnu.org>; Wed, 27 Apr 2022 08:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:mime-version:subject:date:references:to:in-reply-to:message-id;
 bh=0mLMpV1szJ86FWHWOv8X9LyOB5naGKsusSiUWVvFvQk=;
 b=WuqN7SDD0GcmYGY97SGxQBKbnluFEaURE6oaB9gTINc1ZTc67T+y71PulH8hbEE2Qu
 ylHS+e8VxxGs9y5EgHKtsVkhS+AaL0Ic5PTRI2Chm7g/CL47lWaSR1zbbvIxZZJtmIIS
 dA3Xb2wsfY5cehrEt0yy9eAkWVQh6QqB8AqdXCS/yfXn/+p6jwCuJa89aJUaqWWUtgbN
 gx9sQWSrd5a4JlyYO0CzB8MPyYSjmmle7kc56oxjMvhhsvxubE4DpHpELppmxrlRjKw+
 b7QNyT3XoqMkx/LXmFnnv0MavX/DKeiiE81bCpjjAW7JzVcFUsrhao1Qk22mH02mUVs+
 YGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:subject:date:references:to
 :in-reply-to:message-id;
 bh=0mLMpV1szJ86FWHWOv8X9LyOB5naGKsusSiUWVvFvQk=;
 b=RQC74JYWJDd0onxhcxgVijJHb3zqiw4rgdUYHz227h6a5W9lREctEjc5VCOONEXwNx
 I1FeyEkv2X2g6kksaIIK12/ja2qCBVPJ/J1HP92vpvTgvCgeGcSuWFmGn7FyZFyF2yA6
 6CQ6DGyyWJxNPB5vr/pYYyhfeRvkAyLCJDx67zYklNAadB1+WwOFCJez7SumvUbZIbXV
 EhiGk7LznxwjybmpsWhyjxc5GI1TnAgIKnTOap8qHTNrllUxaLZ/+3mGoJmUEfKiRn4y
 sntjUmLohF1BIVSut9iOLr8cQaVn8BVLVHA9scgtUo6lY9ogg7eIA8PEfN13AdXQwOHc
 nr5A==
X-Gm-Message-State: AOAM533GcClOaUD15aAt2ntYHf+NaapzgARx7vBUF3CxXxeDtr03SUqV
 +e297Z/W6urJnA5LHnvpIc32Tw==
X-Google-Smtp-Source: ABdhPJyv5/aYj+pOCHq7m3fuKAiOrS3HrjbDXLTQMwdhA2E+R13PBiMoEocmpMI4GB0roGmMSqXfvA==
X-Received: by 2002:a63:87c2:0:b0:3ab:2425:a21e with SMTP id
 i185-20020a6387c2000000b003ab2425a21emr15383101pge.53.1651072033696; 
 Wed, 27 Apr 2022 08:07:13 -0700 (PDT)
Received: from smtpclient.apple
 (2001-b400-e235-7644-f067-af7f-d60d-f201.emome-ip6.hinet.net.
 [2001:b400:e235:7644:f067:af7f:d60d:f201])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a621b0b000000b00505c6892effsm18945915pfb.26.2022.04.27.08.07.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Apr 2022 08:07:12 -0700 (PDT)
From: eop Chen <eop.chen@sifive.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_ED4F7D08-7B72-481B-91EA-82188FE2F246"
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH qemu v9 05/14] target/riscv: rvv: Add tail agnostic for
 vector load / store instructions
Date: Wed, 27 Apr 2022 23:07:09 +0800
References: <165105385811.8013.9841879319865783070-5@git.sr.ht>
 <7b28461b-641e-210f-e156-75e02064a61b@iscas.ac.cn>
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
In-Reply-To: <7b28461b-641e-210f-e156-75e02064a61b@iscas.ac.cn>
Message-Id: <6004571B-E27F-4CA7-B5BC-3AAA6271F6D8@sifive.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=eop.chen@sifive.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 27 Apr 2022 15:07:18 -0000


--Apple-Mail=_ED4F7D08-7B72-481B-91EA-82188FE2F246
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> Weiwei Li <liweiwei@iscas.ac.cn> =E6=96=BC 2022=E5=B9=B44=E6=9C=8827=E6=97=
=A5 =E4=B8=8B=E5=8D=887:55 =E5=AF=AB=E9=81=93=EF=BC=9A
>=20
>=20
> =E5=9C=A8 2022/3/7 =E4=B8=8B=E5=8D=883:10, ~eopxd =E5=86=99=E9=81=93:
>> From: eopXD <eop.chen@sifive.com>
>>=20
>> Destination register of unit-stride mask load and store instructions =
are
>> always written with a tail-agnostic policy.
>>=20
>> Signed-off-by: eop Chen <eop.chen@sifive.com>
>> Reviewed-by: Frank Chang <frank.chang@sifive.com>
>> ---
>>  target/riscv/insn_trans/trans_rvv.c.inc | 11 ++++++++++
>>  target/riscv/vector_helper.c            | 28 =
+++++++++++++++++++++++++
>>  2 files changed, 39 insertions(+)
>>=20
>> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc =
b/target/riscv/insn_trans/trans_rvv.c.inc
>> index cc80bf00ff..99691f1b9f 100644
>> --- a/target/riscv/insn_trans/trans_rvv.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
>> @@ -711,6 +711,7 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm =
*a, uint8_t eew)
>>      data =3D FIELD_DP32(data, VDATA, VM, a->vm);
>>      data =3D FIELD_DP32(data, VDATA, LMUL, emul);
>>      data =3D FIELD_DP32(data, VDATA, NF, a->nf);
>> +    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
>>      return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
>>  }
>>  @@ -748,6 +749,7 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm =
*a, uint8_t eew)
>>      data =3D FIELD_DP32(data, VDATA, VM, a->vm);
>>      data =3D FIELD_DP32(data, VDATA, LMUL, emul);
>>      data =3D FIELD_DP32(data, VDATA, NF, a->nf);
>> +    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
>>      return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
>>  }
>>  @@ -774,6 +776,8 @@ static bool ld_us_mask_op(DisasContext *s, =
arg_vlm_v *a, uint8_t eew)
>>      /* EMUL =3D 1, NFIELDS =3D 1 */
>>      data =3D FIELD_DP32(data, VDATA, LMUL, 0);
>>      data =3D FIELD_DP32(data, VDATA, NF, 1);
>> +    /* Mask destination register are always tail-agnostic */
>> +    data =3D FIELD_DP32(data, VDATA, VTA, s->cfg_vta_all_1s);
>>      return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
>>  }
>>  @@ -791,6 +795,8 @@ static bool st_us_mask_op(DisasContext *s, =
arg_vsm_v *a, uint8_t eew)
>>      /* EMUL =3D 1, NFIELDS =3D 1 */
>>      data =3D FIELD_DP32(data, VDATA, LMUL, 0);
>>      data =3D FIELD_DP32(data, VDATA, NF, 1);
>> +    /* Mask destination register are always tail-agnostic */
>> +    data =3D FIELD_DP32(data, VDATA, VTA, s->cfg_vta_all_1s);
>>      return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
>>  }
>>  @@ -862,6 +868,7 @@ static bool ld_stride_op(DisasContext *s, =
arg_rnfvm *a, uint8_t eew)
>>      data =3D FIELD_DP32(data, VDATA, VM, a->vm);
>>      data =3D FIELD_DP32(data, VDATA, LMUL, emul);
>>      data =3D FIELD_DP32(data, VDATA, NF, a->nf);
>> +    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
>>      return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, =
false);
>>  }
>>  @@ -891,6 +898,7 @@ static bool st_stride_op(DisasContext *s, =
arg_rnfvm *a, uint8_t eew)
>>      data =3D FIELD_DP32(data, VDATA, VM, a->vm);
>>      data =3D FIELD_DP32(data, VDATA, LMUL, emul);
>>      data =3D FIELD_DP32(data, VDATA, NF, a->nf);
>> +    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
>>      fn =3D fns[eew];
>>      if (fn =3D=3D NULL) {
>>          return false;
>> @@ -991,6 +999,7 @@ static bool ld_index_op(DisasContext *s, =
arg_rnfvm *a, uint8_t eew)
>>      data =3D FIELD_DP32(data, VDATA, VM, a->vm);
>>      data =3D FIELD_DP32(data, VDATA, LMUL, emul);
>>      data =3D FIELD_DP32(data, VDATA, NF, a->nf);
>> +    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
>>      return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, =
false);
>>  }
>>  @@ -1043,6 +1052,7 @@ static bool st_index_op(DisasContext *s, =
arg_rnfvm *a, uint8_t eew)
>>      data =3D FIELD_DP32(data, VDATA, VM, a->vm);
>>      data =3D FIELD_DP32(data, VDATA, LMUL, emul);
>>      data =3D FIELD_DP32(data, VDATA, NF, a->nf);
>> +    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
>>      return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, =
true);
>>  }
>>  @@ -1108,6 +1118,7 @@ static bool ldff_op(DisasContext *s, =
arg_r2nfvm *a, uint8_t eew)
>>      data =3D FIELD_DP32(data, VDATA, VM, a->vm);
>>      data =3D FIELD_DP32(data, VDATA, LMUL, emul);
>>      data =3D FIELD_DP32(data, VDATA, NF, a->nf);
>> +    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
>>      return ldff_trans(a->rd, a->rs1, data, fn, s);
>>  }
>>  diff --git a/target/riscv/vector_helper.c =
b/target/riscv/vector_helper.c
>> index 396e252179..1541d97b08 100644
>> --- a/target/riscv/vector_helper.c
>> +++ b/target/riscv/vector_helper.c
>> @@ -270,6 +270,8 @@ vext_ldst_stride(void *vd, void *v0, target_ulong =
base,
>>      uint32_t i, k;
>>      uint32_t nf =3D vext_nf(desc);
>>      uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
>> +    uint32_t esz =3D 1 << log2_esz;
>> +    uint32_t vta =3D vext_vta(desc);
>>        for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
>>          if (!vm && !vext_elem_mask(v0, i)) {
>> @@ -284,6 +286,11 @@ vext_ldst_stride(void *vd, void *v0, =
target_ulong base,
>>          }
>>      }
>>      env->vstart =3D 0;
>> +    /* set tail elements to 1s */
>> +    for (k =3D 0; k < nf; ++k) {
>> +        vext_set_elems_1s(vd, vta, env->vl * esz + k * max_elems,
>> +                          max_elems * esz + k * max_elems);
>> +    }
>>  }
>=20
> It seems incorrect here. I think it should be  k * max_elems * esz. =
The same to following similar case.
>=20
> Otherwise, this patchset looks good to me.
>=20
> Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>
>=20
> Regards,
> Weiwei Li
>=20

I have just sent a new version to correct this.
Thank you for your patient review.

Regards,

eop Chen


--Apple-Mail=_ED4F7D08-7B72-481B-91EA-82188FE2F246
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><div =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Weiwei Li &lt;<a href=3D"mailto:liweiwei@iscas.ac.cn" =
class=3D"">liweiwei@iscas.ac.cn</a>&gt; =E6=96=BC 2022=E5=B9=B44=E6=9C=882=
7=E6=97=A5 =E4=B8=8B=E5=8D=887:55 =E5=AF=AB=E9=81=93=EF=BC=9A</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D""><br =
class=3D"">=E5=9C=A8 2022/3/7 =E4=B8=8B=E5=8D=883:10, ~eopxd =E5=86=99=E9=81=
=93:<br class=3D""><blockquote type=3D"cite" class=3D"">From: eopXD =
&lt;<a href=3D"mailto:eop.chen@sifive.com" =
class=3D"">eop.chen@sifive.com</a>&gt;<br class=3D""><br =
class=3D"">Destination register of unit-stride mask load and store =
instructions are<br class=3D"">always written with a tail-agnostic =
policy.<br class=3D""><br class=3D"">Signed-off-by: eop Chen &lt;<a =
href=3D"mailto:eop.chen@sifive.com" =
class=3D"">eop.chen@sifive.com</a>&gt;<br class=3D"">Reviewed-by: Frank =
Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" =
class=3D"">frank.chang@sifive.com</a>&gt;<br class=3D"">---<br class=3D"">=
 &nbsp;target/riscv/insn_trans/trans_rvv.c.inc | 11 ++++++++++<br =
class=3D""> &nbsp;target/riscv/vector_helper.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 28 =
+++++++++++++++++++++++++<br class=3D""> &nbsp;2 files changed, 39 =
insertions(+)<br class=3D""><br class=3D"">diff --git =
a/target/riscv/insn_trans/trans_rvv.c.inc =
b/target/riscv/insn_trans/trans_rvv.c.inc<br class=3D"">index =
cc80bf00ff..99691f1b9f 100644<br class=3D"">--- =
a/target/riscv/insn_trans/trans_rvv.c.inc<br class=3D"">+++ =
b/target/riscv/insn_trans/trans_rvv.c.inc<br class=3D"">@@ -711,6 +711,7 =
@@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, =
VDATA, VM, a-&gt;vm);<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =
=3D FIELD_DP32(data, VDATA, LMUL, emul);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, VDATA, NF, =
a-&gt;nf);<br class=3D"">+ &nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, =
VDATA, VTA, s-&gt;vta);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ldst_us_trans(a-&gt;rd, a-&gt;rs1, =
data, fn, s, false);<br class=3D""> &nbsp;}<br class=3D""> &nbsp;@@ =
-748,6 +749,7 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, =
uint8_t eew)<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D =
FIELD_DP32(data, VDATA, VM, a-&gt;vm);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, VDATA, LMUL, =
emul);<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D =
FIELD_DP32(data, VDATA, NF, a-&gt;nf);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, VDATA, VTA, s-&gt;vta);<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ldst_us_trans(a-&gt;rd, =
a-&gt;rs1, data, fn, s, true);<br class=3D""> &nbsp;}<br class=3D""> =
&nbsp;@@ -774,6 +776,8 @@ static bool ld_us_mask_op(DisasContext *s, =
arg_vlm_v *a, uint8_t eew)<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* EMUL =3D 1, NFIELDS =3D 1 */<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, =
VDATA, LMUL, 0);<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D =
FIELD_DP32(data, VDATA, NF, 1);<br class=3D"">+ &nbsp;&nbsp;&nbsp;/* =
Mask destination register are always tail-agnostic */<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, VDATA, VTA, =
s-&gt;cfg_vta_all_1s);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ldst_us_trans(a-&gt;rd, a-&gt;rs1, =
data, fn, s, false);<br class=3D""> &nbsp;}<br class=3D""> &nbsp;@@ =
-791,6 +795,8 @@ static bool st_us_mask_op(DisasContext *s, arg_vsm_v =
*a, uint8_t eew)<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* EMUL =3D =
1, NFIELDS =3D 1 */<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D =
FIELD_DP32(data, VDATA, LMUL, 0);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, VDATA, NF, =
1);<br class=3D"">+ &nbsp;&nbsp;&nbsp;/* Mask destination register are =
always tail-agnostic */<br class=3D"">+ &nbsp;&nbsp;&nbsp;data =3D =
FIELD_DP32(data, VDATA, VTA, s-&gt;cfg_vta_all_1s);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ldst_us_trans(a-&gt;rd, a-&gt;rs1, =
data, fn, s, true);<br class=3D""> &nbsp;}<br class=3D""> &nbsp;@@ =
-862,6 +868,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, =
uint8_t eew)<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D =
FIELD_DP32(data, VDATA, VM, a-&gt;vm);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, VDATA, LMUL, =
emul);<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D =
FIELD_DP32(data, VDATA, NF, a-&gt;nf);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, VDATA, VTA, s-&gt;vta);<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
ldst_stride_trans(a-&gt;rd, a-&gt;rs1, a-&gt;rs2, data, fn, s, =
false);<br class=3D""> &nbsp;}<br class=3D""> &nbsp;@@ -891,6 +898,7 @@ =
static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, =
VDATA, VM, a-&gt;vm);<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =
=3D FIELD_DP32(data, VDATA, LMUL, emul);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, VDATA, NF, =
a-&gt;nf);<br class=3D"">+ &nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, =
VDATA, VTA, s-&gt;vta);<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fn =
=3D fns[eew];<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (fn =3D=3D =
NULL) {<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return false;<br =
class=3D"">@@ -991,6 +999,7 @@ static bool ld_index_op(DisasContext *s, =
arg_rnfvm *a, uint8_t eew)<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, VDATA, VM, =
a-&gt;vm);<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D =
FIELD_DP32(data, VDATA, LMUL, emul);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, VDATA, NF, =
a-&gt;nf);<br class=3D"">+ &nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, =
VDATA, VTA, s-&gt;vta);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ldst_index_trans(a-&gt;rd, =
a-&gt;rs1, a-&gt;rs2, data, fn, s, false);<br class=3D""> &nbsp;}<br =
class=3D""> &nbsp;@@ -1043,6 +1052,7 @@ static bool =
st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, VDATA, VM, =
a-&gt;vm);<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D =
FIELD_DP32(data, VDATA, LMUL, emul);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, VDATA, NF, =
a-&gt;nf);<br class=3D"">+ &nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, =
VDATA, VTA, s-&gt;vta);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ldst_index_trans(a-&gt;rd, =
a-&gt;rs1, a-&gt;rs2, data, fn, s, true);<br class=3D""> &nbsp;}<br =
class=3D""> &nbsp;@@ -1108,6 +1118,7 @@ static bool ldff_op(DisasContext =
*s, arg_r2nfvm *a, uint8_t eew)<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, VDATA, VM, =
a-&gt;vm);<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D =
FIELD_DP32(data, VDATA, LMUL, emul);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, VDATA, NF, =
a-&gt;nf);<br class=3D"">+ &nbsp;&nbsp;&nbsp;data =3D FIELD_DP32(data, =
VDATA, VTA, s-&gt;vta);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ldff_trans(a-&gt;rd, a-&gt;rs1, =
data, fn, s);<br class=3D""> &nbsp;}<br class=3D""> &nbsp;diff --git =
a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c<br =
class=3D"">index 396e252179..1541d97b08 100644<br class=3D"">--- =
a/target/riscv/vector_helper.c<br class=3D"">+++ =
b/target/riscv/vector_helper.c<br class=3D"">@@ -270,6 +270,8 @@ =
vext_ldst_stride(void *vd, void *v0, target_ulong base,<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t i, k;<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t nf =3D vext_nf(desc);<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t max_elems =3D =
vext_max_elems(desc, log2_esz);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;uint32_t esz =3D 1 &lt;&lt; log2_esz;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;uint32_t vta =3D vext_vta(desc);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for (i =3D env-&gt;vstart; i =
&lt; env-&gt;vl; i++, env-&gt;vstart++) {<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (!vm &amp;&amp; =
!vext_elem_mask(v0, i)) {<br class=3D"">@@ -284,6 +286,11 @@ =
vext_ldst_stride(void *vd, void *v0, target_ulong base,<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;env-&gt;vstart =3D 0;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;/* set tail elements to 1s */<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;for (k =3D 0; k &lt; nf; ++k) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;vext_set_elems_1s(vd, vta, =
env-&gt;vl * esz + k * max_elems,<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;max_elems * esz + k * max_elems);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;}<br class=3D""> &nbsp;}<br class=3D""></blockquote><br =
class=3D"">It seems incorrect here. I think it should be&nbsp; k * =
max_elems * esz. The same to following similar case.<br class=3D""><br =
class=3D"">Otherwise, this patchset looks good to me.<br class=3D""><br =
class=3D"">Reviewed-by: Weiwei Li&lt;<a =
href=3D"mailto:liweiwei@iscas.ac.cn" =
class=3D"">liweiwei@iscas.ac.cn</a>&gt;<br class=3D""><br =
class=3D"">Regards,<br class=3D"">Weiwei Li<br class=3D""><br =
class=3D""></div></div></blockquote></div><br class=3D""></div><div =
class=3D"">I have just sent a new version to correct this.<div =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);" class=3D"">Thank you for your patient review.</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D""></div></div></div><div class=3D""><span style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><br =
class=3D""></span></div><div class=3D""><span style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">Regards,</span></div><div =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);" class=3D""><br class=3D""></span></div><div class=3D""><font =
color=3D"#000000" class=3D""><span style=3D"caret-color: rgb(0, 0, 0);" =
class=3D"">eop Chen</span></font></div><div class=3D""><font =
color=3D"#000000" class=3D""><span style=3D"caret-color: rgb(0, 0, 0);" =
class=3D""><br class=3D""></span></font></div></body></html>=

--Apple-Mail=_ED4F7D08-7B72-481B-91EA-82188FE2F246--

