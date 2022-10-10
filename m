Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ohiq8-0000ip-6L
	for mharc-qemu-riscv@gnu.org; Sun, 09 Oct 2022 22:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ohiq6-0000h0-Jj; Sun, 09 Oct 2022 22:48:22 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:42758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ohiq3-0001IY-Ub; Sun, 09 Oct 2022 22:48:22 -0400
Received: by mail-pl1-x636.google.com with SMTP id c24so9205870pls.9;
 Sun, 09 Oct 2022 19:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gtZzpuO4s7LYdxOwGop9thgokRjfwbaszUedOsKjmfY=;
 b=fSSG/5nPfL0otAhwPByat0doETNHB7T0fuVNERP3S6ryhwJPOO0SIfmV8kpaR2MPXN
 +jrt71OOD38bnLFcHy6WTNULQl2kPyjMmHVRaXLpxDxED7YzZ0g2V5X1j4c8hKlpnBuu
 qaiyxICn3SzUwy43RZ1ChNWPvLn7/b8BLEn98iYkSpNy333zLABwNb5AkX7QcKiYmAOu
 GYHfasnEoMpvqjXYtf9eQgBXaZn/WBUvrxiVZxwUKqsPT9qGxiCa96wfAGSkkRKpDaKB
 O0g7rh2DkD1SdF1tNd/pvSPA5nCGJfu1+Z/tbcEey3D7cYqpo5nZulT9+qa5Nx5+kDTp
 y8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gtZzpuO4s7LYdxOwGop9thgokRjfwbaszUedOsKjmfY=;
 b=j2DWm4nu64X+uDK3OL/0FWHM9JJK1tuTh162SK44s8UkB29dICeTmosOEV6JzwW/yO
 zfYfJwDLt+AieH25Onj7RZJCmjpajw2RXNVZ+ANd5HdZQNofySw311RtE0LCmDi9YyRr
 Hj2PrhlRNjTsZ1kklqE3Fdc+W1fD/SnmETkoFKyPVgvJKO12J77GvP2rlOuFrhTIiidy
 DXp+k5jkGd2pZm8esOu4PPamWQoyrCCjgvQqxx30ic1aSdyqKwISPtJJDBRHqs7sPER1
 QObaHs4bk8I+LBJoJ3aq1cNv8UljsFLTxWtDKUkkHpp21B2Q9xVAnUUKPQKIH5BIVtBS
 YAXQ==
X-Gm-Message-State: ACrzQf1tnZfP7X7ocJmneLpbWuH2zs0NuVYGJhp0Ebmko7ANX0dhtkm3
 S1bEDfsu8PMEXtneR5/Bhs+doHsik/o7NcNmLTo=
X-Google-Smtp-Source: AMsMyM7TN313OMiyz/hStKdC+wRDWXP3WhLWznpQ+dtuD5Ic0MwCtYvPky7tzP4dacvLpk2dlzOUee1Zg+Fqd68Tas0=
X-Received: by 2002:a17:902:8693:b0:17a:f71:98fd with SMTP id
 g19-20020a170902869300b0017a0f7198fdmr16824002plo.25.1665370098325; Sun, 09
 Oct 2022 19:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220928050827.319293-1-wilfred.mallawa@opensource.wdc.com>
 <20220928050827.319293-3-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20220928050827.319293-3-wilfred.mallawa@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Oct 2022 12:47:52 +1000
Message-ID: <CAKmqyKOMY4xfe_WB0u7a2bYZf6dTTkfEG8TVadw-Zs=pBJadLQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] riscv/opentitan: connect lifecycle controller
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x636.google.com
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
X-List-Received-Date: Mon, 10 Oct 2022 02:48:22 -0000

On Wed, Sep 28, 2022 at 3:13 PM Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> Connects the ibex lifecycle controller with opentitan,
> with this change, we can now get past the lifecycle checks
> in the boot rom.
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/opentitan.c         | 10 ++++++++--
>  include/hw/riscv/opentitan.h |  2 ++
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index be7ff1eea0..73a5cef694 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -122,6 +122,8 @@ static void lowrisc_ibex_soc_init(Object *obj)
>
>      object_initialize_child(obj, "timer", &s->timer, TYPE_IBEX_TIMER);
>
> +    object_initialize_child(obj, "lifetime_ctrl", &s->lc, TYPE_IBEX_LC_CTRL);
> +
>      for (int i = 0; i < OPENTITAN_NUM_SPI_HOSTS; i++) {
>          object_initialize_child(obj, "spi_host[*]", &s->spi_host[i],
>                                  TYPE_IBEX_SPI_HOST);
> @@ -243,6 +245,12 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>          }
>      }
>
> +    /* Life-Cycle Control */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->lc), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->lc), 0, memmap[IBEX_DEV_LC_CTRL].base);
> +
>      create_unimplemented_device("riscv.lowrisc.ibex.gpio",
>          memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.spi_device",
> @@ -255,8 +263,6 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>          memmap[IBEX_DEV_SENSOR_CTRL].base, memmap[IBEX_DEV_SENSOR_CTRL].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.otp_ctrl",
>          memmap[IBEX_DEV_OTP_CTRL].base, memmap[IBEX_DEV_OTP_CTRL].size);
> -    create_unimplemented_device("riscv.lowrisc.ibex.lc_ctrl",
> -        memmap[IBEX_DEV_LC_CTRL].base, memmap[IBEX_DEV_LC_CTRL].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.pwrmgr",
>          memmap[IBEX_DEV_PWRMGR].base, memmap[IBEX_DEV_PWRMGR].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.rstmgr",
> diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> index 6665cd5794..64b7f21339 100644
> --- a/include/hw/riscv/opentitan.h
> +++ b/include/hw/riscv/opentitan.h
> @@ -24,6 +24,7 @@
>  #include "hw/char/ibex_uart.h"
>  #include "hw/timer/ibex_timer.h"
>  #include "hw/ssi/ibex_spi_host.h"
> +#include "hw/misc/ibex_lc_ctrl.h"
>  #include "qom/object.h"
>
>  #define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
> @@ -44,6 +45,7 @@ struct LowRISCIbexSoCState {
>      SiFivePLICState plic;
>      IbexUartState uart;
>      IbexTimerState timer;
> +    IbexLCState lc;
>      IbexSPIHostState spi_host[OPENTITAN_NUM_SPI_HOSTS];
>
>      uint32_t resetvec;
> --
> 2.37.3
>
>

