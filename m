Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E3AEB64DA
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 07:47:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qF8q6-00009C-JQ; Fri, 30 Jun 2023 03:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qF8q5-00006p-Ki
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 03:46:45 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qF8q3-00028U-0p
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 03:46:45 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6b7541d885cso1327481a34.3
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 00:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688111201; x=1690703201;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6HPrgitqRCKJsWhkdtASBSoBfApXm/0wZXGuvOyVsTk=;
 b=Xl8hoKGkhgsG7y7p5LIYuseZlUg8j3UUhfIP1riZpb2iCVgVEJ6dt+vOrNefAz+gcd
 wkG34BxQ2LkJ2d+JsCtnkf31xL59vcLK8NU1lSQOu/qsI/KQYR3OvxZ7A86EwUlNsUr0
 iAb/7Pi/7dH24Pnn8S+HvrYzflUDqbwL9TCNuli03qIL79LX7dnYxl9MS0OtWy+SAEAi
 uAoAxYHBfcJMsQXyInfzq1OKe1F7ziNeQg+p0irz8ZSTdiKwtj0V18KTt0ZJEXs5M4MR
 DDPCUFAUeStdWeWhnVp9W8Pf92KsudTk23QeSRKT7+hVXOtiEEg39Mb1cM97O3Ha4wfG
 HF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688111201; x=1690703201;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6HPrgitqRCKJsWhkdtASBSoBfApXm/0wZXGuvOyVsTk=;
 b=a4fnbeiQfr2MXOkYOF1h1ObbZmuypWg9dZYXSFirExWkq7LPLTo795bLnTwdg2Lw6b
 hIUBL1DbnwfRArrPKJ1vZo0I+vy5qac5NEQ5C4dS6gefUQg0tpcbLJtopehUQIUhkI5n
 i345Cp2L1hOWpMmyzr2v8NjGDWJHungMHnDMtzK7HWEGxxRiK03jPsjwHfFCw83B/MwZ
 phVF/K+B/7Amew7RdSohlEfj+u7Cqs/+UxwvJAbwhd5I6bf7xFGCO9YPyNdhssew4YrZ
 tdkgohWVJmXTJLoejysEjuHUTnQDOQTewBcSQjPv4nAHnVrNZLwo28Hlo2twYowxGUMg
 /TLQ==
X-Gm-Message-State: AC+VfDxgLsaugjvOd6LlSc2oKt3uGc42K0jJy226s8Bie8P6NgFV5T2D
 ffX+kGcvTHdCOBrEBBcFlvLbyg==
X-Google-Smtp-Source: ACHHUZ6AH4sXdJU2ydMVoyLBDY+D5b3hxu8hJ/ZBFrzS1bm3NZa+O/kn6eBJihEkueboQolM1uGn+g==
X-Received: by 2002:a9d:75ce:0:b0:6b4:77ed:e981 with SMTP id
 c14-20020a9d75ce000000b006b477ede981mr2185765otl.6.1688111201471; 
 Fri, 30 Jun 2023 00:46:41 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 n19-20020a9d64d3000000b006b58616daa1sm6304161otl.2.2023.06.30.00.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jun 2023 00:46:41 -0700 (PDT)
Message-ID: <20394a80-57d5-7fa1-6320-8f087d4ebe69@ventanamicro.com>
Date: Fri, 30 Jun 2023 04:46:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 02/20] hw/riscv/virt.c: skip 'mmu-type' FDT if satp
 mode not set
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org
References: <20230628213033.170315-1-dbarboza@ventanamicro.com>
 <20230628213033.170315-3-dbarboza@ventanamicro.com>
 <9821ba97-5028-bcdf-10f8-b6e1b2fd813d@tls.msk.ru>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <9821ba97-5028-bcdf-10f8-b6e1b2fd813d@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
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



On 6/30/23 04:36, Michael Tokarev wrote:
> 29.06.2023 00:30, Daniel Henrique Barboza wrote:
>> The absence of a satp mode in riscv_host_cpu_init() is causing the
>> following error:
>>
>> $ sudo ./qemu/build/qemu-system-riscv64  -machine virt,accel=kvm \
>>      -m 2G -smp 1  -nographic -snapshot \
>>      -kernel ./guest_imgs/Image \
>>      -initrd ./guest_imgs/rootfs_kvm_riscv64.img \
>>      -append "earlycon=sbi root=/dev/ram rw" \
>>      -cpu host
>> **
>> ERROR:../target/riscv/cpu.c:320:satp_mode_str: code should not be
>> reached
>> Bail out! ERROR:../target/riscv/cpu.c:320:satp_mode_str: code should
>> not be reached
>> Aborted
> 
> Hi!
> 
> Not a review/comment for the change itself, but a question about your
> work environment.
> 
> Why do you run qemu with sudo?  Is it just because your user lacks access
> to /dev/kvm device node (which is fixed by adding it to kvm group) ?

Yes, it's because of /dev/kvm device access. These KVM tests were done in
an emulated environment that don't have UAC properly set.

> 
> I find it a bit worrying to see people run development as root and the
> recipes to run it as root ens up in even in commit messages.  I think
> it's not good practice to do it like this, but more important is to
> teach users to do it this way. And this is more serious than one might
> think.

Just removed all 'sudo' references from commit msgs for the next version.


Daniel

> 
> Thanks,
> 
> /mjt

