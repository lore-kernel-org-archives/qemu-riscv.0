Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDZ2Y-0005D8-On
	for mharc-qemu-riscv@gnu.org; Thu, 26 Sep 2019 15:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48566)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iDZ2U-00057X-1m
 for qemu-riscv@nongnu.org; Thu, 26 Sep 2019 15:02:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iDZ2S-0001Qj-Dx
 for qemu-riscv@nongnu.org; Thu, 26 Sep 2019 15:02:53 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42878)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iDZ2S-0001P1-4r
 for qemu-riscv@nongnu.org; Thu, 26 Sep 2019 15:02:52 -0400
Received: by mail-wr1-x444.google.com with SMTP id n14so3671829wrw.9
 for <qemu-riscv@nongnu.org>; Thu, 26 Sep 2019 12:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=5SMI6xGAzqDdDwn+k9vtD4cATFgG80u6NgLpli1Q3iU=;
 b=G+wSgQU6s12Y/BU0/PL8j2fj1lK8e2PIPF/52IXpImpXNq6T3Xrnby9qGywj6MpL0R
 sJsFlhbWk5485o8OGrdNskpfcKHBthOn/FpDHcS/8agrXxr98XZ19bL8GyywBsNtMWNn
 6eol6K9o7aCjsS2Vql0CoRvoDANl1dvk0uUDjP6mdquX6O7c6yXAvuLQY4LqQFVER3MK
 N8oSMrLVmGlWOkihcuFkiO1tekTVd2H/5JMfKKS4240jdUaksnhLjOgRiiMi8znBZBw2
 9Ej+D+dfAwvz/C/PKA+iXuAZU0p9diS/5uv06IArc9DsIxfEzoBx2XndJcuASihVil7x
 jPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=5SMI6xGAzqDdDwn+k9vtD4cATFgG80u6NgLpli1Q3iU=;
 b=X3Qs59sWLF/6y1CVmGG5oYexpFrNduAFvmf79rlTwq1AcriULIEwg8hYhOz5YniuUR
 iz/F8uhOhkiHi30EQmFzr4QSUUKMNXCTO7eflRvQr2Vko9uNTeD+mcJwMCjucutKT6nq
 7ELyPR2KAltNijkR38q2cDdcK01eVDCajuCzxQcXmg0FbzpGxXIHRCITzMi87zLGrhxV
 AxZk8ZsVUtKLSeG/HgKUGuGT2xXRUnfnovr3erTjahP3ww/tewfsrp95p8T4JM54rGOv
 w3amiueGfPr6Jz9q0/lnZYUNfF6C9Isk4WLlsmjQcuQiSiUETb8Mk9JIiAyoAN+pCQPP
 Hirg==
X-Gm-Message-State: APjAAAW8Rh9QgOhQUzbzyCPng9Ia+SL/LjsUyGVDd4gPMHe/6m0QxVVF
 GoYfTNn820CfULxGw/K5vPZKJg==
X-Google-Smtp-Source: APXvYqw0Rz5FY5mMBC8SqbdHOlCzcwTJTZ/6gkqWWoZUGIT+YVr0dfLRjwBS6+nNqspm7+GnQNFJFw==
X-Received: by 2002:adf:9c88:: with SMTP id d8mr925wre.364.1569524570550;
 Thu, 26 Sep 2019 12:02:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v16sm210581wrt.12.2019.09.26.12.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 12:02:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 855A51FF87;
 Thu, 26 Sep 2019 20:02:48 +0100 (BST)
References: <20190925233013.6449-1-alex.bennee@linaro.org>
 <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
 <20190926125817.GB19660@redhat.com>
 <ea6b671a-0c05-d880-3b9f-62a4f8626ec1@de.ibm.com>
 <19efe3ee-a532-cf66-a5a7-03a7c053737c@redhat.com>
 <87d0fn9ix8.fsf@linaro.org>
 <CAKmqyKOSyhd5zv0hOa_THCX8g1fxN69NXWxCw0m+=TA+8h0Wug@mail.gmail.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alistair Francis <alistair23@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>, qemu-discuss <qemu-discuss@nongnu.org>, Christian
 Borntraeger <borntraeger@de.ibm.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, "open list\:New World"
 <qemu-ppc@nongnu.org>, "open list\:RISC-V" <qemu-riscv@nongnu.org>
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
In-reply-to: <CAKmqyKOSyhd5zv0hOa_THCX8g1fxN69NXWxCw0m+=TA+8h0Wug@mail.gmail.com>
Date: Thu, 26 Sep 2019 20:02:48 +0100
Message-ID: <878sqaanjb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
X-List-Received-Date: Thu, 26 Sep 2019 19:02:57 -0000


Alistair Francis <alistair23@gmail.com> writes:

> On Thu, Sep 26, 2019 at 8:41 AM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>
>>
>> Thomas Huth <thuth@redhat.com> writes:
>>
>> > On 26/09/2019 15.46, Christian Borntraeger wrote:
>> >>
>> >>
>> >> On 26.09.19 14:58, Daniel P. Berrang=C3=A9 wrote:
>> >>> On Thu, Sep 26, 2019 at 08:50:36AM +0100, Peter Maydell wrote:
>> >>>> On Thu, 26 Sep 2019 at 00:31, Alex Benn=C3=A9e <alex.bennee@linaro.=
org> wrote:
>> >>>>>
>> >>>>> The 32 bit hosts are already a second class citizen especially with
>> >>>>> support for running 64 bit guests under TCG. We are also limited by
>> >>>>> testing as actual working 32 bit machines are getting quite rare in
>> >>>>> developers personal menageries. For TCG supporting newer types like
>> >>>>> Int128 is a lot harder with 32 bit calling conventions compared to
>> >>>>> their larger bit sized cousins. Fundamentally address space is the
>> >>>>> most useful thing for the translator to have even for a 32 bit gue=
st a
>> >>>>> 32 bit host is quite constrained.
>> >>>>>
>> >>>>> As far as I'm aware 32 bit KVM users are even less numerous. Even
>> >>>>> ILP32 doesn't make much sense given the address space QEMU needs to
>> >>>>> manage.
>> >>>>
>> >>>> For KVM we should wait until the kernel chooses to drop support,
>> >>>> I think.
>> >>>
>> >>> What if the kernel is waiting for QEMU to drop support too ;-P
>> >>
>> >> For what its worth on kvm/s390 we never cared about implementing
>> >> 32 bit.
>> >
>> > Looking at tcg/s390/tcg-target.inc.c :
>> >
>> > ...
>> > /* We only support generating code for 64-bit mode.  */
>> > #if TCG_TARGET_REG_BITS !=3D 64
>> > #error "unsupported code generation mode"
>> > #endif
>> > ...
>> >
>> > ... it seems to me that TCG does not support 32-bit on s390 either. I
>> > think we can remove s390 (32-bit) from the list completely?
>>
>> It's the same for riscv32 I think.
>
> I think riscv32 host *should* work, although I don't think it was ever
> tested.

You certainly don't support oversized guests:

  /* We don't support oversize guests */
  QEMU_BUILD_BUG_ON(TCG_TARGET_REG_BITS < TARGET_LONG_BITS);

>
> Considering that we have enough trouble keeping the riscv32 kernel
> booting it's probably ok to drop it from QEMU.
>
> Alistair
>
>>
>> >
>> >  Thomas
>>
>>
>> --
>> Alex Benn=C3=A9e
>>


--
Alex Benn=C3=A9e

