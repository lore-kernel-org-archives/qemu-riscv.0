Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gSCuY-0006oG-At
	for mharc-qemu-riscv@gnu.org; Wed, 28 Nov 2018 22:22:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gSCuT-0006he-8N
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 22:22:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gSCgy-0002b0-42
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 22:08:43 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44573)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gSCgx-0002a9-Ru
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 22:08:39 -0500
Received: by mail-pg1-x530.google.com with SMTP id t13so232795pgr.11
	for <qemu-riscv@nongnu.org>; Wed, 28 Nov 2018 19:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=HqwAk8E39wEzz+Eoh6T2VSQ8KEKyHhHR1D86H5uJwxU=;
	b=GNvtlK1qD5LPMFcwr+7Y5Q1bAqcxNohSeiFxJ2l61GNK9E0hB3Jqj/ZFkgi4xZzoF+
	piOqo2DO64LrnDOYOHogG4xrZdk+PU1nbujSK4he/XQVGk2+jyJ5tBl0utetBX88Fw0O
	3I/z6V8BXLEeuhtKp8f69t+qJ8scpibqiAkjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=HqwAk8E39wEzz+Eoh6T2VSQ8KEKyHhHR1D86H5uJwxU=;
	b=JVpSL9zmRVH+a5jgLgElMj2cHNjRGlnujuZvJhP3QszkcqowwB1akQJQfGGPm/I5Ba
	2myLuCpyOoBUwibytyffHtzUcm7d/I4kdcPBkS787zLr1u2KULlXrH7BdK/KJxwL+8tt
	MR2x6w5AOBLvNYAx01DM7Y1YhecPLLQ/VXc23YWfVarLB3u5Gyb5zC4iCqnhOszykWwz
	jG44STnxbrxvsXw+gsyHCv/Z2nsbgvTn8woU+3B+KEZE2c8I2fBFjmToBcCyaFdK0M7J
	m9GwmIZP0vxj4jk9fcYJb7mQx0hrk8cZblWzBr5udDd7PT0mz/4O0f7UQrKVBJ4EskGN
	bXXw==
X-Gm-Message-State: AA+aEWYn1NJiFAYGGA6kNunzcOxdx7gcVMFaVT/fuwxhCMnFs0dKu84j
	6C83/3QuGHxiUZHB621M0zooU+Jb3mE=
X-Google-Smtp-Source: AFSGD/W2OcJod9N9liYtQd84i9se8nfVrtX+CfFJXuCze7PsG8aSH1yx9kxlUTMx/MbapsadaiRgbQ==
X-Received: by 2002:a63:4d0e:: with SMTP id a14mr35824596pgb.408.1543460918142;
	Wed, 28 Nov 2018 19:08:38 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-170-180.tukw.qwest.net.
	[97.113.170.180]) by smtp.gmail.com with ESMTPSA id
	w136sm476330pfd.169.2018.11.28.19.08.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 19:08:37 -0800 (PST)
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
References: <cover.1543352682.git.alistair.francis@wdc.com>
	<aa41323b013a6c77e28d487d49026df36d60e4c5.1543352682.git.alistair.francis@wdc.com>
	<ea1df40c-ce6c-16a0-4256-298f32748c6c@linaro.org>
	<CAKmqyKMDJuX=eqbfG2ZLjmVJySf9SGGK2bdhmV6jS_jODGUkTA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2f6eb76f-ce2a-fc32-4270-957734c132ac@linaro.org>
Date: Wed, 28 Nov 2018 19:08:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMDJuX=eqbfG2ZLjmVJySf9SGGK2bdhmV6jS_jODGUkTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::530
Subject: Re: [Qemu-riscv] [RFC v2 14/24] riscv: tcg-target: Add branch and
 jump instructions
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2018 03:22:40 -0000

On 11/28/18 5:06 PM, Alistair Francis wrote:
> On Wed, Nov 28, 2018 at 12:15 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 11/27/18 1:08 PM, Alistair Francis wrote:
>>> +static inline void tcg_out_goto_long(TCGContext *s, tcg_insn_unit *target)
>>> +{
>>> +    ptrdiff_t offset = tcg_pcrel_diff(s, target);
>>> +
>>> +    if (offset == sextract64(offset, 0, 26)) {
>>> +        tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, offset);
>>> +    } else {
>>> +        tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP0, (intptr_t)target);
>>> +        tcg_out_opc_jump(s, OPC_JAL, TCG_REG_TMP0, 0);
>>> +    }
>>> +}
>>> +
>>> +static void tcg_out_call_int(TCGContext *s, tcg_insn_unit *arg, bool tail)
>>> +{
>>> +    TCGReg link = tail ? TCG_REG_ZERO : TCG_REG_RA;
>>> +    ptrdiff_t offset = tcg_pcrel_diff(s, arg);
>>> +    if (offset == sextract64(offset, 1, 20) << 1) {
>>
>> s/20/26/
>>
>> Seems like there ought to be more shared code between tcg_out_call_int and
>> tcg_out_goto_long, really.
> 
> I think tcg_out_goto_long can just be removed and replaced with
> tcg_out_call() right?

Yes, tcg_out_goto_long(s, dest) = tcg_out_call_int(s, dest, true).


r~

