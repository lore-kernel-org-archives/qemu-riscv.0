Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ptNsm-0001ub-H9
	for mharc-qemu-riscv@gnu.org; Mon, 01 May 2023 03:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptNsl-0001uK-Kc
 for qemu-riscv@nongnu.org; Mon, 01 May 2023 03:23:35 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptNsj-0001P7-W0
 for qemu-riscv@nongnu.org; Mon, 01 May 2023 03:23:35 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-2fa36231b1cso1228177f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 01 May 2023 00:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682925812; x=1685517812;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QkEQYBpga+gb0GKmst2KRP17ziGBhkAyFxuigIpKMwA=;
 b=WEbbnNDOXQnprcdBmQS/bKjVG0pq87SF4YSOlII+wtSqkEV/2rgerD2lyHCq2Z27jO
 /nPBlbK9Y2Tr5xUcil5KhZoFGy6fnkgi3q0o394y6YcT/jdqhi81/QNF5BpRsxY/+VEn
 USEr6XJSfmnXUFHRec5VwljSYB1KgUZ+PUAbdpJGJRiEwcp/LwzfnoVw1ruMaETNJOhD
 T31+My4NG3PjqldCCjQerl+Mg9qm62RC2EywJkX6ltdUnWGM1E2lVoZjtOxw2jWxSee5
 nPh+4OydNgkDd5VqDUBX1qTse9/jdWOgFwP82afxzPeGmUmUCYfI+QxHycsJYsSCt869
 U+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682925812; x=1685517812;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QkEQYBpga+gb0GKmst2KRP17ziGBhkAyFxuigIpKMwA=;
 b=F9akdnKYCgKTrmJ/yvA4UZwjDocEQpJheOww6MDI4dT9kZ4XG5FtyalGIHeYlPdoBP
 rnkjdad8JvDcFljQi7Wo7b+LqQyVtW+tZhP/8z388OmoiFX62Kuij2bxrgsB1ZnLVhnO
 QS9gZ39s37BnNF2EJS1PCG4JIx6dDnAzOeubZNa0mi4cmgsDW0Lww8dj0F8ej7soEpVq
 CVLp7JAAFkxICiwXmbsOjSYloOgHy1pQcEl7EtsluQFjYQqA1kOANIByWbe/OqFnjvdm
 xleoqW7jIzMrlAjtLc5iAdX1mL6rLdbVWmmMvChV5ogLhBRNAINGuOdrfSonT0h8jY1U
 sJUg==
X-Gm-Message-State: AC+VfDyIb88cuPmCEqwpXx7y9UjLOUiHmzPDU0VNIb+o/Ox49p3az0oN
 5hX4Cfb6tLvGgSHau3uhh2b16w==
X-Google-Smtp-Source: ACHHUZ7Mmm+T5R/RCvzFDH+azY5HX+RvaydIT/iY26Btu3/8ORREEaOKwBwUuefP2AKNA2F0zxMZdg==
X-Received: by 2002:adf:ef8f:0:b0:2f8:e190:e719 with SMTP id
 d15-20020adfef8f000000b002f8e190e719mr9699690wro.65.1682925811845; 
 Mon, 01 May 2023 00:23:31 -0700 (PDT)
Received: from [10.175.90.180] ([86.111.162.250])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a7bc045000000b003f32c9ea20fsm7087316wmc.11.2023.05.01.00.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 00:23:31 -0700 (PDT)
Message-ID: <5e6e4294-6b29-79d1-4054-48748256f843@linaro.org>
Date: Mon, 1 May 2023 08:23:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 54/57] tcg/ppc: Remove unused constraints A, B, C, D
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-55-richard.henderson@linaro.org>
 <ad6f28e8-e60e-ace4-5eaf-b754e8ac36c8@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ad6f28e8-e60e-ace4-5eaf-b754e8ac36c8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
X-List-Received-Date: Mon, 01 May 2023 07:23:35 -0000

On 4/29/23 13:29, Philippe Mathieu-Daudé wrote:
> On 24/4/23 07:41, Richard Henderson wrote:
>> These constraints have not been used for quite some time.
>>
>> Fixes: 77b73de67632 ("Use rem/div[u]_i32 drop div[u]2_i32")
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/ppc/tcg-target-con-str.h | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
>> index f3bf030bc3..9dcbc3df50 100644
>> --- a/tcg/ppc/tcg-target-con-str.h
>> +++ b/tcg/ppc/tcg-target-con-str.h
>> @@ -10,10 +10,6 @@
>>    */
>>   REGS('r', ALL_GENERAL_REGS)
>>   REGS('v', ALL_VECTOR_REGS)
>> -REGS('A', 1u << TCG_REG_R3)
>> -REGS('B', 1u << TCG_REG_R4)
>> -REGS('C', 1u << TCG_REG_R5)
>> -REGS('D', 1u << TCG_REG_R6)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Is the J constraint introduced in commit 3d582c6179
> ("tcg-ppc64: Rearrange integer constant constraints")
> ever used?

Nope, not anymore.  Used to be for and/or/xor, now replaced by more general constraints. 
Will remove.

r~

