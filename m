Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWKzb-0000KG-58
	for mharc-qemu-riscv@gnu.org; Sun, 26 Feb 2023 12:39:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pWKzZ-0000Jr-8c
 for qemu-riscv@nongnu.org; Sun, 26 Feb 2023 12:39:21 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pWKzX-00005h-JP
 for qemu-riscv@nongnu.org; Sun, 26 Feb 2023 12:39:21 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 e18-20020a0568301e5200b00690e6abbf3fso2368431otj.13
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 09:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KUA8q3Fj41xJHwdHNcG8P4gH+u93c7k9hWi14N+NnZs=;
 b=DZ6wUn1a/1BIx9OvdE5vZFX6VhA+LvRjk5pGcazk41q5F6Kd+0pY0OeIYhwsUWwcsz
 kq2RDEvC8eub1LwhYZ2/zL06A3T5M/JKaTUiUKxBOW8mhifny2dmMFGGLZv6ZVqn/6dR
 ChqMrDl0sHDhv0d6GRGHgtJ/z/QUF9AgZyk+VMhI6J+SM335QFJeu45LXmrw9x1wTX3/
 HAvixQD+L3rUxJU7uraJ6VJCxgjkbuY1uPfk7ZMdpRcD3ZrJbY/Pe0zonrHbiLWcnOJC
 GoYpK9nsIyvHUKQN5e8esWZXOc50mWUKQJdoG/LdquGt92DluRFO7GMWUH5EQL1MW3Vr
 LXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KUA8q3Fj41xJHwdHNcG8P4gH+u93c7k9hWi14N+NnZs=;
 b=J2j1fujeS7A0qTqLjHQegucSDTIAuHUPGXdSEpa+HuoatoA8rLsbGlzlhZdZWW7j99
 rwEjNVuMlYhqPx53b5oPeizCiDLgShGBwWAjgCVmS3emJo4rSDoqDN4ey7dbzTsS4ZPa
 eaYd06MKpu/M5CecGxZ0B74mj8Uw3mSAZPk1hR0LUF5zrLZJaAytLTEX3l0ubIZ6wgo8
 AZ5z5okt2q85sE4+pO5aOkJXY/Hx/LGEaFw6O+Vrst589+VJc6dAi/cSBxOnscxCn+L5
 1emfd/dPpzaFqhMmiOg6G1GWM+pJ8Ti0r99ZlKfN7ZR8VWGkO5pyFllCL8cErgmK7bfu
 eLDw==
X-Gm-Message-State: AO0yUKVj/isTp6lkWWIVgdvUQuRy3gjWVkFJiQFtUj9ryhTqDhi+dYI+
 j7G+Z05jaEPep87CImEP6RG+HQ==
X-Google-Smtp-Source: AK7set+rfB13Qt1k8oMlY60zTueBT+f/WNt6tonTOuSwLG/YcHPw2RsB5/0nQedxQzkFQ1mkmF2F6Q==
X-Received: by 2002:a05:6830:4393:b0:68d:51d9:3321 with SMTP id
 s19-20020a056830439300b0068d51d93321mr11592277otv.22.1677433158086; 
 Sun, 26 Feb 2023 09:39:18 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a9d73ca000000b0068d3ec1427bsm1751868otk.69.2023.02.26.09.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 09:39:17 -0800 (PST)
Message-ID: <6792b6c7-0ed4-80e4-f34a-9721280f6065@ventanamicro.com>
Date: Sun, 26 Feb 2023 14:39:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/4] RISCVCPUConfig related cleanups
Content-Language: en-US
To: liweiwei <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 zhiwei_liu@linux.alibaba.com
References: <20230224174520.92490-1-dbarboza@ventanamicro.com>
 <72692287-da2f-86a9-c313-6c4ae6454b46@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <72692287-da2f-86a9-c313-6c4ae6454b46@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32e.google.com
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
X-List-Received-Date: Sun, 26 Feb 2023 17:39:21 -0000



On 2/25/23 03:47, liweiwei wrote:
> 
> On 2023/2/25 01:45, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> These cleanups were suggested by LIU Zhiwei during the review of the
>> RISCV_FEATURE_* cleanups, currently on version 7 [1].
>>
>> These are dependent on the patch "[PATCH v7 01/10] target/riscv: introduce
>> riscv_cpu_cfg()" from [1] because we use the riscv_cpu_cfg() API.
>>
>>
>> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg06467.html
>>
>> Daniel Henrique Barboza (4):
>>    target/riscv/csr.c: use env_archcpu() in ctr()
>>    target/riscv/csr.c: simplify mctr()
>>    target/riscv/csr.c: use riscv_cpu_cfg() to avoid env_cpu() pointers
>>    target/riscv/csr.c: avoid env_archcpu() usages when reading
>>      RISCVCPUConfig
>>
>>   target/riscv/csr.c | 90 +++++++++++++---------------------------------
>>   1 file changed, 24 insertions(+), 66 deletions(-)
>>
> As  I suggested in another patch, cpu_get_cfg() can also be used in vector_helper.c.


I decided to do it in a separated series together with the vector_helper.c change
I did last week:


https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg07566.html


The vector_change I did prior eliminated some of the env_archcpu() we want to
avoid so makes sense to one after the other.


Thanks,


Daniel


> 
> Regards,
> 
> Weiwei Li
> 
> 

