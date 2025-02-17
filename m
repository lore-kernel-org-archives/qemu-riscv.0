Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FBBC021AA
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 19:29:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tk6nZ-0000OI-IV; Mon, 17 Feb 2025 14:28:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tk6nQ-0000Af-CF
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 14:28:50 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tk6nL-0007pQ-KL
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 14:28:46 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-220bfdfb3f4so95973715ad.2
 for <qemu-riscv@nongnu.org>; Mon, 17 Feb 2025 11:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739820522; x=1740425322; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VEJ/B3GBCyQg1NZ8srPFvpNFWpxr50mPaKhI69Ppxgo=;
 b=OyYcGtjmYyXLq4ROhgyRLznQTA9gm9m/4XCVtht4IXiSXah+m1vv569wIx/2I5wQzs
 lQwynOh0iWkNGzxcidqKqqimLL9g2smx4IMcCw5Jp73R0LXInMRrtL2wLhYbA/i0HOUb
 fW0Io1KCYVUiAfDQcvF2zZoPjFTr9hp2BUOKo7HGshK78FK3e/aecGw3FznYTwdgbkB6
 znhEOXrC7RbfOoPRPrAZMuutsFjzu79HDNvZNBtUGV4ilm/X6q2U4PMVdYvDhfxwSnVf
 zUe+skYp+76/iSs+bu3UP/Ys1WdcmmKAQkf7rfAdnfYJDMolO519B3pQdcBknDIN6vYQ
 iPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739820522; x=1740425322;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VEJ/B3GBCyQg1NZ8srPFvpNFWpxr50mPaKhI69Ppxgo=;
 b=ppbNbpUxM1rS4Fn67PwRH0lABIwx3sIq2e3hqNjfFBtNqWs/o7r9d5sWCmpEK7OPYg
 sIqQ60atxk8dcKQplJqIRr5wnEYK7Q1600N8WFsUms2NrfPvooEQtanuo8xsq8ChXI7l
 65N98t5MCqzTCX9YA3+CwOjEGTmTuIShh9qNfX8wVRNFOuwud27/OEnaNr+ES+IGH/dP
 QrGRPZ8DkL/++f2Aqy93vm1P5cCqtosDd60Qo3gXztaYbN6FjU/lOf47Dh0G71fh4X1J
 54nEPIFNYgxyBQ9xjIkWDtyxFUaWVrvXlpBaz7TNbRTnsAIvZ4BvTg701keUnczfbk8E
 QX9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn4w1U1+ArQrXuDgbWOZoryiBW1eVvgUJCfPVXEYDNlz2mftEgAb2Xi8XG17PZLloM4HylI9e3rYYV@nongnu.org
X-Gm-Message-State: AOJu0Yw/4wnU0ZiHGzpmQK7A8e6z1cAzeUr6/1BRxIMMayxUiKLHL3tv
 Y18/7OI4wD4JknsQiibig5TWyMEjuFp10ES6iuYlKOI19V7KO+lclBaFLMnjVQs=
X-Gm-Gg: ASbGncvNqYwZaggYiF5T20DeH8iwW7QbJ1Ms3TUuEYL5MWLTN/E1WiakklESnAAABAc
 1TyZeZYwE+Xjiwu8wOX5Z/pwNKb0T1lpfXQOUQulGHWX41BjYahjPlBdSLgoICk3uPpvGBFUCwL
 avBKyWv6Vtuj6VIj6U8E9urI1azvGsDOyODrkDAl/pA6PB0zBLGE/XHy9cedXuWhAk4h7u6RYeO
 0IQccceZb1PQbbcs7OT7xnk/nueU+AehT8Z6kaOkOa69yLnve0aHcMkCxctSLS9biC1B3zI2V3Y
 WxfnQZ8FXDiYrTqz+JUhyYMXeGak1AY4NBigcEUUxh2j2r2FaHYFPLs=
X-Google-Smtp-Source: AGHT+IFw9x3ddCLNhBbl16dPCQzotblc4ykNeeWquQsvMRT1NjsLlII2PlFLuCRaJQswwJsL3MPGMA==
X-Received: by 2002:a05:6a00:2e08:b0:730:74f8:25c1 with SMTP id
 d2e1a72fcca58-732618c0351mr14386201b3a.15.1739820521870; 
 Mon, 17 Feb 2025 11:28:41 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73242568a0dsm8436448b3a.43.2025.02.17.11.28.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 11:28:41 -0800 (PST)
Message-ID: <3cf6d45b-0d0e-4669-954f-a545f3ec1a37@linaro.org>
Date: Mon, 17 Feb 2025 11:28:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/20] cpus: Restrict cpu_common_post_load() code to TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-17-philmd@linaro.org>
 <e52485c5-122a-4a95-928f-08fcd17cd772@linaro.org>
 <a8be34a4-c157-4a5f-99bc-50c87c1330b1@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <a8be34a4-c157-4a5f-99bc-50c87c1330b1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 2/17/25 09:19, Philippe Mathieu-Daudé wrote:
> On 26/1/25 22:16, Richard Henderson wrote:
>> On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
>>> CPU_INTERRUPT_EXIT was removed in commit 3098dba01c7
>>> ("Use a dedicated function to request exit from execution
>>> loop"), tlb_flush() and tb_flush() are related to TCG
>>> accelerator.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   cpu-target.c | 33 +++++++++++++++++++--------------
>>>   1 file changed, 19 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/cpu-target.c b/cpu-target.c
>>> index a2999e7c3c0..c05ef1ff096 100644
>>> --- a/cpu-target.c
>>> +++ b/cpu-target.c
>>> @@ -45,22 +45,27 @@
>>>   #ifndef CONFIG_USER_ONLY
>>>   static int cpu_common_post_load(void *opaque, int version_id)
>>>   {
>>> -    CPUState *cpu = opaque;
>>> +#ifdef CONFIG_TCG
>>> +    if (tcg_enabled()) {
>>
>> Why do you need both ifdef and tcg_enabled()?  I would have thought just tcg_enabled().
>>
>> Are there declarations that are (unnecessarily?) protected?
> 
> No, you are right, tcg_enabled() is sufficient, I don't remember why
> I added the #ifdef.
> 
> Could I include your R-b tag without the #ifdef lines?

Yes.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

