Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gsD4v-0007ae-UN
	for mharc-qemu-riscv@gnu.org; Fri, 08 Feb 2019 15:48:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gsD4s-0007Yq-I6
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 15:48:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gsD4o-0001lY-Ro
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 15:48:50 -0500
Received: from mail-vk1-xa42.google.com ([2607:f8b0:4864:20::a42]:40302)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jimw@sifive.com>) id 1gsD4h-0001Vc-4C
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 15:48:41 -0500
Received: by mail-vk1-xa42.google.com with SMTP id v70so1132852vkv.7
	for <qemu-riscv@nongnu.org>; Fri, 08 Feb 2019 12:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UxT29kiCIm1XmjA/YgdDSyKpiF0SGaIWn8dKGExb6pE=;
	b=U/R3U4+n5t7qYjtyC4z8MgcDyRWexz3D9Oxavsnfm1Mq7Bdi1gR/NFsWXeFppuGdOx
	5DENVtKe2e4LqR7xwcSqAA2MzcvU6G1hRpyVesA+XnRJSNh5L4PblDix32ZxHu+tu28x
	qsKZl70Bkl6xYlGryFP3duAzn+9IhKcpg2nmBUe/09bBr/yR7VAjpZOh6PbhEN27v+Cj
	Nwt4lsHrTFW/GAA2HPAHBu3i1gcK4/fYdBQWQl3iIjxYd2Qko92hnvgf0sy+sa1M2p65
	H2JI42eNqjmCmtP7meiX0WNEEGcx2vi48nva7P/fCqiah4cggH348tWSGUkUCDdBoS/1
	3zWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UxT29kiCIm1XmjA/YgdDSyKpiF0SGaIWn8dKGExb6pE=;
	b=GGeUEP+uU7Q3e2HO6lNV6NmriB8scU2j0yA6tt+p1mG1n6iolV0qLxXWuO+cDOa4+r
	nzEOYTBvByEVEVt0TC3bEgQ5pq/AxZLX0NgGfefFY/84IEiheblZlvfhfUk+bmAl4Eho
	8rSkDzN3Li3ObzxJkDgMmmNRsKrouz3i7rAhpePOPFCPO+51wE0bKU7XHSz3YRFqvAQr
	3B7KuTbnPhpF01dYGjP2ZA1YYOePgvTDoRdYHNxQ2llReILqlYRXTd9e4KP78w2hedE/
	5lnAhtAiXlqKSWFPzwwNMMpP1LI8fNV/uBQ03mDFyELogIyQxjrPH9g8noHVEg/G6NH6
	PlUA==
X-Gm-Message-State: AHQUAuZpxBuSE10xZMV3E9iajXPFgq1cGsmN9ibt/tkeT4ZOzVQZXGmt
	iwI0iExwTQnppZChBt/TRfj8q/o8Nan+6nnwrFwP+9l0
X-Google-Smtp-Source: AHgI3IZKhiTcHRp9iyCbetEIvwMeELFTTGfvWmr994mFf7q+e6Yr6lyBSrkAx2dHGW+TldkvS6VikG/CRkvx+sU0Jz4=
X-Received: by 2002:a1f:1408:: with SMTP id 8mr8146371vku.36.1549652946051;
	Fri, 08 Feb 2019 11:09:06 -0800 (PST)
MIME-Version: 1.0
References: <CAFyWVaZ5tQq4eGaZiPBq7172PB_x3JCqV6c2xo=wSJdgbJakKQ@mail.gmail.com>
	<20190130025708.12811-1-jimw@sifive.com>
	<CAKmqyKMrCVqudmyJUPta9q6TJtDkeLV=FseAqQ7YhYMu3ak_NQ@mail.gmail.com>
	<CAFyWVaaS_4RY9YKXcgJ1F4Ep1TDWkExtBTEigJedZQCcXG+44Q@mail.gmail.com>
	<CAKmqyKOgnM0+6EByX-AWry-pkry_VQOa3SN5PWU75E0Q3_rbSw@mail.gmail.com>
In-Reply-To: <CAKmqyKOgnM0+6EByX-AWry-pkry_VQOa3SN5PWU75E0Q3_rbSw@mail.gmail.com>
From: Jim Wilson <jimw@sifive.com>
Date: Fri, 8 Feb 2019 11:08:55 -0800
Message-ID: <CAFyWVabDFOoC2QzcquL+taW58j42hN7C3Us98LPBFqQf4oUXzA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::a42
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
X-List-Received-Date: Fri, 08 Feb 2019 20:48:52 -0000

On Fri, Feb 8, 2019 at 10:17 AM Alistair Francis <alistair23@gmail.com> wrote:
> Can we just write a wrapper function then that sets and unsets the variable?
> Something like this:
>
> riscv_csrrw_debug(...) {
>     #if !defined(CONFIG_USER_ONLY)
>             env->debugger = true;
>     #endif
>             result = riscv_csrrw(env, ...);
>     #if !defined(CONFIG_USER_ONLY)
>             env->debugger = false;
>     #endif
> }

Yes, that would work.  Do you want me to resubmit a fixed part 5 patch?

Jim

