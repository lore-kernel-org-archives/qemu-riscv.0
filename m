Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8iNa-0003K0-OC
	for mharc-qemu-riscv@gnu.org; Tue, 26 Mar 2019 05:28:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h8iNX-0003IC-Hb
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 05:28:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h8iNW-0001Qh-G9
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 05:28:19 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:34159)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h8iNW-0001Q8-7r
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 05:28:18 -0400
Received: by mail-oi1-x232.google.com with SMTP id v10so5006751oib.1
	for <qemu-riscv@nongnu.org>; Tue, 26 Mar 2019 02:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vFwVJi89pNBj3GF9s9lk4HO3Ot4gbm7jJ3PptL0T6jA=;
	b=zaL72/vaXa1BvP+6pWGCYCx4xRcWcWdZ5B7QdK7d2kpV+rkMJHecokunQDyHAHkj7y
	OhR5dX/WMgfdoB3yyVvGoIy/FCmkBkqACuaYr4Kcx+9rBMucyfVFE++mJDVEzejTu4ST
	/RdShtZ8QsaQ+jsUc5laYi0IaS5kP7F2rAO7VE4tE0w+Ap1RCI61Aw8Yi8uRMSU4mAmm
	iL76glN3szBynH8cOF9zx5ZLeR7DpqQuzaftMhie+tNGtfDmFbkVBEAhSJieVCLBsDfe
	Bl4jIjiUSQ1NTVfefRzeUXgmRdT3ktnEXMT2Pz2x7FVFBea6ikL/Q068CHRtJh11vshQ
	v1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vFwVJi89pNBj3GF9s9lk4HO3Ot4gbm7jJ3PptL0T6jA=;
	b=bxubUuV2Lqyzgifrquw+B9sJrUEBOrmlwkvs5ExiW1pnqBrCvSq5sTC2KkwSFwgfHm
	iaJLAKh0yv/dGndRAiLcAgpFmF+Bc1SZWrQ2QVPTsVx08B+jGKrvM7hpYY7E/hXJ0tj+
	NdzO9TSjvDQ/9IK4xLu9zq9UwIilWKrg0K756QsXrrfKbJuq2CVvZtOGnJ4I6itTEBq0
	gUkTKOBsiUAJIERpth27nCO3+9TZoFBV1c13aRupbz8mfqcdWCLKHVY6mPe5dD58zMPH
	PL7mNBt/Rb7R0ErtJOt2uG1f8uqVOVgipvnai5oQUHJMeUyGq+zQegRtUaqOGjsfA1OA
	cw1w==
X-Gm-Message-State: APjAAAXN3IJBrvo8AQU10z2jRWHGIPqEdTYEIdtuJfruQcVTxVT0Al6M
	Ftb9ghevSyYYyjVJ1E/7zzHWxB+vBdotuXYzQp2XwA==
X-Google-Smtp-Source: APXvYqxdg7mzux2SgP0u5roNTr/uR4n0syuQ9HBk/YV8Nk+Psz8SMSSJJlo2UbKL6DAdmHbYDykq3HFAAhsoZvOGTow=
X-Received: by 2002:aca:c7d3:: with SMTP id x202mr13964828oif.48.1553592497172;
	Tue, 26 Mar 2019 02:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190326055607.14694-1-palmer@sifive.com>
In-Reply-To: <20190326055607.14694-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Mar 2019 09:28:06 +0000
Message-ID: <CAFEAcA-FnGa9YYFABqu64f+=1ZuB-88sOX_qgVnHmosDQEzB2Q@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::232
Subject: Re: [Qemu-riscv] [PULL] A Single RISC-V Patch for 4.0-rc1
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
X-List-Received-Date: Tue, 26 Mar 2019 09:28:20 -0000

On Tue, 26 Mar 2019 at 06:54, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> The following changes since commit 62a172e6a77d9072bb1a18f295ce0fcf4b90a4f2:
>
>   Update version for v4.0.0-rc0 release (2019-03-19 17:17:22 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.0-rc1
>
> for you to fetch changes up to f17e02cd3731bdfe2942d1d0b2a92f26da02408c:
>
>   target/riscv: Zero extend the inputs of divuw and remuw (2019-03-22 00:26:39 -0700)
>
> ----------------------------------------------------------------
> A Single RISC-V Patch for 4.0-rc1
>
> If this is too late I'm OK with it being in rc2, but it fixes a concrete
> regression and nobody has complained yet so I'd prefer it to be in rc1
> if possible.
>
> The fix is to zero-extend the inputs to DIVUW and REMUW, which was
> exposed by the GCC test suite.
>
> ----------------------------------------------------------------
> Palmer Dabbelt (1):
>       target/riscv: Zero extend the inputs of divuw and remuw

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM

