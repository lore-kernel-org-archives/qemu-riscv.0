Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gty7e-0007KF-Fq
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 12:14:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gty7b-0007Fd-Ri
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 12:14:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gty7a-0002lW-RO
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 12:14:55 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45978)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gty7a-0002Wm-Ko
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 12:14:54 -0500
Received: by mail-ot1-x344.google.com with SMTP id 32so5472508ota.12
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 09:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4P87m8oxHGntTIbgqGKhSX/ygtCiHdDDbb4yCbBP/PE=;
	b=C01LyikF8W0QktlTMx2d3NcrIMIAO2GNO0TeLBopuhLVHe3UBXCfwPIwbHJTMK8nuZ
	kryvlNT8P1vx2B0JYLAXatHpRMut+4FQ/q6SrwcZKTKis0Ky/QiNcAgjXwRwOTCwojOJ
	Kkh7BWScJ+txIu9Fs7ytygwt2dSdVQyEvsYrxaF9YYo1ms1t6Xqhq78wO58Kh94RIv48
	JPmp8aznRhc3y7ln33u8HZiHwe6p4yCoqIx/OvRmnwVqsWTrLTgIbciVW7ntV1Rnx6eS
	ItXr4Hg+X+rncl50zHNcYbUAyQZgTny7NvGtrFfMxWGkeJZpIX8NVALb3dUDA6v0qfin
	uJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4P87m8oxHGntTIbgqGKhSX/ygtCiHdDDbb4yCbBP/PE=;
	b=LR/X7KH/xjRymca4wvfY0UpDrz6VWM5EZt7tEGScVvvxDlJbnQyoBXFEg8PCny8r+k
	IMmnYh0IrBN94VK7UQ8bqyJ7t06hB95ruFadR4Vi0KO0nqEZj4A72lpgQrOR0O4BVSwh
	3ycV45Rch56uWUFPobV55lPvGNr9jOMuUIy4Ecq87sedPiJx9zuxjwRiZL1+1JyR0ZeD
	llu7YoABJxml8MwuqdLWVgDsPrxtWVjvHLpkiNEYoMgta1uaeEaLEVQ6+Yi5fotRYIw4
	/YL6XWNv2y7URwnCNVM9DyifJYZQ9qXe/+PwqfspmB5JJ1tMfp4fKrBnBCUcL/knvVLj
	yaKA==
X-Gm-Message-State: AHQUAuZvc3Aph9xnxjfJbG4Xm1NXq7sfjzwW3t4z5OqiLqDHaEIlsc1T
	M+k4sEr0PM0C+un2Odf+ep0lUrUbMw5T7BgrO/AMhA==
X-Google-Smtp-Source: AHgI3Ib3tu0PXWUBxyJq9KP/Jjt1KQH3QuPfTXs92fNmvRTZjks5jt6m8X2P+6cbr7IpAYvwVHYmrMxACE8YF93k1oI=
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr963217oth.317.1550078084059;
	Wed, 13 Feb 2019 09:14:44 -0800 (PST)
MIME-Version: 1.0
References: <20190212173839.31587-1-chouteau@adacore.com>
	<CAKmqyKOAVDbJQ6avwWgDHP1fHD_EXdZmi+Sjucm05ZqNkQoUog@mail.gmail.com>
In-Reply-To: <CAKmqyKOAVDbJQ6avwWgDHP1fHD_EXdZmi+Sjucm05ZqNkQoUog@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Feb 2019 17:14:32 +0000
Message-ID: <CAFEAcA_5jYqTWVBiTFjumkAHEEwvDkt_f_LHAo=00gkEfoY9sA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Fabien Chouteau <chouteau@adacore.com>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Michael Clark <mjc@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] SiFive RISC-V GPIO Device
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
X-List-Received-Date: Wed, 13 Feb 2019 17:14:56 -0000

On Wed, 13 Feb 2019 at 00:13, Alistair Francis <alistair23@gmail.com> wrote:
> I know the other RISC-V files don't do it, but this should go in the
> hw/gpio directory instead of hw/riscv.

It might be nice to move those existing riscv devices into
their proper places at some point: should be a fairly easy
cleanup patch if somebody wants to take it on. (Advice
on what should live where available on request.)

thanks
-- PMM

