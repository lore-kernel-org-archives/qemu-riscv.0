Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mo3RR-00008f-1X
	for mharc-qemu-riscv@gnu.org; Fri, 19 Nov 2021 07:56:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3RM-0008Tz-Qb; Fri, 19 Nov 2021 07:56:30 -0500
Received: from [2607:f8b0:4864:20::d29] (port=41956
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3RK-0006rE-UE; Fri, 19 Nov 2021 07:56:28 -0500
Received: by mail-io1-xd29.google.com with SMTP id y16so12599104ioc.8;
 Fri, 19 Nov 2021 04:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6z4zqyXL3Cm63oWRoGBaIwU9Ujq35OfklRfiSEn2yio=;
 b=lAQ8Edy22sk9iiRuh1A1uLdBHy00Ce7YTmBlrYLXKYyqsbJPHRA3qpfbITDgFwQSVt
 jCvE44IYlC8bQ3HqF98pW8Q8om6k687goWmIPXZ1HMfIv8DDJ/Iw2KyMtD3tEsO52xid
 O117UFfVS53txhHfN57UHkieXNkehqEqcHu0XAPatdErNTlOsSGRmulbOz49f9Rot2pL
 g0i2eHECECz3HCodWz30MzdqJcoQlEIdVEg2XgvnVMJYPHVbuUVlFxuWiFaah1TiuuDC
 mljwACAp4Xy7vOmekSDfzc4no3ZqPDOzz6U2ZxzI1cZP3c0Y/lYS96aF5phOM3XERc2X
 5drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6z4zqyXL3Cm63oWRoGBaIwU9Ujq35OfklRfiSEn2yio=;
 b=am8jSWRqTTIx++r0A7sgwyma4vekJKE6f2kLDaa9erR+L6WezyOKcP0eKS26aNyy89
 Zbm+LIXmTtYTzbeLA53nB6FrJwp4dBnZeBA9aL3/RL9lZ7X08hHgbrEQ8ZVAz5i7JWOn
 /lJi1dZM5fYa2wmkmtPjTcB88ylXgTB8KB/InHAIQK/JTXfbolboPYqi5Ajm+GT7lcYz
 /ESHLL1n8/EmQMgzAmydZdbBtTRSZ3uqQXqzOmk8/5bt4v3oFrjdcKIxc6Yhr6mjUGYW
 O47G8ScC93XVWcFiAGBhKjmm67TG60IJEwj/AHy+bgDoptXil6mKk8NSpv81T1dA7qS+
 Lt2A==
X-Gm-Message-State: AOAM532DFLhk0UjWy0uI8gDXQ4BKe6yQBfgb9gDGyOn7LNEU4WZ9npXf
 yNp1WewSqiSFH91rjYXK2QylkNwmehXiOhe+Nj8=
X-Google-Smtp-Source: ABdhPJy4EvGBH59jupZgNeAW7O8ysiHXkBlb0vKvcr46RuHi5x8SbMZugznF1TiFEjmy+VskaN0FSTFEPnsq/ApdA0c=
X-Received: by 2002:a02:9f0c:: with SMTP id z12mr27119730jal.117.1637326579916; 
 Fri, 19 Nov 2021 04:56:19 -0800 (PST)
MIME-Version: 1.0
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
 <20211111155149.58172-21-zhiwei_liu@c-sky.com>
In-Reply-To: <20211111155149.58172-21-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Nov 2021 22:55:52 +1000
Message-ID: <CAKmqyKOrFTekP+JM+EGr7HLZ-MS2USjSzByRmMS+LbsRxV=rvQ@mail.gmail.com>
Subject: Re: [PATCH v4 20/20] target/riscv: Enable uxl field write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Fri, 19 Nov 2021 12:56:30 -0000

On Fri, Nov 12, 2021 at 2:14 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_bits.h | 2 ++
>  target/riscv/csr.c      | 8 +++++---
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 9913fa9f77..5106f0e769 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -413,6 +413,8 @@ typedef enum {
>  #define SSTATUS_SUM         0x00040000 /* since: priv-1.10 */
>  #define SSTATUS_MXR         0x00080000
>
> +#define SSTATUS64_UXL       0x0000000300000000ULL
> +
>  #define SSTATUS32_SD        0x80000000
>  #define SSTATUS64_SD        0x8000000000000000ULL
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 8f8f170768..e79532053a 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -553,15 +553,14 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>           * RV32: MPV and GVA are not in mstatus. The current plan is to
>           * add them to mstatush. For now, we just don't support it.
>           */
> -        mask |= MSTATUS_MPV | MSTATUS_GVA;
> +        mask |= MSTATUS_MPV | MSTATUS_GVA | MSTATUS64_UXL;
>      }
>
>      mstatus = (mstatus & ~mask) | (val & mask);
>
>      if (riscv_cpu_mxl(env) == MXL_RV64) {
> -        /* SXL and UXL fields are for now read only */
> +        /* SXL fields are for now read only */
>          mstatus = set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
> -        mstatus = set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
>      }
>      env->mstatus = mstatus;
>
> @@ -840,6 +839,9 @@ static RISCVException write_sstatus(CPURISCVState *env, int csrno,
>                                      target_ulong val)
>  {
>      target_ulong mask = (sstatus_v1_10_mask);
> +    if (cpu_get_xl(env) != MXL_RV32) {
> +        mask |= SSTATUS64_UXL;
> +    }
>      target_ulong newval = (env->mstatus & ~mask) | (val & mask);
>      return write_mstatus(env, CSR_MSTATUS, newval);
>  }
> --
> 2.25.1
>
>

