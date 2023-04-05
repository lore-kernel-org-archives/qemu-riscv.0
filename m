Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjwqV-0002Qs-Ma
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 02:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjwqM-0002N7-1F; Wed, 05 Apr 2023 02:42:07 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjwqJ-0001pU-1w; Wed, 05 Apr 2023 02:42:04 -0400
Received: by mail-ua1-x933.google.com with SMTP id m5so24852502uae.11;
 Tue, 04 Apr 2023 23:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680676921;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dirIKSeW79GHTOKPMStUrGG3uPwbe7y7iku8QEiIkIw=;
 b=Jw0VbCQRCz3zoX57yZ1taDLvRw8hGoY1xgsfgaIIGSsW8BR1bWxrxKJ0NRl38amipy
 4/Dx28UinO6dkm33foVehzsIZStbBHCqaOxK+2Sb7OR36HN98lEU56Zaq3v43/8jYIGX
 Oz84pEtSl8KcXflo5EPmWLhKDkNfvZDT6hTfdHvZn7NISqHqy3X4ZVdIltherGk90r0T
 zotYRYxAKQkWnCzHSWOkiiQbctJ+XJHFL0UgFrh4V3/vy76QsTFnylHKo7NKMb5zkDEZ
 ++d7RCmnnJYahfN2EPvUoIUGoWYiiLL2gN0JI5rpI9C3SpHLwHUETAxiNoM3xKS4pZwU
 Khbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680676921;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dirIKSeW79GHTOKPMStUrGG3uPwbe7y7iku8QEiIkIw=;
 b=OGR2F1O9nbxRANDZAFgY42j5FylMGyPLRjaY1Lbs5Aj4W8OMoaUHyl/cYBuLD0bp5S
 m8bUclpthYixaMN87eQhtYp3+ZGeZfHsKJ9d0ERHvtafhZ+kjn6Dk4faSf6xIAj2RK0y
 bUpjj3uyCB7yxAlOWgcrOCroD9Lbo68InykRU6sNLrV2zdKw0obxgVsIMo0YnBDXS6vt
 GJ1nMyN+DR/9RcjYGAiJVcb8ZVorO49q6SQ0OzZvhexxnAEujDrXgTwFHWQeIIQ9kj7u
 5V7Aq7NVwGYcwB5Fc1Xus2ZSeXOCA6rzmsc/lWOpVTftwf4Bqe5hnEmQzhglQkeSVaP/
 MbIA==
X-Gm-Message-State: AAQBX9eCYMtdvAq+1G2CDvfDVsbrOmRpgSYDy4vpFh/dcbtaVBFUjpGH
 FgG7LuK5JS0Rpaf8g9GEfx1k4S4AzmKHQxJ4GJceczedPE8=
X-Google-Smtp-Source: AKy350YYpVEaVLEbeeTBZ1Eiyj77NYECq3aNXG2vuVSmVa7/PgvYhg/2bFpA2qWVOavfSa98zET6HwndJun7yMBNGwE=
X-Received: by 2002:ab0:5485:0:b0:765:c225:c914 with SMTP id
 p5-20020ab05485000000b00765c225c914mr3236617uaa.1.1680676921348; Tue, 04 Apr
 2023 23:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230328165406.271528-1-irina.ryapolova@syntacore.com>
In-Reply-To: <20230328165406.271528-1-irina.ryapolova@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 16:41:35 +1000
Message-ID: <CAKmqyKMrP-OZxueQBxATbEHTbD8Kt6Yi5+9v6+xuBNC6V6fE8g@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix Guest Physical Address Translation
To: Irina Ryapolova <irina.ryapolova@syntacore.com>
Cc: qemu-devel@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x933.google.com
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Apr 2023 06:42:11 -0000

On Wed, Mar 29, 2023 at 3:53=E2=80=AFAM Irina Ryapolova
<irina.ryapolova@syntacore.com> wrote:
>
> According to specification:
> For Sv39x4, address bits of the guest physical address 63:41 must all be =
zeros, or else a
> guest-page-fault exception occurs.
>
> Likewise for Sv48x4 and Sv57x4.
> For Sv48x4 address bits 63:50 must all be zeros, or else a guest-page-fau=
lt exception occurs.
> For Sv57x4 address bits 63:59 must all be zeros, or else a guest-page-fau=
lt exception occurs.

I don't follow

The current code enforces that the bits are 0 with this check:

    if (masked_msbs !=3D 0 && masked_msbs !=3D mask) {
        return TRANSLATE_FAIL;
    }

It seems like you are removing the mask from calculating masked_msbs,
but the commit message doesn't really mention that.

Do you mind sending a v2 with a commit message that describes what the
problem is and how your commit is fixing it?

Alistair

>
> Signed-off-by: Irina Ryapolova <irina.ryapolova@syntacore.com>
> ---
>  target/riscv/cpu_helper.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..27289f2305 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -863,17 +863,24 @@ static int get_physical_address(CPURISCVState *env,=
 hwaddr *physical,
>
>      CPUState *cs =3D env_cpu(env);
>      int va_bits =3D PGSHIFT + levels * ptidxbits + widened;
> -    target_ulong mask, masked_msbs;
>
> -    if (TARGET_LONG_BITS > (va_bits - 1)) {
> -        mask =3D (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
> -    } else {
> -        mask =3D 0;
> -    }
> -    masked_msbs =3D (addr >> (va_bits - 1)) & mask;
> +    if (first_stage =3D=3D true) {
> +        target_ulong mask, masked_msbs;
> +
> +        if (TARGET_LONG_BITS > (va_bits - 1)) {
> +            mask =3D (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
> +        } else {
> +            mask =3D 0;
> +        }
> +        masked_msbs =3D (addr >> (va_bits - 1)) & mask;
>
> -    if (masked_msbs !=3D 0 && masked_msbs !=3D mask) {
> -        return TRANSLATE_FAIL;
> +        if (masked_msbs !=3D 0 && masked_msbs !=3D mask) {
> +            return TRANSLATE_FAIL;
> +        }
> +    } else {
> +        if (vm !=3D VM_1_10_SV32 && addr >> va_bits !=3D 0) {
> +            return TRANSLATE_FAIL;
> +        }
>      }
>
>      int ptshift =3D (levels - 1) * ptidxbits;
> --
> 2.25.1
>
>

