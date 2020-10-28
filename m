Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXt4Q-0007o8-KX
	for mharc-qemu-riscv@gnu.org; Wed, 28 Oct 2020 17:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kXt4O-0007nY-DD
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2020 17:33:24 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:37564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kXt4L-00011S-T9
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2020 17:33:24 -0400
Received: by mail-pl1-x642.google.com with SMTP id b12so274879plr.4
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2020 14:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hl8eZrnUazypVpmS84gj/jRQ+6BQ0RDKqt+nbHgCpVM=;
 b=rgrYWEXpMz/vNkYKfWRywyFzcRP/Ivf6X9PTzsMd3gi+Pbbs4skjwLZkHWxytuNi+f
 IkFa4R09frGtoMegq4PRSEakpm4Pcq8SvLuL9miNKFDn1Qd2iSa2hs3QvvfJV/90AhL4
 YfiA2eJ+4ni2PCyP4sr2hVKFaeB3cXEVapFx8HAhlo9SqPmiAXHzCILdfy+fe2ZLj9Qf
 9N5CXtzz7L8wSDmMLIMp5WsnyXQ/jcm/CcdlGElUndKN+pWtoZt4K9/E70NbP+Al76nu
 UWEckKN0VmX4NM/XhfteuODPwso0MDs4vOKu6jKyKDGE5iKitNY8Yj2XBDe5CjujvhYu
 H6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hl8eZrnUazypVpmS84gj/jRQ+6BQ0RDKqt+nbHgCpVM=;
 b=IkjBvTZV5JuGg4CVPDWsDB/45GjyXx7powahy2LHUfFv9NiwEaOwGUQq4xbh+y1hnE
 nii5b7tLcTzl4YPZo+L+n3K2fR3XwF0QLD6Irt9FpQn8I1oFi5cuSKtsIt7uELRZaQCB
 7PywCoYxzALdM0PKzVykyJ/yhOLi3NytTjDtOKTkbyZMm/gQEtpxBYHY+fF/+z18JbnW
 NCPe1UARpcHp1x1SHh28nLuKN0ZXtIJXJsFOL6ocP5q/MMR691iGZ02OOKP+lpEgIl47
 cqgGI4DbYqk4hDhuN1ekATzYrc/kLzN61RUNCUdFJ5dOx0rGfzSEOp+bsB3Qx/5v8XY/
 qG2w==
X-Gm-Message-State: AOAM532Yr5yzpJ9WbN7blNFgkf60lk8E8gP795yrhMDbgNVU/Cui9DFB
 6sp1QBpaDeEqyBemZGQSw+JJmQ==
X-Google-Smtp-Source: ABdhPJzw6cLIk9NnhARWjj3Cm92THcAd3+vambII4faNkofbN+yxaU67SWaW3Q2cHk6u/vkfuCkfjQ==
X-Received: by 2002:a17:902:342:b029:d5:ab9e:19ce with SMTP id
 60-20020a1709020342b02900d5ab9e19cemr899693pld.48.1603920799419; 
 Wed, 28 Oct 2020 14:33:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id y5sm555730pfq.79.2020.10.28.14.33.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 14:33:18 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] target/riscv: Add a virtualised MMU Mode
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <cover.1603896075.git.alistair.francis@wdc.com>
 <d0eeb9ea64462044a67f5b803d6cb62dd10e017a.1603896075.git.alistair.francis@wdc.com>
 <f8c23bed-3b6c-e01d-cb04-ce945d509970@linaro.org>
 <CAKmqyKNGUcz+WkNNY6dac5d0cypAw4jFiBQFvxAwTQyK0mkGtw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6272150f-a828-3f3e-8d1d-722850af92af@linaro.org>
Date: Wed, 28 Oct 2020 14:33:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNGUcz+WkNNY6dac5d0cypAw4jFiBQFvxAwTQyK0mkGtw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.921,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Oct 2020 21:33:24 -0000

On 10/28/20 1:51 PM, Alistair Francis wrote:
>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>> index 3eb3a034db..453e4c6d8a 100644
>>> --- a/target/riscv/cpu_helper.c
>>> +++ b/target/riscv/cpu_helper.c
>>> @@ -30,6 +30,10 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>>>  #ifdef CONFIG_USER_ONLY
>>>      return 0;
>>>  #else
>>> +    if (riscv_cpu_virt_enabled(env)) {
>>> +        return env->priv | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
>>> +    }
>>
>> This is wrong.  You only want to set this flag in response to one of the
>> hypervisor special instructions.  This is setting it any time virt is enabled.
> 
> Isn't that ok though? I thought this was the correct approach.

No.

Consider: The *presence* of this bit means a change of behaviour in
get_physical_address.

Things are mostly working for you because you then mask this bit off when
installing it to TBFLAGS.  Which you then use during translate without adding
it back on, except for the one place you need it.

The things that won't work are generic bits of code which use e.g.
cpu_ldub_data(), which calls cpu_mmu_index(), change behaviour.  Which you
don't want.


r~

