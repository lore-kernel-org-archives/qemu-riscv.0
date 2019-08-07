Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvNqj-00081f-7T
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 11:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53690)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paul.walmsley@sifive.com>) id 1hvNqg-0007x1-DU
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:27:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paul.walmsley@sifive.com>) id 1hvNqf-0002pk-9c
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:27:34 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36622)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paul.walmsley@sifive.com>)
 id 1hvNqf-0002oO-3A
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:27:33 -0400
Received: by mail-ot1-x343.google.com with SMTP id r6so105844680oti.3
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 08:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=L96TWPaJYFlpZCiROwFK/mYFAS/viHJGKOgXlgDH/nU=;
 b=Vw+NcrWjAHn2jfsVFLiExSl1jusii1oYjEFgSRw3vwpOoK9fCBD3M8jV6p9+2nMQIu
 a390UkepVDsqeuui6oLdDYKXatxJZFwgcNQr6VSdW6XwcknqAFc+kNzPD3vfIyiGvIyr
 i86kgARFjFTNJOXMV5h43K1dTn0scyOun6tWgO9da5I8/O01Qgx508PVsnH8NRbEF0hb
 YlFws8vGAa0rVf+1XejvQo8HPy2JWGWMJjueSMPtIY1eaTBCq7a5nPW0DtGE8ojAUjED
 wYl60PhjvxTG9xkUK+DjcdAkey/TEdQaIGlRYmPyzYmoYMtv8Hu1XaBt1ftjVZNWq/Rb
 LR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=L96TWPaJYFlpZCiROwFK/mYFAS/viHJGKOgXlgDH/nU=;
 b=WEX3sbj4fJ3AC3zAWumj3AF38JSmwmfTnlRhDjGPGKCq6XruGTFm4AJCfC4zh+6uK1
 Ry0iwrTBBgXryioYgFME8HF+glkHcgUJxoZATfZlp7fbGdD97m4DcO47jwms1i3sZfFw
 3t4ufQvcUvWjXXXpHAhe+Y1Axl6XnVezDoCooYOJNW9GGKsP5gxsHCj7Mtwse77Eop2d
 QEPyH9P/br4IzwzG/Zr/K56CbBde+T0JZZEsifhRcrkFQAqVN3kZvHVOly5n7n9huh32
 d7oDFZLnhRQ5d035bnS/h1eIvRD9oVzMFbA0InsTf5uj4rYyU8043KIH1imf+o9Xflf1
 VHWQ==
X-Gm-Message-State: APjAAAWeq7WJfW0IjCqOp7MR2k77cUuxPTWw+W6uRjId7TUzwyx4P1Zl
 TJx6zvc2K+z3jkKmdkMzG7NjaQ==
X-Google-Smtp-Source: APXvYqwOaZHXOluKL+d+v4jUYs4oVh5qXNZ/McfL8yfctWXtVm/fm/kOeuDO1BGacotTjrHEOxW5Vg==
X-Received: by 2002:a6b:917:: with SMTP id t23mr4775074ioi.174.1565191651605; 
 Wed, 07 Aug 2019 08:27:31 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 j25sm122664152ioj.67.2019.08.07.08.27.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 08:27:30 -0700 (PDT)
Date: Wed, 7 Aug 2019 08:27:30 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Palmer Dabbelt <palmer@sifive.com>
cc: qemu-riscv@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>, 
 Atish Patra <Atish.Patra@wdc.com>, qemu-devel@nongnu.org
In-Reply-To: <20190807145939.1281-1-palmer@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1908070804400.13971@viisi.sifive.com>
References: <20190807145939.1281-1-palmer@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-riscv] [PATCH for 4.1] RISC-V: Ignore the S and U
 extensions when formatting ISA strings
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Aug 2019 15:27:35 -0000

On Wed, 7 Aug 2019, Palmer Dabbelt wrote:

> The ISA strings we're providing from QEMU aren't actually legal RISC-V
> ISA strings, as both the S and U extensions cannot exist as
> single-letter extensions and must instead be multi-letter strings.
> We're still using the ISA strings inside QEMU to track the availiable
> extensions, so this patch just strips out the S and U extensions when
> formatting ISA strings.
> 
> This boots Linux on top of 4.1-rc3, which no longer has the U extension
> in /proc/cpuinfo.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
> This is another late one, but I'd like to target it for 4.1 as we're
> providing illegal ISA strings and I don't want to bake that into a bunch
> of other code.

I'm unfamiliar with the underlying QEMU code beyond the patch posted here, 
but I can review the intention expressed in the patch description.  The 
described intent is aligned with Section 22.6 and Table 22.1 of the RISC-V 
User-Level ISA Specification version 2.2:

  https://github.com/riscv/riscv-isa-manual/blob/master/release/riscv-spec-v2.2.pdf

And on the Linux kernel side we've also recognized that our current 
parsing code is handling "s" and "u" incorrectly and that we'll need to 
fix it:

  https://lore.kernel.org/linux-riscv/alpine.DEB.2.21.9999.1908061818360.13971@viisi.sifive.com/


- Paul

