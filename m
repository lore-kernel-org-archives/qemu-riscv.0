Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1opIvj-0005vQ-5E
	for mharc-qemu-riscv@gnu.org; Sun, 30 Oct 2022 20:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1opIvh-0005vB-LJ; Sun, 30 Oct 2022 20:45:29 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1opIvg-0002oK-3S; Sun, 30 Oct 2022 20:45:29 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 3-20020a17090a0f8300b00212d5cd4e5eso14510622pjz.4; 
 Sun, 30 Oct 2022 17:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A2M15mjYDnaTvpxVqj65HghXm4eKXw4o/c73VZEVCyA=;
 b=IXpQz+wLVtugYYA9CH0gwzSrz5QPxgO2ExMzmsW+j+Ghsxr3b6gAejJydhqinON36o
 YPW6ZdIXT//cZXTgDdDNdgEanLUnK/6GUxusmHffv8ewv9sSiXDmFJizj3xq8Pjzg0uw
 h/lgPuV0EPDpaGkI2Lb3cZmew45n03bR2Xzry0XIqogh0+84FEfiROC03GjlP0+KUGoz
 3d8I3zw1bSfQo1f7ud+nVMMJB3MRULFeOx6uYe3qT9mKmjo09kN0LP4tn1fATy9M+LqY
 9H6A1rV9UhWG2NWFG4QH/PxuLKIGwvk6DrWpmTiHaldEWRACf4GPMDHFUVlTPXIpLEBr
 Ajcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A2M15mjYDnaTvpxVqj65HghXm4eKXw4o/c73VZEVCyA=;
 b=M8i00TxXpont+VOdYWpOfnrAjIvRO/UOZnntfaxVXI5kSkemXTDdVSpNEHHvXyqPFz
 mJXtifp2ddmE13JbsosndOCOWHNJP95VRyCUUC7dS0tAXfkU3g+R9f9vJdbPSlfeWHAP
 u+KhotqC6PRJLFPJcK72jYEbgEymEaQcsdbJeh7vXCeFjRf6OjP0H8jUxCuVlf2zCdB8
 GiFTU5sVkgjHdhuhk5rktiJl+3zFBHCR4b5DePD02Y11NKDBNik7jPEoWT0CPdXYfbIv
 doSJoQV0eji/ptaQDd03r6ewS3LSCRnx80PiTQmelSfrFFJIn++x6Kwj9I3VCXgGx5JA
 T53w==
X-Gm-Message-State: ACrzQf2fZIxu+TozPxlWWQQry0ljhtTX8pr1ms/1Sto8Po+4XdHUFYeu
 2+0VN/4oIss3kY5ErD4MepDIJqrMxCzwh9dEIak=
X-Google-Smtp-Source: AMsMyM68ovHa1Bb9t2F1k2mfuf/vsURMCtNEgH9tcmTrfT+dAa7Cu8punr3gnr/2Da+ARvofnIhIvr4dRqjD+WwdOtk=
X-Received: by 2002:a17:902:7294:b0:187:146c:316f with SMTP id
 d20-20020a170902729400b00187146c316fmr6149273pll.149.1667177126331; Sun, 30
 Oct 2022 17:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221027164743.194265-1-apatel@ventanamicro.com>
 <20221027164743.194265-4-apatel@ventanamicro.com>
In-Reply-To: <20221027164743.194265-4-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 31 Oct 2022 10:44:59 +1000
Message-ID: <CAKmqyKP9pXUKkfMAj_RJa8LbJ870ExgzM6vc96_Pq0B+GtErew@mail.gmail.com>
Subject: Re: [PATCH 3/5] target/riscv: Don't clear mask in
 riscv_cpu_update_mip() for VSTIP
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Mon, 31 Oct 2022 00:45:29 -0000

On Fri, Oct 28, 2022 at 2:52 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Instead of clearing mask in riscv_cpu_update_mip() for VSTIP, we
> should call riscv_cpu_update_mip() with mask == 0 from timer_helper.c
> for VSTIP.
>
> Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c  |  2 --
>  target/riscv/time_helper.c | 12 ++++++++----
>  2 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 5d66246c2c..a403825e49 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -617,8 +617,6 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
>          vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
>      }
>
> -    /* No need to update mip for VSTIP */
> -    mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
>      vstip = env->vstime_irq ? MIP_VSTIP : 0;
>
>      if (!qemu_mutex_iothread_locked()) {
> diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
> index 8cce667dfd..4fb2a471a9 100644
> --- a/target/riscv/time_helper.c
> +++ b/target/riscv/time_helper.c
> @@ -27,7 +27,7 @@ static void riscv_vstimer_cb(void *opaque)
>      RISCVCPU *cpu = opaque;
>      CPURISCVState *env = &cpu->env;
>      env->vstime_irq = 1;
> -    riscv_cpu_update_mip(cpu, MIP_VSTIP, BOOL_TO_MASK(1));
> +    riscv_cpu_update_mip(cpu, 0, BOOL_TO_MASK(1));
>  }
>
>  static void riscv_stimer_cb(void *opaque)
> @@ -57,16 +57,20 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
>           */
>          if (timer_irq == MIP_VSTIP) {
>              env->vstime_irq = 1;
> +            riscv_cpu_update_mip(cpu, 0, BOOL_TO_MASK(1));
> +        } else {
> +            riscv_cpu_update_mip(cpu, MIP_STIP, BOOL_TO_MASK(1));
>          }
> -        riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(1));
>          return;
>      }
>
> +    /* Clear the [VS|S]TIP bit in mip */
>      if (timer_irq == MIP_VSTIP) {
>          env->vstime_irq = 0;
> +        riscv_cpu_update_mip(cpu, 0, BOOL_TO_MASK(0));
> +    } else {
> +        riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
>      }
> -    /* Clear the [V]STIP bit in mip */
> -    riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
>
>      /* otherwise, set up the future timer interrupt */
>      diff = timecmp - rtc_r;
> --
> 2.34.1
>
>

