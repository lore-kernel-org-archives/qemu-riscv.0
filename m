Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196FDC47073
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 12:23:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLMk5-0004VF-By; Thu, 04 Jan 2024 07:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rLMk3-0004TY-GD
 for qemu-riscv@nongnu.org; Thu, 04 Jan 2024 07:22:31 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rLMjz-0003gw-Rj
 for qemu-riscv@nongnu.org; Thu, 04 Jan 2024 07:22:31 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e3485f0e1so3250895e9.3
 for <qemu-riscv@nongnu.org>; Thu, 04 Jan 2024 04:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704370945; x=1704975745; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aVYIwMJOT/YdMTd5+YIOmWGlpHzauE+h8CsP+z7S6+8=;
 b=CENhCJFDWrR+I2mE6kOLyn3T2r6wHX7z5JldbRBVa4JrwtdyTuV7OrGU9+5wNGXTf0
 +tSOX4OsqZOd+TZz3c9f2gTAwnEn2Ld1dzXuDwV2OZ4pV50SdfB2nCPB+G09t1xGqrUN
 V3HgEiTTkoPnQ+Ww9woKIKOEEmOxQ58njTbzEsQqzeNBLXjHAhnYWzWbshZbOB8qi4HN
 CpIJlGKf+aUVQwA6HNiQwnV8iilwL9HjfYcLoXZIygldPoh2tFXNQa689HRbOrgTBb0r
 zJZEpwfiEOxhUfGW9IgCOqZAaISU2i2pEU614hYSkRk3wM/MKIeLj5t+Apr/BG1HxABH
 eAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704370945; x=1704975745;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aVYIwMJOT/YdMTd5+YIOmWGlpHzauE+h8CsP+z7S6+8=;
 b=thOQhRE2TzBrFgmu6F0VUSaeIp34xmCKwtkLYbJG8AHPmhBiuSGN+m8vqI9vhf42C4
 H6MbwJIQAZliswo+41+jCYJ9pxoxpslmiwLKE37vLycmoM2QFiNBhtk7zQmjR/C2/RMO
 q85GYyjuUp0EdxHTrduLCBRxD4sBdbBRWKumrXLI+lEMKzwxPkvPczeDNAqOIyBGp+wP
 HnJDB0YiLNrJRslOhNjTB1Amps5oGowS4jHh+zgWLH26t248FYLfR48h1y8RUC8amlEV
 qIY8hLGqT63rdo8lN1fxXBN1lh26/+6h0VQpCYZUJcgpljK4kTkNXueI91yRyFrmZ7U7
 Dcjw==
X-Gm-Message-State: AOJu0Yzh/TDelF1MBkZm0v13M38gJDRlIYZeLV2p10qk8EfSOM6ZHhhQ
 4mzCI/TWcHyjJy+o4NriYA6vQFzl7IC5iQ==
X-Google-Smtp-Source: AGHT+IESZ6CAtWXu3+NTv00JGxGiUQOBGWvfU2/hoP3T/WPXVHRBP2upx0cmIZsx1q9LTKnhMAQE1Q==
X-Received: by 2002:a05:600c:d6:b0:40d:7607:a9a7 with SMTP id
 u22-20020a05600c00d600b0040d7607a9a7mr289270wmm.99.1704370944510; 
 Thu, 04 Jan 2024 04:22:24 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 k9-20020a05600c1c8900b0040d772030c2sm5545801wms.44.2024.01.04.04.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 04:22:24 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B05F75F92F;
 Thu,  4 Jan 2024 12:22:23 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,  qemu-s390x@nongnu.org,  qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,  Song Gao
 <gaosong@loongson.cn>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>,  Aurelien Jarno
 <aurelien@aurel32.net>,  Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>,  Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>,  Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,  David Woodhouse
 <dwmw2@infradead.org>,  Laurent Vivier <laurent@vivier.eu>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Brian Cain <bcain@quicinc.com>,  Daniel Henrique
 Barboza <danielhb413@gmail.com>,  Beraldo Leal <bleal@redhat.com>,  Paul
 Durrant <paul@xen.org>,  Mahmoud Mandour <ma.mandourr@gmail.com>,  Thomas
 Huth <thuth@redhat.com>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Cleber Rosa <crosa@redhat.com>,  kvm@vger.kernel.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  qemu-arm@nongnu.org,  Weiwei Li
 <liwei1518@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  John
 Snow <jsnow@redhat.com>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Nicholas Piggin <npiggin@gmail.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Ilya Leoshkevich <iii@linux.ibm.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,  qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2 38/43] plugins: add an API to read registers
In-Reply-To: <52cac44e-a467-4748-8c5b-c9c47f5b0f79@daynix.com> (Akihiko
 Odaki's message of "Thu, 4 Jan 2024 21:05:22 +0900")
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-39-alex.bennee@linaro.org>
 <52cac44e-a467-4748-8c5b-c9c47f5b0f79@daynix.com>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Thu, 04 Jan 2024 12:22:23 +0000
Message-ID: <87cyuhguf4.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

> On 2024/01/04 2:33, Alex Benn=C3=A9e wrote:
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
>> v3
>>    - also g_intern_string the register name
>>    - make get_registers documentation a bit less verbose
>> v2
>>    - use new get whole list api, and expose upwards
>> vAJB:
>> The main difference to Akikio's version is hiding the gdb register
>> detail from the plugin for the reasons described above.
>> ---
>>   include/qemu/qemu-plugin.h   |  51 +++++++++++++++++-
>>   plugins/api.c                | 102 +++++++++++++++++++++++++++++++++++
>>   plugins/qemu-plugins.symbols |   2 +
>>   3 files changed, 153 insertions(+), 2 deletions(-)
>> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
>> index 4daab6efd29..95380895f81 100644
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
>> @@ -708,4 +709,50 @@ uint64_t qemu_plugin_end_code(void);
>>   QEMU_PLUGIN_API
>>   uint64_t qemu_plugin_entry_code(void);
>>   +/** struct qemu_plugin_register - Opaque handle for register
>> access */
>> +struct qemu_plugin_register;
>
> Just in case you missed my comment for the earlier version:
>
> What about identifying a register with an index in an array returned
> by qemu_plugin_get_registers(). That saves troubles having the handle
> member in qemu_plugin_reg_descriptor.

The handle gets de-referenced internally in the plugin api and
additional checking could be added there. If we pass an index then we'd
end up having to track the index assigned during get_registers as well
as account for a potential skew in the index value if the register
layout varies between vCPUs (although I admit this is future proofing
for potential heterogeneous models).

The concept of opaque handle =3D=3D pointer is fairly common in the QEMU
code base. We are not making it hard for a plugin author to bypass this
"protection", just making it clear if you do so your violating the
principle of the API.

>
> Regards,
> Akihiko Odaki

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

