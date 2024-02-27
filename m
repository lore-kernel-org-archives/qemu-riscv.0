Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134F2C54798
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 10:29:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1reuhz-0004c5-Gb; Tue, 27 Feb 2024 05:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1reuhw-0004Zt-OC
 for qemu-riscv@nongnu.org; Tue, 27 Feb 2024 05:29:10 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1reuhv-0005bw-1V
 for qemu-riscv@nongnu.org; Tue, 27 Feb 2024 05:29:08 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33de4d3483eso942852f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 27 Feb 2024 02:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709029745; x=1709634545; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aJ8i75KAHvJ2oPWrdTA7p1puHwb3joN0R2Dvw9W2kPI=;
 b=bEdu4dAGPCIgJ4ELS7h2rwSOGGm2wB2/HsK/R6KxQXUOQTAjZXv14AfajelHNVAI56
 5TDJjseqKkQJj4O1/+tvySYmyN14ewg9Qn5kzTVNuFLWuXU4ENjtpzIOH+TB9A909gmQ
 zSIxQ3R0J/lEtFeA/ZsfR2Ewtbe8NvJ/+HBWlE3b3ZjozwwSOQyxgZ+f3ClheBETija8
 45U1G0dpNWgwoCzUXgOnkiDIDKwdFeLUxqIe3/8U19ZiE37dVLVZdk9+fA3q9Ol+cmMF
 W6uoiFrqkpF+qB4Hi0QBmk6VPJQyTD7Zr7W3oQmVguYcwjjdLgbqoPCkI5ak5E9eCO/R
 Bqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709029745; x=1709634545;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aJ8i75KAHvJ2oPWrdTA7p1puHwb3joN0R2Dvw9W2kPI=;
 b=PoIpHZmOciXCY3uimeGg4OT3rbqzYDT968ywc3ZemduXw8R7DzghPsi6GP4ELiyg9+
 cwzy7GVCZrnA7p+TUKzZd0BMMvUj7nl7BPOpKiOuzZa1Twtb74J4AZCeaqovVaAoyBwx
 MfZfkNiXPeoRsYfHcGKU9rsp3eMo5fNGYss5UZd902wLhBIF/hNaqPsWEGRAq5s+dx0Z
 H4lGm6w+a8W7Q0ifmYufg8LtVNdIg+SshTr96fx3Dt3UGiUyrFW2S6M0HAC8PbQxCCmN
 F6LzctsWSiMps9xEPR4tFdv4GwumgsxHLyzjvtyL8JyZMgZNZrRgk9myUWQq3iTJJiPV
 ODqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr3aZXHwMt1w7PDHFUbM2ICcwhLdyCH6JLREnP268dTco/8XvfjVUPndX746lyxpo7sd+bZHKai1vFxrKzvB9YsS6/WhA=
X-Gm-Message-State: AOJu0Yz43zJeJan06iSi4f1m+ucY8O1T2lxInQwh/SQOmU6qgH+PHC5f
 Dh49GDXCgHgJ1wj+2vlUdL+Pkts7RqBU8IKZQDxmDlqAd9L49Rk5x3Byz6s3HE8=
X-Google-Smtp-Source: AGHT+IGtozMphfXM7F5N5fY2DEzKOEwxQgXHyzwJK7FWGl+5Uxs4931lSt/xQOGzHECkVdlWLFfwwQ==
X-Received: by 2002:a5d:5f8d:0:b0:33d:ca56:a616 with SMTP id
 dr13-20020a5d5f8d000000b0033dca56a616mr5651053wrb.36.1709029744954; 
 Tue, 27 Feb 2024 02:29:04 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 bv15-20020a0560001f0f00b0033d47c6073esm11024174wrb.12.2024.02.27.02.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 02:29:04 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4E8A15F754;
 Tue, 27 Feb 2024 10:29:04 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,  Nicholas Piggin <npiggin@gmail.com>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,  Peter
 Maydell <peter.maydell@linaro.org>,  qemu-riscv@nongnu.org,  Michael
 Rolnik <mrolnik@gmail.com>,  Song Gao <gaosong@loongson.cn>,  Alexandre
 Iooss <erdnaxe@crans.org>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,  John Snow <jsnow@redhat.com>,  Eduardo
 Habkost <eduardo@habkost.net>,  Mahmoud Mandour <ma.mandourr@gmail.com>,
 qemu-arm@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Cleber Rosa <crosa@redhat.com>,
 qemu-ppc@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>,
 qemu-s390x@nongnu.org,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Thomas Huth <thuth@redhat.com>,  Yoshinori
 Sato <ysato@users.sourceforge.jp>,  Yanan Wang <wangyanan55@huawei.com>,
 Brian Cain <bcain@quicinc.com>,  Ilya Leoshkevich <iii@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Bin Meng <bin.meng@windriver.com>,  Laurent
 Vivier <laurent@vivier.eu>,  Palmer Dabbelt <palmer@dabbelt.com>,  Daniel
 Henrique Barboza <danielhb413@gmail.com>,  Alistair Francis
 <alistair.francis@wdc.com>
Subject: Re: [PATCH v3 21/27] plugins: add an API to read registers
In-Reply-To: <485e6093-54e9-4ce4-ae01-c44525b202ef@daynix.com> (Akihiko
 Odaki's message of "Tue, 27 Feb 2024 19:15:15 +0900")
References: <20240226165646.425600-1-alex.bennee@linaro.org>
 <20240226165646.425600-22-alex.bennee@linaro.org>
 <b7aac53e-cde5-4596-b0fc-d39f52d4ceb8@daynix.com>
 <878r36dxsv.fsf@draig.linaro.org>
 <485e6093-54e9-4ce4-ae01-c44525b202ef@daynix.com>
User-Agent: mu4e 1.12.0; emacs 29.1
Date: Tue, 27 Feb 2024 10:29:04 +0000
Message-ID: <8734tedwun.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2024/02/27 19:08, Alex Benn=C3=A9e wrote:
>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>=20
>>> On 2024/02/27 1:56, Alex Benn=C3=A9e wrote:
>>>> We can only request a list of registers once the vCPU has been
>>>> initialised so the user needs to use either call the get function on
>>>> vCPU initialisation or during the translation phase.
>>>> We don't expose the reg number to the plugin instead hiding it
>>>> behind
>>>> an opaque handle. For now this is just the gdb_regnum encapsulated in
>>>> an anonymous GPOINTER but in future as we add more state for plugins
>>>> to track we can expand it.
>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1706
>>>> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>> Message-Id: <20240103173349.398526-39-alex.bennee@linaro.org>
>>>> Based-on: <20231025093128.33116-18-akihiko.odaki@daynix.com>
>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>
>>> Hi,
>>>
>>> Mostly looks good. I have a few trivial comments so please have a look
>>> at them.
>> Done
>> <snip>
>>>> +        g_array_append_val(find_data, desc);
>>>> +    }
>>>> +
>>>> +    return find_data;
>>>> +}
>>>> +
>>>> +GArray *qemu_plugin_get_registers(void)
>>>> +{
>>>> +    g_assert(current_cpu);
>>>> +
>>>> +    g_autoptr(GArray) regs =3D gdb_get_register_list(current_cpu);
>>>> +    return regs->len ? create_register_handles(current_cpu, regs) : N=
ULL;
>>>
>>> Why do you need regs->len check?
>> Not all guests expose register to gdb so we need to catch that:
>>    TEST    catch-syscalls-with-libinsn.so on alpha
>> **
>> ERROR:../../plugins/api.c:459:qemu_plugin_get_registers: assertion faile=
d: (regs->len)
>> Aborted
> Certainly regs->len can be 0, but why do you need to return NULL in
> that case? Can't qemu_plugin_get_registers() return an empty array
> just as gdb_get_register_list() does?

That seems more troublesome to handle the other end. NULL is nothing is
a fairly common pattern here which makes short-circuiting the array
iteration simple.


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

