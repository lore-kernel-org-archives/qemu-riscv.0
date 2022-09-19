Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oaQCY-0001Sb-Hv
	for mharc-qemu-riscv@gnu.org; Mon, 19 Sep 2022 19:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oaQCX-0001QY-PH; Mon, 19 Sep 2022 19:29:21 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:40666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oaQCV-0003Sd-N9; Mon, 19 Sep 2022 19:29:21 -0400
Received: by mail-pl1-x62d.google.com with SMTP id b21so677377plz.7;
 Mon, 19 Sep 2022 16:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=8HcAJ/0QWKPxvEv3ePIUWpeoK8eFMmeADRXBhFvO1jo=;
 b=pxVFQ7csDoc6DUV85lh6MuYhajPdVci4jyA3TQLl0l++qJn1jrDh5Sl22FwCl5ro8P
 51j13eMseijaFM+Wvf6GvF+ifWikJe2qYHn9whmeulYs6di5+DGnnmCCrnhV5Ob6ZHMm
 NdvFWA9SvP+OCVB4o7XDtsHxQnW/yH4w6zm3EEpTNa1rBf2/K72/ugnYsRbOTaF6PiSx
 SvVPnUqHUSVhFlEFAJIxa0yBMY1hbNgezVlaSrqeccRXS3W8jRTbOy4W3w8QQ8VM9f98
 I4RB63YtPhtyJ9v+hRyVBxFOVooYDuRIHLCQjM5ULVzvcdaQjABst9t7SS7ObT88moGe
 7Bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=8HcAJ/0QWKPxvEv3ePIUWpeoK8eFMmeADRXBhFvO1jo=;
 b=zIvttCdPhwmnJp9qH/ku2f2pSqqoMVJu0tWV5iLm0m1xKaD+s48VN5m/iXbnvbAhSH
 6zooZ4b30NqjdMRDZJ7ig69jf2LmePQeCAutJQ9zvruFpF/jOa92Owm119Ta+u+hvnSK
 XYwQsU8t68QxVYxwRjdHt+ZWyT5LqIJfKFf1Gb00V4rxuzxsAybeMO0ioo4CVpDhQCqt
 LZJ9ofjTo0uf9O0BdpGzRVAM+B32rEtZckV89W8bKzNOWYJ0wlENOLoDaI8G8CpCrm4q
 0IWjNjSv3Tpb7PBnZUwPgr/Cerq6Sv13j5m0mnCcdP9nT9fNoOuME6wmDVdHfZY2lEL+
 6ZIg==
X-Gm-Message-State: ACrzQf1CEcrtDgz5mAu+SZEVLzNZ9/uwGHEGy69+X5bFlgmPq+Lv88fu
 b8dnI3bEcZel1ERx+tb8W01yDUqsfU05OsF983w=
X-Google-Smtp-Source: AMsMyM5ozsnNbTklWJxS3QI60AIs3oeGEMZN04a84oKSzyYgqyn4GbbAAzAXBp7DuuronxJqwmhcY8nonsWn0w4lK80=
X-Received: by 2002:a17:90a:6405:b0:203:6eaa:4999 with SMTP id
 g5-20020a17090a640500b002036eaa4999mr700182pjj.8.1663630157785; Mon, 19 Sep
 2022 16:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220909152258.2568942-1-leon@is.currently.online>
In-Reply-To: <20220909152258.2568942-1-leon@is.currently.online>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Sep 2022 09:28:51 +1000
Message-ID: <CAKmqyKMfZXarM1g8PdhAqcgZzDyq6RY3R94cYhOo80WXiCv5aA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/pmp: fix non-translated page size address
 checks w/ MPU
To: Leon Schuermann <leon@is.currently.online>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62d.google.com
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
X-List-Received-Date: Mon, 19 Sep 2022 23:29:22 -0000

On Sat, Sep 10, 2022 at 1:24 AM <leon@is.currently.online> wrote:
>
> From: Leon Schuermann <leon@is.currently.online>
>
> This commit fixes PMP address access checks with non page-aligned PMP
> regions on harts with MPU enabled. Without this change, the presence
> of an MPU in the virtual CPU model would influence the PMP address
> check behavior when an access size was unknown (`size == 0`),
> regardless of whether virtual memory has actually been enabled by the
> guest.
>
> The RISC-V Privileged Spec Version 20211203[1] states in 4.3.1
> Addressing and Memory Protection that "[...]  [w]hen Sv32 virtual
> memory mode is selected in the MODE field of the satp register,
> supervisor virtual addresses are translated into supervisor physical
> addresses via a two-level page table. The 20-bit VPN is translated
> into a 22-bit physical page number (PPN), while the 12-bit page offset
> is untranslated. The resulting supervisor-level physical addresses are
> then checked using any physical memory protection structures (Sections
> 3.7), before being directly converted to machine-level physical
> addresses. [...]" and "[...] [w]hen the value of satp.MODE is Bare,
> the 32-bit virtual address is translated (unmodified) into a 32-bit
> physical address [...]". Other modes such as Sv39, Sv48 and Sv57 are
> said to behave similar in this regard.
>
> From this specification it can be inferred that any access made when
> virtual memory is disabled, which is the case when satp.MODE is set to
> "Bare" (0), should behave identically with respect to PMP checks as if
> no MPU were present in the system at all. The current implementation,
> however, degrades any PMP address checks of unknown access size (which
> seems to be the case for instruction fetches at least) to be of
> page-granularity, just based on the fact that the hart has MPU support
> enabled. This causes systems that rely on 4-byte aligned PMP regions
> to incur access faults, which are not occurring with the MPU disabled,
> independent of any runtime guest configuration.
>
> While there possibly are other unhandled edge cases in which
> page-granularity access checks might not be appropriate, this commit
> appears to be a strict improvement over the current implementation's
> behavior. It has been tested using Tock OS, but not with other
> systems (e.g., Linux) yet.
>
> [1]: https://github.com/riscv/riscv-isa-manual/releases/download/Priv-v1.12/riscv-privileged-20211203.pdf
>
> Signed-off-by: Leon Schuermann <leon@is.currently.online>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

> ---
>
> This patch is a resubmission to include all maintainers of the
> modified files and main QEMU mailing list, as determined through the
> `get_maintainer.pl` script.
>
> Also, one particular example of an additional edge case not handled
> through this patch might be a hart operating in M-mode. Given that
> virtual memory through {Sv32,Sv39,Sv48,Sv57} is only supported for
> S-mode and U-mode respectively, enabling virtual memory in the satp
> CSR should not have any effect on the behavior of memory accesses
> w.r.t. PMP checks for harts operating in M-mode.
>
> I'm going to defer adding this additional check, as I'd appreciate some
> feedback as to whether my reasoning is correct here at all first.
>
> Thanks!
>
> -Leon
>
> ---
>  target/riscv/pmp.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index ea2b67d947..48f64a4aef 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -300,6 +300,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>      int i = 0;
>      int ret = -1;
>      int pmp_size = 0;
> +    uint64_t satp_mode;
>      target_ulong s = 0;
>      target_ulong e = 0;
>
> @@ -310,10 +311,17 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>      }
>
>      if (size == 0) {
> -        if (riscv_feature(env, RISCV_FEATURE_MMU)) {
> +        if (riscv_cpu_mxl(env) == MXL_RV32) {
> +            satp_mode = SATP32_MODE;
> +        } else {
> +            satp_mode = SATP64_MODE;
> +        }
> +
> +        if (riscv_feature(env, RISCV_FEATURE_MMU)
> +            && get_field(env->satp, satp_mode)) {
>              /*
> -             * If size is unknown (0), assume that all bytes
> -             * from addr to the end of the page will be accessed.
> +             * If size is unknown (0) and virtual memory is enabled, assume that
> +             * all bytes from addr to the end of the page will be accessed.
>               */
>              pmp_size = -(addr | TARGET_PAGE_MASK);

I'm not sure if we need this at all.

This function is only called from get_physical_address_pmp() which
then calculates the maximum size using pmp_is_range_in_tlb().

I suspect that we could just use sizeof(target_ulong) as the fallback
for every time size == 0. Then pmp_is_range_in_tlb() will set the
tlb_size to the maximum possible size of the PMP region.

As a plus, we would remove some macros as well, so what about (untested)?

    if (size == 0) {
        if (riscv_cpu_mxl(env) == MXL_RV32) {
            pmp_size = 4;
        } else {
            pmp_size = 8;
        }
    } else {
        pmp_size = size;
    }

Alistair

>          } else {
>
> base-commit: 61fd710b8da8aedcea9b4f197283dc38638e4b60
> --
> 2.36.0
>
>

