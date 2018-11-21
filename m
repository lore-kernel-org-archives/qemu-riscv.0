Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPH7I-0007b7-Nx
	for mharc-qemu-riscv@gnu.org; Tue, 20 Nov 2018 20:15:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPH7G-0007a9-PY
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 20:15:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPH7F-0008T6-Sf
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 20:15:42 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:46005)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPH7D-0008Ph-R7; Tue, 20 Nov 2018 20:15:40 -0500
Received: by mail-lj1-x243.google.com with SMTP id s5-v6so3319938ljd.12;
	Tue, 20 Nov 2018 17:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rKVnnfpZ8M6l+0sq3CQigKeFyOs2JdfMjOt1nmkSadQ=;
	b=b3nl2CAcUO46OCySNpKYQt7Oi/pksGtDNPnnwTiPKOk3GVnMa8wtzgoKH2gYIcDyKR
	3fm3K7Q2q51HcNFYBQG1Mcvm6bx2V+xzYXn4NIbN6NxAsePWyL7bqMIkImHy0WulaTp3
	3wXuhbCraJLfw9DHAIoF/HW6n2zSbmesbZCMg3ZjZOinKf9/wPNYJVyiIxUbR+luuQjZ
	BMyhUnFyipqRd+ymbqwGDQGfNUKXvE4Bvw2SgWPQcjqudqfLL1Ht+G4bFFL7AJJwvJMJ
	TYzBN5NPv31axVdu0i9O7CY+itEKZLBhNAJmjWpcFzs2CtJSRQ1rlboiBSY2eatXLyTB
	jsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rKVnnfpZ8M6l+0sq3CQigKeFyOs2JdfMjOt1nmkSadQ=;
	b=hdCGIVNyOV2RJFOzk6etjNq4fLLXsQQx9+HFHgGK3dVG5lq7uoj8LRWPRvuWC68T0Z
	mU40SZ+qaNbiq3rnD0IwWMHWMX+/TzpRErONbeRdnXxJWzWr8qsyhLxNSImAQztKvx+1
	ZUj6YDkUlr2rQyWN7s91ijj15Xal8XoU3bB3Z9k09YdnMrVkYzVVuRGbrgr4YXZZFkfd
	FvsiXFU2QWZtbdatri71jehxlzNxMhkjBR+qJD5I04DImymhk9t1yzrmgE1QhM4tVEJX
	LTMQd549NbTzC2Wu8sxFovdVrznUJC3HKuGLEAUx0gi1b93LmzVqmF8RPJVCmJIkRaui
	yA2g==
X-Gm-Message-State: AGRZ1gJVJ1GX/FAtCrDE3uEZ4cJ0PZQhIj7k/EREOhWhJ0oQ9hij/W8l
	jJFCYVIcB7UmnIeOmd2poxoJNoOxEIo55qpsULQ=
X-Google-Smtp-Source: AFSGD/U36+CmmGtfaSkiS6SbeYIq7yZI1hMBciErVXW+FqP8azaRsIPCa1chOnjGg557tSMCsyET34JNcTkBg7u918s=
X-Received: by 2002:a2e:8605:: with SMTP id
	a5-v6mr2518565lji.145.1542762938023; 
	Tue, 20 Nov 2018 17:15:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<1fe9630dd4ad73b8581684cd0ed6d5fa2918390f.1542321076.git.alistair.francis@wdc.com>
	<34cb4780-f35f-9bd5-7980-fae18e3e93dd@linaro.org>
In-Reply-To: <34cb4780-f35f-9bd5-7980-fae18e3e93dd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Nov 2018 17:15:11 -0800
Message-ID: <CAKmqyKMh3T7w-NsP-i2HaRUHvR-0BhqeyTgd2mD0hnH9k8gZiQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 11/23] riscv: tcg-target: Add
 the relocation functions
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
X-List-Received-Date: Wed, 21 Nov 2018 01:15:43 -0000

On Fri, Nov 16, 2018 at 12:33 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/15/18 11:35 PM, Alistair Francis wrote:
> > +static void reloc_sbimm12(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
> > +{
> > +    intptr_t offset = (intptr_t)target - (intptr_t)code_ptr;
> > +    tcg_debug_assert(offset == sextract32(offset, 1, 12) << 1);
> > +
> > +    code_ptr[0] |= encode_sbimm12(offset);
> > +}
>
> FYI, I have an in-flight patch for 4.0 that will make patch_reloc return a bool
> for relocation success, which will move these asserts.
>
> http://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg02237.html

Thanks, I'll keep an eye on this.

>
>
> > +static void reloc_call(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
> > +{
> > +    intptr_t offset = (intptr_t)target - (intptr_t)code_ptr;
> > +    tcg_debug_assert(offset == (int32_t)offset);
> > +
> > +    int32_t hi20 = ((offset + 0x800) >> 12) << 12;
> > +    int32_t lo12 = offset - hi20;
> > +
> > +    code_ptr[0] |= encode_uimm20(hi20);
> > +    code_ptr[1] |= encode_imm12(lo12);
> > +}
> > +
>
> This is ok for patching during generation, but it is not ok for
> tb_target_set_jmp_target from patch 9.
>
> Will the riscv-32 compiler use a FSTD insn to implement atomic_set for 64-bit?
>  If not, you may be just better off using the indirect method.

I'm not sure. Is the indirect method just using atomic set, because
that is what I have now?

Alistair

>
>
> r~

