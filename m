Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrTsn-0001J0-EF
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 19:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrTsl-0001HZ-LK; Thu, 10 Jun 2021 19:14:39 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:37781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrTsj-0006c2-QF; Thu, 10 Jun 2021 19:14:39 -0400
Received: by mail-io1-xd35.google.com with SMTP id q7so28944284iob.4;
 Thu, 10 Jun 2021 16:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qyGGFErAAPD49N+xwFvI+8Rw9z5OIzzxTIw7n3DcnYM=;
 b=aaKBibn0Zcps3MyBg0Bgc5WYnM4TIB1e+8c2bTt7sXSLMpbl7RkSoNAj0TeJJm+9nA
 bwWytXGXcqMeC+JZVEQs+R/AeCg32St1HGR45j4OTujKBuR9VqiDdlHHIPAW1S1Srbm3
 EugA0+UdSW32t/A90MQcGK1VsknkOa0JjXICCu/l5e2YFSo18WcoI8uARFOKofB6D205
 W3PcOgJPU/lB5rtrfLwp9My0fMyHjPqbDouYLWOgt+eOVVmTExh5LXu7WBLv8lD1fUDk
 GaSTUqobv/iTCF9QFQtthF42iJbLaYAxAWKXxLLqGjL98OFYeSbdfKe5uCLpebKYb6sl
 7HWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qyGGFErAAPD49N+xwFvI+8Rw9z5OIzzxTIw7n3DcnYM=;
 b=DF1GvQtu5BWEwH0Pxh22kBTMsxPz2AnGHsW1TmAibeFFovC9QMJIfWqx0lg7tCO1W6
 WYOk8t/bejOR8NMe0+Cbe00KyHyhCGvgJWanh7DeYqYJ01PLx3EicXt7Zro8XWUlynNI
 5/se4Ps88FiaqR+O/EQzyL9rSwajENQ0fwXeOT0If66y25GDlYCcCkkZB6TJfUuV4Rlr
 hZWQbsMIpNcYackcg4CbZ1f+uFrQ7E6PVY8goT0hIJeIc4pasdsXAmOE7D9IuM5oXyhO
 8PHhYSaewf9ZcTjqC4F3nG+W71jI8noW9LjO+vvFMguHuL5tcCmD8B/LJ50pbppTZWGg
 Qx5Q==
X-Gm-Message-State: AOAM531+FqF8Kyt/Qd6+AHGdd2COU1gQxkUfkE8iGs3zV2mw3NO0sBIi
 PBq6uyShgqBEV5xFxn+xxjx+JpH1lvgYup6uWkjR86jDbRcqJw==
X-Google-Smtp-Source: ABdhPJyMUND0LUH0bwYuXWWOp+B8movCAkNz1K11/QupUM4+395vbwvomRqTjt7pqk7/qqNvTOgRInpARL/329y2nTg=
X-Received: by 2002:a05:6602:140e:: with SMTP id
 t14mr761521iov.42.1623366876356; 
 Thu, 10 Jun 2021 16:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210602191125.525742-1-josemartins90@gmail.com>
 <20210602191125.525742-2-josemartins90@gmail.com>
In-Reply-To: <20210602191125.525742-2-josemartins90@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Jun 2021 09:14:09 +1000
Message-ID: <CAKmqyKMFi6GDcQPfHo=HcLu+oEQxULZ3E7zkUc5s-egxGQ8sGA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: fix VS interrupts forwarding to HS
To: Jose Martins <josemartins90@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Thu, 10 Jun 2021 23:14:40 -0000

On Thu, Jun 3, 2021 at 5:13 AM Jose Martins <josemartins90@gmail.com> wrote:
>
> VS interrupts (2, 6, 10) were not correctly forwarded to hs-mode when
> not delegated in hideleg (which was not being taken into account). This
> was mainly because hs level sie was not always considered enabled when
> it should. The spec states that "Interrupts for higher-privilege modes,
> y>x, are always globally enabled regardless of the setting of the global
> yIE bit for the higher-privilege mode." and also "For purposes of
> interrupt global enables, HS-mode is considered more privileged than
> VS-mode, and VS-mode is considered more privileged than VU-mode". Also,
> vs-level interrupts were not being taken into account unless V=1, but
> should be unless delegated.
>
> Finally, there is no need for a special case for to handle vs interrupts
> as the current privilege level, the state of the global ie and of the
> delegation registers should be enough to route all interrupts to the
> appropriate privilege level in riscv_cpu_do_interrupt.
>
> Signed-off-by: Jose Martins <josemartins90@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 28 ++++++++--------------------
>  1 file changed, 8 insertions(+), 20 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 21c54ef561..592d4642be 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -38,36 +38,24 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>  #ifndef CONFIG_USER_ONLY
>  static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>  {
> -    target_ulong irqs;
> +    target_ulong virt_enabled = riscv_cpu_virt_enabled(env);
>
>      target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
>      target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
> -    target_ulong hs_mstatus_sie = get_field(env->mstatus_hs, MSTATUS_SIE);
>
> -    target_ulong pending = env->mip & env->mie &
> -                               ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> -    target_ulong vspending = (env->mip & env->mie &
> -                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));
> +    target_ulong pending = env->mip & env->mie;
>
>      target_ulong mie    = env->priv < PRV_M ||
>                            (env->priv == PRV_M && mstatus_mie);
>      target_ulong sie    = env->priv < PRV_S ||
>                            (env->priv == PRV_S && mstatus_sie);
> -    target_ulong hs_sie = env->priv < PRV_S ||
> -                          (env->priv == PRV_S && hs_mstatus_sie);
> +    target_ulong hsie   = virt_enabled || sie;
> +    target_ulong vsie   = virt_enabled && sie;
>
> -    if (riscv_cpu_virt_enabled(env)) {
> -        target_ulong pending_hs_irq = pending & -hs_sie;
> -
> -        if (pending_hs_irq) {
> -            riscv_cpu_set_force_hs_excep(env, FORCE_HS_EXCEP);
> -            return ctz64(pending_hs_irq);
> -        }
> -
> -        pending = vspending;
> -    }
> -
> -    irqs = (pending & ~env->mideleg & -mie) | (pending &  env->mideleg & -sie);
> +    target_ulong irqs =
> +            (pending & ~env->mideleg & -mie) |
> +            (pending &  env->mideleg & ~env->hideleg & -hsie) |
> +            (pending &  env->mideleg &  env->hideleg & -vsie);
>
>      if (irqs) {
>          return ctz64(irqs); /* since non-zero */
> --
> 2.30.2
>
>

