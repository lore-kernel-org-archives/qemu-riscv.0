Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu98l-0002Mg-Qe
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 05:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pu98k-0002MK-1t
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 05:51:14 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pu98i-0007WW-C1
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 05:51:13 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-549f0b4606cso3507820eaf.2
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 02:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1683107470; x=1685699470;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/7rUM88CyfaHXN31Jc1fbMtF03I0JJGTgpCKHz5CGDQ=;
 b=VayF9L2E4IHkbNALpsguNOsp77vMwFTl6Hvl6ruaAYyLjGetHJcTiHb8mkBr6YiI/y
 UpVaGd0WG5BZu3VOBPGdqYxfm1hZD/zZgTEUMHUbwvdtWnapv+9k/di5pOCwTfmK86oT
 r1mUiaUs3FRgGCa2a9nccgK7wgCHghy6/QKo5XnD7RJuKpZEOix21yPH39rL1cr1sMNE
 ArKRhB7OeBEQ2V1T3SqK7XkzGfZJYCiz5W7bi20bhj00NbtFYAcH7eNsVyZr+2fzAVSF
 HqxWE7SZlahKXyJ23fwPxVd2Llf0H5UzY/ovUwOriXJ92SRgHP624Cw3oEvjAmXk2rxp
 0+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683107470; x=1685699470;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/7rUM88CyfaHXN31Jc1fbMtF03I0JJGTgpCKHz5CGDQ=;
 b=OA6kS9HHN2IINVBt+ELdKjWMIiCuMZ5rn65buNIPxUdfOhJXNJmUlXf1vIL5llthLT
 4/M7fYlQLW9l8wQ3wH6+ii6Z2EW0S6kB7PLfNZos1x5mxGvbhrhBSsVjC7fChqhrryk/
 xZoUnVNuh8NqHbaSK6njfZdBd0JEA2R1xxXsfMa3C5F/2YFF6DsgJHD70mG+IHeSTcka
 cK7lB6oQkH1zUchC0uYRWtuVxkpi9fqZvVr6lEAFEbpe6jMD00dDzyyvxt3mbAEdoNAF
 oHCmHb/Ov4UZjxNQsLB6NPjnkkEpPwgL1NZVspd6IxXco0gU2wQDyArFFi6qQONv9M1I
 epTw==
X-Gm-Message-State: AC+VfDzVfWXkzfyVGVtxbG2ltzRLcsv84gl7lO/dWlIsg1/tS2/PieZQ
 2I2UMWboSTxMamPjlLw1H0bJSw==
X-Google-Smtp-Source: ACHHUZ6J3eLyFkctbrp04dzOupD9DGcqoi9HtkJuXeQUgnR9ZCDwXKjiImkf3Hl+xAHGVhaXwpQ5QA==
X-Received: by 2002:aca:1e16:0:b0:38c:6654:a61b with SMTP id
 m22-20020aca1e16000000b0038c6654a61bmr8939794oic.0.1683107470579; 
 Wed, 03 May 2023 02:51:10 -0700 (PDT)
Received: from [192.168.68.107] ([179.111.98.125])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a056808060b00b00383ce81c186sm414952oih.32.2023.05.03.02.51.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 02:51:10 -0700 (PDT)
Message-ID: <6946d44f-8b24-de00-7efc-e35d48f62705@ventanamicro.com>
Date: Wed, 3 May 2023 06:51:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 0/3] target/riscv: implement query-cpu-definitions
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, richard.henderson@linaro.org
References: <20230411183511.189632-1-dbarboza@ventanamicro.com>
 <CAKmqyKMhA5=f99rzxp63-vqiUCZwEuWmAZK76=ZKUrni-CTauQ@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKMhA5=f99rzxp63-vqiUCZwEuWmAZK76=ZKUrni-CTauQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2a.google.com
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
X-List-Received-Date: Wed, 03 May 2023 09:51:14 -0000

Alistair,

Patch 2 has a typo right in the commit title:

"target/riscv: add query-cpy-definitions support"

it should be 'query-cpu-definitions'. Can you amend it in the tree? Or should
I re-send?



Thanks,


Daniel



On 4/16/23 23:58, Alistair Francis wrote:
> On Wed, Apr 12, 2023 at 4:36 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> Hi,
>>
>> In this v3 I removed patches 3 and 4 of v2.
>>
>> Patch 3 now implements a new type that the generic CPUs (any, rv32,
>> rv64, x-rv128) were converted to. This type will be used by
>> query-cpu-definitions to determine if a given cpu is static or not based
>> on its type. This approach was suggested by Richard Henderson in the v2
>> review.
>>
>> Patches are based on top of Alistair's riscv-to-apply.next.
>>
>> Changes from v2:
>> - old patches 3 and 4: removed
>> - patch 3:
>>    - add TYPE_RISCV_DYNAMIC_CPU
>>    - use this type to set 'q_static' in riscv_cpu_add_definition()
>> - v2 link: https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg01310.html
>>
>> Daniel Henrique Barboza (3):
>>    target/riscv: add CPU QOM header
>>    target/riscv: add query-cpy-definitions support
>>    target/riscv: add TYPE_RISCV_DYNAMIC_CPU
> 
> Thanks!
> 
> Applied to riscv-to-apply.next
> 
> Alistair
> 
>>
>>   qapi/machine-target.json      |  6 ++-
>>   target/riscv/cpu-qom.h        | 70 +++++++++++++++++++++++++++++++++++
>>   target/riscv/cpu.c            | 20 ++++++++--
>>   target/riscv/cpu.h            | 46 +----------------------
>>   target/riscv/meson.build      |  3 +-
>>   target/riscv/riscv-qmp-cmds.c | 57 ++++++++++++++++++++++++++++
>>   6 files changed, 150 insertions(+), 52 deletions(-)
>>   create mode 100644 target/riscv/cpu-qom.h
>>   create mode 100644 target/riscv/riscv-qmp-cmds.c
>>
>> --
>> 2.39.2
>>
>>

