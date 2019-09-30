Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iEu41-0003E9-Lu
	for mharc-qemu-riscv@gnu.org; Mon, 30 Sep 2019 07:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54002)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iEu3z-0003DZ-MR
 for qemu-riscv@nongnu.org; Mon, 30 Sep 2019 07:42:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iEu3y-0006zI-Ev
 for qemu-riscv@nongnu.org; Mon, 30 Sep 2019 07:41:59 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45236)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iEu3y-0006yN-7x
 for qemu-riscv@nongnu.org; Mon, 30 Sep 2019 07:41:58 -0400
Received: by mail-ot1-x344.google.com with SMTP id 41so7953736oti.12
 for <qemu-riscv@nongnu.org>; Mon, 30 Sep 2019 04:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k7kyHwRLGtVLDMErEunJvamrWstC8uYy8LdbeSNBN18=;
 b=jSUZpRhJ52Hh0QYwwp9EEE/de1pDLE3EJWKkwWoicZeubIBQQP5RHGYKVmmw7KSnvF
 6kbZqlPMeQYh3OjRBVbp+xBsE87/l+Tw63CTXmBZrOFcXESkxF762R6fY9iF5Ja/zGM7
 eUvoPzALkkaC7tmVVhKV/ZNIXsq6NOzr/lTV514bpcnUNPyWdQ7oY1tNb74yWxZUgc76
 stbvK/haaNIJ9Ce3CCVXTUb5mP0kolN1p9jUe/Cjm8rV0hYOACy8v3/g7XHJgfayuAwB
 0tBXrldKMjU/KTEq1JqZ5Mn4iqTJguqDamxQKRZoGgxd5wWgx5+ksKXDmCzt/C61GZ70
 Lo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k7kyHwRLGtVLDMErEunJvamrWstC8uYy8LdbeSNBN18=;
 b=es0+xGDE3DwCBo5QYUzC3MTMH4KIG/slwIVSVpwxMHVdgho8jAfPI08ivWaiXMMuQS
 bHooiKzQrFNR0j/Cz0O3wKDrl3nV1ZBCzwWOsKU8xdHhYxd7w28+7x2mmeHKJwKFy+Ym
 To4ON9th5/ouKoFiMMI76cj5eqdHK/G6a2zOtEphiG84kulDVztMmIS6wnj6EvoTgRNv
 HI9D73lEcekqaXCloly5KnPcxq2CWrAvAnCiSj9kEEDu/Ods4FaCe0T6HpuXZkQTshm0
 BWI1KYPGyGW/rcEB0hL4smzvfCrE7GjGjarFu9SupNzzQy/Sjo0S9AlPbVB6bqlS6iNy
 pXIA==
X-Gm-Message-State: APjAAAXDKOBpr8hjkKhQesZMoaClFAMizaknrB5xkuTB47wV+dn6tqyR
 6YDuoUfr6qPDfSFW/QR9wcIOthAgaicgd/VBZUy43Q==
X-Google-Smtp-Source: APXvYqykcT9k5Yli/H81QYigJPV+34hZuyK7uNJPr3NKWVgLvpaXMLAEt7jwHSzQnsggsCVaIT25inMhjMgAMIKgaiM=
X-Received: by 2002:a9d:6d0a:: with SMTP id o10mr12837474otp.221.1569843717181; 
 Mon, 30 Sep 2019 04:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190925233013.6449-1-alex.bennee@linaro.org>
 <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
 <4512b61a-ed82-e628-88e5-f44ef87c2b50@linaro.org>
 <20190930092519.GB11996@redhat.com> <87impakrky.fsf@linaro.org>
In-Reply-To: <87impakrky.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Sep 2019 12:41:45 +0100
Message-ID: <CAFEAcA8_Zt+4RuXh8ww3Xm5=fQT+e_XcjZ6VC2N9k5mzLy0bnw@mail.gmail.com>
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>, 
 qemu-s390x <qemu-s390x@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
X-List-Received-Date: Mon, 30 Sep 2019 11:42:00 -0000

On Mon, 30 Sep 2019 at 11:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> The int128 support is due to the fact we are going to start to see newer
> architectures with things like 128 bit shadow capability registers and
> they will be a pain to shuffle around in 32 bit generated host code as
> well as requiring writing new extra plumbing for TCG's pre/post amble to
> pass them back and forth between C and generated code. These guest
> architectures may not even be full 64 bit guests so it's not quite as
> simple as saying you can't have 64 bit guests on a 32 bit host.

I think that for int128_t in particular, the ideal answer is
that if the compiler developers want to introduce a new
abstraction like that, they should support it on all targets,
not just half of them...

thanks
-- PMM

