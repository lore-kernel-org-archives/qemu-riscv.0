Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ocMBJ-0001Ey-4K
	for mharc-qemu-riscv@gnu.org; Sun, 25 Sep 2022 03:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1ocMAz-000170-DW
 for qemu-riscv@nongnu.org; Sun, 25 Sep 2022 03:36:02 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:45040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1ocMAw-00072n-PV
 for qemu-riscv@nongnu.org; Sun, 25 Sep 2022 03:35:45 -0400
Received: by mail-lf1-x131.google.com with SMTP id i26so6357006lfp.11
 for <qemu-riscv@nongnu.org>; Sun, 25 Sep 2022 00:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=hEv8LaCI1ERsaT2FEs1BJi5p6Ezc92QKj93WcZTbdPk=;
 b=OECwu5upX9d1LHxmMyHdz3ndu2Zi801w3/N2aHyFpfo/oV9hKxm3wWbuwDN7/XjEcH
 hDZCmN7VLFekmTm3HK5fBHDt9ZhDM0y0DePtnSOIqdEGex8YOFywt7UnMV/o9fBxjtJH
 tJu3IbBC08xsCtMJfv8OkKNNtQtRnlCFDYPKTQgo9wGMkyO08Ib3IYbjFFhIz+8cdCLd
 1AyrxyLJoTOjkNi5IKGs8xW64dGvSiyXSWHO8jT0iHGyw/Fu6YWiza1/wctdcCtqL025
 5ZvNZePSSw4/hYzb6ppHmquNhNyYkxe5P26Kmn/NnNr808gkRJrhBgMj61TcYEIBolpZ
 j3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=hEv8LaCI1ERsaT2FEs1BJi5p6Ezc92QKj93WcZTbdPk=;
 b=KBimRq7VWCHHfTXZen7NIIbVTAkJppztZL2eba9GA3S84U1kf3lKwZbNOLOQY4ByEG
 a+Sd9nyW4cYYpPqd9gwUHgIGGC6Cynrdi/4tEgW7/EN0L8ZZoaD8mYe66jlFiBjPerkF
 UmNv1fmDQB/4BU235bL++6uEJYGFOrUBjD0dGqR4/HAijk/NQ1JYmdSOXdp4YycPipnV
 fu0zVo4lYw4N9aPFUFe8dmKGW+4/XC1yGSpSONMmSsV6Tn8IyqbjNMSY0J/hryZCR0A1
 SEhzw37qCQBfFNyXekvZFsuWIR7UNYvJUGyfmiA8/xpS8VwLmePsvVOu1fjRUx/x4Tog
 wXqw==
X-Gm-Message-State: ACrzQf0WDNSrCC22QTELNusOAOMs3b6AIvr8D2lbmea08GHpzKRL5IDa
 sCEEh0+ND3AbJJxATreFQa26FNZVbxKqsgcAP217/uDl6N6GS4cMJG2Z5S0am3lbxsMez9Ubz/i
 nB+71XI0Q2+GFyyRs4n9FXfWPZAioY5VJG3DmhJ/5PGyz413oUkFZLW6oTonyLIi6IQSsOotn6u
 I=
X-Google-Smtp-Source: AMsMyM7Zssp8Uay07qS1osX0OGkxqeOYnPLh3GvseB5k1/IYukfDijfz/mYvIm32rEgGvWfzfeIxxw==
X-Received: by 2002:a05:6512:2242:b0:49d:7f0e:eb4b with SMTP id
 i2-20020a056512224200b0049d7f0eeb4bmr6184912lfu.128.1664091338191; 
 Sun, 25 Sep 2022 00:35:38 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056512029b00b004977e865220sm2131562lfp.55.2022.09.25.00.35.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Sep 2022 00:35:37 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id q17so4285737lji.11;
 Sun, 25 Sep 2022 00:35:37 -0700 (PDT)
X-Received: by 2002:a05:651c:103c:b0:26c:5d79:63bf with SMTP id
 w28-20020a05651c103c00b0026c5d7963bfmr5388620ljm.412.1664091336827; Sun, 25
 Sep 2022 00:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220817074802.20765-1-liuyang22@iscas.ac.cn>
 <20220817074802.20765-2-liuyang22@iscas.ac.cn>
In-Reply-To: <20220817074802.20765-2-liuyang22@iscas.ac.cn>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 25 Sep 2022 15:35:25 +0800
X-Gmail-Original-Message-ID: <CANzO1D1CtQ9nNRDuoU7xvjy1fU_9=a=ddeePR-HuQWeAG8uc=w@mail.gmail.com>
Message-ID: <CANzO1D1CtQ9nNRDuoU7xvjy1fU_9=a=ddeePR-HuQWeAG8uc=w@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: rvv-1.0: vf[w]redsum distinguish
 between ordered/unordered
To: Yang Liu <liuyang22@iscas.ac.cn>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wangjunqiang@iscas.ac.cn, 
 lazyparser@gmail.com, liweiwei@iscas.ac.cn
Content-Type: multipart/alternative; boundary="000000000000016b5405e97b7596"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=frank.chang@sifive.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 25 Sep 2022 07:36:02 -0000

--000000000000016b5405e97b7596
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Wed, Aug 17, 2022 at 11:45 PM Yang Liu <liuyang22@iscas.ac.cn> wrote:

> Starting with RVV1.0, the original vf[w]redsum_vs instruction was renamed
> to vf[w]redusum_vs. The distinction between ordered and unordered is also
> more consistent with other instructions, although there is no difference
> in implementation between the two for QEMU.
>
> Signed-off-by: Yang Liu <liuyang22@iscas.ac.cn>
> ---
>  target/riscv/helper.h                   | 15 ++++++++++-----
>  target/riscv/insn32.decode              |  6 ++++--
>  target/riscv/insn_trans/trans_rvv.c.inc |  6 ++++--
>  target/riscv/vector_helper.c            | 19 +++++++++++++------
>  4 files changed, 31 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 4ef3b2251d..a03014fe67 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1009,9 +1009,12 @@ DEF_HELPER_6(vwredsum_vs_b, void, ptr, ptr, ptr,
> ptr, env, i32)
>  DEF_HELPER_6(vwredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vwredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
>
> -DEF_HELPER_6(vfredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
> -DEF_HELPER_6(vfredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
> -DEF_HELPER_6(vfredsum_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vfredusum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vfredusum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vfredusum_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vfredosum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vfredosum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vfredosum_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vfredmax_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vfredmax_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vfredmax_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
> @@ -1019,8 +1022,10 @@ DEF_HELPER_6(vfredmin_vs_h, void, ptr, ptr, ptr,
> ptr, env, i32)
>  DEF_HELPER_6(vfredmin_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vfredmin_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
>
> -DEF_HELPER_6(vfwredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
> -DEF_HELPER_6(vfwredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vfwredusum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vfwredusum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vfwredosum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vfwredosum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
>
>  DEF_HELPER_6(vmand_mm, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vmnand_mm, void, ptr, ptr, ptr, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 4033565393..2873a7ae04 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -659,11 +659,13 @@ vredmax_vs      000111 . ..... ..... 010 .....
> 1010111 @r_vm
>  vwredsumu_vs    110000 . ..... ..... 000 ..... 1010111 @r_vm
>  vwredsum_vs     110001 . ..... ..... 000 ..... 1010111 @r_vm
>  # Vector ordered and unordered reduction sum
> -vfredsum_vs     0000-1 . ..... ..... 001 ..... 1010111 @r_vm
> +vfredusum_vs    000001 . ..... ..... 001 ..... 1010111 @r_vm
> +vfredosum_vs    000011 . ..... ..... 001 ..... 1010111 @r_vm
>  vfredmin_vs     000101 . ..... ..... 001 ..... 1010111 @r_vm
>  vfredmax_vs     000111 . ..... ..... 001 ..... 1010111 @r_vm
>  # Vector widening ordered and unordered float reduction sum
> -vfwredsum_vs    1100-1 . ..... ..... 001 ..... 1010111 @r_vm
> +vfwredusum_vs   110001 . ..... ..... 001 ..... 1010111 @r_vm
> +vfwredosum_vs   110011 . ..... ..... 001 ..... 1010111 @r_vm
>  vmand_mm        011001 - ..... ..... 010 ..... 1010111 @r
>  vmnand_mm       011101 - ..... ..... 010 ..... 1010111 @r
>  vmandn_mm       011000 - ..... ..... 010 ..... 1010111 @r
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc
> b/target/riscv/insn_trans/trans_rvv.c.inc
> index 6c091824b6..9c9de17f8a 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3112,7 +3112,8 @@ static bool freduction_check(DisasContext *s,
> arg_rmrr *a)
>             require_zve64f(s);
>  }
>
> -GEN_OPFVV_TRANS(vfredsum_vs, freduction_check)
> +GEN_OPFVV_TRANS(vfredusum_vs, freduction_check)
> +GEN_OPFVV_TRANS(vfredosum_vs, freduction_check)
>  GEN_OPFVV_TRANS(vfredmax_vs, freduction_check)
>  GEN_OPFVV_TRANS(vfredmin_vs, freduction_check)
>
> @@ -3124,7 +3125,8 @@ static bool freduction_widen_check(DisasContext *s,
> arg_rmrr *a)
>             (s->sew != MO_8);
>  }
>
> -GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, freduction_widen_check)
> +GEN_OPFVV_WIDEN_TRANS(vfwredusum_vs, freduction_widen_check)
> +GEN_OPFVV_WIDEN_TRANS(vfwredosum_vs, freduction_widen_check)
>
>  /*
>   *** Vector Mask Operations
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index fd83c0b20b..d87f79ad82 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -4641,9 +4641,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,
>        \
>  }
>
>  /* Unordered sum */
> -GEN_VEXT_FRED(vfredsum_vs_h, uint16_t, uint16_t, H2, H2, float16_add)
> -GEN_VEXT_FRED(vfredsum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
> -GEN_VEXT_FRED(vfredsum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
> +GEN_VEXT_FRED(vfredusum_vs_h, uint16_t, uint16_t, H2, H2, float16_add)
> +GEN_VEXT_FRED(vfredusum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
> +GEN_VEXT_FRED(vfredusum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
> +
> +/* Ordered sum */
> +GEN_VEXT_FRED(vfredosum_vs_h, uint16_t, uint16_t, H2, H2, float16_add)
> +GEN_VEXT_FRED(vfredosum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
> +GEN_VEXT_FRED(vfredosum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
>
>  /* Maximum value */
>  GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2,
> float16_maximum_number)
> @@ -4667,9 +4672,11 @@ static uint64_t fwadd32(uint64_t a, uint32_t b,
> float_status *s)
>  }
>
>  /* Vector Widening Floating-Point Reduction Instructions */
> -/* Unordered reduce 2*SEW = 2*SEW + sum(promote(SEW)) */
> -GEN_VEXT_FRED(vfwredsum_vs_h, uint32_t, uint16_t, H4, H2, fwadd16)
> -GEN_VEXT_FRED(vfwredsum_vs_w, uint64_t, uint32_t, H8, H4, fwadd32)
> +/* Ordered/unordered reduce 2*SEW = 2*SEW + sum(promote(SEW)) */
> +GEN_VEXT_FRED(vfwredusum_vs_h, uint32_t, uint16_t, H4, H2, fwadd16)
> +GEN_VEXT_FRED(vfwredusum_vs_w, uint64_t, uint32_t, H8, H4, fwadd32)
> +GEN_VEXT_FRED(vfwredosum_vs_h, uint32_t, uint16_t, H4, H2, fwadd16)
> +GEN_VEXT_FRED(vfwredosum_vs_w, uint64_t, uint32_t, H8, H4, fwadd32)
>
>  /*
>   *** Vector Mask Operations
> --
> 2.30.1 (Apple Git-130)
>
>
>

--000000000000016b5405e97b7596
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang=
@sifive.com">frank.chang@sifive.com</a>&gt;</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 17, 2022 at 11:45 PM=
 Yang Liu &lt;<a href=3D"mailto:liuyang22@iscas.ac.cn">liuyang22@iscas.ac.c=
n</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Starting with RVV1.0, the original vf[w]redsum_vs instruction was renamed<=
br>
to vf[w]redusum_vs. The distinction between ordered and unordered is also<b=
r>
more consistent with other instructions, although there is no difference<br=
>
in implementation between the two for QEMU.<br>
<br>
Signed-off-by: Yang Liu &lt;<a href=3D"mailto:liuyang22@iscas.ac.cn" target=
=3D"_blank">liuyang22@iscas.ac.cn</a>&gt;<br>
---<br>
=C2=A0target/riscv/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 15 ++++++++++-----<br>
=C2=A0target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 6 ++++--<br>
=C2=A0target/riscv/insn_trans/trans_rvv.c.inc |=C2=A0 6 ++++--<br>
=C2=A0target/riscv/vector_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 19 +++++++++++++------<br>
=C2=A04 files changed, 31 insertions(+), 15 deletions(-)<br>
<br>
diff --git a/target/riscv/helper.h b/target/riscv/helper.h<br>
index 4ef3b2251d..a03014fe67 100644<br>
--- a/target/riscv/helper.h<br>
+++ b/target/riscv/helper.h<br>
@@ -1009,9 +1009,12 @@ DEF_HELPER_6(vwredsum_vs_b, void, ptr, ptr, ptr, ptr=
, env, i32)<br>
=C2=A0DEF_HELPER_6(vwredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)<br>
=C2=A0DEF_HELPER_6(vwredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)<br>
<br>
-DEF_HELPER_6(vfredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)<br>
-DEF_HELPER_6(vfredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)<br>
-DEF_HELPER_6(vfredsum_vs_d, void, ptr, ptr, ptr, ptr, env, i32)<br>
+DEF_HELPER_6(vfredusum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)<br>
+DEF_HELPER_6(vfredusum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)<br>
+DEF_HELPER_6(vfredusum_vs_d, void, ptr, ptr, ptr, ptr, env, i32)<br>
+DEF_HELPER_6(vfredosum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)<br>
+DEF_HELPER_6(vfredosum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)<br>
+DEF_HELPER_6(vfredosum_vs_d, void, ptr, ptr, ptr, ptr, env, i32)<br>
=C2=A0DEF_HELPER_6(vfredmax_vs_h, void, ptr, ptr, ptr, ptr, env, i32)<br>
=C2=A0DEF_HELPER_6(vfredmax_vs_w, void, ptr, ptr, ptr, ptr, env, i32)<br>
=C2=A0DEF_HELPER_6(vfredmax_vs_d, void, ptr, ptr, ptr, ptr, env, i32)<br>
@@ -1019,8 +1022,10 @@ DEF_HELPER_6(vfredmin_vs_h, void, ptr, ptr, ptr, ptr=
, env, i32)<br>
=C2=A0DEF_HELPER_6(vfredmin_vs_w, void, ptr, ptr, ptr, ptr, env, i32)<br>
=C2=A0DEF_HELPER_6(vfredmin_vs_d, void, ptr, ptr, ptr, ptr, env, i32)<br>
<br>
-DEF_HELPER_6(vfwredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)<br>
-DEF_HELPER_6(vfwredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)<br>
+DEF_HELPER_6(vfwredusum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)<br>
+DEF_HELPER_6(vfwredusum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)<br>
+DEF_HELPER_6(vfwredosum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)<br>
+DEF_HELPER_6(vfwredosum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)<br>
<br>
=C2=A0DEF_HELPER_6(vmand_mm, void, ptr, ptr, ptr, ptr, env, i32)<br>
=C2=A0DEF_HELPER_6(vmnand_mm, void, ptr, ptr, ptr, ptr, env, i32)<br>
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode<br>
index 4033565393..2873a7ae04 100644<br>
--- a/target/riscv/insn32.decode<br>
+++ b/target/riscv/insn32.decode<br>
@@ -659,11 +659,13 @@ vredmax_vs=C2=A0 =C2=A0 =C2=A0 000111 . ..... ..... 0=
10 ..... 1010111 @r_vm<br>
=C2=A0vwredsumu_vs=C2=A0 =C2=A0 110000 . ..... ..... 000 ..... 1010111 @r_v=
m<br>
=C2=A0vwredsum_vs=C2=A0 =C2=A0 =C2=A0110001 . ..... ..... 000 ..... 1010111=
 @r_vm<br>
=C2=A0# Vector ordered and unordered reduction sum<br>
-vfredsum_vs=C2=A0 =C2=A0 =C2=A00000-1 . ..... ..... 001 ..... 1010111 @r_v=
m<br>
+vfredusum_vs=C2=A0 =C2=A0 000001 . ..... ..... 001 ..... 1010111 @r_vm<br>
+vfredosum_vs=C2=A0 =C2=A0 000011 . ..... ..... 001 ..... 1010111 @r_vm<br>
=C2=A0vfredmin_vs=C2=A0 =C2=A0 =C2=A0000101 . ..... ..... 001 ..... 1010111=
 @r_vm<br>
=C2=A0vfredmax_vs=C2=A0 =C2=A0 =C2=A0000111 . ..... ..... 001 ..... 1010111=
 @r_vm<br>
=C2=A0# Vector widening ordered and unordered float reduction sum<br>
-vfwredsum_vs=C2=A0 =C2=A0 1100-1 . ..... ..... 001 ..... 1010111 @r_vm<br>
+vfwredusum_vs=C2=A0 =C2=A0110001 . ..... ..... 001 ..... 1010111 @r_vm<br>
+vfwredosum_vs=C2=A0 =C2=A0110011 . ..... ..... 001 ..... 1010111 @r_vm<br>
=C2=A0vmand_mm=C2=A0 =C2=A0 =C2=A0 =C2=A0 011001 - ..... ..... 010 ..... 10=
10111 @r<br>
=C2=A0vmnand_mm=C2=A0 =C2=A0 =C2=A0 =C2=A0011101 - ..... ..... 010 ..... 10=
10111 @r<br>
=C2=A0vmandn_mm=C2=A0 =C2=A0 =C2=A0 =C2=A0011000 - ..... ..... 010 ..... 10=
10111 @r<br>
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tr=
ans/trans_rvv.c.inc<br>
index 6c091824b6..9c9de17f8a 100644<br>
--- a/target/riscv/insn_trans/trans_rvv.c.inc<br>
+++ b/target/riscv/insn_trans/trans_rvv.c.inc<br>
@@ -3112,7 +3112,8 @@ static bool freduction_check(DisasContext *s, arg_rmr=
r *a)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 require_zve64f(s);<br>
=C2=A0}<br>
<br>
-GEN_OPFVV_TRANS(vfredsum_vs, freduction_check)<br>
+GEN_OPFVV_TRANS(vfredusum_vs, freduction_check)<br>
+GEN_OPFVV_TRANS(vfredosum_vs, freduction_check)<br>
=C2=A0GEN_OPFVV_TRANS(vfredmax_vs, freduction_check)<br>
=C2=A0GEN_OPFVV_TRANS(vfredmin_vs, freduction_check)<br>
<br>
@@ -3124,7 +3125,8 @@ static bool freduction_widen_check(DisasContext *s, a=
rg_rmrr *a)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (s-&gt;sew !=3D MO_8);<br>
=C2=A0}<br>
<br>
-GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, freduction_widen_check)<br>
+GEN_OPFVV_WIDEN_TRANS(vfwredusum_vs, freduction_widen_check)<br>
+GEN_OPFVV_WIDEN_TRANS(vfwredosum_vs, freduction_widen_check)<br>
<br>
=C2=A0/*<br>
=C2=A0 *** Vector Mask Operations<br>
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c<br=
>
index fd83c0b20b..d87f79ad82 100644<br>
--- a/target/riscv/vector_helper.c<br>
+++ b/target/riscv/vector_helper.c<br>
@@ -4641,9 +4641,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0}<br>
<br>
=C2=A0/* Unordered sum */<br>
-GEN_VEXT_FRED(vfredsum_vs_h, uint16_t, uint16_t, H2, H2, float16_add)<br>
-GEN_VEXT_FRED(vfredsum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)<br>
-GEN_VEXT_FRED(vfredsum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)<br>
+GEN_VEXT_FRED(vfredusum_vs_h, uint16_t, uint16_t, H2, H2, float16_add)<br>
+GEN_VEXT_FRED(vfredusum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)<br>
+GEN_VEXT_FRED(vfredusum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)<br>
+<br>
+/* Ordered sum */<br>
+GEN_VEXT_FRED(vfredosum_vs_h, uint16_t, uint16_t, H2, H2, float16_add)<br>
+GEN_VEXT_FRED(vfredosum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)<br>
+GEN_VEXT_FRED(vfredosum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)<br>
<br>
=C2=A0/* Maximum value */<br>
=C2=A0GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maxi=
mum_number)<br>
@@ -4667,9 +4672,11 @@ static uint64_t fwadd32(uint64_t a, uint32_t b, floa=
t_status *s)<br>
=C2=A0}<br>
<br>
=C2=A0/* Vector Widening Floating-Point Reduction Instructions */<br>
-/* Unordered reduce 2*SEW =3D 2*SEW + sum(promote(SEW)) */<br>
-GEN_VEXT_FRED(vfwredsum_vs_h, uint32_t, uint16_t, H4, H2, fwadd16)<br>
-GEN_VEXT_FRED(vfwredsum_vs_w, uint64_t, uint32_t, H8, H4, fwadd32)<br>
+/* Ordered/unordered reduce 2*SEW =3D 2*SEW + sum(promote(SEW)) */<br>
+GEN_VEXT_FRED(vfwredusum_vs_h, uint32_t, uint16_t, H4, H2, fwadd16)<br>
+GEN_VEXT_FRED(vfwredusum_vs_w, uint64_t, uint32_t, H8, H4, fwadd32)<br>
+GEN_VEXT_FRED(vfwredosum_vs_h, uint32_t, uint16_t, H4, H2, fwadd16)<br>
+GEN_VEXT_FRED(vfwredosum_vs_w, uint64_t, uint32_t, H8, H4, fwadd32)<br>
<br>
=C2=A0/*<br>
=C2=A0 *** Vector Mask Operations<br>
-- <br>
2.30.1 (Apple Git-130)<br>
<br>
<br>
</blockquote></div>

--000000000000016b5405e97b7596--

