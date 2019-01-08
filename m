Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ggyef-0003Aj-38
	for mharc-qemu-riscv@gnu.org; Tue, 08 Jan 2019 16:11:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1ggy69-0003Ip-91
	for qemu-riscv@nongnu.org; Tue, 08 Jan 2019 15:35:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1ggy67-0002FX-BL
	for qemu-riscv@nongnu.org; Tue, 08 Jan 2019 15:35:41 -0500
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44]:33534)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>)
	id 1ggy61-0002AU-FA; Tue, 08 Jan 2019 15:35:33 -0500
Received: by mail-yw1-xc44.google.com with SMTP id p65so2101506ywe.0;
	Tue, 08 Jan 2019 12:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=x4UzFbkeTAZnge8zPk7GrtVM/TMc5bk9adMhBX2mHHg=;
	b=GyMlGWoEQT2uYhddrZJQWTZOwvmWEv6TjsxoVhnva2Lth5qyxnbL22x7upm91dvnpN
	lTs0oXD+UtrGkPeZ8Nx2KbX2zuLVLFk9u8rN0udOqymMrNodUqel+wCeQc4q8KjXMYXr
	xKKc4XN1+iK/QEeSSiRsc6Es/rZyRniZbzyMBOrLk9es3guJbAxJPLst4ZPnM7lGwzBl
	gJIQE3jvG7QuwBCiTMxNl6M3fLSuqXiHif0KEeIGaMDYsPnv7jjDsqFc9KihLb/+iUHo
	wR7TPmt7MA/52q8C0Re6iNoXOWpaFjM8KBGrTJ4Xu2JE8ps3RGaTzuyGGPwmyX47dskp
	en1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=x4UzFbkeTAZnge8zPk7GrtVM/TMc5bk9adMhBX2mHHg=;
	b=g60k95Frlvj/HgawoKMrvOxaRtj/4WeQfATEK3uoPQqcvJolrZmgix1gawDWDzFxmG
	eMydx8Jj86fj5eO/HnXpDnCzgmpvD4hYxqPtktBgchtVZKwX4eokeGzFLcMo1cLnqrR2
	lnSVgtxNdDjW4nCgaHjj0oKnw38JrsHidzsMy1iwb53YdViq2QgNZK7hT/FlO/w34gXk
	gBsZF3KIbW6yvVM7Rzun5dQxoHFphWDAqfPJjQTw9QBTaVjaO/YeYXHh0lox71VtaB5w
	JxAO25YDv+cVteJM4L8ESqQOzg2TIXVeNupybuzqy/tw6XpCmR5bEzApU2TTaYzFCD1W
	/uPg==
X-Gm-Message-State: AJcUukeBZWhRR+wLgRu6KzeuXq5iquMr13FARuhuj+YTqnguMVttF2ch
	626NiK/tH3kGftYEyIqT6gINUokRBKdIpSclMSg=
X-Google-Smtp-Source: ALg8bN6u/opddpiXH3vqjeCFKKrJTmM7RuO23e9iIHwWpokPUboFyzWYGo+8NmhpiO/3S12L5IKDu5GLjUzVrdIjD+Y=
X-Received: by 2002:a81:5b07:: with SMTP id p7mr3240430ywb.468.1546979728364; 
	Tue, 08 Jan 2019 12:35:28 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8t7V3XwkPCSKCPCd1qc=MxZcw2yjoHMW-NmTzGWMkbVQ@mail.gmail.com>
	<mhng-39a30073-8d69-47fa-863b-b38761d1e8de@palmer-si-x1c4>
In-Reply-To: <mhng-39a30073-8d69-47fa-863b-b38761d1e8de@palmer-si-x1c4>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 8 Jan 2019 12:35:17 -0800
Message-ID: <CAMo8BfL96J7cT_R36qTHuwk+SvqWSEyZ5+oW05g=Bahc-QxFWw@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c44
X-Mailman-Approved-At: Tue, 08 Jan 2019 16:11:19 -0500
Subject: Re: [Qemu-riscv] [Qemu-devel] Wiki Account Creation [Was Re: [PULL]
 RISC-V Changes for 3.2, Part 1]
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
X-List-Received-Date: Tue, 08 Jan 2019 20:35:42 -0000

Hi Palmer,

On Tue, Jan 8, 2019 at 11:37 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> It looks like I don't have an account and I'm supposed to ask on qemu-devel for
> one.

I've created an account for you. Will send details in private e-mail.

-- 
Thanks.
-- Max

