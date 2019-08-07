Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvP0H-0002hD-Ep
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 12:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45092)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvP0E-0002gG-BK
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 12:41:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvP0D-0002nh-Ar
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 12:41:30 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33777)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvP0D-0002me-5p
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 12:41:29 -0400
Received: by mail-ot1-x344.google.com with SMTP id q20so106742144otl.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 09:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=seT5bS1XVLLNb234RRSJDRVSlZw3nYUA98fmigb9IeA=;
 b=X5aRxbpOI1CEgnp9V7XoYAyrqmlXGLr9qvqvG6zIwSxqKFngaL5UGpDW0YRSXx8/Qg
 bkC/oimF+AwUpmyIw5BfAnDpIYtGJ7y9DlhBRMwfh6ZSjXZE3AZjrme3hgHcrpDUpEnt
 pWuYmLkqjKKF8OOq3kX7DvgYhrOZub+qqyUnw4RLTqYy4nWSEzyZbMNXQkt9NXanAmlz
 kb2Oh7YnKPBEOxtxFCToY9ryvhTdutZC8XaSbyH6rTW0Z6Vr6eE0vDXjPQGTbpp7qtj1
 43yuQTIk/+6KZjWvLcUYyF2B3hTek5QVBkIjzgXTetQ81Rb4qaQsnqGlP6aZ8gHDRXxD
 ZBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=seT5bS1XVLLNb234RRSJDRVSlZw3nYUA98fmigb9IeA=;
 b=qNn6AT/w29sUjaXOCE9V+z53tX0Ukkn0XuRJqQ4oCbS2BTUZzF75aOGZJgqeKYkSPp
 piZxBFDftRkWMd0li847EF7ywfop6TDq6j1gld6tl5QrCAU3+YpExjlX9e5frRyT/prs
 RWjcI5FrhXUGThi1smRISA9+IbG9CCaTElBHOnMqrlTOJ1xf9e4aX9+L9/yQqzHkRw37
 3avpb/6QKBYOQTEvLiEZWECWs93gbjo1ekWM8V0ykIOSUtwYoPfmkxzyeqLKCMLzmgZr
 NxOwWPVA7amfJKcp3bpUt9S6j3H883AUMk2rwMiXnZBPCfvSy/3m3wQ8zpC3F2d49xo/
 UIhQ==
X-Gm-Message-State: APjAAAXBSeza5xm39RGqwk6G4ivTj8Qvgvh+ZNJB0E23NliEutmq9nyJ
 9ye1EkYHcgf4g7GMYS5gVRw5bU/C2KMLz91riOvpuA==
X-Google-Smtp-Source: APXvYqz4LKkOHxUDFoAR1p3J08VwHbg6lRm5W27B5Qoy4cqWxWr3fMx4cFyddNkEEJ6sok/ke2h1vQEE5yXzWTp61w0=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr9084343oti.91.1565196088343; 
 Wed, 07 Aug 2019 09:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190807145939.1281-1-palmer@sifive.com>
In-Reply-To: <20190807145939.1281-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 17:41:17 +0100
Message-ID: <CAFEAcA9YeuvQPnvG1+Cdb+-JbsbKaRpa0Frv5zz+Vb3q0prAeQ@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Atish Patra <Atish.Patra@wdc.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for 4.1] RISC-V: Ignore the S
 and U extensions when formatting ISA strings
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
X-List-Received-Date: Wed, 07 Aug 2019 16:41:31 -0000

On Wed, 7 Aug 2019 at 16:02, Palmer Dabbelt <palmer@sifive.com> wrote:
>
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
> ---
>  target/riscv/cpu.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f8d07bd20ad7..4df14433d789 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -501,7 +501,22 @@ char *riscv_isa_string(RISCVCPU *cpu)
>      char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
>      for (i = 0; i < sizeof(riscv_exts); i++) {
>          if (cpu->env.misa & RV(riscv_exts[i])) {
> -            *p++ = qemu_tolower(riscv_exts[i]);
> +            char lower = qemu_tolower(riscv_exts[i]);
> +            switch (lower) {
> +            case 's':
> +            case 'u':
> +                /*
> +                 * The 's' and 'u' extensions shouldn't be passed in the device
> +                 * tree, but we still use them internally to track extension
> +                 * sets.  Here we just explicitly remove them when formatting
> +                 * an ISA string.
> +                 */
> +                break;
> +
> +            default:
> +                *p++ = qemu_tolower(riscv_exts[i]);

 *p++ = lower;  ?

thanks
-- PMM

