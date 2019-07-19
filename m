Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hoVdG-0000uX-2V
	for mharc-qemu-riscv@gnu.org; Fri, 19 Jul 2019 12:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41638)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hoVdB-0000k5-T4
 for qemu-riscv@nongnu.org; Fri, 19 Jul 2019 12:21:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hoVd8-0006T4-HS
 for qemu-riscv@nongnu.org; Fri, 19 Jul 2019 12:21:12 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:35451)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hoVcp-0005lb-Mr; Fri, 19 Jul 2019 12:20:52 -0400
Received: by mail-lj1-x235.google.com with SMTP id x25so31364749ljh.2;
 Fri, 19 Jul 2019 09:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fFo+CuEPeHwBPOBeb8KPru+ObIIM6iFnpGufu0nSdZU=;
 b=s0dbBfiylTYR8n2kcx9hjS7Smb4V0pqNmjI+SvjPlqyDK6eSOqmPP7q+RJfTJS3S38
 bfD9V2lOLaDeuoJm4/FuFnsCJMAu7odEniUrH+BKSe6zjN3WnAOpM5XWHJTy6XxHzPpL
 5Qz/5wOwW1uX19H0GhuvkuEnekTsMi78mDGZY5+k4UPRtQLbt8OnlBifxq2BPllQ0eAs
 e5rASm62zuuoW5o5H0WRY+uoDOiFXlYs03rBkUJslDcHWoUo13MKFBbP+6At8LrNjqcb
 x5Bu49fFjGNOq+7wHCEvEkyj/0uNqsfC0rR2S4JMO9E7DtxSg5nF8Gb+3HZsN60Al0he
 srrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fFo+CuEPeHwBPOBeb8KPru+ObIIM6iFnpGufu0nSdZU=;
 b=i14gMqHGcoHwu2xa9IjEbinsT0PPFVwgC9vGpdVFGW/hLhk2jspvYCnbU/uFUPFY3+
 AJNuwLWpFNg/hRCILhzbWi2SiUZBCsE+SSq73NWSDn8mDgLPJgfVTp3Lo+9KTgh8z6P/
 ez8LtSxqtySFST8LwGInM8W5MLu6WZUQ5XUY4iTWx+JPG7bShCNj+0ty7KG9qreuB+l1
 InQBZRfCFK/4KAavyntu80t1608UlVty/L5OBpORradQzhyZhaXfEwVfBlCIIsnvyptV
 +2QH1yvg7CQkiSUre36ZpHa+5sWaRxIvvCXnoU8GWfs0qTEzrOO2PBsaDay9y8cthykl
 kxOg==
X-Gm-Message-State: APjAAAWnaDp2w4k89DUUHJf6m8QjWN43Q9Cc0KcBW/y+6yyajq9NGB98
 TyopM5/hv69rzpghFSn7J9q2Xcb9rrIIYozv/tU=
X-Google-Smtp-Source: APXvYqz5vJecAc5SBh2jhX+5BLONEwHwYP8EQgGgh9KUSN/yA3QLgL2ukpA8MjdYY5927Z4Tvfoscpb46L2DkNgOfug=
X-Received: by 2002:a2e:b4c9:: with SMTP id r9mr28051885ljm.196.1563553177618; 
 Fri, 19 Jul 2019 09:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190719015811.14776-1-palmer@sifive.com>
 <CAFEAcA_MGz=EvH67twNoM-SMXZ8_pE6FhO+JuLN=0Z1H6sfRnw@mail.gmail.com>
 <CAFEAcA9mR5XxV9ghSzt4PbANKZJW1xKMGF1a9+ak+m6OyZ-YZQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9mR5XxV9ghSzt4PbANKZJW1xKMGF1a9+ak+m6OyZ-YZQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Jul 2019 09:16:15 -0700
Message-ID: <CAKmqyKMFfm+zGNLcHp3yf98wNH4+D8k6oFqOxp25rWmFMYF-Lg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::235
Subject: Re: [Qemu-riscv] [PULL] RISC-V Patches for 4.2-rc2
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
X-List-Received-Date: Fri, 19 Jul 2019 16:21:15 -0000

On Fri, Jul 19, 2019 at 4:11 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 19 Jul 2019 at 12:03, Peter Maydell <peter.maydell@linaro.org> wrote:
> > This passes the 'make check' tests but it prints out a lot
> > of warnings as it does so:
> >
> > qemu-system-riscv64: warning: No -bios option specified. Not loading a firmware.
> > qemu-system-riscv64: warning: This default will change in QEMU 4.3.
> > Please use the -bios option to aviod breakages when this happens.
> > qemu-system-riscv64: warning: See QEMU's deprecation documentation for details
> >
> > (repeated 7 or 8 times during the course of a test run)
> >
> > Can we make the tests not trigger warnings, please?
> > (I have a filter where I search through for strings like
> > "warning" because warnings that shouldn't happen often don't
> > actually cause the tests to fail.)
>
> Forgot to mention, but a common way to do this is to say
> "don't print the warnings about bios image loading if
> qtest_enabled(), because with qtest we never execute any
> guest code anyway". That will probably fix the warnings here.

Testing my patch now, I'll send it out today.

>
> > Also, I notice that you have a typo: "aviod" should be "avoid".

Fixed.

>
> Also also, the warning message mentions "QEMU 4.3", but our
> versioning system bumps the major version every year, so
> the pending release is 4.1, the next one will be 4.2, and
> then the release after that will be 5.0 because it will be the
> first release in 2020.

I just dropped the version number in the warning message.

Alistair

>
> (Plus, your merge commit message says this pullreq is
> for 4.2-rc2, which is a typo for 4.1-rc2 I assume.)
>
> Since this pullreq does pass the tests, and rc2 is not far off
> now (Tuesday), I think my suggestion is that I'll apply this
> as-is, and we should fix up the issues with the warning messages
> as a followup patch. I think that's better than holding this
> out of master and making it risk missing rc2.
>
> thanks
> -- PMM

