Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86377C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 07:17:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGwG8-0003vP-J7; Sat, 23 Dec 2023 02:17:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rGwG6-0003uE-R7
 for qemu-riscv@nongnu.org; Sat, 23 Dec 2023 02:17:18 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rGwG4-0001YO-RN
 for qemu-riscv@nongnu.org; Sat, 23 Dec 2023 02:17:18 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1d408d0bb87so17232595ad.0
 for <qemu-riscv@nongnu.org>; Fri, 22 Dec 2023 23:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1703315835; x=1703920635;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fVeSKwzmq9V2JL2neLcUCfxQ/2XOS0YKJUymFPDuUW8=;
 b=UHTcZCyAzvSlNQngER8LJUstgqmEqF/8ZN0uIleeKRiFqgGABf55ADHKBnot6SOOxt
 WjXPlfqwhpQflG7+Z3+PgDmWWIUCkI17WHO7fn+dA8gjyTfbvLa4GEnWSeNkyBkGnEzS
 r/BRIWgfRvm6XHMCivqkII3Evb5Ti8uuJhCEm1dCTWEOU4Ym1reiL7TPH8T8gakQUehg
 D2ySonjqYDqFGMN001j8dqCtT72VQm6Hrq5VEtbhWZlfWKw4KVH6nOIjHs1U1AooZc1+
 +XaJnJBwNtZkzDM5q99R8oYrAWTN0le39guHQ92L97S8iMz16NCGjDcxY8txCd9yR7ty
 Nq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703315835; x=1703920635;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fVeSKwzmq9V2JL2neLcUCfxQ/2XOS0YKJUymFPDuUW8=;
 b=jUHUhv8p/S2wZdk8gnWkFxr2IE3hUmVZYjtW6gAnL5wxYj66QHg/ZSu2lQ9N1VDDtg
 sGe4BZXwc1EfRK57U6CyekecwTtCOoMXTKX5ID3649x4KDYZ1cmNuk3X47IDU/HGgjLW
 ghbinyJwLR8lejTR8SX8wZvCtUqqLM0xNcF52UjAVS0f0exJW3O4LpPf8TUtUXJffbcd
 +UaseX4beG33X2e6yYVLb8Y4iVf3o/CDGEfjX6Il6O3wftD3Do4vl6da1WG0J5nfYG78
 hqxrpiHMhOSkC3TkpYc+cBJzo10SFIKYS2mznFD5XcM6puByE+og9o6YRkWMmJ2019UJ
 gswg==
X-Gm-Message-State: AOJu0YykE62E6CS0kVTx8ArTtJM4ENfM1GEnTO6GxOguledrcQBTW4zp
 8jXVLfB+tFCrMFf4p6JbED2wI+IdQkHSzw==
X-Google-Smtp-Source: AGHT+IE2qcKXnKmpB1RRi8yUtOVicdjGkr1cCF0wyIMqCYKcKNevv9IrPCgqmGcAICRnjyEm9kdEmw==
X-Received: by 2002:a17:902:b492:b0:1d4:20f3:3dbb with SMTP id
 y18-20020a170902b49200b001d420f33dbbmr1971647plr.73.1703315834914; 
 Fri, 22 Dec 2023 23:17:14 -0800 (PST)
Received: from [157.82.207.248] ([157.82.207.248])
 by smtp.gmail.com with ESMTPSA id
 jc14-20020a17090325ce00b001d07d83fdd0sm4524824plb.238.2023.12.22.23.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Dec 2023 23:17:14 -0800 (PST)
Message-ID: <3d5ed76a-42bf-4b54-9d11-c8833b410c97@daynix.com>
Date: Sat, 23 Dec 2023 16:17:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 37/40] plugins: add an API to read registers
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Brian Cain <bcain@quicinc.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Cleber Rosa <crosa@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Paul Durrant <paul@xen.org>,
 qemu-s390x@nongnu.org, David Woodhouse <dwmw2@infradead.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Bin Meng <bin.meng@windriver.com>
References: <20231221103818.1633766-1-alex.bennee@linaro.org>
 <20231221103818.1633766-38-alex.bennee@linaro.org>
 <a26a55b2-240c-48c3-b341-48c1d7195bd9@daynix.com>
 <87y1dmxsf0.fsf@draig.linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87y1dmxsf0.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 2023/12/22 22:45, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2023/12/21 19:38, Alex Bennée wrote:
>>> We can only request a list of registers once the vCPU has been
>>> initialised so the user needs to use either call the get function on
>>> vCPU initialisation or during the translation phase.
>>> We don't expose the reg number to the plugin instead hiding it
>>> behind
>>> an opaque handle. This allows for a bit of future proofing should the
>>> internals need to be changed while also being hashed against the
>>> CPUClass so we can handle different register sets per-vCPU in
>>> hetrogenous situations.
>>> Having an internal state within the plugins also allows us to expand
>>> the interface in future (for example providing callbacks on register
>>> change if the translator can track changes).
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1706
>>> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> Based-on: <20231025093128.33116-18-akihiko.odaki@daynix.com>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>> v2
>>>     - use new get whole list api, and expose upwards
>>> vAJB:
>>> The main difference to Akikio's version is hiding the gdb register
>>> detail from the plugin for the reasons described above.
>>> ---
>>>    include/qemu/qemu-plugin.h   |  53 +++++++++++++++++-
>>>    plugins/api.c                | 102 +++++++++++++++++++++++++++++++++++
>>>    plugins/qemu-plugins.symbols |   2 +
>>>    3 files changed, 155 insertions(+), 2 deletions(-)
>>> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
>>> index 4daab6efd29..e3b35c6ee81 100644
>>> --- a/include/qemu/qemu-plugin.h
>>> +++ b/include/qemu/qemu-plugin.h
>>> @@ -11,6 +11,7 @@
>>>    #ifndef QEMU_QEMU_PLUGIN_H
>>>    #define QEMU_QEMU_PLUGIN_H
>>>    +#include <glib.h>
>>>    #include <inttypes.h>
>>>    #include <stdbool.h>
>>>    #include <stddef.h>
>>> @@ -227,8 +228,8 @@ struct qemu_plugin_insn;
>>>     * @QEMU_PLUGIN_CB_R_REGS: callback reads the CPU's regs
>>>     * @QEMU_PLUGIN_CB_RW_REGS: callback reads and writes the CPU's regs
>>>     *
>>> - * Note: currently unused, plugins cannot read or change system
>>> - * register state.
>>> + * Note: currently QEMU_PLUGIN_CB_RW_REGS is unused, plugins cannot change
>>> + * system register state.
>>>     */
>>>    enum qemu_plugin_cb_flags {
>>>        QEMU_PLUGIN_CB_NO_REGS,
>>> @@ -708,4 +709,52 @@ uint64_t qemu_plugin_end_code(void);
>>>    QEMU_PLUGIN_API
>>>    uint64_t qemu_plugin_entry_code(void);
>>>    +/** struct qemu_plugin_register - Opaque handle for a translated
>>> instruction */
>>> +struct qemu_plugin_register;
>>
>> What about identifying a register with an index in an array returned
>> by qemu_plugin_get_registers(). That saves troubles having the handle
>> member in qemu_plugin_reg_descriptor.
>>
>>> +
>>> +/**
>>> + * typedef qemu_plugin_reg_descriptor - register descriptions
>>> + *
>>> + * @name: register name
>>> + * @handle: opaque handle for retrieving value with qemu_plugin_read_register
>>> + * @feature: optional feature descriptor, can be NULL
>>
>> Why can it be NULL?
>>
>>> + */
>>> +typedef struct {
>>> +    char name[32];
>>
>> Why not const char *?
> 
> I was trying to avoid too many free floating strings. I could intern it
> in the API though.

It is nice to save pointer indirections whenever possible, but it's not 
so worth that it matches with the cost in this case. It requires extra 
code to copy and will be real trouble if somebody comes up with a very 
long register name for special registers.

> 
>>
>>> +    struct qemu_plugin_register *handle;
>>> +    const char *feature;
>>> +} qemu_plugin_reg_descriptor;
>>> +
>>> +/**
>>> + * qemu_plugin_get_registers() - return register list for vCPU
>>> + * @vcpu_index: vcpu to query
>>> + *
>>> + * Returns a GArray of qemu_plugin_reg_descriptor or NULL. Caller
>>> + * frees the array (but not the const strings).
>>> + *
>>> + * As the register set of a given vCPU is only available once
>>> + * the vCPU is initialised if you want to monitor registers from the
>>> + * start you should call this from a qemu_plugin_register_vcpu_init_cb()
>>> + * callback.
>>
>> Is this note really necessary? You won't know vcpu_index before
>> qemu_plugin_register_vcpu_init_cb() anyway.
> 
> Best to be clear I think.

Ok, but I still think it's a bit verbose. You can just say it's 
available only after qemu_plugin_register_vcpu_init_cb().

> 
>>
>>> + */
>>> +GArray * qemu_plugin_get_registers(unsigned int vcpu_index);
>>
>> Spurious space after *.
>>
>>> +
>>> +/**
>>> + * qemu_plugin_read_register() - read register
>>> + *
>>> + * @vcpu: vcpu index
>>> + * @handle: a @qemu_plugin_reg_handle handle
>>> + * @buf: A GByteArray for the data owned by the plugin
>>> + *
>>> + * This function is only available in a context that register read access is
>>> + * explicitly requested.
>>> + *
>>> + * Returns the size of the read register. The content of @buf is in target byte
>>> + * order. On failure returns -1
>>> + */
>>> +int qemu_plugin_read_register(unsigned int vcpu,
>>> +                              struct qemu_plugin_register *handle,
>>> +                              GByteArray *buf);
>>
>> Indention is not correct. docs/devel/style.rst says:
>>
>>> In case of function, there are several variants:
>>>
>>> * 4 spaces indent from the beginning
>>> * align the secondary lines just after the opening parenthesis of
>>      the first
> 
> Isn't that what it does?

Sorry, it was messed up by the email client on my side.

