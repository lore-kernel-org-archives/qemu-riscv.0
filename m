Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPXjY-0003CC-LX
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 14:00:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPXjW-0003As-NZ
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 14:00:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPXjV-0008E0-O2
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 14:00:18 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:38014)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPXjU-0008Bk-2a; Wed, 21 Nov 2018 14:00:16 -0500
Received: by mail-lf1-x144.google.com with SMTP id p86so4790213lfg.5;
	Wed, 21 Nov 2018 11:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UWmve8NQDT5zqxccfd9z7CTrUZOHplq4UMi+GK9ha1c=;
	b=QPSctilhUchXio0Pgz0Dz26bgrDUC1m+LN/cxHwxD04dLKE8KC4iu0cD8HvUm8cfTN
	WJ1ZZ9bsA9HvyZ3mLpSvj7MiHLKbX3sUTilDtDyYSpZuEqGgcIzo0xtJsIge9f3k3NDK
	eDfl2cfmpghiRSbiLqSd7yJ4q42koG1xxxWXgKLp0LtH2Cyu1g+Ln9bRu1xYau15Ertq
	ciCv+M5HjmyCKVDvhixLQGExTOduejIxyjg5hpsUnpaA5kjLOVG8F5VCh0p5vShG89Ke
	tkIR6Ys8dMrLuNDBn7VqaMWTERjkRP+MVaEuf1Q9KhpjTmET6mkgQfOcjb16pRBjDdG7
	iH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UWmve8NQDT5zqxccfd9z7CTrUZOHplq4UMi+GK9ha1c=;
	b=Ok61X7ZfXdE8ScN6Q6bTAi3memztoODAF5xU4COlZuXA8jlDyJAm1bBMsAK31fx4xQ
	laLFntA515ThieI5dh0i7SWc6jDbMb7oCWjeeUxx/zk3+5jUqo7XR8Pi3glZLrIpyAQG
	cUnyL0IfVwggTrziGZ6YnRsUhKWYKSBSx2GLJRtLR8jPg69231m95HKAi3605VOKQtzm
	yph5ZHleR7LZSONDrmThvyk0Q3CS1WRJ+zOpal2AMVggJR2oxFWznOruL5XLYbxg9PhC
	HXBZ4vK55QoM5q5Ywh1Uyfn9ETB0f7dVx8TBoy6a0MGOtiXxZfK/RcE+zPdiYtIr1rOZ
	PgdA==
X-Gm-Message-State: AGRZ1gJr9Q7PvkNEZMXAf+dAUtsWJLAbJ4aaDAJW34W7o+jcVzcXbhEn
	g4PlzEs3O178kIWQoH4RQsl8HwRHQGPJJ7gEuWk=
X-Google-Smtp-Source: AJdET5dV/qwqJ6SNpFRfAv7xyNkFhWmWUl4vl4ajdo7NXTJhA+KTO5EJRuE8ghikmDCgN3V7nYamcCCp4S4QDpAjCKE=
X-Received: by 2002:a19:8fce:: with SMTP id s75mr4419748lfk.151.1542826814686; 
	Wed, 21 Nov 2018 11:00:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<a2c70c88a145d2e239f113e28979c7a50d71aedf.1542819633.git.alistair.francis@wdc.com>
	<ff4ef556-0989-ec47-0424-3f153f10a8d0@deltatee.com>
	<CAKmqyKOMsBda223ptqt2iVFi6oVifK_0L+=Mne=v9p_umwxVLg@mail.gmail.com>
	<ed679475-5ba2-c2ce-c468-b531188d6b7e@deltatee.com>
	<CAKmqyKOA0xa0RhNatt9JybpGMLGds+E8CytOXr8rQuSYi7VrxA@mail.gmail.com>
	<a751fd52-28c7-043a-234c-7f7b5251b9ad@deltatee.com>
In-Reply-To: <a751fd52-28c7-043a-234c-7f7b5251b9ad@deltatee.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 10:59:46 -0800
Message-ID: <CAKmqyKOaAYkPkJ3h2_smaE+wL2cmtBdNaC6sD_Ztwr7=YDYOMg@mail.gmail.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
	Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-riscv] [PATCH for-3.2 v7 1/6] hw/riscv/virt: Increase the
 number of interrupts
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
X-List-Received-Date: Wed, 21 Nov 2018 19:00:19 -0000

On Wed, Nov 21, 2018 at 10:56 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2018-11-21 11:49 a.m., Alistair Francis wrote:
> > Agreed. It's the same number as the last interrupt in the QEMU SiFive
> > U machine. So that is where it came from.
>
> Ok, can we have a comment for that?

I don't think we really need a comment. It's just a made up number. It
just has to be higher then the actual number of used interrupts. It
can be changed in the future if required.

Alistair

>
> Logan

