Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hCI78-00051j-8K
	for mharc-qemu-riscv@gnu.org; Fri, 05 Apr 2019 02:14:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hCI75-000518-4m
	for qemu-riscv@nongnu.org; Fri, 05 Apr 2019 02:14:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hCI74-0001T8-0Z
	for qemu-riscv@nongnu.org; Fri, 05 Apr 2019 02:14:07 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:33055)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hCI73-0001RW-8m
	for qemu-riscv@nongnu.org; Fri, 05 Apr 2019 02:14:05 -0400
Received: by mail-oi1-x243.google.com with SMTP id e5so4000673oii.0
	for <qemu-riscv@nongnu.org>; Thu, 04 Apr 2019 23:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Sfa7A/BS0sWHpIOJHxMtKCoQbarU1kfg4Zi58fPevvQ=;
	b=MYz++ralrDRQiLuJ89FEkBurzdbW1qg6TEu0OfAWWXH1OmiOeFnY5L5aRGISp/1z/X
	ShbChLn6FW05JlWu5myrsUAKZMzyiemvFBXUK4WJI8vg1+TbTsVxEAj2jxFcvyQG9tFF
	Uj6+oKU6aLsbKJoT1vaF/lYZ9vMr7E4+w9qjfsZvbPbt5hTw3mWH9mBm0DtEIFfKx+iw
	++zYwEio/zrqUzVV+Yg4Cp7I85F3chAXLgPzgWLmqDpdeDxzBKVBrZc8QtuqggddckEL
	eZCSxbqXvGmrC3RpvMljguzyeUQuXSL5u7hzRWuwktBE+vilez6x/AsACtjCSKm4Ra7E
	+K+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Sfa7A/BS0sWHpIOJHxMtKCoQbarU1kfg4Zi58fPevvQ=;
	b=tPHh0XECXAhJSPQ0D3OiKlPoYgBNg4XH1C8/2JH3KKrAk7GXiutRIpqZOWmvZ/gnwF
	Gwd9SzVrfALSAYt6yvm6Nj6y0MBm6gyllA7HV8ikKVPvW7uBSsKfOY2ueJSlrKo8XY6W
	P5kZn6+zvWLiJ7WlcZKUSok234w9zlEYX1htNB64p0eD+80U2mZsUgAuZ8IpYJrrhHVW
	lVwll8rZjp7LcpgxwQWGH1YY8DHi44Gbhe+z1P0TE9U8pu0B9Rw9RLv+LqYZVbnfjOVc
	mNXHxAJmTu9ly2wdbF3DLSszUqQ5L+I17uHD5DDCxnDfcAf+ZyxuPZ764Yr/HhtB2C8v
	dSUw==
X-Gm-Message-State: APjAAAVKGDe5cyT8PTzGkW3MXcMp0aXCxV82qLa/asjD7ph6gDn0Pdet
	1Uzm2wZBulLBiCxY6yhJpYT3aunL6asIgz0tOlijQA==
X-Google-Smtp-Source: APXvYqzMH6dtRrHcpdYxdpb/xdyHmV5Ne0ajQ7YlzJhkpY627+R8DFHKhga8LNSMqu1oQyI6DrMrNYIyHSaJP1B6lCo=
X-Received: by 2002:aca:e84c:: with SMTP id f73mr5993605oih.163.1554444844230; 
	Thu, 04 Apr 2019 23:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190405003924.1906-1-palmer@sifive.com>
In-Reply-To: <20190405003924.1906-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Apr 2019 13:13:53 +0700
Message-ID: <CAFEAcA82u1SNuO-2AvCR8dx6XyyeZnrdWFbhmOvHun7hmxNFZg@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-riscv] [PULL] RISC-V Patches for 4.0-rc3, v2
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
X-List-Received-Date: Fri, 05 Apr 2019 06:14:08 -0000

On Fri, 5 Apr 2019 at 07:39, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> The following changes since commit 061b51e9195670e9d190cdec46fabcb3c77763fb:
>
>   Update version for v4.0.0-rc2 release (2019-04-02 17:01:20 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.0-rc3-v2
>
> for you to fetch changes up to 79bcac250f96ba1d4fdecfdc6e3363c9024703a4:
>
>   riscv: plic: Log guest errors (2019-04-04 16:36:21 -0700)
>
> ----------------------------------------------------------------
> RISC-V Patches for 4.0-rc3, v2
>
> This patch set contains a pair of tightly coupled PLIC bug fixes:
>
> * We were calculating the PLIC addresses incorrectly.
> * We were installing the wrong number of PLIC interrupts.
>
> The two bugs togther resulted in a mostly-working system, but they're
> impossible to seperate because fixing one bug would result in
> significant breakage.  As a result they're in the same patch.
>
> There is also a cleanup to use qemu_log_mask(LOG_GUEST_ERROR,...) for
> error reporting.
>
> As far as I know these are the last outstanding RISC-V patches for 4.0.
>
> v2 no longer fails "make check" for me... sorry!
Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM

