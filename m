Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1opIrl-0004Md-CV
	for mharc-qemu-riscv@gnu.org; Sun, 30 Oct 2022 20:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1opIrj-0004MN-B3; Sun, 30 Oct 2022 20:41:23 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1opIrh-0001YR-OD; Sun, 30 Oct 2022 20:41:23 -0400
Received: by mail-pf1-x42f.google.com with SMTP id b29so9329860pfp.13;
 Sun, 30 Oct 2022 17:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xa2BGEYBM42lzBiDHEBCI2RRWrikjCI5my/i9sol0p8=;
 b=KGxVCtUfWVoyQb8TM6JFtj1Rq7KMcP1v+xCgVJWH4lkXY2kb073aEwjj+Rs5mC4Qy0
 0FWxW3ia4y2azVitauRz1fsU5bvj07w3lHAv5yAMcZWNHdBUx8o5jqlNNk1cacm5Eblc
 AAwhCvkAE7n3nkFWzaownDvuZ2Fh4aG4rhn0Ufcu4T4hQbe71AdgGTZkYmpXr6+XK7m1
 ePSlxOE2XvQV+RX9ht4fyvn2h7mm2/tbd4C2JyfiDw1j7RerDoG8MwihNqvBwEmO75v+
 AlTmLcIVwx3TF4hVyEZcdCdZftpHSkdxreh3lXzDuqqFwVXryXWN3QVGrn3No6yLJAcx
 ntQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xa2BGEYBM42lzBiDHEBCI2RRWrikjCI5my/i9sol0p8=;
 b=xW+ejD3j/rh+iYorL+TNmAafbooTE0cAWcedeOjDh5Jyygm4knigsZgyJZzY4xwmf1
 fcY3o+3BCh/2JtMGTDvyjq0+37RGr258/Zb+4No1KJ6VKrjk4aq561pR7NTl2xWwtORF
 ja43M+vWC2phUoGVPQemrgG2SiW82f8IQ1YLW4thZvSMSoJ2nRij/8Fb0+WTnWaBodqu
 KzG2UKTezkzHdP4z0oqmzBSewfzCKnXjH2o+FiygZ9feOYRJQlNogzLGwu7IAki/67i0
 idAcpgwRE5aRIK5s2QyAW97v4RuKghWgVgxeHiS+qQd5oxQmsKEnXenjFCj7yQtdAtDQ
 SQLw==
X-Gm-Message-State: ACrzQf2tZZ8FstuN4X8vjFIZitdfDH1aEAOzK5RGQAZBQLg/uDPz40Dx
 C7GveOPgY/zlLBs+YsAIgJpNThvCOc2oXPbF3bg=
X-Google-Smtp-Source: AMsMyM6LR/sZTNfeXSI7eKeqlejxYeJefkrH6PNw+85i+dncijqL/3B7RU+h9cdfaUr6QieQSapcdPNeBzxLIQ6pwNw=
X-Received: by 2002:a05:6a00:2402:b0:52c:81cf:8df8 with SMTP id
 z2-20020a056a00240200b0052c81cf8df8mr11988662pfh.60.1667176878392; Sun, 30
 Oct 2022 17:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221027164743.194265-1-apatel@ventanamicro.com>
 <20221027164743.194265-2-apatel@ventanamicro.com>
In-Reply-To: <20221027164743.194265-2-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 31 Oct 2022 10:40:51 +1000
Message-ID: <CAKmqyKP5b3niJnm7f2yhpHxApm-ePVgNNee-OBvhksrAFE-FUA@mail.gmail.com>
Subject: Re: [PATCH 1/5] target/riscv: Typo fix in sstc() predicate
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42f.google.com
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
X-List-Received-Date: Mon, 31 Oct 2022 00:41:23 -0000

On Fri, Oct 28, 2022 at 2:52 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We should use "&&" instead of "&" when checking hcounteren.TM and
> henvcfg.STCE bits.
>
> Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 5c9a7ee287..716f9d960e 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -838,7 +838,7 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
>      }
>
>      if (riscv_cpu_virt_enabled(env)) {
> -        if (!(get_field(env->hcounteren, COUNTEREN_TM) &
> +        if (!(get_field(env->hcounteren, COUNTEREN_TM) &&
>                get_field(env->henvcfg, HENVCFG_STCE))) {
>              return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>          }
> --
> 2.34.1
>
>

