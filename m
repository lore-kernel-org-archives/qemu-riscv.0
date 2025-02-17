Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0613C021A9
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 16:37:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tk47w-0008W4-1B; Mon, 17 Feb 2025 11:37:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tk47u-0008Va-TV
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 11:37:46 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tk47s-0007CW-UM
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 11:37:46 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2fa8ac56891so6468665a91.2
 for <qemu-riscv@nongnu.org>; Mon, 17 Feb 2025 08:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1739810263; x=1740415063; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QJAnQ6KSRQeLxo5DrQ1/+9lnEZmxA9TeBMNZXMAlfU0=;
 b=lYMAMOo1PDKIprCi+ln56C8KezYkmuTof5syGHbP3RySZBJNgS/wgNdHPkVp9BDeu8
 ebVg/Uq8fIuMXhOTUgiWn7hMKrVB7AShppijPlXeH52IGZAvKC3ukqq3Oql0ca3RG0xe
 yaRwyPYrWcltan65T7P0fgbEEByukEKJHeoPFzDRe2rioK99JDZsgIvMFcw+wGnwMVwH
 nkKTRZQVnY1osHO4AX18Km9Rzah0ABbnVc89dabRq7YSk8+lbqznBotd9mFe5TjUxvDx
 m+FC44f6UY5q2zLvEHxBfPKAcR2Q8h0EX+hSDslydfB7DUcMaBgwINa1/nUFjDQj6T9g
 ZRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739810263; x=1740415063;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QJAnQ6KSRQeLxo5DrQ1/+9lnEZmxA9TeBMNZXMAlfU0=;
 b=T1GuB+x6g7W1pL5KSJ8CBM/PxQ5/bFpiQOs2fiUL2nJfU5tw45o1IPdrbEDojUmn1c
 Qt6wg02TuOuULkzzbJkcb9AIu36Omtmpa2oE8bARJ3bSnyJAGwCfXTWUgu4D8Bec5R2K
 6I43wUke3zP9kslofcRLGNa1jreAUG7yGfKPLWhvtnqEkN2xxSv3ZEw/Hlk4KKaxpCR8
 lYyjhfBXPcxLVt/AwRTF8R+CBdZhdGaQK3VTj2fPVdShh0NVBn9GjCWjSAMhZttvRhUA
 o5vcDkNXXGj/KaJkIgbxJgjYUHHXL1kDdGiROBHhC7BfSfTgaGAiUACWRPDXNy+AyIgr
 eovg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV62QtWXO7YDsJoYe4HOmykMKh/rTis8rqte2MNwuDLfu/4lgLz06BwL+mpf3Y+59j7QAGE3Ag1jaPI@nongnu.org
X-Gm-Message-State: AOJu0YxrTvZx60hQHambqvUf/LoR1orxO6Y4BNiB6i7Sik2jns1tClTY
 x4c96TiISR351YwpQVP+Aw5NIw+f/WJP8uIyrEIr8Q5+WzVWznffSnsA49EPoi0=
X-Gm-Gg: ASbGnctPvg46v+3JbinBZe1ar4UyXDhXZl1RPD/lf1vZk0xQ5+Dh0TQJEYmSRB3YCqj
 30/4OQ/RccH5rmtnCvTWs0kmEr8PPIWWa0tbUyxQFaF5/AE1gpLVgzwGqUKGTAmcTb+ADu5dr9I
 c/PShkCHqjvqo93e5/1rohK13d1r8gZAd+AnE5IPdWcnPybTcmrcf3H49fGls6iWZQ/JwlMdPJm
 ILtuyEu5cUd/dy/1LNZzKDy1Ht+OvM/PkGgTDPJIguG2RAx46wyzKnn01bCApbvKV5KjAFFna4B
 48OSAFFBpsljpyK8KseqAZAgFdIuJhkMCpjVdNgUTIj1K1k9qEHUDNNEsdrde5UE
X-Google-Smtp-Source: AGHT+IH825bkQck0StXWlhdENnRDaIpTJwiimi1Dj/JaAOoL82WE1H6EdtnQ4gFWPg4gqpDGSSMl3g==
X-Received: by 2002:a17:90b:2e46:b0:2ee:b6c5:1def with SMTP id
 98e67ed59e1d1-2fc40f0f46dmr14739663a91.8.1739810262960; 
 Mon, 17 Feb 2025 08:37:42 -0800 (PST)
Received: from [192.168.68.110] (201-68-240-180.dsl.telesp.net.br.
 [201.68.240.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fc13ac19aesm8301249a91.17.2025.02.17.08.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 08:37:42 -0800 (PST)
Message-ID: <ca0c6853-2968-4e3c-84ef-6656b33a51e2@ventanamicro.com>
Date: Mon, 17 Feb 2025 13:37:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Respect mseccfg.RLB bit for TOR mode PMP
 entry
To: Rob Bradford <rbradford@rivosinc.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20250210153713.343626-1-rbradford@rivosinc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250210153713.343626-1-rbradford@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1030.google.com
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



On 2/10/25 12:37 PM, Rob Bradford wrote:
> When running in TOR mode (Top of Range) the next PMP entry controls
> whether the entry is locked. However simply checking if the PMP_LOCK bit
> is set is not sufficient with the Smepmp extension which now provides a
> bit (mseccfg.RLB (Rule Lock Bypass)) to disregard the lock bits. In
> order to respect this bit use the convenience pmp_is_locked() function
> rather than directly checking PMP_LOCK since this function checks
> mseccfg.RLB.
> 
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   target/riscv/pmp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index a185c246d6..85ab270dad 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -524,7 +524,7 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
>               uint8_t pmp_cfg = env->pmp_state.pmp[addr_index + 1].cfg_reg;
>               is_next_cfg_tor = PMP_AMATCH_TOR == pmp_get_a_field(pmp_cfg);
>   
> -            if (pmp_cfg & PMP_LOCK && is_next_cfg_tor) {
> +            if (pmp_is_locked(env, addr_index + 1) && is_next_cfg_tor) {
>                   qemu_log_mask(LOG_GUEST_ERROR,
>                                 "ignoring pmpaddr write - pmpcfg + 1 locked\n");
>                   return;


