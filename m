Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8J8V-00036b-Gm
	for mharc-qemu-riscv@gnu.org; Mon, 04 Jul 2022 06:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o8J8T-00036A-Sd
 for qemu-riscv@nongnu.org; Mon, 04 Jul 2022 06:16:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o8J8Q-0003Cv-Bu
 for qemu-riscv@nongnu.org; Mon, 04 Jul 2022 06:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656929813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y5yELtTdELIv7VIGZgeMH4CiGHZUar6RzmTrSw9j30Y=;
 b=eXVa29/rct1yx/hjf7dGJZeV48oJkvjNXxrBPl4ChgtGtM8ME5D0XbdR3WkWEzF0KwANO4
 INMQjjBbLHEhihk+uVU8WkJLo4h8pIptKCfxfL/ell0U/iZBS5XmcjQhmqn2jPCNAXWZFc
 dZ19/VzZMT060D7QEq0jQn4wcBXR/2Y=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-bhiQ94KKPs-t8r8hmp_JQw-1; Mon, 04 Jul 2022 06:16:52 -0400
X-MC-Unique: bhiQ94KKPs-t8r8hmp_JQw-1
Received: by mail-qt1-f200.google.com with SMTP id
 o22-20020ac87c56000000b0031d4ab81b21so2819357qtv.1
 for <qemu-riscv@nongnu.org>; Mon, 04 Jul 2022 03:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y5yELtTdELIv7VIGZgeMH4CiGHZUar6RzmTrSw9j30Y=;
 b=TfmZhLF2OsBYET7reVWHhlo3DjPQljV0IMSHNFLFMRfTNcUB+qZUr2H3x/KDGyWlk3
 K/ylGOCKzPjz6poN+o6zmF2oG+TD9Z+asBHZx91Cy56lrtnbgDvOTvWwTbK0rVRN0GV3
 SdX/k9vknsfF151B6gHxryJ5KaJDFqIf9Ya7UumDzAjUShGMrhIyuph5yrsW1poo6eHy
 oTNdtzTwykpgbAn6no5CziNdKrnFr6thKYvo/hB2U+6zgGki73tYxEm744HaktpJab0p
 uiK1PzenfXCwKoPsIOGHNwKmerDV41lvVr4ufcqqeJSxzifaBBLF29ect7hbH7xjrPA8
 MNpQ==
X-Gm-Message-State: AJIora8rKycoTGZBe402ncr+DvAj/L8zvk+GpmI65d21QBE5vEvBpGLm
 dVh0DOw728e9OMSp8AF5HNzZeWgw+HYo96eKVvse0+ylLVSt6pPhW9NnIoE4N1Q45/KKFUceyDR
 RRjaLRjozl2wv+4k=
X-Received: by 2002:ad4:5aed:0:b0:472:7778:ff87 with SMTP id
 c13-20020ad45aed000000b004727778ff87mr26430717qvh.28.1656929811120; 
 Mon, 04 Jul 2022 03:16:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vjlUq1XlEkFFJxbANJNMJkD14jL7MU+k/cunLgR262M2/UAJwOwaKcp4jQ6IoO80vX//GXBA==
X-Received: by 2002:ad4:5aed:0:b0:472:7778:ff87 with SMTP id
 c13-20020ad45aed000000b004727778ff87mr26430705qvh.28.1656929810811; 
 Mon, 04 Jul 2022 03:16:50 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a05620a44cb00b006a37eb728cfsm19463960qkp.1.2022.07.04.03.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 03:16:50 -0700 (PDT)
Message-ID: <b8d2595b-c86a-b1b8-8912-13fc9ba782d3@redhat.com>
Date: Mon, 4 Jul 2022 12:16:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 03/11] goldfish_rtc: Add endianness property
To: Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>, Anup Patel
 <anup.patel@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:Goldfish RTC" <qemu-riscv@nongnu.org>
References: <20220703212823.10067-1-shorne@gmail.com>
 <20220703212823.10067-4-shorne@gmail.com>
 <272f1e82-ff1b-9a7a-931b-91472dd244bf@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <272f1e82-ff1b-9a7a-931b-91472dd244bf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 04 Jul 2022 10:16:58 -0000

On 04/07/2022 11:59, Richard Henderson wrote:
> On 7/4/22 02:58, Stafford Horne wrote:
>> -static const MemoryRegionOps goldfish_rtc_ops = {
>> -    .read = goldfish_rtc_read,
>> -    .write = goldfish_rtc_write,
>> -    .endianness = DEVICE_NATIVE_ENDIAN,
>> -    .valid = {
>> -        .min_access_size = 4,
>> -        .max_access_size = 4
>> -    }
>> +static const MemoryRegionOps goldfish_rtc_ops[3] = {
>> +    [DEVICE_NATIVE_ENDIAN] = {
>> +        .read = goldfish_rtc_read,
>> +        .write = goldfish_rtc_write,
>> +        .endianness = DEVICE_NATIVE_ENDIAN,
>> +        .valid = {
>> +            .min_access_size = 4,
>> +            .max_access_size = 4
>> +        }
>> +    },
>> +    [DEVICE_LITTLE_ENDIAN] = {
>> +        .read = goldfish_rtc_read,
>> +        .write = goldfish_rtc_write,
>> +        .endianness = DEVICE_LITTLE_ENDIAN,
>> +        .valid = {
>> +            .min_access_size = 4,
>> +            .max_access_size = 4
>> +        }
>> +    },
>> +    [DEVICE_BIG_ENDIAN] = {
>> +        .read = goldfish_rtc_read,
>> +        .write = goldfish_rtc_write,
>> +        .endianness = DEVICE_BIG_ENDIAN,
>> +        .valid = {
>> +            .min_access_size = 4,
>> +            .max_access_size = 4
>> +        }
>> +    },
>>   };
> 
> You don't need 3 copies, only big and little.
> 
>> +static Property goldfish_rtc_properties[] = {
>> +    DEFINE_PROP_UINT8("endianness", GoldfishRTCState, endianness,
>> +                      DEVICE_NATIVE_ENDIAN),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
> 
> ... and I think the clear desire for default is little-endian.  I would make the property 
> be bool, and add a comment that this is only for m68k compatibility, so don't use it in 
> new code.

m68k doesn't really need this.

kernel with the m68k virt machine and goldfish device supports "native" mode so I think 
it's not needed to add another layer of complexity for it.

Thanks,
Laurent


