Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lXGVx-00019b-B8
	for mharc-qemu-riscv@gnu.org; Fri, 16 Apr 2021 00:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lXGVv-00015K-K7; Fri, 16 Apr 2021 00:55:31 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:38690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lXGVs-0005bn-Lt; Fri, 16 Apr 2021 00:55:31 -0400
Received: by mail-io1-xd30.google.com with SMTP id f15so17754497iob.5;
 Thu, 15 Apr 2021 21:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TqhPBmIdX2fXKUKlrpYBCEXvJNh9xPtljVtd4cKyVpM=;
 b=dbA5OtcmCSKbyO3+EEv/+Y/t0uMkS0FK84qy1RmGOfBJvBqRCdXstc0uS9x1DDTmzU
 tUfwKrd9i3WrYrf2qTKqDKTF1U3EfR3J6setkJcv4OW2IrrxS+FAY/kgBwiyBMpHKvyE
 fpEQjAMzt6jQQl2lfLQfeMFVfaVomfFx0cCULOYAY44VSxFDQ/uSnvDHTFIHxPeN5Nyy
 zGCf0YKRw5jdVQmSLckpEF3/PUCQ2Ggmm2Ky6IrakvwFsjniLWRFnKwtDFmsqOVpRexA
 5qLe2bWJm3m9oLZb7sMlbQYJDrr8s5pIXeJAcjbB7vhU1huGmyExqBTgTF1n5aE6dtjy
 4ahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TqhPBmIdX2fXKUKlrpYBCEXvJNh9xPtljVtd4cKyVpM=;
 b=rPpUQRwYTYjsSwfb5Ba4VWwhovHOIRdAsCjDmbdl1cRmp+65TPDdmbnSpSZblPQN0W
 Yp6q0BwqajoDTPnFsSv6j4xjD/3FFLltqX6SvZ02CTmM0cs9/9GMzWi8WfZSoUTRs3C8
 dF/S7hFrSDSaGPvM+eA2n5AFx3gONFcu641IAdsJwsE6DdOT7gwqbFCh9DH4QWfElXXf
 Y8T1xoy4kAa9b+MHraLH2+fZnQjvjq6hbZ74szjwB0Cy1UwUzzXqQ4Nv57TGdLelume/
 mcQfoPkNFNe0FGZs/8OYYOqV7iKa3gGhFkIH+Zt8eeKm3IJ/CGfz7rtW/iZAiTyE2GO+
 TxHw==
X-Gm-Message-State: AOAM530aKQ0W8ztA4NxfbqNYbSK6S8aCmFGD5ZaiCQ57yiYe9gIp2cdD
 yghGSei4Iq7sq+u1raqSVWSox7fEIEGOoKL0oy4=
X-Google-Smtp-Source: ABdhPJzO1Si2smTymgF/iLc8zzOdlXuEk3X0yde6VyTdWaZ/yxguCW3kcVbIyRkDq+24oAKa1Dyax+b2F5MuqnOUnqQ=
X-Received: by 2002:a02:a38f:: with SMTP id y15mr2475580jak.106.1618548926208; 
 Thu, 15 Apr 2021 21:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210410194047.559189-1-josemartins90@gmail.com>
In-Reply-To: <20210410194047.559189-1-josemartins90@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 16 Apr 2021 14:55:00 +1000
Message-ID: <CAKmqyKPpjRfowvYjofny8JNwnDUZkyH4jnU6mvVxaWNJuEgsqA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix wfi exception behavior
To: Jose Martins <josemartins90@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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
X-List-Received-Date: Fri, 16 Apr 2021 04:55:31 -0000

On Sun, Apr 11, 2021 at 5:41 AM Jose Martins <josemartins90@gmail.com> wrote:
>
> The wfi exception trigger behavior was not taking into account the fact
> that user mode is not allowed to execute wfi instructions or the effect
> of the hstatus.vtw bit. It was also always generating virtual instruction
> exceptions when this should only happen when the wfi instruction is
> executed when the virtualization mode is enabled:
>
> - when a wfi instruction is executed, an illegal exception should be triggered
> if either the current mode is user or the mode is supervisor and mstatus.tw is
> set.
>
> - a virtual instruction exception should be raised when a wfi is executed from
> virtual-user or virtual-supervisor and hstatus.vtw is set.
>
> Signed-off-by: Jose Martins <josemartins90@gmail.com>
> ---
>  target/riscv/cpu_bits.h  | 1 +
>  target/riscv/op_helper.c | 8 +++++---
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 24b24c69c5..ed8b97c788 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -436,6 +436,7 @@
>  #define HSTATUS_HU           0x00000200
>  #define HSTATUS_VGEIN        0x0003F000
>  #define HSTATUS_VTVM         0x00100000
> +#define HSTATUS_VTW          0x00200000
>  #define HSTATUS_VTSR         0x00400000
>  #if defined(TARGET_RISCV64)
>  #define HSTATUS_VSXL        0x300000000
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index d55def76cf..354e39ec26 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -174,9 +174,11 @@ void helper_wfi(CPURISCVState *env)
>  {
>      CPUState *cs = env_cpu(env);
>
> -    if ((env->priv == PRV_S &&
> -        get_field(env->mstatus, MSTATUS_TW)) ||
> -        riscv_cpu_virt_enabled(env)) {
> +    if ((!riscv_cpu_virt_enabled(env) && env->priv == PRV_U) ||

> +        (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TW))) {

Shouldn't we check here that we aren't virtualised?

Alistair

> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> +    } else if (riscv_cpu_virt_enabled(env) && (env->priv == PRV_U ||
> +            (env->priv == PRV_S && get_field(env->hstatus, HSTATUS_VTW)))) {
>          riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
>      } else {
>          cs->halted = 1;
> --
> 2.25.1
>
>

