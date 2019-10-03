Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iFxjN-0007M8-Fi
	for mharc-qemu-riscv@gnu.org; Thu, 03 Oct 2019 05:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50965)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iFxjJ-0007Gd-NN
 for qemu-riscv@nongnu.org; Thu, 03 Oct 2019 05:49:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iFxjI-0003EZ-D7
 for qemu-riscv@nongnu.org; Thu, 03 Oct 2019 05:49:01 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39818)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iFxjI-0003E3-9C
 for qemu-riscv@nongnu.org; Thu, 03 Oct 2019 05:49:00 -0400
Received: by mail-ot1-x342.google.com with SMTP id s22so1714426otr.6
 for <qemu-riscv@nongnu.org>; Thu, 03 Oct 2019 02:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PbLXrGmLvBuBVKVFojmp8JkQKW0ixtsqAXgm/w0U6KE=;
 b=BGFzASDfkEm30UZbSS6xcbqDvwPR5rHgwCXhY9WqnvLlictXopacRuQGcWIMinw/+Q
 t6FXW2Fexl5AGXCY3Bc2tnhv91Gjkg9EuyEuWD0wE3VkS2M+iQRw7euAao1NkwiFfnO9
 raxX7dDOh83Us/NP+Wnr2ei53O7LGKJ1UXRk35x2JYk3hBRJwt5NEO1PxtRDtOrsMPg7
 S/ZrVjpN1JFdUB5wjlJG9/D9JEvkWmUHUMtXaZL44c282gzGf+5Ala5JMFkVnBG0qMro
 KP5S5jyk9EG+4Ee80z7+Rnf4Kjt2CNM+aFx5yny2XaHB/49phDIlhJGHwXIjCLins5W5
 DllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PbLXrGmLvBuBVKVFojmp8JkQKW0ixtsqAXgm/w0U6KE=;
 b=cnjp4yynEEQuYyHzz5Ce84PpPhtcBKRkvhl7hr5SEjtDjtHhsaEucQx1O1nuEY2wVj
 5HqE7mfKXxMJsx5iAu1aG81Xvou8ii6cUkDnqBfm2jG6mhISXiZSXZKSH5G7r7UyGkjT
 WSosfvjCHUenfxuPh/66PFXpT5VHISFsdG8I6fe1f8ZK7k2yFxPADCsjxtyxDFDiV5ip
 M1qBrhMaRRMylKKYwAxKpeGyqPYsL/YJYIiksuNGOOqSZVIXs3BsSiPh/13HOWT4At3G
 3DbYqMe3G7tCDHd9NU3R8V6dtux2B2HYhq9HrO+F2+RL+iJthaGfwvpcsg/CpMQ4+Ebj
 kuYg==
X-Gm-Message-State: APjAAAW1NhdReDkfb1ieoOfvobS2a5pLfaxqJHXvDDnETMek9O8PwQdZ
 gHU7stsXBcVqigqLacemGuzWxeiFe1dnL0TVlgSdzw==
X-Google-Smtp-Source: APXvYqwN109iA+lFDYDVaLGjbfIVToqzF1n9wpGHQJQ9PfXvZozqvmtpv+ALqljDWELn794XJ1Lmv1DGK8Rfw2rcNUU=
X-Received: by 2002:a9d:6d0a:: with SMTP id o10mr5628321otp.221.1570096137983; 
 Thu, 03 Oct 2019 02:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <4cba4d80e570372183b6685a26c72fa3e907bb51.1570051975.git.alistair.francis@wdc.com>
 <CAEUhbmUYTn2+166CAg=uiy-sP7xkcc7mK=v66UGpiqd3tNZMVA@mail.gmail.com>
In-Reply-To: <CAEUhbmUYTn2+166CAg=uiy-sP7xkcc7mK=v66UGpiqd3tNZMVA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Oct 2019 10:48:46 +0100
Message-ID: <CAFEAcA9yvouLHnqUeZYtB7uDnbmUoj5kp+2X2nvDsaQkKNmw=g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] riscv/boot: Fix possible memory leak
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@sifive.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
X-List-Received-Date: Thu, 03 Oct 2019 09:49:03 -0000

On Thu, 3 Oct 2019 at 01:53, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Oct 3, 2019 at 5:38 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > Coverity (CID 1405786) thinks that there is a possible memory leak as
> > we don't guarentee that the memory allocatd from riscv_find_firmware()
> > is freed. This is a false positive, but let's tidy up the code to fix
> > the warning.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/boot.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> >
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>
> Thanks for the patch. I am not sure how I can easily run Coverity to
> verify the fix though.

You can't; we use the free 'coverity scan' service which just
checks QEMU git master. So we make the fixes we think will
deal with the issues, commit them to master in the usual way,
and then when the scan is rerun we can have another go if
the coverity issue hasn't gone away.

thanks
-- PMM

