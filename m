Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgz3P-00084V-3Z
	for mharc-qemu-riscv@gnu.org; Wed, 12 May 2021 20:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lgz3N-00083l-1Y; Wed, 12 May 2021 20:18:13 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:38591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lgz3L-0005op-7J; Wed, 12 May 2021 20:18:12 -0400
Received: by mail-io1-xd31.google.com with SMTP id d11so2904904iod.5;
 Wed, 12 May 2021 17:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y3IDGy1Jwxs9AxbRskh9n58JVIZpX6yjFSMJD7tkBFY=;
 b=Fw3u4CimM+GrSHjv5Sg3TGRazsKSbKEa2QGlQ6zhyrAQZWEwJ+il+UtaryY1vml3rC
 PqXSilRUudQR2L13JIDpmYPt4fP/5X+Zv23sl/pUCIGjBkyu1uJEHfA5HDNyU1LvL7pW
 AFWInkNqpFpjMxnoaet2HbGEwe77+XlkRvamCOhT/pVzFxZJhrx7qMY2ONP2wW6W6pJ3
 KpPx7NrHaDZz+ySU2QTkCi3rX/bQ5eJJE0fwojeAbBFZbfK8Hp/S21oBWAh1lYkGK98Q
 WydfOzPXnc1MztldSh2SAsDfEBTMZLlBO1QpIAVFqvHiSf5zO8LokdLex++TUqZkqAYE
 8jPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y3IDGy1Jwxs9AxbRskh9n58JVIZpX6yjFSMJD7tkBFY=;
 b=PlEFppJEdwhS/b6sJk4QPcBNcXL0CsSNxpZLiQv3HYoZ7uFnSBLPZIH+C7acg0g6Zk
 PGTU77h7IhQEzyp/BF/truFdUhssynq0EwVxnNExtma/w8mJbQxcu7Vrc1zR3rLhprUk
 0umsb2GH2Rm/IVTm1nLjebvKKcVs1FJmkQTSxrwTFTU4smAb2cpytKCHQTtE+pqc7AyM
 QDQi+b8rhdVJFgk1OObp0Gl6fEC1jRYPavWIosnw5o2E1M+/Ri4XJKD11Sn/S726yaSd
 349sCGKn8kT5GtvTMxBTPc2eFhSxvv/SYZZSYYmLQzc6cI8m55obbXah9oa88R1eiFzo
 /8/Q==
X-Gm-Message-State: AOAM5306pcwOgERU6JVst1/BKvHvSVLP2VmbIl22UmzRxJX29ZrJEyLk
 /+zfXKrwBy6PfTYRZknG/UVWzIhQUUbPXkwj7bQ=
X-Google-Smtp-Source: ABdhPJxYriK3tE3nEJkO2bPJ/3gWqhLH0L4GzPHBc8u/P6Babw6jbKuZbschNjucEQmTT9AzNVMOL5og6pauK/rLnBY=
X-Received: by 2002:a05:6638:3048:: with SMTP id
 u8mr34947288jak.91.1620865089589; 
 Wed, 12 May 2021 17:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210503204448.127412-1-josemartins90@gmail.com>
In-Reply-To: <20210503204448.127412-1-josemartins90@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 13 May 2021 10:17:43 +1000
Message-ID: <CAKmqyKOduig9=DL=DHuvkAahj_V1Yseb-9QMpSaRdQvaED=3wQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: fix VS interrupts forwarding to HS
To: Jose Martins <josemartins90@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Thu, 13 May 2021 00:18:13 -0000

On Tue, May 4, 2021 at 6:45 AM Jose Martins <josemartins90@gmail.com> wrote:
>
> VS interrupts (2, 6, 10) were not correctly forwarded to hs-mode when
> not delegated in hideleg (which was not being taken into account). This
> was mainly because hs level sie was not always considered enabled when
> it should. The spec states that "Interrupts for higher-privilege modes,
> y>x, are always globally enabled regardless of the setting of the global
> yIE bit for the higher-privilege mode." and also "For purposes of
> interrupt global enables, HS-mode is considered more privileged than
> VS-mode, and VS-mode is considered more privileged than VU-mode".
>
> These interrupts should be treated the same as any other kind of
> exception. Therefore, there is no need to "force an hs exception" as the
> current privilege level, the state of the global ie and of the
> delegation registers should be enough to route the interrupt to the
> appropriate privilege level in riscv_cpu_do_interrupt. Also, these
> interrupts never target m-mode, which is  guaranteed by the hardwiring
> of the corresponding bits in mideleg.
>
> Signed-off-by: Jose Martins <josemartins90@gmail.com>
> ---
> Alistair, I sent the previous version of this patch a year ago (!).
> After our brief exchange on wether we should considered HS a higher
> privilege mode than VS (the spec was updated to clarify this in the
> meantime) you asked me for a small last tweak  before accepting
> the patch. This completely slipped my mind, and I only noticed I hadn't
> submitted the final version of the patch a few weeks ago. For this, my
> apologies. When I took a deeper look at it again, I found some other issues
> with the patch so I decided to go for a deeper refactoring.
>
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

If we no longer need this function then it and related functions
should be remove.

Alistair

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
> 2.25.1
>
>

