Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nFQZJ-0000aw-Tr
	for mharc-qemu-riscv@gnu.org; Wed, 02 Feb 2022 20:05:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nFQYs-0000Yn-6x; Wed, 02 Feb 2022 20:05:24 -0500
Received: from [2607:f8b0:4864:20::12e] (port=36741
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nFQYd-0008V4-Hl; Wed, 02 Feb 2022 20:05:19 -0500
Received: by mail-il1-x12e.google.com with SMTP id z18so876257ilp.3;
 Wed, 02 Feb 2022 17:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FmjceKHdWGyoB/Vs0Zw7IwEqURQNufibzpc9IMPBW+c=;
 b=PJ4UbeIEKLw8CXBRVaJqBgr1xOqD6ae16qPku4GwyLp2SWjEPQ6gpqodia8ueXY4J7
 jnqrwHzdpEBRXdi2Uyfjungh55vfC1YAe8Pn0hTdSHd8AbZKyLUYLkjB2PPNFaRAQuYP
 mRADvtSFp9xiObYjPqSsAKSowCApCcWdAiSQyLWQW5i1woooMy++gqm+R+5JVPiVeRUY
 xWmnk48WZGttq2NH3zAQ/PZyCKCY4jM24KbkbASpTyWRVeMeyaMWpqybN5Zj+I1ouAFZ
 BNMK02eQAVe+M/q7NLln7reg8rKZ2aCRqtNQe7SQ6Y/1Os6IT4z/X0PivbN1zh8Yldk+
 JdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FmjceKHdWGyoB/Vs0Zw7IwEqURQNufibzpc9IMPBW+c=;
 b=2gvZYI3LLdeW/uJQoEhNAc4UCITMYxnPmN6B7SHK+hAOQWCAiQNUQa9CH38H40GGKs
 ibkA9O8NHt7Lrbm8EPKRNadHDL1+khkU6scc2WCDwH/HLn9R2Pokzp3QyyqHHrGj51ws
 ovU4/Aj/goXBS/4AYwS2DhQMYSB1GnbEPHRT0a0kQ1rchp8ho+DUNjkc/JrY7nXMpKS6
 TLGa8mSFRSde/xOWs8RXfKLUDUR5tuD6Wg04UJk0pLz5uWRDSECzpkMItAqeZFPofjBt
 gd3MKIxEFpMNDNRU7AkhqESLq/lpOt3v9uOYn1A8CCjuHow5pO+RwiIQ+2Q54XZHz5N0
 Kyjg==
X-Gm-Message-State: AOAM531JPaMBY0d4t5ERq3jaxEPw0dL2XCdgE+x1bjMVuh6yPVe+Wv/z
 EiuzsUE+I1bJk3K6i9ficCkvghItk4gwG2y5/28=
X-Google-Smtp-Source: ABdhPJwhkaHjYCt3mll+IzKn9txQWKHgcYugUY9MmuP/Z4xNYWXFpgxCxErO6yLXXxaBEijYfJTjOqEqw5GOJ+osmJc=
X-Received: by 2002:a05:6e02:1307:: with SMTP id
 g7mr8110264ilr.46.1643850303116; 
 Wed, 02 Feb 2022 17:05:03 -0800 (PST)
MIME-Version: 1.0
References: <20220201142415.29980-1-liweiwei@iscas.ac.cn>
 <20220201142415.29980-5-liweiwei@iscas.ac.cn>
In-Reply-To: <20220201142415.29980-5-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 3 Feb 2022 11:04:36 +1000
Message-ID: <CAKmqyKMiHmvFjbbvCsqLaXnLVmPcAbzx2yrjBHrrNQu0t8w_cA@mail.gmail.com>
Subject: Re: [PATCH v8 4/5] target/riscv: add support for svinval extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
X-List-Received-Date: Thu, 03 Feb 2022 01:05:30 -0000

On Wed, Feb 2, 2022 at 2:46 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> - sinval.vma, hinval.vvma and hinval.gvma do the same as sfence.vma, hfence.vvma and hfence.gvma except extension check
> - do nothing other than extension check for sfence.w.inval and sfence.inval.ir
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
> index cfaccdfc72..4442c4b81d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -729,6 +729,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>
> +    DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>
>      DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 8e7c33c9cb..5622478eb5 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -324,6 +324,7 @@ struct RISCVCPUConfig {
>      bool ext_counters;
>      bool ext_ifencei;
>      bool ext_icsr;
> +    bool ext_svinval;
>      bool ext_svnapot;
>      bool ext_svpbmt;
>      bool ext_zfh;
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 5bbedc254c..1d3ff1efe1 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -809,3 +809,10 @@ fcvt_l_h   1100010  00010 ..... ... ..... 1010011 @r2_rm
>  fcvt_lu_h  1100010  00011 ..... ... ..... 1010011 @r2_rm
>  fcvt_h_l   1101010  00010 ..... ... ..... 1010011 @r2_rm
>  fcvt_h_lu  1101010  00011 ..... ... ..... 1010011 @r2_rm
> +
> +# *** Svinval Standard Extension ***
> +sinval_vma        0001011 ..... ..... 000 00000 1110011 @sfence_vma
> +sfence_w_inval    0001100 00000 00000 000 00000 1110011
> +sfence_inval_ir   0001100 00001 00000 000 00000 1110011
> +hinval_vvma       0010011 ..... ..... 000 00000 1110011 @hfence_vvma
> +hinval_gvma       0110011 ..... ..... 000 00000 1110011 @hfence_gvma
> diff --git a/target/riscv/insn_trans/trans_svinval.c.inc b/target/riscv/insn_trans/trans_svinval.c.inc
> new file mode 100644
> index 0000000000..2682bd969f
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_svinval.c.inc
> @@ -0,0 +1,75 @@
> +/*
> + * RISC-V translation routines for the Svinval Standard Instruction Set.
> + *
> + * Copyright (c) 2020-2022 PLCT lab
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#define REQUIRE_SVINVAL(ctx) do {          \
> +    if (!ctx->cfg_ptr->ext_svinval) {      \
> +        return false;                      \
> +    }                                      \
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
> +static bool trans_sfence_w_inval(DisasContext *ctx, arg_sfence_w_inval *a)
> +{
> +    REQUIRE_SVINVAL(ctx);
> +    REQUIRE_EXT(ctx, RVS);
> +    /* Do nothing currently */
> +    return true;
> +}
> +
> +static bool trans_sfence_inval_ir(DisasContext *ctx, arg_sfence_inval_ir *a)
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
> index eaf5a72c81..84dbfa6340 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -862,6 +862,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>  #include "insn_trans/trans_rvb.c.inc"
>  #include "insn_trans/trans_rvzfh.c.inc"
>  #include "insn_trans/trans_privileged.c.inc"
> +#include "insn_trans/trans_svinval.c.inc"
>  #include "insn_trans/trans_xventanacondops.c.inc"
>
>  /* Include the auto-generated decoder for 16 bit insn */
> --
> 2.17.1
>
>

