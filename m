Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrhiF-0004xM-1t
	for mharc-qemu-riscv@gnu.org; Mon, 29 Nov 2021 09:33:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrhi6-0004t8-LL
 for qemu-riscv@nongnu.org; Mon, 29 Nov 2021 09:32:51 -0500
Received: from [2a00:1450:4864:20::42a] (port=46865
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrhht-0002Pn-RW
 for qemu-riscv@nongnu.org; Mon, 29 Nov 2021 09:32:50 -0500
Received: by mail-wr1-x42a.google.com with SMTP id u1so37207379wru.13
 for <qemu-riscv@nongnu.org>; Mon, 29 Nov 2021 06:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2kWOaeQU2gOFroViOcRLn1Idd6hJNVxLXcc0K+4vlXo=;
 b=qfv51a0k0Av0ryTqraPOczbyIdkNIhq8LYmpSaniLNhneCChulFiV2l69/zYy4cO+G
 3YTIISHk73oIdw+4legD2Ls8FLh6aeOgiX9feQP1X1kMj+H2dVvwbv5Qvqvy/qfQ6pem
 Sy0AtJ2+Qdz/K3UdudF1BbUy/eX0JnBexTM7QQQeWye3EwKPFIwp8pAZ1P+mHlhPOd3r
 Y0cWRPxQMXYlKbINQEnWHvMKXyx8KkpFROkAGBb3kEeG2DHcyubS6sIBdB4POWyLNZXj
 /BYPuJyjP2y0CmKczzDZbdoIdVqf/sq2FTVQCIDH9P2pU6NKJ9blkzjg1ec42md+FuIJ
 EH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2kWOaeQU2gOFroViOcRLn1Idd6hJNVxLXcc0K+4vlXo=;
 b=NCWjj7YUCliLZVyLdzt4XBtHSzCW7ZsPrR56JLq1966qdR1bEvWUyax5Pwp21LYG/8
 wBQ0tVHhjOIlUHdNi0X5oCW7BqBOYc6VEudB4LYbrZ/aFdCPanO0Xj0nrO+UasbpYYJg
 k/vp6uvXSEHOGsx8IIKW/ojWBqG62VQ1nJpu7Z0/okd1TpNCz8hkXG51o2Yn9FlziF36
 AEId3LH3n6wulnRnq8a83IRoMxlZYKGifqBEo1QEwWvdWC6Y9yipeQCkznxJaBUTewFt
 UMLsNdQkL1lDjG9xG1WuznEGMevGio4bw5ganSB8u4zgT8+GGSLk5qnybpPNL5pSTOxJ
 A0dg==
X-Gm-Message-State: AOAM532YcE/9Mj1BI72vKrIBioDIL3of9Oxb+ROS/rLnHTSg3837+o0Y
 jzLNRIYog+njhcYANI6dOfHNxg==
X-Google-Smtp-Source: ABdhPJyOPLLM9NdzYaGIQEKQYl2phLJTqmhB+orOFGP/JEZXJPBdfDPlkMpDP+/pLM0uQiQ2NPmvjA==
X-Received: by 2002:a5d:62c5:: with SMTP id o5mr34302815wrv.408.1638196351749; 
 Mon, 29 Nov 2021 06:32:31 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id z5sm24925889wmp.26.2021.11.29.06.32.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 06:32:31 -0800 (PST)
Subject: Re: [PATCH v6 03/18] qemu/int128: addition of div/rem 128-bit
 operations
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211128135719.50444-4-frederic.petrot@univ-grenoble-alpes.fr>
 <a37bf796-567e-2331-be42-38f756b105cd@linaro.org>
 <2e6d2c92-3374-0400-9bf5-128c3c1d2132@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <38367ef1-8994-95b7-592c-85aa8d8eb4bb@linaro.org>
Date: Mon, 29 Nov 2021 15:32:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2e6d2c92-3374-0400-9bf5-128c3c1d2132@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.317,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 14:32:52 -0000

On 11/29/21 3:27 PM, Frédéric Pétrot wrote:
> On 29/11/2021 11:07, Richard Henderson wrote:
>> On 11/28/21 2:57 PM, Frédéric Pétrot wrote:
>>> --- /dev/null
>>> +++ b/util/int128.c
>>> @@ -0,0 +1,145 @@
>>> +#include "qemu/osdep.h"
>>> +#include "qemu/host-utils.h"
>>> +#include "qemu/int128.h"
>>
>> Missing file header and copyright boilerplate.
>>
>>> +#ifdef CONFIG_INT128
>>> +
>>> +Int128 int128_divu(Int128 a, Int128 b)
>>> +{
>>> +    return (__uint128_t)a / (__uint128_t)b;
>>> +}
>>> +
>>> +Int128 int128_remu(Int128 a, Int128 b)
>>> +{
>>> +    return (__uint128_t)a % (__uint128_t)b;
>>> +}
>>> +
>>> +Int128 int128_divs(Int128 a, Int128 b)
>>> +{
>>> +    return a / b;
>>> +}
>>> +
>>> +Int128 int128_rems(Int128 a, Int128 b)
>>> +{
>>> +    return a % b;
>>> +}
>>
>> I think we should simply expose these inline, and let the compiler call its runtime 
>> function directly.
> 
>    Thanks.
>    Ok, I'll drop that and handle the CONFIG_INT128 directly in the rv128
>    div/rem helpers then.

No, that's not what I meant.  Copy these directly into include/qemu/int128.h and add 
static inline, within the existing CONFIG_INT128 block.


r~

