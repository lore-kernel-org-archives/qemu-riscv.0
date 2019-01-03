Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gf68b-00058R-7e
	for mharc-qemu-riscv@gnu.org; Thu, 03 Jan 2019 11:46:29 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gf68Z-00055b-0i
	for qemu-riscv@nongnu.org; Thu, 03 Jan 2019 11:46:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gf68X-0001cP-6D
	for qemu-riscv@nongnu.org; Thu, 03 Jan 2019 11:46:26 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:34697)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gf68W-0001b6-MB
	for qemu-riscv@nongnu.org; Thu, 03 Jan 2019 11:46:25 -0500
Received: by mail-oi1-x22d.google.com with SMTP id r62so28214715oie.1
	for <qemu-riscv@nongnu.org>; Thu, 03 Jan 2019 08:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5WrlGQcRTyiQNscuQyhV13b9K0090vFFFWUw7vYEwdU=;
	b=QRhwXbGLSlPWw85GJTHs5M0dww4fqgm1UfdzNybY4Z0FaVsx0UF8wh9qbRDxvApIjd
	PSggNejKlpTAwgPt3Oiw4W/FIHKbfcYO3rrV4bueIqbpbp0Rr6SDbriotSlfdymODO4p
	dArLvcDJwNdrFSMxr/asfiR6bhG8LunItJ1to=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5WrlGQcRTyiQNscuQyhV13b9K0090vFFFWUw7vYEwdU=;
	b=LJPBcW2i3btE70EdaUO8Hf3Tn/dEOGLaONO77JFt51Hs4QUZLfTeIgoUvby4sIr2qV
	HnwOWzH0VAgLOw7hu/ibmwmGfz3DbixdeYTEloF7KaVuB27Sd0+zcTCT0sZC/LiXziK7
	TxJQ/cLlh+E4uHQEmsYDtDcjPvjP7FDNKeDY8KO7Hv+jK5y4XT0p25jna4tjhGmz/xQb
	hce+dIgVwnAay6UFSOhBSJ6QY5Vz/TpwocHO5NTYQxrNRfpmp1iYb/mfYUbyaMqfzGic
	dZ2IyYSC8li+8wHBWWk7XdXsDi5S+rLcrDMBo+8K70btWKZY0rpL3aUd1vrRckjKGrHJ
	iRcw==
X-Gm-Message-State: AA+aEWa3bBx2/ETz6Pjvb70Wf/iQz+PmhJpXjfe7lcO4r/nBzDyLjba/
	hXgkMbmLlu9+kWPLWt7wJBq9l6WAcBvhIhNvhhr27Zcu
X-Google-Smtp-Source: AFSGD/UCg7+JbWsB0lgfTA3D7p8wvLNDOfoudNOu/R6PUnWmj+B+EgYxXPN9qom44zfeWfjYhFDbpi3FTW5o3Yuz1Ww=
X-Received: by 2002:aca:2dc9:: with SMTP id
	t192mr33410375oit.325.1546533982678; 
	Thu, 03 Jan 2019 08:46:22 -0800 (PST)
MIME-Version: 1.0
References: <20181226172005.26990-1-palmer@sifive.com>
In-Reply-To: <20181226172005.26990-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jan 2019 16:46:11 +0000
Message-ID: <CAFEAcA8t7V3XwkPCSKCPCd1qc=MxZcw2yjoHMW-NmTzGWMkbVQ@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: qemu-riscv@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::22d
Subject: Re: [Qemu-riscv] [PULL] RISC-V Changes for 3.2, Part 1
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
X-List-Received-Date: Thu, 03 Jan 2019 16:46:28 -0000

On Wed, 26 Dec 2018 at 17:20, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> The following changes since commit b72566a4ffaddbc0c0c1f6f5ee91b42ab13ff429:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-patches-pull-request' into staging (2018-12-19 15:31:02 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-3.2-part1
>
> for you to fetch changes up to 7b91ae7d7944056c5e8045342e4039e978e43c82:
>
>   MAINTAINERS: Mark RISC-V as Supported (2018-12-21 07:57:15 -0800)
>
> ----------------------------------------------------------------
> RISC-V Changes for 3.2, Part 1
>
> This pull request contains the first set of RISC-V patches I'd like to
> target for the 3.2 development cycle.  It's really just a collection of
> bug fixes with one major new feature: PCIe can now be attached to RISC-V
> guests.
>
> This has passed my usual test of booting the latest Linux RC into a
> Fedora disk image on the virt machine.
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM

