Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAEDC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 16:34:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rMsa7-000339-9u; Mon, 08 Jan 2024 11:34:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rMsa3-00032A-2k
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 11:34:27 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rMsa1-00081j-4k
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 11:34:26 -0500
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6db05618c1fso311402b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 08 Jan 2024 08:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704731663; x=1705336463; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9fz5dE7p1Aa5k9PFL9UORdVCWXCRQi41kaGf8smoL5o=;
 b=gZsotLUkHOp633OW9o8Nc0vKMIjaHtJO5CgZU8f8JYeIUMZLvINeBMge6BykStbL9C
 +yATpuo2hhp/zRVvFfJz0zL8F1sAR9QCLXcUTj9n0guiOTJMtPKzysFShjHchEFh9Z8Y
 DQEanmv2lsOP+w8y5PNoVjYnMg8q9W6b7TiBuG7e/lYoNGiR0LU1WJdtQ/fmFU6kHjDD
 uTQFA+Je1+Jfef4HE+q77Jelo0ugplNfdtFIY4PPBTzdtFA41hfMHZQCZ9QLSi/Pn24W
 DT8IiF+cfBCADG7rOT8TpKIlhwCtMAD2k8SSsus6gC4Jij4KXMwJBF9KwJel9Rq1psGd
 WPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704731663; x=1705336463;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9fz5dE7p1Aa5k9PFL9UORdVCWXCRQi41kaGf8smoL5o=;
 b=QDNeUQtyyiFzNlRup926VVvsA2nK2xBXuz+2Z/upmBDHsJ0uD2/xZycN1red5vvH4O
 dvUrhlJTuePC9I5z9aVX+BF/EzbhWoEAaToVWVVILnMMuM9CxsM4Nv6Sv5REnfsW7JRx
 XZfXBUIuVJtbTmHbPFwCjy0GrjP9EAO6WG2QvP4DAdZdzSFiMjpkCDWc/uGTjUjPWyEw
 fvAHBE+fATBir9Cr4WdCtfrWqnyb+gOwGn2VmXXYp1brxjpusqmAYDowRcbcUgdFBcvD
 yaCXIi7jx1fNyPuDTkApYlSMVvs4ikbcasOL/FOcuAfzouBkIFQZuOYGBBi0BhOJh1tq
 6WGw==
X-Gm-Message-State: AOJu0Yx9hfDbsknE9Vhtb/uB3pTSS4Bjpr6Wg95H6Bwjn2aheOMUcZwB
 FDOkbmDc7phMH4/R8JRYQcF3C0BfaS8anA==
X-Google-Smtp-Source: AGHT+IHAOHjURb7SS1mGKdrU4tLjSvwWEz4Qy1/hbOQqoa0SsLKZkF24Yf8ppx37jgYEzlmYMjQcmg==
X-Received: by 2002:a05:6a00:90aa:b0:6d9:bbd6:aa7 with SMTP id
 jo42-20020a056a0090aa00b006d9bbd60aa7mr4500954pfb.6.1704731663182; 
 Mon, 08 Jan 2024 08:34:23 -0800 (PST)
Received: from [192.168.68.110] ([189.79.22.11])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a625e05000000b006d9fa8a8c27sm70960pfb.168.2024.01.08.08.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 08:34:22 -0800 (PST)
Message-ID: <5de6616f-5fc0-4b7f-8257-8716ddb23b44@ventanamicro.com>
Date: Mon, 8 Jan 2024 13:34:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] target/riscv: Assert that the CSR numbers will be
 correct
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>, zhiwei_liu@linux.alibaba.com,
 qemu-riscv@nongnu.org, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-devel@nongnu.org, liwei1518@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>
References: <20240108001328.280222-1-alistair.francis@wdc.com>
 <20240108001328.280222-2-alistair.francis@wdc.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240108001328.280222-2-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x435.google.com
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



On 1/7/24 21:13, Alistair Francis wrote:
> The CSRs will always be between either CSR_MHPMCOUNTER3 and
> CSR_MHPMCOUNTER31 or CSR_MHPMCOUNTER3H and CSR_MHPMCOUNTER31H.
> 
> So although ctr_index can't be negative, Coverity doesn't know this and
> it isn't obvious to human readers either. Let's add an assert to ensure
> that Coverity knows the values will be within range.
> 
> To simplify the code let's also change the RV32 adjustment.
> 
> Fixes: Coverity CID 1523910
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/csr.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fde7ce1a53..336ec7eda7 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -195,8 +195,11 @@ static RISCVException mctr(CPURISCVState *env, int csrno)
>   
>       if ((riscv_cpu_mxl(env) == MXL_RV32) && csrno >= CSR_MCYCLEH) {
>           /* Offset for RV32 mhpmcounternh counters */
> -        base_csrno += 0x80;
> +        csrno -= 0x80;
>       }
> +
> +    g_assert(csrno >= CSR_MHPMCOUNTER3 && csrno <= CSR_MHPMCOUNTER31);
> +
>       ctr_index = csrno - base_csrno;


After this change 'base_csrno' is now used to store CSR_MHPMCOUNTER3 and nothing
else. You can get rid of it, although having the var is arguably more readable.

Regardless, this LGTM:

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>       if ((BIT(ctr_index) & pmu_avail_ctrs >> 3) == 0) {
>           /* The PMU is not enabled or counter is out of range */

