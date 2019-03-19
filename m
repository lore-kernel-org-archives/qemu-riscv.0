Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6DLD-0004nj-Ub
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 07:55:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h6DLC-0004nE-9J
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 07:55:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h6DLA-0001eF-Cp
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 07:55:34 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:34772)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h6DL8-0001dE-U9
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 07:55:31 -0400
Received: by mail-oi1-x243.google.com with SMTP id u12so12743808oiv.1
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 04:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mWK369x+n1UeKNAsOGxlDiE/ZueOU3CzCA/q/9WyrZw=;
	b=gHOc53u0D+Fy8tZDkJZ/txUv/Lv6yC3bkatutAEn0FzbUEF8SxvhTtiTsutBZuxpVV
	01EuU/IHsrC50f1vfWJ+sKiJDlTCUl8wNhFzwccGi8ajCx9UU8XYvFKjjEWg+8arjfjJ
	9CwPNEgoFO31zUl12LJ+vhULxJ8Yh5IEy2ZMM7qtol16Oz8QQ2Yys5zFCR/w0CpFnAdp
	nDa9EdCrR16lJrcxczx8JsWx+9ZlKGL8xSJGftHkqMvQK4mEDsPts4QvlsshyPiFad6y
	dFE5hhY2XSjiuPH6fUXOKYB2qs45ES3NKGZxLWKEYGsBtonRbYMKGpbBhjXodKRatYFt
	hqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mWK369x+n1UeKNAsOGxlDiE/ZueOU3CzCA/q/9WyrZw=;
	b=XXT15AZkq+71xVo1MT/AEJ9NkoJcPGcklKOXq6JDY0l33sbOK7Aa0CmbxBgcDBdVp/
	JGPIZoxCrFcjOvdpcum3pnyAecoqJQ1qdqQf+ZWW5gGatudK19uW4tjes7DjtoaWyA0D
	9mhmPtRu0bQhRTwC7zVrY8Ffc1vDMivTXUunLRjqm/xEy58C8qFdTY0PWcd0HUUPAJyA
	saQnz26UwnYFzGkzDYVuyF22FyBFRBy3S98KNn+L+frWTWx3C3vwLyxKkLPnmsvQp/6Z
	b9qhB5Ablj1PofetB5KJr+yb/OyM5wi5tHLZlZ8qq5/gjaGmNMVN5wWr4vFj4ztFZ3vK
	0o0Q==
X-Gm-Message-State: APjAAAU+VfY8iBDcgU6POMLbjp9QgVpSYKPXZadDWrTSadvzYawzEDWD
	83AN6e1sDzeLDnnN59LDi6qv4RjEQLilWiDv+ssKAg==
X-Google-Smtp-Source: APXvYqwBpmAJB6aTQvoDTnbe8o+/vx/9dwCRimAeJtNm1mG8lm6JGBRUx36pQWqJ/rhU/2HeuAYKe7k9ZEbpnxQP/+M=
X-Received: by 2002:aca:e84c:: with SMTP id f73mr1168921oih.163.1552996529630; 
	Tue, 19 Mar 2019 04:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKNK0ovGpGSqvthp5B-=1k8VrxNAokZj4+PFx==Lr=ETbA@mail.gmail.com>
	<mhng-7e5bff91-c165-4823-b292-ae81d49e3b4d@palmer-si-x1c4>
In-Reply-To: <mhng-7e5bff91-c165-4823-b292-ae81d49e3b4d@palmer-si-x1c4>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Mar 2019 11:55:18 +0000
Message-ID: <CAFEAcA8Hxd2L+wyPhHs99jDpbCVNkoZXzzFVBmKm-KfpedN1tQ@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
	Alistair Francis <alistair23@gmail.com>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 0/5] RISC-V: Add gdb xml
 files and gdbstub support
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
X-List-Received-Date: Tue, 19 Mar 2019 11:55:35 -0000

On Tue, 19 Mar 2019 at 11:45, Palmer Dabbelt <palmer@sifive.com> wrote:
> This is another one that got queued up behind the decode tree stuff.  I'd call
> this a new feature, but give that it's been on the list and reviewed I'm not
> sure if it's OK for master right now.
>
> Peter: is this too much of a change for post-rc0?  If possible I'd like it in,
> as it's pretty self-contained and enables a meaningful use case.

Yes, I think it's ok to go in. (If you send a pullreq for it in the next
3 hours or so then it'll actually get in before rc0 ;-))

-- PMM

