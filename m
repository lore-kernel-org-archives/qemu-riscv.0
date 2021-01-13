Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kziOc-0001dg-Id
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 10:49:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kziOW-0001a3-H0; Wed, 13 Jan 2021 10:49:16 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kziOU-0007SV-Mq; Wed, 13 Jan 2021 10:49:12 -0500
Received: by mail-wr1-x435.google.com with SMTP id t30so2651233wrb.0;
 Wed, 13 Jan 2021 07:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E3wtd3qw+as/QhriapeELz91lcwVZj53Ki+3VVGHMIo=;
 b=lRERm5/a6+e0PR7yITwbZz0zBMitGnOHodpIAzsmy5hUnTLynr5H5AMwf6YagyvQNf
 vZdZlqpf/fsrKs6qBWIssLILvIqGWl66l15Ha3f7UJ+7ywwqJQQj+zqgyvW7dRw/jNiA
 uWblShfWz75D8odJGXhfZcmqtkZzxGvgZZERhnUCjooZN1sme9IYB/WwJQ6TSYaRHxYh
 Sj1xkcjtqomO+irafd8SI04pVE1bJvi83p+sTCSYpsV6lKyqTFLiHsSsoFMzMKjq0FRU
 vvpD+dErypWnPqKLsHUPJU3Xlexpq/nVOAXoi3rq7H2n9o/G51wEQUACkv3Mmw9t9YaC
 r1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E3wtd3qw+as/QhriapeELz91lcwVZj53Ki+3VVGHMIo=;
 b=Gnvr/J6S2R8bPwKiwt/rZNcSowfrPxs+q3Zu4yIeVwvSXv57zXA0Yuzs5Fxd0zhdxT
 PuGlqD5DO7oMaNRq/zMs2DqR/RWG+lVwlafoQiAS/dAWIATh3H38P7ME3lE8qVyc0NeQ
 sKG9pw8mmHtjCSHVHl7AlnvC9ZlJdF/z3YTwHUndCa5vL9fbYqUEUktszrYBaOPNI5Ud
 Vz9CpSQV/oJlLQt3mxXh1BvxA5msap9mr+V6e7jag7WJcL4+YTIJGg5m2Mkq3M3Nn8Ko
 m02VbgZTvdCywtx/FSP8msVz5hbYL/pZ+Td6s81cX9tjYvKyaYVDvgQbq622Lxd3IbZm
 WCAg==
X-Gm-Message-State: AOAM53091cyo0i2q9zFcYO8UGK3deIVHFuNn/Ys9yjJy1KGtHKuX7DxR
 oLiV27kFXYNMugq2lW701Rs=
X-Google-Smtp-Source: ABdhPJwET/K9IzbD8Ledf8orVIZKqRYZ2BFiTBrSXQDL2phDXJgYeYbGB8Cr6N/WJ2gpomW5iq8CRQ==
X-Received: by 2002:adf:dc87:: with SMTP id r7mr3293743wrj.305.1610552948124; 
 Wed, 13 Jan 2021 07:49:08 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id o14sm3721342wri.48.2021.01.13.07.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 07:49:07 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 2/5] tcg/ppc: Hoist common argument loads in tcg_out_op()
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
 Miroslav Rezanina <mrezanin@redhat.com>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-riscv@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, Thomas Huth <thuth@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210111150114.1415930-1-f4bug@amsat.org>
 <20210111150114.1415930-3-f4bug@amsat.org>
 <fa4c5ea6-3ca6-6aa4-6dea-5b400bc7ccd1@amsat.org>
Message-ID: <7baba218-340a-9426-6933-0024e0d4110d@amsat.org>
Date: Wed, 13 Jan 2021 16:49:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <fa4c5ea6-3ca6-6aa4-6dea-5b400bc7ccd1@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jan 2021 15:49:17 -0000

On 1/13/21 4:25 PM, Philippe Mathieu-Daudé wrote:
> On 1/11/21 4:01 PM, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  tcg/ppc/tcg-target.c.inc | 294 ++++++++++++++++++---------------------
>>  1 file changed, 138 insertions(+), 156 deletions(-)
> ...
> 
>> @@ -2818,10 +2805,9 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
>>      case INDEX_op_bswap32_i32:
>>      case INDEX_op_bswap32_i64:
>>          /* Stolen from gcc's builtin_bswap32 */
>> -        a1 = args[1];
>> -        a0 = args[0] == a1 ? TCG_REG_R0 : args[0];
>> +        a0 = a0 == a1 ? TCG_REG_R0 : a0;
> 
> Oops... Here is probably the regression reported by Miroslav,
> I shouldn't have changed this line, simply remove the a1

Oops^2, wrong hunk =) Following one...

> 
>>  
>> -        /* a1 = args[1] # abcd */
>> +        /* a1 = a1 # abcd */
>>          /* a0 = rotate_left (a1, 8) # bcda */
>>          tcg_out_rlw(s, RLWINM, a0, a1, 8, 0, 31);
>>          /* a0 = (a0 & ~0xff000000) | ((a1 r<< 24) & 0xff000000) # dcda */
@@ -2830,12 +2816,12 @@ static void tcg_out_op(TCGContext *s, TCGOpcode
opc, const TCGArg *args,
         tcg_out_rlw(s, RLWIMI, a0, a1, 24, 16, 23);

Here, is the line I shouldn't have changed:

         if (a0 == TCG_REG_R0) {
-            tcg_out_mov(s, TCG_TYPE_REG, args[0], a0);
+            tcg_out_mov(s, TCG_TYPE_REG, a0, a0);
         }
         break;

(multiple occurrences).

