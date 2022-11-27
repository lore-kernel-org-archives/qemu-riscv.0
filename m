Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozQAw-0007oM-BN
	for mharc-qemu-riscv@gnu.org; Sun, 27 Nov 2022 17:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ozQAV-0007TG-3M; Sun, 27 Nov 2022 17:30:35 -0500
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ozQAS-0002uM-Iq; Sun, 27 Nov 2022 17:30:33 -0500
Received: by mail-vk1-xa31.google.com with SMTP id o24so4437600vkl.9;
 Sun, 27 Nov 2022 14:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IzLELE2/eXDuGDIW1pSyUFcbsTjmOMUlxGZOw4MnXt4=;
 b=iR1HuCLw1NEH3dIEmPiavxIz3sP1GJ3BFvUaZgTwy51DKVxNBUbbhUMq2U5SRGwIcl
 zYmFouk274xwe+wo4Ok0PrgmneeJbHIBZvlpbpZ3p2OTWBIMqv2lm5v3GX0Oz5GI6Ybc
 za8VX6SHQzXNCSQgePeJh0VGas0hYEHmLzwSaCTz5BzZf+Ki66KUF9rhkrwui32tWPyp
 uciPTCeeFWXIqOxAl6AUpniYSPhJnuxnyQZmAyVbwFaAcjd9trBjRW2efrq3rnG5dhY1
 eoHH0Fe6KifDA8Yp/yBolE7WxiATk+K1FeFXz4jblGnQutLB1w1VwX2srgWTBSZp/crk
 Swew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IzLELE2/eXDuGDIW1pSyUFcbsTjmOMUlxGZOw4MnXt4=;
 b=AcTeXjLZ+w8cYtOBROmoRH2TDfJxKxpjXf9FoaNV1JHlEVs8wO7RJ783JAtOoanbaG
 DPjuvZIsb4g4N2VVbQQaJDoycCwAOcCdekzDYvOoaFX+2yUWW0DxWa4Mqp1kVkKVqi2/
 lpMfpx2XW2+kQcwc+5bnAKL2GKXQudoBDo5uzKOhYt8JVXYutN18RXZCAJCqqjWvZKvm
 5k3PNzrxXpjH0TCuDRPYxzu0TFOb3TNeDVoRpa4mx7QylEZofVKFrXbk/aSaSdam+Mn8
 QCiQrQVwh2WsEZF3PFh9fqqA+ENxB18wuHHz8BKVhAeCaRzmrmMM2j1RkeJiSQh8og1Q
 Uebg==
X-Gm-Message-State: ANoB5pn+7d7iUkqztdDooobracQrZMP+B7Yyem8FTOlaEwGbXX2BGalt
 tjt801xlu0Wv/oB97TlQbrZpUM2ZEpdx7mb9ZdU=
X-Google-Smtp-Source: AA0mqf6lrqL7VAdf8Pd+TbG3lolx39NMKymR9BQN2wm7wtjGCcsm2DNlVYGVGQN611fz7SQ2p1X3Ifrqxs+8Ehb/f/U=
X-Received: by 2002:a05:6122:c97:b0:3b7:cbb8:bbf1 with SMTP id
 ba23-20020a0561220c9700b003b7cbb8bbf1mr27461531vkb.25.1669588230018; Sun, 27
 Nov 2022 14:30:30 -0800 (PST)
MIME-Version: 1.0
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
 <20221124115023.2437291-2-peter.maydell@linaro.org>
In-Reply-To: <20221124115023.2437291-2-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 28 Nov 2022 08:30:03 +1000
Message-ID: <CAKmqyKPYFJ-0bQDtRAFZTrV0TOMc314Mq=LEDfkrJ84arr_WdA@mail.gmail.com>
Subject: Re: [PATCH for-8.0 01/19] hw/core/cpu-common: Convert TYPE_CPU class
 to 3-phase reset
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa31.google.com
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
X-List-Received-Date: Sun, 27 Nov 2022 22:30:39 -0000

On Thu, Nov 24, 2022 at 9:57 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Convert the parent class TYPE_CPU to 3-phase reset. This
> is a necessary prerequisite to converting the subclasses.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/cpu-common.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index f9fdd46b9d7..78b5f350a00 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -116,9 +116,9 @@ void cpu_reset(CPUState *cpu)
>      trace_guest_cpu_reset(cpu);
>  }
>
> -static void cpu_common_reset(DeviceState *dev)
> +static void cpu_common_reset_hold(Object *obj)
>  {
> -    CPUState *cpu = CPU(dev);
> +    CPUState *cpu = CPU(obj);
>      CPUClass *cc = CPU_GET_CLASS(cpu);
>
>      if (qemu_loglevel_mask(CPU_LOG_RESET)) {
> @@ -259,6 +259,7 @@ static int64_t cpu_common_get_arch_id(CPUState *cpu)
>  static void cpu_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>      CPUClass *k = CPU_CLASS(klass);
>
>      k->parse_features = cpu_common_parse_features;
> @@ -269,7 +270,7 @@ static void cpu_class_init(ObjectClass *klass, void *data)
>      set_bit(DEVICE_CATEGORY_CPU, dc->categories);
>      dc->realize = cpu_common_realizefn;
>      dc->unrealize = cpu_common_unrealizefn;
> -    dc->reset = cpu_common_reset;
> +    rc->phases.hold = cpu_common_reset_hold;
>      cpu_class_init_props(dc);
>      /*
>       * Reason: CPUs still need special care by board code: wiring up
> --
> 2.25.1
>
>

