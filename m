Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm4PV-000514-Ni
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 23:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm4PU-00050o-RT; Mon, 10 Apr 2023 23:11:08 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm4PT-0003eS-4K; Mon, 10 Apr 2023 23:11:08 -0400
Received: by mail-vs1-xe32.google.com with SMTP id a9so6583513vsh.3;
 Mon, 10 Apr 2023 20:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681182665; x=1683774665;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oLN810FGbo5txcsl2HoEjRf02km+zZawY63pnHgz2vY=;
 b=qzRZ0xAud4zG7HM9yKom5fy87PKaaGgWPO8M2BrOW74lwvl5IssuHjLekavOBEFxVk
 ynCmpifUpG9fGdpbEDBqybFGchj4QPwSkwXrNbnxYhHHTdeefy88JKl3ZTBqo7OXGdRu
 qEkpnj80PG2d0dohhY/8lTqE7qSAwFJbrQfqN8l4Vc65ZY/kPodf8NzW/W5fFsBYBVtx
 EZJn/w2e4Ybnc0FDXIZ5w+5PVQix15v+S+utLVSmCCY6K+9VpBqyiLO3H0kSEX7aRo7q
 6jodas0rWx5VnaesYJObgm2mQJSJF66ThhXdiuYJoB2RF6qgABpeY+4TckDIpvaC1zyk
 bHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681182665; x=1683774665;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oLN810FGbo5txcsl2HoEjRf02km+zZawY63pnHgz2vY=;
 b=ybK2+WEPpKiCJpFq6fYrJrnVyMXtBaYXuP2NjauUH11sXItS/tmUU5ui/KgziyfPEp
 K0NgdoSj904ZKopF1qJS+eGJN00LZ//0cPAVmPiIVan8D/nfC93kJrpjHjdnk7TO1qo4
 cLYGw55qHNy4aGql0zMSBPpw3GWJR7jLlZNMOcNpTbWTkxSPIfwIm27x68Xg2v9yO3cD
 tPVNOgZi7/wcY9sGs0UPsw9lf77ifIbThOVTThBuzhB0Cqgwgw2ybSRy5Oe5yLGkA6qP
 QOZsBndkHJr5MXdlWKQA21xkcIO3BaNqXpHYmL0PIW9Ia4mezV3K2Z7LjA8whhUMEfVE
 esJA==
X-Gm-Message-State: AAQBX9cfts/w0IUDuey78Kp1YYruPhsEJQ6ug/h7wcMkRNCHvZn/BuLH
 g7mzhrcpSgzvzCk0zA6fvG5SYAioq23W/5LGMTMSvpmTNRo=
X-Google-Smtp-Source: AKy350ar7My7EHXDZcAEv7E1LFpNaBr2AispRSqxbaCTgD12O7NTv1+Q1WXOgOJvJuDcbkKM7f44No2Eha8g3s55m10=
X-Received: by 2002:a67:ca06:0:b0:422:1654:7737 with SMTP id
 z6-20020a67ca06000000b0042216547737mr909513vsk.3.1681182665666; Mon, 10 Apr
 2023 20:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-9-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-9-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 13:10:39 +1000
Message-ID: <CAKmqyKP5AyhYrXncgmWVgjcz3WFwPPK6B+xauvqWV5hyrKszMQ@mail.gmail.com>
Subject: Re: [PATCH v6 08/25] accel/tcg: Add cpu_ld*_code_mmu
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 03:11:09 -0000

On Sat, Mar 25, 2023 at 9:52=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> At least RISC-V has the need to be able to perform a read
> using execute permissions, outside of translation.
> Add helpers to facilitate this.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/exec/cpu_ldst.h |  9 +++++++
>  accel/tcg/cputlb.c      | 48 ++++++++++++++++++++++++++++++++++
>  accel/tcg/user-exec.c   | 58 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 115 insertions(+)
>
> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> index 09b55cc0ee..c141f0394f 100644
> --- a/include/exec/cpu_ldst.h
> +++ b/include/exec/cpu_ldst.h
> @@ -445,6 +445,15 @@ static inline CPUTLBEntry *tlb_entry(CPUArchState *e=
nv, uintptr_t mmu_idx,
>  # define cpu_stq_mmu          cpu_stq_le_mmu
>  #endif
>
> +uint8_t cpu_ldb_code_mmu(CPUArchState *env, abi_ptr addr,
> +                         MemOpIdx oi, uintptr_t ra);
> +uint16_t cpu_ldw_code_mmu(CPUArchState *env, abi_ptr addr,
> +                          MemOpIdx oi, uintptr_t ra);
> +uint32_t cpu_ldl_code_mmu(CPUArchState *env, abi_ptr addr,
> +                          MemOpIdx oi, uintptr_t ra);
> +uint64_t cpu_ldq_code_mmu(CPUArchState *env, abi_ptr addr,
> +                          MemOpIdx oi, uintptr_t ra);
> +
>  uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr addr);
>  uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr addr);
>  uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr addr);
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index e984a98dc4..e62c8f3c3f 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -2768,3 +2768,51 @@ uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr a=
ddr)
>      MemOpIdx oi =3D make_memop_idx(MO_TEUQ, cpu_mmu_index(env, true));
>      return full_ldq_code(env, addr, oi, 0);
>  }
> +
> +uint8_t cpu_ldb_code_mmu(CPUArchState *env, abi_ptr addr,
> +                         MemOpIdx oi, uintptr_t retaddr)
> +{
> +    return full_ldub_code(env, addr, oi, retaddr);
> +}
> +
> +uint16_t cpu_ldw_code_mmu(CPUArchState *env, abi_ptr addr,
> +                          MemOpIdx oi, uintptr_t retaddr)
> +{
> +    MemOp mop =3D get_memop(oi);
> +    int idx =3D get_mmuidx(oi);
> +    uint16_t ret;
> +
> +    ret =3D full_lduw_code(env, addr, make_memop_idx(MO_TEUW, idx), reta=
ddr);
> +    if ((mop & MO_BSWAP) !=3D MO_TE) {
> +        ret =3D bswap16(ret);
> +    }
> +    return ret;
> +}
> +
> +uint32_t cpu_ldl_code_mmu(CPUArchState *env, abi_ptr addr,
> +                          MemOpIdx oi, uintptr_t retaddr)
> +{
> +    MemOp mop =3D get_memop(oi);
> +    int idx =3D get_mmuidx(oi);
> +    uint32_t ret;
> +
> +    ret =3D full_ldl_code(env, addr, make_memop_idx(MO_TEUL, idx), retad=
dr);
> +    if ((mop & MO_BSWAP) !=3D MO_TE) {
> +        ret =3D bswap32(ret);
> +    }
> +    return ret;
> +}
> +
> +uint64_t cpu_ldq_code_mmu(CPUArchState *env, abi_ptr addr,
> +                          MemOpIdx oi, uintptr_t retaddr)
> +{
> +    MemOp mop =3D get_memop(oi);
> +    int idx =3D get_mmuidx(oi);
> +    uint64_t ret;
> +
> +    ret =3D full_ldq_code(env, addr, make_memop_idx(MO_TEUQ, idx), retad=
dr);
> +    if ((mop & MO_BSWAP) !=3D MO_TE) {
> +        ret =3D bswap64(ret);
> +    }
> +    return ret;
> +}
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 7b37fd229e..44e0ea55ba 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -1222,6 +1222,64 @@ uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr p=
tr)
>      return ret;
>  }
>
> +uint8_t cpu_ldb_code_mmu(CPUArchState *env, abi_ptr addr,
> +                         MemOpIdx oi, uintptr_t ra)
> +{
> +    void *haddr;
> +    uint8_t ret;
> +
> +    haddr =3D cpu_mmu_lookup(env, addr, oi, ra, MMU_INST_FETCH);
> +    ret =3D ldub_p(haddr);
> +    clear_helper_retaddr();
> +    return ret;
> +}
> +
> +uint16_t cpu_ldw_code_mmu(CPUArchState *env, abi_ptr addr,
> +                          MemOpIdx oi, uintptr_t ra)
> +{
> +    void *haddr;
> +    uint16_t ret;
> +
> +    haddr =3D cpu_mmu_lookup(env, addr, oi, ra, MMU_INST_FETCH);
> +    ret =3D lduw_p(haddr);
> +    clear_helper_retaddr();
> +    if (get_memop(oi) & MO_BSWAP) {
> +        ret =3D bswap16(ret);
> +    }
> +    return ret;
> +}
> +
> +uint32_t cpu_ldl_code_mmu(CPUArchState *env, abi_ptr addr,
> +                          MemOpIdx oi, uintptr_t ra)
> +{
> +    void *haddr;
> +    uint32_t ret;
> +
> +    haddr =3D cpu_mmu_lookup(env, addr, oi, ra, MMU_INST_FETCH);
> +    ret =3D ldl_p(haddr);
> +    clear_helper_retaddr();
> +    if (get_memop(oi) & MO_BSWAP) {
> +        ret =3D bswap32(ret);
> +    }
> +    return ret;
> +}
> +
> +uint64_t cpu_ldq_code_mmu(CPUArchState *env, abi_ptr addr,
> +                          MemOpIdx oi, uintptr_t ra)
> +{
> +    void *haddr;
> +    uint64_t ret;
> +
> +    validate_memop(oi, MO_BEUQ);
> +    haddr =3D cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
> +    ret =3D ldq_p(haddr);
> +    clear_helper_retaddr();
> +    if (get_memop(oi) & MO_BSWAP) {
> +        ret =3D bswap64(ret);
> +    }
> +    return ret;
> +}
> +
>  #include "ldst_common.c.inc"
>
>  /*
> --
> 2.34.1
>
>

