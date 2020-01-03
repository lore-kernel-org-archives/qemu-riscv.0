Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1inCvJ-0002P4-6t
	for mharc-qemu-riscv@gnu.org; Thu, 02 Jan 2020 21:42:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49274)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1inCvG-0002Ha-7d
 for qemu-riscv@nongnu.org; Thu, 02 Jan 2020 21:42:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1inCvE-0004GD-W8
 for qemu-riscv@nongnu.org; Thu, 02 Jan 2020 21:42:46 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:34390)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1inCv6-0003xf-UN; Thu, 02 Jan 2020 21:42:37 -0500
Received: by mail-lj1-x242.google.com with SMTP id z22so37752328ljg.1;
 Thu, 02 Jan 2020 18:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uE7iq03z6c6M4Osq9S5c6hdyiQ+NoJTxkaCnPW5cj6U=;
 b=ceiMdCCF8ANz5LvlKA51hDTEK+H7IT4uVVy96PojnOXHMyV65AQuUYZqlu0Gi/ZC2y
 HCk6J9tIyGTRxHliYsyPh8ZVEXdTq/pPMAPNr47zo/nUl8YL5Ef9lKvOszkX6LnwPi1X
 OEyPhWnozMyyNTRMyVzcpUhIWrX2w0LG7UFjPxPdcFlKi3jPVBrTx+OHCdc2hTnlQ/s8
 ZtpYreIAO2zY5lDc2FMkRwMtpmSqNOwcOvMcl5T4wIpGwRbKN8CW/rJ1KEAXwd6ZolpD
 gY5yylh5KQBDDxgQ8A/6G984DuOCw2VMtyle9b/9yJi0BOy5SbpCNolM7aXgCvNE2Rov
 KeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uE7iq03z6c6M4Osq9S5c6hdyiQ+NoJTxkaCnPW5cj6U=;
 b=Ct81ADNW9iTwJqKyIA1AUDsOaGI5ZFwjacbYH+/C4FhCJmmXD+ttYfkhwNz2rvXSw+
 4toVZzjloGFmi5JdC0YlttsRU0WkwIODVtjfLYgBFPSqhyzbfgllgmRMHxiGshP2u8oR
 G49lIK4i6/9MI4atW+DqREwoYWYIrolRiYjqE6a521V0MnC2qXM5snjIKcFzUMry0IrR
 gLnK+fz7MV0vnZ+SBgnKuvVktiwqsIBY4Nk5YTSVa3ZvZeBzrwm+l7T2cTO2Xdq2aWam
 W3EbaMHv3h2H7ZclYMbmiRUIjBfAkhwkEzwXaouYUUIgIZv9Giz4vHhBxf0vsKL5agLk
 izbQ==
X-Gm-Message-State: APjAAAUZQdHk+ucjWn7qCJ4y7Qz65ZrANh8MURsjwWGz8eq+nVx1sA4m
 yHQSZT81akVWDaOWBwPE/vxzV0vI8EiDmrpgjF4=
X-Google-Smtp-Source: APXvYqwE0wKi4dKpd627Rjjbhzykm0Vj+gJiWG0nDWDP0FQa1tIeWdNxBqyKqdCIaEJxNEcwtUP79zGCSQW6X3PA24Y=
X-Received: by 2002:a2e:3608:: with SMTP id d8mr49686247lja.152.1578019355649; 
 Thu, 02 Jan 2020 18:42:35 -0800 (PST)
MIME-Version: 1.0
References: <20200101112303.20724-1-philmd@redhat.com>
 <20200101112303.20724-4-philmd@redhat.com>
In-Reply-To: <20200101112303.20724-4-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Jan 2020 18:42:08 -0800
Message-ID: <CAKmqyKPvVOWw1_YzhButrc+_DD2mJoAszEE7mWkqs37SGutHvg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] tcg: Move TCG headers to include/tcg/
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
X-List-Received-Date: Fri, 03 Jan 2020 02:42:47 -0000

On Wed, Jan 1, 2020 at 3:27 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  {tcg =3D> include/tcg}/tcg-gvec-desc.h | 0
>  {tcg =3D> include/tcg}/tcg-mo.h        | 0
>  {tcg =3D> include/tcg}/tcg-op-gvec.h   | 0
>  {tcg =3D> include/tcg}/tcg-op.h        | 0
>  {tcg =3D> include/tcg}/tcg-opc.h       | 0
>  {tcg =3D> include/tcg}/tcg.h           | 0
>  MAINTAINERS                          | 1 +
>  7 files changed, 1 insertion(+)
>  rename {tcg =3D> include/tcg}/tcg-gvec-desc.h (100%)
>  rename {tcg =3D> include/tcg}/tcg-mo.h (100%)
>  rename {tcg =3D> include/tcg}/tcg-op-gvec.h (100%)
>  rename {tcg =3D> include/tcg}/tcg-op.h (100%)
>  rename {tcg =3D> include/tcg}/tcg-opc.h (100%)
>  rename {tcg =3D> include/tcg}/tcg.h (100%)
>
> diff --git a/tcg/tcg-gvec-desc.h b/include/tcg/tcg-gvec-desc.h
> similarity index 100%
> rename from tcg/tcg-gvec-desc.h
> rename to include/tcg/tcg-gvec-desc.h
> diff --git a/tcg/tcg-mo.h b/include/tcg/tcg-mo.h
> similarity index 100%
> rename from tcg/tcg-mo.h
> rename to include/tcg/tcg-mo.h
> diff --git a/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
> similarity index 100%
> rename from tcg/tcg-op-gvec.h
> rename to include/tcg/tcg-op-gvec.h
> diff --git a/tcg/tcg-op.h b/include/tcg/tcg-op.h
> similarity index 100%
> rename from tcg/tcg-op.h
> rename to include/tcg/tcg-op.h
> diff --git a/tcg/tcg-opc.h b/include/tcg/tcg-opc.h
> similarity index 100%
> rename from tcg/tcg-opc.h
> rename to include/tcg/tcg-opc.h
> diff --git a/tcg/tcg.h b/include/tcg/tcg.h
> similarity index 100%
> rename from tcg/tcg.h
> rename to include/tcg/tcg.h
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 387879aebc..02e1490895 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2374,6 +2374,7 @@ Common TCG code
>  M: Richard Henderson <rth@twiddle.net>
>  S: Maintained
>  F: tcg/
> +F: include/tcg/
>
>  TCG Plugins
>  M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> --
> 2.21.0
>
>

