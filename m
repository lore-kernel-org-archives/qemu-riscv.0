Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6769C41535
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 13:46:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGfq1-00072x-R7; Fri, 22 Dec 2023 08:45:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGfpy-00071D-6L
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 08:45:15 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGfpv-00041u-Pw
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 08:45:13 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40d31116dbeso19979575e9.3
 for <qemu-riscv@nongnu.org>; Fri, 22 Dec 2023 05:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703252708; x=1703857508; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1eQLtUBmvM7qf6L4q7EV35KVsS6WxNrpt1uXoUEq+k4=;
 b=SZOwQSHlPiyjLF24fVS3ogDYy45zRsD2vb0MKqCtEkoHZcZDvTec4vNj9XZmG/lbEj
 c9T9Phmrm1E/LyXs9UoDiiAohhbEO0AcmTEp+aw2/VXYwZx5bYCClRYW5qh2UgwVs8Px
 fEEH05SUQjTiwgjFt1K0b/g13+VBRtg3mlfhP3Cf0704pvmjqaLP5RpTyrVWQ/TSfDrU
 ya42osq9eFieO9F2PmdezP3qM909XH2HosndU2T0iGm0TtMiQxmk8Zrfu4vh4GdmnSPR
 UF+WodtBRj8yRCPoO3cE0GVVlDy1P/virG20HGVO715tN95ZQUu1LB8pZyNJE4Tj6o5d
 QPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703252708; x=1703857508;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1eQLtUBmvM7qf6L4q7EV35KVsS6WxNrpt1uXoUEq+k4=;
 b=hMu9SauLesxjq/7GhOWJ/agrVPSTKdWqQGw5IaIm15CbHandCeRPERM0+UJCEqtfN4
 S1ht21jO2J9/H6dMyR4Sl4t+cF9jzSNHG2UBTY9FnLTAaxLDNnGQeHbClA9+8KFc0iao
 ZJUJAhmqLVdzvJe+GAfB4U+3jIwkobNlPSCoJLPTb5gF6o+zQPJXQBEwzFCYlcQy7+mJ
 rKS8etYCpMt0oNrdvmyMQyXxiqT2EP6zeNTh0AuQidPXz0EOituTns1No4xIWmSfP1Fi
 7RPqFZrJXA9pjGDlzFn/sGyy5Vyy+qIxNB/xNwVFWCfutRdd7LByATc0EL9ViyTUrBC9
 eXqw==
X-Gm-Message-State: AOJu0Yw05YkLOfI8ty5S+Rp5I/1iW/NhdiLz5+qTSrnb2ugS1p1ABb69
 3PEvxskMRh0Gif7Cv219EJpG211DMfHYyQ==
X-Google-Smtp-Source: AGHT+IFyc707r97nFb1fUFU6MymgM12uRQv1WFsoBXvbFD/R85hDyverRoAN6WkYq3pdWfalSFssHg==
X-Received: by 2002:a05:600c:4f02:b0:40d:4d75:980 with SMTP id
 l2-20020a05600c4f0200b0040d4d750980mr8318wmq.71.1703252708181; 
 Fri, 22 Dec 2023 05:45:08 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 az3-20020a05600c600300b0040d4954ac04sm1253567wmb.43.2023.12.22.05.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 05:45:07 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 734CF5F7DA;
 Fri, 22 Dec 2023 13:45:07 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,  "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 John Snow <jsnow@redhat.com>,  Aurelien Jarno <aurelien@aurel32.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Yanan Wang
 <wangyanan55@huawei.com>,  Eduardo Habkost <eduardo@habkost.net>,  Brian
 Cain <bcain@quicinc.com>,  Laurent Vivier <laurent@vivier.eu>,  Palmer
 Dabbelt <palmer@dabbelt.com>,  Cleber Rosa <crosa@redhat.com>,  David
 Hildenbrand <david@redhat.com>,  Beraldo Leal <bleal@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,  Weiwei Li
 <liwei1518@gmail.com>,  Paul Durrant <paul@xen.org>,
 qemu-s390x@nongnu.org,  David Woodhouse <dwmw2@infradead.org>,  Liu
 Zhiwei <zhiwei_liu@linux.alibaba.com>,  Ilya Leoshkevich
 <iii@linux.ibm.com>,  Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>,  Alistair Francis
 <alistair.francis@wdc.com>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  Laurent Vivier <lvivier@redhat.com>,
 kvm@vger.kernel.org,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>,  Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,  qemu-ppc@nongnu.org,  Paolo
 Bonzini <pbonzini@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Nicholas Piggin <npiggin@gmail.com>,
 qemu-riscv@nongnu.org,  qemu-arm@nongnu.org,  Song Gao
 <gaosong@loongson.cn>,  Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,  Daniel Henrique
 Barboza <dbarboza@ventanamicro.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,  Bin Meng
 <bin.meng@windriver.com>
Subject: Re: [PATCH 37/40] plugins: add an API to read registers
In-Reply-To: <a26a55b2-240c-48c3-b341-48c1d7195bd9@daynix.com> (Akihiko
 Odaki's message of "Thu, 21 Dec 2023 22:19:25 +0900")
References: <20231221103818.1633766-1-alex.bennee@linaro.org>
 <20231221103818.1633766-38-alex.bennee@linaro.org>
 <a26a55b2-240c-48c3-b341-48c1d7195bd9@daynix.com>
User-Agent: mu4e 1.11.26; emacs 29.1
Date: Fri, 22 Dec 2023 13:45:07 +0000
Message-ID: <87y1dmxsf0.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2023/12/21 19:38, Alex Benn=C3=A9e wrote:
>> We can only request a list of registers once the vCPU has been
>> initialised so the user needs to use either call the get function on
>> vCPU initialisation or during the translation phase.
>> We don't expose the reg number to the plugin instead hiding it
>> behind
>> an opaque handle. This allows for a bit of future proofing should the
>> internals need to be changed while also being hashed against the
>> CPUClass so we can handle different register sets per-vCPU in
>> hetrogenous situations.
>> Having an internal state within the plugins also allows us to expand
>> the interface in future (for example providing callbacks on register
>> change if the translator can track changes).
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1706
>> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Based-on: <20231025093128.33116-18-akihiko.odaki@daynix.com>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>> v2
>>    - use new get whole list api, and expose upwards
>> vAJB:
>> The main difference to Akikio's version is hiding the gdb register
>> detail from the plugin for the reasons described above.
>> ---
>>   include/qemu/qemu-plugin.h   |  53 +++++++++++++++++-
>>   plugins/api.c                | 102 +++++++++++++++++++++++++++++++++++
>>   plugins/qemu-plugins.symbols |   2 +
>>   3 files changed, 155 insertions(+), 2 deletions(-)
>> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
>> index 4daab6efd29..e3b35c6ee81 100644
>> --- a/include/qemu/qemu-plugin.h
>> +++ b/include/qemu/qemu-plugin.h
>> @@ -11,6 +11,7 @@
>>   #ifndef QEMU_QEMU_PLUGIN_H
>>   #define QEMU_QEMU_PLUGIN_H
>>   +#include <glib.h>
>>   #include <inttypes.h>
>>   #include <stdbool.h>
>>   #include <stddef.h>
>> @@ -227,8 +228,8 @@ struct qemu_plugin_insn;
>>    * @QEMU_PLUGIN_CB_R_REGS: callback reads the CPU's regs
>>    * @QEMU_PLUGIN_CB_RW_REGS: callback reads and writes the CPU's regs
>>    *
>> - * Note: currently unused, plugins cannot read or change system
>> - * register state.
>> + * Note: currently QEMU_PLUGIN_CB_RW_REGS is unused, plugins cannot cha=
nge
>> + * system register state.
>>    */
>>   enum qemu_plugin_cb_flags {
>>       QEMU_PLUGIN_CB_NO_REGS,
>> @@ -708,4 +709,52 @@ uint64_t qemu_plugin_end_code(void);
>>   QEMU_PLUGIN_API
>>   uint64_t qemu_plugin_entry_code(void);
>>   +/** struct qemu_plugin_register - Opaque handle for a translated
>> instruction */
>> +struct qemu_plugin_register;
>
> What about identifying a register with an index in an array returned
> by qemu_plugin_get_registers(). That saves troubles having the handle
> member in qemu_plugin_reg_descriptor.
>
>> +
>> +/**
>> + * typedef qemu_plugin_reg_descriptor - register descriptions
>> + *
>> + * @name: register name
>> + * @handle: opaque handle for retrieving value with qemu_plugin_read_re=
gister
>> + * @feature: optional feature descriptor, can be NULL
>
> Why can it be NULL?
>
>> + */
>> +typedef struct {
>> +    char name[32];
>
> Why not const char *?

I was trying to avoid too many free floating strings. I could intern it
in the API though.

>
>> +    struct qemu_plugin_register *handle;
>> +    const char *feature;
>> +} qemu_plugin_reg_descriptor;
>> +
>> +/**
>> + * qemu_plugin_get_registers() - return register list for vCPU
>> + * @vcpu_index: vcpu to query
>> + *
>> + * Returns a GArray of qemu_plugin_reg_descriptor or NULL. Caller
>> + * frees the array (but not the const strings).
>> + *
>> + * As the register set of a given vCPU is only available once
>> + * the vCPU is initialised if you want to monitor registers from the
>> + * start you should call this from a qemu_plugin_register_vcpu_init_cb()
>> + * callback.
>
> Is this note really necessary? You won't know vcpu_index before
> qemu_plugin_register_vcpu_init_cb() anyway.

Best to be clear I think.

>
>> + */
>> +GArray * qemu_plugin_get_registers(unsigned int vcpu_index);
>
> Spurious space after *.
>
>> +
>> +/**
>> + * qemu_plugin_read_register() - read register
>> + *
>> + * @vcpu: vcpu index
>> + * @handle: a @qemu_plugin_reg_handle handle
>> + * @buf: A GByteArray for the data owned by the plugin
>> + *
>> + * This function is only available in a context that register read acce=
ss is
>> + * explicitly requested.
>> + *
>> + * Returns the size of the read register. The content of @buf is in tar=
get byte
>> + * order. On failure returns -1
>> + */
>> +int qemu_plugin_read_register(unsigned int vcpu,
>> +                              struct qemu_plugin_register *handle,
>> +                              GByteArray *buf);
>
> Indention is not correct. docs/devel/style.rst says:
>
>> In case of function, there are several variants:
>>
>> * 4 spaces indent from the beginning
>> * align the secondary lines just after the opening parenthesis of
>     the first

Isn't that what it does?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

