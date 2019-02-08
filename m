Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gsD1K-0004tR-1t
	for mharc-qemu-riscv@gnu.org; Fri, 08 Feb 2019 15:45:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gsD1H-0004pa-OH
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 15:45:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gsD1F-0006n3-MD
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 15:45:07 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:43903)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gsD19-0006i7-W2; Fri, 08 Feb 2019 15:45:01 -0500
Received: by mail-lj1-x244.google.com with SMTP id q2-v6so4086247lji.10;
	Fri, 08 Feb 2019 12:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SBuSbnLK4wQ0BHSOF9EDu+RtnrkwYs6TczcViduL3MU=;
	b=kVhhJMXYbxqe5Wc8Vv1g77srzj4ybE+TrmKq4DnnMqEwWQo+x/hVv8ckeMD2N1SV9N
	wdPGtvt5VimlKvu16oL3/c2hP06s0SmKE2kFOROOjfCvp5QcwNzfLdVYdAzyckjwrKKd
	KqoC9aFocGeLmK9EDhK5tmt3DG6y5sLSeBJ70aDoqtUH2zsQk23xJMd4omzUQflSFJhz
	VBbkGxsMlN1ChioeyOUr7Yq/qVgJkomi6p3EUn4+oGjVNmQ8Z/TB2N8GW05u/kXs/cW2
	UKCRsqcjlS9BrGbHtGbn/gOkPMkQHDmnnLhaSaMAyppXtZUWiVmVzFBnPFIClYAPL1Xc
	8jzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SBuSbnLK4wQ0BHSOF9EDu+RtnrkwYs6TczcViduL3MU=;
	b=VQpOoysFHZ6c5mTyT7z9IV6a6vSIL3qNvKhTtPvUg51An9af6InrXzgUQWGRRnEwDW
	1y3eR0wtvMyN/rvrvIWO82t7fIDGW8DSRGWNMnsXDuUmc3NGWG5355mufcIqQ/YXYgnD
	sc5RDjXa16tU3XVbQTUC1Eo6BrXAKWCqy6SW75dLJdw3cIeZJH4KgTg7nf+5iGO8jXTW
	pK7fUqOYaBLWuR4q9u8QTq4m46e1HWm1UUmBvZnQmMvA3sLMIDComORCph8lGpJlZkGt
	3A0HLvGG9ck/N/ghXNezklyk8xwWbaRU4p+vtqwkljBGJctrxE9UlpreaM489e6nxlIK
	LEtg==
X-Gm-Message-State: AHQUAuYqLfDT/aMoUiapQtK2hdOOypz04M8Ozs3Qcqdvz1J66FuvXLg/
	tdBliYyr/bDcTykF9XbZ5iceQzJd/3+BPbptw66ARqz5xcw=
X-Google-Smtp-Source: AHgI3IbH6/nbq8JY4W6BJ+xU3Zc9xrrF+g+bdXaEixIiJ2sULgYFUL4Fho2QeVYg2Y53JvrbOFBGcdf7w7juT3Hs4vU=
X-Received: by 2002:a2e:145a:: with SMTP id
	26-v6mr13976932lju.116.1549649854834; 
	Fri, 08 Feb 2019 10:17:34 -0800 (PST)
MIME-Version: 1.0
References: <CAFyWVaZ5tQq4eGaZiPBq7172PB_x3JCqV6c2xo=wSJdgbJakKQ@mail.gmail.com>
	<20190130025708.12811-1-jimw@sifive.com>
	<CAKmqyKMrCVqudmyJUPta9q6TJtDkeLV=FseAqQ7YhYMu3ak_NQ@mail.gmail.com>
	<CAFyWVaaS_4RY9YKXcgJ1F4Ep1TDWkExtBTEigJedZQCcXG+44Q@mail.gmail.com>
In-Reply-To: <CAFyWVaaS_4RY9YKXcgJ1F4Ep1TDWkExtBTEigJedZQCcXG+44Q@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 8 Feb 2019 10:16:56 -0800
Message-ID: <CAKmqyKOgnM0+6EByX-AWry-pkry_VQOa3SN5PWU75E0Q3_rbSw@mail.gmail.com>
To: Jim Wilson <jimw@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 5/5 v3] RISC-V: Add hooks to
 use the gdb xml files.
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
X-List-Received-Date: Fri, 08 Feb 2019 20:45:08 -0000

On Wed, Feb 6, 2019 at 6:05 PM Jim Wilson <jimw@sifive.com> wrote:
>
> On Wed, Feb 6, 2019 at 4:04 PM Alistair Francis <alistair23@gmail.com> wrote:
> > Would it not be easier to add an extra argument to the functions
> > intstead of setting and unsetting this?
> >
> > That's what you had in the earlier version of this set.
>
> The csr support was rewritten, and is now a table of functions.  If I
> change the type signature for one function in a table column I have to
> change them all.  This means I have to change the type signature of
> about 50 functions, the vast majority of which will never use the new
> argument.  I was hoping to avoid that, so I added a variable into the
> cpu state instead.  In the old patch, before the csr rewrite, I only
> had to change the type signature of a couple of functions, most of
> which did use the new argument, so that was reasonable at the time.

Ah good point.

Can we just write a wrapper function then that sets and unsets the variable?

Something like this:

riscv_csrrw_debug(...) {
    #if !defined(CONFIG_USER_ONLY)
            env->debugger = true;
    #endif
            result = riscv_csrrw(env, ...);
    #if !defined(CONFIG_USER_ONLY)
            env->debugger = false;
    #endif
}

Alistair

>
> If I do need to change a lot of type signatures, what about attribute
> ((unused))?  I see that there is a ATTRIBUTE_UNUSED in the disas dir
> but it is apparently not used outside there, and only defined in
> include/disas/bfd.h.  I see a few scattered uses of
> attribute((unused)) but that seems unwise for portability reasons.
> Maybe qemu doesn't care about unused arguments/parameters?
>
> Jim

