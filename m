Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbFW3-00016y-Gg
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 01:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mbFW1-00014K-SZ; Fri, 15 Oct 2021 01:12:21 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:40635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mbFW0-0004A9-9D; Fri, 15 Oct 2021 01:12:21 -0400
Received: by mail-io1-xd31.google.com with SMTP id x1so6399282iof.7;
 Thu, 14 Oct 2021 22:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cQA7SkhvbYj7MFjiowI+SC3+gtuN4rOGTeqcJvn9HV4=;
 b=F1U+fVrquvApS1CuJkt/Kde8VSaYiVjulUsvaKhW8QQOFE6idvnpY+cBta9/q7M/Xb
 tvHWRJaNXXZhXFfZb9ebBMYHgul5rQoMaxBHMvtNrrFpOXglDoq4nZxuFsK348ZeejF+
 HvnDNAuAAzzu4nP1EtcOB1xcT5o9xn6UerltPWa/guJQ6HOkHoeFpXcIob79VwdtjotS
 YMGqCHpXdLVjcA3UNu5/oZ5s2paXbmfiCXkKL4XGe7mv9ZxCuy1W2Jr5PmOj2va3dy37
 58OdHYdXSSD5id7/ou0tTGyWTqQK2+p+giSkfpv9TVchpAb1zXIOY3UTYnABR7gjY65B
 9XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cQA7SkhvbYj7MFjiowI+SC3+gtuN4rOGTeqcJvn9HV4=;
 b=ScPCYwq34dGQFd3uk3Xz256rrqGllfAApGUOJks68UGwRPQoafY2uJIXo8VS9xOVdf
 ElROBVInSFklEOWWwYygsxD/Ac4UiEwur5s2uj3gP5yP+8+o5Sj7ZBhTS/o4QRFl5L4B
 oIWAqT5VPbCvQENEUO1DULpOK11B0/ejcKtv6udZoTh7kD9Y7QcCeD8SsqTicJmwcSG+
 RQCqhNxy3DXohYkKqq6VRzK6BXCNKOEQHhqbhBMCYGxYpsFrAYafNYVZa8V52cA40Nrz
 zGwkf6V49Uk4V5/+j9u4b8PCKuP373iNWkNVqrprnEQMuRiPNuCqbw73P7ZtA8695noh
 3FBQ==
X-Gm-Message-State: AOAM531g6dMxO6D6o3bInjp6bEEmRm5o3lqXUP9Pk7zxpkOIGP6OwemD
 YT/rWMnRoJyw6HnoYSIhh//shmrYbN++sy9azcg=
X-Google-Smtp-Source: ABdhPJw2E+FWPOqZWDCNQXUfy1iQVd6O8uZwwMWADH+FKgfRPUY5feXHuO2LwVrdcWlM3cO2g6zXQrJ4cUfTefE16ew=
X-Received: by 2002:a05:6602:2599:: with SMTP id
 p25mr2361127ioo.90.1634274738737; 
 Thu, 14 Oct 2021 22:12:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
 <20211013205104.1031679-9-richard.henderson@linaro.org>
In-Reply-To: <20211013205104.1031679-9-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Oct 2021 15:11:52 +1000
Message-ID: <CAKmqyKP6-vejTL9ryjbBPvXEFM1C6cowSVYccFsjThOLMc=Gkg@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] target/riscv: Replace is_32bit with
 get_xl/get_xlen
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, liuzhiwei <zhiwei_liu@c-sky.com>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 05:12:22 -0000

On Thu, Oct 14, 2021 at 6:59 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In preparation for RV128, replace a simple predicate
> with a more versatile test.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 32 +++++++++++++++++---------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 7e7bb67d15..5724a62bb0 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -91,16 +91,18 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
>  }
>
>  #ifdef TARGET_RISCV32
> -# define is_32bit(ctx)  true
> +#define get_xl(ctx)    MXL_RV32
>  #elif defined(CONFIG_USER_ONLY)
> -# define is_32bit(ctx)  false
> +#define get_xl(ctx)    MXL_RV64
>  #else
> -static inline bool is_32bit(DisasContext *ctx)
> -{
> -    return ctx->xl == MXL_RV32;
> -}
> +#define get_xl(ctx)    ((ctx)->xl)
>  #endif
>
> +static inline int get_xlen(DisasContext *ctx)
> +{
> +    return 16 << get_xl(ctx);
> +}
> +
>  /* The word size for this operation. */
>  static inline int oper_len(DisasContext *ctx)
>  {
> @@ -282,7 +284,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>  static void mark_fs_dirty(DisasContext *ctx)
>  {
>      TCGv tmp;
> -    target_ulong sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
> +    target_ulong sd = get_xl(ctx) == MXL_RV32 ? MSTATUS32_SD : MSTATUS64_SD;
>
>      if (ctx->mstatus_fs != MSTATUS_FS) {
>          /* Remember the state change for the rest of the TB. */
> @@ -341,16 +343,16 @@ EX_SH(12)
>      }                              \
>  } while (0)
>
> -#define REQUIRE_32BIT(ctx) do { \
> -    if (!is_32bit(ctx)) {       \
> -        return false;           \
> -    }                           \
> +#define REQUIRE_32BIT(ctx) do {    \
> +    if (get_xl(ctx) != MXL_RV32) { \
> +        return false;              \
> +    }                              \
>  } while (0)
>
> -#define REQUIRE_64BIT(ctx) do { \
> -    if (is_32bit(ctx)) {        \
> -        return false;           \
> -    }                           \
> +#define REQUIRE_64BIT(ctx) do {    \
> +    if (get_xl(ctx) < MXL_RV64) {  \
> +        return false;              \
> +    }                              \
>  } while (0)
>
>  static int ex_rvc_register(DisasContext *ctx, int reg)
> --
> 2.25.1
>
>

