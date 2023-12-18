Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C00C35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 17:21:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFHIl-0005dO-0T; Mon, 18 Dec 2023 12:21:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFHIj-0005d0-Dm
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 12:21:09 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFHIf-00010M-Cs
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 12:21:08 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-28b436f6cb9so2456270a91.3
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 09:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702920063; x=1703524863; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bXp0y4nTRDTF1Rytxffg+UKgXXpQViZsl72rZKNyEvs=;
 b=Bkdb6suiCqry7IM3adryZ2GZoQLm06qjjvum2lO4BbJkDJaQRvk/nkuOAsrPqKbCsh
 JfuVUFMITbCr3u9rcwfQD8DGge+C1EsxWk2fTinGkg3L+pL5+3Hg5QyTc0++saE08x6h
 njRHjBMgBk/Nff7XdVjLJkqRS5qSoDyKxhrb5+vsEXv/4IyKMi6RoSyOxnY/iDpCVNFb
 vLPrWMpxKq0Ol2hXCztcBnuNfDtaWPQmCMEQMMQ4GwIrMcqC97obgJRp7xtPP9NsVwrK
 d/H6PLUdo77NBg/xvS7A19qANxTU3EylYtAplsxHfNIhAx+kgaf10ea+IQOWRBtxHHhP
 yZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702920063; x=1703524863;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bXp0y4nTRDTF1Rytxffg+UKgXXpQViZsl72rZKNyEvs=;
 b=IABuObspSnXyDdIoPh2TQCvp7Q4evuwVnBfiir63c4fZxLKt4EhG1xmsqc6zGrdoS9
 /i3esbfdFFY9BXwNVN0TPx50rpmsXk0bpxifaCsiAcyqrhXf+Cvdf+E3q0f8Y3n37+mK
 CaH9OtSVdCubdDcFeNMkU6rZEFiWwC+WNVmKUfqjSM6VtdVkSReAuegmmSOMQ/hnqwnr
 AbpO1my3wmmk2+wVyOCKtfd7dTgXgrXtAyPnDBXLHd37YHBQ2Gf03AmqwADu5XeZor9j
 I+XQKADKjpkd6BlBTJc9YAj+TCR+hqA3/13yvScSgRUZguNQ39P7trtXTjYtlHyWr4WU
 Qptw==
X-Gm-Message-State: AOJu0YwOmr6eWpvOvqtLpEjC2fR0EXAN9DgLLELeN3XD4Dli9uQ7ULG+
 vBc2p65l588i2AqtBgGBQLE/FQ==
X-Google-Smtp-Source: AGHT+IEL+5ii6MgitmiKcHrupCaQDDsNDUPg09uaXs7CbM+k34MSYpu56iCVL/pu5MOufHQwhMJZiA==
X-Received: by 2002:a17:90b:2405:b0:28b:83a8:f9c3 with SMTP id
 nr5-20020a17090b240500b0028b83a8f9c3mr1327849pjb.12.1702920062742; 
 Mon, 18 Dec 2023 09:21:02 -0800 (PST)
Received: from [192.168.68.110] ([179.93.21.205])
 by smtp.gmail.com with ESMTPSA id
 gz4-20020a17090b0ec400b0028ae8a31664sm1881329pjb.35.2023.12.18.09.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 09:21:02 -0800 (PST)
Message-ID: <dfb9bf4e-820a-4e7e-b62b-8df952099e7a@ventanamicro.com>
Date: Mon, 18 Dec 2023 14:20:54 -0300
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1030.google.com
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


The reason I did this change, as described in 082e9e4a58ba mentioned in the commit
message, was precisely to avoid things like this:

qemu-system-riscv64: Unable to read ISA_EXT KVM register ssaia, error: no such file or directory
  
The generic description of the error works well with file descriptors and so on but it's
weird in the KVM context. This patch is re-introducing it.

If strerrorname_np() is non-portable I believe we're better off dealing with the numeric
errno than with its generic description. I.e:


> +                error_report("Unable to read ISA_EXT KVM register %s, error %d",
> +                             multi_ext_cfg->name, errno);


Same with the other 3 instances you changed in the patch. Thanks,


Daniel



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

