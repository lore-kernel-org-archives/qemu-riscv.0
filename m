Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipMpO-00089U-Tt
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jan 2020 20:41:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43035)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1ipMpL-000886-To
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 20:41:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1ipMpJ-0004n9-35
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 20:41:34 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:56149)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1ipMpH-0004fH-0q
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 20:41:31 -0500
Received: by mail-pj1-x1043.google.com with SMTP id d5so402481pjz.5
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2020 17:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=WuWhx15qnOyg1gRVt71tiFMKU0IEV7PZgk3YZc3+yfc=;
 b=bKLNTpF0eKeK4W3nB9oZgYLwyA/xSzkWm6xZFjve7ko+IL3TQzBNLzKkxbsrWa+hey
 PzyFbM1+DqsOUgUSLv+J4gdOBJqPyiCKRt1MGsnQrPpSFp6lTmW+qCEx5u/Z1wUEgrQW
 pYHpjIaA+dQJOd5mv3F8sYYjNFdAXrBQE4ZCDQcvm6m5e+KDYrxChcKspdkW/Qw9jGki
 OsTdBWQIvcGArzcogNx+8+zITz6yfJ3uzZHlMF/DXvDMbYdWLcynbhWNdNVGbQ56HXIr
 8zmzHz2szPwn2Plgkm7KlOOYP8sBiuNkeUYTPDwFbLxRgywVO3ykEwu7kBY9w4CKex+y
 qCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=WuWhx15qnOyg1gRVt71tiFMKU0IEV7PZgk3YZc3+yfc=;
 b=mFeSfFSui+I8vSMNerIn2vgWbtNTnEJiKt59kFRB5jI4CEQYGAopJbqCavFxyjp7kW
 /SAhWOPKiGrD0q9STbos/FPN4Iy0T2Lud+rLUobXBYaWw/kCseBQ7MsEU15PxmaAwanj
 DWJ/mOlZoziSgdIhAEmlGQ2CCNRuAjfzVrNXhPoiPcuqFk0kz/ZEWZoVqqHpzmlKicCD
 wpPWcLETFg1m7jpU9sArEm0GUHQWfeL+ss0FRNSjkEMLVBa7g24zOGhZR/1w+w6OIm51
 nsRjdVdJhWgS0vCm1j2ax8oTOW396nHyIMXhMh8Gf5WKRdtmptFdUXuQrd/qp4MQ9FeM
 xQlw==
X-Gm-Message-State: APjAAAXLdQqs4GYA4GlYUWZL1+eIOELhfN7oylKgiYAOdo7sJAFYt5oO
 zvHuPwKj0AYXQVSTiJhWNzx/jg==
X-Google-Smtp-Source: APXvYqzgViiZt/G9S9d71YjHtPwmtjtD0UQDgwf2fMFh+trl1DfyOhFqmyHaAqIFPZiM0LSaWSgGDA==
X-Received: by 2002:a17:90a:8545:: with SMTP id a5mr2061993pjw.3.1578534088977; 
 Wed, 08 Jan 2020 17:41:28 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id a15sm5084494pfh.169.2020.01.08.17.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 17:41:28 -0800 (PST)
Date: Wed, 08 Jan 2020 17:41:28 -0800 (PST)
X-Google-Original-Date: Wed, 08 Jan 2020 17:41:27 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v1 30/36] target/riscv: Allow specifying MMU stage
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
To: Alistair Francis <Alistair.Francis@wdc.com>
In-Reply-To: <1cd8d1423b81dd4705e03923f644840e35143ed5.1575914822.git.alistair.francis@wdc.com>
References: <1cd8d1423b81dd4705e03923f644840e35143ed5.1575914822.git.alistair.francis@wdc.com><cover.1575914822.git.alistair.francis@wdc.com>
Message-ID: <mhng-e5d082cc-1654-401c-bd75-d218ace4aad4@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
X-List-Received-Date: Thu, 09 Jan 2020 01:41:37 -0000

On Mon, 09 Dec 2019 10:11:59 PST (-0800), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_helper.c | 39 ++++++++++++++++++++++++++++++---------
>  1 file changed, 30 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 2040fc0208..8b234790a7 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -279,10 +279,19 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
>   *
>   * Adapted from Spike's mmu_t::translate and mmu_t::walk
>   *
> + * @env: CPURISCVState
> + * @physical: This will be set to the calculated physical address
> + * @prot: The returned protection attributes
> + * @addr: The virtual address to be translated
> + * @access_type: The type of MMU access
> + * @mmu_idx: Indicates current privilege level
> + * @first_stage: Are we in first stage translation?
> + *               Second stage is used for hypervisor guest translation
>   */
>  static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>                                  int *prot, target_ulong addr,
> -                                int access_type, int mmu_idx)
> +                                int access_type, int mmu_idx,
> +                                bool first_stage)
>  {
>      /* NOTE: the env->pc value visible here will not be
>       * correct, but the value visible to the exception handler
> @@ -485,13 +494,23 @@ restart:
>  }
>
>  static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
> -                                MMUAccessType access_type, bool pmp_violation)
> +                                MMUAccessType access_type, bool pmp_violation,
> +                                bool first_stage)
>  {
>      CPUState *cs = env_cpu(env);
> -    int page_fault_exceptions =
> -        (env->priv_ver >= PRIV_VERSION_1_10_0) &&
> -        get_field(env->satp, SATP_MODE) != VM_1_10_MBARE &&
> -        !pmp_violation;
> +    int page_fault_exceptions;
> +    if (first_stage) {
> +        page_fault_exceptions =
> +            (env->priv_ver >= PRIV_VERSION_1_10_0) &&
> +            get_field(env->satp, SATP_MODE) != VM_1_10_MBARE &&
> +            !pmp_violation;
> +        riscv_cpu_set_force_hs_excep(env, 0);
> +    } else {
> +        page_fault_exceptions =
> +            get_field(env->hgatp, HGATP_MODE) != VM_1_10_MBARE &&
> +            !pmp_violation;
> +        riscv_cpu_set_force_hs_excep(env, 1);
> +    }
>      switch (access_type) {
>      case MMU_INST_FETCH:
>          cs->exception_index = page_fault_exceptions ?
> @@ -518,7 +537,8 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>      int prot;
>      int mmu_idx = cpu_mmu_index(&cpu->env, false);
>
> -    if (get_physical_address(&cpu->env, &phys_addr, &prot, addr, 0, mmu_idx)) {
> +    if (get_physical_address(&cpu->env, &phys_addr, &prot, addr, 0, mmu_idx,
> +                             true)) {
>          return -1;
>      }
>      return phys_addr;
> @@ -583,7 +603,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
>                    __func__, address, access_type, mmu_idx);
>
> -    ret = get_physical_address(env, &pa, &prot, address, access_type, mmu_idx);
> +    ret = get_physical_address(env, &pa, &prot, address, access_type, mmu_idx,
> +                               true);
>
>      if (mode == PRV_M && access_type != MMU_INST_FETCH) {
>          if (get_field(*env->mstatus, MSTATUS_MPRV)) {
> @@ -610,7 +631,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      } else if (probe) {
>          return false;
>      } else {
> -        raise_mmu_exception(env, address, access_type, pmp_violation);
> +        raise_mmu_exception(env, address, access_type, pmp_violation, true);
>          riscv_raise_exception(env, cs->exception_index, retaddr);
>      }
>  #else

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

