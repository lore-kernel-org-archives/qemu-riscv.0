Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l9y38-0002Mk-Al
	for mharc-qemu-riscv@gnu.org; Wed, 10 Feb 2021 17:33:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l9y36-0002KK-Ib; Wed, 10 Feb 2021 17:33:28 -0500
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:33868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l9y34-0003ON-V6; Wed, 10 Feb 2021 17:33:28 -0500
Received: by mail-io1-xd2c.google.com with SMTP id e24so3714362ioc.1;
 Wed, 10 Feb 2021 14:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/3TlgQYKcFf6QvT8ew3Z8ZTUjTo2SDpwfyTsLg5G3zU=;
 b=S4qbn5gKmghhZdDhrggVYbaZPCLYVSP1wJ8hT3b+gyWhLR2B5Wpp/4eaX+v9iaCtNY
 lZMiTVIp3QUWEh4FdYWXWg8bP8BM11aUGv+otgXwIwuS/jK/5rIV08ABfr0EnoAv/KQ+
 cw11o1V/K9hw+821gYpgZTZTefd5V0kb9GSSvThkjYD+JkXMgp47JXMU89t6LpQnw/OM
 OlpceSqOkBv7kmYvxht9PHWpt7hxhmowGANMaNZZcowkn6MLD/iC9QYp81LeAE/HA2Ur
 CLYdwnQXINFVfzBLNO56Ljyi1Z/v30ikczy5XnHsJoOuQL7d2RaJ/B0A67Ij2q6rgF84
 rNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/3TlgQYKcFf6QvT8ew3Z8ZTUjTo2SDpwfyTsLg5G3zU=;
 b=cV/TJyG4sAil28ps253ifU6Yk/amTsKpUjiOJIFPyiOByj5FTBBR0/xMrX67IrFl21
 n63jDJv4Lcu+OQmoVcK/O19xgNCAqJXddeKE3GPxaWgi+QtQYA+acd2I8otHNH94U3Tx
 PqxxmqzCJfBypt/RYl1Rud+P6QWbetDcqIDHBHn+3gZywP+FSad8eLESzVMGrS2KBSoV
 LLxWcECIXlanB7SOTB3QHje/suuS6RevfD0tc+pFtJjyUdmRFEj/O7yMj/2mPUINGfFR
 gKIX/c95z7PpMlncVJw+uZtVFdkX7MSY9VhNvYELa+SJT9F8ZNnBVArrtHkXVkpt/iWU
 Sg6g==
X-Gm-Message-State: AOAM533UDLp0NJPErOcRC8eolneNcwnjcFHHRTooH4OxDdTZJurXil5j
 nPTUrWpK85jTIzRoHaoVeyCGkvTgfOpXB2FlF94=
X-Google-Smtp-Source: ABdhPJx8HA75kmIobENEx1rhTeTfcHolY90X9EYapRpgS23NYZ90iwVYxU1R/w29vGQ+sVTWQsNm5cRJJlFWY5U5YM4=
X-Received: by 2002:a05:6638:3c8:: with SMTP id
 r8mr5656716jaq.135.1612996405466; 
 Wed, 10 Feb 2021 14:33:25 -0800 (PST)
MIME-Version: 1.0
References: <6bc077e5ae4a9512c8adf81ae194718f2f17c402.1612836645.git.alistair.francis@wdc.com>
In-Reply-To: <6bc077e5ae4a9512c8adf81ae194718f2f17c402.1612836645.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 10 Feb 2021 14:32:50 -0800
Message-ID: <CAKmqyKN1_WTzaoYoAHgxy4RALdLPeA6ZMcbO5PkBy_u5O-mLBg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] MAINTAINERS: Add a SiFIve machine section
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Wed, 10 Feb 2021 22:33:29 -0000

On Mon, Feb 8, 2021 at 6:11 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Acked-by: Bin Meng <bin.meng@windriver.com>

Thanks!

Applied to riscv-to-apply.next with the title fixed.

Alistair

> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d8b0bf966..c347d49bd2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1359,6 +1359,15 @@ F: include/hw/misc/mchp_pfsoc_dmc.h
>  F: include/hw/misc/mchp_pfsoc_ioscb.h
>  F: include/hw/misc/mchp_pfsoc_sysreg.h
>
> +SiFive Machines
> +M: Alistair Francis <Alistair.Francis@wdc.com>
> +M: Bin Meng <bin.meng@windriver.com>
> +M: Palmer Dabbelt <palmer@dabbelt.com>
> +L: qemu-riscv@nongnu.org
> +S: Supported
> +F: hw/*/*sifive*.c
> +F: include/hw/*/*sifive*.h
> +
>  RX Machines
>  -----------
>  rx-gdbsim
> --
> 2.30.0
>

