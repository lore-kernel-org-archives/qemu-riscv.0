Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C40C54F51
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 08:44:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1woztS-0003WS-5d; Wed, 29 Jul 2026 04:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1woztN-0003S6-Ld
 for qemu-riscv@nongnu.org; Wed, 29 Jul 2026 04:43:57 -0400
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1woztL-00008Y-Cx
 for qemu-riscv@nongnu.org; Wed, 29 Jul 2026 04:43:57 -0400
Received: by mail-pz2-x01.google.com with SMTP id
 41be03b00d2f7-c9fe62e0da3so199098a12.1
 for <qemu-riscv@nongnu.org>; Wed, 29 Jul 2026 01:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785314633; x=1785919433; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Vvg68bKxrL5Ce5l0Fzz15atPeSR6nFwUSrrYBxvR6Cc=;
 b=ENZiYbHOHB1si4g5whoMRVU1BCSNVqgrXY2KaXjFvoy0kWDBKy+htkZIMxTtdYaC+i
 DlPkjRVI8ttSSVHycxeVY5qWSst41Hs+wgOfXevAqgDLSLYDpy9CD8G1i1chYyNIqt69
 IGyoHaTOp02mVtlT2sCH6Tw5yXeucBJqCpDi3mO8Fy2/pWgBl/nQOS9dJic0VyrbMzSD
 oI+Ou7GaQf/XpysrTeU/p+CO1P2OH8ySt2WklHnP99Z5rtLKIXdV1HzyAOiTOBRQduLG
 8qiz2+4s72+AmXk9gHBcmjUjS5399RjIq36iOzg/4VXokjl72kkVlzP9T0YAXGQOjf6u
 xixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785314633; x=1785919433;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Vvg68bKxrL5Ce5l0Fzz15atPeSR6nFwUSrrYBxvR6Cc=;
 b=aVvyUGqWaH0m6V+MODRIb6RkNjU2DcP2wfbBR4llAO1ehbLHaahDIxe5Rc4lTrNITS
 2MsMva00k24fuIQ5gNNf5efLCg5Y0GlydaCOGxR9Wp88vA6Nt35R+JmgSqdjgxN2dZ76
 x63iI6cXUz8brlj0JvDF2z22vDxOnLuUVVpB8XNGyM8tu5I3GyxGDdkk0Ge2OPE296hP
 xKCntJszSITE8oc8DFraHnA/L8+PMfd8JyjSocngtN50FAFEaM8HGQUkJy3qpf00+nLA
 0t6EW+sk1SkpEi7YvfPmLjCKZnWDOFdn7SfQiP1A/n52uRMNWavv9E7A0mUbicI6Aluw
 lexw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrhi5GeFyIibqdUsx1lBRUi52KEV7C6nJFpv7g81bQohaHh7Xzx/UOT9AbuAXBe9VmijuvbCgiDYvhg@nongnu.org
X-Gm-Message-State: AOJu0YxZyGh3cqMM64oh9v1h47meCd4I2wgVWgO4LTgqBGUYbd9JEIip
 G5c6r9hN3OGM7lz0fXTM884ocJ5GdJ265X5SpBvAlhmyhHU9290ApCPO
X-Gm-Gg: AR+sD10AcJGZC2L5qLOcBOxckVpuYeIaf/5HzINoqLv7SMFHZSWh5S6DibEiSxpzzBp
 arL/p33GYeDzTZpN87M5s3vpSC7FgFc0aoyJ6hzgDfDS1nKpP801mjp/QMm69LoKgXJxTvM5W1W
 CWdbN6HTbgCvtrY51pExAMMKZBpTVYvgDJTUL8nLBUGwbhX830pyjvhM+LQMSiweGtTD5BwQbDQ
 t3MWpfZcSVPRtWI8kiSEKOYQdjgUvdDWlr5n9SzXahuy1D0tkrdT9crpQ5ieus+y0MO4CU2PYGc
 3I3xtIhFxGTCr7ZFNXqr4W9U01UBDDvmDK3KxxUuqf1Bc7SEAaVXVtHd42zzjtcE7zgZQn+Iadx
 kmLodRp39ib09Acm3eW4YOcK72SCGQVVQUjzLJipKdmjr5utwyY8pczDC3+CgTb9cxZXevftWHQ
 BtMKHrdB3GXx/8bur5ln3vWE6Y1Rpc7CJPMH0hp0b77h99wBmCwrS7VoRI62tTSSwZSUnbPGXlw
 ixS8X2RYLGf0WzuWi7MSHqQBAo=
X-Received: by 2002:a05:6a21:7308:b0:3c3:8651:b302 with SMTP id
 adf61e73a8af0-3c8ab0e5996mr6885251637.28.1785314633056; 
 Wed, 29 Jul 2026 01:43:53 -0700 (PDT)
Received: from localhost ([179.255.148.148]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13e7271f0ddsm7067198c88.11.2026.07.29.01.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 01:43:52 -0700 (PDT)
Date: Wed, 29 Jul 2026 16:43:49 +0800
From: Chao Liu <chao.liu.zevorn@gmail.com>
To: Molly Chen <xiaoou@iscas.ac.cn>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, 
 Yin Zhang <zhangyin2018@iscas.ac.cn>, Dajun Huang <djhuang_1@std.uestc.edu.cn>,
 Zhiyuan Yang <zhiyuan.plct@isrc.iscas.ac.cn>
Subject: Re: [PATCH v2 01/18] target/riscv: Add packed SIMD extension state
Message-ID: <amm9KeayDq7M0tC1@ChaodeMacBook-Pro.local>
References: <cover.1784280142.git.xiaoou@iscas.ac.cn>
 <8b602c084875d5d5517958ffa3a25651c0bb41c1.1784280142.git.xiaoou@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b602c084875d5d5517958ffa3a25651c0bb41c1.1784280142.git.xiaoou@iscas.ac.cn>
Received-SPF: pass client-ip=2607:f8b0:4864:3b::1;
 envelope-from=chao.liu.zevorn@gmail.com; helo=mail-pz2-x01.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Jul 17, 2026 at 10:06:54AM +0800, Molly Chen wrote:
> Model vxsat with separate Vector/Zve and P-only control paths.  When
> Zve* is present, vxsat follows mstatus.VS/vsstatus.VS; when P is
> implemented without Zve*, stateen0.VXSAT controls access instead.
> 
> Record the P-only stateen result in TB flags so cached translations
> preserve both instruction legality and the illegal-vs-virtual exception
> class.
> 
> Co-authored-by: Yin Zhang <zhangyin2018@iscas.ac.cn>
> Co-authored-by: Dajun Huang <djhuang_1@std.uestc.edu.cn>
> Co-authored-by: Zhiyuan Yang <zhiyuan.plct@isrc.iscas.ac.cn>
> 
> Signed-off-by: Molly Chen <xiaoou@iscas.ac.cn>
Reviewed-by: Chao Liu <chao.liu@processmission.com>

Thanks,
Chao

> ---
>  target/riscv/cpu.c         |  5 ++--
>  target/riscv/cpu.h         |  8 +++++++
>  target/riscv/cpu_bits.h    |  2 ++
>  target/riscv/machine.c     | 19 +++++++++++++++
>  target/riscv/tcg/csr.c     | 39 +++++++++++++++++++++++++++++--
>  target/riscv/tcg/tcg-cpu.c | 48 ++++++++++++++++++++++++++++++++++++++
>  6 files changed, 117 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5a82e6563bf..c9e6c83a491 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -46,7 +46,7 @@
>  /* RISC-V CPU definitions */
>  static const char riscv_single_letter_exts[] = "IEMAFDQCBPVH";
>  const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
> -                              RVC, RVS, RVU, RVH, RVG, RVB, 0};
> +                              RVC, RVS, RVU, RVH, RVG, RVB, RVP, 0};
>  #define RISCV_CPU_MVENDORID 0
>  #define RISCV_CPU_MIMPID 0
>  /*
> @@ -1489,7 +1489,8 @@ static const MISAExtInfo misa_ext_info_arr[] = {
>      MISA_EXT_INFO(RVH, "h", "Hypervisor"),
>      MISA_EXT_INFO(RVV, "v", "Vector operations"),
>      MISA_EXT_INFO(RVG, "g", "General purpose (IMAFD_Zicsr_Zifencei)"),
> -    MISA_EXT_INFO(RVB, "b", "Bit manipulation (Zba_Zbb_Zbs)")
> +    MISA_EXT_INFO(RVB, "b", "Bit manipulation (Zba_Zbb_Zbs)"),
> +    MISA_EXT_INFO(RVP, "x-p", "Packed-SIMD instructions")
>  };
>  
>  static void riscv_cpu_validate_misa_mxl(RISCVCPUClass *mcc)
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index c9dfa7daff2..75cfb16d846 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -70,6 +70,7 @@ typedef struct CPUArchState CPURISCVState;
>  #define RVG RV('G')
>  #define RVB RV('B')
>  #define RVX RV('X')
> +#define RVP RV('P')
>  
>  extern const uint32_t misa_bits[];
>  const char *riscv_get_misa_ext_name(uint32_t bit);
> @@ -742,6 +743,13 @@ FIELD(TB_FLAGS, PM_SIGNEXTEND, 31, 1)
>  FIELD(EXT_TB_FLAGS, MISA_EXT, 0, 32)
>  FIELD(EXT_TB_FLAGS, ALTFMT, 32, 1)
>  FIELD(EXT_TB_FLAGS, BIG_ENDIAN, 33, 1)
> +FIELD(EXT_TB_FLAGS, P_VXSAT_EXCP, 34, 2)
> +
> +enum {
> +    P_VXSAT_EXCP_NONE,
> +    P_VXSAT_EXCP_ILLEGAL,
> +    P_VXSAT_EXCP_VIRTUAL,
> +};
>  
>  #ifdef TARGET_RISCV32
>  #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 3f146a43fe4..fa7bf60f4fc 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -355,6 +355,8 @@
>  #define SMSTATEEN0_CS       (1ULL << 0)
>  #define SMSTATEEN0_FCSR     (1ULL << 1)
>  #define SMSTATEEN0_JVT      (1ULL << 2)
> +/* Packed-SIMD draft: enable access to vxsat when misa.V = 0. */
> +#define SMSTATEEN0_VXSAT    (1ULL << 3)
>  #define SMSTATEEN0_CTR      (1ULL << 54)
>  #define SMSTATEEN0_P1P13    (1ULL << 56)
>  #define SMSTATEEN0_HSCONTXT (1ULL << 57)
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 0ab613a2980..a9cd7e4c1cc 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -158,6 +158,24 @@ static const VMStateDescription vmstate_vector = {
>      }
>  };
>  
> +static bool p_vxsat_needed(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
> +
> +    return riscv_has_ext(&cpu->env, RVP) && !cpu->cfg.ext_zve32x;
> +}
> +
> +static const VMStateDescription vmstate_p_vxsat = {
> +    .name = "cpu/p-vxsat",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = p_vxsat_needed,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_UINT8(env.vxsat, RISCVCPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static bool pointermasking_needed(void *opaque)
>  {
>      return false;
> @@ -518,6 +536,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>          &vmstate_pmp,
>          &vmstate_hyper,
>          &vmstate_vector,
> +        &vmstate_p_vxsat,
>          &vmstate_pointermasking,
>          &vmstate_rv128,
>  #ifdef CONFIG_KVM
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index 36f2004bc56..e809997f52e 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -109,6 +109,24 @@ static RISCVException vs(CPURISCVState *env, int csrno)
>      return RISCV_EXCP_ILLEGAL_INST;
>  }
>  
> +/* vxsat is also architectural state when P is implemented without Zve*. */
> +static RISCVException vxsat(CPURISCVState *env, int csrno)
> +{
> +    if (riscv_cpu_cfg(env)->ext_zve32x) {
> +        return vs(env, csrno);
> +    }
> +
> +    if (riscv_has_ext(env, RVP)) {
> +#if !defined(CONFIG_USER_ONLY)
> +        return smstateen_acc_ok(env, 0, SMSTATEEN0_VXSAT);
> +#else
> +        return RISCV_EXCP_NONE;
> +#endif
> +    }
> +
> +    return RISCV_EXCP_ILLEGAL_INST;
> +}
> +
>  static RISCVException ctr(CPURISCVState *env, int csrno)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> @@ -1013,7 +1031,12 @@ static RISCVException write_vxsat(CPURISCVState *env, int csrno,
>                                    target_ulong val, uintptr_t ra)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->mstatus |= MSTATUS_VS;
> +    if (riscv_cpu_cfg(env)->ext_zve32x) {
> +        env->mstatus |= MSTATUS_VS;
> +        if (env->virt_enabled) {
> +            env->mstatus_hs |= MSTATUS_VS;
> +        }
> +    }
>  #endif
>      env->vxsat = val & BIT(0);
>      return RISCV_EXCP_NONE;
> @@ -3494,6 +3517,10 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
>                                        target_ulong new_val, uintptr_t ra)
>  {
>      uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> +
> +    if (riscv_has_ext(env, RVP) && !riscv_cpu_cfg(env)->ext_zve32x) {
> +        wr_mask |= SMSTATEEN0_VXSAT;
> +    }
>      if (!riscv_has_ext(env, RVF)) {
>          wr_mask |= SMSTATEEN0_FCSR;
>      }
> @@ -3617,6 +3644,10 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
>  {
>      uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>  
> +    if (riscv_has_ext(env, RVP) && !riscv_cpu_cfg(env)->ext_zve32x) {
> +        wr_mask |= SMSTATEEN0_VXSAT;
> +    }
> +
>      if (!riscv_has_ext(env, RVF)) {
>          wr_mask |= SMSTATEEN0_FCSR;
>      }
> @@ -3746,6 +3777,10 @@ static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
>  {
>      uint64_t wr_mask = 0;
>  
> +    if (riscv_has_ext(env, RVP) && !riscv_cpu_cfg(env)->ext_zve32x) {
> +        wr_mask |= SMSTATEEN0_VXSAT;
> +    }
> +
>      if (!riscv_has_ext(env, RVF)) {
>          wr_mask |= SMSTATEEN0_FCSR;
>      }
> @@ -5916,7 +5951,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_FCSR]     = { "fcsr",     fs,     read_fcsr,    write_fcsr   },
>      /* Vector CSRs */
>      [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart },
> -    [CSR_VXSAT]    = { "vxsat",    vs,     read_vxsat,   write_vxsat  },
> +    [CSR_VXSAT]    = { "vxsat",    vxsat,  read_vxsat,   write_vxsat  },
>      [CSR_VXRM]     = { "vxrm",     vs,     read_vxrm,    write_vxrm   },
>      [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr   },
>      [CSR_VL]       = { "vl",       vs,     read_vl                    },
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 4af5cd9c731..1665583accf 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -160,6 +160,8 @@ static TCGTBCPUState riscv_get_tb_cpu_state(CPUState *cs)
>      fs = EXT_STATUS_DIRTY;
>      vs = EXT_STATUS_DIRTY;
>  #else
> +    RISCVException p_vxsat_excp;
> +
>      flags = FIELD_DP32(flags, TB_FLAGS, PRIV, env->priv);
>  
>      flags |= riscv_env_mmu_index(env, 0);
> @@ -182,6 +184,23 @@ static TCGTBCPUState riscv_get_tb_cpu_state(CPUState *cs)
>               ? EXT_STATUS_DIRTY : EXT_STATUS_DISABLED;
>      }
>  
> +    /*
> +     * Without Zve*, all P instructions in the OP-32 and OP-IMM-32
> +     * spaces are controlled by stateen0.VXSAT.  Preserve the exception
> +     * class in the TB flags so translated code can distinguish an illegal
> +     * instruction from a virtual-instruction exception.
> +     */
> +    p_vxsat_excp = smstateen_acc_ok(env, 0, SMSTATEEN0_VXSAT);
> +    if (riscv_has_ext(env, RVP) && !riscv_cpu_cfg(env)->ext_zve32x) {
> +        if (p_vxsat_excp == RISCV_EXCP_VIRT_INSTRUCTION_FAULT) {
> +            ext_flags = FIELD_DP64(ext_flags, EXT_TB_FLAGS, P_VXSAT_EXCP,
> +                                   P_VXSAT_EXCP_VIRTUAL);
> +        } else if (p_vxsat_excp != RISCV_EXCP_NONE) {
> +            ext_flags = FIELD_DP64(ext_flags, EXT_TB_FLAGS, P_VXSAT_EXCP,
> +                                   P_VXSAT_EXCP_ILLEGAL);
> +        }
> +    }
> +
>      if (cpu->cfg.debug && !icount_enabled()) {
>          flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
>      }
> @@ -530,6 +549,28 @@ static void riscv_cpu_validate_b(RISCVCPU *cpu)
>      }
>  }
>  
> +static void riscv_cpu_validate_p(RISCVCPU *cpu, Error **errp)
> +{
> +    CPURISCVState *env = &cpu->env;
> +
> +    if (!riscv_has_ext(env, RVP)) {
> +        return;
> +    }
> +
> +    if (riscv_cpu_mxl(env) != MXL_RV32 &&
> +        riscv_cpu_mxl(env) != MXL_RV64) {
> +        error_setg(errp, "P extension requires RV32 or RV64");
> +        return;
> +    }
> +
> +    if (!(cpu->cfg.ext_zmmul && cpu->cfg.ext_zba && cpu->cfg.ext_zbb &&
> +          cpu->cfg.ext_zbkb)) {
> +        error_setg(errp, "P extension requires zmmul, zba, zbb and zbkb "
> +                         "extensions");
> +        return;
> +    }
> +}
> +
>  /*
>   * Check consistency between chosen extensions while setting
>   * cpu->cfg accordingly.
> @@ -612,6 +653,12 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>          return;
>      }
>  
> +    riscv_cpu_validate_p(cpu, &local_err);
> +    if (local_err != NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
>      riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
>      if (local_err != NULL) {
>          error_propagate(errp, local_err);
> @@ -1414,6 +1461,7 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
>      MISA_CFG(RVV, false),
>      MISA_CFG(RVG, false),
>      MISA_CFG(RVB, false),
> +    MISA_CFG(RVP, false),
>  };
>  
>  /*
> -- 
> 2.34.1
> 

