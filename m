Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npZtm-0003AA-9g
	for mharc-qemu-riscv@gnu.org; Fri, 13 May 2022 14:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1npZtj-00037t-Ln
 for qemu-riscv@nongnu.org; Fri, 13 May 2022 14:20:20 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:37197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1npZtd-0000gH-1b
 for qemu-riscv@nongnu.org; Fri, 13 May 2022 14:20:19 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2f16645872fso98704867b3.4
 for <qemu-riscv@nongnu.org>; Fri, 13 May 2022 11:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0sXzrqcKcf3tDaxu1ixrFLf0edjxpfgfyVXLoLF5xc8=;
 b=eVwrsqwpkAsGNZt98I7FTeoZcLz+C4MSYwAnq4QP8O1j81mcKgXMKpSN1SolqpW4Dl
 tziNVtVAM+dKc364DlQPggH+9i4VIiOC+7NZ9a9QqnxzyJtqS1Nb7fPDRHA/l1JiuqL8
 KzHUbdf5efilAfUHoSRbIhjn+76IvzIX4xgZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0sXzrqcKcf3tDaxu1ixrFLf0edjxpfgfyVXLoLF5xc8=;
 b=vV1CnJkdSQJrfgmfPiCSOIoIfjshrg+AP2B8BLJN5HnzI8OhE57r+CCkFU9EFEQG52
 tn+XPPcH2JNCxMxPUq0KxOhPcpy1FWgq/rI7dWSZYx2YuY9YjssYuO0JidLtrd6wk232
 zqsNpDHFp/Cu2qxWuHCrwTal6DaDUPU9IOwp2AmN7kjC97d9kY25o5aknuqwMXuGG/vt
 N3i6RPCzhyCWI3j5hA6D7i17Ru+APjcndZLM18VpwQxgGagw51HFhbkn1xsBZGzuaXVy
 5P2atgqYpXk4XyRmCJmCTkad3gFu/4GkJ8mMVjSuFjAaoSse19imFRl5mZaU3cOnjEFi
 x7tQ==
X-Gm-Message-State: AOAM530kmgcVMtjXtSLWiDPzNwgO7qOEMinvaqey7Q2N1YV0NcZ75MnU
 ToU/d/z1lCZpZLvDPT41JUNmFEcfs1xfUDLoSPr9
X-Google-Smtp-Source: ABdhPJylPZb4mrDBVDg96bf9yD+8SjoNZHALQBXIOsJ/J2EifKyrDAaPEwJPb2kRspbVqQfoOEM6BzpE6G5dXX36Z0k=
X-Received: by 2002:a81:54e:0:b0:2fe:c027:1ca7 with SMTP id
 75-20020a81054e000000b002fec0271ca7mr3201785ywf.249.1652466008445; Fri, 13
 May 2022 11:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220511144528.393530-1-apatel@ventanamicro.com>
 <20220511144528.393530-2-apatel@ventanamicro.com>
In-Reply-To: <20220511144528.393530-2-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 13 May 2022 11:19:57 -0700
Message-ID: <CAOnJCUJ6fKPBgM-Hs2nrXn4dNO_naPCj=MxiU_0ZDqLBA249aQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] target/riscv: Fix csr number based privilege
 checking
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=atishp@atishpatra.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 13 May 2022 18:20:20 -0000

On Wed, May 11, 2022 at 7:46 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> When hypervisor and VS CSRs are accessed from VS-mode or VU-mode,
> the riscv_csrrw_check() function should generate virtual instruction
> trap instead illegal instruction trap.
>
> Fixes: 0a42f4c44088 (" target/riscv: Fix CSR perm checking for HS mode")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/csr.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 3500e07f92..2bf0a97196 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3139,7 +3139,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>      int read_only = get_field(csrno, 0xC00) == 3;
>      int csr_min_priv = csr_ops[csrno].min_priv_ver;
>  #if !defined(CONFIG_USER_ONLY)
> -    int effective_priv = env->priv;
> +    int csr_priv, effective_priv = env->priv;
>
>      if (riscv_has_ext(env, RVH) &&
>          env->priv == PRV_S &&
> @@ -3152,7 +3152,11 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>          effective_priv++;
>      }
>
> -    if (!env->debugger && (effective_priv < get_field(csrno, 0x300))) {
> +    csr_priv = get_field(csrno, 0x300);
> +    if (!env->debugger && (effective_priv < csr_priv)) {
> +        if (csr_priv == (PRV_S + 1) && riscv_cpu_virt_enabled(env)) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>  #endif
> --
> 2.34.1
>

It seems Alistair has already queued a similar fix
https://www.mail-archive.com/qemu-devel@nongnu.org/msg886861.html

-- 
Regards,
Atish

