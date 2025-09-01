Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8652CCA1005
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 11:09:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ut2PN-0001R4-T3; Mon, 01 Sep 2025 07:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ut2PM-0001Qn-HB
 for qemu-riscv@nongnu.org; Mon, 01 Sep 2025 07:09:08 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ut2PK-00038j-DP
 for qemu-riscv@nongnu.org; Mon, 01 Sep 2025 07:09:08 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45b7c01a708so13472085e9.3
 for <qemu-riscv@nongnu.org>; Mon, 01 Sep 2025 04:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756724945; x=1757329745; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sRHr5guPu7iMPr3nU1tfv6PHzbX40PpKttGsE7g8MxE=;
 b=eq+fYuGFkAA088V8hTVCC4rATQSqeo1ERzte1Tj7PE7q0p1m29mY+pXc0BpZmSKAdF
 x7BNioH1imtTgzpoeJ2dLR5fvTxfDNtOfDk+x9L3BnEHiHkuhRovtOP+hyh/KaH3GpwC
 Jo4R/f6nvoSTyxr4TfnF/DE5ngVYP/KvPZcKT4D0rDMA2vcoLXPoC9Jm+tT5tpHVVZmq
 9rLl0sQkMiTJJ3fqVmec6AT43DnZe40OnLN2lOBES8lFNKFmmf/2uBXyrdDf5V6mi0OQ
 mS5QIvhdNWThCwCndNX1rzyhooA3XJ3yE8F06M7cJ+2sM7hhcmoFND5hRt5K3vOig1fK
 qqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756724945; x=1757329745;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sRHr5guPu7iMPr3nU1tfv6PHzbX40PpKttGsE7g8MxE=;
 b=sJRSgGzPQf+CVXgccStoZivbZR1QOZhlK2O/C4b6VeRZi59ulx0BSZhUvYRu4s+7dI
 9R6OTsqk0kg0hKjrvrKv9W766jEEYzTiy94CZAdvZwyfU23wtNVLnnlm9T7qFj5l/hal
 1+88AaLPjeWpPftplA42lhutHcDHt0Bbl0MmaYPN2EGPcctNEc8O6NbIy3rqDMwvlMxb
 TeaDLwvgQ5WngTXHlUR/1xNG5U0k7kCtK/pO9mVEpCMMA1OC3nIfxkYHzKQuix5WAEfJ
 MrqK8Xfeth7FsWWqx8En+otbKAx+11w9E+T1IOn3JFX3eZFnIRhRcOdfKcRgpbR0IA8r
 xgtw==
X-Gm-Message-State: AOJu0Ywh4b6TGOTKFxct0gBPjo7L26Fu+9uOMZsYbjc27ggq3sQrSKu7
 mg0pEbybuzSmdusT7dLLi7aW5g2WqVwdoh4vlJMgHXRpTTg+8II7h7Jr79X5Q92sPng=
X-Gm-Gg: ASbGnctcgLgKn0QmhuUrOqZv3N6hsp7gudYa7smlI/PnX6O7NrN0J/3t89vrk7X+YHM
 GGyoz3T9iNNq3k8luGEQ1JS8bDVvBJOK8YWEYEWTScxwL70ZiRdDuDycaxrmR2s97qucxteduym
 f/PQsaTviuEJMjJqRmlDqbLiKsytBYlst7KAcmkJ2ixWCoZzJt6Ss6aX8DioLZc5d0J5LwR17GQ
 FrNGoEru0ndmEI3ttPBqwsj7pxXiyvRwoatkMrVx6yt84EthNG3ysQV2ioOgU4M1iH771p6FN1a
 9KuOUy95fC1BG/CLRZ9d1Y1gRfN/SvfgGVuwAiKVbPtKE51JljH3OHHJ/xHBVL8jsLnLwCVR51Y
 eIUdDZluW1ZRty3d7ZnFLWsvWgu2Y8845IKOdbcrjGfFvpk+Reqj9lqJfUgTaW0CwJA==
X-Google-Smtp-Source: AGHT+IFdSChrNZBgh+G+ZPiCNJM44gS23B8A9HZ9z2jgAbSZbaDgR1QCxTmRal7HhuVYQgcDCgbjyQ==
X-Received: by 2002:a05:600c:1ca9:b0:45b:8c3f:7d5a with SMTP id
 5b1f17b1804b1-45b8c3f7dc6mr30041875e9.4.1756724944622; 
 Mon, 01 Sep 2025 04:09:04 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e8ab093sm157419385e9.22.2025.09.01.04.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 04:09:04 -0700 (PDT)
Message-ID: <f903021c-e4e4-46c3-ae6a-d03201ee76bf@linaro.org>
Date: Mon, 1 Sep 2025 13:09:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/14] target/riscv: Add Xmipslsp instructions
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>
References: <20250717093833.402237-1-djordje.todorovic@htecgroup.com>
 <20250717093833.402237-8-djordje.todorovic@htecgroup.com>
 <87427d18-af1e-4815-b95f-75bae32720d3@linaro.org>
 <00c8547e-dbbc-44d3-bcdf-122899d7dc2e@htecgroup.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <00c8547e-dbbc-44d3-bcdf-122899d7dc2e@htecgroup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 1/9/25 10:30, Djordje Todorovic wrote:
> 
> On 8. 8. 25. 18:02, Philippe Mathieu-Daudé wrote:
>> CAUTION: This email originated from outside of the organization. Do
>> not click links or open attachments unless you recognize the sender
>> and know the content is safe.
>>
>>
>> On 17/7/25 11:38, Djordje Todorovic wrote:
>>> Add MIPS P8700 ldp, lwp, sdp, swp instructions.
>>>
>>> Signed-off-by: Chao-ying Fu <cfu@mips.com>
>>> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
>>> ---
>>>    target/riscv/cpu.c                        |  3 +
>>>    target/riscv/cpu_cfg.h                    |  2 +-
>>>    target/riscv/cpu_cfg_fields.h.inc         |  1 +
>>>    target/riscv/insn_trans/trans_xmips.c.inc | 84 +++++++++++++++++++++++
>>>    target/riscv/xmips.decode                 | 23 +++++++
>>>    5 files changed, 112 insertions(+), 1 deletion(-)
>>
>>
>>> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
>>> index 9734963035..f35d477f27 100644
>>> --- a/target/riscv/cpu_cfg.h
>>> +++ b/target/riscv/cpu_cfg.h
>>> @@ -39,7 +39,7 @@ static inline bool always_true_p(const
>>> RISCVCPUConfig *cfg __attribute__((__unus
>>>
>>>    static inline bool has_xmips_p(const RISCVCPUConfig *cfg)
>>>    {
>>> -    return cfg->ext_xmipscbop || cfg->ext_xmipscmov;
>>> +    return cfg->ext_xmipscbop || cfg->ext_xmipscmov ||
>>> cfg->ext_xmipslsp;
>>
>> Checking for any XMIPS instruction implemented to return vendor
>> extension presence seems odd. Can you implement them separately?
> 
> And I tried several options, but it only made the code even "more off" :(

OK, maybe this is the correct way to go then.

