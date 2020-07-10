Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtxcP-0003Wz-0P
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 14:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jtxcL-0003W2-O4
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 14:19:26 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jtxcJ-0004nz-56
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 14:19:25 -0400
Received: by mail-wm1-x343.google.com with SMTP id j18so7080986wmi.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 11:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=2bFGq3P5fqfdRRFNnry7GjHopk/3w08fUzKnu6E0MCg=;
 b=HznVMdx4+XkVg4D18SKyTo5RgsYSfKAZFNQtHUZRNnwJF5efztgMPlgpAAaKYf3U2D
 gOf6xcLYJl7Qo+X8DFMkgakFcll3r3I6QCwGrr+drcwUs7IHvvqr3zQV27vBTmWy/FIZ
 hXIsiIW0FUSxNzdvIDvuR5ice7a0Kg7Rc8skLnvC7MutW99ISzB4FM8w7oxlGNYAkOC2
 CEZGqLfwh+Z6Wd/XunDmme4hFJ1iNj/NpL97QypNJwMVAYEvtRGSnpOFy4k3qYQxlpah
 l2qfqyTNj9SH2HdggkZrhlb3eJKUL0gsGGCWB1oPU+zppWXCbu6oaiMpnI41Ilg7PEDu
 I4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=2bFGq3P5fqfdRRFNnry7GjHopk/3w08fUzKnu6E0MCg=;
 b=Sc9bLip4zFuTWVuC/pGNG+NFoChhzL7mw0CVdvs8QPxr+iJEN0JNR9lNkTb3hxeEgb
 /SJdzBmmZW7UNK7gPRL0PZfz6v7g4GZchSi0ZC9/3ctumLhG77FDEeKfpH03iNJa1zhz
 xW3payzbRylSc1YkTK8q50lik8JZ5Reo1vmz8QSUK36/lH7ckE/wRxmRGy/jgR2lbNfc
 i+jSKISwpckNvFOq3fzizYVhzLfXHIddF5msI5SGCYDBS6CaBvYhLatFVUVk21R9xIDk
 7ffbvR8KxGEN2cUnXzSOS8qrjacHnmFAnpDMdgrCc46AjLlTYOMJihPRbCkeBX4U0OMi
 7l5g==
X-Gm-Message-State: AOAM533PzkiE0BzXlr2RoSvLv5VhbyA5vVhEcj4JMqM8q7vUBuQPfo4A
 73pNWUPcvnWnLn5vLa8FBTE2NA==
X-Google-Smtp-Source: ABdhPJwSSY8BGKVEYP/Cj5W3nwKWMss0McdmcY1vGbsf2jPB5Yp9KWv9JsNZSBe0lSQRxzOizU+Tew==
X-Received: by 2002:a05:600c:281:: with SMTP id
 1mr6439788wmk.143.1594405161513; 
 Fri, 10 Jul 2020 11:19:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y16sm11548421wro.71.2020.07.10.11.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 11:19:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B12721FF7E;
 Fri, 10 Jul 2020 19:19:19 +0100 (BST)
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <20200710104920.13550-58-frank.chang@sifive.com>
User-agent: mu4e 1.5.4; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: frank.chang@sifive.com
Cc: qemu-riscv@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org
Subject: Re: [RFC 57/65] target/riscv: rvv-0.9: floating-point min/max
 instructions
In-reply-to: <20200710104920.13550-58-frank.chang@sifive.com>
Date: Fri, 10 Jul 2020 19:19:19 +0100
Message-ID: <87o8onjkrc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 10 Jul 2020 18:19:26 -0000


frank.chang@sifive.com writes:

> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/vector_helper.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 42a48be5fd..d617d0dfbd 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -3831,28 +3831,28 @@ GEN_VEXT_V_ENV(vfsqrt_v_w, 4, 4, clearl)
>  GEN_VEXT_V_ENV(vfsqrt_v_d, 8, 8, clearq)
>=20=20
>  /* Vector Floating-Point MIN/MAX Instructions */
> -RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minnum)
> -RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minnum)
> -RVVCALL(OPFVV2, vfmin_vv_d, OP_UUU_D, H8, H8, H8, float64_minnum)
> +RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minnum_noprop)
> +RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minnum_noprop)
> +RVVCALL(OPFVV2, vfmin_vv_d, OP_UUU_D, H8, H8, H8,
>  float64_minnum_noprop)

This patch breaks bisection because you don't introduce this into
softfloat until later. You should always ensure each step can build and
run - practically this means the softfloat changes should be at the
beginning of the series.

>  GEN_VEXT_VV_ENV(vfmin_vv_h, 2, 2, clearh)
>  GEN_VEXT_VV_ENV(vfmin_vv_w, 4, 4, clearl)
>  GEN_VEXT_VV_ENV(vfmin_vv_d, 8, 8, clearq)
> -RVVCALL(OPFVF2, vfmin_vf_h, OP_UUU_H, H2, H2, float16_minnum)
> -RVVCALL(OPFVF2, vfmin_vf_w, OP_UUU_W, H4, H4, float32_minnum)
> -RVVCALL(OPFVF2, vfmin_vf_d, OP_UUU_D, H8, H8, float64_minnum)
> +RVVCALL(OPFVF2, vfmin_vf_h, OP_UUU_H, H2, H2, float16_minnum_noprop)
> +RVVCALL(OPFVF2, vfmin_vf_w, OP_UUU_W, H4, H4, float32_minnum_noprop)
> +RVVCALL(OPFVF2, vfmin_vf_d, OP_UUU_D, H8, H8, float64_minnum_noprop)
>  GEN_VEXT_VF(vfmin_vf_h, 2, 2, clearh)
>  GEN_VEXT_VF(vfmin_vf_w, 4, 4, clearl)
>  GEN_VEXT_VF(vfmin_vf_d, 8, 8, clearq)
>=20=20
> -RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_maxnum)
> -RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_maxnum)
> -RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_maxnum)
> +RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_maxnum_noprop)
> +RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_maxnum_noprop)
> +RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_maxnum_noprop)
>  GEN_VEXT_VV_ENV(vfmax_vv_h, 2, 2, clearh)
>  GEN_VEXT_VV_ENV(vfmax_vv_w, 4, 4, clearl)
>  GEN_VEXT_VV_ENV(vfmax_vv_d, 8, 8, clearq)
> -RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_maxnum)
> -RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_maxnum)
> -RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maxnum)
> +RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_maxnum_noprop)
> +RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_maxnum_noprop)
> +RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maxnum_noprop)
>  GEN_VEXT_VF(vfmax_vf_h, 2, 2, clearh)
>  GEN_VEXT_VF(vfmax_vf_w, 4, 4, clearl)
>  GEN_VEXT_VF(vfmax_vf_d, 8, 8, clearq)


--=20
Alex Benn=C3=A9e

