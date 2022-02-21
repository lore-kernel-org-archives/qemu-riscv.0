Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMGZb-0002Xk-AL
	for mharc-qemu-riscv@gnu.org; Mon, 21 Feb 2022 16:50:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMGZZ-0002XU-HU; Mon, 21 Feb 2022 16:50:21 -0500
Received: from [2607:f8b0:4864:20::d29] (port=37539
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMGZW-0001oD-Nk; Mon, 21 Feb 2022 16:50:20 -0500
Received: by mail-io1-xd29.google.com with SMTP id c23so12951742ioi.4;
 Mon, 21 Feb 2022 13:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EnJPDA6Q76I+2b2aGjV2HsMz4uwPSAyoibsKpILY7NE=;
 b=gwnALPeVMhup+iK/PLUJ1JzbAf8jeuj01fWPZuILd3ULOaly0aaX0pXMiXxQ/tINCX
 cOleK/Oo0b7WA4ZOvope1XHGTvYhlSe/gQkd+qDWcq8nqMB8bPVAtYhwCPrIs7oFlY4T
 QvmM6w0kpzzAE8swzyuX6+bKeDDtz/w8yMHkKgs8NScvxIZ0x3c5KaKzCtepAWvfv4ns
 kf3PFyGv8Y0GYaYWBAUiz7nfk6MvybDKNt+lIaktppz1mdJ/DnTe0NCKZIdzkORzx9MO
 PkXz8sh3f+4eG991sb/1C1IXekm1tQWYICbAOzb68mOH7jaq5UWhOdwkHYjMwOvBXLr2
 dvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EnJPDA6Q76I+2b2aGjV2HsMz4uwPSAyoibsKpILY7NE=;
 b=RVZl571VrsTFTWwoiBgTr3g92GFn/b4LIoSYCJJxp7UAiKwAgAShW/CR4nKEn4HF4M
 ABzDpKGv1/jqv0HoZKX/H10T4U4V4zRF0tnq412X7QlqmabBLMXLFLkKnymWV2FeziYn
 XuaJ/Vgy9b37yRzUfmpFv0XFk1usaH2YFZGtwEOPV7yemlpa2oTswdA0GylEfImIohAK
 1sQ2JCFPpBj/co9YRcMUlN3GNB/bBHlPkOzgL+i+NnVjP2LKIsVSmbDDtC60wlWfC252
 QCgzbQ2u3RVkJ5Ng6mjLss48ix82/tDbm8ziy/DVQ2J+nxTrB6x26cF2IVIjG/nteBMh
 0FWA==
X-Gm-Message-State: AOAM531YokG/2BVaDycke/YiiQDYWXv3OwXljjQkMqrIL0wkD6inxrAb
 g/yjD7G0iCSkpjLznsMtOk5HaLdTeBc0ijSY7YA=
X-Google-Smtp-Source: ABdhPJzDQE9DPHYZbauVHJVw+qRJ/J6gwE2LDaIRwmkgkt07Rv0x60vjdlKAryanf4r2cRNmM11vgq2tE2dzght7f34=
X-Received: by 2002:a05:6638:2388:b0:311:d1bb:ed46 with SMTP id
 q8-20020a056638238800b00311d1bbed46mr16605331jat.212.1645480216023; Mon, 21
 Feb 2022 13:50:16 -0800 (PST)
MIME-Version: 1.0
References: <20220210061737.1171-1-frank.chang@sifive.com>
 <20220210061737.1171-3-frank.chang@sifive.com>
In-Reply-To: <20220210061737.1171-3-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Feb 2022 07:49:50 +1000
Message-ID: <CAKmqyKNpGMBRS8hERXOYX_Ry2TV8O+dfEydBuGYwXrgBX3hF5A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/3] hw/intc: Support 32/64-bit mtimecmp and mtime
 accesses in RISC-V ACLINT
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Anup Patel <anup.patel@wdc.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Mon, 21 Feb 2022 21:50:22 -0000

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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
> --
> 2.31.1
>
>

