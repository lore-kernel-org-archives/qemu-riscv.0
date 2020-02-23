Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j5sRV-00020p-BN
	for mharc-qemu-riscv@gnu.org; Sun, 23 Feb 2020 09:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50730)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <josemartins90@gmail.com>) id 1j5sRS-00020U-QM
 for qemu-riscv@nongnu.org; Sun, 23 Feb 2020 09:41:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <josemartins90@gmail.com>) id 1j5sRQ-00042g-VP
 for qemu-riscv@nongnu.org; Sun, 23 Feb 2020 09:41:10 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:44630)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <josemartins90@gmail.com>)
 id 1j5sRQ-00041a-Gr; Sun, 23 Feb 2020 09:41:08 -0500
Received: by mail-il1-x141.google.com with SMTP id s85so5588074ill.11;
 Sun, 23 Feb 2020 06:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jNHXUNQXmlDSrfSwk27t/N3ZsEx3GEk/3uPgFOGyZXs=;
 b=Tv2oDBTVldiEYJMnbSDkMuFPfIa6m05OS2WpAAs/g+hlTRFsGRvAgrS9l1D/gegP9V
 OjarEpM5r3rk/l+azPGDqupQ9rlIl22TzhH8/1oC5p8sA6WLcj7ozinpFNHc2p+bNdE4
 7lLTnLDPMmZirqBZsxmrJA/aAmPQXgakSdNAnL+CQAS9QRFDW23mPBtlU3ATtZWHZu+W
 sO/WjjzwMPNrmIBfvBGjvC7Rw0tumPhb4bqDgi3HiP9K+h7B1OfM58gy3D95cfvv37ay
 MHQ/C4af/VeUKzgLkN2aEVZqBSgflBVlyauMmgofQUiTHI8bzHzWL5hHxSXJVOCZEyhb
 99Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jNHXUNQXmlDSrfSwk27t/N3ZsEx3GEk/3uPgFOGyZXs=;
 b=AL9SKoSuRzv09bTClqCQadyPa1lOaUKHNE+wrl4stfjwtgvae0UjjgdxdH1CwIwePU
 PsWjOalM530VKjgHdxJ27oS/ukqJTHGDdKfJA/asDnd3AANG1sKcXwFpQfa5oUMn6DpF
 kF1dyqGiYe5QUwe6csgwlEPvy/uKNsbn/UZ9vFEecizdIidMpisT2Ebj8dcRKoSHvwAg
 mxLpwSIxCpvftutK6D75aNdE+T4xtlW2AjfzQNi98BvcjV4C6f4lA/EAUnGeVYJJtIfs
 FoUz9oHndBtH+rPUKnRJ83LTA8ynN1x55EuEcjFd9y7Ir7k3VVu0WI2K4XE606mClEH/
 tisA==
X-Gm-Message-State: APjAAAV90p/F5hg9cRB3FiVMwY3NPHyhltNZrzfd30C2x2iJNOmSLDok
 OhBjdFTX/MNum9IEi/57l5ARQnQYXPfNf/UTAkw=
X-Google-Smtp-Source: APXvYqwquY2NuWheRKs2Fkdw2PmHyc/8B/yws3YeR8AXr5kZESWl8auIEbo1UUDlPGOg3FBx24KrdQbq/cRPR5IT86o=
X-Received: by 2002:a92:1f16:: with SMTP id i22mr53254413ile.206.1582468866751; 
 Sun, 23 Feb 2020 06:41:06 -0800 (PST)
MIME-Version: 1.0
References: <0c4859f90948ba392da456c9e1daf8fde8f5b22e.1582453384.git.rajnesh.kanwal49@gmail.com>
In-Reply-To: <0c4859f90948ba392da456c9e1daf8fde8f5b22e.1582453384.git.rajnesh.kanwal49@gmail.com>
From: Jose Martins <josemartins90@gmail.com>
Date: Sun, 23 Feb 2020 14:40:55 +0000
Message-ID: <CAC41xo0PWCZw4mrcEfRq9fv+b3mSk9sN0mWhFXPwgdD6LR8xnQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv: Fix VS mode interrupts forwarding.
To: rajnesh.kanwal49@gmail.com
Cc: qemu-riscv@nongnu.org, palmerdabbelt@google.com, alistair.francis@wdc.com, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::141
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
X-List-Received-Date: Sun, 23 Feb 2020 14:41:11 -0000

Hello rajnesh,

I had already submitted almost this exact patch a few weeks ago.

Jose

On Sun, 23 Feb 2020 at 13:51, <rajnesh.kanwal49@gmail.com> wrote:
>
> From: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
>
> Currently riscv_cpu_local_irq_pending is used to find out pending
> interrupt and VS mode interrupts are being shifted to represent
> S mode interrupts in this function. So when the cause returned by
> this function is passed to riscv_cpu_do_interrupt to actually
> forward the interrupt, the VS mode forwarding check does not work
> as intended and interrupt is actually forwarded to hypervisor. This
> patch fixes this issue.
>
> Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> ---
>  target/riscv/cpu_helper.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index b9e90dfd9a..59535ecba6 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -46,7 +46,7 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>      target_ulong pending = env->mip & env->mie &
>                                 ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
>      target_ulong vspending = (env->mip & env->mie &
> -                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)) >> 1;
> +                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));
>
>      target_ulong mie    = env->priv < PRV_M ||
>                            (env->priv == PRV_M && mstatus_mie);
> @@ -900,6 +900,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>
>              if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1) &&
>                  !force_hs_execp) {
> +                /*
> +                 * See if we need to adjust cause. Yes if its VS mode interrupt
> +                 * no if hypervisor has delegated one of hs mode's interrupt
> +                 */
> +                if (cause == IRQ_VS_TIMER || cause == IRQ_VS_SOFT ||
> +                    cause == IRQ_VS_EXT)
> +                    cause = cause - 1;
>                  /* Trap to VS mode */
>              } else if (riscv_cpu_virt_enabled(env)) {
>                  /* Trap into HS mode, from virt */
> --
> 2.17.1
>
>

