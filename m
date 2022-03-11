Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nSVfA-0006N3-Em
	for mharc-qemu-riscv@gnu.org; Thu, 10 Mar 2022 22:09:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nSVf9-0006Mp-0F; Thu, 10 Mar 2022 22:09:55 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=46859
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nSVf7-0005WH-4y; Thu, 10 Mar 2022 22:09:54 -0500
Received: by mail-io1-xd2e.google.com with SMTP id d62so8722815iog.13;
 Thu, 10 Mar 2022 19:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lb12b4ngtJEbu4dFiEnKcx0u14oZracj076XFWMDHPE=;
 b=gPDqS+ZmiF8IAU8mkUEvmzSA2KquP2Y44htjhUqzEIxn+ebVymYTe3EvKGmPzKFU7K
 fOu+LwBzB0Hc7uDbnptUmUeRX73D6SVUCxEjQf48hSUxOIsnU5cS7g3DIUQPXL7tM4wA
 hoKq3lBC8oLGjkuy7O4QYneg7sx1IjOqUAprYi9abgnTOwFN1AscxU+9aqdsSZ0t0AS1
 v/kxIOl0pO4B21lQKP0XGh+WJtO8omL7vsDfQyX/RN8awqDYKuqWqM39i7UX6wcNJHB1
 qLbEza1W0OWcVzJP6ce+vzEhRq+vunaCUZmyunz3c0K4/1pnzl9AoD2PKJu0oQBNzzEO
 1x0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lb12b4ngtJEbu4dFiEnKcx0u14oZracj076XFWMDHPE=;
 b=oNBDjTbicKl178K/W/wyRUp4aAQZ/0qdSoacwBgT+4UBSgPfYMSD3lGUKS/ep4x9zi
 S2KpC83vEcC1TaESx+IEKd8PyIGAywLd/zV8XyzOMkPUisAcs2fYhwCLi69L9TEvUwcH
 tPq6H8oD1ZGe+liWuksqwfuCvSAMO8Iu8pmYsNayKiVFCrLGRDgDwZ8+QJUf8PyxoMoE
 KFlMPWjrLwBOqFdpstt0PlieGpGp9PLj3H1S1HESD/aDKemLhDV7/Mt6cVOQI2POU6XO
 YdEoeODH7jPRlJYt/nWKBg+8rBtYYxS5L2ucQ+e0X52tg81cArPNTdBgVlAvq/YBCZuW
 LDGw==
X-Gm-Message-State: AOAM530COuB2BQ/DNtMUiM0YEQcVBcxca2EmFp8AHO3Awic/+72YjFZ3
 MKDYsrnAOd4FmYHV1loLim8OjTS5Pwy7cvHIltk=
X-Google-Smtp-Source: ABdhPJzF/06Qq80HoEWsbwfkmq8O49+WDJcGNtWF/9e/shH952DL0cQL4QrcfGkGjz8myYYsdK+5swusDbeaGoi+PbY=
X-Received: by 2002:a05:6602:2c0b:b0:63d:dfb2:9a95 with SMTP id
 w11-20020a0566022c0b00b0063ddfb29a95mr6377629iov.93.1646968191600; Thu, 10
 Mar 2022 19:09:51 -0800 (PST)
MIME-Version: 1.0
References: <20220301115828.355-1-liweiwei@iscas.ac.cn>
 <20220301115828.355-5-liweiwei@iscas.ac.cn>
In-Reply-To: <20220301115828.355-5-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Mar 2022 13:09:25 +1000
Message-ID: <CAKmqyKP8oYYkM4T19LMQ4qaykyFUC0LW4OUf6CB1spFnenYNDg@mail.gmail.com>
Subject: Re: [PATCH v8 04/14] target/riscv: rvk: add support for zbkx extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, luruibo2000@163.com, 
 lustrew@foxmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 11 Mar 2022 03:09:55 -0000

On Tue, Mar 1, 2022 at 10:06 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>  - add xperm4 and xperm8 instructions
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/bitmanip_helper.c          | 27 +++++++++++++++++++++++++
>  target/riscv/helper.h                   |  2 ++
>  target/riscv/insn32.decode              |  4 ++++
>  target/riscv/insn_trans/trans_rvb.c.inc | 18 +++++++++++++++++
>  4 files changed, 51 insertions(+)
>
> diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
> index e003e8b25b..b99c4a39a1 100644
> --- a/target/riscv/bitmanip_helper.c
> +++ b/target/riscv/bitmanip_helper.c
> @@ -102,3 +102,30 @@ target_ulong HELPER(zip)(target_ulong rs1)
>      x = do_shuf_stage(x, shuf_masks[0], shuf_masks[0] >> 1, 1);
>      return x;
>  }
> +
> +static inline target_ulong do_xperm(target_ulong rs1, target_ulong rs2,
> +                                    uint32_t sz_log2)
> +{
> +    target_ulong r = 0;
> +    target_ulong sz = 1LL << sz_log2;
> +    target_ulong mask = (1LL << sz) - 1;
> +    target_ulong pos;
> +
> +    for (int i = 0; i < TARGET_LONG_BITS; i += sz) {
> +        pos = ((rs2 >> i) & mask) << sz_log2;
> +        if (pos < sizeof(target_ulong) * 8) {
> +            r |= ((rs1 >> pos) & mask) << i;
> +        }
> +    }
> +    return r;
> +}
> +
> +target_ulong HELPER(xperm4)(target_ulong rs1, target_ulong rs2)
> +{
> +    return do_xperm(rs1, rs2, 2);
> +}
> +
> +target_ulong HELPER(xperm8)(target_ulong rs1, target_ulong rs2)
> +{
> +    return do_xperm(rs1, rs2, 3);
> +}
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 7331d32dbf..a1d28b257f 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -69,6 +69,8 @@ DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_1(brev8, TCG_CALL_NO_RWG_SE, tl, tl)
>  DEF_HELPER_FLAGS_1(unzip, TCG_CALL_NO_RWG_SE, tl, tl)
>  DEF_HELPER_FLAGS_1(zip, TCG_CALL_NO_RWG_SE, tl, tl)
> +DEF_HELPER_FLAGS_2(xperm4, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> +DEF_HELPER_FLAGS_2(xperm8, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>
>  /* Floating Point - Half Precision */
>  DEF_HELPER_FLAGS_3(fadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 3a49acab37..75ffac9c81 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -776,6 +776,10 @@ clmulh     0000101 .......... 011 ..... 0110011 @r
>  # *** RV32 extra Zbc Standard Extension ***
>  clmulr     0000101 .......... 010 ..... 0110011 @r
>
> +# *** RV32 Zbkx Standard Extension ***
> +xperm4     0010100 .......... 010 ..... 0110011 @r
> +xperm8     0010100 .......... 100 ..... 0110011 @r
> +
>  # *** RV32 Zbs Standard Extension ***
>  bclr       0100100 .......... 001 ..... 0110011 @r
>  bclri      01001. ........... 001 ..... 0010011 @sh
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 1980bfe971..54927ba763 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -48,6 +48,12 @@
>      }                                            \
>  } while (0)
>
> +#define REQUIRE_ZBKX(ctx) do {                   \
> +    if (!ctx->cfg_ptr->ext_zbkx) {               \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
>  static void gen_clz(TCGv ret, TCGv arg1)
>  {
>      tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
> @@ -574,3 +580,15 @@ static bool trans_zip(DisasContext *ctx, arg_zip *a)
>      REQUIRE_ZBKB(ctx);
>      return gen_unary(ctx, a, EXT_NONE, gen_helper_zip);
>  }
> +
> +static bool trans_xperm4(DisasContext *ctx, arg_xperm4 *a)
> +{
> +    REQUIRE_ZBKX(ctx);
> +    return gen_arith(ctx, a, EXT_NONE, gen_helper_xperm4, NULL);
> +}
> +
> +static bool trans_xperm8(DisasContext *ctx, arg_xperm8 *a)
> +{
> +    REQUIRE_ZBKX(ctx);
> +    return gen_arith(ctx, a, EXT_NONE, gen_helper_xperm8, NULL);
> +}
> --
> 2.17.1
>
>

