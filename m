Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6nzU-0002JS-J3
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 01:17:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n6nzT-0002GS-2R; Mon, 10 Jan 2022 01:17:11 -0500
Received: from [2607:f8b0:4864:20::d36] (port=39589
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n6nzR-00028Y-I1; Mon, 10 Jan 2022 01:17:10 -0500
Received: by mail-io1-xd36.google.com with SMTP id y11so16120944iod.6;
 Sun, 09 Jan 2022 22:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bHt5Ou1JCPsbKtdj3+iMCLb0ug9H+0JvvRybux60U9w=;
 b=a+Q4TSAeF5k2euVyzSFVKm30KNQOMGhTetyu3pNkg9ogbetc4f+dIa28u7aqlTxBZK
 SginE4AD1nM35CaT5FAxhnvwVn5ecq2XM9gQ4OQXrfS96XYjf/qZQ08o/DTDfoeYrnzD
 ayrr0VqVgDjenkadNVtyCoSje4EnFmVrK39YWHj2KsUBqbopG+0dte3xk2Lg5r+BcmmP
 DZPoc9gRKhNkRutWdl8EaIXsGdwU0+EUHa/3fSFgyWEcjYFSiiezWHxLsjFYSDZolDKR
 mCiehE77iwq+w6OLQ6df+LTSjP4Tt/36pP55lUtFKe6aaNegSl91lAL6cMp1EUk3gkyv
 pCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bHt5Ou1JCPsbKtdj3+iMCLb0ug9H+0JvvRybux60U9w=;
 b=WT/TYU1rbFVmHUBzgZ7uyvbWuzNBPPjwXHQX3RlmDi88kfbidUs31OxgwKUYgLG8/O
 UkWehsDjoFVahIOXfWmUWcaLBQleYAzkK/I6wBdHnxesJXPb3MjjCJu9nx/9D3tuLsi2
 0vQVHtAwumFmki1IoBOoU7q51I1gFn5kwHT7einZTHV2LWaRxxvWDd0AY+tdwAQ5SUlZ
 ziMsO7HDuwJncN/CIrNHfAoDkx87CHwRpY3BS1CmrXyHnPzDTuyzzwC7TpQmE2FsKq20
 7rZlKN3/N5K1XfTA2a21KdTDKk0kiyXzKwq/W1TxrMCrbZRYHUO50j8EaE4zeh2PuqiC
 l3cQ==
X-Gm-Message-State: AOAM532GfM9HBe2IpoFGgqZsmlRWAai3aFlmUZJbpMOSCob3DD2C9Fq7
 Slsvcqxm6Bco8mAPmajriN8nMQIrIctyBYhV38M=
X-Google-Smtp-Source: ABdhPJy/UltdbtMcB9Hgp3vHyZX1pTwpsPViqeKFZFMG8BMNaGkRoFviVs5w2PkVJh+oMiq17wlR/CU/bqwP8qyua6U=
X-Received: by 2002:a5e:9905:: with SMTP id t5mr32123936ioj.16.1641795428080; 
 Sun, 09 Jan 2022 22:17:08 -0800 (PST)
MIME-Version: 1.0
References: <20220110061321.4040589-1-alistair.francis@opensource.wdc.com>
 <20220110061321.4040589-2-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220110061321.4040589-2-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jan 2022 16:16:41 +1000
Message-ID: <CAKmqyKM3mEvEuj7p8f+rnv7rG6FmLAuxH6xxAKBX9gwsKTPjQQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw: timer: ibex_timer: update/add reg address
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, wilfred.mallawa@wdc.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 10 Jan 2022 06:17:11 -0000

On Mon, Jan 10, 2022 at 4:13 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> The following changes:
> 1. Fixes the incorrectly set CTRL register address. As
> per [1] https://docs.opentitan.org/hw/ip/rv_timer/doc/#register-table
>
> The CTRL register is @ 0x04.
>
> This was found when attempting to fixup a bug where a timer_interrupt
> was not serviced on TockOS-OpenTitan.
>
> 2. Adds ALERT_TEST register as documented on [1], adding repective
>    switch cases to error handle and later implement functionality.
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/timer/ibex_timer.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
> index 66e1f8e48c..096588ac8a 100644
> --- a/hw/timer/ibex_timer.c
> +++ b/hw/timer/ibex_timer.c
> @@ -34,7 +34,9 @@
>  #include "target/riscv/cpu.h"
>  #include "migration/vmstate.h"
>
> -REG32(CTRL, 0x00)
> +REG32(ALERT_TEST, 0x00)
> +    FIELD(ALERT_TEST, FATAL_FAULT, 0, 1)
> +REG32(CTRL, 0x04)
>      FIELD(CTRL, ACTIVE, 0, 1)
>  REG32(CFG0, 0x100)
>      FIELD(CFG0, PRESCALE, 0, 12)
> @@ -143,6 +145,10 @@ static uint64_t ibex_timer_read(void *opaque, hwaddr addr,
>      uint64_t retvalue = 0;
>
>      switch (addr >> 2) {
> +    case R_ALERT_TEST:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                        "Attempted to read ALERT_TEST, a write only register");
> +        break;
>      case R_CTRL:
>          retvalue = s->timer_ctrl;
>          break;
> @@ -186,6 +192,9 @@ static void ibex_timer_write(void *opaque, hwaddr addr,
>      uint32_t val = val64;
>
>      switch (addr >> 2) {
> +    case R_ALERT_TEST:
> +        qemu_log_mask(LOG_UNIMP, "Alert triggering not supported");
> +        break;
>      case R_CTRL:
>          s->timer_ctrl = val;
>          break;
> --
> 2.34.1
>

