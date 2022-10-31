Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1opItO-00054d-RP
	for mharc-qemu-riscv@gnu.org; Sun, 30 Oct 2022 20:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1opItO-00054S-87; Sun, 30 Oct 2022 20:43:06 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1opItM-00020r-C6; Sun, 30 Oct 2022 20:43:05 -0400
Received: by mail-pg1-x536.google.com with SMTP id h2so9413725pgp.4;
 Sun, 30 Oct 2022 17:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dv7RV+2jE11/zRwrhRGq17uD3u722NLv1XHaLp3qGZ0=;
 b=IfPA9OUZgEtkJiHXkyGRUqByrLjdvLCboxJ5Cc+NVlkY4w4bWUVjBkequeKhSrBBbJ
 KEnKL7DPlMeQbQ9RKDQiy81pFpI/BBzqkhr7Mm6nqdRrYCkA5YXDzqKphEW0pY90s+or
 vWRj3fwVKyhS+8dwY9m+LMxG4OWPiK1Our0mtHj6P2HJU8KKgrSeLMYXc16sBVZ+H0h8
 6nfF0MGd5OvvPvUT2dr2GMA3op3qejWem3hmJtB0y32bMS2zfdV1CMIPSp7PZ7EL7Rwn
 Lr5Oq87ijicaHMyFF0cU4vNNY4h4ZhUjBjO3siOtT8nUlLYS7j822vKds0yaScayCkoO
 DZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dv7RV+2jE11/zRwrhRGq17uD3u722NLv1XHaLp3qGZ0=;
 b=DO11ZYdG/1CTsIdOdL//RvX+dIr9YSmSGuOwcP43wfc8mk0RYGM91AKFAO5xAc18Iq
 uj090+D9wRiBwAUkPJjwW/4/XQCY+M717lZGeHhNRy504BSSDfa4TGDSgNHGSrdcAoPo
 Zmkk0kiWaep+VfvYR8lrQqmGBzqRIn+1i773KDixvlOPBZWYn3JAxNvaPTuRJbAQcrQg
 96LnALhKmI1zkltTaQXChYRLPTrRY9uCzPe9lbe4LpD6Gfko+uBpZdwc0XPomJwkzH1u
 m98i5bhEjZq7+aaH1iQ1n30cLzY9uK4CP+bb3GwT+SJqxlVwkoZl1A9yFd4x69J5oTpm
 SHew==
X-Gm-Message-State: ACrzQf2dAtSqmNJx0btC6Pfrq8zx/i8HpV1LtEwhbcjg89w+/IiLaqzm
 BBEjGBDralWW5Gly2oiQc4ev1kpLycsWt0Y1dL8=
X-Google-Smtp-Source: AMsMyM5+JEoX3JUnk2hLrPy7AXnJMG1tg4tfnrn5/z1KKEG8gwjdvwpd+L+pukzXlnC2dBCtHArLej+UL+0Mihz50q8=
X-Received: by 2002:a05:6a00:1a94:b0:56d:267e:a200 with SMTP id
 e20-20020a056a001a9400b0056d267ea200mr8703282pfv.13.1667176982562; Sun, 30
 Oct 2022 17:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221027164743.194265-1-apatel@ventanamicro.com>
 <20221027164743.194265-3-apatel@ventanamicro.com>
In-Reply-To: <20221027164743.194265-3-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 31 Oct 2022 10:42:36 +1000
Message-ID: <CAKmqyKOC429UT17ZmtsLNK8wyBVVOE6iFCLJLU=1_7fJ_LYX7Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] target/riscv: Update VS timer whenever htimedelta
 changes
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x536.google.com
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
X-List-Received-Date: Mon, 31 Oct 2022 00:43:06 -0000

On Fri, Oct 28, 2022 at 2:52 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The htimedelta[h] CSR has impact on the VS timer comparison so we
> should call riscv_timer_write_timecmp() whenever htimedelta changes.
>
> Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 716f9d960e..4b1a608260 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -2722,6 +2722,8 @@ static RISCVException read_htimedelta(CPURISCVState *env, int csrno,
>  static RISCVException write_htimedelta(CPURISCVState *env, int csrno,
>                                         target_ulong val)
>  {
> +    RISCVCPU *cpu = env_archcpu(env);
> +
>      if (!env->rdtime_fn) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
> @@ -2731,6 +2733,12 @@ static RISCVException write_htimedelta(CPURISCVState *env, int csrno,
>      } else {
>          env->htimedelta = val;
>      }
> +
> +    if (cpu->cfg.ext_sstc && env->rdtime_fn) {
> +        riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
> +                                  env->htimedelta, MIP_VSTIP);
> +    }
> +
>      return RISCV_EXCP_NONE;
>  }
>
> @@ -2748,11 +2756,19 @@ static RISCVException read_htimedeltah(CPURISCVState *env, int csrno,
>  static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
>                                          target_ulong val)
>  {
> +    RISCVCPU *cpu = env_archcpu(env);
> +
>      if (!env->rdtime_fn) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
>      env->htimedelta = deposit64(env->htimedelta, 32, 32, (uint64_t)val);
> +
> +    if (cpu->cfg.ext_sstc && env->rdtime_fn) {
> +        riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
> +                                  env->htimedelta, MIP_VSTIP);
> +    }
> +
>      return RISCV_EXCP_NONE;
>  }
>
> --
> 2.34.1
>
>

