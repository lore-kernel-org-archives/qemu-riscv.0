Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8JDE-0008N7-54
	for mharc-qemu-riscv@gnu.org; Mon, 04 Jul 2022 06:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8JDC-0008Iy-8T
 for qemu-riscv@nongnu.org; Mon, 04 Jul 2022 06:21:50 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8JDA-0003zs-MU
 for qemu-riscv@nongnu.org; Mon, 04 Jul 2022 06:21:49 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso2856148pjc.1
 for <qemu-riscv@nongnu.org>; Mon, 04 Jul 2022 03:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qWt2Ihirl3CxcG3bKkGlZNvIO1JqH2Inu/DXQlUA0EE=;
 b=h9KHFVX/3i2xfuWWnx4AuGSI+esBHP2tnDnGfQtwS15qAdtBT4wtjqL6ocT9EDMniV
 2r7gWy/iKy3a/NdDaM2GQCgb2whhs4rvK2Jf3IauCsNDo/wYah3HrZ/S5JZyKVXq1Xe8
 7Ayi/zHo/d3MFADS+PgFXbQ44nKsl0FTk+/46ePXi+m/ul6/0BmixLH+ndgrtEmWkBAm
 k76vQ8dd/jt0RTW+E92cZQKDShtNsfSFF+LqcqYOeHu++bygV0AHVFg+gqrJTUC/iLLQ
 rBESoru5KmAKRiKsf7JVXPMUaESmi8xKbMt0cAjzDQIrkvwMlhFQTYyoGTV77ZDkO3Qs
 HGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qWt2Ihirl3CxcG3bKkGlZNvIO1JqH2Inu/DXQlUA0EE=;
 b=FNAwbCA2tRV15RUiobMTVs7a+NRzz7I625YSooj7PwpwWocCAONx8uE+sBSdcvYH8E
 ngwUBvn/QSkJFGyE5kkmAC7xqU+oKXV6baabDzoLT1fA/P9sQZ1otDpC0AAY9AYTzWGw
 8xlwpx7V6nlf/nXj/EYx892LUBoWFiFF1xNpBytjY2nLxuecN9f5/GYFzeAeGbzBn4kf
 jqwOtf1XAwUrlfErNeC4xgR9mAWFcxTPHn1cRrKP6gOxFHx17NL/puGTYoCRmFs8MB0M
 ++a8okvpaJx59jfj1i36HLp0DVcsvoR8O8Ew392/wDaX2GIu6MnSBR1QkQD191L91MNp
 yCPQ==
X-Gm-Message-State: AJIora/6ykjJPHRLvQl39t9osej8dC63vvIoz/jv258GS+cqdmuQZ2zP
 RDzNLIEDAG1A0MKT7FBkSPS0uXWigSvXcXd8
X-Google-Smtp-Source: AGRyM1svFrMArifgbgXqkdXWin0iYwIWPbkz0xHjOwjnpLUa1u5yFpxjBV+QUpUWTQwmFdJm1C0zgA==
X-Received: by 2002:a17:902:e494:b0:16b:dd0e:e11e with SMTP id
 i20-20020a170902e49400b0016bdd0ee11emr7671595ple.7.1656930104756; 
 Mon, 04 Jul 2022 03:21:44 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a1709027e4300b0016bb24f5d19sm8513100pln.209.2022.07.04.03.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 03:21:44 -0700 (PDT)
Message-ID: <31017a43-3ebb-0aa3-f6ce-d2df1b5dc177@linaro.org>
Date: Mon, 4 Jul 2022 15:51:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 03/11] goldfish_rtc: Add endianness property
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, Stafford Horne <shorne@gmail.com>,
 QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>, Anup Patel
 <anup.patel@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:Goldfish RTC" <qemu-riscv@nongnu.org>
References: <20220703212823.10067-1-shorne@gmail.com>
 <20220703212823.10067-4-shorne@gmail.com>
 <272f1e82-ff1b-9a7a-931b-91472dd244bf@linaro.org>
 <b8d2595b-c86a-b1b8-8912-13fc9ba782d3@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b8d2595b-c86a-b1b8-8912-13fc9ba782d3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 04 Jul 2022 10:21:50 -0000

On 7/4/22 15:46, Laurent Vivier wrote:
> On 04/07/2022 11:59, Richard Henderson wrote:
>> On 7/4/22 02:58, Stafford Horne wrote:
>>> -static const MemoryRegionOps goldfish_rtc_ops = {
>>> -    .read = goldfish_rtc_read,
>>> -    .write = goldfish_rtc_write,
>>> -    .endianness = DEVICE_NATIVE_ENDIAN,
>>> -    .valid = {
>>> -        .min_access_size = 4,
>>> -        .max_access_size = 4
>>> -    }
>>> +static const MemoryRegionOps goldfish_rtc_ops[3] = {
>>> +    [DEVICE_NATIVE_ENDIAN] = {
>>> +        .read = goldfish_rtc_read,
>>> +        .write = goldfish_rtc_write,
>>> +        .endianness = DEVICE_NATIVE_ENDIAN,
>>> +        .valid = {
>>> +            .min_access_size = 4,
>>> +            .max_access_size = 4
>>> +        }
>>> +    },
>>> +    [DEVICE_LITTLE_ENDIAN] = {
>>> +        .read = goldfish_rtc_read,
>>> +        .write = goldfish_rtc_write,
>>> +        .endianness = DEVICE_LITTLE_ENDIAN,
>>> +        .valid = {
>>> +            .min_access_size = 4,
>>> +            .max_access_size = 4
>>> +        }
>>> +    },
>>> +    [DEVICE_BIG_ENDIAN] = {
>>> +        .read = goldfish_rtc_read,
>>> +        .write = goldfish_rtc_write,
>>> +        .endianness = DEVICE_BIG_ENDIAN,
>>> +        .valid = {
>>> +            .min_access_size = 4,
>>> +            .max_access_size = 4
>>> +        }
>>> +    },
>>>   };
>>
>> You don't need 3 copies, only big and little.
>>
>>> +static Property goldfish_rtc_properties[] = {
>>> +    DEFINE_PROP_UINT8("endianness", GoldfishRTCState, endianness,
>>> +                      DEVICE_NATIVE_ENDIAN),
>>> +    DEFINE_PROP_END_OF_LIST(),
>>> +};
>>
>> ... and I think the clear desire for default is little-endian.  I would make the 
>> property be bool, and add a comment that this is only for m68k compatibility, so don't 
>> use it in new code.
> 
> m68k doesn't really need this.
> 
> kernel with the m68k virt machine and goldfish device supports "native" mode so I think 
> it's not needed to add another layer of complexity for it.

"Another level"?  I'm talking about removing "native", and only having "big" and "little", 
which is less complexity.


r~

