Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVUFw-0007NV-0J
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 04:20:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVUFi-0007Lv-1V
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 04:20:32 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVUFg-0006wl-FO
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 04:20:29 -0500
Received: by mail-oi1-x22a.google.com with SMTP id bg11so15334203oib.5
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 01:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=00Xr2EdjkRhObpPpA6kTsrcisThtK3nb/77zsX5i1e0=;
 b=o8xtKlVLX6M7TGnItUeWmCItt+E1ap2Sd1xOTdDW7C5UPQnUVTN9siOnTUj/2WBl/A
 wlfPgIqF4j2x+MRxiEeAndlSv9wL9+RVtIk5gi9kweCOWk9t3gESPi1SPVfFwlx4D0mb
 PTbo+bLMa4FHf6M7P9V8/zlJRK8AUVQeAAnnw9NDQ27qFo+Zo81T6gkB2TVoSVoV2fpo
 uecOF94KkQbLOxpkYpRv/SADa1SUYUjmPyH26L4qJrtGVZRxdB1DAJ7I5BgOeaqyYTfR
 agCY8B+jW8i2rjJNZG0C3JHAvj4S0T4YgcP9D1cJA371vW6e7YrX/0s533wAyYT+EPyF
 XkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=00Xr2EdjkRhObpPpA6kTsrcisThtK3nb/77zsX5i1e0=;
 b=yBjU5X4B651njq+EB1rsl+8HN7jnl5ne518T6PvgjIL0GjiEC+fHIA975i27d8TQfN
 3j+o1eX8I1H+S65bq9zRMVPprZ/TGMJiqA4VDmJP813bNv4yiEJnrrYAKjt7y3Kr+VW+
 r9zS/m/0a9IRbXxOx3xK/YXZ07taIXBFBTjmTbKwN/aR+YDP0FAgblHqHJZJNWZC+kJP
 sHEZb3YPvlo/yj4VX2xEN5Z1EYSuVzmPIFWIGYucAND4uCg4eGRi+e7JKnKU92XvH/Oc
 15qsqwrJYpm7iSUzXAjHi6ltOjFkkU3lU1ZtkN4YZKL3jzt+4eN4wJLojjfeVAOUAMns
 kd/w==
X-Gm-Message-State: AO0yUKUqymgXoveinWIOGkI5qJFDMvM8fprCsMPP/UUvRpN3dMTTyo2u
 Eeh1mw641N4DaxMfcEiEbClkHg==
X-Google-Smtp-Source: AK7set+PC2bTesAoA5Z0Z4a12cc0rrsCvQ7jcp9OETTXpSLgwLkft/hPLoYL2ehzHYpPKLhhKzmizg==
X-Received: by 2002:a05:6808:6397:b0:378:375d:edc9 with SMTP id
 ec23-20020a056808639700b00378375dedc9mr3531013oib.45.1677230427081; 
 Fri, 24 Feb 2023 01:20:27 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a4ac609000000b004c60069d1fbsm3529160ooq.11.2023.02.24.01.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 01:20:26 -0800 (PST)
Message-ID: <ebd64364-0a1f-055f-91c3-acf90327cf4b@ventanamicro.com>
Date: Fri, 24 Feb 2023 06:20:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v7 1/4] tcg: add 'size' param to probe_access_flags()
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230223234427.521114-1-dbarboza@ventanamicro.com>
 <20230223234427.521114-2-dbarboza@ventanamicro.com>
 <78a0f5a5-c2da-c016-1f15-981cf80bf676@linaro.org>
 <d27b10d7-a98e-0f81-6e63-ee13cdcbaff5@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <d27b10d7-a98e-0f81-6e63-ee13cdcbaff5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-List-Received-Date: Fri, 24 Feb 2023 09:20:33 -0000



On 2/23/23 21:23, Richard Henderson wrote:
> On 2/23/23 14:19, Richard Henderson wrote:
>> On 2/23/23 13:44, Daniel Henrique Barboza wrote:
>>> +    if (unlikely(flags & TLB_NOTDIRTY)) {
>>> +        notdirty_write(env_cpu(env), addr, 1, full, retaddr);
>>
>> That '1' should be 'size'.  Fixed locally.
> 
> Hmph, well, that matches the interface, but it's only used to figure out how many pages to process, so any len that doesn't cross a page boundary (which we have checked) is equal bar the tracepoint.

I didn't touch that '1' because I figured it might not be related with how
'size' was going to be handled and any value > 0 would suffice.


Thanks,


Daniel



> 
> 
> r~
> 

