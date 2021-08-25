Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIm6y-0000vA-2p
	for mharc-qemu-riscv@gnu.org; Wed, 25 Aug 2021 02:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mIm6s-0000nZ-3X; Wed, 25 Aug 2021 02:10:02 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:33702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mIm6q-00064k-Fk; Wed, 25 Aug 2021 02:10:01 -0400
Received: by mail-il1-x12b.google.com with SMTP id z2so22902056iln.0;
 Tue, 24 Aug 2021 23:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wwC3nlperZa07CHWCb5BlABxPSTEy+Ei+kAM18BvNkU=;
 b=HDDB8nFoS4OImMgkFWFhZsYGA33BheYtR2LtBCEMcj6UyWqBdbNf1UvXPgR4Pw9tIz
 3tRZEvk0ESIpaKKVuFDuyEHLRF57qm0TfmhO7YZKX1bodu/AumFQQ+C+3uRoPxwjnZL9
 uIjvi5YBt8by7UgIXcwrFR66Fbj9rArC8TFHdJJ3A9yLM0/vj8rKuGg6N5na/byrqEHO
 pNSokV4qeitimO2FmmvYIvA9T+XMYXL92pAEAEGzNIZ1Fiu9DM7zexidQNb11nG2WPyQ
 F4kBjpyrsPQ1vMKaM4fPoin/OCrstUwn0OTFUVRdS4E+k33Q10iIL88RujSgP2rQSkdL
 w1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wwC3nlperZa07CHWCb5BlABxPSTEy+Ei+kAM18BvNkU=;
 b=aQKHakle5qabo2VZhE2Jmf0uE1rmZsnOQNyZI7imGj1YwGECAW3mEf99vXtRa6N2iz
 sGIG+Q/51d7jaY7Pllt1FZ96eRO/V/crgzG22E8r+1hAbqBl9F+Rf1+i2mHZ9FjH5daI
 GYZm5tYbqhzf/2qh9MRl0WjV3wmrtJ/jxXcmsHTE7zb9Jv6KXQWQ3xeWrR1SjKdiRmSR
 n3/FpiBeyJQl6oYfNNSDXyXhvJjradBzgyhoJrjFhaoksxN4GGbfq1V3GCLZrayc+2HZ
 ygm1+UXzRRfEMK2afcR4tjJsAL9FOqHziNO5paHEKJk54oR6KTt5gpDH/kR2M+zjNXE6
 UeoA==
X-Gm-Message-State: AOAM5318MitdjEDTEonZQLHEIGEUqXZU+RN8a6b4B4Iv5nw1ftZI1ux9
 b8DkYXV/9DORQwYBfUuua0MiWEf++4cGkmps7qY=
X-Google-Smtp-Source: ABdhPJyiYE5nFcNdY46e3lEI8FOJTrBXyXl1WbWae4aIcz2s900t6vN5boAdlHreCW4GrnwCd3jelM+yw9/TdRdbJf8=
X-Received: by 2002:a92:8707:: with SMTP id m7mr29785162ild.177.1629871799261; 
 Tue, 24 Aug 2021 23:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210823195529.560295-1-richard.henderson@linaro.org>
 <20210823195529.560295-18-richard.henderson@linaro.org>
In-Reply-To: <20210823195529.560295-18-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 25 Aug 2021 16:09:33 +1000
Message-ID: <CAKmqyKPtYThDqY5muhFRrgTn571wfsbjui5_j2DRqdvfaj8nMw@mail.gmail.com>
Subject: Re: [PATCH v5 17/24] target/riscv: Fix hgeie, hgeip
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 25 Aug 2021 06:10:02 -0000

On Tue, Aug 24, 2021 at 6:08 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We failed to write into *val for these read functions;
> replace them with read_zero.  Only warn about unsupported
> non-zero value when writing a non-zero value.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 26 ++++++++------------------
>  1 file changed, 8 insertions(+), 18 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d900f96dc1..905860dbb2 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1124,17 +1124,12 @@ static RISCVException write_hcounteren(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> -static RISCVException read_hgeie(CPURISCVState *env, int csrno,
> -                                 target_ulong *val)
> -{
> -    qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
> -    return RISCV_EXCP_NONE;
> -}
> -
>  static RISCVException write_hgeie(CPURISCVState *env, int csrno,
>                                    target_ulong val)
>  {
> -    qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
> +    if (val) {
> +        qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
> +    }
>      return RISCV_EXCP_NONE;
>  }
>
> @@ -1165,17 +1160,12 @@ static RISCVException write_htinst(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> -static RISCVException read_hgeip(CPURISCVState *env, int csrno,
> -                                 target_ulong *val)
> -{
> -    qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
> -    return RISCV_EXCP_NONE;
> -}
> -
>  static RISCVException write_hgeip(CPURISCVState *env, int csrno,
>                                    target_ulong val)
>  {
> -    qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
> +    if (val) {
> +        qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
> +    }
>      return RISCV_EXCP_NONE;
>  }
>
> @@ -1599,10 +1589,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL,     rmw_hip           },
>      [CSR_HIE]         = { "hie",         hmode,   read_hie,         write_hie         },
>      [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren,  write_hcounteren  },
> -    [CSR_HGEIE]       = { "hgeie",       hmode,   read_hgeie,       write_hgeie       },
> +    [CSR_HGEIE]       = { "hgeie",       hmode,   read_zero,        write_hgeie       },
>      [CSR_HTVAL]       = { "htval",       hmode,   read_htval,       write_htval       },
>      [CSR_HTINST]      = { "htinst",      hmode,   read_htinst,      write_htinst      },
> -    [CSR_HGEIP]       = { "hgeip",       hmode,   read_hgeip,       write_hgeip       },
> +    [CSR_HGEIP]       = { "hgeip",       hmode,   read_zero,        write_hgeip       },
>      [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,       write_hgatp       },
>      [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta,  write_htimedelta  },
>      [CSR_HTIMEDELTAH] = { "htimedeltah", hmode32, read_htimedeltah, write_htimedeltah },
> --
> 2.25.1
>
>

