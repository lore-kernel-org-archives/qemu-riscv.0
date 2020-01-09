Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipM0k-0002oI-Lb
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jan 2020 19:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56417)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1ipM0b-0002iU-Vs
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 19:49:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1ipM0X-00086e-Q2
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 19:49:08 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:35831)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1ipM0X-00084b-JH
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 19:49:05 -0500
Received: by mail-pf1-x443.google.com with SMTP id i23so2486555pfo.2
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2020 16:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=KQfEp3p4VDk1zl6NMFLBM7nYydr2cpxfeNHo46j1imQ=;
 b=NSct3BTVlZw87sPjRg3gcYeUL/bKHx7xEpHMxeZbTfQyLrWLGKcOnUw7sKc98wRPmS
 9xKkpvGHZFLno+SkXVU2neudyWHCgEeAOGtUqn6k4fDERIpj9XfxZ/nglj5NbM7uR8Tc
 LlQVAi82Jts1YrOZHnQznpR8XQpn+kAJ/AumAqQxXL2SmXny1Ua4yIiqEPPbTKODiW3c
 hpitBNOxBIBCJHY8ebX8kie2k9oK9YVOGZ4OV1Srl3/94KH0OyhzYOJ9CuFMxTPHtVpd
 oZqabKOX5BcTUwG16DFjdCRHxPGV4ajplLS4LeEmayeuSOKvdWVV9seTQmVGiki/MrW9
 kijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=KQfEp3p4VDk1zl6NMFLBM7nYydr2cpxfeNHo46j1imQ=;
 b=KNTudxC09SZLnAf0OnzXsGtUXxgMgdfxdaxdS4Yp1cfAp3bCW9BPdHV2+j7sSgGWuu
 okDxj6g74DtUTCqztF62OymVNvHSrDp67STL+zr41DdyiWEX51ILFMSntP/BUlwXKRMK
 2k/vgPp7OVeY/AFD4pynmozrBxhzAUX0ombu32kjMO86e6iqBdy3ZvPddhFlYhDhQu1s
 5JKh0UYio2kbw5KqEVF+52TkjH6pnPrkh50Hawt42E7Belc07ImKjCmBtsVNhz9h9Ebx
 oP3QrHRlHa4x5kBUU1FeW1LqjHfOFX284tx4OHWCqdLk84IW/z2Ama7jppF2pzBzFBYT
 8THA==
X-Gm-Message-State: APjAAAXxJ2xa1wmo0h0euMCR8Yw7YdotD6ulE6+qTbGRxZT/K0is0d4k
 YEfBvaHBow1YtvXl6CqcZrwflw==
X-Google-Smtp-Source: APXvYqzhndEtEvRI3a7LIipHv22w+jhMBvDuQwRJ3OwlqGswzepvtxGh6kNurd42JjqAhztGkXgSmw==
X-Received: by 2002:a62:7883:: with SMTP id t125mr8447867pfc.141.1578530944521; 
 Wed, 08 Jan 2020 16:49:04 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id bo19sm455227pjb.25.2020.01.08.16.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 16:49:03 -0800 (PST)
Date: Wed, 08 Jan 2020 16:49:03 -0800 (PST)
X-Google-Original-Date: Wed, 08 Jan 2020 16:29:07 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v1 20/36] target/riscv: Add support for virtual interrupt
 setting
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
To: Alistair Francis <Alistair.Francis@wdc.com>
In-Reply-To: <2389483485d4642a6e5670e2546c62e493e91fd6.1575914822.git.alistair.francis@wdc.com>
References: <2389483485d4642a6e5670e2546c62e493e91fd6.1575914822.git.alistair.francis@wdc.com><cover.1575914822.git.alistair.francis@wdc.com>
Message-ID: <mhng-6814f8b9-d54a-4663-900c-83023307a658@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-List-Received-Date: Thu, 09 Jan 2020 00:49:16 -0000

On Mon, 09 Dec 2019 10:11:32 PST (-0800), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_helper.c | 33 ++++++++++++++++++++++++++++-----
>  1 file changed, 28 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 63439c9370..85eed5d885 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -37,13 +37,36 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>  #ifndef CONFIG_USER_ONLY
>  static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>  {
> +    target_ulong irqs;
> +
>      target_ulong mstatus_mie = get_field(*env->mstatus, MSTATUS_MIE);
>      target_ulong mstatus_sie = get_field(*env->mstatus, MSTATUS_SIE);
> -    target_ulong pending = env->mip & env->mie;
> -    target_ulong mie = env->priv < PRV_M || (env->priv == PRV_M && mstatus_mie);
> -    target_ulong sie = env->priv < PRV_S || (env->priv == PRV_S && mstatus_sie);
> -    target_ulong irqs = (pending & ~env->mideleg & -mie) |
> -                        (pending &  env->mideleg & -sie);
> +    target_ulong hs_mstatus_sie = get_field(env->mstatus_novirt, MSTATUS_SIE);
> +
> +    target_ulong pending = env->mip & env->mie &
> +                               ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> +    target_ulong vspending = (env->mip & env->mie &
> +                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)) >> 1;
> +
> +    target_ulong mie    = env->priv < PRV_M ||
> +                          (env->priv == PRV_M && mstatus_mie);
> +    target_ulong sie    = env->priv < PRV_S ||
> +                          (env->priv == PRV_S && mstatus_sie);
> +    target_ulong hs_sie = env->priv < PRV_S ||
> +                          (env->priv == PRV_S && hs_mstatus_sie);
> +
> +    if (riscv_cpu_virt_enabled(env)) {
> +        target_ulong pending_hs_irq = pending & -hs_sie;
> +
> +        if (pending_hs_irq) {
> +            riscv_cpu_set_force_hs_excep(env, FORCE_HS_EXCEP);
> +            return ctz64(pending_hs_irq);
> +        }
> +
> +        pending = vspending;
> +    }
> +
> +    irqs = (pending & ~env->mideleg & -mie) | (pending &  env->mideleg & -sie);

Isn't "-unsigned" implementation defined?  I can't get GCC to throw a warning
and it was already there, so maybe I'm just wrong?

>
>      if (irqs) {
>          return ctz64(irqs); /* since non-zero */

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

