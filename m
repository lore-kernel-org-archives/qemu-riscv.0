Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F48AC3ABDD
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 May 2025 11:34:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uHLE6-0004aI-Qb; Tue, 20 May 2025 07:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uHLE2-0004MT-Sb
 for qemu-riscv@nongnu.org; Tue, 20 May 2025 07:33:39 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uHLDx-0001Zc-TL
 for qemu-riscv@nongnu.org; Tue, 20 May 2025 07:33:38 -0400
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-4e2adabc828so313333137.0
 for <qemu-riscv@nongnu.org>; Tue, 20 May 2025 04:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1747740811; x=1748345611; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fd11ekkjfrXxaFZeIFljZm4Y2T2aMORytHgpIUVaYtE=;
 b=PAZqzQyUdGyeNlw/dv1SvESTfZGOwBjFtXKhgrV7xEj2sSUCDJ3wWXbohXUi9Btqte
 NVduAV21i3C0VJo83qwSIKKz4bGUFTeD7G+hb33EeJ8LpEReZM9tMr8Ez/EOUXvtfaFr
 mo5JZYY88EdFjPNQNB5qbp8m/nOUabWVWlfpcJFRFphakS78XA9cXKStw27ifPcwWAqm
 zNoxTu6fRe/V2F/v5ixjwmFm34MwRTuHlds7yGc1drwSuB/TVFwz0kXl5cYYDjqNmbdt
 Xd8bgQxdgfLrDTosgOeBtw0wRGyQO6T1pI2GICZR+nvfkFgpCB7Dobke422TbxxqWjKS
 ekZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747740811; x=1748345611;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fd11ekkjfrXxaFZeIFljZm4Y2T2aMORytHgpIUVaYtE=;
 b=WNIzsJK8QzsCnt9U80wmAXDmMXDuqOkBSInnLL23rePWc2PsSC7yJJXnteyJTuuby0
 MmYCg+Y9QyJN0GuYwn/Ge5MUxv9b9SmmpXGWobc3QlOSVtroX0kMumBouANwh3HTPMln
 rEQpZ4Hn1FT+Iqe1E/2383P1HkAsxt1qwSqvZKiYwgCo9o1NDXcUMbQ9JQNK8z77O09M
 QR37XwggEvtpgSSSYJW9oVUaTiyKSla9aMAKvUcabxBb4Y6yCq4wcR7EWyAg/CjKNLiO
 7dOHcuCJuLuhEYZejh+flq6UB/kRUhQeoD7hHyvBjRH65y7wnERZRJ5GD8rh85anqQt2
 439w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWg1M14x0FQGuVkhjfMB13Ey4M4KZ865a5yHW10Un5sdK2eLWacmgDkcLBE39kj+bTx9I2RO+ZHbpb9@nongnu.org
X-Gm-Message-State: AOJu0Yx66kZgGsn4QS1wsmzHnnWQTyi8XCMs1XtzapZhOntIfRgA/T+y
 2eu3TbQuOL65sfEsRgrs98N4raie5T1O9lcoj32chLTQMLFNsVEbqPDjQzXtf+vL/lw=
X-Gm-Gg: ASbGncuzQ/hkaHpNM1MMTyTnF44pkB2I+W/Q4VHHjlEbTYOrdzj26gXojCtwGQeoW7c
 4QYbIJ665rlQjM0l6orFytkQrHbDMxFHJes4mqs5xgsIrzUYLXsyiFrT+hK5h1UvURkuxo2Qn1l
 G9ICz/BmMmpgt4BhRePx1t3pRIKeNsMBL604yyAtAbuSMKgWc1ZI3SjdxZ2hf3LrPsvnfhg56zX
 AkVlaDRwpQ+xIIiz+/dpql+Hj1xDvZtwoYfSLBgj7lmP4JszwlhKsTXsvALriIcBZy0r5/L17uL
 nGCY8miyDNYaEi23HScWpxpdlQDZWHMxLLqeVgX0k6OfQI45BRoWaLR8bWFbUPjx9VU=
X-Google-Smtp-Source: AGHT+IE4cyaVzNZQkoqtLnvsO1d0uHL9lkIAVf7qnHlpSO7pZuqBq6M3D7NYMTEB8ms2oKjRocXe+w==
X-Received: by 2002:a67:ef84:0:b0:4e1:449b:1b78 with SMTP id
 ada2fe7eead31-4e1449b1d4amr8509104137.9.1747740811440; 
 Tue, 20 May 2025 04:33:31 -0700 (PDT)
Received: from [192.168.68.110] ([152.250.131.100])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-87bec10c9f0sm7276125241.1.2025.05.20.04.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 04:33:31 -0700 (PDT)
Message-ID: <1e170923-9bb3-4327-a6ff-75c53bb2830f@ventanamicro.com>
Date: Tue, 20 May 2025 08:33:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] target: riscv: Fix satp mode initialization based on
 profile
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20250516122319.4100121-1-alexghiti@rivosinc.com>
 <87y0usiz22.fsf@all.your.base.are.belong.to.us>
 <51356014-b645-4e86-b338-0d097bf80260@redhat.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <51356014-b645-4e86-b338-0d097bf80260@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-vs1-xe33.google.com
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



On 5/20/25 7:53 AM, Paolo Bonzini wrote:
> On 5/19/25 14:07, Björn Töpel wrote:
>> When realizing the cpus, the first cpu calls riscv_cpu_add_profiles()
>> all profiles are disabled, whereas for the other cpu calls to
>> riscv_cpu_add_profiles() have some profiles enabled. Having some
>> profiles enabled, will issue a call to cpu_set_profile() that will
>> enforce the satp code that Alex removes in this patch.
> Ah so the problem is that *parent* profiles are not enabled until
> riscv_cpu_add_profiles().

The problem in Björn's case is that we shouldn't take the profile code path
for any CPUs since he's not enabling any profiles. There's a bug in how we're
detecting a profile presence for QMP for CPU0 and how this detection is changing
the cpu_init of CPU1 and above. I'll send a fix for it today.

> 
> With my patches to introduce RISCVCPUDef, it's a pretty easy fix:
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 629ac37501e..04b929af41c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1083,6 +1083,19 @@ static bool riscv_cpu_is_dynamic(Object *cpu_obj)
>       return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
>   }
> 
> +static void riscv_cpu_enable_profile(RISCVCPU *cpu,
> +                                     RISCVCPUProfile *profile)
> +{
> +    profile->enabled = true;
> +
> +    if (profile->u_parent) {
> +        riscv_cpu_enable_profile(cpu, profile->u_parent);
> +    }
> +    if (profile->s_parent) {
> +        riscv_cpu_enable_profile(cpu, profile->s_parent);
> +    }
> +}
> +
>   static void riscv_cpu_init(Object *obj)
>   {
>       RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(obj);
> @@ -1121,7 +1134,7 @@ static void riscv_cpu_init(Object *obj)
>       cpu->cfg.max_satp_mode = -1;
> 
>       if (mcc->def->profile) {
> -        mcc->def->profile->enabled = true;
> +        riscv_cpu_enable_profile(cpu, mcc->def->profile);
>       }
> 
>       env->misa_ext_mask = env->misa_ext = mcc->def->misa_ext;
> 
> Since they're all reviewed and Alistair has flushed his queue, I'll
> send them in my next pull request.
> 
> On top of them, probably profiles should also be converted to use
> RISCVCPUCfg and riscv_cpu_enable_profile() can then enable all the
> flags with riscv_cpu_cfg_merge().
> 

If we can do the same thing with less abstractions than what we're using
ATM I'll all for it.

> In general a lot (if not all) of the profile code should be moved out
> of tcg-cpu.c and into riscv_cpu_class_base_init().  I didn't do that
> because I didn't want to balloon an already-large series, but it's a
> pretty obvious extension of the RISCVCPUDef concept to include all
> profile features.

Note that KVM RISC-V does not have the same profile support as TCG - I'm not
sure if KVM RISC-V has RVA22 support, let alone RVA23. If we move the profile
logic to cpu.c we need to be careful with TCG assumptions affecting KVM CPUs.


Thanks,


Daniel

> 
> Paolo
> 


