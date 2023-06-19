Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870F2C0015E
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 10:46:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBCOe-0002u0-Qt; Mon, 19 Jun 2023 06:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBCOY-0002ro-46
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 06:46:02 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBCOW-0004sr-9O
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 06:46:01 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-51a200fc3eeso4612463a12.3
 for <qemu-riscv@nongnu.org>; Mon, 19 Jun 2023 03:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687171558; x=1689763558;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=27eyYafjxwn1v204AEUHoAoSFDioWIeiQktJS2DqrkM=;
 b=SFMh5MvWKYMvW/HURT4GZhyOju/OFhrEc36hwy2NzFYnEJw19lYO/SI50BFrhqFamx
 5LR5i2/rE36nDVmnasHhFLalGeYXj0ovVX0LMZfQP4vNx480AaBwO5Cm3sNXj8ILdjri
 gJnOxKfXrggywmL+R7rWG2uGW0XmsHDzqgMeoXeI8DYao9fBxYghJwyS4jaeksxvq+cr
 9RcLySgwl87Tz3SR1RRAjrHctxQEt0fqdA0BPG3ygdO/IA0YzDK7z3R+IL5J+hV01IbM
 BDvSIQHYlhR73+uKPSBJmSt8urKw7dfdY9jh6Cy5r51MHj0LVYe3wTKDzOQPnqe08iMu
 POvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687171558; x=1689763558;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=27eyYafjxwn1v204AEUHoAoSFDioWIeiQktJS2DqrkM=;
 b=j2IExGY+HRvZlj+9nI/s1KFumMsYyABDOASRgSKQ0Qii1OTczbLd0Nc0vl8rbQQtt/
 YvghDcys4CbbSILTehg2SMeCelwMPr9nh46/tREKNy7oK/kuS+qS9jxrghtJ15t5ker1
 tfzsg0JvmrM9DRDk6dW6exOhsjx6krQyLpIkJmurrft4YyL0dAkuyomvPeDk+HEYaByZ
 4SkLYRO7J79qOpo7dQhHQX0nSkQZiM7kQczPCLuF/YQkCgjGTv7+yhg1i2M5RkRZ6bbs
 t28pgCfgPKXmylUp2WoRnE5eqdnZa4AnOS+MeBPvdRCWWmkZXplIOewvj/89NaLePFf4
 oBfQ==
X-Gm-Message-State: AC+VfDzu7E1Xu2IRFNx1HhjumY8jJLAFY4d1HFVciu9ZKghfa+fG3GK6
 aEd0qg3rvomFLwUaIAqfsuxjpw==
X-Google-Smtp-Source: ACHHUZ4ZzYTuEvhpUBPLWNc/ZvLWXriUAbbbo0wHXv7/i3PepCfpzE6XO5lebZCoGFhPx5aGa+NGnA==
X-Received: by 2002:aa7:d912:0:b0:51a:3e94:b567 with SMTP id
 a18-20020aa7d912000000b0051a3e94b567mr5933113edr.11.1687171558425; 
 Mon, 19 Jun 2023 03:45:58 -0700 (PDT)
Received: from [192.168.69.115] (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 s13-20020aa7cb0d000000b005163a6c9f18sm12747004edt.53.2023.06.19.03.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 03:45:57 -0700 (PDT)
Message-ID: <de85a0fe-9cff-74e3-464e-98667cf41fcf@linaro.org>
Date: Mon, 19 Jun 2023 12:45:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 07/38] target/i386: Use aesenc_SB_SR_AK
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-8-richard.henderson@linaro.org>
 <1e32947f-7498-9db3-1912-dd3847f4aa0a@linaro.org>
In-Reply-To: <1e32947f-7498-9db3-1912-dd3847f4aa0a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
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

On 19/6/23 12:43, Philippe Mathieu-Daudé wrote:
> On 9/6/23 04:23, Richard Henderson wrote:
>> This implements the AESENCLAST instruction.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/i386/ops_sse.h | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> 
>>   void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg 
>> *v, Reg *s)
>>   {
>> -    int i;
>> -    Reg st = *v;
>> -    Reg rk = *s;
>> +    for (int i = 0; i < SHIFT; i++) {
>> +        AESState *ad = (AESState *)&d->ZMM_X(i);
>> +        AESState *st = (AESState *)&v->ZMM_X(i);
>> +        AESState *rk = (AESState *)&s->ZMM_X(i);
>> -    for (i = 0; i < 8 << SHIFT; i++) {
>> -        d->B(i) = rk.B(i) ^ (AES_sbox[st.B(AES_shifts[i & 15] + (i & 
>> ~15))]);
>> +        aesenc_SB_SR_AK(ad, st, rk, false);
> 
> Why not use aesenc_SB_SR_AK_gen(ad, st, rk)?

Whatever, I misread the last 'be' boolean as 'swap', so this is perfect.

> Regardless:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
>>       }
>>   }
> 


