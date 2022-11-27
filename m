Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozQ8n-0006Mv-FU
	for mharc-qemu-riscv@gnu.org; Sun, 27 Nov 2022 17:28:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ozQ8l-0006Lr-Iv; Sun, 27 Nov 2022 17:28:47 -0500
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ozQ8k-0002WZ-2O; Sun, 27 Nov 2022 17:28:47 -0500
Received: by mail-vk1-xa32.google.com with SMTP id r13so4449188vkf.2;
 Sun, 27 Nov 2022 14:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E332JKBxic/sOxyM4XfOS2wIJPbv5BGKPgOKsPtgdz8=;
 b=S81cSmys6NmbRBVPBlUwK9kbIOIVUVGzvq23+9SHVZUTOYNuVUHnuYh7mshKpxr7oc
 oCExPqmseiBLFDRgCREP8T5sWW/T3mXfYJ7fc3hoYDTG3UeKG5LZAP5d6DQpiCC3o5xl
 on6YByxtbhBbN0ZotlJRNwGwkFH4knDVMp1GhWz4zoxij2FCdhIERWj5XfYJSERj49+s
 Ihv/qf4pLDs7MLRVMpxd582iyyGP+qsKV8LvebXtWncAUI8eVS1F1fP5Ae0AD/LMxKnc
 HrtuQ62IeRLoNEWYq2DvV+90KKuWx9gqk2ocFce8ubB0626s0Q82f8IzXTmLi9lP5Ki+
 qPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E332JKBxic/sOxyM4XfOS2wIJPbv5BGKPgOKsPtgdz8=;
 b=syKEqYDAfJXPifHdOl7Z2Mjpi1VTqLQDv6JgyTSf5LAktxmYarNt+6xOW1AUZFxO1u
 fYsWzFZ6AgK3Te1dpzf2O2Wd3iCxt34D/gekp5Sm4bSwYCR0+QhFIKP6brcds7x09SwK
 ZP7JyuJSjuTnii2kQ/aJK1YWfbs52QBNr5J6dbHLsW/jvuejvbaRPecH24vySrxR+8h6
 TMNPr6PaT8JSNZ6qhQk5fRjAT7xBMbLKllplBruV/fb6MgiD07vfw7h2lj7svCjtAkxW
 TzpUwbF0WRWH9j7QxThy8stTmrTjO+f1pof+KG5y6QDJkS5qWUCtOxjD9Uv1XDV0xx1k
 6bTg==
X-Gm-Message-State: ANoB5pnfO0Zgo8G7KtmArIgMfgqBmVeMXISx/ybyZwuNe22LDdXDe3Tf
 LWGEm69+IHAVMib0JvMkiEEbK3L1+h5YKUKqIWo=
X-Google-Smtp-Source: AA0mqf5QUlIW9vfzwDsh6LEAbEd7Hi6DNDEvA/P/+1rZcVvEyKC1ikmMzf+tJQhGChIcBmHS/hLMEKYIJCemcv9zC9I=
X-Received: by 2002:a1f:3846:0:b0:3bc:c843:c7b5 with SMTP id
 f67-20020a1f3846000000b003bcc843c7b5mr3086832vka.30.1669588123681; Sun, 27
 Nov 2022 14:28:43 -0800 (PST)
MIME-Version: 1.0
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
 <20221124115023.2437291-3-peter.maydell@linaro.org>
In-Reply-To: <20221124115023.2437291-3-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 28 Nov 2022 08:28:17 +1000
Message-ID: <CAKmqyKNHZoCERV6_aso_hif0fMC2fBm3LX75Qp=NkYwUZShTdw@mail.gmail.com>
Subject: Re: [PATCH for-8.0 02/19] target/arm: Convert to 3-phase reset
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa32.google.com
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
X-List-Received-Date: Sun, 27 Nov 2022 22:28:48 -0000

On Thu, Nov 24, 2022 at 9:58 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Convert the Arm CPU class to use 3-phase reset, so it doesn't
> need to use device_class_set_parent_reset() any more.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/arm/cpu-qom.h |  4 ++--
>  target/arm/cpu.c     | 13 +++++++++----
>  2 files changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
> index 64c44cef2dd..514c22ced9b 100644
> --- a/target/arm/cpu-qom.h
> +++ b/target/arm/cpu-qom.h
> @@ -43,7 +43,7 @@ void aarch64_cpu_register(const ARMCPUInfo *info);
>  /**
>   * ARMCPUClass:
>   * @parent_realize: The parent class' realize handler.
> - * @parent_reset: The parent class' reset handler.
> + * @parent_phases: The parent class' reset phase handlers.
>   *
>   * An ARM CPU model.
>   */
> @@ -54,7 +54,7 @@ struct ARMCPUClass {
>
>      const ARMCPUInfo *info;
>      DeviceRealize parent_realize;
> -    DeviceReset parent_reset;
> +    ResettablePhases parent_phases;
>  };
>
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index a021df9e9e8..5bad065579f 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -202,14 +202,16 @@ static void cp_reg_check_reset(gpointer key, gpointer value,  gpointer opaque)
>      assert(oldvalue == newvalue);
>  }
>
> -static void arm_cpu_reset(DeviceState *dev)
> +static void arm_cpu_reset_hold(Object *obj)
>  {
> -    CPUState *s = CPU(dev);
> +    CPUState *s = CPU(obj);
>      ARMCPU *cpu = ARM_CPU(s);
>      ARMCPUClass *acc = ARM_CPU_GET_CLASS(cpu);
>      CPUARMState *env = &cpu->env;
>
> -    acc->parent_reset(dev);
> +    if (acc->parent_phases.hold) {
> +        acc->parent_phases.hold(obj);
> +    }
>
>      memset(env, 0, offsetof(CPUARMState, end_reset_fields));
>
> @@ -2210,12 +2212,15 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>      ARMCPUClass *acc = ARM_CPU_CLASS(oc);
>      CPUClass *cc = CPU_CLASS(acc);
>      DeviceClass *dc = DEVICE_CLASS(oc);
> +    ResettableClass *rc = RESETTABLE_CLASS(oc);
>
>      device_class_set_parent_realize(dc, arm_cpu_realizefn,
>                                      &acc->parent_realize);
>
>      device_class_set_props(dc, arm_cpu_properties);
> -    device_class_set_parent_reset(dc, arm_cpu_reset, &acc->parent_reset);
> +
> +    resettable_class_set_parent_phases(rc, NULL, arm_cpu_reset_hold, NULL,
> +                                       &acc->parent_phases);
>
>      cc->class_by_name = arm_cpu_class_by_name;
>      cc->has_work = arm_cpu_has_work;
> --
> 2.25.1
>
>

