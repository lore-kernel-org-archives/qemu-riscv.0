Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyDa0-0007UM-2y
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 09:51:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1oyDZx-0007T2-Nm; Thu, 24 Nov 2022 09:51:53 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1oyDZv-000232-MY; Thu, 24 Nov 2022 09:51:53 -0500
Received: by mail-wr1-x432.google.com with SMTP id n7so2775393wrr.13;
 Thu, 24 Nov 2022 06:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/N16N9ohKpxGbLRLwaVhHYVKjyZQgffFEDJpv6iJ4Pg=;
 b=U6RAwCylFKpgMH9gdalzykAahlllXj17uqmQh8kywRuRafvOgAnT+rJgttDFDappO0
 X4xTVLE9EDxXt2oiV19qPlFcUbnyRg5QXuQ3BSlKLb+Yb4nWJ6wVPwnhMG9T1mLObGO1
 8mtlFc94HPOaL22jXXs6ceNVkClPS8YcPDRTy1hjYcL8kjZZlyt3EegWh+QTJg8fwpUk
 Px/f4UOYwigQlPz+cYURaXRfuDbZQR+wsoNBUjAWNz3jGhEGgAoqTPS2h+xR4Oofjmbk
 Jz9116XvPGy91EhH97QU4m3XcdSDQ98YocrZkolp1iFAPU7ZtwQQJEPVCGosgKs17gq5
 EwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/N16N9ohKpxGbLRLwaVhHYVKjyZQgffFEDJpv6iJ4Pg=;
 b=2E/IMrFQvclu1ioRRhKbyYCNMoKtGV2RAj7TxMyfC4PBWx8OqbmQ6zQ2XXGoChhewP
 d0cADkZgjt3nrkqwnplsIoOmQb9TAJYCJqgD6MrbkEYGVjrjkad8nl3+/oof7k1qYfeH
 M9oQFefgrjVYNel2Fot+jMnS0GGVodMHMoLcwcDV3lMvfflh4Qh7j53cnTTOLlWxD9LX
 53sDBs8N47HRehWHaKj/viNidkeeIkX2OAt1T0xvfgqGozakdwhTafBXRtI5gVDjef1F
 rNVi/SGejCq8Cf794gsZQar/2zoOOtu78SqVujlq9JCdg8WFoeSA2lKXQklRIMy64jjy
 tIHw==
X-Gm-Message-State: ANoB5plzXNzFZ0MtEy3Rt4TECrklRJZ6BQQ1burVOXRcwvGoatRIHm4e
 1ODVlZWL5v00goRE17Xhs5o=
X-Google-Smtp-Source: AA0mqf64aQ2te1nLSrdl5DBXln8Oqcbp6WyC14gXQXyjoZNXVQ92Bioh437QhP+huVrkG8wL9ypihg==
X-Received: by 2002:adf:e347:0:b0:236:76de:7280 with SMTP id
 n7-20020adfe347000000b0023676de7280mr21007701wrj.194.1669301508545; 
 Thu, 24 Nov 2022 06:51:48 -0800 (PST)
Received: from gmail.com ([4.231.225.143]) by smtp.gmail.com with ESMTPSA id
 e2-20020a5d65c2000000b0022cdeba3f83sm1518245wrw.84.2022.11.24.06.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 06:51:48 -0800 (PST)
Date: Thu, 24 Nov 2022 15:44:31 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH for-8.0 09/19] target/microblaze: Convert to 3-phase reset
Message-ID: <Y3+DTzTYah0HbhYn@toto>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
 <20221124115023.2437291-10-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221124115023.2437291-10-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 24 Nov 2022 14:51:54 -0000

On Thu, Nov 24, 2022 at 11:50:12AM +0000, Peter Maydell wrote:
> Convert the microblaze CPU class to use 3-phase reset, so it doesn't
> need to use device_class_set_parent_reset() any more.


Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/microblaze/cpu-qom.h |  4 ++--
>  target/microblaze/cpu.c     | 12 ++++++++----
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/target/microblaze/cpu-qom.h b/target/microblaze/cpu-qom.h
> index 255b39a45df..cda9220fa99 100644
> --- a/target/microblaze/cpu-qom.h
> +++ b/target/microblaze/cpu-qom.h
> @@ -30,7 +30,7 @@ OBJECT_DECLARE_CPU_TYPE(MicroBlazeCPU, MicroBlazeCPUClass, MICROBLAZE_CPU)
>  /**
>   * MicroBlazeCPUClass:
>   * @parent_realize: The parent class' realize handler.
> - * @parent_reset: The parent class' reset handler.
> + * @parent_phases: The parent class' reset phase handlers.
>   *
>   * A MicroBlaze CPU model.
>   */
> @@ -40,7 +40,7 @@ struct MicroBlazeCPUClass {
>      /*< public >*/
>  
>      DeviceRealize parent_realize;
> -    DeviceReset parent_reset;
> +    ResettablePhases parent_phases;
>  };
>  
>  
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 89e493f3ff7..817681f9b21 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -162,14 +162,16 @@ static void microblaze_cpu_set_irq(void *opaque, int irq, int level)
>  }
>  #endif
>  
> -static void mb_cpu_reset(DeviceState *dev)
> +static void mb_cpu_reset_hold(Object *obj)
>  {
> -    CPUState *s = CPU(dev);
> +    CPUState *s = CPU(obj);
>      MicroBlazeCPU *cpu = MICROBLAZE_CPU(s);
>      MicroBlazeCPUClass *mcc = MICROBLAZE_CPU_GET_CLASS(cpu);
>      CPUMBState *env = &cpu->env;
>  
> -    mcc->parent_reset(dev);
> +    if (mcc->parent_phases.hold) {
> +        mcc->parent_phases.hold(obj);
> +    }
>  
>      memset(env, 0, offsetof(CPUMBState, end_reset_fields));
>      env->res_addr = RES_ADDR_NONE;
> @@ -399,10 +401,12 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
>      DeviceClass *dc = DEVICE_CLASS(oc);
>      CPUClass *cc = CPU_CLASS(oc);
>      MicroBlazeCPUClass *mcc = MICROBLAZE_CPU_CLASS(oc);
> +    ResettableClass *rc = RESETTABLE_CLASS(oc);
>  
>      device_class_set_parent_realize(dc, mb_cpu_realizefn,
>                                      &mcc->parent_realize);
> -    device_class_set_parent_reset(dc, mb_cpu_reset, &mcc->parent_reset);
> +    resettable_class_set_parent_phases(rc, NULL, mb_cpu_reset_hold, NULL,
> +                                       &mcc->parent_phases);
>  
>      cc->class_by_name = mb_cpu_class_by_name;
>      cc->has_work = mb_cpu_has_work;
> -- 
> 2.25.1
> 

