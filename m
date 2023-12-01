Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5931DC4167B
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 10:54:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r91A9-0000zx-Qe; Fri, 01 Dec 2023 05:54:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r91A5-0000ys-Tz
 for qemu-riscv@nongnu.org; Fri, 01 Dec 2023 05:54:22 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r919n-0003ea-NY
 for qemu-riscv@nongnu.org; Fri, 01 Dec 2023 05:54:21 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-54bfa9b3ffaso2437280a12.1
 for <qemu-riscv@nongnu.org>; Fri, 01 Dec 2023 02:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701428042; x=1702032842; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AF3+hJ4SletQg3wGyy+npS73Q4aYLZ13CxdgfQWgTk8=;
 b=q1XXjVCguDmLZ29lJqJ7aIY2hqtqZo7qEolVvWgc3sHQG7rHQkpx3xwqy06aBvs8Ir
 kFuA4f1Mv531R8W8tMQKm6XeFVt88IborJEbaz04K8Vof/uJy1jWAY6/9ZTqB6c7yj3O
 Ir8giKImjFNPI5XuhW+LMjeEb/Iqz8tABs79mVfz1hIvMp1C/sFTev08h6TKC0gNDaCs
 BYfVij8PtMZRYvGKHOy/T8C1tHmXcfmkAxkychPkbimCNPMfo7ueOONFnlyugD/p6vhP
 JOcdTyocOo87uoP5sHEDnFev7xoQNpfsVfGMs8ak7VfdcuPYpVzsq0d0Z4J1+WSmk3Aa
 Fvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701428042; x=1702032842;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AF3+hJ4SletQg3wGyy+npS73Q4aYLZ13CxdgfQWgTk8=;
 b=Tl/3hOAEcKStCjgw+Io9XsvMODCoIAF4sch9Zi7NpD7bMLi6PZg11aZa8VrCqAWs5o
 uWpT6JpAZMCzKDWSPbpZGIW2pSSWsLVH+9XbdeNCjLCiLbXitOaLZsTJSVVjhiNcJjjr
 J23kcnoctFw01NVI3pJUqK9W0oO9c0qndSY0KDS5vDvY4sjVZInUrZQ45C58QwRTxVd5
 +rDaVCB7e+Y9g1/5A7RR804KsTU5Elb70ZdIQN1BPwy5mnVOR3m69zD2yV22EIZz90Uy
 7a7WSP4fY9inK7oBLHfBl95lrx9NwweDOxMLevPiQiW8T9M4HYfWb2JbOknkUUgBzvLt
 BJ5A==
X-Gm-Message-State: AOJu0Yx+L3vyL8ckvb0LH2DArvFEj2P4vO7kurf8S1kO8piB9Bf9/OgH
 5I3iQJFreT0I1yZjLx3LsQ/7FA==
X-Google-Smtp-Source: AGHT+IHA+KeVhFP0g2fHKrw1WtLjj9ptv2maeSI0+k5Ur+CEAyev9FU7LgQSWCpsRYN5Lr+SqNCPdA==
X-Received: by 2002:a50:cc8b:0:b0:54b:44b8:259f with SMTP id
 q11-20020a50cc8b000000b0054b44b8259fmr647701edi.10.1701428042162; 
 Fri, 01 Dec 2023 02:54:02 -0800 (PST)
Received: from [192.168.69.100] ([176.176.160.225])
 by smtp.gmail.com with ESMTPSA id
 l3-20020aa7d943000000b0054afe3625a9sm1520020eds.43.2023.12.01.02.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Dec 2023 02:54:01 -0800 (PST)
Message-ID: <fd8715af-ef1c-4ccc-b602-25776a56fc76@linaro.org>
Date: Fri, 1 Dec 2023 11:53:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] machine: Introduce helper is_cpu_type_supported()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, vijai@behindbytes.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231129042012.277831-1-gshan@redhat.com>
 <20231129042012.277831-3-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231129042012.277831-3-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi Gavin,

On 29/11/23 05:20, Gavin Shan wrote:
> The logic, to check if the specified CPU type is supported in
> machine_run_board_init(), is independent enough. Factor it out into
> helper is_cpu_type_supported(). machine_run_board_init() looks a bit
> clean with this. Since we're here, @machine_class is renamed to @mc to
> avoid multiple line spanning of code. The comments are tweaked a bit
> either.
> 
> No functional change intended.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> v8: Move the precise message hint to PATCH[v8 3/9]        (Gavin)
> ---
>   hw/core/machine.c | 83 +++++++++++++++++++++++++----------------------
>   1 file changed, 45 insertions(+), 38 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index bde7f4af6d..1797e002f9 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1387,13 +1387,53 @@ out:
>       return r;
>   }
>   
> +static bool is_cpu_type_supported(const MachineState *machine, Error **errp)
> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(machine);
> +    ObjectClass *oc = object_class_by_name(machine->cpu_type);
> +    CPUClass *cc;
> +    int i;
> +
> +    /*
> +     * Check if the user specified CPU type is supported when the valid
> +     * CPU types have been determined. Note that the user specified CPU
> +     * type is provided through '-cpu' option.
> +     */
> +    if (mc->valid_cpu_types && machine->cpu_type) {
> +        for (i = 0; mc->valid_cpu_types[i]; i++) {
> +            if (object_class_dynamic_cast(oc, mc->valid_cpu_types[i])) {
> +                break;
> +            }
> +        }
> +
> +        /* The user specified CPU type isn't valid */
> +        if (!mc->valid_cpu_types[i]) {
> +            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
> +            error_append_hint(errp, "The valid types are: %s",
> +                              mc->valid_cpu_types[0]);
> +            for (i = 1; mc->valid_cpu_types[i]; i++) {
> +                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
> +            }
> +
> +            error_append_hint(errp, "\n");
> +            return false;
> +        }
> +    }
> +
> +    /* Check if CPU type is deprecated and warn if so */
> +    cc = CPU_CLASS(oc);
> +    if (cc && cc->deprecation_note) {

cc can't be NULL, right? Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +        warn_report("CPU model %s is deprecated -- %s",
> +                    machine->cpu_type, cc->deprecation_note);
> +    }
> +
> +    return true;
> +}


