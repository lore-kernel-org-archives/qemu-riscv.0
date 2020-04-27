Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jTBd9-0006OF-0l
	for mharc-qemu-riscv@gnu.org; Mon, 27 Apr 2020 17:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34468)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jTBd6-0006Np-7I
 for qemu-riscv@nongnu.org; Mon, 27 Apr 2020 17:49:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jTBd4-0007SD-A1
 for qemu-riscv@nongnu.org; Mon, 27 Apr 2020 17:49:31 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:41566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jTBd2-0007Rh-AD; Mon, 27 Apr 2020 17:49:29 -0400
Received: by mail-il1-x144.google.com with SMTP id f82so18233121ilh.8;
 Mon, 27 Apr 2020 14:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+KeBG7zAWzP1ss9bkDLyH8S2VP+wc99+OjPv1vvRscI=;
 b=n6NDe53RxXnIwY3vBQRpjBf83DehT0wAQL9dtqww3R7d12C4KWPCifmq19yyi32hOJ
 SConuSzLICq4/cZV0CdrbE7Gqp1wqWOSyLl2s5Da6mRJmjCtWGV/WawolnjcM9mc0eRg
 tXR46V0420NgVbHeN9rgWHsU8gd+LMsYGmwF/lggfgfcXGqH6vZmgfHTF2wOdo2v4Foh
 wVNPEMdexnSbrAl2GKMu5Uv3OHlEIjFZyhF1Qc6I2NaB/MdSBnqRVpu104cYZWsNB8T7
 MESUVT3zmGF5cIiuiimLdV1BepePAmuqipeyEG9hRQKTocRlDaO2i+bZwaB9h4ijGoTz
 Pirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+KeBG7zAWzP1ss9bkDLyH8S2VP+wc99+OjPv1vvRscI=;
 b=N4gC9Qf/B8s7fFtwNeMBLxeCxefRZQgVB79Lx8JG3ke6STfo7GTruG8Cil5TewRFeg
 REDdLZFFb2UvLynhPS+rD5emASiYmy0JLlZAiJbTh5/YDj+nGwGVkTeI/7h8cfSIYVol
 Db6naovHbRHAZqt+U0OC9F/uFx/Ud8RN07isL4biSKo8mDowhyZsEzpWG8gW6T5bBryY
 bf8hFyAc3450FrujNXLsviGbESFdTGVA+MA2Xk01+rsKXHqBJ0ZG/4SlU0owaApN5pzU
 UrRDqzyzvuWcCg2L0lV35gi+I1Qpff9BjEwLFlpOIyy2FCMuNdjh0RWKqC8HI85Pnx5B
 ZgIQ==
X-Gm-Message-State: AGi0Puac+qhqg98t9LY1qnYPujhb7XxjPjrplo3arkifwiYp1OwKgjLf
 Da4QmENrdAQBRcllR+uiPjo78mtVO+zce6tp2jo=
X-Google-Smtp-Source: APiQypLgq4Eo+NxlQ1wxrvheCGEJhhVwc2VnUGg8bDp7rfSAac4dp6PLtkIyzvfXFiACalecUF2taQnWIwH1bc/FexY=
X-Received: by 2002:a92:aa07:: with SMTP id j7mr4118299ili.40.1588024166685;
 Mon, 27 Apr 2020 14:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAC41xo2O1k+cn7EO3Zu3U70qefFwGa5B1iNRNgRwLk7SGX=-Aw@mail.gmail.com>
In-Reply-To: <CAC41xo2O1k+cn7EO3Zu3U70qefFwGa5B1iNRNgRwLk7SGX=-Aw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 27 Apr 2020 14:40:48 -0700
Message-ID: <CAKmqyKPDzusVqzCFwCJ+2gY0qchguhR57zHNkE-0MTeffKs_OA@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv: fix VS interrupts forwarding to HS
To: Jose Martins <josemartins90@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::144
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
X-List-Received-Date: Mon, 27 Apr 2020 21:49:33 -0000

On Sat, Apr 18, 2020 at 11:01 AM Jose Martins <josemartins90@gmail.com> wrote:
>
> When vs interrupts (2, 6, 10) are enabled, pending and not delegated
> in hideleg, they are not always forwarded to hs mode after a return to
> vs mode. This happens independently of the state of spie and sie on
> the hs-level sstatus before the return. Instead, the vs-level status
> sie state seems to be controlling if the interrupt is forward to hs or
> not. This is both because, in riscv_cpu_local_irq_pending, vs
> interrupts are ignored when checking for hs pending interrupts and
> also because hs interrupts might not be considered enabled after
> jumping to vs mode if the spie (which implicitly is copied to sie) is
> not set when sret is executed. From what I could gather, the spec does
> not preclude hs mode from receiving vs interrupts if they are not
> delegated in hideleg (although this is true for m mode, but guaranteed
> by hardwiring the corresponding bits in mideleg). Also, it clearly
> states that: "Interrupts for higher-privilege modes, y>x, are always
> globally enabled regardless of the setting of the global yIE bit for
> the higher-privilege mode.", so hs_mstatus_sie must be set whenever
> virt is enabled. After solving the previous issue, the problem remains
> that when such interrupts are delegated in hideleg, there is still the
> need to check it when calculating pending_hs_irq, otherwise, we're
> still "forcing an hs except" when the interrupt should be forwarded to
> vs. I believe the following patch will fix this issue:
>
> Signed-off-by: Jose Martins <josemartins90@gmail.com>

Thanks for the patch!

I'm a little confused, do you mind explaining some things to me below.

> ---
>  target/riscv/cpu_helper.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index d3ba9efb02..9962ee4690 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -43,8 +43,7 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>      target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
>      target_ulong hs_mstatus_sie = get_field(env->mstatus_hs, MSTATUS_SIE);
>
> -    target_ulong pending = env->mip & env->mie &
> -                               ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> +    target_ulong pending = env->mip & env->mie;

If the Hypervisor sets the V* interrupts why does it then want to
receive the interrupt itself?

>      target_ulong vspending = (env->mip & env->mie &
>                                (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));
>
> @@ -52,11 +51,11 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>                            (env->priv == PRV_M && mstatus_mie);
>      target_ulong sie    = env->priv < PRV_S ||
>                            (env->priv == PRV_S && mstatus_sie);
> -    target_ulong hs_sie = env->priv < PRV_S ||
> +    target_ulong hs_sie = riscv_cpu_virt_enabled(env) || env->priv < PRV_S ||
>                            (env->priv == PRV_S && hs_mstatus_sie);

Isn't hs_sie only ever accessed if riscv_cpu_virt_enabled(env)?
Doesn't this just set hs_sie to always be 1?

>
>      if (riscv_cpu_virt_enabled(env)) {
> -        target_ulong pending_hs_irq = pending & -hs_sie;
> +        target_ulong pending_hs_irq = pending & ~env->hideleg & -hs_sie;

This change looks good.

Alistair

>
>          if (pending_hs_irq) {
>              riscv_cpu_set_force_hs_excep(env, FORCE_HS_EXCEP);
> --
> 2.17.1
>

