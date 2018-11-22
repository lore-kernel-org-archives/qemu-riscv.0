Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPeS1-0004rk-Uf
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 21:10:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPeRz-0004qp-Q9
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 21:10:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPeRy-0002Qo-SK
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 21:10:39 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:35464)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPeRu-0002Dp-Vf; Wed, 21 Nov 2018 21:10:35 -0500
Received: by mail-lf1-x144.google.com with SMTP id e26so5423577lfc.2;
	Wed, 21 Nov 2018 18:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=I5VD1J5tpuzPAekAEATDuTVz4JbA0MgAkx7n1s4yvVg=;
	b=l1o8dLBv6c2M9EfN+F/jQlDtcKAaNlnY9lsAedSQ79dO743WT4F3aRHkTP/yUEf4DU
	SdsOr+xICQ/hqFznKcP4qv8tejhkaw7LmcRGlZz8wcfM4ehAhu3IfK5uEzg37ZhaNMK3
	Spvfk40BCSgUcDO3u2Q34hoDVRKWFvrZ+BIAzw/fl1+lDhO4UsLSEPRkh4/gZLr29JVs
	pBtb2ERNpK8JU5TdNurpdRQYZASiWYBz47yhwWFmdXSpp4L640xfBROvjToovZlqExml
	JJQLSJm8y02zf6IKLTQkqbtr9hVUwJ08WgZ72HBVkAqZZFaVelHh5tahQ0lJiBtNhzdb
	GDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=I5VD1J5tpuzPAekAEATDuTVz4JbA0MgAkx7n1s4yvVg=;
	b=FcDe1eyegvVCTpCfBr37wZrDyKYJRHD1a0vqQoWsYHTDIbts5hyvftiDGx3tMRWTJn
	2K5sKQx5Qww90/kAeiWfW+uJR8g08GRBQg3GvetHFfJNNiZmDwes3LaYfU807TLMZG87
	CYlxaG4OsBPoS9d4QQH/fQUtcLYXgMaixjG9cIZAVwDuHgLF1WtIr59u/Y3koV5kMkaG
	lFrFLKHO01/9cXVXfuhhtifOuCkvCXVK48b72PvTMppjeDTNyzUms6QoRdBNEr0LsYZP
	s+bz65NIQffM3MxhpQJNaXxnU4/PbT0TwUsq2e8apu3/bi1jjWM8dZxH4rFvpIHxemUJ
	ym9g==
X-Gm-Message-State: AGRZ1gJ7gzS+ljU15NPA0myvI0NS5q31La9mXm0Cy4knHtiF6gT8wrhz
	fdy/NahliHYrzeUEssIcQDTgK8pSIVBSwrmzK74=
X-Google-Smtp-Source: AJdET5ddjfpRkWFoDXmfKaD5z8KEi2OFkje1+Oy5y9yWAFzNIjUlvKBkKS54egWdyld97pH6OaJZdgIUkjhoQkJSwTs=
X-Received: by 2002:a19:5059:: with SMTP id z25mr5073168lfj.120.1542852633576; 
	Wed, 21 Nov 2018 18:10:33 -0800 (PST)
MIME-Version: 1.0
References: <20181121234651.24596-1-palmer@sifive.com>
	<20181121234651.24596-2-palmer@sifive.com>
In-Reply-To: <20181121234651.24596-2-palmer@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 18:10:06 -0800
Message-ID: <CAKmqyKM6_i_V2T-sc1eAJAMRCkacYHMiSCKcgg7xYHmXr7AfHg@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for-3.1 2/2] MAINTAINERS: Mark
 RISC-V as Supported
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
X-List-Received-Date: Thu, 22 Nov 2018 02:10:40 -0000

On Wed, Nov 21, 2018 at 3:55 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> There's three of us that are paid to work on this.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e89adc81d5d5..d5ec5e74f328 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -250,7 +250,7 @@ M: Alistair Francis <Alistair.Francis@wdc.com>
>  M: Sagar Karandikar <sagark@eecs.berkeley.edu>
>  M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>  L: qemu-riscv@nongnu.org
> -S: Maintained
> +S: Supported
>  F: target/riscv/
>  F: hw/riscv/
>  F: include/hw/riscv/
> --
> 2.18.1
>
>

