Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF925C02180
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 12:32:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tYP3L-0004pk-Nx; Thu, 16 Jan 2025 07:32:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tYP39-0004kg-NK
 for qemu-riscv@nongnu.org; Thu, 16 Jan 2025 07:32:41 -0500
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tYP36-0001cJ-BM
 for qemu-riscv@nongnu.org; Thu, 16 Jan 2025 07:32:38 -0500
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-5f340d6db09so506529eaf.1
 for <qemu-riscv@nongnu.org>; Thu, 16 Jan 2025 04:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1737030755; x=1737635555; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UgwvLOI/eN5mXU54qR9byI/WCCc4RKgaZGWeCSOI8Do=;
 b=Shn6jfympqCip7vmz6gKTo+MGrsS1lC/gtJp9vS7qyKEbKgAqBBmWYTyk0XoLhk19F
 oDf8AgvE2J53I05YO8CGQA16158WZ2T2RMmsSEtmuUErNpwCfK1vwYf9+Kgp8r+v52WR
 DqyNHtsDSsOrwdkMAXzFtjSXo1tHft/HWS1m/3cCZ8KTA+AtUxr+jhaAxI3KG7wAGZeB
 yjrDidUuY8FDCevTJeCqNassPcFvyQ8JbDhpcvSFsSDOL5N2/UbjYKI7iIREMmYilxsv
 7pYRnx5Wi3e9kphapkL65RGbWemG/+Ogj9XtOSSfMnxExlja1bn0OSbjn4Fsxp41+CJI
 fsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737030755; x=1737635555;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UgwvLOI/eN5mXU54qR9byI/WCCc4RKgaZGWeCSOI8Do=;
 b=ARoIxfOzsqqecCR0shjUJhk9yaUBO5j8BjPw7PeCJIolBIuBfpOupWQ1Y/Fqft5Fk+
 tgLxfyQ0BBXucGpgcAvw+3wajk+aS6PkqrCYDRMvEnVc9F6L5x1/gSSULTogErTa83hv
 OLX6MT3DQkLDdHDQegTNqcwcP+5bCvLnGXCM/3FmWZNe44LKgrh7WXeccgsQtayuWEvi
 y2oeLQo2B9SL8q/vsyNnq5BIhTqJOIpBnAcWgpCoUfznqVH/5qL+CAG7ncfk/EVow/sP
 5zJq3GdvtMBlHhU6/kx+Hua6Nw+8QGTqjiiquAwdyvAqeMqy/WvNjniRFRl+THj+7GKN
 mGYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjm+mwZu8RohbaSxlomls+z5Vg1f9em7YDswS0MJo35govsTWs5nhb1/Ff+/N3hit688N3+zcM8L1v@nongnu.org
X-Gm-Message-State: AOJu0YxUJg42wPm1EbkfL1mHtY/eu7ZNvuUoObQEOf240UhrvfOpP07u
 m16brMT+aPjFzW9PZv03Bp9y89Hh39WqByHNF2mOI8VxC3ola7S9N0RYguqDjZjQfi4mS6enlAD
 pZk4=
X-Gm-Gg: ASbGncsGI0Tf76VO4JLu2KXT33BbWQtOvLRuKP2zO/hLDDZkx+CS9WWojkOkYLHgR4D
 mqRtmC5fSVGARJncm8MJuiVECTV1BkgJ9B7ku297tJ0D6wahYefpbQWEP1GxaD1I7KPNoYtb7rh
 yU3tqUqJslOMHdjEBXyLpstQFzl5HceRnYhMmdkdwJL8GKsrNx2Rtx/3O75lDAQNNF1cm+nu/Q7
 OqB3U/J8G6yXlqAalZjVjS0NG9GPh5bd/qbWMslWNd06vB0HK3gjatRWZlswxibxhHdN1c=
X-Google-Smtp-Source: AGHT+IGLpkxdCVeI316958ZXs8uYfEF23wFGxIFZcVWyxBb2gjmrJCJHXcLlMVdZyYt/Yxt2d9NDxg==
X-Received: by 2002:a05:6820:610:b0:5f9:4f8c:868e with SMTP id
 006d021491bc7-5f94f8c8838mr4042420eaf.2.1737030755107; 
 Thu, 16 Jan 2025 04:32:35 -0800 (PST)
Received: from [192.168.68.110] ([191.202.238.10])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f88266c381sm6120434eaf.22.2025.01.16.04.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 04:32:33 -0800 (PST)
Message-ID: <66905257-fc4f-4b64-b532-13b00a0c00d4@ventanamicro.com>
Date: Thu, 16 Jan 2025 09:32:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/riscv: Mask out upper sscofpmf bits during
 validation
To: Atish Patra <atishp@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 bin.meng@windriver.com, alistair.francis@wdc.com
References: <20250115-pmu_minor_fixes-v1-0-c32388defb02@rivosinc.com>
 <20250115-pmu_minor_fixes-v1-2-c32388defb02@rivosinc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250115-pmu_minor_fixes-v1-2-c32388defb02@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc34.google.com
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



On 1/15/25 9:49 PM, Atish Patra wrote:
> As per the ISA definition, the upper 8 bits in hpmevent are defined
> by Sscofpmf for privilege mode filtering and overflow bits while the
> lower 56 bits are desginated for platform specific hpmevent values.

s/desginated/designated

> For the reset case, mhpmevent value should have zero in lower 56 bits.
> Software may set the OF bit to indicate disable interrupt.
> 
> Ensure that correct value is checked after masking while clearing the
> event encodings.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/pmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index cf713663ee56..0408f96e6af8 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -390,7 +390,7 @@ int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
>        * Expected mhpmevent value is zero for reset case. Remove the current
>        * mapping.
>        */
> -    if (!value) {
> +    if (!(value & MHPMEVENT_IDX_MASK)) {
>           g_hash_table_foreach_remove(cpu->pmu_event_ctr_map,
>                                       pmu_remove_event_map,
>                                       GUINT_TO_POINTER(ctr_idx));
> 


