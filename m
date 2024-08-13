Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0817C52D7C
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 08:21:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sdmmn-0000ZB-Sn; Tue, 13 Aug 2024 04:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sdmmk-0000Xv-NY
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2024 04:21:42 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sdmmg-0004sX-Nz
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2024 04:21:41 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a7aa4bf4d1eso616598566b.0
 for <qemu-riscv@nongnu.org>; Tue, 13 Aug 2024 01:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723537294; x=1724142094; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ESib9n1vLmh2munW0AFg20IvFz3uibA9Rp2ajm7yjjU=;
 b=PytTwuz+73626dPzN8ReM4nzKXdKgSpKqiCcpAm2RGK2+9+zUpYX4aP7V23dQ8dVJw
 LoIan5cBV3/7CRzP94rzkfTExtlNILsyeHA8sxE2jN5vAnoB+ZQzsYtHpzg5KqHi401n
 58p9NGCTeh5wkKfdYWIku9higF7NGrzUm7tJjnvnU3WlVaVIc0i5onST6e0llKnndZpN
 Z2WksaP8D+c7kDnMxRCk511SIaxyfBfoPhDBWn0hH1GuRXAQ1wcPIonouCq1+lLUp4ER
 NlCGol7hF6NdeSBjd985E8aaUepI8L7GQvBSobWRg/k8w16a4wButF9FYl2kZgntG+dp
 DxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723537294; x=1724142094;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ESib9n1vLmh2munW0AFg20IvFz3uibA9Rp2ajm7yjjU=;
 b=cnjRbEIckE5WUoHX+vFusyE6Z38Zs+onFkssSFUy7F+0ond+dSFtvabFsWiRs2xi9w
 9NqDHMhukg49HjA2AgdZ3FXqTCVbLvw0HUZpHK5hPTVdGmL7FTp90zizK27dDf65Ymvz
 QoEkDKh8MKUTlw4k8xFF7mXK99U67md9voRRa3hQKcMZyF5hJzgFzC5KvE+ggslud7I5
 qR2ia3sNM7jA7iXzZhyfRHlGldHkokQ74tpai9C//HPhQS1PhYTuQm1AONkYU4JCWYYu
 CKOcVUtn6F9l1gNXEXf7L9fjJ4emtv0FrgyYyh+TeOS5h0o4OogfEnd2ddkmMiAAlG25
 sE7A==
X-Gm-Message-State: AOJu0YxNn44694uUSIhEAmpv3fcLMD/FsuUxkQhQgn6rxFaxyQxX84Mo
 xZ72WpttRfAJYvyU9aAwQymInxfxenK8icDDItLIkh5/B9Il5K3vyiBxRoyBR64=
X-Google-Smtp-Source: AGHT+IGFFAdrK10H6crCA3kFWvozB6H69RBgiDU+I0WwzxZCzPJH9hhpRcjJmyFo+Rq9QSEwsKQ9xw==
X-Received: by 2002:a17:907:805:b0:a7a:a892:8e05 with SMTP id
 a640c23a62f3a-a80ed27873fmr180337266b.33.1723537294373; 
 Tue, 13 Aug 2024 01:21:34 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.129.17])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f3f45c78sm49727966b.37.2024.08.13.01.21.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 01:21:33 -0700 (PDT)
Message-ID: <3f1accd0-33b8-4656-944f-f6637ee315b9@linaro.org>
Date: Tue, 13 Aug 2024 10:21:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv32: Fix masking of physical address
To: Andrew Jones <ajones@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, zong.li@sifive.com,
 liwei1518@gmail.com, cwshu@andestech.com, dbarboza@ventanamicro.com
References: <20240813071355.310710-2-ajones@ventanamicro.com>
 <aa7facef-acda-4846-98d5-2f7584515035@linaro.org>
 <20240813-e2c6dc0e68f76be576c72996@orel>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240813-e2c6dc0e68f76be576c72996@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
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

On 13/8/24 10:00, Andrew Jones wrote:
> On Tue, Aug 13, 2024 at 05:43:07PM GMT, Richard Henderson wrote:
>> On 8/13/24 17:13, Andrew Jones wrote:
>>> C doesn't extend the sign bit for unsigned types since there isn't a
>>> sign bit to extend. This means a promotion of a u32 to a u64 results
>>> in the upper 32 bits of the u64 being zero. If that result is then
>>> used as a mask on another u64 the upper 32 bits will be cleared. rv32
>>> physical addresses may be up to 34 bits wide, so we don't want to
>>> clear the high bits while page aligning the address. The fix is to
>>> revert to using target_long, since a signed type will get extended.
>>>
>>> Fixes: af3fc195e3c8 ("target/riscv: Change the TLB page size depends on PMP entries.")
>>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
>>> ---
>>>    target/riscv/cpu_helper.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>> index 395a1d914061..dfef1b20d1e8 100644
>>> --- a/target/riscv/cpu_helper.c
>>> +++ b/target/riscv/cpu_helper.c
>>> @@ -1323,7 +1323,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>>>        int ret = TRANSLATE_FAIL;
>>>        int mode = mmuidx_priv(mmu_idx);
>>>        /* default TLB page size */
>>> -    target_ulong tlb_size = TARGET_PAGE_SIZE;
>>> +    target_long tlb_size = TARGET_PAGE_SIZE;
>>
>> If rv32 physical addresses are 34 bits, then you probably didn't want target_*long at all.
> 
> Yes, just using hwaddr for everything that only touches physical addresses
> would probably be best, but, ifaict, it's pretty common to use target_long
> for masks used on both virtual and physical addresses (TARGET_PAGE_MASK,
> for example). This 'tlb_size' variable is used on both as well.

Then maybe you want vaddr ("exec/vaddr.h"):

/**
  * vaddr:
  * Type wide enough to contain any #target_ulong virtual address.
  */


