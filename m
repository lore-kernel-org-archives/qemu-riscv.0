Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gsD27-0005cU-4O
	for mharc-qemu-riscv@gnu.org; Fri, 08 Feb 2019 15:45:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gsD23-0005bD-Cv
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 15:45:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gsD22-0007d7-Hi
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 15:45:55 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:35292)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gsD20-0007Xj-2Q; Fri, 08 Feb 2019 15:45:52 -0500
Received: by mail-lf1-x141.google.com with SMTP id l142so3560078lfe.2;
	Fri, 08 Feb 2019 12:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PwHV8++/1gHWONNtyPsAeGy9YvgGEdZmR9YDRnjIy8U=;
	b=blfXqhA9EDhPLxU2MBJA5Onu5VEylIPdExMOH06xOhC4EQzacQ5JifHo6EjmpU+MTv
	1JrCd2eelF5kuLkN6oEaMjbj0yIgHaKtzQWA9gx0v81E5n4wz68tv7HEOHlYVF7EnifQ
	h/jurprA6WzP+mKFFwzlEZhraOguH6zOnWx2VDn/jA75YaaOrBiRbKRVukXPJY7khPZy
	0nWshm3ejHpHHbKRtvwrOdGRtq0vK+hpCQ29SayRCedqSRlddUYytVaxAZS/EbWHUdst
	lgmqesdyjLKVkCwf7zve2Z/E0HGJYGaYDlC9+c9udodEJL9hYfz6jk/SV+i1aThqPIXg
	E8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PwHV8++/1gHWONNtyPsAeGy9YvgGEdZmR9YDRnjIy8U=;
	b=TF2wJ1wKAZVdmPBWPk8d1k+HE7aH2epAgdAMuFHNRYq7Ou2G4uypV7GTEOeqzVQGgA
	C3PiX11wWgtJXz/cLS8PA5ebYVYGP4Ehb0nwpzxyJ8bIgabI16zPVt4uMNa/COcdYDXS
	m7/DzQCVszfL2FZuOse0+gdgkos6pzSgkxD5gqR+7f99qqnHh2bTCtnhhp4EsMgNUXBA
	6ET0V/No67i5TUT5RvaYi34pbx/Tp/FjU+ewFCH2z2Cmsg8sHcfl5HElSxSckhxICs+9
	FnZIqizLjtp6p1qwU4HX1NIKOMTgXI6D1SF4dXL2S57TvT2McsK0gjXTmofuByefqveY
	NLUA==
X-Gm-Message-State: AHQUAubGv8WDxLsys5FnSfAhvT5o6+bSu3MHg+lw5RYWRILeKuhP7sCp
	0rofLprWq/5qU6iJrOWzl5/iq8lq1r2jPO9G7E/V0Ss0
X-Google-Smtp-Source: AHgI3IYa53OWFnqq8o7OnvLBUepLniBONKo7aKkSNlyTkz9nDGuFv0QDjtz9gBkXbZBG9qcxMoIy6PxohXDdlxLvB1U=
X-Received: by 2002:a19:c942:: with SMTP id z63mr2850466lff.162.1549654167075; 
	Fri, 08 Feb 2019 11:29:27 -0800 (PST)
MIME-Version: 1.0
References: <CAFyWVaZ5tQq4eGaZiPBq7172PB_x3JCqV6c2xo=wSJdgbJakKQ@mail.gmail.com>
	<20190130025708.12811-1-jimw@sifive.com>
	<CAKmqyKMrCVqudmyJUPta9q6TJtDkeLV=FseAqQ7YhYMu3ak_NQ@mail.gmail.com>
	<CAFyWVaaS_4RY9YKXcgJ1F4Ep1TDWkExtBTEigJedZQCcXG+44Q@mail.gmail.com>
	<CAKmqyKOgnM0+6EByX-AWry-pkry_VQOa3SN5PWU75E0Q3_rbSw@mail.gmail.com>
	<CAFyWVabDFOoC2QzcquL+taW58j42hN7C3Us98LPBFqQf4oUXzA@mail.gmail.com>
In-Reply-To: <CAFyWVabDFOoC2QzcquL+taW58j42hN7C3Us98LPBFqQf4oUXzA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 8 Feb 2019 11:28:48 -0800
Message-ID: <CAKmqyKOr5eX1hQXURdz6Y7qDgygGOwYyFeKKZCH83UuuRkuR9w@mail.gmail.com>
To: Jim Wilson <jimw@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::141
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
X-List-Received-Date: Fri, 08 Feb 2019 20:45:57 -0000

On Fri, Feb 8, 2019 at 11:09 AM Jim Wilson <jimw@sifive.com> wrote:
>
> On Fri, Feb 8, 2019 at 10:17 AM Alistair Francis <alistair23@gmail.com> wrote:
> > Can we just write a wrapper function then that sets and unsets the variable?
> > Something like this:
> >
> > riscv_csrrw_debug(...) {
> >     #if !defined(CONFIG_USER_ONLY)
> >             env->debugger = true;
> >     #endif
> >             result = riscv_csrrw(env, ...);
> >     #if !defined(CONFIG_USER_ONLY)
> >             env->debugger = false;
> >     #endif
> > }
>
> Yes, that would work.  Do you want me to resubmit a fixed part 5 patch?

It's probably best to send out a new version of the whole series.
Include all the Reviewed-by tags and then that should be the last
version and Palmer can apply that series directly.

Alistair

>
> Jim

