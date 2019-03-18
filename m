Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h5qBF-0001Qd-Ns
	for mharc-qemu-riscv@gnu.org; Mon, 18 Mar 2019 07:11:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h5qB9-00014t-Fm
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 07:11:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h5pyj-0007uq-3s
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 06:58:49 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:33272)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h5pyi-0007uL-Op
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 06:58:49 -0400
Received: by mail-oi1-x231.google.com with SMTP id e22so5501969oiy.0
	for <qemu-riscv@nongnu.org>; Mon, 18 Mar 2019 03:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KgPx90Mri5q2lyl+pd0FI0sDNgaF7/dtly4gIjN6Nko=;
	b=l7UmCrcCJflc7cAI7A9FdFOlsrGtnjB8amKXJx/58zpPWvhNueAd+1RabgvEJn/SJa
	9WaAB47PTlvCpzmYjhqZa9wKd+FeiDqaX9YhxR6uVpmtM8+rD+d5hnkoSX/5OxXUP7lh
	XsolQUeSSVJ+WvndkrmRFUPdkCzGyb1qtWBQ5nFX0lOZFjzhog+m9Qjp0jQGKRC6NE24
	XkQAH99CzqPlzATHB+1KPstngi8Guj/+xngUUUZjsHMw6glYbtbs/5yBRqj0InO/Kj/w
	WxkKcGV0Gn4g/7vhCXvP8shGYGVDDu7t9HHKOFvZGSQwm6ght2K6231LE49M2nEygM2Z
	TS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KgPx90Mri5q2lyl+pd0FI0sDNgaF7/dtly4gIjN6Nko=;
	b=ioIjWCO2UdVd1dye9cLQTOxQCoEXk/WXJzV/VL465f7PZmc2t4iF5JI2B2KXqprZ8k
	VAkg4xp25c/rRKcfBPi4r74sWnLep2kE+N6XkemNmB0QZ3oRgkcGvzdsUcmihnRgC9pV
	6A84ydwV+d+Jh+0Am2HiuCq0VXCKiaubqvvpBX01nikInqCF2FLQ6Ze6zzKqk5jV79i9
	0E49Q1Of0SZHiDzz8xoYa2xH6FbaIkGzF+FzI+sRNK3M+gp3IvQ+0AJbN+NmpTmW28I7
	cB9wE6lAUV9WULSLVpj23HUapfpKuuzcOzqgcrcJAg5S+C86zU/KXFejqsWlhqFZ49DZ
	cFQw==
X-Gm-Message-State: APjAAAVB3PMaClx9Pai23f3jN+oQVmnmuhQ1g66/cvTvxxhME4zKIT8V
	nIxnje31BOWzIlCYsjFEm8IzEcEFSuVrPzXLB/ZJaQ==
X-Google-Smtp-Source: APXvYqy8BdzoGxP5EGIWKiYE6CwYVZDrjNdyNltT6KHRq8tDJA2JKt4WBIoAvxinBowHDb21LtjFfeXRbsO5/H2dyQg=
X-Received: by 2002:aca:42c6:: with SMTP id p189mr9687019oia.163.1552906727514;
	Mon, 18 Mar 2019 03:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190318052759.10860-1-palmer@sifive.com>
In-Reply-To: <20190318052759.10860-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Mar 2019 10:58:36 +0000
Message-ID: <CAFEAcA_9_oYQE5P+kgUhSk0EhAFbWH18L88=+0x-vMkMMaQEvQ@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::231
Subject: Re: [Qemu-riscv] [PULL] A Single RISC-V Patch for 4.0-rc0
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
X-List-Received-Date: Mon, 18 Mar 2019 11:11:40 -0000

On Mon, 18 Mar 2019 at 05:28, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> The following changes since commit d4e65539e570d5872003710b5a1064489911d33d:
>
>   Merge remote-tracking branch 'remotes/rth/tags/pull-hppa-20190316' into staging (2019-03-17 14:10:52 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-4.0-rc0
>
> for you to fetch changes up to f330433b3633647b047cfa418c2ca4d18fda69c7:
>
>   target/riscv: Fix manually parsed 16 bit insn (2019-03-17 22:21:32 -0700)
>
> ----------------------------------------------------------------
> A Single RISC-V Patch for 4.0-rc0
>
> There was a regression introduced by the decodetree conversion that has
> a fairly straight-forward fix.  Since this fixes bugs that everyone has
> hit I'd like to target it for rc0.
>
> ----------------------------------------------------------------
> Bastian Koppelmann (1):
>       target/riscv: Fix manually parsed 16 bit insn
>
Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM

