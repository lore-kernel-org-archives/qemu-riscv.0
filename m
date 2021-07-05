Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0Huh-0006NU-Lv
	for mharc-qemu-riscv@gnu.org; Mon, 05 Jul 2021 02:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0Huf-0006Jq-Gg; Mon, 05 Jul 2021 02:17:01 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:34654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0Hue-0006uw-1j; Mon, 05 Jul 2021 02:17:01 -0400
Received: by mail-yb1-xb34.google.com with SMTP id c8so27399744ybq.1;
 Sun, 04 Jul 2021 23:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zgD5QzwBYOoNYdfKDlaFqdDRj+5ADpGpLohBwq4/YQQ=;
 b=AflPB9env8HapqCY25QAmtE5k8PtKyUitlool0QKSa8U4833ddiaJNlX7Plb8NPYmS
 sRQF7sqrV+2oPd4eU87QKZfzyQ0UCiBNWkJD4kvI5fjg6qBX96gHE632qqMLsqy6vrPg
 IrInDNLk3t6m5N9njQAsv6dqmxUcteKKUa/Dl/17No9UfQ5cjzvg7vfnQ+4xlXmHZCSA
 syolCJi813sbfuRHzMkscYPTi/Hn8W+eEALVTtRda9BrBrtuh4NbLVbHPCK39l31NyX0
 4W/eImai57XveiXFLiq1Ofvv0avux0NMi3DWzZIjb7UiarLLvCvesZnjx/LGitTfZyXb
 e2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zgD5QzwBYOoNYdfKDlaFqdDRj+5ADpGpLohBwq4/YQQ=;
 b=Zc/Lv8x0cZymunn34Pie8fanIEzmKL8Le1ku/3R4KB5U1gUiyihd6Mya1CimQzqGSJ
 yGDGfQNUxT1num+1DAAt0Yw27YUNO3kKuLWOF7SqW+eFjoZxav9sIw8RqMaRxHCo1HaI
 VND7JcGxBEGGyL6hf5vok9vTr7f8wTImt17n90UmOmKP70rGBVqoXu/O6k1u96RcqwC+
 ITSAmKqlRNqnPP5m6pyYK5K1SWuTd3skANYMq7X3IZyV0XbRfup4cZN4IP84+8gbshsC
 /sXiw3ccCEjbtnTgm59158DaUZh8BZS8vlsmTVOfCMZwTgXL586SBaCdXkkKMb84TSt6
 fYWg==
X-Gm-Message-State: AOAM533CZLtOc3v5kPsUsd/ZXs6nYgyP0wOIHrVoWfYKr/Q+qcl7bEiJ
 k3g8WlYbRonW7R0ZnNOSQnw9/qhnaKI1e3PrYi0=
X-Google-Smtp-Source: ABdhPJyOunLUiKWsjyeZkY0agZKEkHb5Npqy3NkgzaBROzjXSQ+gIf0G7rRW52O3pht7UKyNeBZf8guLzs0inhOgiQA=
X-Received: by 2002:a25:df11:: with SMTP id w17mr15395284ybg.314.1625465818902; 
 Sun, 04 Jul 2021 23:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625202999.git.alistair.francis@wdc.com>
 <2675adc73be8ed35dd9d36198c519e4f46b285c2.1625202999.git.alistair.francis@wdc.com>
In-Reply-To: <2675adc73be8ed35dd9d36198c519e4f46b285c2.1625202999.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Jul 2021 14:16:47 +0800
Message-ID: <CAEUhbmUakAfSti1hCnLXrVBadpF-DtPkGT=LQz_f=XwmZYv2OA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] hw/riscv: opentitan: Add the unimplement
 rv_core_ibex_peri
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 05 Jul 2021 06:17:02 -0000

On Fri, Jul 2, 2021 at 1:20 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/opentitan.h | 1 +
>  hw/riscv/opentitan.c         | 3 +++
>  2 files changed, 4 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

