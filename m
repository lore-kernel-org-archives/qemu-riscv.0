Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hunDl-0006PI-6t
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 20:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35527)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hunDi-0006Lc-CJ
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 20:20:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hunDh-0004Yc-Cx
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 20:20:54 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:42755)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hunDf-0004Uz-7K; Mon, 05 Aug 2019 20:20:51 -0400
Received: by mail-lf1-x144.google.com with SMTP id s19so59476428lfb.9;
 Mon, 05 Aug 2019 17:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NiIlc3CTxCPM+fge+MIT557yia7k9FtuAfqq5zUBkwY=;
 b=AyDTjdQ4SI10zOPInshYVRw+0LgfjB7Xwft1U+n0YjGjTT350I+Q07YtCCw0N5IeCA
 xDk2WVrhOYjf8sEj53bjj45dILTVXnRw6Gpj+J5Bogmq+AVC5xD2bitOe198kMCCtLZj
 sSznEOemAZIfEnrSa5eklcKUEZoX0gkItIb/omOcaf3sOiuCPENMi8Hh/e0VL7lTnwd1
 5xzVo61muYPvJ07O4QS6lVz/pED5tfqyayqrmpbgDVxF7ZN6bz5FkP7jPYfREc/Z875c
 98APVdshMXfLr8TG51U1MC5OpCJOXND4t6K+cZBGGTqRcCgaC5YTUrAVa9zHmF75wkNz
 IqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NiIlc3CTxCPM+fge+MIT557yia7k9FtuAfqq5zUBkwY=;
 b=oBVu+eBjbQIccH6oI+CIZuEb4NIzEu0kRYDaObaOp/jVTsZOahQpRkXmukuG90y0i7
 Yp5Wyyxg7DH6v9Tboudrq3AD4VhhM3JFQ/srrDEL1k6H8MO0WZoDYiWUNDSFgn80yl2M
 aOCAfn4vGDjQKBTEDvUJy0iL246vSQpi+qPTmrIcMkN3ggblaS3ihcJnTMbkBWa6OHmX
 u1MBuajqDspPOYprr64AM4MH4Fg7Hl3FwuAhH+6ppfDBVEliu0oq9yz+6g4GaLBjoJzV
 Kq8G3CB4xEtzgqlJF/1SHzoTkMEM0GG7dT2zi+yQQELhAP9w8kKyrNUs89fdcE5wtV6x
 uhgQ==
X-Gm-Message-State: APjAAAW/rhHtKlpRSceLprSpSrfGCOfQUedyZNiHmRgyD47KYGg3GdyA
 rjN8Vpoqf3iend3rxhR/qRtENAuiboFZSxHvTeZ3sc1s
X-Google-Smtp-Source: APXvYqyVUDXBvKcsyBWBAl5woGjbAEjrEz3zU+LsU0XeC3IJWj0KR7uH0uWMt9NAQlp57jKmE9uYZJeoqfkmLsokhkg=
X-Received: by 2002:ac2:563c:: with SMTP id b28mr231118lff.93.1565050850168;
 Mon, 05 Aug 2019 17:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
 <1565020823-24223-9-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565020823-24223-9-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 5 Aug 2019 17:17:08 -0700
Message-ID: <CAKmqyKPW3TLPH-ZN1Apmd-UymKg9-XE8C-TBBpfKE8Mf7aVtBg@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 08/28] riscv: sifive_u: Update
 PLIC hart topology configuration string
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
X-List-Received-Date: Tue, 06 Aug 2019 00:20:55 -0000

On Mon, Aug 5, 2019 at 9:03 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> With heterogeneous harts config, the PLIC hart topology configuration
> string are "M,MS,.." because of the monitor hart #0.
>
> Suggested-by: Fabien Chouteau <chouteau@adacore.com>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/sifive_u.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 206eccc..b235f29 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -372,10 +372,11 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
>      plic_hart_config = g_malloc0(plic_hart_config_len);
>      for (i = 0; i < ms->smp.cpus; i++) {
>          if (i != 0) {
> -            strncat(plic_hart_config, ",", plic_hart_config_len);
> +            strncat(plic_hart_config, "," SIFIVE_U_PLIC_HART_CONFIG,
> +                    plic_hart_config_len);
> +        } else {
> +            strncat(plic_hart_config, "M", plic_hart_config_len);
>          }
> -        strncat(plic_hart_config, SIFIVE_U_PLIC_HART_CONFIG,
> -                plic_hart_config_len);
>          plic_hart_config_len -= (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1);
>      }
>
> --
> 2.7.4
>
>

