Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gIbsF-0008Qr-2Z
	for mharc-qemu-riscv@gnu.org; Fri, 02 Nov 2018 12:00:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gIZu9-0000Vl-Vj
	for qemu-riscv@nongnu.org; Fri, 02 Nov 2018 09:54:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gIZu2-0005k9-Oq
	for qemu-riscv@nongnu.org; Fri, 02 Nov 2018 09:54:28 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:41581)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gIZty-0005iM-Sc
	for qemu-riscv@nongnu.org; Fri, 02 Nov 2018 09:54:22 -0400
Received: by mail-ot1-x32a.google.com with SMTP id c32so1730866otb.8
	for <qemu-riscv@nongnu.org>; Fri, 02 Nov 2018 06:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ljZb3mSzi2YYdIy+pnMyQUJnQp5DcWbblFqT7jPk4Io=;
	b=MORgtld9+UCcSBTEIfB6/bR0cQOuUWSRyQUgB7emhMjlNxyb7beKbQEt7GKBpzCBUD
	KkJhhXVfBPKo5uLbtbeY2p5LCX8isPWQ/LrSkG3iouH4eBz91AUi4B2NbH6HDseDtQh4
	H46eM2wWcP1giQe8gxOE8z0NF4Iha1zrt4IXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ljZb3mSzi2YYdIy+pnMyQUJnQp5DcWbblFqT7jPk4Io=;
	b=L7H/EybCGIEJyYIIzxw1/qFpP42jaxROwhsd9zW5Gx66G74raRgbrduItbc3ejopNC
	/KTYsZQAb5kU5lNSjdt62UXHQ2qPkzoJGj03mJ1bM1ZpgJYXxUsLI4SS/xbOVrRg+u3+
	8YxUPm1Lb2/Of28WWkodsxD7jRdmcUc0McLvv/tc0VM9qIgyq2uzUQ3d5ENj1umZhgsO
	a43iJTe4RvBrgOyV4Q+Rz2mKMzZgIzkasJFEhG6UPr11dGJyZpZ3IEqZIXybQ2jndEPC
	qj7tuyhl1FepDdLq+erpkU9Q7SJOZrWCfZhNeKL8PYWcVl2xyAhjL9PHzGk9N3+X0y49
	hT8g==
X-Gm-Message-State: AGRZ1gJIf5vgeEd3wvRMlhmivJAFWJT6ktVCJIuuuZfIza4wOPzfL6Ph
	sHgIcnilIud8gOahr3sAmfm4+8TcAD3FI8nLQ9mgFw==
X-Google-Smtp-Source: AJdET5e3AqEPB75hpmhuW4R/ZSXnKwvmOqxEG4HjwrB9LhSBjAoWAgHkc/GP4sGeMOvsdlhrqcq7d7cVtoVwauEiYG8=
X-Received: by 2002:a9d:5f81:: with SMTP id g1mr7511346oti.317.1541166856809; 
	Fri, 02 Nov 2018 06:54:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Fri, 2 Nov 2018 06:53:56 -0700 (PDT)
In-Reply-To: <20181101235525.29042-1-palmer@sifive.com>
References: <20181101235525.29042-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Nov 2018 13:53:56 +0000
Message-ID: <CAFEAcA-h0iQ2RcCkkE66mLxjXZ9YOZG3STAO3Bv5C3rQ7jyhdQ@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: qemu-riscv@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::32a
X-Mailman-Approved-At: Fri, 02 Nov 2018 12:00:36 -0400
Subject: Re: [Qemu-riscv] [PULL] RISC-V Patches for the 3.1 Soft Freeze,
 Part 2
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
X-List-Received-Date: Fri, 02 Nov 2018 13:54:30 -0000

On 1 November 2018 at 23:55, Palmer Dabbelt <palmer@sifive.com> wrote:
> The following changes since commit a2e002ff7913ce93aa0f7dbedd2123dce5f1a9cd:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/qemu-trivial-for-3.1-pull-request' into staging (2018-10-30 15:49:55 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/riscv/riscv-qemu.git tags/riscv-for-master-3.1-sf1
>
> for you to fetch changes up to a094b3544f2855c0489f5df3c938b14b9a5899e5:
>
>   Add qemu-riscv@nongnu.org as the RISC-V list (2018-10-30 11:04:29 -0700)
>
> ----------------------------------------------------------------
> RISC-V Patches for the 3.1 Soft Freeze, Part 2
>
> This tag contains a few simple patches that I'd like to target for the
> QEMU soft freeze.  There's only one code change: a fix to our PMP
> implementation that avoids an internal truncation while computing a
> partial PMP read.
>
> I also have two updates to the MAINTAINERS file: one to add Alistair as
> a RISC-V maintainer, and one to add our newly created mailing list.
>

Applied, thanks.

-- PMM

