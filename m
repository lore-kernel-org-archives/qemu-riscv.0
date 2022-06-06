Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ny5nY-0000xD-Tf
	for mharc-qemu-riscv@gnu.org; Mon, 06 Jun 2022 02:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ny5nC-0000vp-M6; Mon, 06 Jun 2022 02:00:56 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:41780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ny5n9-0006hv-C9; Mon, 06 Jun 2022 02:00:45 -0400
Received: by mail-oi1-x22a.google.com with SMTP id r206so18420905oib.8;
 Sun, 05 Jun 2022 23:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kbKlOpAIKnJtA2tnmLqHzB/gCRQSZIB1LsnoQfT7+Xw=;
 b=C9LA06OibofPymTrvt3/rc+R7EdrONdZYVf6Aqs/Vr31Iq6yJeDjkp1IjwiwEUgqIE
 TXeFLEkOU8FecHuoYXPUkDOVUVZ/AsTO6LmUvxWEJHCrMPsPqHRofarMQuLA/dxLMVcc
 haaRC0l4S/+W+tCK9YqBwJaXrNfjASRdzP1fUNMilWqw6cuMYi9FzCwcJDdVrSABOUXW
 Z7YppiW8Dc9/dBzJJIZCFRzrhm7jeUVa6gb02q/5aqn/NOEziND05rXSjZ+sYaQM92Pn
 bn8tckBbMWaY09HeLdJUKuYycBTHmiFnTIFVKatwJu6x5rWy3TwV7F1uJGxnL1/LDI+/
 TWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kbKlOpAIKnJtA2tnmLqHzB/gCRQSZIB1LsnoQfT7+Xw=;
 b=VDKHoPuKe8tx7AJv/3ZlhNXHSTzHNjaMD8OavMDubp3DL9athHNlS7suGR+xLC0EAP
 pSf1eAS48P+LabzCN1LBF6HxG9KtjfA5KdTHR5gVNVFJdyP8RCll2KgQuvr5FN9RGfYi
 9XVEPHjWTWS7Uz4f0d2Sw464Umx9pkxYBDPTRO5N7jcpSSBCV5lBFOE7GUwH94uItGD5
 YfIdk7xpPqwbJsotP3bn83+Lf643EjQvJtHpcXLqvga2SZZ7u0q4pTuOXaGYUu5GZ5Bh
 BFFsyF4o3DNzv9FDpppwJoiUwD86q/+eL8si8PKjKHfvV6b5VM6JoS206rf1g7wnvltl
 nMoA==
X-Gm-Message-State: AOAM530NlFo4GyHqsHgViIvhcRNVzygnUZEBPRWLBnfpeqleS6Kms/wn
 /Y0O8xOD/xUm8msiwysruOUi/gaSKMC6BxNgwzM=
X-Google-Smtp-Source: ABdhPJzj6znc4lwsp8fz7byrFmv9x17+MMTgNlXUN2a94kYACvbgcewcI7SlrLSqrGQCHuv77YjxiHI8IyYwQcve+ac=
X-Received: by 2002:a05:6808:19a6:b0:32b:90c4:d1af with SMTP id
 bj38-20020a05680819a600b0032b90c4d1afmr29013348oib.64.1654495241458; Sun, 05
 Jun 2022 23:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220531210544.181322-1-abrestic@rivosinc.com>
In-Reply-To: <20220531210544.181322-1-abrestic@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jun 2022 16:00:15 +1000
Message-ID: <CAKmqyKODpwjiFuo1MEvEZCHKnA__+PTWBnby0aNxdBLiJFoLJg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Wake on VS-level external interrupts
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=alistair23@gmail.com; helo=mail-oi1-x22a.google.com
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
X-List-Received-Date: Mon, 06 Jun 2022 06:01:01 -0000

On Wed, Jun 1, 2022 at 7:07 AM Andrew Bresticker <abrestic@rivosinc.com> wrote:
>
> Whether or not VSEIP is pending isn't reflected in env->mip and must
> instead be determined from hstatus.vgein and hgeip. As a result a
> CPU in WFI won't wake on a VSEIP, which violates the WFI behavior as
> specified in the privileged ISA. Just use riscv_cpu_all_pending()
> instead, which already accounts for VSEIP.
>
> Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c        | 2 +-
>  target/riscv/cpu.h        | 1 +
>  target/riscv/cpu_helper.c | 2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a91253d4bd..c6cc08c355 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -391,7 +391,7 @@ static bool riscv_cpu_has_work(CPUState *cs)
>       * Definition of the WFI instruction requires it to ignore the privilege
>       * mode and delegation registers, but respect individual enables
>       */
> -    return (env->mip & env->mie) != 0;
> +    return riscv_cpu_all_pending(env) != 0;
>  #else
>      return true;
>  #endif
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index f08c3e8813..758ab6c90b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -488,6 +488,7 @@ int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero);
>  uint8_t riscv_cpu_default_priority(int irq);
> +uint64_t riscv_cpu_all_pending(CPURISCVState *env);
>  int riscv_cpu_mirq_pending(CPURISCVState *env);
>  int riscv_cpu_sirq_pending(CPURISCVState *env);
>  int riscv_cpu_vsirq_pending(CPURISCVState *env);
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index d99fac9d2d..16c6045459 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -340,7 +340,7 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *env,
>      return best_irq;
>  }
>
> -static uint64_t riscv_cpu_all_pending(CPURISCVState *env)
> +uint64_t riscv_cpu_all_pending(CPURISCVState *env)
>  {
>      uint32_t gein = get_field(env->hstatus, HSTATUS_VGEIN);
>      uint64_t vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
> --
> 2.25.1
>
>

