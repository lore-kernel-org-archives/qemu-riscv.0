Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2A9C47073
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 13:23:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLNgW-0007IU-07; Thu, 04 Jan 2024 08:22:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rLNgS-0007Gf-VS
 for qemu-riscv@nongnu.org; Thu, 04 Jan 2024 08:22:52 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rLNgQ-0006Np-7T
 for qemu-riscv@nongnu.org; Thu, 04 Jan 2024 08:22:52 -0500
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5cdfed46372so346251a12.3
 for <qemu-riscv@nongnu.org>; Thu, 04 Jan 2024 05:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1704374568; x=1704979368;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+UaUoSEUxULvKOz2jhQuoYpr4rLktnoBGVluoHHYMOU=;
 b=1bv073tZz+lRFULvmgTlv/p2kj//bEO6qfFPNrSt8Aw+wvsExnWycEluG3lr1Y/Taf
 67KetNaXmQsUnGTbTWBHFe5tr3iZb6xbdFllngNrarqaRLhkA/jVGWfyy4MlTbuGubfL
 ACfDkTArPFcHJ/azShjoMH4hZsTQULnwDcjYaJ4E3up0nRccqSLqKHZO8u9a7/8ZHDYE
 Jf1zlC/jbDFpogsl37LxbK0VRxczrAHpqyRgZoo0sp5f/2C47WQNuLUu8sRzIL6Q8Ert
 z4yKQC2pONUlKr1WjQWRRX7LhGuhSN3r35XsbFQLfnbAy99cRhlW2OzkNJ6bNh0bXLLr
 L3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704374568; x=1704979368;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+UaUoSEUxULvKOz2jhQuoYpr4rLktnoBGVluoHHYMOU=;
 b=oOUIFXNKtY4O+eV3Miy1AIXo2g+zeE2my9AvOhbQbfbbwaofZw9K8gqclEk1mViLzh
 vg6jdbm/rFfhihW17PvOHM+yQH5I2Chfklfs0j+OsTVBYDhNIr7FdphzSx3F298E8CT5
 wqavra8mU/GMgx3On/j3aLDhPT3+0AlMvH5x45Oy816eJWqAxNyuZ+ICqHwjCWtyo1pW
 dQo6IDZAziwimUe3JaGSunJlx5vJLSB2peRMlkr5IyhbItBcZWXbsZzc3dvFPinKM9m5
 aV1r/99Ewha7nSGowaL1LN6dKRAI+k2wlYrRd62DP89xnrEqh+X0jHdjQ+/m/WjSGO64
 aOgg==
X-Gm-Message-State: AOJu0YzEMApmvnGBW1ipvE3BUCuchH4cvwOclfDW65yBK5zvs5j/IrnY
 uA+dVUq8/TbmLXvTEj5M+CUCHxkTyW5FcA==
X-Google-Smtp-Source: AGHT+IFokc8I4M12wpRZbGFseRS03dNmYQJFm1uTthsqLJ9zrTgE2OKJgGw72Fa3MExoY1OmaCb7cA==
X-Received: by 2002:a05:6a20:1445:b0:199:247a:1044 with SMTP id
 a5-20020a056a20144500b00199247a1044mr201672pzi.17.1704374568632; 
 Thu, 04 Jan 2024 05:22:48 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:9ac7:6d57:2b16:6932?
 ([2400:4050:a840:1e00:9ac7:6d57:2b16:6932])
 by smtp.gmail.com with ESMTPSA id
 a25-20020a634d19000000b005c6617b52e6sm24378620pgb.5.2024.01.04.05.22.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 05:22:48 -0800 (PST)
Message-ID: <4cf878c6-0adf-4c97-b404-446d8a3dabf1@daynix.com>
Date: Thu, 4 Jan 2024 22:22:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 38/43] plugins: add an API to read registers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-39-alex.bennee@linaro.org>
 <52cac44e-a467-4748-8c5b-c9c47f5b0f79@daynix.com>
 <87cyuhguf4.fsf@draig.linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87cyuhguf4.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::530;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 2024/01/04 21:22, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2024/01/04 2:33, Alex Bennée wrote:
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
>>> v3
>>>     - also g_intern_string the register name
>>>     - make get_registers documentation a bit less verbose
>>> v2
>>>     - use new get whole list api, and expose upwards
>>> vAJB:
>>> The main difference to Akikio's version is hiding the gdb register
>>> detail from the plugin for the reasons described above.
>>> ---
>>>    include/qemu/qemu-plugin.h   |  51 +++++++++++++++++-
>>>    plugins/api.c                | 102 +++++++++++++++++++++++++++++++++++
>>>    plugins/qemu-plugins.symbols |   2 +
>>>    3 files changed, 153 insertions(+), 2 deletions(-)
>>> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
>>> index 4daab6efd29..95380895f81 100644
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
>>> @@ -708,4 +709,50 @@ uint64_t qemu_plugin_end_code(void);
>>>    QEMU_PLUGIN_API
>>>    uint64_t qemu_plugin_entry_code(void);
>>>    +/** struct qemu_plugin_register - Opaque handle for register
>>> access */
>>> +struct qemu_plugin_register;
>>
>> Just in case you missed my comment for the earlier version:
>>
>> What about identifying a register with an index in an array returned
>> by qemu_plugin_get_registers(). That saves troubles having the handle
>> member in qemu_plugin_reg_descriptor.
> 
> The handle gets de-referenced internally in the plugin api and
> additional checking could be added there. If we pass an index then we'd
> end up having to track the index assigned during get_registers as well
> as account for a potential skew in the index value if the register
> layout varies between vCPUs (although I admit this is future proofing
> for potential heterogeneous models).
> 
> The concept of opaque handle == pointer is fairly common in the QEMU
> code base. We are not making it hard for a plugin author to bypass this
> "protection", just making it clear if you do so your violating the
> principle of the API.

Now I get the idea. Indeed index values are not guaranteed to be stable 
across CPUs.

Why don't you pass gdb_reg_num as is then? qemu_plugin_register has the 
name member, but it's unused so gdb_reg_num is effectively the only 
member we need. You can even cast gdb_reg_num to (struct 
qemu_plugin_register *), but I don't think pointers are more opaque or 
future-proof than integers.

