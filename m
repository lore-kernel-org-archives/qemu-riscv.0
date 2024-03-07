Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73B0C48BF6
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 14:55:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1riF9H-0001eE-KP; Thu, 07 Mar 2024 09:55:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1riF93-0001VW-4h
 for qemu-riscv@nongnu.org; Thu, 07 Mar 2024 09:54:53 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1riF91-0004JI-7c
 for qemu-riscv@nongnu.org; Thu, 07 Mar 2024 09:54:52 -0500
Received: by mail-pj1-x1044.google.com with SMTP id
 98e67ed59e1d1-299d3b09342so666500a91.2
 for <qemu-riscv@nongnu.org>; Thu, 07 Mar 2024 06:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1709823289; x=1710428089; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Oms6NqjkzEUyYaiJ7fG+Vq3lEerqyjhlXE29cWwJoZ0=;
 b=PP5BnBjG3sjxwhEVN36G7PQoprnmLZWZnpRCYi/lI6T4zD+mVLSUo6aLGKivXWGLcz
 E0pqqQuqGX5opKpMvnrwCKo5UUbEtUvcmwRo5oXLgX6FkCi2sRI5s8l3ax10J903FfUJ
 sHkT2Rnst7oFdRp2mVo0TFPgZCOr6uoN5p82quAz9wHIVlr4qeuN69uG02W+JuRFDuAs
 DvErJ3ifCRuuVAvqtOWb7tO6knp98zc5XtxhUGxMkS1faKF039u/4coX0kZAIsqvmh0/
 hUQ3K9yDQ6mvhLCJ574BHRjaY4276ovNkUuWQaeSAHrcr+LPj1EMVhmDbpf/k/rlrOc6
 94tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709823289; x=1710428089;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Oms6NqjkzEUyYaiJ7fG+Vq3lEerqyjhlXE29cWwJoZ0=;
 b=kN4kyhYu32H0fu+1QTorCB/9kZ7C5tn09KOojzTSXs/gXG1cePJs+sUNIY8Hp3Tx74
 SI93ROd/tD1RmCx0E7upCa/LKRtvT6hAh/D9dh5LpnwgO+NMZ5EjsO73Mbb0MmHuyqBT
 nGyCPw+2x/7hcduZ7MrGPV/TVp94/ihKLE/w/yJ5hzElcjsEpfaGpjUeLIwSlXdgZx6D
 HmgrVBgg7BD/vhGQvZxofPKx9MUbOrxB4znnlvvRohJrMSVaOd40rF4SlmzTewWE2I8O
 RifB0BQ+T07NnFv8o8Xx3XQCDRAKGy1HOfvK6ETbCGLTqPsp7wNvVUijBHNEN/QgegsH
 BEXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgLyBwvaIwPfmLxVujZhJpF7u8Blq0s7ppjC+i+N8i1p86lYqCDcvE/D8Yk2nFJ7d19evpG19jM9++sTvRT5qmVS2IW6s=
X-Gm-Message-State: AOJu0YzDH4mzdGuaUUA4SRqVRCneLxuy8sw63+VMeGSvJsaOOI0ZNuu0
 MuWW9uEYV8ZwAOFA1VSilsbHuqqVeo6hcsSUBcqQzJDlJdiwPlSpvvKWaNnrjp0=
X-Google-Smtp-Source: AGHT+IGWe13Bj6DO8kJXxNG28L7AF4P0SccTo8h7CKv7i3Q57w/Kp+gxIZ706eaVo/nag6PmGJAsTw==
X-Received: by 2002:a17:90a:d996:b0:29b:3527:8c1d with SMTP id
 d22-20020a17090ad99600b0029b35278c1dmr13279502pjv.15.1709823289576; 
 Thu, 07 Mar 2024 06:54:49 -0800 (PST)
Received: from [100.64.0.1] ([136.226.240.169])
 by smtp.gmail.com with ESMTPSA id
 jj21-20020a170903049500b001d717e644e2sm14683488plb.247.2024.03.07.06.54.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 06:54:49 -0800 (PST)
Message-ID: <60931dcf-5dee-628f-f5ab-b3f148500e25@sifive.com>
Date: Thu, 7 Mar 2024 22:54:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] target/riscv/vector_helper.c: Avoid shifting negative in
 fractional LMUL checking
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20240306161036.938931-1-max.chou@sifive.com>
 <99a59762-105a-4982-9c93-ce3e3e242152@ventanamicro.com>
Content-Language: en-US
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <99a59762-105a-4982-9c93-ce3e3e242152@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x1044.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.08,
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

Looks liked that I missed this one.

Thank you Daniel

Max.

On 2024/3/7 1:17 AM, Daniel Henrique Barboza wrote:
>
>
> On 3/6/24 13:10, Max Chou wrote:
>> When vlmul is larger than 5, the original fractional LMUL checking may
>> gets unexpected result.
>>
>> Signed-off-by: Max Chou <max.chou@sifive.com>
>> ---
>
> There's already a fix for it in the ML:
>
> "[PATCH v3] target/riscv: Fix shift count overflow"
>
> https://lore.kernel.org/qemu-riscv/20240225174114.5298-1-demin.han@starfivetech.com/ 
>
>
>
> Hopefully it'll be queued for the next PR. Thanks,
>
>
> Daniel
>
>
>>   target/riscv/vector_helper.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
>> index 84cec73eb20..adceec378fd 100644
>> --- a/target/riscv/vector_helper.c
>> +++ b/target/riscv/vector_helper.c
>> @@ -53,10 +53,9 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, 
>> target_ulong s1,
>>            * VLEN * LMUL >= SEW
>>            * VLEN >> (8 - lmul) >= sew
>>            * (vlenb << 3) >> (8 - lmul) >= sew
>> -         * vlenb >> (8 - 3 - lmul) >= sew
>>            */
>>           if (vlmul == 4 ||
>> -            cpu->cfg.vlenb >> (8 - 3 - vlmul) < sew) {
>> +            ((cpu->cfg.vlenb << 3) >> (8 - vlmul)) < sew) {
>>               vill = true;
>>           }
>>       }

