Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJoZX-0005NO-4q
	for mharc-qemu-riscv@gnu.org; Fri, 05 Aug 2022 00:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oJoZV-0005Mz-4F; Fri, 05 Aug 2022 00:04:25 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:35804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oJoZS-0006GJ-52; Fri, 05 Aug 2022 00:04:24 -0400
Received: by mail-pl1-x629.google.com with SMTP id t2so1617226ply.2;
 Thu, 04 Aug 2022 21:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=HoF2P4LoqJ0kjCN8QFQo0SfzUBcfLy9Ofu4ePKx2k6E=;
 b=nUV3Kr60j1r5fi6Jn94Hcjc5sue/FXa4r0bY0seNJHVe1myGD611OPFUawVerkjNCn
 yZPk72DE0tHVTSUFOXMoqpz4NcHXHFK1Z5kPKUXQezXaeDclTiOsb+fpXszAJx8I27zz
 iLBtB+mALJ3BbnQB4B/6b8i9CbW120h1pRK55ZgG1e2dYnRY/VmGJJuZAQiLFFIjuS7F
 8EivRxhTvNuAp6WRIdH9wdB19TUxsB0wMzM0LNh3Lqg/ZLkX1g6RMudGOUNRPqmVU47n
 CMnOBH0qSuL3mZrEK/5g6C4VPiGWnnQY8yGvGw2S9al3Gr6aggi1I+51H5VH/uO5tKEa
 goEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=HoF2P4LoqJ0kjCN8QFQo0SfzUBcfLy9Ofu4ePKx2k6E=;
 b=cUB76PD0DmtMevc70KZUpgktEFDLtPnQ2oJ1AA5cmJcKM2NwpB7bp0VqiQzjVP/Dct
 OnlXnPU+WhzPsi8XgOnXgDPktMYwQKQozd/59B9HoZQuyfLrgJ4D/mpdj7+q8meAGNVZ
 XCsvqHNXGPNZ1GIVXnYkUkAUbIa4sLaFdgcAAS2HDMs/0z6mFMadvwboxqD2+ktWC06U
 SkdXSIZhHMYH+/lFkS1+zoZ3XoaHuHpgOIG87++y4X5AqIFvo97OaghWtdNQaWBBR301
 /jIrtveozuRhcV6sSNLvIKpDupF6jl1L0MGcAPxM9shWF7OzR65jL/jX0IMiWnUNZzok
 aOZQ==
X-Gm-Message-State: ACgBeo1dTqWT7L4rk8HYqjoIn7adUup1FY+0LBaM1oQiltCUJ00LA00b
 hWkYJ9AgmzlRrg44uoPX94OqGtpcK/VwHkkw1ic=
X-Google-Smtp-Source: AA6agR4zQDsxyyHw29Lt57yYNYu2r9kd6WOsFZbbgPFhDQysRNYsKEAKGtb9cgZm8bZaUQby5Ex34OHWM9iBbhqiEQM=
X-Received: by 2002:a17:90b:100e:b0:1f3:a4a:2620 with SMTP id
 gm14-20020a17090b100e00b001f30a4a2620mr5480892pjb.120.1659672257010; Thu, 04
 Aug 2022 21:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220803123652.3700-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220803123652.3700-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Aug 2022 14:03:50 +1000
Message-ID: <CAKmqyKM4fk7fkSL4ZBbpPka2HQrk=wFCe7sBG+qO9W4OcgaPCw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix priority of csr related check in
 riscv_csrrw_check
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Fri, 05 Aug 2022 04:04:25 -0000

On Wed, Aug 3, 2022 at 10:56 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Normally, riscv_csrrw_check is called when executing Zicsr instructions.
> And we can only do access control for existed CSRs. So the priority of
> CSR related check, from highest to lowest, should be as follows:
> 1) check whether Zicsr is supported: raise RISCV_EXCP_ILLEGAL_INST if not
> 2) check whether csr is existed: raise RISCV_EXCP_ILLEGAL_INST if not
> 3) do access control: raise RISCV_EXCP_ILLEGAL_INST or RISCV_EXCP_VIRT_
> INSTRUCTION_FAULT if not allowed
>
> The predicates contain parts of function of both 2) and 3), So they need
> to be placed in the middle of riscv_csrrw_check
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 44 +++++++++++++++++++++++++-------------------
>  1 file changed, 25 insertions(+), 19 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 0fb042b2fd..d81f466c80 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3270,6 +3270,30 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>      /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
>      int read_only = get_field(csrno, 0xC00) == 3;
>      int csr_min_priv = csr_ops[csrno].min_priv_ver;
> +
> +    /* ensure the CSR extension is enabled. */
> +    if (!cpu->cfg.ext_icsr) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (env->priv_ver < csr_min_priv) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    /* check predicate */
> +    if (!csr_ops[csrno].predicate) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (write_mask && read_only) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    RISCVException ret = csr_ops[csrno].predicate(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>  #if !defined(CONFIG_USER_ONLY)
>      int csr_priv, effective_priv = env->priv;
>
> @@ -3290,25 +3314,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>  #endif
> -    if (write_mask && read_only) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
> -    /* ensure the CSR extension is enabled. */
> -    if (!cpu->cfg.ext_icsr) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
> -    /* check predicate */
> -    if (!csr_ops[csrno].predicate) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
> -    if (env->priv_ver < csr_min_priv) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
> -    return csr_ops[csrno].predicate(env, csrno);
> +    return RISCV_EXCP_NONE;
>  }
>
>  static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
> --
> 2.17.1
>
>

