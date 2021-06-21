Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lvSJo-00064X-RR
	for mharc-qemu-riscv@gnu.org; Mon, 21 Jun 2021 18:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lvSJn-00063g-1v; Mon, 21 Jun 2021 18:22:59 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:46056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lvSJl-0004eM-4m; Mon, 21 Jun 2021 18:22:58 -0400
Received: by mail-il1-x135.google.com with SMTP id b5so4763874ilc.12;
 Mon, 21 Jun 2021 15:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IiE1VKGqWYXwFp1RDBwFB2Fjdyg+oNCDkKyRqq51QsA=;
 b=UGP0WLksAyXec5N+FZPTZLCW0ojyUbXpGYi4VAWKNyDZDtspRk8As5Q6rFPiZ0UjSH
 igbsMlJFIKwQbC0Wyc/ROnin4hEyPmmV9jQ6aDzekoGGKlTmrIcoaj+llRmERUmQ4OKV
 bso4Ip9xPWQ18vK7u0k8+CVheZK3iSPnaqGNbfCs20QoiRlIEyu1NX7DRZie3MO0/mRL
 lql9u26pz/S79yj7j1nHTYbzp4nwChpJ3kjnLSxnnMTswecP/+m1mJuKpUpMuw6SkFWj
 w0ayJFi2T6fIgeoguCqh7t8FWchMdQnUac2Sd0Y4fV4q1RYYm7kHTZ62n2r8vKAwFcmo
 UIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IiE1VKGqWYXwFp1RDBwFB2Fjdyg+oNCDkKyRqq51QsA=;
 b=gZmhUXaPCT9rlNLPkLxyYueqlGQ0LCq08oAoW2QhH/2lBuliNy5L0vDC0b6QHz5fFT
 21V+18vDY+UaCyZUBRDcnbZWS8k/NgqGWEI2kd6pSX1M8GmmB2sSpMbOdpws2wsqSme1
 AahY6VxjOHiP7BpYi7GkZTon1OWqVGcv5tjAyNLR+DkKzIBdpsWvoJuI1rzX7GBzuf9Y
 llIXEJxp0GgXs539bLKo0IJAGRnt9ilSPk5seEm/AepljW1ztoyxCrC2aRs8QVhIj5mk
 yXk6AbE8Tbp4nwm1pjkN068y385j2IqTf7tT/+TKnL0PFDkPPW8ZpdXsYyN4JQHKWwG4
 fPPg==
X-Gm-Message-State: AOAM530TmCblSlx717NZjdNEQuJMZkmPMAQR7tUJGfj0xmtQPi7dN2Xy
 pgueU843EKjyucLFL2cajX8E7DfeE3Ptnr3XKqY=
X-Google-Smtp-Source: ABdhPJzf6avQX+i07+iU4fhjkLJrQnyFJdRcMDOgb9mTacl0jI26LqUndVhCEMCtdySPbaujZseEmA7gcuHsoE8nqNg=
X-Received: by 2002:a05:6e02:20c3:: with SMTP id
 3mr324673ilq.131.1624314175004; 
 Mon, 21 Jun 2021 15:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
 <20210621013439.1791385-19-richard.henderson@linaro.org>
In-Reply-To: <20210621013439.1791385-19-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Jun 2021 08:22:29 +1000
Message-ID: <CAKmqyKMAKGtyidZ4n3AO3WEHRsDxKCiHMVrm+Q5yQqvyfeabmA@mail.gmail.com>
Subject: Re: [PATCH 18/26] target/riscv: Use translator_use_goto_tb
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x135.google.com
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
X-List-Received-Date: Mon, 21 Jun 2021 22:22:59 -0000

On Mon, Jun 21, 2021 at 11:47 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Just use translator_use_goto_tb directly at the one call site,
> rather than maintaining a local wrapper.
>
> Cc: qemu-riscv@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index c6e8739614..ecd3764338 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -168,29 +168,11 @@ static void gen_exception_inst_addr_mis(DisasContext *ctx)
>      generate_exception_mtval(ctx, RISCV_EXCP_INST_ADDR_MIS);
>  }
>
> -static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
> -{
> -    if (unlikely(ctx->base.singlestep_enabled)) {
> -        return false;
> -    }
> -
> -#ifndef CONFIG_USER_ONLY
> -    return (ctx->base.tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
> -#else
> -    return true;
> -#endif
> -}
> -
>  static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>  {
> -    if (use_goto_tb(ctx, dest)) {
> -        /* chaining is only allowed when the jump is to the same page */
> +    if (translator_use_goto_tb(&ctx->base, dest)) {
>          tcg_gen_goto_tb(n);
>          tcg_gen_movi_tl(cpu_pc, dest);
> -
> -        /* No need to check for single stepping here as use_goto_tb() will
> -         * return false in case of single stepping.
> -         */
>          tcg_gen_exit_tb(ctx->base.tb, n);
>      } else {
>          tcg_gen_movi_tl(cpu_pc, dest);
> --
> 2.25.1
>
>

