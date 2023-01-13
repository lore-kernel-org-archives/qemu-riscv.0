Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pGHAU-0007mb-Fd
	for mharc-qemu-riscv@gnu.org; Fri, 13 Jan 2023 05:20:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pGHAT-0007mL-H0
 for qemu-riscv@nongnu.org; Fri, 13 Jan 2023 05:20:13 -0500
Received: from mail-oa1-x41.google.com ([2001:4860:4864:20::41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pGHAR-0005Wy-Nl
 for qemu-riscv@nongnu.org; Fri, 13 Jan 2023 05:20:13 -0500
Received: by mail-oa1-x41.google.com with SMTP id
 586e51a60fabf-15027746720so21758360fac.13
 for <qemu-riscv@nongnu.org>; Fri, 13 Jan 2023 02:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QtQwRfF+ulK+aqGp72w++VL8SNUDal9NahqXeCW1cRk=;
 b=V12qxT57idfmBA+iwRFqkLRyevXQLy2fji9UNSgWVy/UjC83U0YHbJY+cYtzK3LFfo
 EmIEsSPTZLMpXoqHprFgHHKvACdc3NqdhvrW7dgahn4hGNQUOp6VbUIEdTwD4kjd1ooO
 rOMBSf/0jlxgxPSN8mlhprYkubM04vcEhneWiGFm4N5i94GwgSoQzig9HbbTRGqSFMNC
 rqTDM7vIbEBcs2IwyY/pxJEj4MfYgf3nzbrQ/vxXmr5QRYIGVfvsdDEXNFvZrilsUs6l
 AC9RAjKQG6FM2RwHamlnWTcLf+2PpKmVds5INTBvLjPauRwlzNBaxfpIBdGNVYAVQ2Gu
 fB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QtQwRfF+ulK+aqGp72w++VL8SNUDal9NahqXeCW1cRk=;
 b=lVh5NBwoYkx7HNJdT8puBPFdlvpwgyk8OQQHvu1/X4nLftX1gPyW6agYtnpdR5Xuy6
 fWDtQ3RnQeQIRafjEglztGC2CVLu5Q+NfzHN01MjwL2+J7mouKfZi8Wkf9SsrVYtiPnx
 JmT0/jkRjEOJY9QXsWn+fthMcc229lOYapDwAdIcG9dRhUV4FhkKX3g33aIjggk11HYo
 NXb9gU76kmEATc3YGtONPKjq5ySIs+HylUluhhkIECf7mp3eAuELT8ccMg9HRu8Y+7DM
 LtfmmdXpvrqSSu1rsffAIHK5T7EfT1Nob0GuaGjiIVFLbwh8ZMETqx2vpIXzZu9ZwSoZ
 mCpQ==
X-Gm-Message-State: AFqh2kowghmIESUPsaQUvc6rvT8WAlcg7xwyd6zQEoJSr455Nt5R4tNg
 jX+6RvJ+XIYWmkvjiXtzfbjtKQ==
X-Google-Smtp-Source: AMrXdXv6i2Ck5Z4gPG/Bqs6MnvV487Yy6xIFsqz2q0C2vbFneesOpYSOXneilrLYqHqS90kSyYpgMg==
X-Received: by 2002:a05:6871:b12:b0:152:d0dc:2bba with SMTP id
 fq18-20020a0568710b1200b00152d0dc2bbamr17402091oab.15.1673605210221; 
 Fri, 13 Jan 2023 02:20:10 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 bd13-20020a056870d78d00b0014fe4867dc7sm10142801oab.56.2023.01.13.02.20.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 02:20:09 -0800 (PST)
Message-ID: <cbab1ba2-e29b-aa48-b64f-b95de71787dd@ventanamicro.com>
Date: Fri, 13 Jan 2023 07:20:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/2] target/riscv/cpu: fix sifive_u 32/64bits boot in
 riscv-to-apply.next
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 richard.henderson@linaro.org
References: <20230110201405.247785-1-dbarboza@ventanamicro.com>
 <CAKmqyKM=7Ld0FuZ7FfzTKznpM5Zq1xzAKd-iVxqjk6TPbred2g@mail.gmail.com>
 <CAEUhbmWbcWNQxP8O+56qYjUPsmgyP+qhOTYRRmDUimXV6s42_Q@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAEUhbmWbcWNQxP8O+56qYjUPsmgyP+qhOTYRRmDUimXV6s42_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::41;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x41.google.com
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
X-List-Received-Date: Fri, 13 Jan 2023 10:20:13 -0000

Hi Bin!

On 1/12/23 22:28, Bin Meng wrote:
> Hi Daniel,
>
> On Wed, Jan 11, 2023 at 1:03 PM Alistair Francis <alistair23@gmail.com> wrote:
>> On Wed, Jan 11, 2023 at 6:17 AM Daniel Henrique Barboza
>> <dbarboza@ventanamicro.com> wrote:
>>> Hi,
>>>
>>> I found this bug when testing my avocado changes in riscv-to-apply.next.
>>> The sifive_u board, both 32 and 64 bits, stopped booting OpenSBI. The
>>> guest hangs indefinitely.
>>>
>>> Git bisect points that this patch broke things:
>>>
>>> 8c3f35d25e7e98655c609b6c1e9f103b9240f8f8 is the first bad commit
>>> commit 8c3f35d25e7e98655c609b6c1e9f103b9240f8f8
>>> Author: Weiwei Li <liweiwei@iscas.ac.cn>
>>> Date:   Wed Dec 28 14:20:21 2022 +0800
>>>
>>>      target/riscv: add support for Zca extension
>>>
>>>      Modify the check for C extension to Zca (C implies Zca)
>>> (https://github.com/alistair23/qemu/commit/8c3f35d25e7e98655c609b6c1e9f103b9240f8f8)
>>>
>>>
>>> But this patch per se isn't doing anything wrong. The root of the
>>> problem is that this patch makes assumptions based on the previous
>>> patch:
>>>
>>> commit a2b409aa6cadc1ed9715e1ab916ddd3dade0ba85
>>> Author: Weiwei Li <liweiwei@iscas.ac.cn>
>>> Date:   Wed Dec 28 14:20:20 2022 +0800
>>>
>>>      target/riscv: add cfg properties for Zc* extension
>>> (https://github.com/alistair23/qemu/commit/a2b409aa6cadc1ed9715e1ab916ddd3dade0ba85)
>>>
>>> Which added a lot of logic and assumptions that are being skipped by all
>>> the SiFive boards because, during riscv_cpu_realize(), we have this
>>> code:
>>>
>>>      /* If only MISA_EXT is unset for misa, then set it from properties */
>>>      if (env->misa_ext == 0) {
>>>          uint32_t ext = 0;
>>>          (...)
>>>      }
>>>
>>> In short, we have a lot of code that are being skipped by all SiFive
>>> CPUs because these CPUs are setting a non-zero value in set_misa() in
>>> their respective cpu_init() functions.
>>>
>>> It's possible to just hack in and fix the SiFive problem in isolate, but
>>> I believe we can do better and allow all riscv_cpu_realize() to be executed
>>> for all CPUs, regardless of what they've done during their cpu_init().
>>>
>>>
>>> Daniel Henrique Barboza (2):
>>>    target/riscv/cpu: set cpu->cfg in register_cpu_props()
>>>    target/riscv/cpu.c: do not skip misa logic in riscv_cpu_realize()
>> Thanks for the patches
>>
>> I have rebased these onto the latest master and dropped the other
>> series. That way when the other series is applied we don't break
>> bisectability.
> It seems these 2 patches are already in Alistair's tree.
>
> Richard had a suggestion for patch 1 and I had some minor comments
> too. Do you plan to resend a v2 for that?

I'll re-send the v2 with your comments addressed.

About Richard's suggestion, I believe I replied that it would require more thought
because, as it is now, it would break boards that are setting their properties after
register_cpu_props(). The overall simplification of the cpu_init() code across all
RISC-V boards is good thing to do in the future as a follow up, IMO.


Thanks,

Daniel



>
> Regards,
> Bin


