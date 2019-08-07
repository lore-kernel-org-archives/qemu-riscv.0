Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvQD3-00023c-62
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 13:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60743)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hvQD1-00023T-1m
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 13:58:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hvQCx-00031z-7N
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 13:58:44 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:32850)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hvQCu-0002jc-AA; Wed, 07 Aug 2019 13:58:41 -0400
Received: by mail-lj1-x244.google.com with SMTP id h10so14855441ljg.0;
 Wed, 07 Aug 2019 10:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5xvCWIOXJhrB4TQUop/x3IM5p8cHw04Sxhsf3AnWxCI=;
 b=VNlyLK5rSFcLCbmnOkI8ixn9Mdm/ZCmTWXcK/7XSEUMVmBR6NoP/4KwJ6lgx+tgZ+C
 PiKnxSZOcHPxy16AAGTsL94PzFV+BRJn3+3Ri8OPThvJ8kB6djskuxyswCfX8Ck++Of4
 iZqlsPbndH+M6coE37RNt7u+zgOcQG6JjLSito45W5eQq8VdW4OqVBhnanEfmUISafgE
 PHkvHyKwTAwMj4/Fa2CcoMFYYo3z5KMcgI4YzcPejag5BBIEN+52VrbVaEYnCbFxjlaV
 E2O/piqUVEHtsHDOGw8y/Jz5ud3P/97Zciwy4xRNoyuNk52ujd3W3ro8hgB5jDnvqKj2
 xgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5xvCWIOXJhrB4TQUop/x3IM5p8cHw04Sxhsf3AnWxCI=;
 b=GpFlKPk7ZGF94R96L61adYw/i0K1Wo6d4owOv+5uf5/FPiq02ptNlS5YpvAPd4STRb
 I1gQ7kWvDUeNFm7FweSNcZbVKIhKTLteSEACsJFPt90ubmSYf1yrw8M1OBg68JgJs3zo
 IuPwSUfJek8pcx1m9ZTXHIwwVJp8vql1CFQczIy21aK/Upng7r8q+VxtACvA5iHh2ELp
 WtLuRLPflVrMrhJLR1bIwBjPwOt9naFVmtwQy5QHc4rlK+25kBChkNNQvFTzxmXS13uB
 iNAmwqAlhhAeDmqlckhLxl26pYMtxaUOyazM1XEGxxE6XqlEArDV9QrSFor2Yy0B0G35
 bkKw==
X-Gm-Message-State: APjAAAW1Eh+/ZZg1SKwdsouPQDF8PHYxILCTWJ6EkVo5nDWNchfWDAV/
 L+u3KrfkeomvqEQfYv501IrV2IYAj9thNAM6Bps=
X-Google-Smtp-Source: APXvYqzQ+/7rYh4hcn+tilx0ZbBWcR5fO+qI5Ilg8Xi32T5ZcDU7qUGDT2+UYT2fS0BND9JahkJx0G816NKqau4uTPE=
X-Received: by 2002:a2e:9158:: with SMTP id q24mr5697884ljg.119.1565200714860; 
 Wed, 07 Aug 2019 10:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190807145939.1281-1-palmer@sifive.com>
In-Reply-To: <20190807145939.1281-1-palmer@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Aug 2019 10:54:52 -0700
Message-ID: <CAKmqyKMKBsHO2QCYC1qeGTQa0cUMEpke17dgkB=hgQC-Nd9upw@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Atish Patra <Atish.Patra@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
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
X-List-Received-Date: Wed, 07 Aug 2019 17:58:48 -0000

On Wed, Aug 7, 2019 at 8:00 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> The ISA strings we're providing from QEMU aren't actually legal RISC-V
> ISA strings, as both the S and U extensions cannot exist as
> single-letter extensions and must instead be multi-letter strings.
> We're still using the ISA strings inside QEMU to track the availiable

s/availiable/available/g

> extensions, so this patch just strips out the S and U extensions when
> formatting ISA strings.

Atish and I were talking about this and we concluded that S and U
aren't extensions, but should be reported in the misa CSR.

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

This should be updated to note mention 's' and 'u' as extensions, but
clarify that they are correctly include in the misa CSR.

Alistair

> +                 */
> +                break;
> +
> +            default:
> +                *p++ = qemu_tolower(riscv_exts[i]);
> +                break;
> +            }
>          }
>      }
>      *p = '\0';
> --
> 2.21.0
>
>

