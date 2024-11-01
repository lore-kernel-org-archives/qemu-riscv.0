Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F9FE6F072
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 17:36:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t6vYu-0000IY-IJ; Fri, 01 Nov 2024 13:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t6vYr-0000Hd-PH
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2024 13:35:50 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t6vYq-0000r7-B3
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2024 13:35:49 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-71e5130832aso1778592b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 01 Nov 2024 10:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1730482546; x=1731087346; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6YQgS2hpBgZ5ghGtSY895dOQSRXnBOOFFhhl2VnynL8=;
 b=H/TOz9s2DVdCqmCPm3fDRlEinrVTUngoO/1uvxkF3qyJLXIn4kBz0xiviXszmEgHxA
 qK3sq5DZEfp3W/Ag/dBG2/w8Tc19dDSql2tYnOa7w/SMikzrkhTWiDD4b7Anb9kSt+Gs
 Pdkz1+OvjPXXSDWK2Ey7In6NWnizXdMUmqh7vPbgsO4g1Ob7gdq4ta96O4zeTS7I8peH
 qpaCEAoBpA9VRc2DMFurp0CnTXMRLtBirtZ6lYq974hTLxoow/bfD67aTGZQX+kqx8ci
 r8XAxnki7wkHYo6kn4SPirg/8mGl+e160D8aFnCAIgbtQSA/d94PIMz5PJpU4lgm4+Zi
 jIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730482546; x=1731087346;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6YQgS2hpBgZ5ghGtSY895dOQSRXnBOOFFhhl2VnynL8=;
 b=k//WIgUFExSTg6Dv5TxRZG9m2zlVmErxCn+o6H0EOKIYawIYYbyv6Pxi/MDhVixKOq
 23gy6MLH30rYBIH9MDH8Lkaquc0Ut7MKNCQ5oEKlQ91QPo1MSD6RxSgLKFzcJw+wG7el
 Fam4HKJGQwP25rCUIkq5Tf4jPd7cMf8WVvNvnyV+RoDYDZaOuFQx7KsWtEDW2ZzaWGiz
 6Ad7p0G7CwSKS0BBCTPZJPJXcnGGATCHd9XsOlkoEleVIEyW1wDhjRVWoQT/qMaxKkyX
 DKzPR9JOw9YtXkY7b4THaAQBMuTX0nzcpJf0JOdbCT2nHWGBMwCtB6gPG1aMYkCF0XsJ
 jQoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoh8uFiyA3MAN/Z0hwnlZCG/f7gluJcsvDMcAQt+h/GPP4TPJqNbdhCSwvhOyG/QjvLVHx+gMYfVm/@nongnu.org
X-Gm-Message-State: AOJu0YwP/ttgxddQdzXxxk6Q2aRoRz3sykR2U9puYgEnxNr/51bmf1pD
 WbrkYR/UUkF1aqh3xgu+UMguHCvYfUyCUmWZ/tC3wfQHXY/NJ9C4QxkhLHbfLOU=
X-Google-Smtp-Source: AGHT+IELvEhUGxN2DyqiJrfWAiRULu6kPLHSQ3UCZnMCGCUHRFiKsdd2k104fIYcMfKGmMuYVw/TNg==
X-Received: by 2002:a05:6a21:3a43:b0:1d8:ae07:bf8 with SMTP id
 adf61e73a8af0-1dba54a496dmr4690461637.31.1730482546557; 
 Fri, 01 Nov 2024 10:35:46 -0700 (PDT)
Received: from [192.168.68.110] ([191.8.109.222])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7ee45a0de9csm2677061a12.78.2024.11.01.10.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Nov 2024 10:35:46 -0700 (PDT)
Message-ID: <2e1af830-a90a-447f-ab47-1c3d49463134@ventanamicro.com>
Date: Fri, 1 Nov 2024 14:35:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/riscv: fix build error with clang
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-riscv@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, John Snow <jsnow@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20241101170833.1074954-1-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20241101170833.1074954-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42b.google.com
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



On 11/1/24 2:08 PM, Pierrick Bouvier wrote:
> Introduced in 0c54ac, "hw/riscv: add RISC-V IOMMU base emulation"
> 
> ../hw/riscv/riscv-iommu.c:187:17: error: redefinition of '_pext_u64'
> 
>    187 | static uint64_t _pext_u64(uint64_t val, uint64_t ext)
> 
>        |                 ^
> 
> D:/a/_temp/msys64/clang64/lib/clang/18/include/bmi2intrin.h:217:1: note: previous definition is here
> 
>    217 | _pext_u64(unsigned long long __X, unsigned long long __Y)
> 
>        | ^
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   hw/riscv/riscv-iommu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index feb650549ac..f738570bac2 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -184,7 +184,7 @@ static void riscv_iommu_pri(RISCVIOMMUState *s,
>   }
>   
>   /* Portable implementation of pext_u64, bit-mask extraction. */
> -static uint64_t _pext_u64(uint64_t val, uint64_t ext)
> +static uint64_t pext_u64(uint64_t val, uint64_t ext)

I suggest name it 'riscv_iommu_pext_u64' to be clear that this is a local scope function,
not to be mistaken with anything available in clang or any other compiler.


Thanks,

Daniel

>   {
>       uint64_t ret = 0;
>       uint64_t rot = 1;
> @@ -528,7 +528,7 @@ static MemTxResult riscv_iommu_msi_write(RISCVIOMMUState *s,
>       int cause;
>   
>       /* Interrupt File Number */
> -    intn = _pext_u64(PPN_DOWN(gpa), ctx->msi_addr_mask);
> +    intn = pext_u64(PPN_DOWN(gpa), ctx->msi_addr_mask);
>       if (intn >= 256) {
>           /* Interrupt file number out of range */
>           res = MEMTX_ACCESS_ERROR;

