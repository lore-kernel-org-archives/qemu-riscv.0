Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQjEk-0004HF-3Y
	for mharc-qemu-riscv@gnu.org; Thu, 16 Sep 2021 00:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQjEi-0004FY-Ad; Thu, 16 Sep 2021 00:43:00 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:35369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQjEc-0002wX-0q; Thu, 16 Sep 2021 00:42:58 -0400
Received: by mail-il1-x131.google.com with SMTP id h29so5408902ila.2;
 Wed, 15 Sep 2021 21:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yskA2MtkTEYh0zmVCGh8Lnad2w1kA63qb6ufLgBYLC0=;
 b=nUz4ooff+FKL2UhDqoQD3jea838UsxUC7SHV5Y/B+oJUUGbnzeXqZsL0dXVpvWu5Rs
 0bkC8pt7o1WCQk4cLaMIK4RdTUyWpm6rxRpT4Ekn3jpF1LQVjk0Ax78O396lXPjnzduE
 zgMSP+zc3zVsdDfpnQ+YGI/Yqo/Ib2GZfcATgglYFIYpLBXhuKIt+zwOLMGiRCxBs+yT
 VRhw2YP5/BIQkNIy7eXZx/UOZFxqF/reFoTVRu/qvUz5ODItcyp12ndCOkZSwgE2SA9u
 2JQi29nIwL0zgGUSa8JvNTGQvLhP8zFMu7633WcO/Dl4+hJweoEFPQXB9xwucEXAxtIo
 3LFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yskA2MtkTEYh0zmVCGh8Lnad2w1kA63qb6ufLgBYLC0=;
 b=ChSb13irGG4oET6f4mrk43MW4zPUVf+Jq4UF1TUYdKEGLVILwHovYJXxXinXTet1dS
 OZ+L0X+6UFatyRzMJMsYlYEp0F5nYwBqFiab9/rwbPaCD1Z1xjEOg/0GPdOvf2NSsW8c
 FZPmEaoLIV/r4+XkZgqQgEqtziCbHLke/ffx3bzS1wuhKQ800DafnO+OktjGUn10h3n7
 R4PRr9gSim7wKGhBEAoAxJvQnPJH5aGkzcRoe17hzSCPYWC6Ql9Ux4yfRz67ms3ALNuz
 ayhHYHjNsnQGFIaZiOvILkw0bVEvuatbWWDrDdptQVJuuFm1DiuKQDVZGdG+RmuyPBRq
 sx7w==
X-Gm-Message-State: AOAM532FyGqSfrvcOXJBzYQwYfIYyUTlVSdlvLZ34c5G+H428IzRrCpk
 rjCEfMJ+dAYyIdavOcEV8RY0A+nn6nNQBd7vhSU=
X-Google-Smtp-Source: ABdhPJxL5P5uDCslJqe3qkvedDCf60RKCKk3zNN1qyKguEnfZkRs+AUG7clsAHeoJgx1xU8kiQ/DYVU7dxogMX8iG0k=
X-Received: by 2002:a05:6e02:1088:: with SMTP id
 r8mr2581845ilj.46.1631767371534; 
 Wed, 15 Sep 2021 21:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210915084601.24304-1-bmeng.cn@gmail.com>
In-Reply-To: <20210915084601.24304-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 16 Sep 2021 14:42:24 +1000
Message-ID: <CAKmqyKNVC-CC06qPM_TtgwMPMnY-3=+D+-FKxEtkxDVMLd78=g@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: csr: Rename HCOUNTEREN_CY and friends
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Thu, 16 Sep 2021 04:43:00 -0000

On Wed, Sep 15, 2021 at 6:47 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> The macro name HCOUNTEREN_CY suggests it is for CSR HCOUNTEREN, but
> in fact it applies to M-mode and S-mode CSR too. Rename these macros
> to have the COUNTEREN_ prefix.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

