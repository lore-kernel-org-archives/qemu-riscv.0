Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfFzc-0005lV-Si
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfFzS-0005iz-Dr; Tue, 26 Oct 2021 02:31:21 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:34605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfFzP-0007DY-Fj; Tue, 26 Oct 2021 02:31:18 -0400
Received: by mail-io1-xd36.google.com with SMTP id m184so10328iof.1;
 Mon, 25 Oct 2021 23:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tiq/AaXS9c/W2CgipPkjtpdYd/dwEe4FfD0Y5SlKrJE=;
 b=iGgD8g4hW1l8Wljp0XknankYb3Ba5L/U8Bp6JmLCKiSj44cPIvpoP9/T3zJogt9c7e
 UTmjVd4+nWQywRzR0d+a9gijISxhgpR9IFW/ioiixyw1UnAcUs0c+NOn20nfT7kIOciC
 0yk6v1OmPkGf4levSPaP/av4QwHCG4irn30tdNLSBx/1KtQRJGyd5mCDLgL3ZWBNML3S
 9tbgHh9E4eVDWIy/uxdxww9s35Q6E8mMI7wHAD8aEFk7Br2KmUiFWwcPGmt2f2ZfCiUv
 s0xiryGP+4clfsEsqxorJk7DcGCalxv8wQ/Nabf2EPHCcKh0NOFs92wBx8M37m6IjfBh
 tjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tiq/AaXS9c/W2CgipPkjtpdYd/dwEe4FfD0Y5SlKrJE=;
 b=yOM7vOsSGUoiUI5KFOydbEFLv0Pahrum6MD/cMA1UIjzwqvXniftj5zZNt/u3ev10E
 G5jUSd9G3F2OA972MDMyzUIhZYHMvTDcF0WUBptmT9Q5GRHiC56naEj82KTJJ57Q/fPW
 ZCBf6QjvfmU+pD6fXM0NmE8CxwiUgBDB7zH2+eNPWZBEt2HaRgeM/AM5R4ch51UjxfVk
 qwbMuvBBULbZD3+vFgmpacVCORmoJ3ELPueSLtISvtCEmTpDVIh7kTdaUtsu6Rxsmt+l
 1J9W8AGpPYmK9lCmJMPisq+3Rvz4YCpdMaSlJEhs8INGjSkBbC8eAp2limoC00STuEPO
 HtlA==
X-Gm-Message-State: AOAM533NgBMuh2sNeWeSGV7s33s+01mn3pHuFewdusbAEZr9w2TjXfyN
 Tgo+n8SHBh6+aPfIcW49gemUkuZMqPF7YVAGW78=
X-Google-Smtp-Source: ABdhPJxNKGpg5TudKnmGq8i0x9+TwDQ3uUeI/8MFqoFi29gVuC7bb40HwX70VY1r8Gxmnz07DRB2EipGzLo19jnlt8s=
X-Received: by 2002:a05:6638:1489:: with SMTP id
 j9mr14119826jak.18.1635229874163; 
 Mon, 25 Oct 2021 23:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-71-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-71-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 Oct 2021 16:30:48 +1000
Message-ID: <CAKmqyKOVeaMjRDCD5fwyHu_A+o28f8RGocTf0nzaUByi6Wp-DA@mail.gmail.com>
Subject: Re: [PATCH v8 63/78] target/riscv: add "set round to odd" rounding
 mode helper function
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 26 Oct 2021 06:31:24 -0000

On Fri, Oct 15, 2021 at 6:39 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> helper_set_rounding_mode() is responsible for SIGILL, and "round to odd"
> should be an interface private to translation, so add a new independent
> helper_set_rod_rounding_mode().
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/fpu_helper.c | 5 +++++
>  target/riscv/helper.h     | 1 +
>  target/riscv/internals.h  | 1 +
>  target/riscv/translate.c  | 7 +++++++
>  4 files changed, 14 insertions(+)
>
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index 43ce6148313..cf21097b5fb 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -81,6 +81,11 @@ void helper_set_rounding_mode(CPURISCVState *env, uint32_t rm)
>      set_float_rounding_mode(softrm, &env->fp_status);
>  }
>
> +void helper_set_rod_rounding_mode(CPURISCVState *env)
> +{
> +    set_float_rounding_mode(float_round_to_odd, &env->fp_status);
> +}
> +
>  static uint64_t do_fmadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
>                             uint64_t rs3, int flags)
>  {
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 53cf88cd402..606bf72d5cb 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -3,6 +3,7 @@ DEF_HELPER_2(raise_exception, noreturn, env, i32)
>
>  /* Floating Point - rounding mode */
>  DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
> +DEF_HELPER_FLAGS_1(set_rod_rounding_mode, TCG_CALL_NO_WG, void, env)
>
>  /* Floating Point - fused */
>  DEF_HELPER_FLAGS_4(fmadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index db105d4d640..065e8162a2f 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -43,6 +43,7 @@ enum {
>      RISCV_FRM_RUP = 3,  /* Round Up */
>      RISCV_FRM_RMM = 4,  /* Round to Nearest, ties to Max Magnitude */
>      RISCV_FRM_DYN = 7,  /* Dynamic rounding mode */
> +    RISCV_FRM_ROD = 8,  /* Round to Odd */
>  };
>
>  static inline uint64_t nanbox_s(float32 f)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 6a3f105d431..6fa7e016e22 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -30,6 +30,7 @@
>  #include "exec/log.h"
>
>  #include "instmap.h"
> +#include "internals.h"
>
>  /* global register indices */
>  static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
> @@ -382,6 +383,12 @@ static void gen_set_rm(DisasContext *ctx, int rm)
>          return;
>      }
>      ctx->frm = rm;
> +
> +    if (rm == RISCV_FRM_ROD) {
> +        gen_helper_set_rod_rounding_mode(cpu_env);
> +        return;
> +    }
> +
>      gen_helper_set_rounding_mode(cpu_env, tcg_constant_i32(rm));
>  }
>
> --
> 2.25.1
>
>

