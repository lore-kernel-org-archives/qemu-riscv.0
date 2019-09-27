Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDl7s-0006XU-Td
	for mharc-qemu-riscv@gnu.org; Fri, 27 Sep 2019 03:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40360)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1iDl7p-0006Ss-Dl
 for qemu-riscv@nongnu.org; Fri, 27 Sep 2019 03:57:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1iDl7o-00012e-CX
 for qemu-riscv@nongnu.org; Fri, 27 Sep 2019 03:57:13 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:44136)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1iDl7m-0000xe-Dc; Fri, 27 Sep 2019 03:57:10 -0400
Received: by mail-yb1-xb42.google.com with SMTP id f1so1593240ybq.11;
 Fri, 27 Sep 2019 00:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v8Kmjb7JEJdUO93lT88oGf9S3/5JV3dA3AhwEfBdZNk=;
 b=qGVo78QtOHD7LEEtwNqBE/u16n+MKXMngnSPaPbvBsKJJ0piuX0lCT+I5coaWVuIMJ
 lKGPZmA691P3Rmc+4IpdDChJifxF+yTRHJdEdU75Xn7tYjsPyw+iJ6hGWgKnlnRbgYqj
 kBReeyhSPOLVplmW+n4/3dz1nL3uEw1FIl9FcwhlzYeqm5vryuJ0nPSbnhJfsslc4jch
 WUeE929x8+5psR+sGY+Ck/6ETtXsOjKNf6w4m+sAipqg7/TVmXlxBjX/uSCXGdn8yKNk
 Yg1kCZeat8aSPs4N7bd4rhcqf0hmw1mln5oh5c020ZUyInbRh8cNrqCtcOElkaO5Xbfc
 4M8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v8Kmjb7JEJdUO93lT88oGf9S3/5JV3dA3AhwEfBdZNk=;
 b=KNEJmU+2TIY+6Uby9oaegkgbPy8nvVDt/4BW2sRbAbqhmxZS/bm4BorAEYTUi9jp7I
 McGW0pZFCUjOe2iqW76fsTO5XISIUl4ZhUv/VzKHbR4OUPBzCKep1zye2sKhZgGJEZ2c
 3TZKd5pwCpQguEBCrY7JEOVbbJ7Z3qazE85igxZT8kYG9FLSxBYfM0G40cOXyeUsz/iK
 E7hiMTBSWIjvJyq8fTIWIJ8prtW/9lbn3toZx+LiVv4N7TkVVynXY0B3/X9+hwTlNJAc
 Z/BxK3cghlnOHHG+tmYDjfATL5oHjTKWKu3Eu2tnSTUl1qnoOQKX2ezWfwBLdHL81o3y
 rC0A==
X-Gm-Message-State: APjAAAUl4/c5V5KEO09fGuMzKCzkxDEjJfEOu7oOcd6U2BtZL1fpPrQe
 KhoXdPruGTJnMLyelbF+iOU4MrAoOUHvuwdIUdc=
X-Google-Smtp-Source: APXvYqwsPiY3BK7Ii/VfqdXB5lTMhXdf0W0vS5QlU4chdDDBzuC2jZqgZAHegcJT1bRGZ2U2wEAvr7lcIyNv7xqCjpQ=
X-Received: by 2002:a25:ae09:: with SMTP id a9mr5155104ybj.11.1569571029956;
 Fri, 27 Sep 2019 00:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569545046.git.alistair.francis@wdc.com>
 <7406836747a1a0e9f91c6d79f9fe40ca17995c8a.1569545046.git.alistair.francis@wdc.com>
In-Reply-To: <7406836747a1a0e9f91c6d79f9fe40ca17995c8a.1569545046.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 27 Sep 2019 15:56:58 +0800
Message-ID: <CAEUhbmUx_fF1eNAN5WcVr=Hbmbtn9vCj=AVpYVVDtZDz+uEshg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] riscv/sifive_u: Manually define the machine
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b42
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
X-List-Received-Date: Fri, 27 Sep 2019 07:57:15 -0000

On Fri, Sep 27, 2019 at 8:48 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Instead of using the DEFINE_MACHINE() macro to define the machine let's
> do it manually. This allows us to specify machine properties.
>
> This patch is no functional change.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/sifive_u.c         | 44 ++++++++++++++++++++++++++-----------
>  include/hw/riscv/sifive_u.h |  7 +++++-
>  2 files changed, 37 insertions(+), 14 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

