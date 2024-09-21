Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0B4CF9C5B
	for <qemu-riscv@archiver.kernel.org>; Sat, 21 Sep 2024 12:20:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1srz5r-0006t6-3f; Sat, 21 Sep 2024 08:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1srz5p-0006oU-DK
 for qemu-riscv@nongnu.org; Sat, 21 Sep 2024 08:20:05 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1srz5n-0000Rj-Sm
 for qemu-riscv@nongnu.org; Sat, 21 Sep 2024 08:20:05 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-718e3c98b5aso2094831b3a.0
 for <qemu-riscv@nongnu.org>; Sat, 21 Sep 2024 05:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1726921201; x=1727526001; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jx6sKFQbz7B8nwqR+KkmLdI2wA3L39Eelwedwf9gOxc=;
 b=ZOk6A5z44wA4zFASDm3wS1lGNtFHRwWYVQwIP44f1e6u267bjTjO+AJBkvUQAB7LWm
 xL47YC3ozpy65QYDpVhtoKNOp63TtnnVMkxT2fs76B0lzCPu5UjHc7SwuxxRtKoWBRxy
 BvcmVd1vjDAivGbuMZDKhrg/RdZbTUDPhenLtsV2IXQabnSCvahLjAybv5O3TLoOF+h0
 zQL7PNAOHFD7n5AU4JN49Tdk+Cp9NUmghNQtQXzL43HoFb2dzPtYFkZS5e5PWbMW8PRt
 gr8AMqQBEnTyrxgDnM+AFtDT4UzUVeGaoVe2InLKkJscj4E+Ndf4gMWajOpM8Lsa18ah
 yxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726921201; x=1727526001;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jx6sKFQbz7B8nwqR+KkmLdI2wA3L39Eelwedwf9gOxc=;
 b=rJCVLwEKF4T88dEjIIaIPEa+9ce8LmY6+96LaIV8JPPms4MmaQ10YEVqz2sdP0ttKj
 mDQlwf/RwBke29K8bJU3EJ71TK+uhVb3SneLMd67Kddb7lExM0yHIqHb22neATJCu0cM
 h5/KiYXhGO/jbIV9otZ6Ae0TC/cl6bTeoS6i8fRtRhdlcBsFmwp0/8dHCXYeCmPLKPPV
 q46M85PsIU43ojDTrIlmTLHYTAbm86JcXQEi1G7qIqlOvFej2vnW2wXuifw2RoOt5Nf4
 6KuS1s4oMUKfnKCwk5L/VORz2STvz7DAGjkMfWm6cQsp99419FLmS2LomIjmQB9AuYB2
 qNSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmPdp3SJ2UCuMb5Dfn4d+ATKmho6m0IF9TBux5GoulavVYA7GQ1HrM4ORL9lSwsf4CkKY+tscGNEK8@nongnu.org
X-Gm-Message-State: AOJu0Yy04pnrRJ/WVJXJVamY9oVaflEieSg/B3f3rOyZRp4T9yJB8wsG
 Ic2ND+/68WM7yqjex1uSaVxT92LLzxY68G66tUOOOIne9d5nRPsfNaFuJuthsn8=
X-Google-Smtp-Source: AGHT+IHANUV/AsFJMEnPXGcwseUSVx371ay/CGRN9mY3v+Uxq+AJxvPCUrcgy0jmKyqcKuy/gCoUJw==
X-Received: by 2002:a05:6a00:896:b0:718:ebdc:6c81 with SMTP id
 d2e1a72fcca58-7199ce5bc16mr8685644b3a.26.1726921201532; 
 Sat, 21 Sep 2024 05:20:01 -0700 (PDT)
Received: from [192.168.68.110] ([187.101.184.93])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944b81c41sm11194949b3a.126.2024.09.21.05.19.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Sep 2024 05:20:01 -0700 (PDT)
Message-ID: <50783800-d243-4378-b07b-1d422fd27bc1@ventanamicro.com>
Date: Sat, 21 Sep 2024 09:19:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] target/riscv: Add `ext_ssdbltrp` in RISCVCPUConfig.
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Ved Shanbhogue <ved@rivosinc.com>,
 Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
References: <20240912084832.2906991-1-cleger@rivosinc.com>
 <20240912084832.2906991-2-cleger@rivosinc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240912084832.2906991-2-cleger@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 9/12/24 5:48 AM, Clément Léger wrote:
> This variable is used to determine if the Ssdbltrp extension is enabled.
> 
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> ---

I would merge this to patch 2 since the bool is being used there. Thanks,


Daniel

>   target/riscv/cpu_cfg.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index ae2a945b5f..dd804f95d4 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -77,6 +77,7 @@ struct RISCVCPUConfig {
>       bool ext_smstateen;
>       bool ext_sstc;
>       bool ext_smcntrpmf;
> +    bool ext_ssdbltrp;
>       bool ext_svadu;
>       bool ext_svinval;
>       bool ext_svnapot;

