Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZSyK-0006gO-Gv
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 03:42:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yueh.ting.chen@gmail.com>)
 id 1nZSyJ-0006gB-73; Wed, 30 Mar 2022 03:42:27 -0400
Received: from [2607:f8b0:4864:20::1033] (port=42927
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yueh.ting.chen@gmail.com>)
 id 1nZSyH-0003R3-2A; Wed, 30 Mar 2022 03:42:26 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 o3-20020a17090a3d4300b001c6bc749227so5381103pjf.1; 
 Wed, 30 Mar 2022 00:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:mime-version:subject:date:references:to:in-reply-to:message-id;
 bh=jg3+NDV+L5AXOjCA+cfkXG6j5AtPorIKruA7LCtx0wM=;
 b=cGNmlNM1OM64KCS6ciEzM8wZ/S0WfWg/aj7kpVregXo1CtbngAcHggUZAtLX386SOX
 bqIw3F30+d0Gu/Y+XXwrq4WEOgNbsBa1GZbblloUq/rzRgNKThHkT5apB1ccKVFJQeV8
 yGTZwvce2mQJD8UMsmgcNngzm6mexwEAqhJBV6NhIw24PwPai+rnQJQuGJCWgy/OkjnF
 LJXJHl5K+n52c4KtBAW56pM93tDeg+R4NOkjEwpXBnBhcW3EGMST2qmDvQyo8d2I4Kag
 zTG2su4zgkRd+0zDAlsooZqZuoYio+uCSd4FplzGAhkuasyXGPkwibvbMp9jek0PoaAc
 QTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:subject:date:references:to
 :in-reply-to:message-id;
 bh=jg3+NDV+L5AXOjCA+cfkXG6j5AtPorIKruA7LCtx0wM=;
 b=EU1V73RHvO3ySZIL6DXcvEQ97BFrECUWJhWcOR2kjKAv2TunaJ6zHXXiT4JzHEo9wE
 NrE0dKhgD1wQsH/IOjjA9CDZliwmpzmwIBPIdpDnahd0z+W0Wgt/etmeotCrp6C5e+uX
 3F9ftTjcHbIPKRfiCRpe05tlcxYsqk9hkjN4zcMCjv0WYDxdipp2CPmHZ8YZC8ncbfDt
 MfDT662WoBgikFjoRjztg7JtFNzUk3L8+K1MndWRtH+9le+hcKSXpKwE9hNxTpGZyn9P
 U7Fqyj/FZ9kADU/EN0P3XdJ0U4e99QxYcIUocp8KI9K++3O2hJJHtthTsTK5+i/iXS/q
 +qag==
X-Gm-Message-State: AOAM531oZwClo1l6GUN34UQEWYV+e3PXO2lyJuQ/GR2itHs47uZdfNDy
 2jnIzx6jp8l72WnYlS5q20w=
X-Google-Smtp-Source: ABdhPJwDE3xmz5OAnTbdzY7G42WTbXFCLO2TXpIWxw+JPSNgAbvCnTxAVTp9eUFnkJsdHT6WRHwtQw==
X-Received: by 2002:a17:90a:b008:b0:1c7:8810:a08d with SMTP id
 x8-20020a17090ab00800b001c78810a08dmr3503067pjq.181.1648626142756; 
 Wed, 30 Mar 2022 00:42:22 -0700 (PDT)
Received: from smtpclient.apple
 (2001-b400-e289-e64b-5086-f43b-5323-ad33.emome-ip6.hinet.net.
 [2001:b400:e289:e64b:5086:f43b:5323:ad33])
 by smtp.gmail.com with ESMTPSA id
 16-20020a17090a005000b001c7511dc31esm5284219pjb.41.2022.03.30.00.42.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Mar 2022 00:42:22 -0700 (PDT)
From: =?utf-8?B?6Zmz57SE5bu3?= <yueh.ting.chen@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_BD9534A0-276D-454B-8BD3-BC15B38E44BE"
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH qemu v5 05/14] target/riscv: rvv: Add tail agnostic for
 vector load / store instructions
Date: Wed, 30 Mar 2022 15:42:16 +0800
References: <164845204233.25323.14607469451359734000-5@git.sr.ht>
 <7f3c995d-182f-f1b3-4e79-94f5b81e1be9@iscas.ac.cn>
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
In-Reply-To: <7f3c995d-182f-f1b3-4e79-94f5b81e1be9@iscas.ac.cn>
Message-Id: <BC7B9267-08F4-4CF0-9BAD-52CF8DA2DCC2@gmail.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=yueh.ting.chen@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 30 Mar 2022 07:42:27 -0000


--Apple-Mail=_BD9534A0-276D-454B-8BD3-BC15B38E44BE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> Weiwei Li <liweiwei@iscas.ac.cn> =E6=96=BC 2022=E5=B9=B43=E6=9C=8828=E6=97=
=A5 =E4=B8=8B=E5=8D=887:56 =E5=AF=AB=E9=81=93=EF=BC=9A
>=20
>=20
> =E5=9C=A8 2022/3/7 =E4=B8=8B=E5=8D=883:10, ~eopxd =E5=86=99=E9=81=93:
>> From: eopXD <eop.chen@sifive.com>
>>=20
>> Signed-off-by: eop Chen <eop.chen@sifive.com>
>> Reviewed-by: Frank Chang <frank.chang@sifive.com>
>> ---
>>  target/riscv/insn_trans/trans_rvv.c.inc |  9 +++++++
>>  target/riscv/vector_helper.c            | 32 =
+++++++++++++++++++++++++
>>  2 files changed, 41 insertions(+)
>>=20
>>  diff --git a/target/riscv/vector_helper.c =
b/target/riscv/vector_helper.c
>> index 39c79c59c2..1c7015e917 100644
>> --- a/target/riscv/vector_helper.c
>> +++ b/target/riscv/vector_helper.c
>> @@ -289,6 +289,9 @@ vext_ldst_stride(void *vd, void *v0, target_ulong =
base,
>>      uint32_t i, k;
>>      uint32_t nf =3D vext_nf(desc);
>>      uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
>> +    uint32_t esz =3D 1 << log2_esz;
>> +    uint32_t total_elems =3D vext_get_total_elems(desc, esz);
>> +    uint32_t vta =3D vext_vta(desc);
>>        for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
>>          if (!vm && !vext_elem_mask(v0, i)) {
>> @@ -303,6 +306,11 @@ vext_ldst_stride(void *vd, void *v0, =
target_ulong base,
>>          }
>>      }
>>      env->vstart =3D 0;
>> +    /* set tail elements to 1s */
>> +    for (k =3D 0; k < nf; ++k) {
>> +        vext_set_elems_1s_fns[log2_esz](vd, vta, env->vl + k * =
total_elems,
>> +                                        env->vl * esz, total_elems * =
esz);
>> +    }
>>  }
>>    #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                   =
     \
>> @@ -348,6 +356,9 @@ vext_ldst_us(void *vd, target_ulong base, =
CPURISCVState *env, uint32_t desc,
>>      uint32_t i, k;
>>      uint32_t nf =3D vext_nf(desc);
>>      uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
>> +    uint32_t esz =3D 1 << log2_esz;
>> +    uint32_t total_elems =3D vext_get_total_elems(desc, esz);
>> +    uint32_t vta =3D vext_vta(desc);
>>        /* load bytes from guest memory */
>>      for (i =3D env->vstart; i < evl; i++, env->vstart++) {
>> @@ -359,6 +370,11 @@ vext_ldst_us(void *vd, target_ulong base, =
CPURISCVState *env, uint32_t desc,
>>          }
>>      }
>>      env->vstart =3D 0;
>> +    /* set tail elements to 1s */
>> +    for (k =3D 0; k < nf; ++k) {
>> +        vext_set_elems_1s_fns[log2_esz](vd, vta, env->vl + k * =
total_elems,
>> +                                        env->vl * esz, total_elems * =
esz);
>> +    }
>>  }
>> =20
>=20
> It seems incorrect here. similar to following load/store helper.
>=20
> In above instructions,  following elements are loaded:
>=20
> 0       *  max_elems          ...     0      *max_elems + vl - 1
>=20
> 1       *  max_elems          ...     1     *max_elems + vl - 1
>=20
> .......
>=20
> (nf-1)* max_elems         ...    (nf-1)*max_elems + vl - 1
>=20
> So,  the elements[vl  .. max_elems  - 1]  are  tail elements, however =
elements[vl ... 1* total_elems - 1] may not:
>=20
> elements from max_elems to total_elems - 1 are active elements, If =
total_elems > max_elems(LMUL< 1)
>=20
> Or LMUL should be equal or greater than 1 here? I didn't find any =
description about this from the spec.
>=20
> I also have another question about the tail elements for these =
load/store instructions:
>=20
> when nf =3D 3, LMUL =3D 1, vl=3Dvlmax,  reg, reg+1, reg+2 will be =
loaded, then whether elements in reg+3
>=20
> (if they belong to the same register group) are tail elements?
>=20
> Regards,
>=20
> Weiwei Li
>=20

The LMUL sent into vector helper function from `trans_rvv.c.inc` takes =
EMUL
(effective LMUL) instead of LMUL. Take trans_rvv.c.inc::ld_us_op for =
example,

```
    /*
     * Vector load/store instructions have the EEW encoded
     * directly in the instructions. The maximum vector size is
     * calculated with EMUL rather than LMUL.
     */
    uint8_t emul =3D vext_get_emul(s, eew);
    data =3D FIELD_DP32(data, VDATA, VM, a->vm);
    data =3D FIELD_DP32(data, VDATA, LMUL, emul);
    data =3D FIELD_DP32(data, VDATA, NF, a->nf);
    return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
```

And vext_get_emul always return something at least the length of a =
vector register:

```
static uint8_t vext_get_emul(DisasContext *s, uint8_t eew)
{
    int8_t emul =3D eew - s->sew + s->lmul;
    return emul < 0 ? 0 : emul;
}

```

In this case I guess the naming is a little bit misleading, =
`vext_max_elems` would be
equivalent to `vext_get_total_elems` for all load / store instructions, =
which guarantees
That LMUL is always equal or greater to 1. In conclusion, the behavior =
is correct here.

I don=E2=80=99t understand your second question though. If nf =3D 3, =
there will be 3 registers
involved with the instruction (namely reg, reg+1, reg+2). Why do we care =
about
(reg+3)?

Thanks for pointing out this question and all your efforts for =
reviewing. I really
appreciate it.

Regards,

eop Chen


--Apple-Mail=_BD9534A0-276D-454B-8BD3-BC15B38E44BE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Weiwei Li &lt;<a href=3D"mailto:liweiwei@iscas.ac.cn" =
class=3D"">liweiwei@iscas.ac.cn</a>&gt; =E6=96=BC 2022=E5=B9=B43=E6=9C=882=
8=E6=97=A5 =E4=B8=8B=E5=8D=887:56 =E5=AF=AB=E9=81=93=EF=BC=9A</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D""><br =
class=3D"">=E5=9C=A8 2022/3/7 =E4=B8=8B=E5=8D=883:10, ~eopxd =E5=86=99=E9=81=
=93:<br class=3D""><blockquote type=3D"cite" class=3D"">From: eopXD =
&lt;<a href=3D"mailto:eop.chen@sifive.com" =
class=3D"">eop.chen@sifive.com</a>&gt;<br class=3D""><br =
class=3D"">Signed-off-by: eop Chen &lt;<a =
href=3D"mailto:eop.chen@sifive.com" =
class=3D"">eop.chen@sifive.com</a>&gt;<br class=3D"">Reviewed-by: Frank =
Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" =
class=3D"">frank.chang@sifive.com</a>&gt;<br class=3D"">---<br class=3D"">=
 &nbsp;target/riscv/insn_trans/trans_rvv.c.inc | &nbsp;9 +++++++<br =
class=3D""> &nbsp;target/riscv/vector_helper.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 32 =
+++++++++++++++++++++++++<br class=3D""> &nbsp;2 files changed, 41 =
insertions(+)<br class=3D""><br class=3D"">&nbsp;diff --git =
a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c<br =
class=3D"">index 39c79c59c2..1c7015e917 100644<br class=3D"">--- =
a/target/riscv/vector_helper.c<br class=3D"">+++ =
b/target/riscv/vector_helper.c<br class=3D"">@@ -289,6 +289,9 @@ =
vext_ldst_stride(void *vd, void *v0, target_ulong base,<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t i, k;<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t nf =3D vext_nf(desc);<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t max_elems =3D =
vext_max_elems(desc, log2_esz);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;uint32_t esz =3D 1 &lt;&lt; log2_esz;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;uint32_t total_elems =3D vext_get_total_elems(desc, =
esz);<br class=3D"">+ &nbsp;&nbsp;&nbsp;uint32_t vta =3D =
vext_vta(desc);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for (i =3D env-&gt;vstart; i =
&lt; env-&gt;vl; i++, env-&gt;vstart++) {<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (!vm &amp;&amp; =
!vext_elem_mask(v0, i)) {<br class=3D"">@@ -303,6 +306,11 @@ =
vext_ldst_stride(void *vd, void *v0, target_ulong base,<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;env-&gt;vstart =3D 0;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;/* set tail elements to 1s */<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;for (k =3D 0; k &lt; nf; ++k) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;vext_set_elems_1s_fns[log2_esz](=
vd, vta, env-&gt;vl + k * total_elems,<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;env-&gt;vl * esz, total_elems * esz);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;}<br class=3D""> &nbsp;}<br class=3D""> =
&nbsp;&nbsp;&nbsp;#define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN) =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\<br =
class=3D"">@@ -348,6 +356,9 @@ vext_ldst_us(void *vd, target_ulong base, =
CPURISCVState *env, uint32_t desc,<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t i, k;<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t nf =3D vext_nf(desc);<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t max_elems =3D =
vext_max_elems(desc, log2_esz);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;uint32_t esz =3D 1 &lt;&lt; log2_esz;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;uint32_t total_elems =3D vext_get_total_elems(desc, =
esz);<br class=3D"">+ &nbsp;&nbsp;&nbsp;uint32_t vta =3D =
vext_vta(desc);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* load bytes from guest =
memory */<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for (i =3D =
env-&gt;vstart; i &lt; evl; i++, env-&gt;vstart++) {<br class=3D"">@@ =
-359,6 +370,11 @@ vext_ldst_us(void *vd, target_ulong base, =
CPURISCVState *env, uint32_t desc,<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;env-&gt;vstart =3D 0;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;/* set tail elements to 1s */<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;for (k =3D 0; k &lt; nf; ++k) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;vext_set_elems_1s_fns[log2_esz](=
vd, vta, env-&gt;vl + k * total_elems,<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;env-&gt;vl * esz, total_elems * esz);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;}<br class=3D""> &nbsp;}<br class=3D""> &nbsp;<br =
class=3D""></blockquote><br class=3D"">It seems incorrect here. similar =
to following load/store helper.<br class=3D""><br class=3D"">In above =
instructions,&nbsp; following elements are loaded:<br class=3D""><br =
class=3D"">0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp; =
max_elems&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ... =
&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *max_elems + vl - =
1<br class=3D""><br class=3D"">1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
*&nbsp; max_elems&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
... &nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp; *max_elems + vl - 1<br =
class=3D""><br class=3D"">.......<br class=3D""><br class=3D"">(nf-1)* =
max_elems&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
...&nbsp;&nbsp;&nbsp; (nf-1)*max_elems + vl - 1<br class=3D""><br =
class=3D"">So,&nbsp; the elements[vl&nbsp; .. max_elems&nbsp; - 1]&nbsp; =
are&nbsp; tail elements, however elements[vl ... 1* total_elems - 1] may =
not:<br class=3D""><br class=3D"">elements from max_elems to total_elems =
- 1 are active elements, If total_elems &gt; max_elems(LMUL&lt; 1)<br =
class=3D""><br class=3D"">Or LMUL should be equal or greater than 1 =
here? I didn't find any description about this from the spec.<br =
class=3D""><br class=3D"">I also have another question about the tail =
elements for these load/store instructions:<br class=3D""><br =
class=3D"">when nf =3D 3, LMUL =3D 1, vl=3Dvlmax,&nbsp; reg, reg+1, =
reg+2 will be loaded, then whether elements in reg+3<br class=3D""><br =
class=3D"">(if they belong to the same register group) are tail =
elements?<br class=3D""><br class=3D"">Regards,<br class=3D""><br =
class=3D"">Weiwei Li<br class=3D""><br =
class=3D""></div></div></blockquote></div><br class=3D""><div =
class=3D"">The LMUL sent into vector helper function from =
`trans_rvv.c.inc` takes EMUL</div><div class=3D"">(effective LMUL) =
instead of LMUL. Take trans_rvv.c.inc::ld_us_op for example,</div><div =
class=3D""><br class=3D""></div><div class=3D"">```</div><div =
class=3D""><div style=3D"color: rgb(54, 54, 54); font-family: Menlo, =
Monaco, &quot;Courier New&quot;, monospace; line-height: 18px; =
white-space: pre;" class=3D""><div class=3D""><span =
style=3D"background-color: rgba(255, 255, 255, 0);" class=3D"">    <span =
style=3D"color: rgb(146, 205, 120);" class=3D"">/*</span></span></div><div=
 class=3D""><span style=3D"color: rgb(146, 205, 120); background-color: =
rgba(255, 255, 255, 0);" class=3D"">     * Vector load/store =
instructions have the EEW encoded</span></div><div class=3D""><span =
style=3D"color: rgb(146, 205, 120); background-color: rgba(255, 255, =
255, 0);" class=3D"">     * directly in the instructions. The maximum =
vector size is</span></div><div class=3D""><span style=3D"color: =
rgb(146, 205, 120); background-color: rgba(255, 255, 255, 0);" class=3D"">=
     * calculated with EMUL rather than LMUL.</span></div><div =
class=3D""><span style=3D"color: rgb(146, 205, 120); background-color: =
rgba(255, 255, 255, 0);" class=3D"">     */</span></div><div =
class=3D""><span style=3D"background-color: rgba(255, 255, 255, 0);" =
class=3D"">    <span style=3D"color: rgb(63, 151, 223);" =
class=3D"">uint8_t</span> emul =3D <span style=3D"color: rgb(99, 99, =
36);" class=3D"">vext_get_emul</span>(s, eew);</span></div><div =
class=3D""><span style=3D"background-color: rgba(255, 255, 255, 0);" =
class=3D"">    data =3D <span style=3D"color: rgb(63, 151, 223);" =
class=3D"">FIELD_DP32</span>(data, VDATA, VM, <span style=3D"color: =
rgb(9, 89, 132);" class=3D"">a</span>-&gt;<span style=3D"color: rgb(9, =
89, 132);" class=3D"">vm</span>);</span></div><div class=3D""><span =
style=3D"background-color: rgba(255, 255, 255, 0);" class=3D"">    data =
=3D <span style=3D"color: rgb(63, 151, 223);" =
class=3D"">FIELD_DP32</span>(data, VDATA, LMUL, emul);</span></div><div =
class=3D""><span style=3D"background-color: rgba(255, 255, 255, 0);" =
class=3D"">    data =3D <span style=3D"color: rgb(63, 151, 223);" =
class=3D"">FIELD_DP32</span>(data, VDATA, NF, <span style=3D"color: =
rgb(9, 89, 132);" class=3D"">a</span>-&gt;<span style=3D"color: rgb(9, =
89, 132);" class=3D"">nf</span>);</span></div><div class=3D""><span =
style=3D"background-color: rgba(255, 255, 255, 0);" class=3D"">    <span =
style=3D"color: rgb(157, 78, 150);" class=3D"">return</span> <span =
style=3D"color: rgb(99, 99, 36);" class=3D"">ldst_us_trans</span>(<span =
style=3D"color: rgb(9, 89, 132);" class=3D"">a</span>-&gt;<span =
style=3D"color: rgb(9, 89, 132);" class=3D"">rd</span>, <span =
style=3D"color: rgb(9, 89, 132);" class=3D"">a</span>-&gt;<span =
style=3D"color: rgb(9, 89, 132);" class=3D"">rs1</span>, data, fn, s, =
<span style=3D"color: rgb(63, 151, 223);" =
class=3D"">false</span>);</span></div></div></div><div =
class=3D"">```</div><div class=3D""><br class=3D""></div><div =
class=3D"">And vext_get_emul always return something at least the length =
of a vector register:</div><div class=3D""><br class=3D""></div><div =
class=3D"">```</div><div class=3D""><div style=3D"color: rgb(54, 54, =
54); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; =
line-height: 18px; white-space: pre;" class=3D""><div class=3D""><span =
style=3D"background-color: rgba(255, 255, 255, 0);" class=3D""><span =
style=3D"color: rgb(63, 151, 223);" class=3D"">static</span> <span =
style=3D"color: rgb(63, 151, 223);" class=3D"">uint8_t</span> <span =
style=3D"color: rgb(99, 99, 36);" =
class=3D"">vext_get_emul</span>(DisasContext *<span style=3D"color: =
rgb(9, 89, 132);" class=3D"">s</span>, <span style=3D"color: rgb(63, =
151, 223);" class=3D"">uint8_t</span> <span style=3D"color: rgb(9, 89, =
132);" class=3D"">eew</span>)</span></div><div class=3D""><span =
style=3D"background-color: rgba(255, 255, 255, 0);" =
class=3D"">{</span></div><div class=3D""><span style=3D"background-color: =
rgba(255, 255, 255, 0);" class=3D"">    <span style=3D"color: rgb(63, =
151, 223);" class=3D"">int8_t</span> emul =3D eew - <span style=3D"color: =
rgb(9, 89, 132);" class=3D"">s</span>-&gt;<span style=3D"color: rgb(9, =
89, 132);" class=3D"">sew</span> + <span style=3D"color: rgb(9, 89, =
132);" class=3D"">s</span>-&gt;<span style=3D"color: rgb(9, 89, 132);" =
class=3D"">lmul</span>;</span></div><div class=3D""><span =
style=3D"background-color: rgba(255, 255, 255, 0);" class=3D"">    <span =
style=3D"color: rgb(157, 78, 150);" class=3D"">return</span> emul &lt; =
<span style=3D"color: rgb(73, 104, 57);" class=3D"">0</span> ? <span =
style=3D"color: rgb(73, 104, 57);" class=3D"">0</span> : =
emul;</span></div><div class=3D""><span style=3D"background-color: =
rgba(255, 255, 255, 0);" class=3D"">}</span></div><br =
class=3D""></div></div><div class=3D"">```</div><div class=3D""><br =
class=3D""></div><div class=3D"">In this case I guess the naming is a =
little bit misleading, `vext_max_elems` would be</div><div =
class=3D"">equivalent to `vext_get_total_elems` for all load / store =
instructions, which guarantees</div><div class=3D"">That LMUL is always =
equal or greater to 1. In conclusion, the behavior is correct =
here.</div><div class=3D""><br class=3D""></div><div class=3D"">I =
don=E2=80=99t understand your second question though. If nf =3D 3, there =
will be 3 registers</div><div class=3D"">involved with the instruction =
(namely reg, reg+1, reg+2). Why do we care about</div><div =
class=3D"">(reg+3)?</div><div class=3D""><br class=3D""></div><div =
class=3D"">Thanks for pointing out this question and all your efforts =
for reviewing. I really</div><div class=3D"">appreciate it.</div><div =
class=3D""><br class=3D""></div><div class=3D"">Regards,</div><div =
class=3D""><br class=3D""></div><div class=3D"">eop Chen</div><div =
class=3D""><br class=3D""></div></body></html>=

--Apple-Mail=_BD9534A0-276D-454B-8BD3-BC15B38E44BE--

