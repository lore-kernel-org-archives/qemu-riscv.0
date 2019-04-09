Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hDuO4-00053p-Dy
	for mharc-qemu-riscv@gnu.org; Tue, 09 Apr 2019 13:18:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hDuO2-00052m-NH
	for qemu-riscv@nongnu.org; Tue, 09 Apr 2019 13:18:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hDuO1-0007Mf-5M
	for qemu-riscv@nongnu.org; Tue, 09 Apr 2019 13:18:18 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:40455)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hDuNx-0007JE-Q4; Tue, 09 Apr 2019 13:18:14 -0400
Received: by mail-lj1-x242.google.com with SMTP id q66so15198682ljq.7;
	Tue, 09 Apr 2019 10:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OnonMNV80jRNuDW0HKcJkFMxHIPbqFnbUDCUWGB/xO4=;
	b=MdR8O1OOzdsBGxgX97FN/4AWlXTnJwJbz5ZAjg4kr4XHaAiZZqdS2zNupMvbkp9MPQ
	JlTnv926ejZM/ThrM8OZyN0vsT9Sny4219BZmxC90y09PQiV8f3313IRDTiuGA3Jc0Fw
	yJ31kG7GE/fRBSPq64kYkYVr+KcOsMRL8kk6gXJoU/XLXC4oSPVQfK3EZDpcxraS9/jl
	PfWIVzUS7osz4WIMdPhyK/u0/dVuYLK0n24hylUoU8AQVqUjBsJXCG71OzXQUkxq2rCV
	6Wqkiw7DisECj/2HuDTf5jQKORm9fPxZEIVHCzC0du+u+UHX1ZjFqYLB8lfOlgk4salg
	UiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OnonMNV80jRNuDW0HKcJkFMxHIPbqFnbUDCUWGB/xO4=;
	b=cX9wFCfPirT2BccrtGnXukQysjXn89q2FgPNVu6je1IU3pPA0Lp9l8MFFBXSHIiGGn
	aeb8V8hfC35jlw0ILsDu0BDPQ0GjzkryypQO66FhCO3UdAAnhnjRRzQ45RHvX30aVMgD
	v3FsL3pcLYeenHy6eAzukMiW0OHB7srWkSdi8r95TU+v8dXFjJevuZbY0dtUnJWQDLBU
	wHotGEa6TvJemTxY3r48NqvtTjrc5sk+qguluae3fbEh5gUOPO1W52wlBmP1wTQLFben
	ilG/uKiOUbvUZTehlq2ZsF83yy966nf3h+kaEIFUPuypbMEJwBHgdh0C2gzRgRWFQgxJ
	uXHg==
X-Gm-Message-State: APjAAAUhSKV8Lhh7ZF/uoNg9OgO+1uTcdsNp0sl7JdWajFD4YkLsVJl5
	bkhAlbTETj6UbE8wy5q6wp+tIfNNVeV7hSByQZw=
X-Google-Smtp-Source: APXvYqwlZ2OWuLdWS0KxXxDeitTp1oV5a00nHPU6FQvB/Lzbbtd50xe57zF9991COJ5Zf1N17XBrVmG8cZ7rmEIO1Po=
X-Received: by 2002:a2e:2a03:: with SMTP id q3mr20229670ljq.56.1554830291303; 
	Tue, 09 Apr 2019 10:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553899050.git.alistair.francis@wdc.com>
	<99590ce3f3572a2b02216a5d99cec03ccc3f35a8.1553899050.git.alistair.francis@wdc.com>
	<6b9005b62d51d3a1f44da142936e3d2b4b4dead5.camel@hellion.org.uk>
In-Reply-To: <6b9005b62d51d3a1f44da142936e3d2b4b4dead5.camel@hellion.org.uk>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 9 Apr 2019 10:16:39 -0700
Message-ID: <CAKmqyKOcgsmU5s5gta9v8rX9=2XxzPd0+dpa_c38jzVYb7T4Ag@mail.gmail.com>
To: Ian Campbell <ijc@hellion.org.uk>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
	"alistair23@gmail.com" <alistair23@gmail.com>,
	"palmer@sifive.com" <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for 4.1 v2 2/6] target/riscv:
 Fall back to generating a RISC-V CPU
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
X-List-Received-Date: Tue, 09 Apr 2019 17:18:19 -0000

On Thu, Apr 4, 2019 at 5:35 AM Ian Campbell <ijc@hellion.org.uk> wrote:
>
> On Fri, 2019-03-29 at 22:39 +0000, Alistair Francis wrote:
> > +    for (i = 0; i < strlen(riscv_cpu); i++) {
> > +        if (i == 0 && riscv_cpu[i] == 'r' &&
> > +            riscv_cpu[i + 1] == 'v') {
>
> Dpes something somewhere else enforce a minimum length or can
> `riscv_cpu[i + 1]` be past the end of the string?
>
> Similarly some more times below and also for the `i += 2` bits.

Good point, a valid string must be at least 5 characters so I have
added a check before we start the parsing.

Alistair

>
> > +            /* Starts with "rv" */
> > +            i += 2;
> > +            if (riscv_cpu[i] == '3' && riscv_cpu[i + 1] == '2') {
> > +                i += 2;
> > +                valid = true;
> > +                rvxlen = RV32;
> > +            }
> > +            if (riscv_cpu[i] == '6' && riscv_cpu[i + 1] == '4') {
> > +                i += 2;
> > +                valid = true;
> > +                rvxlen = RV64;
> > +            }
> > +        }
>
> Ian.
>

