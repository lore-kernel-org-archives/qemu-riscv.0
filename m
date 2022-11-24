Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyDZg-0007Pt-QT
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 09:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1oyDZb-0007Nv-Gi; Thu, 24 Nov 2022 09:51:32 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1oyDZZ-0001f9-Ji; Thu, 24 Nov 2022 09:51:31 -0500
Received: by mail-wr1-x433.google.com with SMTP id z4so2816608wrr.3;
 Thu, 24 Nov 2022 06:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+uwNOdYfLKq7Fy+lf/q/Td1ushoXOSUtQZ5ylhxN0bo=;
 b=X/7fym3aSH7yzeT/aOW8xgYsphf4Zkj0QmtJdmxwKJhonFJAb8p6AgVw1WRIhPuGXE
 Fp40EeFDfALielk5/Pl8dhxFRCeKrtL8INRS8qLcNFm5NgXP56rbhhg24kj36Ut8Hoq4
 201A4+YyQOAERxQjrZ1FvYtxQiduDvEbzLiQ3Uy5CZv5enhSfv8pTDLGyCPZ51T/18Qs
 wE/YqcErAyFnMz/y1fgaFrfCbtFzI8WdlMT6Go7E6p7itzX+3U3BPKfJtBjEmQxzoLsq
 kJaMFX8D1TrlXVyQyRp4onWfG6+fh5EaWJVDaX2nghbmIljQ9ZJQiYve0V9K2/WnwGZO
 h8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+uwNOdYfLKq7Fy+lf/q/Td1ushoXOSUtQZ5ylhxN0bo=;
 b=TplW/c09dGxnaqW2kiJ2S21NhVPkbgj89PJnzfU2Al6+36uC5Y0tpF6mR88XBchnAR
 bAA+0JEh2Ao9QHC6/XZh8GE+ItRcRdWhbX8JeTA2k9Uhn95I47POp+kzywNgFmX9hQ//
 wjDk0QkScSm5KGLCnwKGooKoQS98lW5I40lClAHYtJ+XPGSQj+XOfgM46fZYItH11Edn
 pxEPHn2LtEfvQuBIfa97RKSHHgY7etfyueqPzihNHBAQqQBhxDLCDOvWUUF7fB19o3+2
 MQmKVWtGEfiV56tnht5L2Ln90eLw6vFrRzuuPqjPxAdFZsfmWAO5/raqOZk9w1+rTftT
 reOw==
X-Gm-Message-State: ANoB5pmMBXGV+kJEimDOzbZO1bVzaRs6Qp5zEPycMU39I4mWXYLKTdwS
 1MMYkgAXq8Hnx1GcXe/tZcQ=
X-Google-Smtp-Source: AA0mqf5Vo34kW41f/MyMFXtQVued+RKsrz2kgTThLHLj2GJE1lwJkq7HXRhft04dpkN7/YcmSaQo8g==
X-Received: by 2002:a5d:4ec7:0:b0:241:e27f:840e with SMTP id
 s7-20020a5d4ec7000000b00241e27f840emr8135403wrv.690.1669301486270; 
 Thu, 24 Nov 2022 06:51:26 -0800 (PST)
Received: from gmail.com ([4.231.225.143]) by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c351400b003c6cd82596esm6797413wmq.43.2022.11.24.06.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 06:51:25 -0800 (PST)
Date: Thu, 24 Nov 2022 15:44:09 +0100
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
Subject: Re: [PATCH for-8.0 04/19] target/cris: Convert to 3-phase reset
Message-ID: <Y3+DOQLB+k4brf+3@toto>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
 <20221124115023.2437291-5-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221124115023.2437291-5-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Thu, 24 Nov 2022 14:51:33 -0000

On Thu, Nov 24, 2022 at 11:50:07AM +0000, Peter Maydell wrote:
> Convert the cris CPU class to use 3-phase reset, so it doesn't
> need to use device_class_set_parent_reset() any more.


Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>



> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/cris/cpu-qom.h |  4 ++--
>  target/cris/cpu.c     | 12 ++++++++----
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/target/cris/cpu-qom.h b/target/cris/cpu-qom.h
> index 71e8af0e70a..431a1d536a9 100644
> --- a/target/cris/cpu-qom.h
> +++ b/target/cris/cpu-qom.h
> @@ -30,7 +30,7 @@ OBJECT_DECLARE_CPU_TYPE(CRISCPU, CRISCPUClass, CRIS_CPU)
>  /**
>   * CRISCPUClass:
>   * @parent_realize: The parent class' realize handler.
> - * @parent_reset: The parent class' reset handler.
> + * @parent_phases: The parent class' reset phase handlers.
>   * @vr: Version Register value.
>   *
>   * A CRIS CPU model.
> @@ -41,7 +41,7 @@ struct CRISCPUClass {
>      /*< public >*/
>  
>      DeviceRealize parent_realize;
> -    DeviceReset parent_reset;
> +    ResettablePhases parent_phases;
>  
>      uint32_t vr;
>  };
> diff --git a/target/cris/cpu.c b/target/cris/cpu.c
> index fb05dc6f9ab..a6a93c23595 100644
> --- a/target/cris/cpu.c
> +++ b/target/cris/cpu.c
> @@ -56,15 +56,17 @@ static bool cris_cpu_has_work(CPUState *cs)
>      return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
>  }
>  
> -static void cris_cpu_reset(DeviceState *dev)
> +static void cris_cpu_reset_hold(Object *obj)
>  {
> -    CPUState *s = CPU(dev);
> +    CPUState *s = CPU(obj);
>      CRISCPU *cpu = CRIS_CPU(s);
>      CRISCPUClass *ccc = CRIS_CPU_GET_CLASS(cpu);
>      CPUCRISState *env = &cpu->env;
>      uint32_t vr;
>  
> -    ccc->parent_reset(dev);
> +    if (ccc->parent_phases.hold) {
> +        ccc->parent_phases.hold(obj);
> +    }
>  
>      vr = env->pregs[PR_VR];
>      memset(env, 0, offsetof(CPUCRISState, end_reset_fields));
> @@ -305,11 +307,13 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
>      DeviceClass *dc = DEVICE_CLASS(oc);
>      CPUClass *cc = CPU_CLASS(oc);
>      CRISCPUClass *ccc = CRIS_CPU_CLASS(oc);
> +    ResettableClass *rc = RESETTABLE_CLASS(oc);
>  
>      device_class_set_parent_realize(dc, cris_cpu_realizefn,
>                                      &ccc->parent_realize);
>  
> -    device_class_set_parent_reset(dc, cris_cpu_reset, &ccc->parent_reset);
> +    resettable_class_set_parent_phases(rc, NULL, cris_cpu_reset_hold, NULL,
> +                                       &ccc->parent_phases);
>  
>      cc->class_by_name = cris_cpu_class_by_name;
>      cc->has_work = cris_cpu_has_work;
> -- 
> 2.25.1
> 

