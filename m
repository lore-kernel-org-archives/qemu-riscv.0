Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZrUP-00031J-Ge
	for mharc-qemu-riscv@gnu.org; Thu, 20 Dec 2018 01:07:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gZrUN-00030A-1k
	for qemu-riscv@nongnu.org; Thu, 20 Dec 2018 01:07:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gZrUF-00008T-Ti
	for qemu-riscv@nongnu.org; Thu, 20 Dec 2018 01:07:17 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:36270)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gZrUF-00007y-5M
	for qemu-riscv@nongnu.org; Thu, 20 Dec 2018 01:07:11 -0500
Received: by mail-pg1-x542.google.com with SMTP id n2so376928pgm.3
	for <qemu-riscv@nongnu.org>; Wed, 19 Dec 2018 22:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9Ed/CsuxiL8SuyS6i6ryzHTz18O7oNYp8eRK/6FcRmw=;
	b=ZkcGZMue45X/XkWKxQx1Z6tEH7aizLWCsH5GtPrrp4vDT8/0tAvu4jm3I04l0SHTbW
	UxQabFJ0StBuBlrcNuywFR/9g7xIVxD/He/Uol7y2H+pH97rcP7M0dkPI4x/qHxpnmZb
	Q2YYBK1MXWZ22FaNS16syEvLifv/6QF+c/esg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9Ed/CsuxiL8SuyS6i6ryzHTz18O7oNYp8eRK/6FcRmw=;
	b=lEbq7q2sq7E3R8EYUBWTxsMN8GSqbiP5XyD3u5XCMFoy37ueph/McrIHsTHBJJMM1m
	XLhQrPhN1Zu4sXZZ1wh0E2sda6zYPfEQoM22OaEBMbxdeIWpRpZtyWnxDPjQS0pKah0s
	Da2FmCQxYiA1DUxMuu6qBVIGIxzQyUhNKHOeKR/ZnFmggjqyMwhOX1XSQ/Wmm/WgwBap
	jj1l0cse8x1oMAxdQ+hfQ5u6OC0wiQRGUDT9J+avaAN9luD7rJNPAbqFuFNnl0DlZHDB
	nMS5xLl3Ql99Gm+SpkoQ6POxAkwHH/Yr3+Uy3a/APLIEAU6gZQifLddm2Tc1FHygae/U
	CFSQ==
X-Gm-Message-State: AA+aEWYpwF5fmnnCdtjt9x6s3xIbO9rzMiOvMBH9+UuKN0PF5tuFbTjP
	cgkB74FzTAgPwlz7owiRMJjQAw==
X-Google-Smtp-Source: AFSGD/Uc77Ag1nUB1g8bLOF86sWN1ZowP7S1vhU2AlSx2tQDr4IgETiMziewuKsoQe7RvoxwS1aFrQ==
X-Received: by 2002:a63:dc0c:: with SMTP id s12mr9204875pgg.398.1545286030096; 
	Wed, 19 Dec 2018 22:07:10 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157])
	by smtp.gmail.com with ESMTPSA id v2sm26181835pgs.0.2018.12.19.22.07.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Dec 2018 22:07:09 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1545246859.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <19f7305e-ae63-3a5b-87dd-e0cfd835462f@linaro.org>
Date: Wed, 19 Dec 2018 22:07:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <cover.1545246859.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-riscv] [PATCH v2 00/23] Add RISC-V TCG backend support
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
X-List-Received-Date: Thu, 20 Dec 2018 06:07:19 -0000

On 12/19/18 11:16 AM, Alistair Francis wrote:
> This patch set adds RISC-V backend support to QEMU. This is based on
> Michael Clark's original work with extra work on top.
> 
> This has been somewhat tested and can run other architecture softmmu
> code. It seems that any complex OS will eventually hang, but we can
> run the BIOS and OS startup code for a number of different operating
> systems.
> 
> I haven't tested linux user support at all yet. I think Michael had that
> working reliably though and hopefully my changes haven't broken it.
> 
> There are still some todos in the code (there are missing instructions
> and byte swapping) but these should assert instead of generating invalid
> code.

Queued to tcg-next, with the extrh fix.

Some of those todos are no longer todos, since e.g. bswap is now optional.
Those asserts should never fire (as a good assert should do, I suppose).

The missing instructions are only for riscv32, which afaik is just now making
its way to glibc.  So a chroot complete enough to build qemu is a ways away.
I'm ok with leaving that incomplete for now.


r~

