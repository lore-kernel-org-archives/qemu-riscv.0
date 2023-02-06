Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pP8ZI-0001nl-9Z
	for mharc-qemu-riscv@gnu.org; Mon, 06 Feb 2023 15:58:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pP8ZG-0001nc-JI
 for qemu-riscv@nongnu.org; Mon, 06 Feb 2023 15:58:27 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pP8ZE-0004JZ-TG
 for qemu-riscv@nongnu.org; Mon, 06 Feb 2023 15:58:26 -0500
Received: by mail-ot1-x332.google.com with SMTP id
 x26-20020a056830115a00b0068bbc0ee3eeso3593224otq.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Feb 2023 12:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9R2cEZWHw5O6WIGpIKjMXBdy7W8IGQ23vZauuQrJZLA=;
 b=YGto0v7MJmslRuxdGpdMiI1Q0oJRtW6PUTaYObaCV8ctwDUM0hzybR5PwU3+xa4j3B
 9UnMJfvxZgZrWM2XcqFZL3LpxUEvrtLuIxYXSjVuJDoe0h3EWwx6SV74SlSIiaHwn/Cm
 FsA/H9O0XChylYHe3nU/aZCYlWP//74DaGdD8w7ynjz28/Vso682Khilm2s4LylcLrsw
 P+27pocXJsv2HHn9t5QZr0YAc7J9vbYec3WPtKmxy7bH8X5xVHpuTaUfme45KWJRNtb/
 LdyKGOF/tyTo4JUiAZwxE2Ykqy3gjei59RzX20v1ZnxCbTFCJ60+Jx/s/J26NJDgYOUi
 JL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9R2cEZWHw5O6WIGpIKjMXBdy7W8IGQ23vZauuQrJZLA=;
 b=sGlkqN9q4Dq/2gjG6tE1d5pstAvNTujA5wNcl0tqfUNCI++RpY2rl3AzJ72hETLvUB
 ktIja5C9uZQuwsMVeuQuFjGmdwQPZMd1xzSlckSN5YKxBCu+p0u+5QKAf/NMLqQY/jQA
 BKS4IMvkAA2jb+lZXwE9eVVvIcySLE5K6/Ku9hiNOpJOI2znp23sGXbDNqpkWFwQFFQ8
 6QiSl4H7iSXP1HQCvBPpDE989RT6BqNai23wFqdRxtvm26A2HFVl3ixPl6ZyzbSQCDYV
 ho7uNddvHfdtCuD+685GbEqO17GEMowTKDnM9t3osDIY7s5kFYWFxCA3ecAa0l0N3Gv9
 QMMw==
X-Gm-Message-State: AO0yUKWz3t+srsylXCGkQVN/9cXlIhiK5qTb6wrDS+WYLe/xsjNKqFTC
 JpwTo9fGCxWQ7Y0IgC2Dso3wHw==
X-Google-Smtp-Source: AK7set8brWqAFsxK4/eaS4EFZV79Q08Zvelz+Xko6yTZtm6GxO45Fvxex1x+XKyt/gHJDFrNqHUWrQ==
X-Received: by 2002:a05:6830:1181:b0:68b:cab3:8fc8 with SMTP id
 u1-20020a056830118100b0068bcab38fc8mr402264otq.23.1675717094799; 
 Mon, 06 Feb 2023 12:58:14 -0800 (PST)
Received: from [192.168.68.107] ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a9d6f0d000000b006884c42a38asm5594094otq.41.2023.02.06.12.58.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 12:58:14 -0800 (PST)
Message-ID: <a6b79e40-0031-b42f-bb91-38f0dcd9756d@ventanamicro.com>
Date: Mon, 6 Feb 2023 17:58:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 0/2] riscv: Add support for Zicbo[m,z,p] instructions
Content-Language: en-US
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Christoph Muellner <cmuellner@linux.com>
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>
References: <20220216154839.1024927-1-cmuellner@linux.com>
 <Y9Admgur0rul8X2d@debian>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <Y9Admgur0rul8X2d@debian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-List-Received-Date: Mon, 06 Feb 2023 20:58:27 -0000

Hi,

FYI I grabbed these patches, rebased using Alistair's riscv-to-apply.next, and I
plan to re-send them as v5 in the next few days (maintaining Christoph's authorship,
of course).

I'll see if I can implement some of the suggestions made in the v4 one year ago as
well. To keep the original patches intact I'll do that in separated patches.


Thanks,


Daniel

On 1/24/23 15:04, Sudip Mukherjee wrote:
> Hi Christoph,
> 
> On Wed, Feb 16, 2022 at 04:48:37PM +0100, Christoph Muellner wrote:
>> The RISC-V base cache management operation ISA extension has been
>> ratified [1]. This patchset adds support for the defined instructions.
>>
>> As the exception behavior of these instructions depend on the PMP
>> configuration, the first patch introduces a new API to probe the access
>> of an address range with a specified size with optional nonfaulting
>> behavior.
>>
>> The Zicbo[m,z,p] patch should be straight-forward and has been reviewed
>> in previous versions of this patchset.
> 
> I have not seen any v5 yet, unless I have missed. Are you planning to
> send one?
> fwiw, I rebased them on top of v7.2.0 and tested that it works.
> 

