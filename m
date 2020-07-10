Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtwnE-0004iy-A2
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 13:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtwnC-0004if-DJ
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 13:26:34 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:43924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtwnA-0006Yk-DG
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 13:26:34 -0400
Received: by mail-pl1-x633.google.com with SMTP id x8so2514510plm.10
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 10:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QB6DiqynFawFO7XR6DPmKDqa+G0c6yTUL4HGbuFrEEs=;
 b=eKxV11pYWztgBgXipjYgljUPgbfURUQsmDn9hkj4gHaBDLogjJoNMOqtSsKV4WL4rz
 Jzd37td18xg3R7vD9GYos7+k6Nft76LS27N7+CZX5mqpXCxAHBGdmDaDUTknP1a4llgd
 P6Vs14vOWlQeftws7Yi48SrY0Bl72X4cqwDwyZDuPuXqTd5nf+zBKFBLlZXz2F0rRHz4
 JfN6DKO6BjyOWl26efRwek01c08pnIQ68VFi0oTFGtZsgZNeLGv7uAiGfJJf25D0Tp3j
 nwvZ3KPviBgLSNQhhkCQEn4CecHGBjTZlAG/aF1kjbBqM4g4mcR12XdzWZ58pv0kenUg
 cwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QB6DiqynFawFO7XR6DPmKDqa+G0c6yTUL4HGbuFrEEs=;
 b=GY4Q5w3N+X4Oh+9WzIALKBIRBiHrvGNS6d5LgWGZ+HD+Ge66fhoe3kU0sDX0mKcQgu
 wAnb6Tqv1ZE4Gh6Lfl6zfOFz8aoo3x1aJa+YwWky+5sqFFProy2sutZ/LRU3xXNV4hgQ
 h+JN5k6bIjx65KvMPBZaSnEZ3R0omn29h71PzR5DAtwqBo0kRQZeWt6NcUtbjZ6sjJYr
 dKFuo8JdglKDmG1vcByApbFfVWxn83A8VgyOC25b4pf/ZeAsy7Yhq7ym0G4fvKztcy1p
 aUednq/kguerWN4hMAn+J6JfJ+Dorak/JUYIKQANg+lVPgwCAbVxKdw95Ky4VU1vIDuG
 1/jA==
X-Gm-Message-State: AOAM531ZYAR1mVsFnEQET/LVR+5dEEkcaMqCJ+NeX6WoLFaDM3J8GfNt
 +Prz2t8PFdRdPzROP0CFhahfIA==
X-Google-Smtp-Source: ABdhPJxcBj7dyPDIQGpsLJhSLgiHjlbH2/LPFHVtES76TgxDHtHS8Sk6CmIe6YP8nxncKggtTPJCow==
X-Received: by 2002:a17:902:6194:: with SMTP id
 u20mr61787333plj.333.1594401990677; 
 Fri, 10 Jul 2020 10:26:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id t184sm6771331pfd.49.2020.07.10.10.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 10:26:29 -0700 (PDT)
Subject: Re: [RFC 07/65] target/riscv: rvv-0.9: add vector context status
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <20200710104920.13550-8-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c4f3a769-c0d3-d965-4216-d31bad2a8206@linaro.org>
Date: Fri, 10 Jul 2020 10:26:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200710104920.13550-8-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 10 Jul 2020 17:26:34 -0000

On 7/10/20 3:48 AM, frank.chang@sifive.com wrote:
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -376,6 +376,7 @@
>  #define MSTATUS_SPP         0x00000100
>  #define MSTATUS_MPP         0x00001800
>  #define MSTATUS_FS          0x00006000
> +#define MSTATUS_VS          0x00000600
>  #define MSTATUS_XS          0x00018000

Please sort VS up below SPP, so that the bits are in order.

> @@ -180,6 +180,7 @@ static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
>          return -1;
>      }
>      env->mstatus |= MSTATUS_FS;
> +    env->mstatus |= MSTATUS_VS;
>  #endif
>      env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
>      if (vs(env, csrno) >= 0) {

Does rvv 0.9 still have the vector fields in FCSR, or are they only present in
the new VCSR?

> @@ -420,7 +442,7 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
>      mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
>          MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
>          MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
> -        MSTATUS_TW;
> +        MSTATUS_TW | MSTATUS_VS;

Since 0.7.1 does not have the VS field, you might want to force VS to dirty in
the written mstatus.  Correspondingly, you should remove VS from the returned
mstatus in read_mstatus.

You appear to be missing a change to riscv_cpu_swap_hypervisor_regs.

That makes all of the riscv_cpu_vector_enabled checks return true for 0.7.1,
which afaik is correct.

> @@ -245,7 +250,9 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
>      data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
> -    return ldst_us_trans(a->rd, a->rs1, data, fn, s);
> +    ret = ldst_us_trans(a->rd, a->rs1, data, fn, s);
> +    mark_vs_dirty(s);
> +    return ret;

Just push the mark_vs_dirty call into ldst_us_trans.

> @@ -382,7 +390,9 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
>      data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
> -    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
> +    ret  = ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
> +    mark_vs_dirty(s);
> +    return ret;

Likewise.

> @@ -510,7 +521,9 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
>      data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
> -    return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
> +    ret = ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
> +    mark_vs_dirty(s);
> +    return ret;

Likewise.

> @@ -632,7 +646,9 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
>      data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
> -    return ldff_trans(a->rd, a->rs1, data, fn, s);
> +    ret = ldff_trans(a->rd, a->rs1, data, fn, s);
> +    mark_vs_dirty(s);

Likewise.

> @@ -741,7 +758,9 @@ static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
>      data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>      data = FIELD_DP32(data, VDATA, WD, a->wd);
> -    return amo_trans(a->rd, a->rs1, a->rs2, data, fn, s);
> +    ret = amo_trans(a->rd, a->rs1, a->rs2, data, fn, s);
> +    mark_vs_dirty(s);
> +    return ret;

Likewise.

> @@ -911,9 +932,12 @@ do_opivx_gvec(DisasContext *s, arg_rmrr *a, GVecGen2sFn *gvec_fn,
>  
>          tcg_temp_free_i64(src1);
>          tcg_temp_free(tmp);
> +        mark_vs_dirty(s);
>          return true;
>      }
> -    return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
> +    ret = opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
> +    mark_vs_dirty(s);
> +    return ret;

Likewise.  And more.

> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 9632e79cf3..a806e33301 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -47,6 +47,7 @@ typedef struct DisasContext {
>      bool virt_enabled;
>      uint32_t opcode;
>      uint32_t mstatus_fs;
> +    uint32_t mstatus_vs;

Missing a change to riscv_tr_init_disas_context to initialize this.


r~

