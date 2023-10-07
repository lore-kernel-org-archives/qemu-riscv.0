Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEC3E95A60
	for <qemu-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 12:08:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qp66Y-00054T-At; Sat, 07 Oct 2023 08:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qp66T-0004uA-E0
 for qemu-riscv@nongnu.org; Sat, 07 Oct 2023 08:08:17 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qp66R-0004l6-HK
 for qemu-riscv@nongnu.org; Sat, 07 Oct 2023 08:08:17 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c77449a6daso25982095ad.0
 for <qemu-riscv@nongnu.org>; Sat, 07 Oct 2023 05:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1696680494; x=1697285294; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JAmbIQwcH9HLmVeduHvcJCUylx4zP99ezMrphN+yjDU=;
 b=j2VdRfVbTz2k8zgJPj2qH/j5yQXNT7uvsM2W1j0k4J6A+XlT88zVOu2fMSbLQgKqfq
 U7KjmznKSxPNV0kQT2MTJIbpZvMgvmNWNNQtiYMqq0S+eb65M3E8IP9cqbDyDXBGexyk
 csy3WYtlsN7lP80O+IOk/aIprLNE3dxvHbB2OfXryZbt3avcvy3gEc7zIEih7lwzv/2z
 sgTkA5hgoJmLwjVoqa4GoZVFsYSaQgWSan72TiPWaW1oqqCNyV8tvMQIqkhTmisYAuSe
 trCirlvrThtl0O+tTg+WEI1gdw14nISUXTL6l/eorkh+LUMp0y9AC2hmN/YFsCxCBQfG
 /Kjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696680494; x=1697285294;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JAmbIQwcH9HLmVeduHvcJCUylx4zP99ezMrphN+yjDU=;
 b=vwBRgEyHADYn10GnAYrcKPkOGHmCIK4nixtn5ppYhHa6twf4m6tBLAzOc25x63u1ZW
 6XW0BDEse/8V5Nux79Ixe7DMzre58BBaOlARdlhOqkHzb40VWNYanj6MC6p596Besg25
 /tr+LGi3WDxUgzc/6os8IAaahFMY57hWiC4oQ49a6xI0u6VaNeSMSYRwQKW1PBHIn58F
 aMInXspp4iEroMqVocksdUAxik5C6131gOLgfIHRlMyPkxMRbk4Y8msa6wCvU+nPgp96
 imHKLxvGM4ThvkWzisj5eqtYIPnl3Qtybn0mAz18Aev5CHfrsjptY4p76AR3VveLQDEL
 fYeA==
X-Gm-Message-State: AOJu0YwR9rhHwi4aq4Hedm8oxf4bU4pXunrfeQSGyw0VCrBetBJiitb7
 SJNsfsoW56JBJMwBBbpYRM76gQ==
X-Google-Smtp-Source: AGHT+IEXovl5lGaUqqDhwFSClsH4W5JV2RSHuDNttvZC0RFXfOmywo8hzisrhL+Ev1h0l4b4bjRHAg==
X-Received: by 2002:a17:902:e885:b0:1b0:f8:9b2d with SMTP id
 w5-20020a170902e88500b001b000f89b2dmr13584681plg.29.1696680493593; 
 Sat, 07 Oct 2023 05:08:13 -0700 (PDT)
Received: from [192.168.68.107] ([177.94.42.196])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a170902e88900b001bf11cf2e21sm5673419plg.210.2023.10.07.05.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Oct 2023 05:08:13 -0700 (PDT)
Message-ID: <893138bf-af9f-b216-b230-960903c9013c@ventanamicro.com>
Date: Sat, 7 Oct 2023 09:08:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] target/riscv: Use a direct cast for better performance
To: "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 pbonzini@redhat.com
References: <20231007090232.3329594-1-rjones@redhat.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231007090232.3329594-1-rjones@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.644,
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



On 10/7/23 06:02, Richard W.M. Jones wrote:
> RISCV_CPU(cs) uses a checked cast.  When QOM cast debugging is enabled
> this adds about 5% total overhead when emulating RV64 on x86-64 host.
> 
> Using a RISC-V guest with 16 vCPUs, 16 GB of guest RAM, virtio-blk
> disk.  The guest has a copy of the qemu source tree.  The test
> involves compiling the qemu source tree with 'make clean; time make -j16'.
> 
> Before making this change the compile step took 449 & 447 seconds over
> two consecutive runs.
> 
> After making this change, 428 & 422 seconds.
> 
> The saving is about 5%.
> 
> Thanks: Paolo Bonzini
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   target/riscv/cpu_helper.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 3a02079290..6174d99fb2 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -66,7 +66,11 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
>                             uint64_t *cs_base, uint32_t *pflags)
>   {
>       CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> +    /*
> +     * Using the checked cast RISCV_CPU(cs) imposes ~ 5% overhead when
> +     * qemu cast debugging is enabled, so use a direct cast instead.
> +     */
> +    RISCVCPU *cpu = (RISCVCPU *)cs;
>       RISCVExtStatus fs, vs;
>       uint32_t flags = 0;
>   

