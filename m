Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95030C88E77
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 10:11:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x6mbc-0007Mr-73; Wed, 16 Sep 2026 06:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x6mbV-0007MY-7R
 for qemu-riscv@nongnu.org; Wed, 16 Sep 2026 06:11:01 -0400
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x6mbT-0006RY-Bc
 for qemu-riscv@nongnu.org; Wed, 16 Sep 2026 06:11:00 -0400
Received: by mail-pj2-x0f.google.com with SMTP id
 98e67ed59e1d1-39b31b4281eso657040a91.2
 for <qemu-riscv@nongnu.org>; Wed, 16 Sep 2026 03:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789553457; x=1790158257; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=reXyOkWf+wcGli+dRwlPWqNmFDYbagokc/fUO/uANLQ=;
 b=s/VjV441XssQphWpgBu891mJ2L+PX7sOHrQrPG9oBFuoCdROiZsC7BTUd/XsAWSKwr
 IwMt81ATrU13NsNNMkXcjUkYUBQlqt2ANfKkDXnKfuq/lnATAVzc1tceiooPrvAe4qsS
 gEJRUsHNMwKJEIAhxrRXX8Bb31xf3MrZHHbw1Y1a+N9tXlYCTZaULkxzS9Tc+YVSDvdO
 8CyZNaVW3yLbFEGhGQPTp/zqy1cT/gZXUnZtwkvoRjcFkfAjTNfal3rgMvGvN0hQIC5o
 BO8qU/w9k56M2YgFZLMRp6MGX+b4nb3aCdAY7szDmzHm4JPS9Mj7U2iz3GuT2DlUANiX
 cxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789553457; x=1790158257;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=reXyOkWf+wcGli+dRwlPWqNmFDYbagokc/fUO/uANLQ=;
 b=zaqH1/QcfSOACdPfzYHORfdTlazgqdI8uOw5G/45N9W4d5bNCpCWIJQo1bnmLf1Vl+
 ksCo7j6uiqhCycHdj7Bi4yFB/wQjJ1ZDZ71FfEb0dOmGQhPSyqyNVQC36bbv/mANr1/V
 pfDkZAZrIlSWNBrKTlZ9N91iMjzcPfRYJWw1sA/qVgCnnatxaHrlxtPEPcqdN0sYwag3
 k1oVaj/r52WvCksae4mn/kI7JkdqRIzqywfGWhw3wiDQn+1fTmFYkIucAnjk73OcjxOy
 D1t+1h57IbjGwk/YMA9wmnrvtWNmJtK1RE1T2Sxwv+c1Pur4a3IPqahld41zBPvDcWsu
 XDOQ==
X-Gm-Message-State: AFuF++n2+xYgsEw5joY0frETpehHtxwWa4kMe56y++INh+aDvzg52/S2
 dt+IKN5qI/bU4KQWzKvCfoUrQQXq96nnYVe1X7J8P7MDObh1Uo4uPPtmLBD1aqj7S44=
X-Gm-Gg: AYBFou1C1dQMbWxtQeJdj0IPuKYH6IxWfdYKI9pHZDHKlD5rHSj2dUUj9ZUMUamkAI2
 XUexzGLu/vDFOgNeUX3I8sSfeFLcc/EuTyc88jVZv65/UcxQiX4EtuuOJ/R332e5BUAGFvuOMnz
 CrytmMiLsOW4vw8lg591FyAAqHhIYxH5IGUL/engf5g8fefDy4V5fm3Bi11POZTZywm9ER+mJHc
 KvXyWK1A4Ux2Jn9Cc0BAqCePvrYQ2Jup5L7CMNzFBNCjXCWb3vphOevzqcZ/DJ8HLWyVeRzqFOe
 dMfh4dFSShCWKaN1K/D9J2mhqx9H1cjLBMog9seV38qnB4hqHom2kNSWqHfmK7QkS6m60w7aymw
 8v/FZy6KdiRnlmkFxh3k1LCWX12ejBrNo8MtFkeSQTZQZOnKAka1ac9dlR+slZYyxcsdQzMPWcK
 PpLUogzPdtoZhyI3u9Os1Tbvlp6u0rx/tpigNHKxky2gpk/CpvSPAiNeoMy2sTnkODKgh8lccWO
 2m/rp5MHtVbxN5Jn7JhmPWVqv/MnsRcwulxes75QnlIGy2JS+gcwAtNyjHt0A==
X-Received: by 2002:a17:90b:2f50:b0:39e:2c5c:a69a with SMTP id
 98e67ed59e1d1-39e2c5cac47mr424076a91.5.1789553457320; 
 Wed, 16 Sep 2026 03:10:57 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:845c:f507:397b:9b72?
 ([2603:800c:7900:ed00:845c:f507:397b:9b72])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14397197dc8sm4917957c88.3.2026.09.16.03.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 03:10:56 -0700 (PDT)
Message-ID: <0ebf4cdd-d5be-41f0-adaf-d540f3dd0793@linaro.org>
Date: Wed, 16 Sep 2026 00:10:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv/pmp: unlock all PMP entries on reset
To: Sebastian Alba Vives <sebasjosue84@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 daniel.barboza@oss.qualcomm.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com
References: <20260916034331.2390427-1-sebasjosue84@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260916034331.2390427-1-sebasjosue84@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 9/15/26 17:43, Sebastian Alba Vives wrote:
> pmp_unlock_entries() bounds its loop with pmp_get_num_rules(), which is
> the count of entries whose A field is not OFF, not the number of
> implemented PMP entries. When the active rules are not contiguous from
> index 0, every entry at an index greater than or equal to num_rules
> keeps its lock bit across a CPU reset.
> 
> Those entries stay locked after the reset has cleared mseccfg, so
> mseccfg.RLB is no longer set and pmp_is_readonly() silently discards
> subsequent pmpcfg writes. Firmware started after the reset finds PMP
> entries it did not configure and cannot clear.
> 
> Reproduced on -machine virt -cpu rv64,smepmp=true with a bare-metal
> payload that sets pmpcfg0 = 0x99990000 (entries 2 and 3 as
> L | NAPOT | R, entries 0 and 1 left OFF) and then resets through the
> sifive_test device. On the second boot pmpcfg0 reads back 0x99990000
> and writing 0 to it leaves the value unchanged. With this patch the
> same payload reads 0x01010000 on the second boot and clearing pmpcfg0
> succeeds.
> 
> Iterate over the implemented entries instead.
> 
> Fixes: 4bf501dc0118 ("target/riscv: pmp: Clear pmp/smepmp bits on reset")
> Signed-off-by: Sebastian Alba Vives <sebasjosue84@gmail.com>
> ---
>   target/riscv/tcg/pmp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
> index 41b55519a8..5286c6aa90 100644
> --- a/target/riscv/tcg/pmp.c
> +++ b/target/riscv/tcg/pmp.c
> @@ -201,10 +201,10 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
>   
>   void pmp_unlock_entries(CPURISCVState *env)
>   {
> -    uint32_t pmp_num = pmp_get_num_rules(env);
> +    uint8_t pmp_regions = riscv_cpu_cfg(env)->pmp_regions;
>       int i;
>   
> -    for (i = 0; i < pmp_num; i++) {
> +    for (i = 0; i < pmp_regions; i++) {
>           env->pmp_state.pmp[i].cfg_reg &= ~(PMP_LOCK | PMP_AMATCH);
>       }
>   }

Why is the entire env->pmp_state not zeroed instead?


r~

