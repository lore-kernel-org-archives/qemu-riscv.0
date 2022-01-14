Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n8N9e-0000DV-Jz
	for mharc-qemu-riscv@gnu.org; Fri, 14 Jan 2022 09:02:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n8N9b-000096-U3
 for qemu-riscv@nongnu.org; Fri, 14 Jan 2022 09:02:08 -0500
Received: from [2a00:1450:4864:20::42b] (port=47072
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n8N9X-0001cg-20
 for qemu-riscv@nongnu.org; Fri, 14 Jan 2022 09:02:07 -0500
Received: by mail-wr1-x42b.google.com with SMTP id l25so15714954wrb.13
 for <qemu-riscv@nongnu.org>; Fri, 14 Jan 2022 06:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m7eKgeijq1/hXsahomS3u6Px2JAXH2eEzgaGqsoUwus=;
 b=cKt5X/no5IKD/sL9CA5O1uVFrDm5RcbtxsoNUnft/A8VjAfv8qGppgvXPCe1wsXsDp
 gYqGgCU8swTB3FSl56maT/RvN/l/tq23DMwkN8wOtyGl209tzatipOtSkkMs3w+IuZoh
 Vv2x0/jOO/M2/P0I+rMtZMbhvIiPbGe+jD6PZMIpcjo5u9xFheBxbv8rXQRV1dm//HXp
 FDN4Pn11/5oCrsftJnbljtd20sOZotqKfvyRan8C1BvVP1wTgVM9Euee7LSA4oclcK1R
 8DhM7IkMbgSWqyXZAl1/Lk1br5FkzdHUbI9Xeh9N1NVdkkN5towcszJZBwyH25EyLv2P
 Netg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m7eKgeijq1/hXsahomS3u6Px2JAXH2eEzgaGqsoUwus=;
 b=UC+5XdEGIwLH6l4SW0AcU8c92UNU1enjo2k6WQoXszS/jeTnyfIB5eAOb4I7Jq6Ki6
 xroUgOHLpOl6bJbGh+QzpSFjqWwrWdU5LhL3+/6fi2u3y0aqs8uYPUfbbXkyEVUswuW4
 /0EAkj7LlN2trWY4O4SaWeA2rB8ptJT/EjWnOIPzMrIrP7JIbvI0o8RL0oxYkRm83eDw
 /4yNplrQ4n4WZVNOtFxcF8Eey19CpCEivIcTes9zqEz4RTJO/dzhoUWZ9Kf9x+1Drvm/
 oPTA/w5JStFxvT70jhIn2nWI1412zwfkbH9WYTZyJhQlxZDYG5FblE+LJMZyKFibLFCv
 oo/Q==
X-Gm-Message-State: AOAM530JzD5nFPhtzWsfv3z6QP+A+dOcY99CPza+rB1LTBTWdBY9i8mp
 xlUzsG0ceisj8R/3gGMiGdklFVjLzX/YG++fnwsVzA==
X-Google-Smtp-Source: ABdhPJyTly3m+RD6uBUKg19prRPVFkVAu4O0BQhjWwQ5hKIpWzN9htGMmzTsC5/hIjyAQkcqeRtSMjlT6eqHWfe6CXA=
X-Received: by 2002:adf:d1e1:: with SMTP id g1mr8841746wrd.214.1642168879965; 
 Fri, 14 Jan 2022 06:01:19 -0800 (PST)
MIME-Version: 1.0
References: <20220114014059.23300-1-liweiwei@iscas.ac.cn>
 <20220114014059.23300-3-liweiwei@iscas.ac.cn>
 <CAAhSdy0KEm=CeG4TCLdyf1i_aO-pKG9N5yYQU6_OLPE44fQi-g@mail.gmail.com>
 <a67b7ae3-e741-487d-765a-9fc98e53ca95@iscas.ac.cn>
In-Reply-To: <a67b7ae3-e741-487d-765a-9fc98e53ca95@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 14 Jan 2022 19:31:08 +0530
Message-ID: <CAAhSdy0eQ+aX1G0sP8+Q6UQEefrj7Cz4tbyUvkvc4NXxhdFp9g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] target/riscv: add support for svinval extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, wangjunqiang@iscas.ac.cn, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::42b;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 14 Jan 2022 14:02:08 -0000

On Fri, Jan 14, 2022 at 7:24 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Thanks for your comments.
>
> =E5=9C=A8 2022/1/14 =E4=B8=8B=E5=8D=889:40, Anup Patel =E5=86=99=E9=81=93=
:
>
> On Fri, Jan 14, 2022 at 7:11 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/cpu.c                          |  1 +
>  target/riscv/cpu.h                          |  1 +
>  target/riscv/insn32.decode                  |  7 ++
>  target/riscv/insn_trans/trans_svinval.c.inc | 75 +++++++++++++++++++++
>  target/riscv/translate.c                    |  1 +
>  5 files changed, 85 insertions(+)
>  create mode 100644 target/riscv/insn_trans/trans_svinval.c.inc
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ff6c86c85b..45ac98e06b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -668,6 +668,7 @@ static Property riscv_cpu_properties[] =3D {
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>
> +    DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>
>      DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d3d17cde82..c3d1845ca1 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -327,6 +327,7 @@ struct RISCVCPU {
>          bool ext_counters;
>          bool ext_ifencei;
>          bool ext_icsr;
> +        bool ext_svinval;
>          bool ext_svnapot;
>          bool ext_zfh;
>          bool ext_zfhmin;
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 5bbedc254c..7a0351fde2 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -809,3 +809,10 @@ fcvt_l_h   1100010  00010 ..... ... ..... 1010011 @r=
2_rm
>  fcvt_lu_h  1100010  00011 ..... ... ..... 1010011 @r2_rm
>  fcvt_h_l   1101010  00010 ..... ... ..... 1010011 @r2_rm
>  fcvt_h_lu  1101010  00011 ..... ... ..... 1010011 @r2_rm
> +
> +# *** Svinval Standard Extension ***
> +sinval_vma        0001011 ..... ..... 000 00000 1110011 @sfence_vma
> +sfence_w_inval    0001100 00000 00000 000 00000 1110011
> +sfence_inval_ir   0001100 00001 00000 000 00000 1110011
> +hinval_vvma       0011011 ..... ..... 000 00000 1110011 @hfence_vvma
>
> s/0011011/0010011/
>
> +hinval_gvma       0111011 ..... ..... 000 00000 1110011 @hfence_gvma
>
> s/0111011/0110011/
>
> Sorry. I didn't find the encodings for svinval instructions from the spec=
. So I get them from  spike (https://github.com/riscv-software-src/riscv-is=
a-sim/blob/master/riscv/encoding.h) which are as follows:
>
> #define MATCH_HINVAL_VVMA 0x36000073
> #define MASK_HINVAL_VVMA 0xfe007fff
> #define MATCH_HINVAL_GVMA 0x76000073
> #define MASK_HINVAL_GVMA 0xfe007fff
> Are they not the latest encodings?

The code in Spike seems to be buggy but that's a separate issue.

Refer, page 138 of
https://github.com/riscv/riscv-isa-manual/releases/download/draft-20220110-=
eae4f00/riscv-privileged.pdf

Regards,
Anup

>
> diff --git a/target/riscv/insn_trans/trans_svinval.c.inc b/target/riscv/i=
nsn_trans/trans_svinval.c.inc
> new file mode 100644
> index 0000000000..1dde665661
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_svinval.c.inc
> @@ -0,0 +1,75 @@
> +/*
> + * RISC-V translation routines for the Svinval Standard Instruction Set.
> + *
> + * Copyright (c) 2020-2021 PLCT lab
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#define REQUIRE_SVINVAL(ctx) do {                    \
> +    if (!RISCV_CPU(ctx->cs)->cfg.ext_svinval) {      \
> +        return false;                                \
> +    }                                                \
> +} while (0)
> +
> +static bool trans_sinval_vma(DisasContext *ctx, arg_sinval_vma *a)
> +{
> +    REQUIRE_SVINVAL(ctx);
> +    /* Do the same as sfence.vma currently */
> +    REQUIRE_EXT(ctx, RVS);
> +#ifndef CONFIG_USER_ONLY
> +    gen_helper_tlb_flush(cpu_env);
> +    return true;
> +#endif
> +    return false;
> +}
> +
> +static bool trans_sfence_w_inval(DisasContext *ctx, arg_sfence_w_inval *=
a)
> +{
> +    REQUIRE_SVINVAL(ctx);
> +    REQUIRE_EXT(ctx, RVS);
> +    /* Do nothing currently */
> +    return true;
> +}
> +
> +static bool trans_sfence_inval_ir(DisasContext *ctx, arg_sfence_inval_ir=
 *a)
> +{
> +    REQUIRE_SVINVAL(ctx);
> +    REQUIRE_EXT(ctx, RVS);
> +    /* Do nothing currently */
> +    return true;
> +}
> +
> +static bool trans_hinval_vvma(DisasContext *ctx, arg_hinval_vvma *a)
> +{
> +    REQUIRE_SVINVAL(ctx);
> +    /* Do the same as hfence.vvma currently */
> +    REQUIRE_EXT(ctx, RVH);
> +#ifndef CONFIG_USER_ONLY
> +    gen_helper_hyp_tlb_flush(cpu_env);
> +    return true;
> +#endif
> +    return false;
> +}
> +
> +static bool trans_hinval_gvma(DisasContext *ctx, arg_hinval_gvma *a)
> +{
> +    REQUIRE_SVINVAL(ctx);
> +    /* Do the same as hfence.gvma currently */
> +    REQUIRE_EXT(ctx, RVH);
> +#ifndef CONFIG_USER_ONLY
> +    gen_helper_hyp_gvma_tlb_flush(cpu_env);
> +    return true;
> +#endif
> +    return false;
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 615048ec87..4e5a9660a4 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -838,6 +838,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, t=
arget_ulong pc)
>  #include "insn_trans/trans_rvb.c.inc"
>  #include "insn_trans/trans_rvzfh.c.inc"
>  #include "insn_trans/trans_privileged.c.inc"
> +#include "insn_trans/trans_svinval.c.inc"
>
>  /* Include the auto-generated decoder for 16 bit insn */
>  #include "decode-insn16.c.inc"
> --
> 2.17.1
>
>
> Apart from the minor mistake above, it looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Regards,
> Anup
>
>
> Regards,
> Weiwei Li

