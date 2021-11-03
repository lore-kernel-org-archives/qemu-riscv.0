Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi941-0006Hg-1t
	for mharc-qemu-riscv@gnu.org; Wed, 03 Nov 2021 01:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mi93u-0006GI-2B; Wed, 03 Nov 2021 01:43:52 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:45628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mi93s-0000dX-0S; Wed, 03 Nov 2021 01:43:49 -0400
Received: by mail-il1-x12b.google.com with SMTP id i12so1388291ila.12;
 Tue, 02 Nov 2021 22:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mKfad70KWy43V9FCdDXOQAXBTlyjgpTjPw40SW9nHlk=;
 b=o+dKNdony65VpHPT6Bs/pwKvb2qtoQn5zADkq1+l1QgSO7g8III/UVruzvB4QC8bCE
 mNqQ3/oT+CQNguOa494vLjdZam8562z8jmO96IjT8SjQ53YDogBWGyDkj80xTFcEDZET
 oTz9t2fguKyir89L4kgoktJQ44CwN15rDfdIAcos9AODK6U9w4x1dmAtGoovFX6JRPdz
 Le4CxtXqXhwOo2mtqo3kSM9wkjZyQ0WnWSyi3HvnbyGTKe2Vf6ajnr52KLO1CqattmVl
 oqunDlmPmICrS9m4MsmSsDAC/fP1UvYcCLTMG/xXExhdup6ERtXhp/GVwEsKBjd+GsCZ
 KJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mKfad70KWy43V9FCdDXOQAXBTlyjgpTjPw40SW9nHlk=;
 b=l5gxEsoz81PA/P3C9nljjDyMc91WcjniX4ApU+1pR9oxUWlpTfAJTThx4xuYB8PZ9R
 BjAmUQ36+y+VfHMdYoYHOagiR4QtaWGYCNEHu2+0Wrzoy1rPKANAlqn3pdgyRh/pltfI
 jx72urxwg27It3mFDZTLMOIdSaiXhHOjyrBSf5Dq6r2GW0ftQNr40xzXrFBXONWDGIRs
 bgxs0o6lK3K2geP+sA86Hs9U+PsriFuzvwsr0i0lJiUBF1rXemkXIJ0uVO6S/4A41uIO
 yN+ovseiQsGpjwZ5fcr8kRgcy1vlt9OYWNpGGcnvae9r2841sEPhWMUB4iF4JHh3MZIr
 4UQg==
X-Gm-Message-State: AOAM532kVeuVGKI8zoH91c97/ZRP4TQlWQOTtU7wVZvHSWLx5eeAsoUB
 cvqb6ccOGPx8ImEu5J9s9ixQY63w00woFkMdM4Q=
X-Google-Smtp-Source: ABdhPJwCrihyPNEZfVRP/KQBcCi6Jh3WLwb5hA73hEecuPbzuX4NnfRvz+zEsSbYe2yjQE2RGKysdmmn2ybbenaJZes=
X-Received: by 2002:a05:6e02:1be4:: with SMTP id
 y4mr26464637ilv.74.1635918226639; 
 Tue, 02 Nov 2021 22:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211025195601.245631-1-atish.patra@wdc.com>
 <20211025195601.245631-3-atish.patra@wdc.com>
In-Reply-To: <20211025195601.245631-3-atish.patra@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Nov 2021 15:43:20 +1000
Message-ID: <CAKmqyKOovyJYrsXfsAE1+Yh-269uNJJ2hQ1jKjzCDxjJJJLKWw@mail.gmail.com>
Subject: Re: [ PATCH v3 02/10] target/riscv: Implement PMU CSR predicate
 function for
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
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
X-List-Received-Date: Wed, 03 Nov 2021 05:43:55 -0000

On Tue, Oct 26, 2021 at 5:56 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> Currently, the predicate function for PMU related CSRs only works if
> virtualization is enabled. It also does not check mcounteren bits before
> before cycle/minstret/hpmcounterx access.
>
> Support supervisor mode access in the predicate function as well.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 1ec776013435..de484c74d3b4 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -62,12 +62,64 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>  #if !defined(CONFIG_USER_ONLY)
>      CPUState *cs = env_cpu(env);
>      RISCVCPU *cpu = RISCV_CPU(cs);
> +    int ctr_index;
>
>      if (!cpu->cfg.ext_counters) {
>          /* The Counters extensions is not enabled */
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> +    if (env->priv == PRV_S) {
> +        switch (csrno) {
> +        case CSR_CYCLE:
> +            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> +                return RISCV_EXCP_ILLEGAL_INST;
> +            }
> +            break;
> +        case CSR_TIME:
> +            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> +                return RISCV_EXCP_ILLEGAL_INST;
> +            }
> +            break;
> +        case CSR_INSTRET:
> +            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> +                return RISCV_EXCP_ILLEGAL_INST;
> +            }
> +            break;
> +        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> +            ctr_index = csrno - CSR_CYCLE;
> +            if (!get_field(env->mcounteren, 1 << ctr_index)) {
> +                return RISCV_EXCP_ILLEGAL_INST;
> +            }
> +            break;
> +        }
> +        if (riscv_cpu_is_32bit(env)) {
> +            switch (csrno) {
> +            case CSR_CYCLEH:
> +                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> +                    return RISCV_EXCP_ILLEGAL_INST;
> +                }
> +                break;
> +            case CSR_TIMEH:
> +                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> +                    return RISCV_EXCP_ILLEGAL_INST;
> +                }
> +                break;
> +            case CSR_INSTRETH:
> +                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> +                    return RISCV_EXCP_ILLEGAL_INST;
> +                }
> +                break;
> +            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> +                ctr_index = csrno - CSR_CYCLEH;
> +                if (!get_field(env->mcounteren, 1 << ctr_index)) {
> +                    return RISCV_EXCP_ILLEGAL_INST;
> +                }
> +                break;
> +            }
> +        }
> +    }
> +
>      if (riscv_cpu_virt_enabled(env)) {
>          switch (csrno) {
>          case CSR_CYCLE:
> --
> 2.31.1
>
>

