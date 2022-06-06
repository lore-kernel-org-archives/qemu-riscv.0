Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ny2u2-0006uz-H1
	for mharc-qemu-riscv@gnu.org; Sun, 05 Jun 2022 22:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ny2ty-0006u3-Kw; Sun, 05 Jun 2022 22:55:35 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:45984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ny2tw-0003FC-0h; Sun, 05 Jun 2022 22:55:33 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so17653383fac.12; 
 Sun, 05 Jun 2022 19:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6uWCYUaAc0dGqXqbTPVDABLWd1j1OGNtTQjyJURoW5A=;
 b=LGh6Dem6J14cMwrdNGHVdKE0p6DcTZYHZ70gjQF+dtzBaL75kcwMjtQbNszmVmnjp3
 D0xkHWRwK1yrLLUKBJnaTTKNT3VSpbyD1bv+YmzKgxB9Zm0pugzXuG6o5WKc4ho2dxJr
 e8RKxPEa8gk+AtTdWV0/2aR77otzPd/jaCRRdLUXOYqs5wJVEqTsA+u03orqCSvQHayA
 subKSVwsAioCjLMKV5x5cskLINkg84UQzLKxlt8h0eNJvbYUtB/V4xhS0qmSontgvlQL
 gXMNLMIUQH52v51mwiSjqXCC3oxobgElj1hVbBQkva/VNNar0D7wo5C9Gg5xWNzjTMBf
 F1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6uWCYUaAc0dGqXqbTPVDABLWd1j1OGNtTQjyJURoW5A=;
 b=45huVrr2ezg3qUrbSmIiskCPN99oQGasHuLaRvbDr76m6rY4Cnujx8GKXubOtN0aGp
 F4uBURiqRkJ7tCDclkA9IVnNtm9nnyxTwJd1OsiAJyY29huBwm+Ijb75604EpJPQ7V9n
 nhfUBcQTi8jmw4vKycjXVdaW4opsbLjaHPutVEyJXNRMNrYFEficuXqIlqPbxOUMrJWD
 mvTJQ73nB8uEawHWGQiN0feAfycQNcV+GktrOhGAAV5rgHWG8fL7zHv1jjd7M0PDhKvT
 4mJn0lQLbr/EUsjtBYiR9LrzneeDyWXIpDsZK3hgvK1CHz5XysjnUJR8u4e8RrFJe7YI
 2Dtw==
X-Gm-Message-State: AOAM533OTW0v0nBO0bSa25gCrbi8ypfhDWSfKP207JWL6RUDROzL6y+0
 74RmhedUbDen1FSqRlwlOSIFJwtC+9EBNxplwLY=
X-Google-Smtp-Source: ABdhPJwvX4tehhu9x0z9e/z63+k8supMPyp3rez6cKT7RS/2g2fXfPT6LdppIQQhnpH+1HBa9SeS/DFqSoi8r++60jk=
X-Received: by 2002:a05:6870:b00a:b0:f1:7f07:8c36 with SMTP id
 y10-20020a056870b00a00b000f17f078c36mr11887132oae.278.1654484130366; Sun, 05
 Jun 2022 19:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220531210544.181322-1-abrestic@rivosinc.com>
In-Reply-To: <20220531210544.181322-1-abrestic@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jun 2022 12:55:04 +1000
Message-ID: <CAKmqyKPKX66G9m5nBLPDTmQLuNhi-dyY-nNdLcW7r+G8TvOEDA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Wake on VS-level external interrupts
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=alistair23@gmail.com; helo=mail-oa1-x2a.google.com
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
X-List-Received-Date: Mon, 06 Jun 2022 02:55:35 -0000

On Wed, Jun 1, 2022 at 7:07 AM Andrew Bresticker <abrestic@rivosinc.com> wrote:
>
> Whether or not VSEIP is pending isn't reflected in env->mip and must
> instead be determined from hstatus.vgein and hgeip. As a result a
> CPU in WFI won't wake on a VSEIP, which violates the WFI behavior as
> specified in the privileged ISA. Just use riscv_cpu_all_pending()
> instead, which already accounts for VSEIP.
>
> Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

