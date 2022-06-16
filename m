Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1jlF-0007H1-Ak
	for mharc-qemu-riscv@gnu.org; Thu, 16 Jun 2022 03:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1jl1-0007ES-0V; Thu, 16 Jun 2022 03:17:37 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:32918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1jky-0000Oc-9J; Thu, 16 Jun 2022 03:17:34 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso5033425pjb.0; 
 Thu, 16 Jun 2022 00:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2kAi/ysO/uqMI++FU+ubdLRnU9LAzncfQ+oCvySi3/Q=;
 b=emPItFg6jUG97fx4uVBrFA8u6ZTIVqBUk5bN5Yr5t9ywrBIlCVMJ036abUmCigUAe1
 OqiImPd8S/nyEuM/JycQ+/TLZm/ritMnKnU8dpQLHsAKlkq0IawXHI2xFnCPq2st7jXq
 xweyQP3dEDa+Y35cXNe3ffuUi0z0hxMt7cTE7WS+WPogg1LVQbnBNnM29TQGy3GjgxrQ
 e4RFUfX7/MgYPDHiWkNvey/zJPPJC92vYl3TcuEvn0dVXx/YHVoo608Z37fm+nRZWZUT
 zFAm362SDScXOSM/6wB0gkz3jGO3aT6ltn5ice2vFP+AZXPwCuBvDApSetVb5+lIJBP/
 FhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2kAi/ysO/uqMI++FU+ubdLRnU9LAzncfQ+oCvySi3/Q=;
 b=PsV1C8pHLEW/Vdsepwe/OubLSNr74MEGNNszCkTTSshosnLfnqgdp9GLpd6T2mBmzM
 EiegNC0I2ArF8dsKAspXII/VC/fGvggyNA+6DDBiL0tYEnfq9e/rDVpJNC/LN0pFWK/O
 rNHPPXjb2koaoYm7EDr0REAd6iYMTS7XThVU9dMSPI6JoRZ9TDbiKnVWt7onCIyCEGn4
 +ArHQ5KHgzEMNisti20t6vRqqqWurevQQHHfIexvGmgc7aK+T89awYySHXfMWAfudta4
 YxvJDxUyQS56jLRNcL5TlxG2AUcklNb8RGGjLOd9CYrVTYR52K++efcA1lnY6UxswCkd
 lP2A==
X-Gm-Message-State: AJIora+dNudjGTkFUZHOVOjsltQiw+EATjFJB59KKtfLY9kXld1fABZr
 5eMLl827AWsB3jbmqRUgtCHAAYEQ+WsUk8BZIlc=
X-Google-Smtp-Source: AGRyM1ve7fuUe3m2BCqqT2klhuNm3Dkne13i0/cKS/6lmStWPn7X8rQ+hiOSjxK09OEVWeI8psyk6kxPFukEzL/GxWk=
X-Received: by 2002:a17:902:d18c:b0:167:82d5:4710 with SMTP id
 m12-20020a170902d18c00b0016782d54710mr3356070plb.25.1655363850193; Thu, 16
 Jun 2022 00:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220603160425.3667456-1-mchitale@ventanamicro.com>
 <20220603160425.3667456-4-mchitale@ventanamicro.com>
In-Reply-To: <20220603160425.3667456-4-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 16 Jun 2022 17:17:03 +1000
Message-ID: <CAKmqyKPwrhxM0YH_=noivZNsuOfJkkGnDz-ge1SXjfTxP12Q1g@mail.gmail.com>
Subject: Re: [RFC PATCH v5 3/4] target/riscv: smstateen check for fcsr
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Thu, 16 Jun 2022 07:17:39 -0000

On Sat, Jun 4, 2022 at 2:08 AM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> If smstateen is implemented and sstateen0.fcsr is clear
> then the floating point operations must return illegal
> instruction exception.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  target/riscv/csr.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ae91ae1f7e..8bbbed38ff 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -77,6 +77,10 @@ static RISCVException fs(CPURISCVState *env, int csrno)
>          !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
> +
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> +        return smstateen_acc_ok(env, PRV_U, SMSTATEEN0_FCSR);
> +    }

This only checks access to the CSRs. Shouldn't we also be throwing
errors if any instruction operates on an x register?

>  #endif
>      return RISCV_EXCP_NONE;
>  }
> @@ -1700,6 +1704,10 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
>                         (1UL << SMSTATEEN0_HSENVCFG);
>
>      reg = &env->mstateen[csrno - CSR_MSTATEEN0];
> +    if (riscv_has_ext(env, RVF)) {
> +        wr_mask |= 1UL << SMSTATEEN0_FCSR;
> +    }

This doesn't look right.

"Whenever misa.F = 1, bit 1 of mstateen0 is read-only zero". Shouldn't
that mean we don't allow writes if we have the RVF extension?

Alistair

> +
>      write_smstateen(env, reg, wr_mask, new_val);
>
>      return RISCV_EXCP_NONE;
> @@ -1724,6 +1732,10 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
>      reg = &env->mstateen[csrno - CSR_MSTATEEN0H];
>      val = (uint64_t)new_val << 32;
>      val |= *reg & 0xFFFFFFFF;
> +    if (riscv_has_ext(env, RVF)) {
> +        wr_mask |= 1UL << SMSTATEEN0_FCSR;
> +    }
> +
>      write_smstateen(env, reg, wr_mask, val);
>
>      return RISCV_EXCP_NONE;
> @@ -1745,6 +1757,10 @@ static RISCVException write_hstateen(CPURISCVState *env, int csrno,
>                         (1UL << SMSTATEEN0_HSENVCFG);
>      int index = csrno - CSR_HSTATEEN0;
>
> +    if (riscv_has_ext(env, RVF)) {
> +        wr_mask |= 1UL << SMSTATEEN0_FCSR;
> +    }
> +
>      reg = &env->hstateen[index];
>      wr_mask &= env->mstateen[index];
>      write_smstateen(env, reg, wr_mask, new_val);
> @@ -1769,6 +1785,10 @@ static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
>      uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
>                         (1UL << SMSTATEEN0_HSENVCFG);
>
> +    if (riscv_has_ext(env, RVF)) {
> +        wr_mask |= 1UL << SMSTATEEN0_FCSR;
> +    }
> +
>      reg = &env->hstateen[index];
>      val = (uint64_t)new_val << 32;
>      val |= *reg & 0xFFFFFFFF;
> @@ -1794,6 +1814,10 @@ static RISCVException write_sstateen(CPURISCVState *env, int csrno,
>      int index = csrno - CSR_SSTATEEN0;
>      bool virt = riscv_cpu_virt_enabled(env);
>
> +    if (riscv_has_ext(env, RVF)) {
> +        wr_mask |= 1UL << SMSTATEEN0_FCSR;
> +    }
> +
>      reg = &env->sstateen[index];
>      if (virt) {
>          wr_mask &= env->mstateen[index];
> --
> 2.25.1
>
>

