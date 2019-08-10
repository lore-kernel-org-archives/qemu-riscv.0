Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hwGjC-0005Y1-0V
	for mharc-qemu-riscv@gnu.org; Fri, 09 Aug 2019 22:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49593)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hwGiz-0005Qm-PW
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 22:03:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hwGiy-0005Mv-MP
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 22:03:17 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:33473)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hwGiu-0005Ks-3j; Fri, 09 Aug 2019 22:03:12 -0400
Received: by mail-lf1-x141.google.com with SMTP id x3so70919784lfc.0;
 Fri, 09 Aug 2019 19:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0uGOqsC09PGm0u2CPB6HrpWd0czBaYOd8WUOgplK2BE=;
 b=LeJ58aQuYAkyGGKKxW3xxNWS2CJkEdySx6+Rtw20jgAEcgKeyTHGWokf0cBpVeLaoV
 yj6TSf3TXVSBJlAMnQ4q+RPo7shhKC+tuU6GSClhM508bulsO2CoUaYHXOZpRYsOsIjT
 ZlbmEIWGjPNatT0rmpYCR5qSeN+kP4qxp0/3FSVUjNbeT/lf3Vx+OpHc7ybqlvYFue0P
 v9qvpYm3qoKvEpwkxhMitcdtWdOV+4PZY7C7E5mSVhSw/3PenZhG1fQi/jDEWhmiMBq+
 FPrhkc5WgprLqhEZr6LkhgE3VFKsWnzsBC6KgY8I83ONpQ94k3IZhg53+SPs8YLv+/JZ
 tkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0uGOqsC09PGm0u2CPB6HrpWd0czBaYOd8WUOgplK2BE=;
 b=hKs5xhnD8h14iprDiRwJ5SZMZ+6wB9kqVrKKKXk2s/H57u6XvYpZjSqZc0Br+kJUc7
 L1KRR0SL7Zt24+Slt+1JOKpdl0yPIW/wvZmbpSmPc5WpCm7IG3U65iynT/IdGZ/ndQtb
 KudRQqdnCm1s5GGqoUkge5O1pAbKcnxN88/L3baSPNqI8rJQQQt32w6QNEUOwBzhqM2o
 G2ZgBDSh64Ko/vv/N52TMfhFyaSa7wBxyG9/KP8Q0ZUGvWvffdRkLYMp4doFAlyKHsVJ
 t2ukjbF8n2mD8Suvp6wK+H/1r3P1iDt25s97pbuZsr3NoMmh4O6R/kf6uKzW2L7n6b5b
 /2VQ==
X-Gm-Message-State: APjAAAWYetZBe1fG9GT/E1drwgb8V0L4FisdQDhzn7rhJmUWtitnwPt4
 H3DMyWS4VjHXgroAKQHAREx3wa2O2vWgYLsTtYY=
X-Google-Smtp-Source: APXvYqwa9v5kpc4vT2rt1kYAXt2d3vJ9s75CAkrkJqDTFbpDMJeuaFAuE5oOktvG9wIVa74NbSXmmcEntUipEfKolDY=
X-Received: by 2002:ac2:563c:: with SMTP id b28mr14029137lff.93.1565402590686; 
 Fri, 09 Aug 2019 19:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190809154153.31763-1-richard.henderson@linaro.org>
 <20190809154153.31763-3-richard.henderson@linaro.org>
In-Reply-To: <20190809154153.31763-3-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 9 Aug 2019 19:02:44 -0700
Message-ID: <CAKmqyKNU0UV_-wEqFgQLFqAUXBxHZyiu1dBX4bPachkYKTB=Mw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm <qemu-arm@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::141
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 2/3] decodetree: Suppress
 redundant declaration warnings
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
X-List-Received-Date: Sat, 10 Aug 2019 02:03:28 -0000

On Fri, Aug 9, 2019 at 8:42 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We can tell that a decodetree input file is "secondary" when it
> uses an argument set marked "!extern".  This indicates that at
> least one of the insn translation functions will have already
> been declared by the "primary" input file, but given only the
> secondary we cannot tell which.
>
> Avoid redundant declaration warnings by suppressing them with pragmas.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  scripts/decodetree.py | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> index a2490aeb74..f02c8acca1 100755
> --- a/scripts/decodetree.py
> +++ b/scripts/decodetree.py
> @@ -33,6 +33,7 @@ arguments = {}
>  formats = {}
>  patterns = []
>  allpatterns = []
> +anyextern = False
>
>  translate_prefix = 'trans'
>  translate_scope = 'static '
> @@ -485,12 +486,14 @@ def parse_arguments(lineno, name, toks):
>      """Parse one argument set from TOKS at LINENO"""
>      global arguments
>      global re_ident
> +    global anyextern
>
>      flds = []
>      extern = False
>      for t in toks:
>          if re_fullmatch('!extern', t):
>              extern = True
> +            anyextern = True
>              continue
>          if not re_fullmatch(re_ident, t):
>              error(lineno, 'invalid argument set token "{0}"'.format(t))
> @@ -1191,6 +1194,7 @@ def main():
>      global insnmask
>      global decode_function
>      global variablewidth
> +    global anyextern
>
>      decode_scope = 'static '
>
> @@ -1251,6 +1255,19 @@ def main():
>      # A single translate function can be invoked for different patterns.
>      # Make sure that the argument sets are the same, and declare the
>      # function only once.
> +    #
> +    # If we're sharing formats, we're likely also sharing trans_* functions,
> +    # but we can't tell which ones.  Prevent issues from the compiler by
> +    # suppressing redundant declaration warnings.
> +    if anyextern:
> +        output("#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE\n",
> +               "# pragma GCC diagnostic push\n",
> +               "# pragma GCC diagnostic ignored \"-Wredundant-decls\"\n",
> +               "# ifdef __clang__\n"
> +               "#  pragma GCC diagnostic ignored \"-Wtypedef-redefinition\"\n",
> +               "# endif\n",
> +               "#endif\n\n")
> +
>      out_pats = {}
>      for i in allpatterns:
>          if i.name in out_pats:
> @@ -1262,6 +1279,11 @@ def main():
>              out_pats[i.name] = i
>      output('\n')
>
> +    if anyextern:
> +        output("#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE\n",
> +               "# pragma GCC diagnostic pop\n",
> +               "#endif\n\n")
> +
>      for n in sorted(formats.keys()):
>          f = formats[n]
>          f.output_extract()
> --
> 2.17.1
>
>

