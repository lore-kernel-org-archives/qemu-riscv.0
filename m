Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iG3QL-0000l0-F6
	for mharc-qemu-riscv@gnu.org; Thu, 03 Oct 2019 11:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49053)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iG3QI-0000jx-Df
 for qemu-riscv@nongnu.org; Thu, 03 Oct 2019 11:53:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iG3QH-0002jW-0T
 for qemu-riscv@nongnu.org; Thu, 03 Oct 2019 11:53:46 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36725)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iG3QG-0002i2-RP
 for qemu-riscv@nongnu.org; Thu, 03 Oct 2019 11:53:44 -0400
Received: by mail-pl1-f196.google.com with SMTP id j11so1725876plk.3
 for <qemu-riscv@nongnu.org>; Thu, 03 Oct 2019 08:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=73hyILDc2t8kJSZsfjarcvdvoTcbngTuGHMPwhqE8HE=;
 b=ewVE5TDKKPcAOmiO0Qf/umTBigBj6C8kDK5piaCD/oO6ja2HX3iY82h88JDrlW3FHd
 +ZpqoHh4AOKJbfa76zomSaG9lDvKdwYXOyCP37aBWLJk0NosTJTAAQqSu3zc1cc4Nw7L
 5I/QrM3v3KB8UTvGRkpvtWE/DqM+rrU83/m1nFXsP9+lnJmUrACaaGQreVlDU47hJu+b
 KSOFY6rxkjdECMQG7BmFiciA4Dn1OwbKltxuwtSjOgomVbaAc+Te1y9I4LPDiN6iZzg1
 I/BBBXCSJhwkWC6lcaZsmoKlhfjNabrKPvTJSq6QzpbxIa9hGrwbjZUrKQyuK+ZimBnQ
 Sw/g==
X-Gm-Message-State: APjAAAVFDZ5VkA1j5DIvqaJItucB6VnbioWHFdTZr7qY+lTyO4JNP5S9
 e3fLvpy0jKDB6juY8Qllv8RMcg==
X-Google-Smtp-Source: APXvYqzR7afBgBGztIel0StlB/gUj9G1773MT6l6zCIhqYfZeeSGsVBErBSBIYznrR7QwUKVI/48yg==
X-Received: by 2002:a17:902:a717:: with SMTP id
 w23mr10080097plq.17.1570118023143; 
 Thu, 03 Oct 2019 08:53:43 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id c8sm3287575pga.42.2019.10.03.08.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2019 08:53:42 -0700 (PDT)
Date: Thu, 03 Oct 2019 08:53:42 -0700 (PDT)
X-Google-Original-Date: Thu, 03 Oct 2019 08:53:10 PDT (-0700)
Subject: Re: [PATCH v1 22/28] target/riscv: Allow specifying MMU stage
In-Reply-To: <4d84c887def558fc178c31e3adc52f1c4b2fb075.1566603412.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-87129cf6-394a-4b08-bf67-a6bb60f86245@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.196
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
X-List-Received-Date: Thu, 03 Oct 2019 15:53:47 -0000

On Fri, 23 Aug 2019 16:38:47 PDT (-0700), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_helper.c | 39 ++++++++++++++++++++++++++++++---------
>  1 file changed, 30 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 098873c83e..9aa6906acd 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -318,10 +318,19 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
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
> @@ -518,13 +527,23 @@ restart:
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
> +            riscv_cpu_set_force_hs_excep(env, CLEAR_HS_EXCEP);

It might just be email, but the indentation looks wrong here.

> +    } else {
> +        page_fault_exceptions =
> +            get_field(env->hgatp, HGATP_MODE) != VM_1_10_MBARE &&
> +            !pmp_violation;
> +            riscv_cpu_set_force_hs_excep(env, FORCE_HS_EXCEP);
> +    }
>      switch (access_type) {
>      case MMU_INST_FETCH:
>          cs->exception_index = page_fault_exceptions ?
> @@ -551,7 +570,8 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>      int prot;
>      int mmu_idx = cpu_mmu_index(&cpu->env, false);
>
> -    if (get_physical_address(&cpu->env, &phys_addr, &prot, addr, 0, mmu_idx)) {
> +    if (get_physical_address(&cpu->env, &phys_addr, &prot, addr, 0, mmu_idx,
> +                             true)) {
>          return -1;
>      }
>      return phys_addr;
> @@ -613,7 +633,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
>                    __func__, address, access_type, mmu_idx);
>
> -    ret = get_physical_address(env, &pa, &prot, address, access_type, mmu_idx);
> +    ret = get_physical_address(env, &pa, &prot, address, access_type, mmu_idx,
> +                               true);
>
>      if (mode == PRV_M && access_type != MMU_INST_FETCH) {
>          if (get_field(*env->mstatus, MSTATUS_MPRV)) {
> @@ -640,7 +661,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      } else if (probe) {
>          return false;
>      } else {
> -        raise_mmu_exception(env, address, access_type, pmp_violation);
> +        raise_mmu_exception(env, address, access_type, pmp_violation, true);
>          riscv_raise_exception(env, cs->exception_index, retaddr);
>      }
>  #else

I don't think it makes sense to split off these two (23 and 24, that add the 
argument) out from the implementation.

