Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29023C35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 20:56:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFKeG-0000s9-Ln; Mon, 18 Dec 2023 15:55:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFKeB-0000q3-V8
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 15:55:32 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFKe9-0003y1-HB
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 15:55:31 -0500
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-5cda3e35b26so704262a12.1
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 12:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702932913; x=1703537713; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qqGEFjsjfCaCTYZIR8UFcCe8X+bdKtw032QcRfWvd7U=;
 b=EStDxgB/YkLyVVXj+tDqvQO3Dkyzi/QhxGBp/Rute5mynVqK3XHwodTOLu1qyMaXOD
 eCE0Es4CrDMGaZKrXk4pHgUXpDWc7NUVS1ENvGaYS6Y7CJ0Ys6z0lp78yRhZEfVtKJeY
 Tnjos2tZQmi/guVaGJ2NTMgJpqwODfGGByLM4WQ/2RfdZ+Dpq8a0VR2PznoukbCq18FH
 LXbqy1DZyGK0rqnLAVXLDGzPzUPtv4a8vRsZkIeUSAMq1m/fyMMpbgQ47dta1qHRlUKd
 BlNkWYycWPRP0tvMGWGsxZB6u5XV9Dt4vSy5i7dwB+bJUQMaqnAOmgyLGFsX4dBaCx4p
 V2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702932913; x=1703537713;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qqGEFjsjfCaCTYZIR8UFcCe8X+bdKtw032QcRfWvd7U=;
 b=iEEE5ZtjLtoJeuDioBCqFn/xB38VQ0kz6MVWpyf6TqHUXzBoSZJUkZhcUJooQoNeSe
 hPksKvT/KfwVAYcjzPhbf35Wum/lfryzFIzZum5J87vylxxY5xDb34YpMxgZgWRFNuZZ
 ES+u5xHer4fN0SFEClazXzW4w5Mmx7/jiojtkzaBL8ODD36NjUj3+sO+oEsg1IFDio12
 0PMBkfDBKYAszFm6bZWdnGbp9OmLdP1iDyBOXXT8C5z93yc0T4xGb7h96+3d43mYi4+o
 uQEJZSDGZRTaT7bXEYOGa4kMPtAyNso1WFxAyUpL8XGFQyWQPlVOSiLjMzU8Ev7P81aE
 01mg==
X-Gm-Message-State: AOJu0YwMqX5ba6r8fj46wfAPfjbTZBL5YG2DwsJORLPvZXmBk5nHF9rQ
 UggtQ7T6146CwRkXMukAa3AKXg==
X-Google-Smtp-Source: AGHT+IG6fgQQTVk72n9ibIMivQxw+zd3GKY7kgTWyVrLh8WXou20LaH/3XDirG9DmnUjEtqMxGQGGA==
X-Received: by 2002:a05:6a21:7888:b0:194:7c1a:323e with SMTP id
 bf8-20020a056a21788800b001947c1a323emr1185077pzc.37.1702932912689; 
 Mon, 18 Dec 2023 12:55:12 -0800 (PST)
Received: from [192.168.68.110] ([179.93.21.205])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a056a0010cc00b006ce61c9495fsm18600372pfu.206.2023.12.18.12.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 12:55:12 -0800 (PST)
Message-ID: <15709fcb-79d5-4d96-a568-f4d1943b6290@ventanamicro.com>
Date: Mon, 18 Dec 2023 17:55:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv/kvm: do not use non-portable
 strerrorname_np()
Content-Language: en-US
To: Natanael Copa <ncopa@alpinelinux.org>, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, qemu-trivial@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20231218162301.14817-1-ncopa@alpinelinux.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231218162301.14817-1-ncopa@alpinelinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52b.google.com
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



On 12/18/23 13:22, Natanael Copa wrote:
> strerrorname_np is non-portable and breaks building with musl libc.
> 
> Use strerror(errno) instead, like we do other places.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: commit 082e9e4a58ba (target/riscv/kvm: improve 'init_multiext_cfg' error msg)
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2041
> Buglink: https://gitlab.alpinelinux.org/alpine/aports/-/issues/15541
> Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
> ---

Apart from my 'aesthetic preference' of using "error code %d" instead of
strerror(errno), which I stand by, this patch is fixing a build break
and it's an improvement from what we have now. Aesthetics can be dealt
with later.


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>




>   target/riscv/kvm/kvm-cpu.c | 18 ++++++++----------
>   1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 45b6cf1cfa..117e33cf90 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -832,9 +832,8 @@ static void kvm_riscv_read_multiext_legacy(RISCVCPU *cpu,
>                   multi_ext_cfg->supported = false;
>                   val = false;
>               } else {
> -                error_report("Unable to read ISA_EXT KVM register %s, "
> -                             "error code: %s", multi_ext_cfg->name,
> -                             strerrorname_np(errno));
> +                error_report("Unable to read ISA_EXT KVM register %s: %s",
> +                             multi_ext_cfg->name, strerror(errno));
>                   exit(EXIT_FAILURE);
>               }
>           } else {
> @@ -895,8 +894,8 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
>            *
>            * Error out if we get any other errno.
>            */
> -        error_report("Error when accessing get-reg-list, code: %s",
> -                     strerrorname_np(errno));
> +        error_report("Error when accessing get-reg-list: %s",
> +                     strerror(errno));
>           exit(EXIT_FAILURE);
>       }
>   
> @@ -905,8 +904,8 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
>       reglist->n = rl_struct.n;
>       ret = ioctl(kvmcpu->cpufd, KVM_GET_REG_LIST, reglist);
>       if (ret) {
> -        error_report("Error when reading KVM_GET_REG_LIST, code %s ",
> -                     strerrorname_np(errno));
> +        error_report("Error when reading KVM_GET_REG_LIST: %s",
> +                     strerror(errno));
>           exit(EXIT_FAILURE);
>       }
>   
> @@ -927,9 +926,8 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
>           reg.addr = (uint64_t)&val;
>           ret = ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
>           if (ret != 0) {
> -            error_report("Unable to read ISA_EXT KVM register %s, "
> -                         "error code: %s", multi_ext_cfg->name,
> -                         strerrorname_np(errno));
> +            error_report("Unable to read ISA_EXT KVM register %s: %s",
> +                         multi_ext_cfg->name, strerror(errno));
>               exit(EXIT_FAILURE);
>           }
>   

