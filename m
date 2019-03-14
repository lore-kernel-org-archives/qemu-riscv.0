Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4L17-0006jd-Es
	for mharc-qemu-riscv@gnu.org; Thu, 14 Mar 2019 03:43:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4L14-0006iA-R8
	for qemu-riscv@nongnu.org; Thu, 14 Mar 2019 03:43:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4L12-00037Q-8E
	for qemu-riscv@nongnu.org; Thu, 14 Mar 2019 03:43:02 -0400
Received: from mail-it1-x129.google.com ([2607:f8b0:4864:20::129]:52708)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h4L11-000369-6r
	for qemu-riscv@nongnu.org; Thu, 14 Mar 2019 03:43:00 -0400
Received: by mail-it1-x129.google.com with SMTP id g17so3140161ita.2
	for <qemu-riscv@nongnu.org>; Thu, 14 Mar 2019 00:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CdeUAda5uRByPNndW2OKTcNr66KOhImToL7ILBl5jAk=;
	b=FrmuW7SkS9+alzR65dt59LHafuigPlEVQbZfdPlyLwtAcpjHjGr9OI0nYz6kd538Ji
	f7HSr5NHN9EmpnLzt8mQ8vfx/nd72VDUKKb6FV37ZSkx6qRXe4CnXFjbRt/XErcyryzz
	XpMm0F0kDvEuA2Uue7/ZrpuvCqJudcJWlpCZhIc4fRWMvK4PJwp9+f2Ns49OPdUJYoE3
	0DfTsLAffAGc9twpJUgG5PfQPsGHNApFXJcD1oRNHo86Ixr9444X3KwkN0MBfjHiOIPj
	+EiwQIzlE+8pAHGSF5Ur2SaSMwUMWmjvDda5Jfsi+nIINmqhh0OtDVDGkFKkOaY+P2WF
	ju5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CdeUAda5uRByPNndW2OKTcNr66KOhImToL7ILBl5jAk=;
	b=POKoIOUAlch1sVtToLMyDbOcMKCWVFHFv2LNnoduBUoU7UVjwiu3ZuuZbDhrjsz35O
	1Y4/s4vgtrW7RO/if1n/LXFAwDc4Px0UNfKw0ewPP1sORqqNgsrzF7w+//o/r07zCShR
	ncBHx84HS0sCJ2gauZAsajaby90RHYhTPIp87bmVG/4XKQl21LmbIgUgvowlEWL5YSKe
	Ke48eYVVNx/fyukpjXc7RDwsLe159SjBONsE1YnVvWCG8O/t3glzIiiW0EobZiQZXyU+
	R3BLr7ur6BOW618sNnyZps6OFXYOdZCUnbHaZulBzxNyIB2eCaESTykwvOqYpV4VRsOb
	hIRA==
X-Gm-Message-State: APjAAAWBVnhs+xNDvvKQ3gawtfjTTZhiMTItoC7YwYA29h28xpFwrzEb
	/xLocxQ4EQ1p9/FFYXQJh6qcmn2egKI6vTBepLFXwA==
X-Google-Smtp-Source: APXvYqwcYAJTfJMHoo4D13m5o/l/+JIPd9rccK0Fr28XYdRsfB4cREewpo/jhGWHJmoUzj5xPX+9X+kvBQRoQq0wPEk=
X-Received: by 2002:a02:4904:: with SMTP id z4mr25221646jaa.46.1552549377894; 
	Thu, 14 Mar 2019 00:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190313143705.29129-1-palmer@sifive.com>
In-Reply-To: <20190313143705.29129-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Mar 2019 07:42:46 +0000
Message-ID: <CAFEAcA8wy5mw1tgbOAE02gZkuS6-LMVHYkweBWhw7fPq101DkA@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::129
Subject: Re: [Qemu-riscv] [PULL] target/riscv: Convert to decodetree
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
X-List-Received-Date: Thu, 14 Mar 2019 07:43:03 -0000

On Wed, 13 Mar 2019 at 14:37, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> merged tag 'pull-request-2019-03-12'
> Primary key fingerprint: 27B8 8847 EEE0 2501 18F3  EAB9 2ED9 D774 FE70 2DB5
> The following changes since commit 3f3bbfc7cef4490c5ed5550766a81e7d18f08db1:
>
>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2019-03-12' into staging (2019-03-12 21:06:26 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.0-sf4
>
> for you to fetch changes up to 25e6ca30c668783cd72ff97080ff44e141b99f9b:
>
>   target/riscv: Remove decode_RV32_64G() (2019-03-13 10:40:50 +0100)
Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM

