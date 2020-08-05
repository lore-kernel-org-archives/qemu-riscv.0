Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k39P3-0007Fl-02
	for mharc-qemu-riscv@gnu.org; Tue, 04 Aug 2020 22:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1k39P0-0007Ds-F7
 for qemu-riscv@nongnu.org; Tue, 04 Aug 2020 22:43:38 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1k39Ox-0005rj-A7
 for qemu-riscv@nongnu.org; Tue, 04 Aug 2020 22:43:38 -0400
Received: by mail-ot1-x342.google.com with SMTP id t7so18380871otp.0
 for <qemu-riscv@nongnu.org>; Tue, 04 Aug 2020 19:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=p0Qufu7iydgjsjL0sratpYg3H1nHBbeoxoJFtiZLn1U=;
 b=nrwh0NM3kIk/aLF+Myn7XnaMgtlAi1ir7FGLVk/Orhg/Y31njhc+AgQIfUVVw9plZ0
 bXwsUjI2kNMUUEYtZJnITDBMRG3t1Pv2KmeLZI1XVWgFVwmBrxA4qzMzUbpjyp6fixIp
 RfX+or6guImArnp1lH+pNY0gENntcEeD6l6r/VRqP/fhcSIcd5ol/Zu0xlqaev+M75Uy
 p1wFoxs9LOmdFJ25Ycq0BhSgPZmkEpKiH5fTWkSFfvAMAD/2c2L+XFN7tXz6t0BY1jjh
 V/m61GM0xXDqOuFnQ0rvPQKyovwecoXOGpJr8s+CUZPyidHWPmyNsCc7rJDibmYtpN6n
 RTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=p0Qufu7iydgjsjL0sratpYg3H1nHBbeoxoJFtiZLn1U=;
 b=cuH95zGV1fpsVNk9yZEDezPUdkl5G9jQZoG1wp470VZd6nfSHDA42LJG/GyX6ecVh3
 mYD/Hjn3G3zj8oWK/z0MwQ1H8I5iFXffNXLkVyfuSgTSQrGTK850a706VQqKNcyh55Ng
 4AVQJVSAlagU3I959EP10W/oJtU7VNGxUyRmxMcC61fUxVD41/VKgO7HJ+Qyi0AmbOEH
 bX/v1TKAuFve/REmYpCnH+qw73o/vXTU+baX8L2PjGKVp0Tg8P3lma00/1K0gFZHOPlc
 18rPXXHFvF51VGO50Rd+yJpktuQSg4CgMbQKF2hTOrb/hCizcDuKmnk8d7G5cAISSCvd
 Qupw==
X-Gm-Message-State: AOAM5304atjXUYLxBQGQvIH0lc08OhfLMs2uPg/fOPYdFiRHwUGN3m/5
 8OqqkOik1uwBstIbi0EJzJnOF/px9LoguQo665ogwA==
X-Google-Smtp-Source: ABdhPJwEJNo/fy+S7t6svahfWyxI9C2YnKPTAs2EO4YKRCKn1yHBNt0fxpenSBYmJxTSYIeK7d+tzbivU1nXDM8/JyA=
X-Received: by 2002:a9d:6292:: with SMTP id x18mr921613otk.33.1596595413136;
 Tue, 04 Aug 2020 19:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1595924470.git.zong.li@sifive.com>
 <6b0bf48662ef26ab4c15381a08e78a74ebd7ca79.1595924470.git.zong.li@sifive.com>
In-Reply-To: <6b0bf48662ef26ab4c15381a08e78a74ebd7ca79.1595924470.git.zong.li@sifive.com>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 5 Aug 2020 10:43:22 +0800
Message-ID: <CANXhq0ouxYh+q8Lj2Q6B4cGLc7wUj+SfrjMFvLz-8Z+Xpf+3sg@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] target/riscv: Change the TLB page size depends on
 PMP entries.
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=zong.li@sifive.com; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 05 Aug 2020 02:43:38 -0000

On Tue, Jul 28, 2020 at 4:26 PM Zong Li <zong.li@sifive.com> wrote:
>
> The minimum granularity of PMP is 4 bytes, it is small than 4KB page
> size, therefore, the pmp checking would be ignored if its range doesn't
> start from the alignment of one page. This patch detects the pmp entries
> and sets the small page size to TLB if there is a PMP entry which cover
> the page size.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  target/riscv/cpu_helper.c | 10 ++++++--
>  target/riscv/pmp.c        | 52 +++++++++++++++++++++++++++++++++++++++
>  target/riscv/pmp.h        |  2 ++
>  3 files changed, 62 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 2f337e418c..fd1d373b6f 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -693,6 +693,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      bool first_stage_error = true;
>      int ret = TRANSLATE_FAIL;
>      int mode = mmu_idx;
> +    target_ulong tlb_size = 0;
>
>      env->guest_phys_fault_addr = 0;
>
> @@ -784,8 +785,13 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      }
>
>      if (ret == TRANSLATE_SUCCESS) {
> -        tlb_set_page(cs, address & TARGET_PAGE_MASK, pa & TARGET_PAGE_MASK,
> -                     prot, mmu_idx, TARGET_PAGE_SIZE);
> +        if (pmp_is_range_in_tlb(env, pa & TARGET_PAGE_MASK, &tlb_size)) {
> +            tlb_set_page(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
> +                         prot, mmu_idx, tlb_size);
> +        } else {
> +            tlb_set_page(cs, address & TARGET_PAGE_MASK, pa & TARGET_PAGE_MASK,
> +                         prot, mmu_idx, TARGET_PAGE_SIZE);
> +        }
>          return true;
>      } else if (probe) {
>          return false;
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index aeba796484..adadf6e9ba 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -393,3 +393,55 @@ target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
>
>      return val;
>  }
> +
> +/*
> + * Calculate the TLB size if the start address or the end address of
> + * PMP entry is presented in thie TLB page.
> + */
> +static target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
> +    target_ulong tlb_sa, target_ulong tlb_ea)
> +{
> +    target_ulong pmp_sa = env->pmp_state.addr[pmp_index].sa;
> +    target_ulong pmp_ea = env->pmp_state.addr[pmp_index].ea;
> +
> +    if (pmp_sa >= tlb_sa && pmp_ea <= tlb_ea) {
> +        return pmp_ea - pmp_sa + 1;
> +    }
> +
> +    if (pmp_sa >= tlb_sa && pmp_sa <= tlb_ea && pmp_ea >= tlb_ea) {
> +        return tlb_ea - pmp_sa + 1;
> +    }
> +
> +    if (pmp_ea <= tlb_ea && pmp_ea >= tlb_sa && pmp_sa <= tlb_sa) {
> +        return pmp_ea - tlb_sa + 1;
> +    }
> +
> +    return 0;
> +}
> +
> +/*
> + * Check is there a PMP entry whcih range covers this page. If so,
> + * try to find the minimum granularity for the TLB size.
> + */
> +bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
> +    target_ulong *tlb_size)
> +{
> +    int i;
> +    target_ulong val;
> +    target_ulong tlb_ea = (tlb_sa + TARGET_PAGE_SIZE - 1);
> +
> +    for (i = 0; i < MAX_RISCV_PMPS; i++) {
> +        val = pmp_get_tlb_size(env, i, tlb_sa, tlb_ea);
> +        if (val) {
> +            if (*tlb_size == 0 || *tlb_size > val) {
> +                *tlb_size = val;
> +            }
> +        }
> +    }
> +
> +    if (*tlb_size != 0) {
> +        return true;
> +    }
> +
> +    return false;
> +}
> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> index 8e19793132..c70f2ea4c4 100644
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -60,5 +60,7 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
>  target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
>  bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>      target_ulong size, pmp_priv_t priv, target_ulong mode);
> +bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
> +    target_ulong *tlb_size);
>
>  #endif
> --
> 2.27.0
>

ping

