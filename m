Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmZ1O-000126-UE
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 07:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmZ0t-0008Nk-HM
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:51:49 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmZ0k-0004Ci-5O
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:51:44 -0400
Received: by mail-wr1-x42f.google.com with SMTP id e22so10510137wra.6
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 04:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681300292; x=1683892292;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p+t5roRD0VBzwL69wpicdvZbXw5UhpMxUImy4QhiLOs=;
 b=ctz61KFxeVBZuS31M8KbhSUpbJoUbb8XkkBwhoOOFEssoZv8Z3g01W1Q36KLWBerIm
 ltII9yAhmcxBQSfedTbIkFag25vKodWAk/z8+4OO7peJg+Pz2Drhis6yG5+M3ElMFTYI
 r0oimXNWJp/C9Z6lTfrCJaQXmPokZWGFcM4MPjMtvbBodrSh+I4Oem5iXMxN+8QlfW01
 xl0vpD8/Aubi+uAPp4m4Zw8xAwRTBzw9zSpCCOvi6RJdSXEQLxVaIDPqZykW3a+AR1V5
 +TUMikZTWAZgvxtm8fE8k0nm0GoXDQkcib0vvZwAgSuAtJ0oyO9ZIU3IE+AwBnKBRdNo
 e7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681300292; x=1683892292;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p+t5roRD0VBzwL69wpicdvZbXw5UhpMxUImy4QhiLOs=;
 b=GEJu1Q24f/JV1FQGr67PQCfxHUyYueWrmcQCcxFO3GJnoTfxd0KyNUejMD/Mm3k/YR
 I/2nvaUQNIwcD1lna4QY8dlvY+xmwO4WMVFvLy4ynjdSs1k1FlzLZPcuPS68dOMSP7Ds
 wFnnj+4B1NylbCBVKHCQ5F15KkRAlHzRy4/V/P6tmTr8cNw2Dxvkw24IDsjc8tYp/802
 tNtfdorY5d+ufNiuk5GFX7SQUWk6nMe/p3e+rbuDJ/P1lAYNeMa5ogoVXoZVH4iSXXyh
 y9NT8q4MxuCOwmlteqw4DWRs4g2QA5pHHLeFoLRBxwJRfeIdL5ArDN4onPJo60jIDhFZ
 zu5g==
X-Gm-Message-State: AAQBX9eNlL/MqbnnAJlGkfB1xcrm+dFkq5usYYi2vSzu4aN9BGKUQX3W
 XHT2Fh15fDooAVlJ93JLDNb3nw==
X-Google-Smtp-Source: AKy350ZJFYCQ14G6i9AABWXomscUK1ftNdtwiGcUvP3E8bOJrhu8Sk9XhyF7amrrkL6bIYEkju74wQ==
X-Received: by 2002:adf:f909:0:b0:2d2:f3e3:115d with SMTP id
 b9-20020adff909000000b002d2f3e3115dmr12415838wrr.59.1681300292155; 
 Wed, 12 Apr 2023 04:51:32 -0700 (PDT)
Received: from [10.0.2.69] (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 w11-20020a5d680b000000b002da75c5e143sm17024018wru.29.2023.04.12.04.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 04:51:31 -0700 (PDT)
Message-ID: <27494b72-1fe4-6fcb-3f2d-ebf94b53dc22@linaro.org>
Date: Wed, 12 Apr 2023 13:51:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 20/42] tcg/i386: Use TCGType not bool is_64 in
 tcg_out_qemu_{ld, st}
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-22-richard.henderson@linaro.org>
 <24065205-6919-378f-8e97-4754befd49f4@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <24065205-6919-378f-8e97-4754befd49f4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.083,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 12 Apr 2023 11:51:59 -0000

On 4/11/23 14:12, Philippe Mathieu-Daudé wrote:
> On 8/4/23 04:42, Richard Henderson wrote:
>> There are several places where we already convert back from
>> bool to type.  Clean things up by using type throughout.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/i386/tcg-target.c.inc | 35 +++++++++++++++++------------------
>>   1 file changed, 17 insertions(+), 18 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

Thanks, though there is now a v2 patch set which does not contain this patch, or some 
others you have reviewed in the last days.


r~

