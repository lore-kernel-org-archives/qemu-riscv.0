Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfZYU-0005w2-65
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 23:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfZYS-0005vG-LV; Tue, 26 Oct 2021 23:24:44 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:38666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfZYQ-0003F4-JJ; Tue, 26 Oct 2021 23:24:44 -0400
Received: by mail-io1-xd2d.google.com with SMTP id v65so1955285ioe.5;
 Tue, 26 Oct 2021 20:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=09+e4FelSY+yJCPNPsgXEZO5cc9hTGZ4XIMoc2PBVUk=;
 b=l5A7Ap67+B05qnRlUtIkI7J78FwJcQ7UpQGGJxyKore1nJ5OLcR6Z4Q3X/e9sVsMMG
 Pho4tp46DOsz25YlkkkYN6oTrnjF4x2xOowr0pQ6P+/JWINN31Gfmu/K1qPs9nqQSbAS
 xKYO+F8Nw0QyPEyk9KfLiKM1j6t9eWCDx17cj7q2+Fg5NTAOJrWbq9xeQbxHIAO8BhFY
 yl5nQixwp6ivomIfHHrH0BwUasiuDeh6Gibx0CahHr8qQzO9Yk72dJzoAz4/JovwxdY8
 0eUan6C26SwWNiIAZEcKx1l2eCoIAQdageu4iSVoVK/x4l4ArH3h2PeAQveAsN19RB9Q
 IrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=09+e4FelSY+yJCPNPsgXEZO5cc9hTGZ4XIMoc2PBVUk=;
 b=MREPrGsjScgMtApf9HUsze9wwLDvLsZyJ5pm+6pICViB8sgNws1mAPIX3GFmWrhP8q
 VJB5eNF2tvnPgNH4qr1GMIFjX6FTqY+/FC1CFw8FSu6Mu0SmDRD2zQZ4poX0vlYzadyu
 Eh4j1dsYB2jwl3gg0aJ6jqSVHCxCNnAm47JBEm73z0MXot5BwqUY2UkqH9MDPG1S/JIZ
 W19K8CMaWwMyd5Qx73jkXCUwQVbTYn6x6m8w5YRoTwbRP7TmbfuhCsaBrtuCBTUTPUIs
 4R1fNMpeITYNFNu1EHa8xrKfUy4TkW3u1Or6ukkakPYqYUi8uErGU8wIxW+YJ8irIakN
 PYxA==
X-Gm-Message-State: AOAM531PRuav5dw3JGY79FCsapAlKG/+6bA2TTuN3tLXmKxd99gdGRso
 XFnMknx9sliXiRN5SFt9iIed+P1efh4stDfFGug=
X-Google-Smtp-Source: ABdhPJxiu0oijngvUIU/X9QAGU5hOrUq7srmVITW/49vMzpAODoC/wVZorjKQol4wqdebIfhds77bSrzZIgl1++QB8Q=
X-Received: by 2002:a05:6602:2e8c:: with SMTP id
 m12mr17884032iow.91.1635305080832; 
 Tue, 26 Oct 2021 20:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211026145126.11025-1-josemartins90@gmail.com>
 <20211026145126.11025-2-josemartins90@gmail.com>
In-Reply-To: <20211026145126.11025-2-josemartins90@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 27 Oct 2021 13:24:14 +1000
Message-ID: <CAKmqyKMYP7E1QkV6CsHJxqWZUei1-r4iupt5c-zas=zeyd=b8w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/riscv: fix VS interrupts forwarding to HS
To: Jose Martins <josemartins90@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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
X-List-Received-Date: Wed, 27 Oct 2021 03:24:45 -0000

On Wed, Oct 27, 2021 at 12:53 AM Jose Martins <josemartins90@gmail.com> wrote:
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
> index 968cb8046f..55db004fea 100644
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
> 2.33.1
>
>

