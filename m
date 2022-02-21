Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMGgD-0006E3-2J
	for mharc-qemu-riscv@gnu.org; Mon, 21 Feb 2022 16:57:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMGgB-0006DX-DM; Mon, 21 Feb 2022 16:57:11 -0500
Received: from [2607:f8b0:4864:20::d32] (port=41479
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMGg9-0002of-DN; Mon, 21 Feb 2022 16:57:11 -0500
Received: by mail-io1-xd32.google.com with SMTP id d19so7148201ioc.8;
 Mon, 21 Feb 2022 13:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/s+LXxnF+Zm3dzPsQ23k7f2jRKOuj9sxj+aQltuK/2k=;
 b=Cc8NlHa+J0jnQtdn/Wc9Ctcc0q8tXrGxyRAbcGnp3q6pGDYjJ+EdPMkjv1uYSZ5m2K
 VemjgpFsN7zNIey4XnprmtEa95o1Z1PY0Hond6l7/eqnutP+b0/6S6JQVuhrw2NnkzV3
 aNXRpiRMwBfuAyOWOHL795b9JkbUkSL/KBjj9TDaU0qWGBICFYrngLgRgytO8cZ6JkQ2
 Fdh+FlA7F0bm5wvMXLwLccnLIcWDg8RsDfB0BMAnL9BGMt514aH8fXHOEU73Ny5Wg1dK
 CK2jQHDVwng3w+AUIGHirfWl83KKpHpCAg0jB2hMJq9UK7v7XXWC0RHshq3NM5jsD75Z
 uGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/s+LXxnF+Zm3dzPsQ23k7f2jRKOuj9sxj+aQltuK/2k=;
 b=jE8zxwG2tLrlZbpmh7uLd7vrVd+/+YYgBDdHOAD//2enaGwSyL1rCo3CdXtJIt3MXE
 HXVaReSjCALiG7cE6lTw4xA5Sx3U37+1B0i40wkpSVF6IOLHIPfp0nDsPMfM0p9bkH9w
 dADe5L4QcD33Z1ROoN72MBS/hL/trQqaCTmUHItZDhj/FArC6V7QRT6+edQoZCM/Twmd
 M1ZEZpkhHOpp+E9TTeGD9jzOXbfuTWAsrM+v6eI+Npdq/DK9/8ZMMWZZKzpbszgvqpUx
 T6DzJjN2Ob9CCMwabPBUkA4oCgKnvN/0f0SrS/KPfhsjXJYOCjihFYjvF01HBQZuvPIX
 HrXA==
X-Gm-Message-State: AOAM532q87dhUTz2k2IC1LJMgbKy1dAOdo7GcaZ5YIQ9olk2uK4Iq9NJ
 D8FFG0GVDEOR+chUVRbaM4G6/5OO4gCKIOew7To=
X-Google-Smtp-Source: ABdhPJwCCmngxhA6wUSQD+ues7vwAV4DMx5ck+1BPZqcHCifSXBjALIBxffXuw9wW1K4n19bPSG43Tx1n03HLtSBr7Y=
X-Received: by 2002:a6b:d60a:0:b0:63a:be64:c652 with SMTP id
 w10-20020a6bd60a000000b0063abe64c652mr17120344ioa.27.1645480628165; Mon, 21
 Feb 2022 13:57:08 -0800 (PST)
MIME-Version: 1.0
References: <20220210061737.1171-1-frank.chang@sifive.com>
 <20220210061737.1171-3-frank.chang@sifive.com>
In-Reply-To: <20220210061737.1171-3-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Feb 2022 07:56:42 +1000
Message-ID: <CAKmqyKOnXg=nc_4bUKkZrLWbn4nuxtDXa6o_mGNR8yE79-_ZSg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/3] hw/intc: Support 32/64-bit mtimecmp and mtime
 accesses in RISC-V ACLINT
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Anup Patel <anup.patel@wdc.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 21 Feb 2022 21:57:11 -0000

On Thu, Feb 10, 2022 at 4:22 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> RISC-V privilege spec defines that:
>
> * In RV32, memory-mapped writes to mtimecmp modify only one 32-bit part
>   of the register.
> * For RV64, naturally aligned 64-bit memory accesses to the mtime and
>   mtimecmp registers are additionally supported and are atomic.
>
> It's possible to perform both 32/64-bit read/write accesses to both
> mtimecmp and mtime registers.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  hw/intc/riscv_aclint.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index 3b598d8a7e..e7b103e83a 100644
> --- a/hw/intc/riscv_aclint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -126,9 +126,9 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "aclint-mtimer: invalid hartid: %zu", hartid);
>          } else if ((addr & 0x7) == 0) {
> -            /* timecmp_lo */
> +            /* timecmp_lo for RV32/RV64 or timecmp for RV64 */
>              uint64_t timecmp = env->timecmp;
> -            return timecmp & 0xFFFFFFFF;
> +            return (size == 4) ? (timecmp & 0xFFFFFFFF) : timecmp;
>          } else if ((addr & 0x7) == 4) {
>              /* timecmp_hi */
>              uint64_t timecmp = env->timecmp;
> @@ -139,8 +139,9 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
>              return 0;
>          }
>      } else if (addr == mtimer->time_base) {
> -        /* time_lo */
> -        return cpu_riscv_read_rtc(mtimer->timebase_freq) & 0xFFFFFFFF;
> +        /* time_lo for RV32/RV64 or timecmp for RV64 */
> +        uint64_t rtc = cpu_riscv_read_rtc(mtimer->timebase_freq);
> +        return (size == 4) ? (rtc & 0xFFFFFFFF) : rtc;
>      } else if (addr == mtimer->time_base + 4) {
>          /* time_hi */
>          return (cpu_riscv_read_rtc(mtimer->timebase_freq) >> 32) & 0xFFFFFFFF;
> @@ -167,12 +168,17 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "aclint-mtimer: invalid hartid: %zu", hartid);
>          } else if ((addr & 0x7) == 0) {
> -            /* timecmp_lo */
> -            uint64_t timecmp_hi = env->timecmp >> 32;
> -            riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
> -                timecmp_hi << 32 | (value & 0xFFFFFFFF),
> -                mtimer->timebase_freq);
> -            return;
> +            if (size == 4) {
> +                /* timecmp_lo for RV32/RV64 */
> +                uint64_t timecmp_hi = env->timecmp >> 32;
> +                riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
> +                    timecmp_hi << 32 | (value & 0xFFFFFFFF),
> +                    mtimer->timebase_freq);
> +            } else {
> +                /* timecmp for RV64 */
> +                riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
> +                                                  value, mtimer->timebase_freq);
> +            }
>          } else if ((addr & 0x7) == 4) {
>              /* timecmp_hi */
>              uint64_t timecmp_lo = env->timecmp;

Should we check the other accesses to make sure the size == 4?

Alistair

> --
> 2.31.1
>
>

