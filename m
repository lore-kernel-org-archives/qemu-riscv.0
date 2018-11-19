Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gOgik-0001aU-7i
	for mharc-qemu-riscv@gnu.org; Mon, 19 Nov 2018 05:23:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gOgii-0001Ym-FZ
	for qemu-riscv@nongnu.org; Mon, 19 Nov 2018 05:23:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gOgie-00031C-O2
	for qemu-riscv@nongnu.org; Mon, 19 Nov 2018 05:23:56 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46158)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gOgid-00030V-5r
	for qemu-riscv@nongnu.org; Mon, 19 Nov 2018 05:23:51 -0500
Received: by mail-ot1-x344.google.com with SMTP id w25so26409677otm.13
	for <qemu-riscv@nongnu.org>; Mon, 19 Nov 2018 02:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DZpZPmVVvEWSZlohGGxguGJploUJHLGLMHGVlq7qOyE=;
	b=TfjD/0d45GMwcbaO5IcSDZbPED/ZpQG/Ve/1iAVOdeIS1Lqb6h2wWxaF5iIfsAbQTL
	cIaVwY3vT7ajO+gtlu3juJU+R19nTK6SGw2Qo7ZwZPOkQxI00xCixN3nLwkVIulwYSa4
	7wSNpLOMx1qFW8w1uMGWf0fISPNUuQ1t8WjM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DZpZPmVVvEWSZlohGGxguGJploUJHLGLMHGVlq7qOyE=;
	b=es5eACbKx15+cj6qzhq0egHLokibyYpTNoCw99uVSedPI6vhPjtWLBUc/GNg3FZbjX
	2xvqf7ARzvaGsjw+wONiqsuH6B4Ui906ZYaC8MEubiYBqtONfJX9o2wAHtHaKhSe/RY9
	a44GJDZdm4Vr70TycCa/2YKaZMYZG14EBLC7hX25OifWOKOQgmPd7/nZnob3eI4LlqKR
	pXEVK7+XvMyM7ZgFIPm7PsKdXPRZijsrJKL7nCfdPv+oWBYHliG+68yzOjH+dbswSATY
	hJoznjeDAaku1LROkiEky5p1Cwv3AeD7WD1+6zavHQSPqhOaz2NFjRn8dkSQIUuS7ouo
	PF4w==
X-Gm-Message-State: AGRZ1gIFid0VpiUa524ceTVtrbOmq+L/F45X1skFi0VIed4CTf4Cbdy4
	lrE9/Ob1odA0QKs2OOyXLtyDSUS7O42acVGRsomH8w==
X-Google-Smtp-Source: AJdET5dAH9OyOj8Q63AeBjPWyPn6zylbGWyRGGwFxKWOSieYEW0yBQXzlYhKaPrtRkrVdO8eX8ecZic5Xaw+yxZjL8g=
X-Received: by 2002:a9d:582e:: with SMTP id r46mr13006195oth.238.1542623029663;
	Mon, 19 Nov 2018 02:23:49 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Mon, 19 Nov 2018 02:23:29
	-0800 (PST)
In-Reply-To: <20181116213045.19825-1-palmer@sifive.com>
References: <20181116213045.19825-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Nov 2018 10:23:29 +0000
Message-ID: <CAFEAcA8BZmJnmeQTnorKnscZKQQd2EXvRJZ2Xa_LCShEvQ04hw@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-riscv] [PULL] RISC-V Patches for 3.1-rc2
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
X-List-Received-Date: Mon, 19 Nov 2018 10:23:57 -0000

On 16 November 2018 at 21:30, Palmer Dabbelt <palmer@sifive.com> wrote:
> The following changes since commit cb968d275c145467c8b385a3618a207ec111eab1:
>
>   Update version for v3.1.0-rc1 release (2018-11-13 18:16:14 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/riscv/riscv-qemu.git tags/riscv-for-master-3.1-rc2
>
> for you to fetch changes up to 3502dc824a7b0218abb49f4350e80a49829748cf:
>
>   RISC-V: Respect fences for user-only emulators (2018-11-13 15:12:15 -0800)
>
> ----------------------------------------------------------------
> RISC-V Patches for 3.1-rc2
>
> This pull request contains four patches that aren't really related to
> each other aside from all being bug fixes that I think should go in for
> 3.1.0:
>
> * The second half of Alistair's memory leak patch set that I missed last
>   week.
> * A fix to make fclass.d availiable only on RV64IFD systems (without
>   this it's availiable on RV32IFD systems, truncating the result).
> * A fix to make sfence.vm availiable only in priv-1.9.1, and sfence.vma
>   only availiable in priv-1.10.
> * A change to respect fences in user-mode emulators, which were
>   previously treated as NOPs.
>
> As usual, this builds and boot Linux for me.  I don't think I have
> anything else planned for 3.1.0, but I may be wrong as things are a bit
> hectic this week.
>

Applied, thanks.

-- PMM

