Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgv89-0006Gy-0Y
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 18:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgv80-0006G7-8v
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:15:48 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgv7y-0000y8-M0
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:15:48 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 k14-20020a9d700e000000b0069faa923e7eso5375775otj.10
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 15:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679955344;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rtw9gHV6mdR8gX9XHlLFMKjsydb6YJnOaKLb1TGPd2s=;
 b=CmTSh3T6gwjwkB8A+7Wz1M95vl1Tc8sCyNjdfKAjTEAHJmIxd8UGKb6IihfiK2hhe9
 m5ujrLDO8gRzU/5lQ00tuxQa3tjKDo4Rmk+mXtAjXSoZAuZISGT3/RlCfzqPfjV8iB7v
 Rrue+jZKPZ4eDJekPogR4ihabnIUHfppvFaIj8nv7EqCGsTAu8soycFJsWRTFa2FojTZ
 olbyyawt6q04MSXqs2SWnbbIvv+Jui5zde+dxABWlD9djF9ffSykk+FtazBYoZ7MINeb
 DAiZCiV7udWOBRl8k5kN1K7i9R89BLIHjKr85DE/RhPUVneUlEH7Gq2EEOCdrE/6rAvA
 xGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679955344;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rtw9gHV6mdR8gX9XHlLFMKjsydb6YJnOaKLb1TGPd2s=;
 b=BGTN8PW3SG3viLfFCxhxmWVecmW3DrfL904XRqf+KZ1RQrGH9rX72ubvZtNcCS8ekx
 HKYjT1UT7dOFFKzqpecJjjaHEO9fYwF2zF8SDmFuwQ/QvBxhc5NBJqg39aLAJ1fG+gXv
 KJMRZ27hLfPihQ0k/+d0/0IdGet64zWSqj7Fp/BFeoxnQwqyQxZqq2aZOb+mocbo2fLO
 woD0ZozNeAslNMes7t/7QjJ0woTmmnes3/I1nenvZMZy/Pk4X/LT1NnuE6iWq9vjPZMK
 9H94PSTOurBuELAzzVnqTOx0DiULsFh10z6E92UPPlFul7FA4zLDiwLhuV1UciIfLUPt
 1bBA==
X-Gm-Message-State: AO0yUKVLxJmxnGoq9EO17Pj56KEe0dNiPgQLecnI4jTirM2MHIT/OjLk
 lTVRQsQ8eYpdc8WSXc9MjqO6Yg==
X-Google-Smtp-Source: AK7set8RcGKhIkHPHZ1I37b2u644WM23Bbs6dcp5sv6NhZNXveoNCV7+McLNkQ/vsOiDv5xBUGKElw==
X-Received: by 2002:a9d:7c8c:0:b0:694:298d:408a with SMTP id
 q12-20020a9d7c8c000000b00694298d408amr7170287otn.8.1679955344702; 
 Mon, 27 Mar 2023 15:15:44 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a9d5e12000000b006994465665asm12233642oti.80.2023.03.27.15.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 15:15:44 -0700 (PDT)
Message-ID: <e9189845-f713-2ec1-271c-948d73f20e4e@ventanamicro.com>
Date: Mon, 27 Mar 2023 19:15:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 03/19] target/riscv: introduce
 riscv_cpu_add_misa_properties()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230327124247.106595-1-dbarboza@ventanamicro.com>
 <20230327124247.106595-4-dbarboza@ventanamicro.com>
 <a5a3e653-c58b-8da4-106f-2913235a44ea@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <a5a3e653-c58b-8da4-106f-2913235a44ea@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 27 Mar 2023 22:15:49 -0000



On 3/27/23 15:52, Richard Henderson wrote:
> On 3/27/23 05:42, Daniel Henrique Barboza wrote:
>> +static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
>> +                                 void *opaque, Error **errp)
>> +{
>> +    RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
> 
> const
> 
>> +static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
>> +                                 void *opaque, Error **errp)
>> +{
>> +    RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
> 
> const
> 
>> +static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {};
> 
> const

It seems that I can't use 'const' because the object_property_add() API uses a 'void *opaque'
pointer and it won't take a "const RISCVCPUMisaExtConfig *":

../target/riscv/cpu.c:1454:35: error: passing argument 7 of ‘object_property_add’ discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
  1454 |                             NULL, misa_cfg);
       |                                   ^~~~~~~~
In file included from /home/danielhb/work/qemu/include/hw/qdev-core.h:8,
                  from /home/danielhb/work/qemu/include/hw/core/cpu.h:23,
                  from ../target/riscv/cpu.h:23,
                  from ../target/riscv/cpu.c:24:
/home/danielhb/work/qemu/include/qom/object.h:1067:43: note: expected ‘void *’ but argument is of type ‘const RISCVCPUMisaExtConfig *’
  1067 |                                     void *opaque);



Daniel
> 
> 
> 
> r~

