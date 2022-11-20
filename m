Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1owtaH-0006ZC-6S
	for mharc-qemu-riscv@gnu.org; Sun, 20 Nov 2022 18:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1owtaF-0006Yy-Sj; Sun, 20 Nov 2022 18:18:43 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1owtaE-00011r-E3; Sun, 20 Nov 2022 18:18:43 -0500
Received: by mail-vs1-xe34.google.com with SMTP id i2so9696223vsc.1;
 Sun, 20 Nov 2022 15:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nRH3xzOacrcCG6lAxQ2xyNzBkLHbMcDLa574MWWnVyg=;
 b=f6y7TdLL7U/a3ToMsATtailShanbA1/GHEt0GVUs4ETylBej1cDzgtPUPT5k1gY/pc
 BYVRVF6caffMG2IlMFwCrUcVOkuv3/LT7oE6QVJoYfzN9d2PCnuXA53f/vGklWJUsZUM
 9HNSssPeOGZa0KmWWuyRsg5aaGu7RVCRdmoM+7NUrtbBrYaASd5Ii/hKFPlJlzqo8DFG
 he8YWTMIbZfHnEyRY1/qMKHKVrLCpwa/nUB5NUwIy1YWm+JQzIcPesxmsdaKEdywr/tN
 yMYnO8FfP0+EDpNwucNR8fXlTjPo83lKmWXv8ZSt/m8GK+tqFtEcOiOYZgpwqUyn1yV2
 YdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nRH3xzOacrcCG6lAxQ2xyNzBkLHbMcDLa574MWWnVyg=;
 b=C1KYss1OAu1vrq81lITuQf1VZxTEDERda95+mbFyFJoH7QECiANE3l5SfwrkQaDWeH
 xCYPiA3FCS2RtnZoEzrFSMyRcroTVsx6wL/v3NtGO9cgPwRoB8gnlCp8n73/idK6H/DV
 Mr9pwACsKC0Yq6bdbrOSeDqNI7t6WnT0aZyqqwkjRtG1VZRv5sDfcRrhq9zW78FEE5jb
 lmyXWwnoziHoGdS5FNjXc50cenSgx/6bNTUwlkL8kDWJJuObczaYRfa0bi3nn7FCinYZ
 q6ebOAgvNdPnk76s70I3J4h46FTjHfAqpJFhNd4s/TSz9c0XvTwTlSIdxAiU8v9rgIMc
 60IA==
X-Gm-Message-State: ANoB5pmyXSJ/ErsF+eeD8wc3anTJcvimvxXRpx7eRkBfsMiAdoBAd83o
 /k41wu14RN42SdO/C1UMl3vBzSNU5OEyPUpcU8EdnkQNmMY=
X-Google-Smtp-Source: AA0mqf5YYiESMOBIG2ef/gMc1efTn+wOrJ5JewHIz35XX3scQ74WJW7x2fO85g85OhYpgok11pHr6Sdn+0LyzHu9ZtQ=
X-Received: by 2002:a05:6102:3bc1:b0:3a7:9b8c:2e4c with SMTP id
 a1-20020a0561023bc100b003a79b8c2e4cmr7707850vsv.72.1668986320712; Sun, 20 Nov
 2022 15:18:40 -0800 (PST)
MIME-Version: 1.0
References: <20221118091858.242569-1-richard.henderson@linaro.org>
 <20221118091858.242569-6-richard.henderson@linaro.org>
In-Reply-To: <20221118091858.242569-6-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Nov 2022 09:18:14 +1000
Message-ID: <CAKmqyKP3DxdtPOM4q3GjXpazck8kCoTJiiAPwmoL21QQrVE3aA@mail.gmail.com>
Subject: Re: [PATCH for-8.0 5/7] target/riscv: Use QEMU_IOTHREAD_LOCK_GUARD in
 riscv_cpu_update_mip
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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
X-List-Received-Date: Sun, 20 Nov 2022 23:18:44 -0000

On Fri, Nov 18, 2022 at 7:22 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: qemu-riscv@nongnu.org
> ---
>  target/riscv/cpu_helper.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 278d163803..241d06bab8 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -610,7 +610,6 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
>      CPURISCVState *env = &cpu->env;
>      CPUState *cs = CPU(cpu);
>      uint64_t gein, vsgein = 0, vstip = 0, old = env->mip;
> -    bool locked = false;
>
>      if (riscv_cpu_virt_enabled(env)) {
>          gein = get_field(env->hstatus, HSTATUS_VGEIN);
> @@ -621,10 +620,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
>      mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
>      vstip = env->vstime_irq ? MIP_VSTIP : 0;
>
> -    if (!qemu_mutex_iothread_locked()) {
> -        locked = true;
> -        qemu_mutex_lock_iothread();
> -    }
> +    QEMU_IOTHREAD_LOCK_GUARD();
>
>      env->mip = (env->mip & ~mask) | (value & mask);
>
> @@ -634,10 +630,6 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
>          cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
>      }
>
> -    if (locked) {
> -        qemu_mutex_unlock_iothread();
> -    }
> -
>      return old;
>  }
>
> --
> 2.34.1
>
>

