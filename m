Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E110C8302B
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 16:01:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uWGw0-0001Fj-VN; Mon, 30 Jun 2025 12:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uWGvw-0001DV-OM
 for qemu-riscv@nongnu.org; Mon, 30 Jun 2025 12:00:41 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uWGvm-0003S5-6x
 for qemu-riscv@nongnu.org; Mon, 30 Jun 2025 12:00:40 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a582e09144so1760903f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 30 Jun 2025 09:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751299227; x=1751904027; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ETfoLWs4dv0eS6RB/K3ePexMvWWCZjtTREgkqGXtLz8=;
 b=PgwfYaVu0a9ihabrTyJhP5u12uL2B9ZGz5PvHCAcd4V2AneVLVRvSxqN20Lxn/pdZp
 XewosHi159DuMyOqMOEM/c/b8FTjqIto0C/wk/xI2Z3+2ZUsPp6+4+GWzvRfXvKGfyvk
 pwXUcXNQCcDIHeL/FKwdI/2rnQgL938GliC2+HJRqStot9GO8MMvj9gsqPKT9k2m2bGo
 MyjO5rAAS7iDsoqA4ZMcvXRK/QXvFzgkrnz35TFITEwp7hSb7UoKH6ZPGi/wvC4yadUu
 ti2Mbd6LcEjY4BcL0Yw4aAM927Ojdo46eyKLHLlKH98MawXff2ItUhYILz1anP95Ibj+
 3hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751299227; x=1751904027;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ETfoLWs4dv0eS6RB/K3ePexMvWWCZjtTREgkqGXtLz8=;
 b=R6r5MHQq0OA+aIOc5P+M14A+dRV0dIiJib6ObQykaYO2mTuf2RvIHyYhk0pTtKkUaO
 TNlbeuuTR5QoepxE6ISya/mnZbcB5qfjdMVOJfDJxmFdKFpsVCm6VaulkJTNOB/p41No
 C5YAOeKnV7kxzuy8emCT56Pmf0DU+F4WLySNbwvhJGGOCY8dkdSkCAy59fR0RS03zyLa
 7GUBCWiVtRoOFfNrSLNLh3F3WnlMylDzW6ZBQKD8tf1nAS6JgEkWeI0mFaXitWUx2MNR
 zLkZQf4l+iUrniHLiew76UKSKvb1G6mu12nP94Uacq7O6kA/5XZtvBddE+ObRnkDDYUG
 bl9w==
X-Gm-Message-State: AOJu0YxyKxHllFIBZQQPhmr9mhmK7s4dPNMKEMQIS7TwIlC0Iagp7TY1
 cEnLs2U9HRMLu+DsWQEnxeAnI5dukZMSv1xipKOZ2a9HnDyjcv+VXeyAi4dBVAWxW6ewslJVlW8
 Njba2
X-Gm-Gg: ASbGncviuXNkfBjJOc8jTitSVoST2DL8G4CxES+H8NJM7n9qzRX9/0owdO00/G+62te
 NonIcXO0SIkp93izTgozT8AwgF4tasXqz1lwM6OMNNCTVghBDd+n2ydUSPiOQaS86K0FGmAMEi8
 JLTz3Nex1cPM4vzip0/f5SvbtaXlFiAgczrnZLRSqIU/KkyfM5EEf3C9Py5X52dqmElOEVsnFQq
 8ltJIto+oMgViV6fsTXHnpf0vJ6X1MpguIqK8nUXK2l8GeyeS5+FTSjD8Th9KdCszI2TPoNcvf0
 gAnK43TR4j2x8lI98j++tAnR0a991HAcbU5ceowZiO0UF/rOOdK3dbUZDBA+Q/Z45KzOh/yMJvh
 2W+/T1/sFyJjKcPJJaIeezLpC6D/APw==
X-Google-Smtp-Source: AGHT+IFoMU624qXJOogBYGETr0CoTLrir2UoekPAG+4+D14nbxi67ju36e0DugOVoYOe2i0tCgQ8jw==
X-Received: by 2002:a05:6000:4b0d:b0:3a4:f435:5801 with SMTP id
 ffacd0b85a97d-3a8fdb2a190mr11455338f8f.17.1751299226811; 
 Mon, 30 Jun 2025 09:00:26 -0700 (PDT)
Received: from [192.168.69.218] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453822c6b9fsm169425725e9.0.2025.06.30.09.00.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 09:00:26 -0700 (PDT)
Message-ID: <be01b414-f30f-4ca5-a515-94a60187e8e6@linaro.org>
Date: Mon, 30 Jun 2025 18:00:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hmp-cmds-target, target/riscv: add 'info register'
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20250630132228.1276838-1-dbarboza@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250630132228.1276838-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi Daniel,

On 30/6/25 15:22, Daniel Henrique Barboza wrote:
> The RISC-V target has *a lot* of CPU registers, with more registers
> being added along the way when new extensions are added. In this world,
> 'info registers' will throw a wall of text that can be annoying to deal
> with when the user wants to verify the value of just a couple of
> registers.
> 
> Add a new 'info register' HMP command that prints a specific register.
> The semantics, and implementation, is similar to what 'info registers'
> already does, i.e. '-a' will print a register for all VCPUs and it's
> possible to print a reg for a specific VCPU.
> 
> A RISC-V implementation is included via riscv_cpu_dump_register().
> 
> Here's an example:
> 
> Welcome to Buildroot
> buildroot login: QEMU 10.0.50 monitor - type 'help' for more information
> (qemu) info register mstatus
> 
> CPU#0
>   mstatus  0000000a000000a0
> (qemu) info register mstatus -a
> 
> CPU#0
>   mstatus  0000000a000000a0
> 
> CPU#1
>   mstatus  0000000a000000a0
> (qemu)
> 
> The API is introduced as TARGET_RISCV only.
> 
> Cc: Dr. David Alan Gilbert <dave@treblig.org>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hmp-commands-info.hx         | 17 +++++++++++++
>   hw/core/cpu-common.c         |  8 ++++++
>   include/hw/core/cpu.h        | 11 +++++++++
>   include/monitor/hmp-target.h |  1 +
>   monitor/hmp-cmds-target.c    | 30 ++++++++++++++++++++++
>   target/riscv/cpu.c           | 48 ++++++++++++++++++++++++++++++++++++
>   6 files changed, 115 insertions(+)
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 639a450ee5..f3561e4a02 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -113,6 +113,23 @@ SRST
>       Show the cpu registers.
>   ERST
>   
> +#if defined(TARGET_RISCV)

Just make this command available for all targets, displaying
"No such register" or better when no handler registered.

> +    {
> +        .name       = "register",
> +        .args_type  = "register:s,cpustate_all:-a,vcpu:i?",
> +        .params     = "[register|-a|vcpu]",
> +        .help       = "show a cpu register (-a: show the register value for all cpus;"
> +                      " vcpu: specific vCPU to query; show the current CPU's register if"
> +                      " no vcpu is specified)",

I'd invert the default behavior: dump for all vcpus except if a specific
one is specified.

I wonder about a 'info register -h' do list all register names available.

> +        .cmd        = hmp_info_register,
> +    },
> +
> +SRST
> +  ``info register``
> +    Show a cpu register.
> +ERST
> +#endif

Regards,

Phil.

