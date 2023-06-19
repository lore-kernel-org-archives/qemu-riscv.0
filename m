Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E030EB64DB
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 10:37:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBCGN-0007G1-W3; Mon, 19 Jun 2023 06:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBCGL-00077q-9M
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 06:37:33 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBCGI-0002vX-AN
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 06:37:32 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-307d20548adso2360377f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 19 Jun 2023 03:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687171048; x=1689763048;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w8GK1KMJaQJvuBkAWkm3y+dVEFR1lc+KCYGc1SEm0J4=;
 b=x9z71/a7upbVhU8RLWzCoAXox8PJ/if86jD0kHCK4dYZfcOAQGyB/1vxzRWRHfwl5T
 y6WhpmZh7Yx0cVggXPrOK4Ynr7nuuZwsJZ8l6mqOgHpnx6K+XE7XxJp9NqWTye/EZvl6
 lZGtrAG8C3iyJzjA6H66cvwSfVSk+ikMWVtLE3c+TGDyFjC1sEG9LGlt4IR0nm+YsYPx
 vcC8fBPcP93erO0ghxsA9rwVRD7BVR4YVbOBDTg6gIL4ajJeU+WUwst37KOXZSdW33rI
 HKMH65C+ra6jNbVPlVFwGJnfp3cTWDpoarejpigTy7vkfh/IJy6QNJxlM7JXvauZTVlB
 7mNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687171048; x=1689763048;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w8GK1KMJaQJvuBkAWkm3y+dVEFR1lc+KCYGc1SEm0J4=;
 b=TN8c9oll6PtE50DmBFqO93UZ5fMmpsok+fedw9cRaGeTtLBUC/mZ4V0P2Hs7+oHAPE
 I+u/X+n9582uUIg7e072onX01+l+9+gEyCXoPPfIj8MbHf65L/11CDK9KCXmwYjuBwPZ
 g3UADRdLrPTFVtiakv/WIDsCr+nK6HRE86/6Y9z50GHxchHZ9ik6AXl8qbzCNd/6Gj4P
 1YrcuVjhEZXbtPEnew4LYykqvQO4q1VEWDKVLFDAc9csHUBFafJY6BX4QFECZHMTQ8Nn
 ucTuHbDLTVC2XRz+0Uss0mDwLq/OIcoetpTy0BBWQ98i9Iw7UjFBzr/6fkM09btmUXwM
 N0IQ==
X-Gm-Message-State: AC+VfDyavinYrR34ZBnE3ZkqcJWLNhOpIAv3ZVFHcZQiyz7PMQ0KP2uk
 x846B3zLPXO/ZyqbDUXganAbXQ==
X-Google-Smtp-Source: ACHHUZ7ZYWuSlo/PMeziJfaLlNlvac1A6ugMkzn031u4YP28MzfdJ73/SivmUrT26mwAiVyvA2ZAGw==
X-Received: by 2002:a5d:5642:0:b0:311:13e6:6504 with SMTP id
 j2-20020a5d5642000000b0031113e66504mr5674711wrw.47.1687171048428; 
 Mon, 19 Jun 2023 03:37:28 -0700 (PDT)
Received: from [192.168.69.115] (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 f6-20020adff586000000b0030796e103a1sm7815194wro.5.2023.06.19.03.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 03:37:28 -0700 (PDT)
Message-ID: <ed63d01a-4903-a233-ac80-6e8d10411a02@linaro.org>
Date: Mon, 19 Jun 2023 12:37:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 02/38] util: Add cpuinfo-ppc.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230609022401.684157-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 9/6/23 04:23, Richard Henderson wrote:
> Move the code from tcg/.  Fix a bug in that PPC_FEATURE2_ARCH_3_10
> is actually spelled PPC_FEATURE2_ARCH_3_1.

This is rather confusing.

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   host/include/ppc/host/cpuinfo.h   | 29 ++++++++++++++++
>   host/include/ppc64/host/cpuinfo.h |  1 +
>   tcg/ppc/tcg-target.h              | 16 ++++-----
>   util/cpuinfo-ppc.c                | 57 +++++++++++++++++++++++++++++++
>   tcg/ppc/tcg-target.c.inc          | 44 +-----------------------
>   util/meson.build                  |  2 ++
>   6 files changed, 98 insertions(+), 51 deletions(-)
>   create mode 100644 host/include/ppc/host/cpuinfo.h
>   create mode 100644 host/include/ppc64/host/cpuinfo.h
>   create mode 100644 util/cpuinfo-ppc.c
> 
> diff --git a/host/include/ppc/host/cpuinfo.h b/host/include/ppc/host/cpuinfo.h
> new file mode 100644
> index 0000000000..7ec252ef52
> --- /dev/null
> +++ b/host/include/ppc/host/cpuinfo.h
> @@ -0,0 +1,29 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Host specific cpu indentification for ppc.
> + */
> +
> +#ifndef HOST_CPUINFO_H
> +#define HOST_CPUINFO_H
> +
> +/* Digested version of <cpuid.h> */
> +
> +#define CPUINFO_ALWAYS          (1u << 0)  /* so cpuinfo is nonzero */
> +#define CPUINFO_V2_06           (1u << 1)
> +#define CPUINFO_V2_07           (1u << 2)
> +#define CPUINFO_V3_00           (1u << 3)
> +#define CPUINFO_V3_10           (1u << 4)

Could we define as CPUINFO_V3_1 ...

> +#define CPUINFO_ISEL            (1u << 5)
> +#define CPUINFO_ALTIVEC         (1u << 6)
> +#define CPUINFO_VSX             (1u << 7)


> -#define have_isa_2_06  (have_isa >= tcg_isa_2_06)
> -#define have_isa_2_07  (have_isa >= tcg_isa_2_07)
> -#define have_isa_3_00  (have_isa >= tcg_isa_3_00)
> -#define have_isa_3_10  (have_isa >= tcg_isa_3_10)
> +#define have_isa_2_06  (cpuinfo & CPUINFO_V2_06)
> +#define have_isa_2_07  (cpuinfo & CPUINFO_V2_07)
> +#define have_isa_3_00  (cpuinfo & CPUINFO_V3_00)
> +#define have_isa_3_10  (cpuinfo & CPUINFO_V3_10)

... and have_isa_3_1 instead?

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


