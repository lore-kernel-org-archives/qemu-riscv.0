Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F603C001B0
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 16:05:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTPCS-0002bs-VY; Tue, 08 Aug 2023 12:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTPCI-0002Ta-GO
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 12:04:38 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTPCG-0005w4-IL
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 12:04:38 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-686e0213c0bso4204642b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 08 Aug 2023 09:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691510672; x=1692115472;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w4MXxugO4lsDbRuMeAk6J+79QpXfOwfDex5Oq3uNbBQ=;
 b=ftm+pQvC8jW22VQn3Yjn2cUWayhMJxCCk/YIQqnTrri7bMV6ntcUm1ws5oV2RCOJFd
 y/JOT/R3s+ebPGoTIwfGoNzkEEEkzrfNGiBgg/4ytEtf8ax//Wb/4Irr2y7Py0JYxM5v
 d7KlTykaNCKLIQhYdAzhK2po/6gzv3TfBLdL0azQRpdsbgibrsaslUpDeVUvaTmAC1qN
 2/1CsURoK4xTL0/YqqeVRYE17mlBmvG5w+yBgOIyNOYKlq/Kc96TmiBKKCJwSRkSaVcX
 jiORclbORjYxJx1AjrxwCs96nOYz7VD1hEUjK28UktMiXAFLJbaGwetLeAI0p4WpkyQr
 HdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691510672; x=1692115472;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w4MXxugO4lsDbRuMeAk6J+79QpXfOwfDex5Oq3uNbBQ=;
 b=J/lmUPTyV07la/6I4SggRiXQBTlpbOpI5KjBMv+CWbg7OCKXN1VzcJhTz3yxFlA605
 GI1lPIsyYb4PhH2Vj/XNMfa3N/Oe0TdbewVbMwiH74WxGkoF75UjwOgqD4TGe4KRN1hI
 MPlCSOrnOPevzdVYufdLDGYN7B+wFMhSP8qebPqB3kyTUT2e3y222osSr3uJ4N9JeMzB
 G7SCMVicKP35PFURpEw7PWmDgFuczxuElnT0F7ZAY2qINE2auEkvuYEAnXLB+nuvwlYg
 TDHJ1z5j8vcb3QSZnCIypElu3oA4A45O5F7MrfenBQEiHf6hBlKC6eUoZFk2MXwQSBxt
 7Tww==
X-Gm-Message-State: AOJu0Yy22O1OiFioznWH7JJeUWTxaPof0A1VhCckwJkNV0oV4W2Mwqzj
 /XNXtYBmpG68dOSbU2H/CbcwiQ==
X-Google-Smtp-Source: AGHT+IG3a4DMGhDAyiTWKT3n3NQU4zZE3w0Nw2r9dfKS6/nWp+HS7cLAK4cIfAK5dQ2evcE7Tpjlxg==
X-Received: by 2002:a05:6a20:3d84:b0:138:60e:9c4 with SMTP id
 s4-20020a056a203d8400b00138060e09c4mr13249563pzi.23.1691510672480; 
 Tue, 08 Aug 2023 09:04:32 -0700 (PDT)
Received: from ?IPV6:2602:47:d490:6901:63dc:2a47:f4bc:4a95?
 ([2602:47:d490:6901:63dc:2a47:f4bc:4a95])
 by smtp.gmail.com with ESMTPSA id
 b14-20020aa7870e000000b00687790191a2sm8270302pfo.58.2023.08.08.09.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Aug 2023 09:04:32 -0700 (PDT)
Message-ID: <2f65a947-cad1-b292-51f8-5af58596d7d7@linaro.org>
Date: Tue, 8 Aug 2023 09:04:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 02/24] tcg: Use tcg_gen_negsetcond_*
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-3-richard.henderson@linaro.org>
 <CAFEAcA8ORUejjC3iVdjYSkX1St6ntxXbDPtTC0tuv5C_5rQ8xQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8ORUejjC3iVdjYSkX1St6ntxXbDPtTC0tuv5C_5rQ8xQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.14,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=unavailable autolearn_force=no
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

On 8/8/23 08:55, Peter Maydell wrote:
> On Tue, 8 Aug 2023 at 04:13, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/tcg-op-gvec.c | 6 ++----
>>   tcg/tcg-op.c      | 6 ++----
>>   2 files changed, 4 insertions(+), 8 deletions(-)
>>
>> diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
>> index a062239804..e260a07c61 100644
>> --- a/tcg/tcg-op-gvec.c
>> +++ b/tcg/tcg-op-gvec.c
>> @@ -3692,8 +3692,7 @@ static void expand_cmp_i32(uint32_t dofs, uint32_t aofs, uint32_t bofs,
>>       for (i = 0; i < oprsz; i += 4) {
>>           tcg_gen_ld_i32(t0, cpu_env, aofs + i);
>>           tcg_gen_ld_i32(t1, cpu_env, bofs + i);
>> -        tcg_gen_setcond_i32(cond, t0, t0, t1);
>> -        tcg_gen_neg_i32(t0, t0);
>> +        tcg_gen_negsetcond_i32(cond, t0, t0, t1);
>>           tcg_gen_st_i32(t0, cpu_env, dofs + i);
>>       }
> 
> Is it not possible for the optimizer to notice "you did
> a setcond followed by a neg, let me turn it into negsetcond
> for you" ?

Not at present, no.  That sort of peephole optimization is a bit more difficult than what 
we do at present.


r~


