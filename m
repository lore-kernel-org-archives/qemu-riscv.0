Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grZ4d-0001VI-9W
	for mharc-qemu-riscv@gnu.org; Wed, 06 Feb 2019 21:05:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1grZ4b-0001UZ-ER
	for qemu-riscv@nongnu.org; Wed, 06 Feb 2019 21:05:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1grZ4a-0006Pw-GW
	for qemu-riscv@nongnu.org; Wed, 06 Feb 2019 21:05:53 -0500
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44]:40981)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jimw@sifive.com>) id 1grZ4a-0006L1-CF
	for qemu-riscv@nongnu.org; Wed, 06 Feb 2019 21:05:52 -0500
Received: by mail-vs1-xe44.google.com with SMTP id t17so5761845vsc.8
	for <qemu-riscv@nongnu.org>; Wed, 06 Feb 2019 18:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=o3kCSrXsZLbsqSbtPQqH2gOHig2pufZfx5W88mocgwc=;
	b=Y5d3pluAnCSUoPZHwjEPfEDvaX47CCdujH45tBPMhTJxk2Uax+Lm90kbZTUrnCvoe1
	FswNnFLhUc45REabT4O0HKbidJxUUceXhb3gVxKdkWFXlLriiZKrXVnlTPBhV+8nM3iX
	vbvuU7bjiZU5nhdwHkjyZfaj5dhegY53716bR+IwOQmic7h4JwzG0kWTRSnV3CVV5QPu
	iBHX8tBWSEWUyZCW2O/VlaacEd2diwXDgj2O0TDMslkQRl5wh1vZ9hkGSZNgJPdml6x3
	znFuEG/ZO29H6hEsL+AZQAc6rtFbW4fe+MRAa/f9S4pS+MQIbvzmWZ9RUIEsqD/oAXEs
	oxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o3kCSrXsZLbsqSbtPQqH2gOHig2pufZfx5W88mocgwc=;
	b=mAzYQznyS6F0/B3zp8gFzC/5JLi21xxfNbEoWLu0mDzdh8gkUTI0SLTrZWSXvRzblB
	7myFBQTmx6rAAIEEKnTtHEijqepRyNfYA9xSKN0xJD/P0bK6JU2Xy5OhS+NraLzLKD4X
	935ItOCCfVj9di77etKpqjsfu2CORmdrJUs4ucoVzujtQ5Bp1PrnGuHmGyJYMXa+dng+
	zCn/r4xQ0EJClYBplrAPRX3oeP7S4fPWpyTVc/XQKnuhL6fsCrWJp93otv5oGgn2/kWQ
	HqHWG+fzhJLXy0RM8Hl1N25Nstv14g3sY6kNtOA7rPBlwO1Oq1MtcLG9km7mSV+gp3zj
	+FGg==
X-Gm-Message-State: AHQUAuYN3+at22DbA6prO/ZzRoSxYxtTmJixj/FlRaq1UC1WsRYQVg/1
	HjetMnZzzEJuXkyNv7FRJSYZo9P2atLuMvYNYzpPYQ==
X-Google-Smtp-Source: AHgI3IaH3DJ6Wn2+55mAWsoHtTXnDNROzg5rJP4AW1dJWrR568DqhZxn0szc7YeWR9vZv7UgzZNzwzpLe56NeYZYw1w=
X-Received: by 2002:a67:d00f:: with SMTP id r15mr4181501vsi.191.1549505120348; 
	Wed, 06 Feb 2019 18:05:20 -0800 (PST)
MIME-Version: 1.0
References: <CAFyWVaZ5tQq4eGaZiPBq7172PB_x3JCqV6c2xo=wSJdgbJakKQ@mail.gmail.com>
	<20190130025708.12811-1-jimw@sifive.com>
	<CAKmqyKMrCVqudmyJUPta9q6TJtDkeLV=FseAqQ7YhYMu3ak_NQ@mail.gmail.com>
In-Reply-To: <CAKmqyKMrCVqudmyJUPta9q6TJtDkeLV=FseAqQ7YhYMu3ak_NQ@mail.gmail.com>
From: Jim Wilson <jimw@sifive.com>
Date: Wed, 6 Feb 2019 18:05:09 -0800
Message-ID: <CAFyWVaaS_4RY9YKXcgJ1F4Ep1TDWkExtBTEigJedZQCcXG+44Q@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::e44
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
X-List-Received-Date: Thu, 07 Feb 2019 02:05:54 -0000

On Wed, Feb 6, 2019 at 4:04 PM Alistair Francis <alistair23@gmail.com> wrote:
> Would it not be easier to add an extra argument to the functions
> intstead of setting and unsetting this?
>
> That's what you had in the earlier version of this set.

The csr support was rewritten, and is now a table of functions.  If I
change the type signature for one function in a table column I have to
change them all.  This means I have to change the type signature of
about 50 functions, the vast majority of which will never use the new
argument.  I was hoping to avoid that, so I added a variable into the
cpu state instead.  In the old patch, before the csr rewrite, I only
had to change the type signature of a couple of functions, most of
which did use the new argument, so that was reasonable at the time.

If I do need to change a lot of type signatures, what about attribute
((unused))?  I see that there is a ATTRIBUTE_UNUSED in the disas dir
but it is apparently not used outside there, and only defined in
include/disas/bfd.h.  I see a few scattered uses of
attribute((unused)) but that seems unwise for portability reasons.
Maybe qemu doesn't care about unused arguments/parameters?

Jim

