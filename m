Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A65C43458
	for <qemu-riscv@archiver.kernel.org>; Sat, 11 Jul 2026 16:52:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiawB-0003vt-Do; Sat, 11 Jul 2026 12:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiawA-0003vS-Ky
 for qemu-riscv@nongnu.org; Sat, 11 Jul 2026 12:52:22 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiaw8-0005Dt-2n
 for qemu-riscv@nongnu.org; Sat, 11 Jul 2026 12:52:22 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-383cb94f742so1631479a91.3
 for <qemu-riscv@nongnu.org>; Sat, 11 Jul 2026 09:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783788738; x=1784393538; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=nefIjTWKSN7IYNh5mubqdUhbFGrCxOtboRLZ3Plmug4=;
 b=POAhqcC8LB4+RsivEmssD2nuLbWXmAuGUhcU5pHyyTfYT00XCWuyO7gmW6K8V7lCWM
 lLipKP9FWgSWet8D80juoRbKIE4che5hQuKymRo81nc/zCYIolKvM+L+8zP+zeq52xLu
 KYBgggQ44BdMs13PKIpet0HX2RVLruDZIzVDeXmtl8ezRyReFrbsAc/5QCD358YexvsT
 PyXE5p+FtoR1CsPuCvotlWKMGf1GWv1MXQ6fqGnRA9+nz9iHwPuerugs4oxf/z53rXHG
 UXDHvkKRaehbG+ArlkJovo5PoYYpLVz3tHijYOwnxKwPYcIHiqj8xCEPC5bP9Z4d90vx
 ExIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783788738; x=1784393538;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nefIjTWKSN7IYNh5mubqdUhbFGrCxOtboRLZ3Plmug4=;
 b=aRWr7BzeNGPnqdwLi8IhML24CWerk+l8NSfexdKwmQzSNwPD4bzdpQw59Ps0c8rPaA
 GaX3ma6CW5Gcifd0NLk52YUftBaHpA2m6nerGpGIjSblHonv1BQGS6NoCe5B0E/2SH7y
 SlFMAUxMttdF+Ryx31WVFUVaI8UfpiJRbDTcef/oRyBew+wjuIknkzdO0F2lTtyeEI+r
 BKg85DZXCob8pVSnmvK9c+72ZkMlsaeXRicfCtz8atcY0ORhnPk1YUbcB2YPV1Kg+3hy
 AiMdiRgGYF2LluhlCbXb0FiwlCVw57RSh69+XXm1qDkrjQzcaZ2U2cA8kbS1BumTWnTi
 Tfdg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpJO9kio2RdfwZi5mOf9lkRFchx4cyInucREbvqBJDpWLkN6bJWTqBNEy2Xcx5+gPDd3iTQwtI9qoam@nongnu.org
X-Gm-Message-State: AOJu0YzpCQwH5u9HXtvXHVXtPLUZGWEWCKeD2T8efxTSLHKbw1bnYh7g
 5Ea80eLPuAREQ6gp4z68C4bs5M5SfDdOoBh2czpbnYBTm696ZxmH/1kGBFxOOTMSfdQ=
X-Gm-Gg: AfdE7cnvUDbq+xY1kYZ6HHixtUsCKWdrpx+0tjDuPy15sHCtmqGTPaYzQ00jj2TVugC
 1SYJOvM3ctzfHh9rCtRIW7smASGO0Y0VcSaPjnXJgwUmCJgDCIdOV7REqZQDvKACZ6AGek4cw4C
 kcK6hsc6VI0Sb6X0bCIV2eHWFwFPRCXzLrhYcf7Fxx1u2u6qbueiVAlGNVOpJ8nG15UrZbQrgOf
 4RqLg2iRN0+F2hJ2jCdbXw5kiU/j6kY7kmSaPJn164Rtz3Vsl0OXO4tr+YFcqeagveKI3XhV/Do
 Mp+BDctpeAqBAoWyCfiZ6RIUdrZNE/oCX0t/9RBwDfAPl+emzrNMI/gLJIwnZmdseQGwDKPYYop
 orVAbYD1y8Lsuds94gFCF8XFa8RvhY7Hkin2vyFZKlpQT9ofh6B6aUSHr0CdpgdLzNRir2/it6v
 2TfBABwA/k4agz2qyQz45WdXwtLw==
X-Received: by 2002:a17:90b:1c91:b0:380:534f:58c2 with SMTP id
 98e67ed59e1d1-38dc7b81c27mr3067888a91.30.1783788738173; 
 Sat, 11 Jul 2026 09:52:18 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.146.49])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38a583a16c2sm4194226a91.13.2026.07.11.09.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jul 2026 09:52:17 -0700 (PDT)
Message-ID: <8e9907db-68b6-4644-9c16-6fbbbcd52b0b@linaro.org>
Date: Sat, 11 Jul 2026 09:52:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 33/51] target/ppc: Simplify
 ppc_cpu_debug_check_watchpoint
To: Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-devel@nongnu.org,
 Shivaprasad G Bhat <sbhat@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-34-richard.henderson@linaro.org>
 <bf1b73da-919c-4b02-8b46-78b939077610@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <bf1b73da-919c-4b02-8b46-78b939077610@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

On 7/11/26 03:54, Harsh Prateek Bora wrote:
> + Cedric, Shiva
> 
> On 11/07/26 2:23 am, Richard Henderson wrote:
>> We don't need to check either ISA bit, because that's already
>> done starting with SPR registration.  Replace target_ulong with
>> uint64_t, as we're under TARGET_PPC64.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/ppc/tcg-excp_helper.c | 30 +++++++++---------------------
>>   1 file changed, 9 insertions(+), 21 deletions(-)
>>
>> diff --git a/target/ppc/tcg-excp_helper.c b/target/ppc/tcg-excp_helper.c
>> index 99ffe4a820..4065440949 100644
>> --- a/target/ppc/tcg-excp_helper.c
>> +++ b/target/ppc/tcg-excp_helper.c
>> @@ -353,35 +353,23 @@ bool ppc_cpu_debug_check_watchpoint(CPUState *cs, CPUBreakpoint *wp)
>>   {
>>   #if defined(TARGET_PPC64)
>>       CPUPPCState *env = cpu_env(cs);
>> -    bool wt, wti, hv, sv, pr;
>> -    uint32_t dawrx;
>> +    uint32_t dawrx = env->spr[wp->id ? SPR_DAWRX1 : SPR_DAWRX0];
>> +    bool wt = extract32(dawrx, PPC_BIT_NR(59), 1);
>> +    bool wti = extract32(dawrx, PPC_BIT_NR(60), 1);
>> +    bool hv = extract32(dawrx, PPC_BIT_NR(61), 1);
>> +    bool sv = extract32(dawrx, PPC_BIT_NR(62), 1);
>> +    bool pr = extract32(dawrx, PPC_BIT_NR(62), 1);
>> -    if ((env->insns_flags2 & PPC2_ISA207S) &&
>> -        (wp == env->dawr_watchpoint[0])) {
>> -        dawrx = env->spr[SPR_DAWRX0];
>> -    } else if ((env->insns_flags2 & PPC2_ISA310) &&
>> -               (wp == env->dawr_watchpoint[1])) {
>> -        dawrx = env->spr[SPR_DAWRX1];
>> -    } else {
> 
> Previously, there were different ISA version checks resulting in different behaviour, now 
> with this change we are allowing for both ISA versions. Not sure if this would be an 
> expected behaviour?

Per the commit comment, the ISA version checks are done when registering the system 
register.  One cannot write to DAWRX1 unless ISA310, and therefore dawr_watchpoint[1] will 
not be set nor wp->id be 1.


r~

