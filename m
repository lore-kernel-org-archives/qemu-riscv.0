Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQFDm-0000MK-66
	for mharc-qemu-riscv@gnu.org; Mon, 22 Aug 2022 17:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oQFDk-0000LJ-EK; Mon, 22 Aug 2022 17:44:32 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:44019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oQFDf-0006ZX-C2; Mon, 22 Aug 2022 17:44:31 -0400
Received: by mail-pg1-x535.google.com with SMTP id v4so10561271pgi.10;
 Mon, 22 Aug 2022 14:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=uB4Y0B3Sx4jBeQlEByaU38tTnklc547wZ+HBNhn4ZkE=;
 b=dxGko2gv3oPy4RHzZhJZlMJD8MKlq23D8b5nCZY70bJ1AJvVhSJSty9qMET512tuT/
 RgEIsmAjAKPXkXSZyxNS2GvrQeqnAeWu2A/LfOc8WaAJFZcCk90r98duM2t1qzg2a3u5
 +zxNHVgj3d8rwOy8oDCSVJul/aaY7hIJSZUiRgZM1GvpVsI0ea7HA0ZtPkscPbAybMUf
 WhS/LQa14ls1H/r0+rpmlkgaeM1DHu8aXUve/HJ++LN/J8vOhPnGjOxVfF+sJ3ANTBGh
 sAOwUl/oi0QY8vjaUO4GAvP3lqgASwhIEQruvygxE8I1lpwd5mF2Jty8uQDgg1zs7HGW
 ueMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=uB4Y0B3Sx4jBeQlEByaU38tTnklc547wZ+HBNhn4ZkE=;
 b=TWqU6ApBe2uo48pUSItnTM5W91CmpAtic+YMNaIs7Y+zcb7Q3fpR5eYdj2sKvTWe6w
 kWY0dtWz2AmMLdmxPlzwCiaDFkRykRzmF3vjJ3Tyq24ECNTwrMdakiJBpHNlMpIUisXT
 2YMChxVQvYg5qcsPeCuJH5qXPntQe504O0XaTmbbQHDIlpd514jdvodDQjHxem7DnGcQ
 fE2KZKUxp6dDSRoAvnQo0/hN6fHUj/Jg5htBnQi02fcjCIii+PK/JG12JQjHPHL4EVwG
 x5FTmFGRfyDC9KgLSNHXnd72aTkjziAZLojIR/qXj2LDyGAT1OLgSfPu5C5J/WaqmIuK
 NLwQ==
X-Gm-Message-State: ACgBeo2eqnA5VWVCrDJ5lkEl0allYdgRwZkorYVnsyFsnP1Z+6DUtnx0
 P2jMpHGBpAjAgKLyBYOpgfs44blTdVd7wX8bHlo=
X-Google-Smtp-Source: AA6agR7xn9DjQoLLQRX1iBKyD9/zpJqQ7W61r94jXZCX6YV2pukMJwL1LcQCnaufnonYv+I8NhpmuQfrrPmrnMTpAGI=
X-Received: by 2002:a63:90c8:0:b0:41d:f6f6:49cc with SMTP id
 a191-20020a6390c8000000b0041df6f649ccmr14318713pge.223.1661204650691; Mon, 22
 Aug 2022 14:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220822141230.3658237-1-peter.maydell@linaro.org>
 <20220822141230.3658237-8-peter.maydell@linaro.org>
In-Reply-To: <20220822141230.3658237-8-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 23 Aug 2022 07:43:44 +1000
Message-ID: <CAKmqyKN8W9mmYKnegdhynYcet4y5upC5m78Kr4bC+e+1yAtvyQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] target/riscv: Honour -semihosting-config
 userspace=on and enable=on
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 Furquan Shaikh <furquan@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 22 Aug 2022 21:44:32 -0000

On Tue, Aug 23, 2022 at 4:55 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The riscv target incorrectly enabled semihosting always, whether the
> user asked for it or not.  Call semihosting_enabled() passing the
> correct value to the is_userspace argument, which fixes this and also
> handles the userspace=on argument.  Because we do this at translate
> time, we no longer need to check the privilege level in
> riscv_cpu_do_interrupt().
>
> Note that this is a behaviour change: we used to default to
> semihosting being enabled, and now the user must pass
> "-semihosting-config enable=on" if they want it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c                      | 9 +++------
>  target/riscv/translate.c                       | 1 +
>  target/riscv/insn_trans/trans_privileged.c.inc | 3 ++-
>  3 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 59b3680b1b2..2b84febf275 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1342,12 +1342,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      target_ulong mtval2 = 0;
>
>      if  (cause == RISCV_EXCP_SEMIHOST) {
> -        if (env->priv >= PRV_S) {
> -            do_common_semihosting(cs);
> -            env->pc += 4;
> -            return;
> -        }
> -        cause = RISCV_EXCP_BREAKPOINT;
> +        do_common_semihosting(cs);
> +        env->pc += 4;
> +        return;
>      }
>
>      if (!async) {
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 63b04e8a948..f9e6258ec5d 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -28,6 +28,7 @@
>
>  #include "exec/translator.h"
>  #include "exec/log.h"
> +#include "semihosting/semihost.h"
>
>  #include "instmap.h"
>  #include "internals.h"
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
> index 46f96ad74d4..3281408a874 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -52,7 +52,8 @@ static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
>       * that no exception will be raised when fetching them.
>       */
>
> -    if ((pre_addr & TARGET_PAGE_MASK) == (post_addr & TARGET_PAGE_MASK)) {
> +    if (semihosting_enabled(ctx->mem_idx < PRV_S) &&
> +        (pre_addr & TARGET_PAGE_MASK) == (post_addr & TARGET_PAGE_MASK)) {
>          pre    = opcode_at(&ctx->base, pre_addr);
>          ebreak = opcode_at(&ctx->base, ebreak_addr);
>          post   = opcode_at(&ctx->base, post_addr);
> --
> 2.25.1
>
>

