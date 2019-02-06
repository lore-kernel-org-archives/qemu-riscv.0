Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grQMi-0005wY-2x
	for mharc-qemu-riscv@gnu.org; Wed, 06 Feb 2019 11:48:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1grQMg-0005v0-0h
	for qemu-riscv@nongnu.org; Wed, 06 Feb 2019 11:47:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1grQMd-0007QE-MN
	for qemu-riscv@nongnu.org; Wed, 06 Feb 2019 11:47:57 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:40666)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1grQMb-0007Iv-FP
	for qemu-riscv@nongnu.org; Wed, 06 Feb 2019 11:47:53 -0500
Received: by mail-pg1-x542.google.com with SMTP id z10so3129302pgp.7
	for <qemu-riscv@nongnu.org>; Wed, 06 Feb 2019 08:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=tn2klk5d6CXuLyNfaNcww2QFr2KzqOF1La1NgCZ0/Ug=;
	b=kKbZMYCuhtPYIVJhzwyY4xlZC6pKE7E2/+U9Wrc8Ey2JLcof4MwdVy0wUFFR/7UlEs
	1e3QiYM13aOnJqvJ4hTkZDrFxL8B0B45OeTR81ZPMh/aLfCaMqXOCQmWrVZZacqS4c72
	NVa9IqU6626Jr1dDjkYjQvNvlBnl2xZ0hMs/S4FcOdI0hmyIV+IcPeJyPHbJA+22jkqz
	2kIsJ+FabRg75XJ0Y/wrf23r50po3EWv5kTePWpbDH5TPbpmH/BuNdCTs346L6rR9LQN
	pBlrIAqaX9SOV4xyFw9Zknr8W9h6iXc3rnh6c88A24vKgE0CXGlFk6dky8AyEBwnAOe8
	lg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=tn2klk5d6CXuLyNfaNcww2QFr2KzqOF1La1NgCZ0/Ug=;
	b=W6Ls946Ii/8nYRdlU+EcrSXpeAclLSUbXwpPIdYuX6tzMPujie4AipOYK+T/3So2GK
	TmtDpXK8CJFbIsupxAunw4ev4A2eV0LjKZlAXxJ+eR80pM2+mN3WHEOY2Sug9vfKQLRw
	3lWmSU/hyOkxwfHW4VdFic+qoFPw0W/qm7YbM3jRC8JfOx5hmITdbVRFB3R3bkXNcvPP
	L4fvKRPKfjB2/nLr9o2SStSa7Rdz0UervfQN4M8V/gQIuQk/h1w9Ul1iZiKcU39AGLli
	5sldl1klhsIszkE05LgozqfVPgqfPQVX23A9TXTQlUJjuA9buyxU5sR1CXrSuBa9pegT
	614Q==
X-Gm-Message-State: AHQUAuYbjV61e713yMZkLtVQh+3yzCz+NOTUF0lr4eQo9v3N0PryoaQi
	UJkUNGPcChEZKtoXHEa847z99w==
X-Google-Smtp-Source: AHgI3IYtawmH644Ziht9i2+SaI+OKAukmKj1MK9Xf7eDBNTQZWn9rB1M/dS1u9CdXP+/uJY6vO78HA==
X-Received: by 2002:a62:824c:: with SMTP id w73mr11351628pfd.150.1549471666417;
	Wed, 06 Feb 2019 08:47:46 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	d16sm7773255pgj.21.2019.02.06.08.47.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Feb 2019 08:47:45 -0800 (PST)
Date: Wed, 06 Feb 2019 08:47:45 -0800 (PST)
X-Google-Original-Date: Tue, 05 Feb 2019 13:27:03 PST (-0800)
In-Reply-To: <CAFEAcA9JXK5O5tSvBD17CM3Eb132EWuub9VvOJWaAKUOu8KA5A@mail.gmail.com>
CC: thuth@redhat.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-7f0a2867-f9c8-4a43-a410-b60f25df4cc1@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-riscv] [Qemu-devel] [PR RFC] RISC-V Patches for 3.2,
 Part 3
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
X-List-Received-Date: Wed, 06 Feb 2019 16:47:59 -0000

On Mon, 04 Feb 2019 01:59:48 PST (-0800), Peter Maydell wrote:
> On Mon, 4 Feb 2019 at 09:05, Thomas Huth <thuth@redhat.com> wrote:
>> On 2019-02-02 09:41, Palmer Dabbelt wrote:
>> >> My mail filter finds these RFC pullrequests, yes. I'm then
>> >> relying on my manual brain to not actually apply them.
>> >> (If it's a slow day I might do a test merge on them, but
>> >> usually my queue is full enough that I don't get to them
>> >> before the real PR appears.)
>> >
>> > Ah, OK -- do you want me to do something else?
>>
>> At least I got a little bit confused by "PR RFC" ... I think some other
>> maintainers rather send out patch series marked with "PATCH" first, and
>> add some non-pull-request cover letter with a text like "I'm intending
>> to send a pull request for this soon, please review one more time...".
>> Then after a day or two, once Patchew checked the series and nobody else
>> complained, they send a real "PULL" request.
>
> Yeah, generally nobody else sends RFC pull requests, they just
> send the actual pulls. I don't object if Palmer finds them
> useful, though.

If nobody else does it then I might stop -- they were more useful for me when I 
was new at this, as I was pretty worried about making mistakes and wanted to 
make sure I didn't screw anything up.  Things have gone pretty smoothly, so it 
might just have been paranoia.

Unless anyone likes these I think I'll stop sending them.

>
> For what it's worth, my filter for finding pull requests is emails
> containing "for you to fetch changes up to" but not either of
> "not for master" or "PULL SUBSYSTEM". So if you want to specifically
> keep out of the filters you can add "not for master" in the cover
> letter. But as I say it's not a big deal for me to sort things out
> manually -- the filter has the odd false positive anyway.

OK, makes sense.

