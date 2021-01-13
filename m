Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzjXx-0000YI-9Y
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 12:03:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzjXm-0000VY-C9; Wed, 13 Jan 2021 12:02:54 -0500
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:39523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzjXi-00061W-Q1; Wed, 13 Jan 2021 12:02:50 -0500
Received: by mail-io1-xd33.google.com with SMTP id d9so5536682iob.6;
 Wed, 13 Jan 2021 09:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zhqRnRBHdnJT/ioGl6dB8lCnvOBEqbJx+pAo+LDWLr4=;
 b=gC/VtMrLpF5yFeWhmEVjRiRgCoA5PmXda/XoLEhfo7ox5+d5EgIVjuL3PskQxY40vY
 0cmg9Yuf9pHQJXkJZagxLCtLUhYBeHt38ebtWj5+KMOyXYVSPiD8xe/L/2RGeR5Rw9TD
 EDOqGx6eR7ZYtMkzBkNa0izB/8pvrpz+b0foBL9gkcAmb8M+JTQxLg/K7CX9FMok0/vB
 LIgVJPNA6LW43xNWk0wyUlvKSWc1OQnsWsTlhK4hqnEZV61mGNWTBSN0m0MWafBGj0Cj
 WGmF33raV6m+8JGD/qVm1Uk4ycb6LjHGtA/7Bvi8aIWvaHRNWoW7lPyp+R7MK934KxpK
 S+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zhqRnRBHdnJT/ioGl6dB8lCnvOBEqbJx+pAo+LDWLr4=;
 b=qeEcY/KfgKHZB5DSnhvG3R/4yFiKBTeWl+u9sTA9SwzAEuK8Ou0pfP2Hu/EGpSh4OI
 yIqU/OARCW9z3ctQvKg0L96ZMl+mynWbb7i3v74pIljikHJDzl0lgPpKVd83gp5gdYx2
 esSNNAc9fJAATX2f6L9E31eevvFRWMyOr2Gchey20W3kBz7ex16BoIL+VP88/m8PHjnC
 Nwbv3dcvIy3q6VM++1q3aFkOk071Cvod29SMHuOm+9Ncymney/4KFef3IuCmWtx2zb9K
 /Z4tpq1n2bOJ0BYygRfJnUFhPgoj/lNi2lFIyx/WiMib72ZB/ocXE2Gd+7zulf8ruOQJ
 hYNA==
X-Gm-Message-State: AOAM5302bN0LJxWd83LpKXposkH0x/bSKXJm9JKdkcz9zKmj1bT8QuAz
 nfRGpwQV+e2r8B02BFOWMtIHqgq1pzYPZ3/tfHw=
X-Google-Smtp-Source: ABdhPJyRwogWRh9829rq7ntDp+qqXaRrlP3wzgeOG6iu0vqAC+C0VLROe32M2Xxwxa2jepzTjZKj7mbI8kJ087WyZ4c=
X-Received: by 2002:a05:6638:11d0:: with SMTP id
 g16mr3286250jas.26.1610557363882; 
 Wed, 13 Jan 2021 09:02:43 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-11-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-11-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Jan 2021 09:02:17 -0800
Message-ID: <CAKmqyKNx7V6i1St2BdPvwjMn1uf4vL61Z3zSZBtVaBLSvE7MuA@mail.gmail.com>
Subject: Re: [PATCH 10/22] hw/sd: sd: Remove duplicated codes in
 single/multiple block read/write
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Wed, 13 Jan 2021 17:02:56 -0000

On Thu, Dec 31, 2020 at 3:42 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> The single block read (CMD17) codes are the same as the multiple
> block read (CMD18). Merge them into one. The same applies to single
> block write (CMD24) and multiple block write (CMD25).
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/sd/sd.c | 47 -----------------------------------------------
>  1 file changed, 47 deletions(-)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 52c7217fe1..1ada616e1e 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1180,24 +1180,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>          break;
>
>      case 17:   /* CMD17:  READ_SINGLE_BLOCK */
> -        switch (sd->state) {
> -        case sd_transfer_state:
> -
> -            if (addr + sd->blk_len > sd->size) {
> -                sd->card_status |= ADDRESS_ERROR;
> -                return sd_r1;
> -            }
> -
> -            sd->state = sd_sendingdata_state;
> -            sd->data_start = addr;
> -            sd->data_offset = 0;
> -            return sd_r1;
> -
> -        default:
> -            break;
> -        }
> -        break;
> -
>      case 18:   /* CMD18:  READ_MULTIPLE_BLOCK */
>          switch (sd->state) {
>          case sd_transfer_state:
> @@ -1244,35 +1226,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>
>      /* Block write commands (Class 4) */
>      case 24:   /* CMD24:  WRITE_SINGLE_BLOCK */
> -        switch (sd->state) {
> -        case sd_transfer_state:
> -            /* Writing in SPI mode not implemented.  */
> -            if (sd->spi)
> -                break;
> -
> -            if (addr + sd->blk_len > sd->size) {
> -                sd->card_status |= ADDRESS_ERROR;
> -                return sd_r1;
> -            }
> -
> -            sd->state = sd_receivingdata_state;
> -            sd->data_start = addr;
> -            sd->data_offset = 0;
> -            sd->blk_written = 0;
> -
> -            if (sd_wp_addr(sd, sd->data_start)) {
> -                sd->card_status |= WP_VIOLATION;
> -            }
> -            if (sd->csd[14] & 0x30) {
> -                sd->card_status |= WP_VIOLATION;
> -            }
> -            return sd_r1;
> -
> -        default:
> -            break;
> -        }
> -        break;
> -
>      case 25:   /* CMD25:  WRITE_MULTIPLE_BLOCK */
>          switch (sd->state) {
>          case sd_transfer_state:
> --
> 2.25.1
>
>

