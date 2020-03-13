Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCqWH-00022G-IH
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 16:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39075)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jCqWF-0001xZ-89
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 16:02:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jCqWE-0006Wz-9O
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 16:02:55 -0400
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944]:40537)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jCqWC-0006GW-9L; Fri, 13 Mar 2020 16:02:52 -0400
Received: by mail-ua1-x944.google.com with SMTP id t20so4024204uao.7;
 Fri, 13 Mar 2020 13:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EJAgTsZDjRWSNhnci3sJyFanyp6C7GxUwv+MDth0iHE=;
 b=sGAmcWUm8BbOrcmKzw4vSb1xCqcAcZjipuPT/3sBHqSO4YmYBDzfOUOPdGr5y/igRa
 MSUoC1q+vgazjAimYJLWQvIxkha9REl8zlrl2DRMZEBMn8IjFRqAMEjyGHuhA3Yf0s3l
 xIuMWgKBUyQHRhR8qDlXgeIJg2N7o6S1Pr+CP6890BwfQnX1FwB09QPR/TtHfaqzAXkS
 QHzbqniqjTsAr2MEtF2QBtH9+98Tdyao86eNZHDgYB3nEB6WZIvkYdkncu6r9vjmyxKl
 tCQrFlO3vbbJcidavgCvJ/Hvhd5361EZkQ27QVwlb+9SCeespw8qZNWH1CdbXhiaB5m0
 SVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EJAgTsZDjRWSNhnci3sJyFanyp6C7GxUwv+MDth0iHE=;
 b=qFXyhL+QH4qbN2wfEPIxse8ywr9LpNzCVVSQihMa4B57wSotLOqU830We9/qTfJFNj
 4Akq3eyeAtvqakpVweuFC0bRf6QPl+fFnM3H/cy9R7TipPFpsEXmyVWDN7GU46EjJ94F
 C7AGQU3z3wCoxXFhk12GUlOMpcazskt1RNDnBOYZmhgTUDGG7wIb4kwTbSmpZ0cBZ3GU
 By3Ndn0VPNEKYGQF2f/pUnFGPEpJsqvBEERIuiWPdSwX9TRXPY6Z32+4bC3fA7cPnyRA
 WsfOsyXLVHd/447nBPSfszJDuV6+hkyCWPD6DfZhrEljjgCk0J2Sp07GWCMELS+rzT6n
 Pfiw==
X-Gm-Message-State: ANhLgQ08ljhNQplRr21v09nRUBZdwOqfDSOqHbMxF7/l3qgXe23ak9w8
 X9osddQpYHRbXon9Oa2vfqr2mTbYIGYQ21kY45Q=
X-Google-Smtp-Source: ADFU+vvEUrg39LheZyXUmZE5o0J7DoxQN3jWp8dSUG5l0jzhuZOou4gTrZuLwnwcOHLyoQQfCG1L11oHhmri8LbjnEI=
X-Received: by 2002:ab0:143:: with SMTP id 61mr9443992uak.85.1584129771516;
 Fri, 13 Mar 2020 13:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-10-philmd@redhat.com>
In-Reply-To: <20200313183652.10258-10-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Mar 2020 13:02:25 -0700
Message-ID: <CAKmqyKMh07W06BqTC43hE3CsrkgJJHuP6K1dexqJ1XpSy2OCnQ@mail.gmail.com>
Subject: Re: [PATCH 09/14] exec: Drop redundant #ifdeffery
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x <qemu-s390x@nongnu.org>, 
 qemu-arm <qemu-arm@nongnu.org>, "open list:New World" <qemu-ppc@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::944
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
X-List-Received-Date: Fri, 13 Mar 2020 20:02:56 -0000

On Fri, Mar 13, 2020 at 11:38 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  exec.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/exec.c b/exec.c
> index 7bc9828c5b..f258502966 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -185,10 +185,6 @@ struct DirtyBitmapSnapshot {
>      unsigned long dirty[];
>  };
>
> -#endif
> -
> -#if !defined(CONFIG_USER_ONLY)
> -
>  static void phys_map_node_reserve(PhysPageMap *map, unsigned nodes)
>  {
>      static unsigned alloc_hint =3D 16;
> --
> 2.21.1
>
>

