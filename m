Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQz8p-0006rB-Mm
	for mharc-qemu-riscv@gnu.org; Thu, 16 Sep 2021 17:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQz8o-0006oC-5r; Thu, 16 Sep 2021 17:41:58 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:45929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQz8m-0005OL-Cj; Thu, 16 Sep 2021 17:41:57 -0400
Received: by mail-il1-x12e.google.com with SMTP id b8so8075328ilh.12;
 Thu, 16 Sep 2021 14:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jPunnpEob3JHq0gO72nhSZj9tW9sXuoh7WoBe19/m2Q=;
 b=Yf0HjRT4gtX4Zvu1V7tHhaNKxiZdTj+EWgeuWgeAIwLkyOWPwNVFRWUF++qSzk1XvK
 AMWZcKLwmDczNaUe4v5VqC2KybziqljnKleE4m8gkQJGTpBA830OlxS0mIbkZ+HXxoCE
 Ugooa3FfwJYpkLNPC1f9oJ80zLnsB7repCfrtdyc47aHlaxtWPnwTE76aEtQ8YqnIoft
 yNXzNvvAFbMn1il4HLu2uGLiKw7fpPsKoZZU9Zrxs8d3mQ5vvoSzTUFkOBZFuoDzBAwW
 2IKIsSLiPUI5cBSDxbGEUVyfB8fVc+MFDZXvUH9l5wFOcxN8s8j+B/D63e8FgdbdokET
 m5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jPunnpEob3JHq0gO72nhSZj9tW9sXuoh7WoBe19/m2Q=;
 b=iPrvogahx8RJsj8kVMhD/trRSUHy7OxiBRhBM5PSP6T6+KJ0YVtDWw/LfDFw1Z22OI
 uISa85QAGYKYQBBhLXHS2wwuzB/X2dD2v4F88woq6gqafDPD4P6gd7RHMK4BeNrS7keg
 yLw7aUKXgi3Tc46jNeZ4MAKyksbtkHDb2cK8s8Nf5V3N15MONbLdfv/EZ1MM/gUT1uyR
 QsghkOPSbGpdPHH4KivGLmRHj0+lTh0vgERu8ereXf7ZnzUGKpzaNXUwUDQPBqV+woiu
 FS2hfV3B81h3B+D0tYyaz3OkrQPScFfHdjeoVro74TOAetBaEKjy9c3gGa2hjnOvh1dE
 scGA==
X-Gm-Message-State: AOAM530TZFeWmzWlG5BrBIr6phTATrDYQ9cT/mIEQrsSmggaXY5aX+3W
 KJWLNSRbp0wyG/FnSZpkEkaPutI/JGtCugWK2IhX+IxYtn8=
X-Google-Smtp-Source: ABdhPJwu5BJMqsax8OehKATHYayTZJsAa0b389l3fmQpgeHeUqAJl8b7WTTAlP37HDPcK6MpwenASkWr6c4QVPpY+80=
X-Received: by 2002:a05:6e02:964:: with SMTP id
 q4mr5610931ilt.290.1631828514710; 
 Thu, 16 Sep 2021 14:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210915084601.24304-1-bmeng.cn@gmail.com>
In-Reply-To: <20210915084601.24304-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 17 Sep 2021 07:41:28 +1000
Message-ID: <CAKmqyKOmz4K_kinoOdur1n6hP=5ZTNtdW28PjYgWa6QAj1OFbw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: csr: Rename HCOUNTEREN_CY and friends
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Thu, 16 Sep 2021 21:41:58 -0000

On Wed, Sep 15, 2021 at 6:47 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> The macro name HCOUNTEREN_CY suggests it is for CSR HCOUNTEREN, but
> in fact it applies to M-mode and S-mode CSR too. Rename these macros
> to have the COUNTEREN_ prefix.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
>  target/riscv/cpu_bits.h |  8 ++++----
>  target/riscv/csr.c      | 24 ++++++++++++------------
>  2 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 7330ff5a19..34564d367c 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -397,10 +397,10 @@
>  #define HSTATUS32_WPRI       0xFF8FF87E
>  #define HSTATUS64_WPRI       0xFFFFFFFFFF8FF87EULL
>
> -#define HCOUNTEREN_CY        (1 << 0)
> -#define HCOUNTEREN_TM        (1 << 1)
> -#define HCOUNTEREN_IR        (1 << 2)
> -#define HCOUNTEREN_HPM3      (1 << 3)
> +#define COUNTEREN_CY         (1 << 0)
> +#define COUNTEREN_TM         (1 << 1)
> +#define COUNTEREN_IR         (1 << 2)
> +#define COUNTEREN_HPM3       (1 << 3)
>
>  /* Privilege modes */
>  #define PRV_U 0
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 50a2c3a3b4..1cd34a6453 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -71,20 +71,20 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>      if (riscv_cpu_virt_enabled(env)) {
>          switch (csrno) {
>          case CSR_CYCLE:
> -            if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
> -                get_field(env->mcounteren, HCOUNTEREN_CY)) {
> +            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> +                get_field(env->mcounteren, COUNTEREN_CY)) {
>                  return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>              }
>              break;
>          case CSR_TIME:
> -            if (!get_field(env->hcounteren, HCOUNTEREN_TM) &&
> -                get_field(env->mcounteren, HCOUNTEREN_TM)) {
> +            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
> +                get_field(env->mcounteren, COUNTEREN_TM)) {
>                  return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>              }
>              break;
>          case CSR_INSTRET:
> -            if (!get_field(env->hcounteren, HCOUNTEREN_IR) &&
> -                get_field(env->mcounteren, HCOUNTEREN_IR)) {
> +            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
> +                get_field(env->mcounteren, COUNTEREN_IR)) {
>                  return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>              }
>              break;
> @@ -98,20 +98,20 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>          if (riscv_cpu_is_32bit(env)) {
>              switch (csrno) {
>              case CSR_CYCLEH:
> -                if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
> -                    get_field(env->mcounteren, HCOUNTEREN_CY)) {
> +                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> +                    get_field(env->mcounteren, COUNTEREN_CY)) {
>                      return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>                  }
>                  break;
>              case CSR_TIMEH:
> -                if (!get_field(env->hcounteren, HCOUNTEREN_TM) &&
> -                    get_field(env->mcounteren, HCOUNTEREN_TM)) {
> +                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
> +                    get_field(env->mcounteren, COUNTEREN_TM)) {
>                      return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>                  }
>                  break;
>              case CSR_INSTRETH:
> -                if (!get_field(env->hcounteren, HCOUNTEREN_IR) &&
> -                    get_field(env->mcounteren, HCOUNTEREN_IR)) {
> +                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
> +                    get_field(env->mcounteren, COUNTEREN_IR)) {
>                      return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>                  }
>                  break;
> --
> 2.25.1
>
>

