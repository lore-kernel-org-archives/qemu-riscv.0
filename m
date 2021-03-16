Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMGFC-0007FC-Rp
	for mharc-qemu-riscv@gnu.org; Tue, 16 Mar 2021 16:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMGF5-0007EJ-Pd; Tue, 16 Mar 2021 16:24:41 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:38562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMGF2-0004GR-7O; Tue, 16 Mar 2021 16:24:39 -0400
Received: by mail-qt1-x832.google.com with SMTP id j7so12670745qtx.5;
 Tue, 16 Mar 2021 13:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=evhtJvjbG7bwbzKZvKD7ZubcdW1mtYvJZLNX5f3GEUU=;
 b=cMKiHXiU8XX8ilwUz7CynQGdfgVA032Tz2lpltdiAbbE3yx1/UhlHl4gASaokYJQGL
 Rt123wgF6YW0BxPYxYiDdNfmnwwouGDgoBhvaMyuba2Tik3d/bP5IFhf/10rLiaH5I2B
 jxAaXZlY4V8udf2jx64mlX4nhykV/jqRaP8kR4Y8Jx2VSy8GN3kr/2yCVzyezSFnJ+PY
 tZo6AqqXjYqQJ2E1mBoaVd1h0a1aaqFJ7rl+IRCWkZ9jcJqvpnpdVGZiFiIuWSwm5vw2
 wy032D0qNuEN3CvJvpQ0l6TkkpL/rsQ5VNNA6h1RktYJaTbJdQzeLMUGqLurcAoyCzZs
 ix5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=evhtJvjbG7bwbzKZvKD7ZubcdW1mtYvJZLNX5f3GEUU=;
 b=I+TbwVzxV0xN/sqE/DVIGuSnr4WlZQRzQKrVV9c60og21kQkp7/ShZE9KsGojW1QaZ
 XG4jpa2vROYagFM8XbuZO1F7vAb0ge8mYz+v6eeh1g+2w588Yd6+LvKgRW0GQAJid27+
 fn6Bj2beHB8J++SHiIWkutNbDBCgj+Tv5eqHS8+dzgPqQtifLrwg4J//tnsztktnX8Rl
 9ecxMUIcp9U0P4szvkc94vJHifRQ/jJHDmR6cbYta6tTuz8jH6DrXWqpPydLjuMjQX8u
 DVyq4iQQoz5WffFONdzpIgGhLRglq0vmH/0xZbOl0ZZImK+q+U4nJeaq2yNqku3Qt3cx
 HTPQ==
X-Gm-Message-State: AOAM533g+CwPpVnrBaBKAmD4md9CT+guJJlDXnXVZzg4T4s/CfdnQ+aH
 40Qc2ufTE4SK5iuKg7F4u/e+W45ma4AmY+ByxnQ=
X-Google-Smtp-Source: ABdhPJwTfs5A3ebrciICIXQlGppw76CPy7wI80bEjq5GCnuHyVj56wfui1E1cPxlzghZ448y6QA0n3LU3ZRYRLuQWa8=
X-Received: by 2002:aed:2ee7:: with SMTP id k94mr614669qtd.135.1615926274923; 
 Tue, 16 Mar 2021 13:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210311103036.1401073-1-georg.kotheimer@kernkonzept.com>
In-Reply-To: <20210311103036.1401073-1-georg.kotheimer@kernkonzept.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Mar 2021 16:22:57 -0400
Message-ID: <CAKmqyKPWtFpww61N2ZuLD3vEoR_mvVfqnCDfj8nbGR-+O9+jtA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Use background registers also for
 MSTATUS_MPV
To: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=alistair23@gmail.com; helo=mail-qt1-x832.google.com
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
X-List-Received-Date: Tue, 16 Mar 2021 20:24:44 -0000

On Thu, Mar 11, 2021 at 5:32 AM Georg Kotheimer
<georg.kotheimer@kernkonzept.com> wrote:
>
> The current condition for the use of background registers only
> considers the hypervisor load and store instructions,
> but not accesses from M mode via MSTATUS_MPRV+MPV.
>
> Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 2f43939fb6..d5d84d0d1c 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -321,7 +321,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>       * was called. Background registers will be used if the guest has
>       * forced a two stage translation to be on (in HS or M mode).
>       */
> -    if (!riscv_cpu_virt_enabled(env) && riscv_cpu_two_stage_lookup(mmu_idx)) {
> +    if (!riscv_cpu_virt_enabled(env) && two_stage) {
>          use_background = true;
>      }
>
> --
> 2.30.1
>
>

