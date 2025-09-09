Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC97CAC583
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 12:50:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uvxnX-0003fg-VS; Tue, 09 Sep 2025 08:50:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uvxnV-0003ex-K1
 for qemu-riscv@nongnu.org; Tue, 09 Sep 2025 08:50:09 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uvxnS-0001sY-3z
 for qemu-riscv@nongnu.org; Tue, 09 Sep 2025 08:50:09 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-7723cf6e4b6so4195912b3a.3
 for <qemu-riscv@nongnu.org>; Tue, 09 Sep 2025 05:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1757422203; x=1758027003; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OFNQnj20+wpNALlD5yMKFYv4r48yrtyPIAE1azLaaG0=;
 b=SdpXuuZL2BRfAJcZ4OhKezwSqYIO6YFRaQt4iyhiOrsvP9ivLzQjjxTGHqMUsd3iiX
 1wVkxFD9H+JMrPwKFMyxdaJ2tsqLwzg6045GPnwn8T+cYSLODcBtaYJpECF2pcgon9Ms
 qar7TFnrZJ5Yv+cqP50uTQe7y/Pjei7LyvuzgwK3NubrJVLeZWwBarVVqj+XJd0P/8Dl
 1gpRSxWqNcHZooiDmNaHlkarfMxtgQXtvZmD1l4UbIO3tqOjNpFIswlBGhmhDd4nKCUN
 OtiCnwrVf+TAC9ODu8hBpCLy3TKW1IBQEIQP1g9sGZjWlr+1MGB1CldmU7DyYeCZCIXw
 iX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757422203; x=1758027003;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OFNQnj20+wpNALlD5yMKFYv4r48yrtyPIAE1azLaaG0=;
 b=OR84FA2+RO6RTmjWmWq+q4OKHJC3mq+7xb4dtwVjz3Vh//jGdF4goHnQ3sgbAD0sh9
 FWEJWlc3bLnbtBMBvmkY937R5rSw852WktM3dFfk1RamtPeO2OzFLkDQKwS+wi9mXoi1
 WnfaZyW8r3Lm/58SQlk9BesdEi/JEY/sLkC8LHhCwkfrmH9QH58MlEgxN4RFQrS8naxN
 CntAhPvOikUM+DShq+Mp7eWjXfB/AOkfjRF+9v9tL9ulvP6KCM1Roc0hBfERmDKLRdQ5
 1i/AncE/++rcUEPhiqaBDEuxvzEG5IBGIKIK75Nqdp5RZTKXWcUOv/LYyh0hCzHN58Kw
 LKUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXChyu1L/Kby6jbQxfnBWnRSzHErsMgwHbsm2STFDBh6Vj4lNYKiqMPenBW34W1jUk+qVRc7VQG0NI/@nongnu.org
X-Gm-Message-State: AOJu0YzusILWDijn5NtoKr5kp4iLFHi3qek6Yh3kz/YUXviPIva2cXeL
 3ZKvydFZ+0pJTBdfUsjBJQOdLdvn1rfi0NsEnJkC2Ql111xPbFSfPe/U5veaJIDCe6I=
X-Gm-Gg: ASbGnct6SFRA+ng3JKejKORk65ovMn6f1T41tRaOk6OPw5/SSTbjIzH3bvSwYzu1Ybq
 wwpoeSrIot2DUCUQwScDINjfQs58EPNDdxiUU8OKghQ5D+3IrPTbDpz+dhkl1ZcqJ7NwIPtFB1O
 r9cabAqgl2j9GP7ylyYMXsm8F79JxVu2xGWBrUAbzJN4qbMNyZrMAbCTY8uKs0c7glbweyXGNm+
 HvcH4zXSH99jGf1TY6w/omdP5wJpkQoxn+667Rfa5Y2vguH9UJgwaO03hKyOiQZ+rvmDE3u27bt
 9l6aM6/mO2fbnPk+4EMvrgVsOc1kV/EvWR1SeiU3WkCKPP5q4jm90E6qCDNbqISckyIYOJdLs3b
 5r2TOsf0BMQofyYOO5LxVpvLa7MPYD/x2atAF
X-Google-Smtp-Source: AGHT+IGwMnFabx7T17zBRXJFGklCdVGllSDeHG10V0WM+TWVwyHfM8Ru+QnEVSupwmxD9SPd1V9BOA==
X-Received: by 2002:a17:902:eccf:b0:24e:47ea:9519 with SMTP id
 d9443c01a7336-251718ddac9mr157675505ad.47.1757422202420; 
 Tue, 09 Sep 2025 05:50:02 -0700 (PDT)
Received: from [192.168.68.110] ([187.10.187.251])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24c7ecd9cafsm181645015ad.83.2025.09.09.05.49.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 05:50:01 -0700 (PDT)
Message-ID: <5db78a12-2c66-4620-9a25-ea7ede0c3c2e@ventanamicro.com>
Date: Tue, 9 Sep 2025 09:49:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] target/riscv: Save stimer and vstimer in CPU vmstate
To: TANG Tiancheng <lyndra@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>
References: <20250909-timers-v1-0-7ee18a9d8f4b@linux.alibaba.com>
 <20250909-timers-v1-3-7ee18a9d8f4b@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250909-timers-v1-3-7ee18a9d8f4b@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 9/9/25 6:46 AM, TANG Tiancheng wrote:
> vmstate_riscv_cpu was missing env.stimer and env.vstimer.
> Without migrating these QEMUTimer fields, active S/VS-mode
> timer events are lost after snapshot or migration.
> 
> Add VMSTATE_TIMER_PTR() entries to save and restore them.
> 
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/machine.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 1600ec44f0b755fdd49fc0df47c2288c9940afe0..51e0567ed30cbab5e791ea904165bc1854709192 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -400,6 +400,30 @@ static const VMStateDescription vmstate_ssp = {
>       }
>   };
>   
> +static bool sstc_timer_needed(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +
> +    if (!cpu->cfg.ext_sstc) {
> +        return false;
> +    }
> +
> +    return env->stimer != NULL || env->vstimer != NULL;
> +}
> +
> +static const VMStateDescription vmstate_sstc = {
> +    .name = "cpu/timer",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = sstc_timer_needed,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_TIMER_PTR(env.stimer, RISCVCPU),
> +        VMSTATE_TIMER_PTR(env.vstimer, RISCVCPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>   const VMStateDescription vmstate_riscv_cpu = {
>       .name = "cpu",
>       .version_id = 10,
> @@ -476,6 +500,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>           &vmstate_elp,
>           &vmstate_ssp,
>           &vmstate_ctr,
> +        &vmstate_sstc,
>           NULL
>       }
>   };
> 


