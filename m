Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guI6I-000089-UY
	for mharc-qemu-riscv@gnu.org; Thu, 14 Feb 2019 09:34:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guI6G-00006M-Do
	for qemu-riscv@nongnu.org; Thu, 14 Feb 2019 09:34:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guI64-0003Tj-S0
	for qemu-riscv@nongnu.org; Thu, 14 Feb 2019 09:34:44 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:32824)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guI5z-0003HY-1Q
	for qemu-riscv@nongnu.org; Thu, 14 Feb 2019 09:34:36 -0500
Received: by mail-ot1-x332.google.com with SMTP id i20so10847975otl.0
	for <qemu-riscv@nongnu.org>; Thu, 14 Feb 2019 06:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NubJI//1KwyYsd8AP2ak+azLXIWLlbgFhg82tgThpBE=;
	b=HcdHwqDxwCF7e8i++O5O8d9hhSVOKEUe7Uyo4ZZXNuEoHuhDjD7wVgT9iR8Lf7oNyc
	akr3BnnhhDQ8zBQ69HBWaIolnXNSsQksbOCZSrH3mrOWMr1TvTA4Y9IWI/ue6b/GdYqi
	3fgzXITYeW/0OvjZ2vJbWW8uBkAihJCcAI2fDVE56FqpP0FyJ/vue1gktLwRxsvYdeN6
	f4ZF9pJH3xd/U03MwGfw8yl/f9r/ceg9A6em3+/tG7OY9bxE79HKT7qMYXHsraDDfu3C
	U27w0IvyvSXzUke5FzMvewh0vTFXc5bw49OBKpRmnRNFgLiXAo6ZylznqNoZjt2fS4J9
	wprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NubJI//1KwyYsd8AP2ak+azLXIWLlbgFhg82tgThpBE=;
	b=EmLITY4C1MbJ6iBLUXHLc+5YokKF7Z6Qtw6KEsP6PHQ2dTM6RvsPKgn3W7Q9h/8Duq
	HJE+6beUzwkZsiHfmNXWILz60xUM79TVyZYTZ7LbUJFqGmw2b1HfAuPIf97RR/Qwev6P
	9Cm1jlLv43X2nSLfJ9h99kjTbg8yJeRahdomdrJwcn+HjnhbzOT5P7GR6yGJ86t/1jYm
	i2pbz4TvwfQDLPpyfa2QFvbaG+RlaSnogYlNhBAPWpCDElD9PqOnzrFQL8Rz5J0XgtP4
	SOiladTVjqbj+BxlcRw8GgPHytpWH/wNNU2tYLc/Y7EJUUjjRYANp42bFIbUydDDUofU
	TJGw==
X-Gm-Message-State: AHQUAubsDg5H2E5nLdtC8ho3WZkwovTjumfaIIVZCsmQDbvhbIMbJbVJ
	Lb8hb4Ppm2Ss+6ByCEt2sKQXRq4GyimCxh6asyPJtg==
X-Google-Smtp-Source: AHgI3IbQb0eNB7BxyTvoQctKymd2SQogZJxUuaJ4nT15AI+HTcW5+p7PxwuZb4y0reLvSvA2UWM0T3R190OAb6apB3k=
X-Received: by 2002:aca:af53:: with SMTP id y80mr2585947oie.170.1550154866923; 
	Thu, 14 Feb 2019 06:34:26 -0800 (PST)
MIME-Version: 1.0
References: <20190213154450.14749-1-palmer@sifive.com>
In-Reply-To: <20190213154450.14749-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Feb 2019 14:34:15 +0000
Message-ID: <CAFEAcA97_O8zvuY8JQ8vOgcSs9Di=f_JU7YacDb2=TfOZNOjUQ@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::332
Subject: Re: [Qemu-riscv] [PULL] RISC-V Patches for the 4.0 Soft Freeze,
 Part 1
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
X-List-Received-Date: Thu, 14 Feb 2019 14:34:53 -0000

On Wed, 13 Feb 2019 at 15:45, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> merged tag 'pull-tcg-20190211'
> Primary key fingerprint: 7A48 1E78 868B 4DB6 A85A  05C0 64DF 38E8 AF7E 215F
> The following changes since commit 22c5f446514a2a4bb0dbe1fea26713da92fc85fa:
>
>   Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20190211' into staging (2019-02-11 17:04:57 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.0-sf1
>
> for you to fetch changes up to 40e46e516d90c2dfe8e8de3741c1c65f1b526502:
>
>   riscv: Ensure the kernel start address is correctly cast (2019-02-11 15:56:22 -0800)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM

