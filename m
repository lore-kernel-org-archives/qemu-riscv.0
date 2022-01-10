Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6ny2-0000tF-At
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 01:15:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n6ny0-0000q0-28; Mon, 10 Jan 2022 01:15:40 -0500
Received: from [2607:f8b0:4864:20::135] (port=43603
 helo=mail-il1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n6nxv-00023f-RQ; Mon, 10 Jan 2022 01:15:39 -0500
Received: by mail-il1-x135.google.com with SMTP id d3so10413104ilr.10;
 Sun, 09 Jan 2022 22:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ErqoqbiPtDlJL21qWc2OKwnUyIbsulGZKI10Sq1Vupo=;
 b=UB4EZVobfKFOiMSZdgGuAFR+29ebCLg+husgqAXCp7IGH8zqK9ffWueRDuRjTxM84y
 DcdgdRNciADW7twYcmbeA4MXChwePIw+kdBJwor6OOTRbPJXgV0fsHekibC5I6iuTrOB
 yKAddvPhfykhiRdjAJUnF0d15LchRefPYw0LR6DZ77xe2+KC5HPoF7KRz2vdFclLT1xa
 BfeARkKs2JEFM3Y8I5ilQ+dARV3eQDurP1ylRCCEX9c7HSQa/xfpuXTA9/mwDfBTdFIl
 itaZEsegN0ciT1HktDpQ4EP7SVn95UUPRe03le2MajGPWdteGAl8w/cPvfjsbt27ATgM
 BmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ErqoqbiPtDlJL21qWc2OKwnUyIbsulGZKI10Sq1Vupo=;
 b=sQHsc3AEOIKEynQ6E5UCRheKBjN/xZ3wAW03P1heIOeIZkbkBvV6FHEJXnfzCyKvCF
 rKxX3AkPVMnP+s69r4VDp+jdctlrhfCcKOt1axZMT3SOEAMKCngciXhL1ja0SR1zX84O
 7GzvgZMxYqD5dgHMr3op1jbdfBD4/D7jmooc7as5sbDRXoacIIPhw8i5gWSZZpLkuRgk
 Kiss1DXQrmSYe8MSP2M+tvLv98yzjWYLIj3XWPyh8i/vQ8HqHHnZvjFXzsmfXmJPHkka
 ILizezsYZES1EcuInuz2suHh8RPmlSm9MTeS+KXMrlEBmnCRHBEfcOJ30JN8KiV4rgNf
 ck1Q==
X-Gm-Message-State: AOAM532GB2Sc7hmYhBAeqf5kzpnGMUc4dD4dm1aAI9gb5G28XH7ALfrB
 8iiczu+bILy33UrOscOWxL+yytJLdKN6DI9qfak=
X-Google-Smtp-Source: ABdhPJysdudCKBnBJORfQx/kMYfmDbN4RU3vWO/eSSoHuDjurN0Dx143Mhlk0KEQgDRV2+heRrJgKcNXmy9pCe7EN5c=
X-Received: by 2002:a92:cd4a:: with SMTP id v10mr5529870ilq.74.1641795334239; 
 Sun, 09 Jan 2022 22:15:34 -0800 (PST)
MIME-Version: 1.0
References: <20220110051606.4031241-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220110051606.4031241-1-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jan 2022 16:15:08 +1000
Message-ID: <CAKmqyKMvuE1Dp7hgydsJVPBQ9w-ATG7nxu3yqxoLipGQra9W_w@mail.gmail.com>
Subject: Re: [PATCH] hw: timer: ibex_timer: Fixup reading w/o register
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, wilfred.mallawa@wdc.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x135.google.com
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
X-List-Received-Date: Mon, 10 Jan 2022 06:15:40 -0000

On Mon, Jan 10, 2022 at 3:16 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> This change fixes a bug where a write only register is read.
> As per https://docs.opentitan.org/hw/ip/rv_timer/doc/#register-table
> the 'INTR_TEST0' register is write only.
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Thanks for the patch!

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/timer/ibex_timer.c         | 14 +++++---------
>  include/hw/timer/ibex_timer.h |  1 -
>  2 files changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
> index 66e1f8e48c..826c38b653 100644
> --- a/hw/timer/ibex_timer.c
> +++ b/hw/timer/ibex_timer.c
> @@ -130,7 +130,6 @@ static void ibex_timer_reset(DeviceState *dev)
>      s->timer_compare_upper0 = 0xFFFFFFFF;
>      s->timer_intr_enable = 0x00000000;
>      s->timer_intr_state = 0x00000000;
> -    s->timer_intr_test = 0x00000000;
>
>      ibex_timer_update_irqs(s);
>  }
> @@ -168,7 +167,8 @@ static uint64_t ibex_timer_read(void *opaque, hwaddr addr,
>          retvalue = s->timer_intr_state;
>          break;
>      case R_INTR_TEST:
> -        retvalue = s->timer_intr_test;
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "Attempted to read INTR_TEST, a write only register");
>          break;
>      default:
>          qemu_log_mask(LOG_GUEST_ERROR,
> @@ -215,10 +215,7 @@ static void ibex_timer_write(void *opaque, hwaddr addr,
>          s->timer_intr_state &= ~val;
>          break;
>      case R_INTR_TEST:
> -        s->timer_intr_test = val;
> -        if (s->timer_intr_enable &
> -            s->timer_intr_test &
> -            R_INTR_ENABLE_IE_0_MASK) {
> +        if (s->timer_intr_enable & val & R_INTR_ENABLE_IE_0_MASK) {
>              s->timer_intr_state |= R_INTR_STATE_IS_0_MASK;
>              qemu_set_irq(s->irq, true);
>          }
> @@ -247,8 +244,8 @@ static int ibex_timer_post_load(void *opaque, int version_id)
>
>  static const VMStateDescription vmstate_ibex_timer = {
>      .name = TYPE_IBEX_TIMER,
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .post_load = ibex_timer_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(timer_ctrl, IbexTimerState),
> @@ -257,7 +254,6 @@ static const VMStateDescription vmstate_ibex_timer = {
>          VMSTATE_UINT32(timer_compare_upper0, IbexTimerState),
>          VMSTATE_UINT32(timer_intr_enable, IbexTimerState),
>          VMSTATE_UINT32(timer_intr_state, IbexTimerState),
> -        VMSTATE_UINT32(timer_intr_test, IbexTimerState),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_timer.h
> index b6f69b38ee..1a0a28d5fa 100644
> --- a/include/hw/timer/ibex_timer.h
> +++ b/include/hw/timer/ibex_timer.h
> @@ -43,7 +43,6 @@ struct IbexTimerState {
>      uint32_t timer_compare_upper0;
>      uint32_t timer_intr_enable;
>      uint32_t timer_intr_state;
> -    uint32_t timer_intr_test;
>
>      uint32_t timebase_freq;
>
> --
> 2.34.1
>

