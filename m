Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1miabN-0007ky-KA
	for mharc-qemu-riscv@gnu.org; Thu, 04 Nov 2021 07:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1miabM-0007kR-Qn; Thu, 04 Nov 2021 07:08:12 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:44940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1miabK-0002VE-QQ; Thu, 04 Nov 2021 07:08:12 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id q74so13505132ybq.11;
 Thu, 04 Nov 2021 04:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tpjDTKz5u80vb9X3iDVrIdNpXlTw7p9VVUHETfEX5jU=;
 b=RB4UsDg0n5VTeRyEQpPI4+UIErbJwmL/cbd9kU1vUS6yINjINhZWvfl4YU9jAYUeA6
 rYTlT4pyExnW2bIA5s1USVI2NE85YjZTA3kNosN5xrdGQnN5kj+ZWzOsXDxI//AUEM80
 BHva11G8L1u8rT1zaWvheN2bLxRkUAsBk0QPupVydjTFZ6ywEyoyUI6dMPeSbAFKn7yq
 d0Ga+1B32vy3zH42tpT7XJ1X3HeStkJ6fnPzyDbXmPrz+M8mjQ2FgJuy0caH6htlZ7A+
 MsSTglb/sGByn4SZtHkAEtX8W6B3MOI/1MAs2mTAiUZEkGLmLERWtJuhnvrjpiCUz6Ej
 rwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tpjDTKz5u80vb9X3iDVrIdNpXlTw7p9VVUHETfEX5jU=;
 b=FnyeLwt5Q3Rf4+OhLkLEZ7p52Vl8J51Wek/GJOobqhyRvTDYVXvsIn92DikdJSH/Ss
 bIKCDztL3vd7ro7h4pxkyQ30EBl6TL3BGCg6O7c6MerM2wNCSeUAtSrGXhe+HDnofqv4
 Hj6Rhw3cAkN8frrWz80kJ1dxyj+uPaHgQQstw2GcxcDmwzwgOezSCQW02+Xyuv8z1GGv
 gxe3n5NQVYMl57OMJBdJi27fXxMRKPcx9QZ1D5k/xY/42XZpZI8ICvCfAfmhk9S4c330
 3qX0BzERpPCIB6wMGtzJYz2hTzGhcvNo+saiB4CMsKqmNaRlZOSM7zS2T9nPXv+eTywg
 hiqg==
X-Gm-Message-State: AOAM533g+LPYi98VWLBWdDltQRD7+CSq6WupLRZdBsI4mUGoVG/AlcDN
 LD7Ha61nhgUPeZDusG7nhxHV4yTtzyuuxoLii0A=
X-Google-Smtp-Source: ABdhPJyFN71QZsJzyvrk0rIcGEvpdHvNFCbCnilzONCeZh0q5q4+jR8icSP6TmCBBHYjXECW1QDCbqb/oONo5YYzoXI=
X-Received: by 2002:a25:cc07:: with SMTP id l7mr43020707ybf.313.1636024089541; 
 Thu, 04 Nov 2021 04:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211025195601.245631-1-atish.patra@wdc.com>
 <20211025195601.245631-3-atish.patra@wdc.com>
In-Reply-To: <20211025195601.245631-3-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 4 Nov 2021 19:07:58 +0800
Message-ID: <CAEUhbmUOBq4-tguGbGixXADGdstJ2azKr-WK=6y2J83Ye9AbBQ@mail.gmail.com>
Subject: Re: [ PATCH v3 02/10] target/riscv: Implement PMU CSR predicate
 function for
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 04 Nov 2021 11:08:13 -0000

On Tue, Oct 26, 2021 at 3:56 AM Atish Patra <atish.patra@wdc.com> wrote:
>

The commit title is incomplete


> Currently, the predicate function for PMU related CSRs only works if
> virtualization is enabled. It also does not check mcounteren bits before
> before cycle/minstret/hpmcounterx access.
>
> Support supervisor mode access in the predicate function as well.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
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

The above switch..case can be simplified with the logic of last case
as the same one applies to all cases.

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

ditto

> +                break;
> +            }
> +        }
> +    }
> +
>      if (riscv_cpu_virt_enabled(env)) {
>          switch (csrno) {
>          case CSR_CYCLE:
>

Regards,
Bin

