Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJpUT-0007oM-QB
	for mharc-qemu-riscv@gnu.org; Fri, 05 Aug 2022 01:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oJpUT-0007oA-3U; Fri, 05 Aug 2022 01:03:17 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:36797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oJpUR-0007R9-JO; Fri, 05 Aug 2022 01:03:16 -0400
Received: by mail-pf1-x42f.google.com with SMTP id g12so1328212pfb.3;
 Thu, 04 Aug 2022 22:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=S0jaJYTzdSXQAfbsOrO00P4PMzlN0Ny7QaAIjtt59Yk=;
 b=Fet/GHcjvxsILX6nfarixdz9x2UaWLz0+Vd7Cm/3glfl56Er6PK2dAWLxnnH5mNTAs
 bWGYBr/RsYjGsKi3X9uCr1R3iQooZlWPgyTvbK2bAC0YnZVDN1+vVpQH4RchgmdPAArQ
 ho6GWZZSZkRkCTZrOI1mqLifNDPO/fkaSrm7qyvSz3GVA9C7UyQu05EkJeZ13HH266iS
 1OeqQH6jU73xdrsTDDiRl6TsiR7Sy5aBYYQA59tnqWAlPEhc78CvwJPI7rT8wVeTqGm1
 p1G9ARfAZoEkm7iWbB+HoeHsigE1i4ZqdRdlbj4Gm3u3tCeaZR5ZHbMLEvRcuIYhnz+q
 Nc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=S0jaJYTzdSXQAfbsOrO00P4PMzlN0Ny7QaAIjtt59Yk=;
 b=0r3wRO3v23aBH026QStvBFTQHnaUw7nH5XDBdKmXyyr4KtuunHaMpYwep71a8jAuzK
 AO/QtvwEV1hZps6gi+uAY7h5xsT5bk+L+JKMbVyue1AWcZCYsZel5qV+mrTWwaxo4UBv
 x9OJZ7iDvb+uTZoYovQIFovN9uh8I5LwMlxhVSNPvMEtN4ksW3wevvgCJmaGnKR2H34V
 sfiwIUDY4b0NJwp6Vimo1G8P9wCP5HiclkeQ0CrJKHx/VG+bO6ZBsgSbfUa9R3t0CGri
 IRj1gcyNs43sfTNWmSg3jP75iBE9tMOGmPsps2dp769FwWPUvil0vMLKhfK3hw7xicID
 Vv6g==
X-Gm-Message-State: ACgBeo1dPhDIDCOQCi9fBfrTLRtyw0KKECZ1Q3dpcrpTohGnUBExSniF
 aLrif7YdKMBZUQxpFZmEKRhcalc0h7yamvBpsnY=
X-Google-Smtp-Source: AA6agR6MANdnjG9Ojn2aEe332F0W9a6/7zUGIHPnZiTjdpT9kM7bfxD1+LRHWEauIysds4WrtkBhESJaxQD7MuRTp48=
X-Received: by 2002:a63:87c2:0:b0:41c:d5c0:294c with SMTP id
 i185-20020a6387c2000000b0041cd5c0294cmr4387475pge.366.1659675793767; Thu, 04
 Aug 2022 22:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220803123652.3700-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220803123652.3700-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Aug 2022 15:02:47 +1000
Message-ID: <CAKmqyKNznWT4wTktbpD=Q5FqJ=4FxZ+uk0R+3-91K_dCH08Zag@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42f.google.com
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
X-List-Received-Date: Fri, 05 Aug 2022 05:03:17 -0000

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

Thanks!

Applied to riscv-to-apply.next

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

