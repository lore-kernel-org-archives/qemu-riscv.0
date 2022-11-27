Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozQ9y-00073i-Ty
	for mharc-qemu-riscv@gnu.org; Sun, 27 Nov 2022 17:30:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ozQ9w-00071k-0i; Sun, 27 Nov 2022 17:30:00 -0500
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ozQ9u-0002fg-DD; Sun, 27 Nov 2022 17:29:59 -0500
Received: by mail-vs1-xe33.google.com with SMTP id i2so8948514vsc.1;
 Sun, 27 Nov 2022 14:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DeawGyKlbs/HWTPi9657JgmmdY9fM82ujCs3ypnIWuU=;
 b=GUf0NWPDme/yqj+lLJVRGM1Yl2MpG2iFEBPKOAlCjpysp+K2g/x9G2pSql3xaJuxzx
 4y1nSWWYc+eCz3MfHXdBCFeTBHPpP9KvRhixcEFXH2WDpV4flPJLSxFtaC4SrTdDQWWU
 ZqCoYHpfwMbgTGDQ9D2IFX8/LyXYOrXEKP9JZQbKJX+dO+PGxRjAvT8IBlDzh/1v/Doh
 UslmwL1eqIriagimPA2B7s8uJD5aU6SUx6ZVK/6SstbYSVac/yNxHb7uB757huPtCb3h
 f3sfdujNc6vJrCLSTkWW7qClUjVs4gbfJr0kZO7NV3OBLVWffp6LowYlRWCcRd+lYp69
 bqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DeawGyKlbs/HWTPi9657JgmmdY9fM82ujCs3ypnIWuU=;
 b=o39vqi1nh31e7f1ab0oroqTTS8xJoU99OBp3GP0/3zUu3lHG+VgXxjAFCat2AKG4Wa
 2epOzJq/R5o7AYqawgASkNu0pOyTgRI0qkvZYLbwQvM4M9Zwr3B8b35gqyNGtWE4TJpF
 iuNYMiEgXxw+CNYBLkcFwApp7UBvxQbmvmjgKwTYaww0ns195wrzxH4OcCc2351KqYzx
 vza5wMSQ1/6hDc5cHzuHw5rw0BK8strIzk6IMEWg3tauxZ4y7CyHqbwk68geJRtIgXxq
 dghOWKZPZ1Hsex3WQQSzc2hu3WC+N7SEuYS32XNKWVWGwU2Gr5kl8J6BQJ4OroxDsGmD
 dHuA==
X-Gm-Message-State: ANoB5pnKmQRRSoWTeWK/kOAK7uhAn6AS9z6NTt9kk8s8pC3K0gorqVGy
 ArxmDZEiFL2V+v5wmBJVt8Ays+DXQJJjr2bqdXA=
X-Google-Smtp-Source: AA0mqf4+0FU/LV49fOARAMmSPiQNQ9aMjZWKchPQ1IZupWVdy9w9NpMxGcXe33+RY26qwj4O7BAgOBZFBRw1cB0p0/M=
X-Received: by 2002:a05:6102:f09:b0:3a6:eec3:b246 with SMTP id
 v9-20020a0561020f0900b003a6eec3b246mr25844703vss.64.1669588195533; Sun, 27
 Nov 2022 14:29:55 -0800 (PST)
MIME-Version: 1.0
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
 <20221124115023.2437291-15-peter.maydell@linaro.org>
In-Reply-To: <20221124115023.2437291-15-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 28 Nov 2022 08:29:29 +1000
Message-ID: <CAKmqyKPSVgOCuFjSAi0rjWZemmH5vTPhRxh3Cw2f0rUgpvy6Gg@mail.gmail.com>
Subject: Re: [PATCH for-8.0 14/19] target/riscv: Convert to 3-phase reset
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Michael Rolnik <mrolnik@gmail.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, 
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, 
 Marek Vasut <marex@denx.de>, Stafford Horne <shorne@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
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
X-List-Received-Date: Sun, 27 Nov 2022 22:30:00 -0000

On Thu, Nov 24, 2022 at 10:00 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Convert the riscv CPU class to use 3-phase reset, so it doesn't
> need to use device_class_set_parent_reset() any more.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h |  4 ++--
>  target/riscv/cpu.c | 12 ++++++++----
>  2 files changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3a9e25053f8..443d15a47c0 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -395,7 +395,7 @@ OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
>  /**
>   * RISCVCPUClass:
>   * @parent_realize: The parent class' realize handler.
> - * @parent_reset: The parent class' reset handler.
> + * @parent_phases: The parent class' reset phase handlers.
>   *
>   * A RISCV CPU model.
>   */
> @@ -404,7 +404,7 @@ struct RISCVCPUClass {
>      CPUClass parent_class;
>      /*< public >*/
>      DeviceRealize parent_realize;
> -    DeviceReset parent_reset;
> +    ResettablePhases parent_phases;
>  };
>
>  struct RISCVCPUConfig {
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d14e95c9dc1..6fe176e4833 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -519,18 +519,20 @@ static void riscv_restore_state_to_opc(CPUState *cs,
>      env->bins = data[1];
>  }
>
> -static void riscv_cpu_reset(DeviceState *dev)
> +static void riscv_cpu_reset_hold(Object *obj)
>  {
>  #ifndef CONFIG_USER_ONLY
>      uint8_t iprio;
>      int i, irq, rdzero;
>  #endif
> -    CPUState *cs = CPU(dev);
> +    CPUState *cs = CPU(obj);
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
>      CPURISCVState *env = &cpu->env;
>
> -    mcc->parent_reset(dev);
> +    if (mcc->parent_phases.hold) {
> +        mcc->parent_phases.hold(obj);
> +    }
>  #ifndef CONFIG_USER_ONLY
>      env->misa_mxl = env->misa_mxl_max;
>      env->priv = PRV_M;
> @@ -1161,11 +1163,13 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
>      CPUClass *cc = CPU_CLASS(c);
>      DeviceClass *dc = DEVICE_CLASS(c);
> +    ResettableClass *rc = RESETTABLE_CLASS(c);
>
>      device_class_set_parent_realize(dc, riscv_cpu_realize,
>                                      &mcc->parent_realize);
>
> -    device_class_set_parent_reset(dc, riscv_cpu_reset, &mcc->parent_reset);
> +    resettable_class_set_parent_phases(rc, NULL, riscv_cpu_reset_hold, NULL,
> +                                       &mcc->parent_phases);
>
>      cc->class_by_name = riscv_cpu_class_by_name;
>      cc->has_work = riscv_cpu_has_work;
> --
> 2.25.1
>
>

