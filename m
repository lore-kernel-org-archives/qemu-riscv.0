Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDOZB-0007vq-6h
	for mharc-qemu-riscv@gnu.org; Thu, 26 Sep 2019 03:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35979)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iDOZ7-0007qi-Fb
 for qemu-riscv@nongnu.org; Thu, 26 Sep 2019 03:51:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iDOZ5-00075p-NU
 for qemu-riscv@nongnu.org; Thu, 26 Sep 2019 03:51:52 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34090)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iDOZ5-00070S-J9
 for qemu-riscv@nongnu.org; Thu, 26 Sep 2019 03:51:51 -0400
Received: by mail-oi1-f193.google.com with SMTP id 83so1299484oii.1
 for <qemu-riscv@nongnu.org>; Thu, 26 Sep 2019 00:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=piBZm6c0B9OHu39h13g/t4GeewKYhac1BqjPaJCknOw=;
 b=UnbxwicJoCt+RX4tEOGBppHUBGSAJRNXpyj3gWj0oaK7EJcKfTSgqmlfn8uLsLbNgq
 jRORyjsOZBBG0kxWeg17GL/0CfiWml7dh6C6mwpwaYH4TvD/SOvnNqBpz1RkGZTwZBBm
 ZskEap5x9+crxkENXwueR/hsNRKZyQ9pCRaqzgtAJwGEyazYf4JWU+H2yLOTxbIUaUrF
 dZFg7hcRd2/8WuULWy7WORvj58P1O47BFxoMt7IeRx1S8hhQEd0x5q+Nz5Ww/H5vID/7
 Am7bdhL11kJCunGI2jduLzBnuiT8o1pE1bgxvapi/jNUZsbgKvW/ACtquUKlQT3GQKjg
 k/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=piBZm6c0B9OHu39h13g/t4GeewKYhac1BqjPaJCknOw=;
 b=NG/3DE8UWpU5h/5kwO/Q/vk2OlZ2GLGwgaJeInSQd+BnojlwhlO5LF3bIwtCmrU97U
 BpykI59WnD3QU4RbDIzTSMMlDRb1S20p5Oy4nX7eCb75dF6qUFCaUofUnjLfAbX3OjWP
 X2pgUw8IAPZGhXWkn5fFwbNZNd+tavMDAaGaT0Ofx6J2YQN8aPzxriLK5xF/BbWD/oVT
 fe38mr1xBBLCk0kyFFQK0oUT9LbqKD+30jkULRb7TymzAzIa/F3Ed2LuRPuLI/dGUePy
 Qo0rLzSnTR6Lm08FnA8hWxyZIRHYrBqqGSQqvQ8l7hoLJw9Urg5Hc8701nv/E/vnUcDg
 p+OA==
X-Gm-Message-State: APjAAAVz+WScSq6Ug8r5Qi8NV8gLsSUdfdyymVb011ki2nu56gXBxXWC
 p6DmvXOh9R1E2cfbA+AiykkXJ7aoS3w7AzzK8ZJB/Q==
X-Google-Smtp-Source: APXvYqxbWijizyJrPpz2AKFW3LQQpjXFZqprBuEWlwQub8z9oY8l3hkBkTX0AgQnhmMosvxD2itTGADbuVM6MWGJ00k=
X-Received: by 2002:aca:50d8:: with SMTP id e207mr1517628oib.48.1569484248796; 
 Thu, 26 Sep 2019 00:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190925233013.6449-1-alex.bennee@linaro.org>
In-Reply-To: <20190925233013.6449-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Sep 2019 08:50:36 +0100
Message-ID: <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-discuss <qemu-discuss@nongnu.org>, 
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc@nongnnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.167.193
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
X-List-Received-Date: Thu, 26 Sep 2019 07:51:55 -0000

On Thu, 26 Sep 2019 at 00:31, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The 32 bit hosts are already a second class citizen especially with
> support for running 64 bit guests under TCG. We are also limited by
> testing as actual working 32 bit machines are getting quite rare in
> developers personal menageries. For TCG supporting newer types like
> Int128 is a lot harder with 32 bit calling conventions compared to
> their larger bit sized cousins. Fundamentally address space is the
> most useful thing for the translator to have even for a 32 bit guest a
> 32 bit host is quite constrained.
>
> As far as I'm aware 32 bit KVM users are even less numerous. Even
> ILP32 doesn't make much sense given the address space QEMU needs to
> manage.

For KVM we should wait until the kernel chooses to drop support,
I think.

> @@ -745,19 +744,22 @@ case "$cpu" in
>    ;;
>    armv*b|armv*l|arm)
>      cpu=3D"arm"
> -    supported_cpu=3D"yes"
>    ;;

I'll leave others to voice opinions about their architectures,
but I still have 32-bit arm in my test set for builds, and
I'm pretty sure we have users (raspi users, for a start).


thanks
-- PMM

