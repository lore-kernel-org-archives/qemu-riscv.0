Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176E6C61D92
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 12:55:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5QHf-0006kH-JQ; Tue, 21 Nov 2023 07:55:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r5QHe-0006jj-B1
 for qemu-riscv@nongnu.org; Tue, 21 Nov 2023 07:55:18 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r5QHb-0004PT-9U
 for qemu-riscv@nongnu.org; Tue, 21 Nov 2023 07:55:18 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-27ff83feb29so4758242a91.3
 for <qemu-riscv@nongnu.org>; Tue, 21 Nov 2023 04:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700571314; x=1701176114; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a+VFY9n6L1rNfogGRXqT4uK3iW80vJ4m0prIcuKT1uw=;
 b=AknBubc0PFMM6o8Be+JGHPsoNq8LMp82nN/Z/08BJbP8Cxi0E9AF7MB61DtMlotySI
 g4pwL69/IcJye1PMKYYbdxbp33+vyXDGW8p3c3L5zA0SADZc/YRtCSg0N55PgZ6l/6OP
 PkDjtpiZWadDs2qvk+QHdqBSvOv+je5IC1TLanzm8SE0xKybhyHOJJ5ecjaapU8DpTMX
 qIprb2yKDsj8kqzn1fOErtsVp6v6gROnVN+Dwr0JAfmMBk2CeR0OLdqeiX9o+/QMF+Hj
 RJtT+5HFAlBAXg99MelFBiZ79A8jL1PNuT2Cb2Eu/wk+1wo6hJ6Al/BQGiQO7CRkfXcP
 ms5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700571314; x=1701176114;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a+VFY9n6L1rNfogGRXqT4uK3iW80vJ4m0prIcuKT1uw=;
 b=Re2ueMuNxizQtX2+6IuOf7Rj/Sn8rLI6SV3ryM4EZdUH1CVUwl55B9u7VY9ndjvm6t
 UekUuqLtWF6EtO877pC5x20tmAPIxJKrvcG74Pm/X1RLXaEjTJ+E5Kde3a1h6pqlgeHd
 RE8hALmNxN7a1ObvkcrhFyefehFbwAPF6jjoGQEUePDQJoKsBBDy8vMyYaukmjCKzZaZ
 MKLA6/U3ujeGN0NZPOq44oQDZ6PgPp7ftZQuNDqE24GkmUmRNHIhtdq9/H0mUQcbwhoE
 t3Uabij/nYR6UJ7rEBeQpmRrlaIDKYvYyCRUUHCHmhlpTs8HCpWcR3Ac/SQdeYWznIIB
 HSOQ==
X-Gm-Message-State: AOJu0YwJW1PAkHQeIbtlGWOjWLyKcfJsx8Oj5fqoHkdEP9rVR6tizsWw
 aRraqLCQKZFMa7QinfGSqurMhw==
X-Google-Smtp-Source: AGHT+IF1NIoZfqWb3lYNuIVSRnq/LdfZWuSHDHgFgvL7CMVA5YH3wJv91iXO/SpeSfViXgV+t5ixwQ==
X-Received: by 2002:a17:90b:3a86:b0:27c:fc2a:a178 with SMTP id
 om6-20020a17090b3a8600b0027cfc2aa178mr12118205pjb.9.1700571313872; 
 Tue, 21 Nov 2023 04:55:13 -0800 (PST)
Received: from [192.168.68.109] ([152.250.131.119])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a17090aa38a00b0028328057c67sm7027577pjp.45.2023.11.21.04.55.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 04:55:13 -0800 (PST)
Message-ID: <96f2695c-2950-45db-ae21-44b0d5558ee2@ventanamicro.com>
Date: Tue, 21 Nov 2023 09:55:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] target/riscv/cpu_helper.c: Fix mxr bit behavior
Content-Language: en-US
To: Ivan Klokov <ivan.klokov@syntacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com
References: <20231121071757.7178-1-ivan.klokov@syntacore.com>
 <20231121071757.7178-3-ivan.klokov@syntacore.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231121071757.7178-3-ivan.klokov@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102c.google.com
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



On 11/21/23 04:17, Ivan Klokov wrote:
> According to RISCV Specification sect 9.5 on two stage translation when
> V=1 the vsstatus(mstatus in QEMU's terms) field MXR, which makes
> execute-only pages readable, only overrides VS-stage page protection.
> Setting MXR at HS-level(mstatus_hs), however, overrides both VS-stage
> and G-stage execute-only permissions.
> 
> The hypervisor extension changes the behavior of MXR\MPV\MPRV bits.
> Due to RISCV Specification sect. 9.4.1 when MPRV=1, explicit memory
> accesses are translated and protected, and endianness is applied, as
> though the current virtualization mode were set to MPV and the current
> nominal privilege mode were set to MPP. vsstatus.MXR makes readable
> those pages marked executable at the VS translation stage.
> 
> Fixes: 36a18664ba ("target/riscv: Implement second stage MMU")
> 
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu_helper.c | 24 ++++++++++++++++++++----
>   1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9ff0952e46..e7e23b34f4 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1032,13 +1032,29 @@ restart:
>           prot |= PAGE_WRITE;
>       }
>       if (pte & PTE_X) {
> -        bool mxr;
> +        bool mxr = false;
>   
> -        if (first_stage == true) {
> +        /*
> +         * Use mstatus for first stage or for the second stage without
> +         * virt_enabled (MPRV+MPV)
> +         */
> +        if (first_stage || !env->virt_enabled) {
>               mxr = get_field(env->mstatus, MSTATUS_MXR);
> -        } else {
> -            mxr = get_field(env->vsstatus, MSTATUS_MXR);
>           }
> +
> +        /* MPRV+MPV case, check VSSTATUS */
> +        if (first_stage && two_stage && !env->virt_enabled) {
> +            mxr |= get_field(env->vsstatus, MSTATUS_MXR);
> +        }
> +
> +        /*
> +         * Setting MXR at HS-level overrides both VS-stage and G-stage
> +         * execute-only permissions
> +         */
> +        if (env->virt_enabled) {
> +            mxr |= get_field(env->mstatus_hs, MSTATUS_MXR);
> +        }
> +
>           if (mxr) {
>               prot |= PAGE_READ;
>           }

