Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jEiVS-0005j2-Lr
	for mharc-qemu-riscv@gnu.org; Wed, 18 Mar 2020 19:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49820)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jEiVQ-0005gP-Dz
 for qemu-riscv@nongnu.org; Wed, 18 Mar 2020 19:53:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jEiVP-0001O5-6a
 for qemu-riscv@nongnu.org; Wed, 18 Mar 2020 19:53:48 -0400
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42]:46002)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jEiVM-0001Ej-Ci; Wed, 18 Mar 2020 19:53:44 -0400
Received: by mail-vs1-xe42.google.com with SMTP id x82so392940vsc.12;
 Wed, 18 Mar 2020 16:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SqF3DZicOvED+tNSF5bdDI6KNFhLMtWMW7Q27EbHtxU=;
 b=sEps0ns9Yj3mijwzA8cnwn9FaLTS0iCff23h7EFuC6hQQp44dO+ZphR50cPn6WEQOs
 s23JOqjjHQ0Uwd9BfA2pokwNzcNuyERHOvH5ykmLLoOfkiOPeBGaMPP+pLj4p/FqRGIF
 VMesIR5Z9iErNjw/UnfC1sfZdhF5+EXzTmuyO0ONsGBOMXna6+p++17qRxNdkSI/zSVU
 VttYbNWFzcLuqgHhVl1PdJWWTdwT0Mw6GMikBnzeNnQ/LOvr/bHyGuTm4EsBaGc6cjaA
 6PPsQVfPeHjEJXFml0/Z84YNSCw4gMuhTy+EdmFelFaErsMnkUJzOEiD8bLO7iuPhYCr
 wOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SqF3DZicOvED+tNSF5bdDI6KNFhLMtWMW7Q27EbHtxU=;
 b=PZpD9CMVA6QrbExt3DuiI3zB/5Y9OPLen2FIeLUzGNvd8bbkXS6dvmPQR9fV8y0Bfo
 hppceVY6PyMQfb59Jxkz6oWLeC/crgTGWHG6ChPJRAh6hatjX9tuXlSbyilkfQZsN23l
 7m3vLxuh9yVXCT85CNKTnTAO4jyi+EZJMVG+FTSgzj0Cnb2MB/CtmOiylkDcfcirDU83
 uQP9GFUSYVSqSvec5Atc2Q4T2EyQAIqBPhx5ZO0ReqDZCV1uWylrsFNLaUjpBtZPxhoD
 Oc+P7a+57dCoxluCIUd1C1y0V5THFBga4tEnES6Zl/KxL5gs13Ogg2iBeii5dQiFk4G7
 1yLQ==
X-Gm-Message-State: ANhLgQ20HG+5kPXdsAGSCQPYyMEKX9rpb4AUhKh8b30pVUmNLWmEUZeM
 Uy9fWyeeJ2WQF/Ns4Tud+BLnE0dPTvS7k/Er5T8=
X-Google-Smtp-Source: ADFU+vt4H2flXeRiFiTaU9usR1e7O+P93YjEvzuvWpcAX7ZPLAH31ubvR/P8feciOeaOycnZx306vutBe+Atbwyn4MI=
X-Received: by 2002:a67:26c2:: with SMTP id m185mr171131vsm.180.1584575623369; 
 Wed, 18 Mar 2020 16:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-6-zhiwei_liu@c-sky.com>
In-Reply-To: <20200317150653.9008-6-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 18 Mar 2020 16:45:46 -0700
Message-ID: <CAKmqyKPMoT6mfTRS+Kksn=nBdF7kifWUAw4pd3A82QffnWLpUw@mail.gmail.com>
Subject: Re: [PATCH v6 05/61] target/riscv: add an internals.h header
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Chih-Min Chao <chihmin.chao@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com, guoren@linux.alibaba.com, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e42
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
X-List-Received-Date: Wed, 18 Mar 2020 23:53:49 -0000

On Tue, Mar 17, 2020 at 8:17 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> The internals.h keeps things that are not relevant to the actual architecture,
> only to the implementation, separate.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/internals.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 target/riscv/internals.h
>
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> new file mode 100644
> index 0000000000..cabea18e1d
> --- /dev/null
> +++ b/target/riscv/internals.h
> @@ -0,0 +1,24 @@
> +/*
> + * QEMU RISC-V CPU -- internal functions and types
> + *
> + * Copyright (c) 2020 C-SKY Limited. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef RISCV_CPU_INTERNALS_H
> +#define RISCV_CPU_INTERNALS_H
> +
> +#include "hw/registerfields.h"
> +
> +#endif
> --
> 2.23.0
>

