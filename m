Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oi87k-00023y-UH
	for mharc-qemu-riscv@gnu.org; Tue, 11 Oct 2022 01:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oi87Z-0001xy-Cb; Tue, 11 Oct 2022 01:48:12 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:33630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oi87W-00025Z-2x; Tue, 11 Oct 2022 01:48:04 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 n18-20020a17090ade9200b0020b0012097cso872031pjv.0; 
 Mon, 10 Oct 2022 22:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BXDybcr/OY6njQdNKiZgnVVOPp/+u3A1yPBopFTABhg=;
 b=JDEduLWdGHHOZgWkmD8H4rLdNLzbdvav7AghiEGOD0AJD4ov8GawFdwN0AqdhjUNoo
 oITUdbXVfQiCuWswvoN5uPFXR/KADcRM8yqeCPzhutxZxKg8NJe9DD64CAv/khaYiP0V
 ayJVsA8uC1Y8yp4/k+x1del09cMrzadqlp2kYcdRrCI1Az3St5iwRXXpw/PaRd82g5V6
 +MTMxYlK+3EQdChcsYGQwjq5bW6eqWo/U/WJdTmTKB90dGwADQQOKQ5WG7UwwxGra8/M
 ZUCkcPe1H5SSbe4/rVdGOOrk5AVg2hF4cKbfZ07PM71i58d9p7PtQ5QITGzB/JnCXjDb
 szhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BXDybcr/OY6njQdNKiZgnVVOPp/+u3A1yPBopFTABhg=;
 b=TbBLlWUq9gGrj+fQz3ri8UYKFdMHzvs9o03M5bF1688swPZO93IrMD4ZME+8xzTT+l
 J5ZL2y9s9UtslQJVJUkBFMCZsc2g19FjkJtKxE0tzL+TNo70rj/kHnCtKhy2AYiwRJSv
 KhQnHwBqPVivLaSXgC4hA0fY/l0VUyht4kVOc08hPcv4AXK3GsVqqWGs5LIh9WAByLXq
 AEM1Pe4plhJ4N4Q+AdwWvMGB5uyQU25A9IZhMolVggHVgQCj7/YJB5BNIom7HeSxEWNU
 RnAIQinLRYZhIrhrqjKhciFw2kyNxG0bePjJWwqOdP8GDzNn/5XdvoAelkhEMjC+j4o/
 YkyA==
X-Gm-Message-State: ACrzQf3UUIhZFd/rt+n6HRpKE6ddECVyKIEVel3x4a4Ai1YtFPLoHHH0
 dLCwl+Co3Knliq6BRK3q9aXTvhwnYpY9gC8qEE8=
X-Google-Smtp-Source: AMsMyM7nJ/1LD45NAYugS2HN2vRIF2aZHGVE5Hjvg99LVt22EkJL7BWfI6KGpoSWBaSTrkbMtfrtwmXWSvEd+E0LKBk=
X-Received: by 2002:a17:90b:3843:b0:20d:54f2:a78d with SMTP id
 nl3-20020a17090b384300b0020d54f2a78dmr5793953pjb.85.1665467277449; Mon, 10
 Oct 2022 22:47:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221003041440.2320-1-jim.shu@sifive.com>
 <20221003041440.2320-2-jim.shu@sifive.com>
In-Reply-To: <20221003041440.2320-2-jim.shu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Oct 2022 15:47:31 +1000
Message-ID: <CAKmqyKMTv-KXrPmDiKuthiRuhd1PB55GRsxYRWuHvT5_+ZaOrw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hw/intc: sifive_plic: fix hard-coded max priority
 level
To: Jim Shu <jim.shu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, chigot@adacore.com, 
 Emmanuel Blot <emmanuel.blot@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102d.google.com
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
X-List-Received-Date: Tue, 11 Oct 2022 05:48:15 -0000

On Mon, Oct 3, 2022 at 2:16 PM Jim Shu <jim.shu@sifive.com> wrote:
>
> The maximum priority level is hard-coded when writing to interrupt
> priority register. However, when writing to priority threshold register,
> the maximum priority level is from num_priorities Property which is
> configured by platform.
>
> Also change interrupt priority register to use num_priorities Property
> in maximum priority level.
>
> Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/intc/sifive_plic.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index af4ae3630e..f864efa761 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -180,8 +180,10 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
>      if (addr_between(addr, plic->priority_base, plic->num_sources << 2)) {
>          uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
>
> -        plic->source_priority[irq] = value & 7;
> -        sifive_plic_update(plic);
> +        if (value <= plic->num_priorities) {
> +            plic->source_priority[irq] = value;
> +            sifive_plic_update(plic);
> +        }
>      } else if (addr_between(addr, plic->pending_base,
>                              plic->num_sources >> 3)) {
>          qemu_log_mask(LOG_GUEST_ERROR,
> --
> 2.17.1
>
>

