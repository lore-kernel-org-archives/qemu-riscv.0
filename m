Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E55C52D7C
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 02:36:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sfsFQ-0000GB-NG; Sun, 18 Aug 2024 22:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sfsFP-0000FC-FM
 for qemu-riscv@nongnu.org; Sun, 18 Aug 2024 22:35:55 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sfsFN-0000OO-VJ
 for qemu-riscv@nongnu.org; Sun, 18 Aug 2024 22:35:55 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-7c9a2b339a6so872229a12.2
 for <qemu-riscv@nongnu.org>; Sun, 18 Aug 2024 19:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724034951; x=1724639751; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4F0V9Ka06cM7KtdTbhi8S9OMMbAV7WqQqt6ASHLqV38=;
 b=LEmhMC2fVMfgaJmZSgmH2SdrVGbeKgcsGw9W4d4fumsAbw22O+Hk+SXbH6crb10Aqk
 8IHX9aQv18sg2BxamrK6QVIK1Cfy/oupVEfaPl8LdiGXYBY9EvXXsBNktEjXx5Ee7Kq6
 GEcLgFMcpbuzvnmnLXdkQIhfqF6knKc/NpW2dW95kEoFu9aWJGtaz2z83Sf+3zEip2oY
 b+sZNKZCR5BB4ebdnB+EKA6DzMRAu6E6Pw18o4lkWBIKm8O9z0usiOwBOoSUam8pR0nL
 2zoEGR2Nfa1fPbClFnSWn1cV3NTOEFYU38nbd7ptx5aE7lCHzuP0pOqtamdQZ4qQl3Il
 R9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724034951; x=1724639751;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4F0V9Ka06cM7KtdTbhi8S9OMMbAV7WqQqt6ASHLqV38=;
 b=IGC/l5fujgPndNphUJklTIZqEFc1FSq3h3rrJ1C8ipmtKAp5xvFj+bjm7g2EkzoOuH
 TJIlpgV6lytVQxwcwUkuNfrszIhJZl9ndKc9ouQ1rvZrzDe22iEF0M0xH/FVJjoS5kAW
 U5udwSYwWqs6yB3fKnipLfhqGE5TFo3/J4yvZ7VLmxrA93SCPqVMfNP//yHJjUD7DG+h
 lSrbQTfyUTnIGYu+eaJZa9SDD0sLGYiM0HNXX0Faiw75hj/d7Ec+udfPKQfBvHLnB8t+
 y01hy/ZeF0Pdi+KqAtl0WsJQ3MWm1UuWodrxq331yi+4GWuv4F+EBPBOPKRbkuSL/1DL
 RLQQ==
X-Gm-Message-State: AOJu0YzrmSWIZaCYv/5PIipwYzuFZ2iEpiXh0vMApbfrx5ROQlgNhx7G
 ynNDlaM/C97Td4KrTvpKs4jEHKQKXYrEiyt8z1r1qQe1Cf/vl54i41bS7kgVyCw=
X-Google-Smtp-Source: AGHT+IEDkOdXAdADFXe4y4EWO8qBZDP2vyKR8WLHPEFOjIcoSWy31mpdJxojP8QkVnxBUGzeKIjFIQ==
X-Received: by 2002:a05:6a20:d708:b0:1c4:b8a1:6db1 with SMTP id
 adf61e73a8af0-1c9050281ffmr9557670637.38.1724034951147; 
 Sun, 18 Aug 2024 19:35:51 -0700 (PDT)
Received: from [192.168.1.113] ([203.30.4.109])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7c6b61e10b8sm6624085a12.47.2024.08.18.19.35.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Aug 2024 19:35:50 -0700 (PDT)
Message-ID: <6a0f46a5-02f7-47e8-a5f5-5666c2fc9fe2@linaro.org>
Date: Mon, 19 Aug 2024 12:35:41 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/15] tcg/riscv: Add riscv vset{i}vli support
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20240813113436.831-1-zhiwei_liu@linux.alibaba.com>
 <20240813113436.831-6-zhiwei_liu@linux.alibaba.com>
 <37e67a28-dd86-435d-a072-95f6a85cc2a7@linaro.org>
 <ac327ea2-2b22-40e2-8246-57e4be77d8d1@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ac327ea2-2b22-40e2-8246-57e4be77d8d1@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/19/24 11:34, LIU Zhiwei wrote:
>>> @@ -1914,6 +2029,11 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
>>>                              const TCGArg args[TCG_MAX_OP_ARGS],
>>>                              const int const_args[TCG_MAX_OP_ARGS])
>>>   {
>>> +    TCGType type = vecl + TCG_TYPE_V64;
>>> +
>>> +    if (vec_vtpye_init) {
>>> +        tcg_target_set_vec_config(s, type, vece);
>>> +    }
>>
>> Here is perhaps too early... see patch 8 re logicals.
> 
> I guess you mean we don't have implemented any vector op, so there is no need to set 
> vsetvl in this patch. We will postpone it do really ops need it.

What I meant is "too early in the function", i.e. before the switch.

Per my comment in patch 8, there are some vector ops that are agnostic to type and only 
care about length.  Thus perhaps

   switch (op) {
   case xxx:
     set_vec_config_len(s, type);
     something;

   case yyy:
     set_vec_config_len_elt(s, type, vece);
     something_else;

   ...
   }

Or some other structure that makes sense.


r~

