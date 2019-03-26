Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8jno-0007qw-6h
	for mharc-qemu-riscv@gnu.org; Tue, 26 Mar 2019 06:59:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h8jnl-0007jc-Dp
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 06:59:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h8jnf-0001vI-O5
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 06:59:25 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:41537)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h8jnd-0001uL-OX
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 06:59:22 -0400
Received: by mail-oi1-x232.google.com with SMTP id v7so9530867oie.8
	for <qemu-riscv@nongnu.org>; Tue, 26 Mar 2019 03:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zSBbPJ17GyiCglQOsowtg2Z4EwQsruE59G9AfvZzOU0=;
	b=r26W+HNeJpSuvDl/Cx2vh/KwXTaMPokC63kRKpv5GvGsmLixOBkCeuqBmex6CSyrKA
	aVbAaP6iEfAgKECrFOg420hdVRTcYFu2ExVI3XkDGv5iPA8IiouGH33OWrIOASXP4YwW
	wMY6z0yxanUZiczd3tJQavKSCQvekKF8h0/riDe9I+av3C2eW+OUT6xWQDvkz79h2zNo
	LwCv08exzVHOE4DLMxo1cDC/aerDdRBvBU5ccqCOy5P7JLZa+QvLqC8v9PUI+8X/azFU
	lpl+qdNueGp6xVamXj7xyyNnf3r6YpD36jeCBKhEbmO7BN1i9QEjjIpGCV0INaK8cBe/
	BLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zSBbPJ17GyiCglQOsowtg2Z4EwQsruE59G9AfvZzOU0=;
	b=CLk+nYRXz4h082ry9DQDqNIsGDIjFJmQGMuUDE1earN2TyDXqDtIKyXYteicFusJFr
	/AxSvz828w30OJeLkLLnsFgD3E0C0iLqZfrdZeOdtYTCV0uah5oPgNYATtBP8Sbmcdif
	mvxEHg1f1L9HwUPSHMMF6ZVaUb88s2ZB491XvG/CfDrLptS2sOx5xQG26JgaNfoOrrME
	DSXcsfDGJpzdLMWySLHoK2orQf7iREoA1HJ8hwOTdOIagNzkG/diyo/zChxHOVwPDeKc
	I8IuF7Su4PWWzzyfL218g/wiLv75cbsYjGGWF2VBy9uu61kPM3igJLFibQvS+vq9q0VR
	kS4Q==
X-Gm-Message-State: APjAAAXriaeb3OEHGY29Vg6w0ltxx4LUvqJ2AOwwgFZ6GDbCv+nFAFpY
	WZvFwehrlha3kS4ct+NWhKgibP1EUZKHBzUGJvL+hA==
X-Google-Smtp-Source: APXvYqzhx2QAGNWN0jgBANrVWrAMEPBgI1hAVOLYtMBCZJ3KC7aQ3U4H0W5Mpr4/cv9EucerPe5r+5jb7SR1BZZe2p8=
X-Received: by 2002:aca:e84c:: with SMTP id f73mr15307255oih.163.1553597959918;
	Tue, 26 Mar 2019 03:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190326102515.7071-1-palmer@sifive.com>
In-Reply-To: <20190326102515.7071-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Mar 2019 10:59:08 +0000
Message-ID: <CAFEAcA8W=DqOS8LRHOeQq-xxp2U-3TWGMUNT_-Uz5qT9J2WboA@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::232
Subject: Re: [Qemu-riscv] [PULL] A second RISC-V Patch for 4.0.0-rc1
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
X-List-Received-Date: Tue, 26 Mar 2019 10:59:30 -0000

On Tue, 26 Mar 2019 at 10:25, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> merged tag 'riscv-for-master-4.0-rc1'
> The following changes since commit 4aef51963924fd58ffe88daebbe8055a360d7c10:
>
>   Merge remote-tracking branch 'remotes/palmer/tags/riscv-for-master-4.0-rc1' into staging (2019-03-26 08:51:35 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.0-rc1-v2
>
> for you to fetch changes up to 620455350a8da7cc62ae82cb69dd5c556f744136:
>
>   target/riscv: Fix wrong expanding for c.fswsp (2019-03-26 03:17:30 -0700)
>
> ----------------------------------------------------------------
> A second RISC-V Patch for 4.0.0-rc1
>
> Sorry for sending two back-to-back pull requests.  It looks like I
> misunderstood Kito and there were actually two patches necessary to fix
> the GCC test suite runs.
>
> ----------------------------------------------------------------

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM

