Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pEudD-0007Sp-AT
	for mharc-qemu-riscv@gnu.org; Mon, 09 Jan 2023 11:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEudB-0007SI-Tu
 for qemu-riscv@nongnu.org; Mon, 09 Jan 2023 11:04:14 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEudA-0007OK-82
 for qemu-riscv@nongnu.org; Mon, 09 Jan 2023 11:04:13 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 b9-20020a17090a7ac900b00226ef160dcaso8341399pjl.2
 for <qemu-riscv@nongnu.org>; Mon, 09 Jan 2023 08:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hDSGGa2mIec3Z/Eyh62lHcxtXQEkdf79o5GxRHENBpg=;
 b=NK7ovHYk83SGT5W8AxUehZpsJBxiWqIYf7o00fwX8TL/105XEXLWFcNmK9zvV672Wf
 U9EgqxQPAabMNAw2iOqM27DOUuXtchuhyx56H3Iq6BJ04PN+enUrHnG4Q3dlGE/R0cdw
 mP4He7oqSuRJd7JbwNTpTpoAr3Mp6FU6J8SD0n+AkWYhWxzUnnqvzPyAGpuNyipWWrpu
 55yOGPaNveN1Uineys3qL1Gu88lLFdbMVpGTYxNeA2SheOFPWRE0azO6qJwbC5zuZ5uO
 hMqo+pAreKM644i56UUmDSL69KiU3BjJiT3LzqOJTSpaRZ8pM7DLYdETkWuWto9E6X1+
 YKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hDSGGa2mIec3Z/Eyh62lHcxtXQEkdf79o5GxRHENBpg=;
 b=7oU2v0DXN1e+TJWm8a8o1YeE5HuLTBTzd35nHG2UTuj2nJ6Wuef1mCVXzz2kB1j6lb
 o7dWPtAPDuVpUE7y9MUVTfD20dVdBWZDppsPVZiqZAx+VGNIa0ooTTmL/dRn5bQ1YVMh
 BudLh10mTvz97xKag6ztPPduTHvhqP96ksTCNb8wbR4oJlt2pEAPXGkzSonZq3XZy75D
 YB9uf8bWyaSYEEf51xVtRX7PH9/zd84gVgOXw6ZFbONgsgJBTUtNS/34i/Bn7NHyzDzA
 mW+FVCGET+I2sdA62esQkK7G4HE+ujefZlylO6g5EbmfVwwgUEij82/BQuLdUR7gCGVU
 sVSA==
X-Gm-Message-State: AFqh2krKhQMvwsPRuAK6FdO+upcT11Ry4zwsocErix3YTOk3ZQ6rNWCF
 acJugfEE8qBv13KjrJfGWxtMfw==
X-Google-Smtp-Source: AMrXdXt7BZfuJ0YeM8omzk6LQmFFl4tdlJYcllBNIitnocEwwps+zwwpnWRKg3lOLP66s4NstgMKzQ==
X-Received: by 2002:a17:902:9895:b0:191:282:5d72 with SMTP id
 s21-20020a170902989500b0019102825d72mr79790370plp.51.1673280250004; 
 Mon, 09 Jan 2023 08:04:10 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a1709027fc200b00192f9991e51sm6184362plb.251.2023.01.09.08.04.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 08:04:09 -0800 (PST)
Message-ID: <8d60f5b9-9fa9-2c21-d72e-609bfbaecf39@linaro.org>
Date: Mon, 9 Jan 2023 08:04:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/riscv: Use TARGET_FMT_lx for env->mhartid
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230109152655.340114-1-bmeng@tinylab.org>
 <6e3de50d-38d9-b5ba-dac4-91352be8b96b@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <6e3de50d-38d9-b5ba-dac4-91352be8b96b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 09 Jan 2023 16:04:14 -0000

On 1/9/23 07:47, Philippe Mathieu-Daudé wrote:
> On 9/1/23 16:26, Bin Meng wrote:
>> env->mhartid is currently casted to long before printed, which drops
>> the high 32-bit for rv64 on 32-bit host. Use TARGET_FMT_lx instead.
> 
> Oh, a 32-bit host user!
> 
>> Signed-off-by: Bin Meng <bmeng@tinylab.org>
>> ---
>>
>>   target/riscv/cpu.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index cc75ca7667..a5ed6d3f63 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -660,9 +660,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>               (env->priv_ver < isa_edata_arr[i].min_version)) {
>>               isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
>>   #ifndef CONFIG_USER_ONLY
>> -            warn_report("disabling %s extension for hart 0x%lx because "
>> -                        "privilege spec version does not match",
>> -                        isa_edata_arr[i].name, (unsigned long)env->mhartid);
>> +            warn_report("disabling %s extension for hart 0x" TARGET_FMT_lx
>> +                        " because privilege spec version does not match",
>> +                        isa_edata_arr[i].name, env->mhartid);
> 
> Could we cast it to vaddr instead? I'm trying to remove target_[u]long
> from hw/ and restrict it to the target/ directory. Per "exec/cpu-common.h":

This isn't in hw/, it's in target/.  And no, it's a target-width register.


r~

