Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9apw-0001jy-2f
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 17:50:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9apo-0001g9-LX; Mon, 17 Jan 2022 17:50:44 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=34400
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9api-0000mS-C8; Mon, 17 Jan 2022 17:50:44 -0500
Received: by mail-io1-xd2f.google.com with SMTP id z19so17706530ioj.1;
 Mon, 17 Jan 2022 14:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T0TpH7Hqwi/NvVaUWoRRtaP3s7QoHAGl099Hvw9zme0=;
 b=kGCdJ1tD3Bn8FnZTt0A53eh9ZjDS9HbSpU0q/22SO3MbR77KajK5YDRLIZK2qICy9F
 8uk/uZQhOkdM36V+E0j+lFyrNq2NXBk9sMpFSODaHwQb3EtnH9hc0uKvKFT/aj40ryHZ
 A18xFlgh5ORmrbiNRSO7P9350ShGQn+80vFY8b79C35NGGuK49S4J+bsHcy+wOB/P8zF
 BZZHfbX2S7lCeVWGVMuoR6c4BKcHRYcd2F35hiPdSzKc635FiVWHiXTbEB53zmRn8Npi
 qiLrQV+S4fKEQsIurMV08F42iAn9bCC8auIrhkWWVeanryEWBxq9PbGIgonD1Q2GSl5d
 IaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T0TpH7Hqwi/NvVaUWoRRtaP3s7QoHAGl099Hvw9zme0=;
 b=YVDjg2EzSGIt5fxXzMtTySyz7xPQ3konhS5Tw22BKipDjDDPaCszb8xPM88L9+bQpj
 EFZAyom7kI0rebD5kZlasjC/ByasJ/vrCxPRj2ERsGopy5n9GDGxnrfyHt+Q1jcOjfcS
 qynDspOGlYASCmQGvvmdcrt0EB0+VpS+lUuR84bS0vouSVWpSH0IarQ523FReNfzHi7i
 mXL0PA1fxweeEoGWvg/56P5/ZlkM4qsXzJp+ZdA5yL6C8wm83gPMxI2TRjqBY0ERQvq4
 BqCQmuEIgVVg2n5JQI1hnTq3RDhtPKmGf2Ow3RC7eLFUG3dCU4KihAuP/DFhaTeSaU2U
 ch1g==
X-Gm-Message-State: AOAM5307GWIoAYF+Ft3zB2K8asAL5+ONhya+YF96eG0Kjojmz6Y5ZGHh
 JVe0KHURsUW+RUCYI2KU8hBKV9iwzKTxtWmi8uJYYZpHepbqVkem
X-Google-Smtp-Source: ABdhPJz5/lCJsNUMZlF+nXzKlXqv05e2HjVxKGNQITmZTl2gUZL4GGcvZbGXS+lCxlbL6d4a7TQP2Lz5ybXqAqtRJjI=
X-Received: by 2002:a05:6602:15c5:: with SMTP id
 f5mr4335380iow.16.1642459831701; 
 Mon, 17 Jan 2022 14:50:31 -0800 (PST)
MIME-Version: 1.0
References: <20211229023348.12606-1-frank.chang@sifive.com>
 <20211229023348.12606-8-frank.chang@sifive.com>
In-Reply-To: <20211229023348.12606-8-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 08:50:05 +1000
Message-ID: <CAKmqyKMSY=rMQGxnjJeW_4Ax3nTuMQBCnu=1WGvPKEOvto9nuQ@mail.gmail.com>
Subject: Re: [PATCH 07/17] target/riscv: rvv-1.0: Add Zve64f support for
 single-width fp reduction insns
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
X-List-Received-Date: Mon, 17 Jan 2022 22:50:49 -0000

On Wed, Dec 29, 2021 at 12:41 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Vector single-width floating-point reduction operations for EEW=32 are
> supported for Zve64f extension.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 0aa8b7918f..d7e288b87f 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2935,7 +2935,8 @@ GEN_OPIVV_WIDEN_TRANS(vwredsumu_vs, reduction_widen_check)
>  static bool freduction_check(DisasContext *s, arg_rmrr *a)
>  {
>      return reduction_check(s, a) &&
> -           require_rvf(s);
> +           require_rvf(s) &&
> +           require_zve64f(s);
>  }
>
>  GEN_OPFVV_TRANS(vfredsum_vs, freduction_check)
> --
> 2.31.1
>
>

