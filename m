Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1inCvk-00034R-Pi
	for mharc-qemu-riscv@gnu.org; Thu, 02 Jan 2020 21:43:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53460)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1inCvh-0002zu-Rt
 for qemu-riscv@nongnu.org; Thu, 02 Jan 2020 21:43:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1inCvg-0005A6-UA
 for qemu-riscv@nongnu.org; Thu, 02 Jan 2020 21:43:13 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:34394)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1inCva-0004ve-Ex; Thu, 02 Jan 2020 21:43:06 -0500
Received: by mail-lj1-x242.google.com with SMTP id z22so37753000ljg.1;
 Thu, 02 Jan 2020 18:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+7cA0d0Hyi5444bKwVYHxmPS0oGCkXfU/S2Nefqv/E4=;
 b=sf2Lzd2hOuHlbhMGyxYZNV5Cvzh+3KLU8lTMbdmKHMjHNh0igsRrL4XjCAk4yRP8vf
 s/OjWrR6da7a2LVtU5DeediGnZbXeF4F/Dp76/g8PuMr8i2mtdYPg7S9M+ZZeqxXx30p
 eUi2GAw68sH8XnxlQNcJj5TJ7E1NyzlKLM6xa91OJqT7SYkm84GvPH23zQggZ2daCl0a
 rjrQ+GkiLEecFyt2uN+r94Qft6M0goUgtbv3NLqccuBOLRS4kibs2CdOTPxFJghJ69Xw
 DyrwAnU6vA74NzWNMy9eMT/YARCg2dl7x2Qryev3G/6DA+nfrE7iGijvPqyBDAPm6NKl
 XeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+7cA0d0Hyi5444bKwVYHxmPS0oGCkXfU/S2Nefqv/E4=;
 b=e3W2egTjOhGsXM1pUhCn5zHC0G8DFn+aDLT8iYgW37ho0kjebaqPIORQYh4n2H/9Qt
 UjVGzpcCqMZ0wCBhItWvSyEOlovucNKb9+Dr3XnOA0TUI3hmWjQK+tYn/WoazkgFaKv9
 4F3NWm6E71Tn88Y0x6oNwn3C3Zxj7IO7cL7Xnf0ID2znRcpRtb7PUvGYrO4BT8NzWGY+
 JEuPJmTQhGEx2F20sBSkreyvvcVB1BRg6FTnxB2WUtsCcsJEpJMmfeqP1cm6bpn8EXQt
 oGFCoDR6DailBtZq8GMlzwat4XsSs95093XKALiTyrK5FI27uQXTIgnZ9SVEvB1wZdFi
 dinA==
X-Gm-Message-State: APjAAAWIpQUv51hk5TuVNyNqdpPVJJsJNRj+xCsD6OJyXwIYNzj4k2zX
 D4dOnvPesJIVaFvjIDOr5M8xF/ptCbn8mIAJiVQ=
X-Google-Smtp-Source: APXvYqyJxH2lgoAOxeOFfTY00+cTVDLIOj+633dJyMoRWo0yvp9dCGNnnSHzqXFAwBHgUhI2yRIUMyNLZY/V6IVminE=
X-Received: by 2002:a2e:96c6:: with SMTP id d6mr20605277ljj.4.1578019385388;
 Thu, 02 Jan 2020 18:43:05 -0800 (PST)
MIME-Version: 1.0
References: <20200101112303.20724-1-philmd@redhat.com>
 <20200101112303.20724-5-philmd@redhat.com>
In-Reply-To: <20200101112303.20724-5-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Jan 2020 18:42:38 -0800
Message-ID: <CAKmqyKPGWZh1a6vQk2TF=crN2yK7ZxpAvre55wx_-cuOMLrp9w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] configure: Remove tcg/ from the preprocessor
 include search list
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Chris Wulff <crwulff@gmail.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, 
 Riku Voipio <riku.voipio@iki.fi>, qemu-s390x <qemu-s390x@nongnu.org>, 
 qemu-arm <qemu-arm@nongnu.org>, Stafford Horne <shorne@gmail.com>, 
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, 
 Claudio Fontana <claudio.fontana@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>, 
 Michael Walle <michael@walle.cc>, "open list:New World" <qemu-ppc@nongnu.org>, 
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
X-List-Received-Date: Fri, 03 Jan 2020 02:43:15 -0000

On Wed, Jan 1, 2020 at 3:25 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> All tcg includes are relative to the repository root directory,
> we can safely remove the tcg/ directory from the include search
> path list.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  configure | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/configure b/configure
> index 940bf9e87a..74dad08580 100755
> --- a/configure
> +++ b/configure
> @@ -7436,7 +7436,6 @@ elif test "$ARCH" =3D "riscv32" || test "$ARCH" =3D=
 "riscv64" ; then
>  else
>    QEMU_INCLUDES=3D"-iquote \$(SRC_PATH)/tcg/\$(ARCH) $QEMU_INCLUDES"
>  fi
> -QEMU_INCLUDES=3D"-iquote \$(SRC_PATH)/tcg $QEMU_INCLUDES"
>
>  echo "TOOLS=3D$tools" >> $config_host_mak
>  echo "ROMS=3D$roms" >> $config_host_mak
> --
> 2.21.0
>
>

