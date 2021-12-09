Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mv82E-0006GG-83
	for mharc-qemu-riscv@gnu.org; Wed, 08 Dec 2021 20:15:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mv82B-0006Ei-QW; Wed, 08 Dec 2021 20:15:43 -0500
Received: from [2607:f8b0:4864:20::d35] (port=39905
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mv827-0003sg-7s; Wed, 08 Dec 2021 20:15:43 -0500
Received: by mail-io1-xd35.google.com with SMTP id c3so4925970iob.6;
 Wed, 08 Dec 2021 17:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+odEpQ93jpttJsliudPGcPnvL+Syw1CZSs/J7uccFF0=;
 b=ZxGZa3C7cnEPhvHG1jFAG/aT6cSRn1J+EGO+MQ/VbvF+2MKabw64Xzmn/eO1t3KxT9
 Sk1fx/PVamaXIKMyZHpkjJttDXX0JeOu4PLq1++oOEV/dGA1i6BrI4cfxcWY/psX1B+m
 VE+9tx+x5UTP4nsQU4PBWyFsHYjwrCTcjXEU/kYA98w5ZXJUJcDP25x94xks4tKA25J6
 GD2Q8L013aa/dJDLeeDUmoHk/XMhFAevbbK73yZOpAjwTFX6mDZ2UWDcdRTxxq7Q+6I1
 N1GtbWyDAdEhYAWOWQfoLmiMgUj/Vl4DuxMBZeFkhUCpdS1tmv9Xbo6T2ufPsE7jmEmo
 51oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+odEpQ93jpttJsliudPGcPnvL+Syw1CZSs/J7uccFF0=;
 b=AL/cLMTD49xWw+apYZT1G65p7qMdNzDa7144IzX03xc6dWPEJlFmIcU94crS27h0Ao
 UryON10UeytV/bWtZ8v4UZdfXk0xCss3MwiO7aix0GcwmwQRv//P/vYN89c2DKF6B7eP
 sIr+U06M7oYQnkqAZ+GNuUaOmzP6gtaP3Ooir6rgart2LJhNx/NcqWn4SbgwLBGdQUyP
 eVsB+W97fD8CUNbNFV3TEY73PzklTQGha7nLjn2IpeNHtu+Bo4X/WGaQlTvAT9dZCRL2
 Cj9jUmmvtVuEQCrQNdFL99S784/ESk0Nlzr/WWKl1NRAKIDmw3niWqYEbcS7I66QBZGN
 78MQ==
X-Gm-Message-State: AOAM5323INx8/e8WV+LUhj6BvMB6lWeLUCG3lugQOcseOzDIHuELx0gi
 CxJb9LJK6bR60pStDSjAspnoZfj08K24DUB3eLA=
X-Google-Smtp-Source: ABdhPJxaD9wFdMoNAQHnC1M05X6iDSwCucQ11OF1yt9QSGAK9Y0idVkd9fr9hrb/z9Mgxy6xnjM0jPlYw7kG0/ZOJhY=
X-Received: by 2002:a05:6602:1487:: with SMTP id
 a7mr10814787iow.57.1639012535320; 
 Wed, 08 Dec 2021 17:15:35 -0800 (PST)
MIME-Version: 1.0
References: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211128135719.50444-2-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20211128135719.50444-2-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Dec 2021 11:15:08 +1000
Message-ID: <CAKmqyKP_3PJd-YTx_p5xyu+4Ss=Wvg5DgN7es9QM_fjDnPpJUA@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] exec/memop: Adding signedness to quad definitions
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 09 Dec 2021 01:15:44 -0000

On Sun, Nov 28, 2021 at 11:59 PM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> Renaming defines for quad in their various forms so that their signedness=
 is
> now explicit.
> Done using git grep as suggested by Philippe, with a bit of hand edition =
to
> keep assignments aligned.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/exec/memop.h                       |  8 +--
>  include/tcg/tcg-op.h                       |  4 +-
>  target/arm/translate-a32.h                 |  4 +-
>  accel/tcg/cputlb.c                         | 30 +++++------
>  accel/tcg/user-exec.c                      |  8 +--
>  target/alpha/translate.c                   | 32 ++++++------
>  target/arm/helper-a64.c                    |  8 +--
>  target/arm/translate-a64.c                 |  8 +--
>  target/arm/translate-neon.c                |  6 +--
>  target/arm/translate-sve.c                 | 10 ++--
>  target/arm/translate-vfp.c                 |  8 +--
>  target/arm/translate.c                     |  2 +-
>  target/cris/translate.c                    |  2 +-
>  target/hppa/translate.c                    |  4 +-
>  target/i386/tcg/mem_helper.c               |  2 +-
>  target/i386/tcg/translate.c                | 36 +++++++-------
>  target/m68k/op_helper.c                    |  2 +-
>  target/mips/tcg/translate.c                | 58 +++++++++++-----------
>  target/mips/tcg/tx79_translate.c           |  8 +--
>  target/ppc/translate.c                     | 32 ++++++------
>  target/s390x/tcg/mem_helper.c              |  8 +--
>  target/s390x/tcg/translate.c               |  8 +--
>  target/sh4/translate.c                     | 12 ++---
>  target/sparc/translate.c                   | 36 +++++++-------
>  target/tricore/translate.c                 |  4 +-
>  target/xtensa/translate.c                  |  4 +-
>  tcg/tcg.c                                  |  4 +-
>  tcg/tci.c                                  | 16 +++---
>  accel/tcg/ldst_common.c.inc                |  8 +--
>  target/mips/tcg/micromips_translate.c.inc  | 10 ++--
>  target/ppc/translate/fixedpoint-impl.c.inc | 22 ++++----
>  target/ppc/translate/fp-impl.c.inc         |  4 +-
>  target/ppc/translate/vsx-impl.c.inc        | 42 ++++++++--------
>  target/riscv/insn_trans/trans_rva.c.inc    | 22 ++++----
>  target/riscv/insn_trans/trans_rvd.c.inc    |  4 +-
>  target/riscv/insn_trans/trans_rvh.c.inc    |  4 +-
>  target/riscv/insn_trans/trans_rvi.c.inc    |  4 +-
>  target/s390x/tcg/translate_vx.c.inc        | 18 +++----
>  tcg/aarch64/tcg-target.c.inc               |  2 +-
>  tcg/arm/tcg-target.c.inc                   | 10 ++--
>  tcg/i386/tcg-target.c.inc                  | 12 ++---
>  tcg/mips/tcg-target.c.inc                  | 12 ++---
>  tcg/ppc/tcg-target.c.inc                   | 16 +++---
>  tcg/riscv/tcg-target.c.inc                 |  6 +--
>  tcg/s390x/tcg-target.c.inc                 | 18 +++----
>  tcg/sparc/tcg-target.c.inc                 | 16 +++---
>  target/s390x/tcg/insn-data.def             | 28 +++++------
>  47 files changed, 311 insertions(+), 311 deletions(-)
>
> diff --git a/include/exec/memop.h b/include/exec/memop.h
> index 04264ffd6b..72c2f0ff3d 100644
> --- a/include/exec/memop.h
> +++ b/include/exec/memop.h
> @@ -85,29 +85,29 @@ typedef enum MemOp {
>      MO_UB    =3D MO_8,
>      MO_UW    =3D MO_16,
>      MO_UL    =3D MO_32,
> +    MO_UQ    =3D MO_64,
>      MO_SB    =3D MO_SIGN | MO_8,
>      MO_SW    =3D MO_SIGN | MO_16,
>      MO_SL    =3D MO_SIGN | MO_32,
> -    MO_Q     =3D MO_64,
>
>      MO_LEUW  =3D MO_LE | MO_UW,
>      MO_LEUL  =3D MO_LE | MO_UL,
> +    MO_LEUQ  =3D MO_LE | MO_UQ,
>      MO_LESW  =3D MO_LE | MO_SW,
>      MO_LESL  =3D MO_LE | MO_SL,
> -    MO_LEQ   =3D MO_LE | MO_Q,
>
>      MO_BEUW  =3D MO_BE | MO_UW,
>      MO_BEUL  =3D MO_BE | MO_UL,
> +    MO_BEUQ  =3D MO_BE | MO_UQ,
>      MO_BESW  =3D MO_BE | MO_SW,
>      MO_BESL  =3D MO_BE | MO_SL,
> -    MO_BEQ   =3D MO_BE | MO_Q,
>
>  #ifdef NEED_CPU_H
>      MO_TEUW  =3D MO_TE | MO_UW,
>      MO_TEUL  =3D MO_TE | MO_UL,
> +    MO_TEUQ  =3D MO_TE | MO_UQ,
>      MO_TESW  =3D MO_TE | MO_SW,
>      MO_TESL  =3D MO_TE | MO_SL,
> -    MO_TEQ   =3D MO_TE | MO_Q,
>  #endif
>
>      MO_SSIZE =3D MO_SIZE | MO_SIGN,
> diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
> index 0545a6224c..caa0a63612 100644
> --- a/include/tcg/tcg-op.h
> +++ b/include/tcg/tcg-op.h
> @@ -894,7 +894,7 @@ static inline void tcg_gen_qemu_ld32s(TCGv ret, TCGv =
addr, int mem_index)
>
>  static inline void tcg_gen_qemu_ld64(TCGv_i64 ret, TCGv addr, int mem_in=
dex)
>  {
> -    tcg_gen_qemu_ld_i64(ret, addr, mem_index, MO_TEQ);
> +    tcg_gen_qemu_ld_i64(ret, addr, mem_index, MO_TEUQ);
>  }
>
>  static inline void tcg_gen_qemu_st8(TCGv arg, TCGv addr, int mem_index)
> @@ -914,7 +914,7 @@ static inline void tcg_gen_qemu_st32(TCGv arg, TCGv a=
ddr, int mem_index)
>
>  static inline void tcg_gen_qemu_st64(TCGv_i64 arg, TCGv addr, int mem_in=
dex)
>  {
> -    tcg_gen_qemu_st_i64(arg, addr, mem_index, MO_TEQ);
> +    tcg_gen_qemu_st_i64(arg, addr, mem_index, MO_TEUQ);
>  }
>
>  void tcg_gen_atomic_cmpxchg_i32(TCGv_i32, TCGv, TCGv_i32, TCGv_i32,
> diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
> index 17af8dc95a..5be4b9b834 100644
> --- a/target/arm/translate-a32.h
> +++ b/target/arm/translate-a32.h
> @@ -117,13 +117,13 @@ void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val,=
 TCGv_i32 a32,
>  static inline void gen_aa32_ld64(DisasContext *s, TCGv_i64 val,
>                                   TCGv_i32 a32, int index)
>  {
> -    gen_aa32_ld_i64(s, val, a32, index, MO_Q);
> +    gen_aa32_ld_i64(s, val, a32, index, MO_UQ);
>  }
>
>  static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
>                                   TCGv_i32 a32, int index)
>  {
> -    gen_aa32_st_i64(s, val, a32, index, MO_Q);
> +    gen_aa32_st_i64(s, val, a32, index, MO_UQ);
>  }
>
>  DO_GEN_LD(8u, MO_UB)
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index b69a953447..5e0d0eebc3 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1885,9 +1885,9 @@ load_memop(const void *haddr, MemOp op)
>          return (uint32_t)ldl_be_p(haddr);
>      case MO_LEUL:
>          return (uint32_t)ldl_le_p(haddr);
> -    case MO_BEQ:
> +    case MO_BEUQ:
>          return ldq_be_p(haddr);
> -    case MO_LEQ:
> +    case MO_LEUQ:
>          return ldq_le_p(haddr);
>      default:
>          qemu_build_not_reached();
> @@ -2081,16 +2081,16 @@ tcg_target_ulong helper_be_ldul_mmu(CPUArchState =
*env, target_ulong addr,
>  uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
>                             MemOpIdx oi, uintptr_t retaddr)
>  {
> -    validate_memop(oi, MO_LEQ);
> -    return load_helper(env, addr, oi, retaddr, MO_LEQ, false,
> +    validate_memop(oi, MO_LEUQ);
> +    return load_helper(env, addr, oi, retaddr, MO_LEUQ, false,
>                         helper_le_ldq_mmu);
>  }
>
>  uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
>                             MemOpIdx oi, uintptr_t retaddr)
>  {
> -    validate_memop(oi, MO_BEQ);
> -    return load_helper(env, addr, oi, retaddr, MO_BEQ, false,
> +    validate_memop(oi, MO_BEUQ);
> +    return load_helper(env, addr, oi, retaddr, MO_BEUQ, false,
>                         helper_be_ldq_mmu);
>  }
>
> @@ -2166,7 +2166,7 @@ uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr =
addr,
>  uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
>                          MemOpIdx oi, uintptr_t ra)
>  {
> -    return cpu_load_helper(env, addr, oi, MO_BEQ, helper_be_ldq_mmu);
> +    return cpu_load_helper(env, addr, oi, MO_BEUQ, helper_be_ldq_mmu);
>  }
>
>  uint16_t cpu_ldw_le_mmu(CPUArchState *env, abi_ptr addr,
> @@ -2210,10 +2210,10 @@ store_memop(void *haddr, uint64_t val, MemOp op)
>      case MO_LEUL:
>          stl_le_p(haddr, val);
>          break;
> -    case MO_BEQ:
> +    case MO_BEUQ:
>          stq_be_p(haddr, val);
>          break;
> -    case MO_LEQ:
> +    case MO_LEUQ:
>          stq_le_p(haddr, val);
>          break;
>      default:
> @@ -2465,15 +2465,15 @@ void helper_be_stl_mmu(CPUArchState *env, target_=
ulong addr, uint32_t val,
>  void helper_le_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t va=
l,
>                         MemOpIdx oi, uintptr_t retaddr)
>  {
> -    validate_memop(oi, MO_LEQ);
> -    store_helper(env, addr, val, oi, retaddr, MO_LEQ);
> +    validate_memop(oi, MO_LEUQ);
> +    store_helper(env, addr, val, oi, retaddr, MO_LEUQ);
>  }
>
>  void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t va=
l,
>                         MemOpIdx oi, uintptr_t retaddr)
>  {
> -    validate_memop(oi, MO_BEQ);
> -    store_helper(env, addr, val, oi, retaddr, MO_BEQ);
> +    validate_memop(oi, MO_BEUQ);
> +    store_helper(env, addr, val, oi, retaddr, MO_BEUQ);
>  }
>
>  /*
> @@ -2609,11 +2609,11 @@ uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr =
addr)
>  static uint64_t full_ldq_code(CPUArchState *env, target_ulong addr,
>                                MemOpIdx oi, uintptr_t retaddr)
>  {
> -    return load_helper(env, addr, oi, retaddr, MO_TEQ, true, full_ldq_co=
de);
> +    return load_helper(env, addr, oi, retaddr, MO_TEUQ, true, full_ldq_c=
ode);
>  }
>
>  uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr addr)
>  {
> -    MemOpIdx oi =3D make_memop_idx(MO_TEQ, cpu_mmu_index(env, true));
> +    MemOpIdx oi =3D make_memop_idx(MO_TEUQ, cpu_mmu_index(env, true));
>      return full_ldq_code(env, addr, oi, 0);
>  }
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 1528a21fad..6f5d4933f0 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -294,7 +294,7 @@ uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr ad=
dr,
>      void *haddr;
>      uint64_t ret;
>
> -    validate_memop(oi, MO_BEQ);
> +    validate_memop(oi, MO_BEUQ);
>      trace_guest_ld_before_exec(env_cpu(env), addr, oi);
>      haddr =3D cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
>      ret =3D ldq_be_p(haddr);
> @@ -339,7 +339,7 @@ uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr ad=
dr,
>      void *haddr;
>      uint64_t ret;
>
> -    validate_memop(oi, MO_LEQ);
> +    validate_memop(oi, MO_LEUQ);
>      trace_guest_ld_before_exec(env_cpu(env), addr, oi);
>      haddr =3D cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
>      ret =3D ldq_le_p(haddr);
> @@ -392,7 +392,7 @@ void cpu_stq_be_mmu(CPUArchState *env, abi_ptr addr, =
uint64_t val,
>  {
>      void *haddr;
>
> -    validate_memop(oi, MO_BEQ);
> +    validate_memop(oi, MO_BEUQ);
>      trace_guest_st_before_exec(env_cpu(env), addr, oi);
>      haddr =3D cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
>      stq_be_p(haddr, val);
> @@ -431,7 +431,7 @@ void cpu_stq_le_mmu(CPUArchState *env, abi_ptr addr, =
uint64_t val,
>  {
>      void *haddr;
>
> -    validate_memop(oi, MO_LEQ);
> +    validate_memop(oi, MO_LEUQ);
>      trace_guest_st_before_exec(env_cpu(env), addr, oi);
>      haddr =3D cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
>      stq_le_p(haddr, val);
> diff --git a/target/alpha/translate.c b/target/alpha/translate.c
> index a4c3f43e72..369dd11ffb 100644
> --- a/target/alpha/translate.c
> +++ b/target/alpha/translate.c
> @@ -278,7 +278,7 @@ static void gen_ldf(DisasContext *ctx, TCGv dest, TCG=
v addr)
>  static void gen_ldg(DisasContext *ctx, TCGv dest, TCGv addr)
>  {
>      TCGv tmp =3D tcg_temp_new();
> -    tcg_gen_qemu_ld_i64(tmp, addr, ctx->mem_idx, MO_LEQ);
> +    tcg_gen_qemu_ld_i64(tmp, addr, ctx->mem_idx, MO_LEUQ);
>      gen_helper_memory_to_g(dest, tmp);
>      tcg_temp_free(tmp);
>  }
> @@ -293,7 +293,7 @@ static void gen_lds(DisasContext *ctx, TCGv dest, TCG=
v addr)
>
>  static void gen_ldt(DisasContext *ctx, TCGv dest, TCGv addr)
>  {
> -    tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_LEQ);
> +    tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_LEUQ);
>  }
>
>  static void gen_load_fp(DisasContext *ctx, int ra, int rb, int32_t disp1=
6,
> @@ -348,7 +348,7 @@ static void gen_stg(DisasContext *ctx, TCGv src, TCGv=
 addr)
>  {
>      TCGv tmp =3D tcg_temp_new();
>      gen_helper_g_to_memory(tmp, src);
> -    tcg_gen_qemu_st_i64(tmp, addr, ctx->mem_idx, MO_LEQ);
> +    tcg_gen_qemu_st_i64(tmp, addr, ctx->mem_idx, MO_LEUQ);
>      tcg_temp_free(tmp);
>  }
>
> @@ -362,7 +362,7 @@ static void gen_sts(DisasContext *ctx, TCGv src, TCGv=
 addr)
>
>  static void gen_stt(DisasContext *ctx, TCGv src, TCGv addr)
>  {
> -    tcg_gen_qemu_st_i64(src, addr, ctx->mem_idx, MO_LEQ);
> +    tcg_gen_qemu_st_i64(src, addr, ctx->mem_idx, MO_LEUQ);
>  }
>
>  static void gen_store_fp(DisasContext *ctx, int ra, int rb, int32_t disp=
16,
> @@ -1487,7 +1487,7 @@ static DisasJumpType translate_one(DisasContext *ct=
x, uint32_t insn)
>          break;
>      case 0x0B:
>          /* LDQ_U */
> -        gen_load_int(ctx, ra, rb, disp16, MO_LEQ, 1, 0);
> +        gen_load_int(ctx, ra, rb, disp16, MO_LEUQ, 1, 0);
>          break;
>      case 0x0C:
>          /* LDWU */
> @@ -1506,7 +1506,7 @@ static DisasJumpType translate_one(DisasContext *ct=
x, uint32_t insn)
>          break;
>      case 0x0F:
>          /* STQ_U */
> -        gen_store_int(ctx, ra, rb, disp16, MO_LEQ, 1);
> +        gen_store_int(ctx, ra, rb, disp16, MO_LEUQ, 1);
>          break;
>
>      case 0x10:
> @@ -2457,7 +2457,7 @@ static DisasJumpType translate_one(DisasContext *ct=
x, uint32_t insn)
>                  break;
>              case 0x1:
>                  /* Quadword physical access (hw_ldq/p) */
> -                tcg_gen_qemu_ld_i64(va, addr, MMU_PHYS_IDX, MO_LEQ);
> +                tcg_gen_qemu_ld_i64(va, addr, MMU_PHYS_IDX, MO_LEUQ);
>                  break;
>              case 0x2:
>                  /* Longword physical access with lock (hw_ldl_l/p) */
> @@ -2467,7 +2467,7 @@ static DisasJumpType translate_one(DisasContext *ct=
x, uint32_t insn)
>                  break;
>              case 0x3:
>                  /* Quadword physical access with lock (hw_ldq_l/p) */
> -                tcg_gen_qemu_ld_i64(va, addr, MMU_PHYS_IDX, MO_LEQ);
> +                tcg_gen_qemu_ld_i64(va, addr, MMU_PHYS_IDX, MO_LEUQ);
>                  tcg_gen_mov_i64(cpu_lock_addr, addr);
>                  tcg_gen_mov_i64(cpu_lock_value, va);
>                  break;
> @@ -2496,7 +2496,7 @@ static DisasJumpType translate_one(DisasContext *ct=
x, uint32_t insn)
>                  break;
>              case 0xB:
>                  /* Quadword virtual access with protection check (hw_ldq=
/w) */
> -                tcg_gen_qemu_ld_i64(va, addr, MMU_KERNEL_IDX, MO_LEQ);
> +                tcg_gen_qemu_ld_i64(va, addr, MMU_KERNEL_IDX, MO_LEUQ);
>                  break;
>              case 0xC:
>                  /* Longword virtual access with alt access mode (hw_ldl/=
a)*/
> @@ -2512,7 +2512,7 @@ static DisasJumpType translate_one(DisasContext *ct=
x, uint32_t insn)
>              case 0xF:
>                  /* Quadword virtual access with alternate access mode an=
d
>                     protection checks (hw_ldq/wa) */
> -                tcg_gen_qemu_ld_i64(va, addr, MMU_USER_IDX, MO_LEQ);
> +                tcg_gen_qemu_ld_i64(va, addr, MMU_USER_IDX, MO_LEUQ);
>                  break;
>              }
>              tcg_temp_free(addr);
> @@ -2725,7 +2725,7 @@ static DisasJumpType translate_one(DisasContext *ct=
x, uint32_t insn)
>                  vb =3D load_gpr(ctx, rb);
>                  tmp =3D tcg_temp_new();
>                  tcg_gen_addi_i64(tmp, vb, disp12);
> -                tcg_gen_qemu_st_i64(va, tmp, MMU_PHYS_IDX, MO_LEQ);
> +                tcg_gen_qemu_st_i64(va, tmp, MMU_PHYS_IDX, MO_LEUQ);
>                  tcg_temp_free(tmp);
>                  break;
>              case 0x2:
> @@ -2736,7 +2736,7 @@ static DisasJumpType translate_one(DisasContext *ct=
x, uint32_t insn)
>              case 0x3:
>                  /* Quadword physical access with lock */
>                  ret =3D gen_store_conditional(ctx, ra, rb, disp12,
> -                                            MMU_PHYS_IDX, MO_LEQ);
> +                                            MMU_PHYS_IDX, MO_LEUQ);
>                  break;
>              case 0x4:
>                  /* Longword virtual access */
> @@ -2826,7 +2826,7 @@ static DisasJumpType translate_one(DisasContext *ct=
x, uint32_t insn)
>          break;
>      case 0x29:
>          /* LDQ */
> -        gen_load_int(ctx, ra, rb, disp16, MO_LEQ, 0, 0);
> +        gen_load_int(ctx, ra, rb, disp16, MO_LEUQ, 0, 0);
>          break;
>      case 0x2A:
>          /* LDL_L */
> @@ -2834,7 +2834,7 @@ static DisasJumpType translate_one(DisasContext *ct=
x, uint32_t insn)
>          break;
>      case 0x2B:
>          /* LDQ_L */
> -        gen_load_int(ctx, ra, rb, disp16, MO_LEQ, 0, 1);
> +        gen_load_int(ctx, ra, rb, disp16, MO_LEUQ, 0, 1);
>          break;
>      case 0x2C:
>          /* STL */
> @@ -2842,7 +2842,7 @@ static DisasJumpType translate_one(DisasContext *ct=
x, uint32_t insn)
>          break;
>      case 0x2D:
>          /* STQ */
> -        gen_store_int(ctx, ra, rb, disp16, MO_LEQ, 0);
> +        gen_store_int(ctx, ra, rb, disp16, MO_LEUQ, 0);
>          break;
>      case 0x2E:
>          /* STL_C */
> @@ -2852,7 +2852,7 @@ static DisasJumpType translate_one(DisasContext *ct=
x, uint32_t insn)
>      case 0x2F:
>          /* STQ_C */
>          ret =3D gen_store_conditional(ctx, ra, rb, disp16,
> -                                    ctx->mem_idx, MO_LEQ);
> +                                    ctx->mem_idx, MO_LEUQ);
>          break;
>      case 0x30:
>          /* BR */
> diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
> index 5ae2ecb0f3..d6a6fd73d9 100644
> --- a/target/arm/helper-a64.c
> +++ b/target/arm/helper-a64.c
> @@ -513,8 +513,8 @@ uint64_t HELPER(paired_cmpxchg64_le)(CPUARMState *env=
, uint64_t addr,
>      uint64_t o0, o1;
>      bool success;
>      int mem_idx =3D cpu_mmu_index(env, false);
> -    MemOpIdx oi0 =3D make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
> -    MemOpIdx oi1 =3D make_memop_idx(MO_LEQ, mem_idx);
> +    MemOpIdx oi0 =3D make_memop_idx(MO_LEUQ | MO_ALIGN_16, mem_idx);
> +    MemOpIdx oi1 =3D make_memop_idx(MO_LEUQ, mem_idx);
>
>      o0 =3D cpu_ldq_le_mmu(env, addr + 0, oi0, ra);
>      o1 =3D cpu_ldq_le_mmu(env, addr + 8, oi1, ra);
> @@ -565,8 +565,8 @@ uint64_t HELPER(paired_cmpxchg64_be)(CPUARMState *env=
, uint64_t addr,
>      uint64_t o0, o1;
>      bool success;
>      int mem_idx =3D cpu_mmu_index(env, false);
> -    MemOpIdx oi0 =3D make_memop_idx(MO_BEQ | MO_ALIGN_16, mem_idx);
> -    MemOpIdx oi1 =3D make_memop_idx(MO_BEQ, mem_idx);
> +    MemOpIdx oi0 =3D make_memop_idx(MO_BEUQ | MO_ALIGN_16, mem_idx);
> +    MemOpIdx oi1 =3D make_memop_idx(MO_BEUQ, mem_idx);
>
>      o1 =3D cpu_ldq_be_mmu(env, addr + 0, oi0, ra);
>      o0 =3D cpu_ldq_be_mmu(env, addr + 8, oi1, ra);
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index cec672f229..1411fdfb6f 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -973,7 +973,7 @@ static void do_fp_st(DisasContext *s, int srcidx, TCG=
v_i64 tcg_addr, int size)
>
>          tcg_gen_ld_i64(tmphi, cpu_env, fp_reg_hi_offset(s, srcidx));
>
> -        mop =3D s->be_data | MO_Q;
> +        mop =3D s->be_data | MO_UQ;
>          tcg_gen_qemu_st_i64(be ? tmphi : tmplo, tcg_addr, get_mem_index(=
s),
>                              mop | (s->align_mem ? MO_ALIGN_16 : 0));
>          tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
> @@ -1007,7 +1007,7 @@ static void do_fp_ld(DisasContext *s, int destidx, =
TCGv_i64 tcg_addr, int size)
>          tmphi =3D tcg_temp_new_i64();
>          tcg_hiaddr =3D tcg_temp_new_i64();
>
> -        mop =3D s->be_data | MO_Q;
> +        mop =3D s->be_data | MO_UQ;
>          tcg_gen_qemu_ld_i64(be ? tmphi : tmplo, tcg_addr, get_mem_index(=
s),
>                              mop | (s->align_mem ? MO_ALIGN_16 : 0));
>          tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
> @@ -4099,10 +4099,10 @@ static void disas_ldst_tag(DisasContext *s, uint3=
2_t insn)
>          int i, n =3D (1 + is_pair) << LOG2_TAG_GRANULE;
>
>          tcg_gen_qemu_st_i64(tcg_zero, clean_addr, mem_index,
> -                            MO_Q | MO_ALIGN_16);
> +                            MO_UQ | MO_ALIGN_16);
>          for (i =3D 8; i < n; i +=3D 8) {
>              tcg_gen_addi_i64(clean_addr, clean_addr, 8);
> -            tcg_gen_qemu_st_i64(tcg_zero, clean_addr, mem_index, MO_Q);
> +            tcg_gen_qemu_st_i64(tcg_zero, clean_addr, mem_index, MO_UQ);
>          }
>          tcg_temp_free_i64(tcg_zero);
>      }
> diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
> index dd43de558e..3854dd3516 100644
> --- a/target/arm/translate-neon.c
> +++ b/target/arm/translate-neon.c
> @@ -73,7 +73,7 @@ static void neon_load_element64(TCGv_i64 var, int reg, =
int ele, MemOp mop)
>      case MO_UL:
>          tcg_gen_ld32u_i64(var, cpu_env, offset);
>          break;
> -    case MO_Q:
> +    case MO_UQ:
>          tcg_gen_ld_i64(var, cpu_env, offset);
>          break;
>      default:
> @@ -1830,7 +1830,7 @@ static bool do_prewiden_3d(DisasContext *s, arg_3di=
ff *a,
>          return false;
>      }
>
> -    if ((a->vd & 1) || (src1_mop =3D=3D MO_Q && (a->vn & 1))) {
> +    if ((a->vd & 1) || (src1_mop =3D=3D MO_UQ && (a->vn & 1))) {
>          return false;
>      }
>
> @@ -1910,7 +1910,7 @@ static bool do_prewiden_3d(DisasContext *s, arg_3di=
ff *a,
>          };                                                              =
\
>          int narrow_mop =3D a->size =3D=3D MO_32 ? MO_32 | SIGN : -1;    =
      \
>          return do_prewiden_3d(s, a, widenfn[a->size], addfn[a->size],   =
\
> -                              SRC1WIDE ? MO_Q : narrow_mop,             =
\
> +                              SRC1WIDE ? MO_UQ : narrow_mop,            =
 \
>                                narrow_mop);                              =
\
>      }
>
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 76b5fe9f31..33ca1bcfac 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -5087,7 +5087,7 @@ static void do_ldr(DisasContext *s, uint32_t vofs, =
int len, int rn, int imm)
>
>          t0 =3D tcg_temp_new_i64();
>          for (i =3D 0; i < len_align; i +=3D 8) {
> -            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEQ);
> +            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEUQ);
>              tcg_gen_st_i64(t0, cpu_env, vofs + i);
>              tcg_gen_addi_i64(clean_addr, clean_addr, 8);
>          }
> @@ -5104,7 +5104,7 @@ static void do_ldr(DisasContext *s, uint32_t vofs, =
int len, int rn, int imm)
>          gen_set_label(loop);
>
>          t0 =3D tcg_temp_new_i64();
> -        tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEQ);
> +        tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEUQ);
>          tcg_gen_addi_i64(clean_addr, clean_addr, 8);
>
>          tp =3D tcg_temp_new_ptr();
> @@ -5177,7 +5177,7 @@ static void do_str(DisasContext *s, uint32_t vofs, =
int len, int rn, int imm)
>          t0 =3D tcg_temp_new_i64();
>          for (i =3D 0; i < len_align; i +=3D 8) {
>              tcg_gen_ld_i64(t0, cpu_env, vofs + i);
> -            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEQ);
> +            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUQ);
>              tcg_gen_addi_i64(clean_addr, clean_addr, 8);
>          }
>          tcg_temp_free_i64(t0);
> @@ -5199,7 +5199,7 @@ static void do_str(DisasContext *s, uint32_t vofs, =
int len, int rn, int imm)
>          tcg_gen_addi_ptr(i, i, 8);
>          tcg_temp_free_ptr(tp);
>
> -        tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEQ);
> +        tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUQ);
>          tcg_gen_addi_i64(clean_addr, clean_addr, 8);
>          tcg_temp_free_i64(t0);
>
> @@ -5283,7 +5283,7 @@ static const MemOp dtype_mop[16] =3D {
>      MO_UB, MO_UB, MO_UB, MO_UB,
>      MO_SL, MO_UW, MO_UW, MO_UW,
>      MO_SW, MO_SW, MO_UL, MO_UL,
> -    MO_SB, MO_SB, MO_SB, MO_Q
> +    MO_SB, MO_SB, MO_SB, MO_UQ
>  };
>
>  #define dtype_msz(x)  (dtype_mop[x] & MO_SIZE)
> diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
> index 59bcaec5be..17f796e32a 100644
> --- a/target/arm/translate-vfp.c
> +++ b/target/arm/translate-vfp.c
> @@ -1170,11 +1170,11 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, a=
rg_VLDR_VSTR_dp *a)
>      addr =3D add_reg_for_lit(s, a->rn, offset);
>      tmp =3D tcg_temp_new_i64();
>      if (a->l) {
> -        gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_=
4);
> +        gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s), MO_UQ | MO_ALIGN=
_4);
>          vfp_store_reg64(tmp, a->vd);
>      } else {
>          vfp_load_reg64(tmp, a->vd);
> -        gen_aa32_st_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_=
4);
> +        gen_aa32_st_i64(s, tmp, addr, get_mem_index(s), MO_UQ | MO_ALIGN=
_4);
>      }
>      tcg_temp_free_i64(tmp);
>      tcg_temp_free_i32(addr);
> @@ -1322,12 +1322,12 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, a=
rg_VLDM_VSTM_dp *a)
>      for (i =3D 0; i < n; i++) {
>          if (a->l) {
>              /* load */
> -            gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_AL=
IGN_4);
> +            gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s), MO_UQ | MO_A=
LIGN_4);
>              vfp_store_reg64(tmp, a->vd + i);
>          } else {
>              /* store */
>              vfp_load_reg64(tmp, a->vd + i);
> -            gen_aa32_st_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_AL=
IGN_4);
> +            gen_aa32_st_i64(s, tmp, addr, get_mem_index(s), MO_UQ | MO_A=
LIGN_4);
>          }
>          tcg_gen_addi_i32(addr, addr, offset);
>      }
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 98f5925928..1b814cb6d1 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -1217,7 +1217,7 @@ void read_neon_element64(TCGv_i64 dest, int reg, in=
t ele, MemOp memop)
>      case MO_UL:
>          tcg_gen_ld32u_i64(dest, cpu_env, off);
>          break;
> -    case MO_Q:
> +    case MO_UQ:
>          tcg_gen_ld_i64(dest, cpu_env, off);
>          break;
>      default:
> diff --git a/target/cris/translate.c b/target/cris/translate.c
> index 59325b388a..3656cd6db1 100644
> --- a/target/cris/translate.c
> +++ b/target/cris/translate.c
> @@ -1047,7 +1047,7 @@ static void gen_load64(DisasContext *dc, TCGv_i64 d=
st, TCGv addr)
>          cris_store_direct_jmp(dc);
>      }
>
> -    tcg_gen_qemu_ld_i64(dst, addr, mem_index, MO_TEQ);
> +    tcg_gen_qemu_ld_i64(dst, addr, mem_index, MO_TEUQ);
>  }
>
>  static void gen_load(DisasContext *dc, TCGv dst, TCGv addr,
> diff --git a/target/hppa/translate.c b/target/hppa/translate.c
> index 3b9744deb4..08502a32df 100644
> --- a/target/hppa/translate.c
> +++ b/target/hppa/translate.c
> @@ -1597,7 +1597,7 @@ static bool do_floadd(DisasContext *ctx, unsigned r=
t, unsigned rb,
>      nullify_over(ctx);
>
>      tmp =3D tcg_temp_new_i64();
> -    do_load_64(ctx, tmp, rb, rx, scale, disp, sp, modify, MO_TEQ);
> +    do_load_64(ctx, tmp, rb, rx, scale, disp, sp, modify, MO_TEUQ);
>      save_frd(rt, tmp);
>      tcg_temp_free_i64(tmp);
>
> @@ -1653,7 +1653,7 @@ static bool do_fstored(DisasContext *ctx, unsigned =
rt, unsigned rb,
>      nullify_over(ctx);
>
>      tmp =3D load_frd(rt);
> -    do_store_64(ctx, tmp, rb, rx, scale, disp, sp, modify, MO_TEQ);
> +    do_store_64(ctx, tmp, rb, rx, scale, disp, sp, modify, MO_TEUQ);
>      tcg_temp_free_i64(tmp);
>
>      return nullify_end(ctx);
> diff --git a/target/i386/tcg/mem_helper.c b/target/i386/tcg/mem_helper.c
> index a207e624cb..e3cdafd2d4 100644
> --- a/target/i386/tcg/mem_helper.c
> +++ b/target/i386/tcg/mem_helper.c
> @@ -67,7 +67,7 @@ void helper_cmpxchg8b(CPUX86State *env, target_ulong a0=
)
>      {
>          uintptr_t ra =3D GETPC();
>          int mem_idx =3D cpu_mmu_index(env, false);
> -        MemOpIdx oi =3D make_memop_idx(MO_TEQ, mem_idx);
> +        MemOpIdx oi =3D make_memop_idx(MO_TEUQ, mem_idx);
>          oldv =3D cpu_atomic_cmpxchgq_le_mmu(env, a0, cmpv, newv, oi, ra)=
;
>      }
>
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index e9e1451540..ee2e975731 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -2719,23 +2719,23 @@ static void gen_jmp(DisasContext *s, target_ulong=
 eip)
>
>  static inline void gen_ldq_env_A0(DisasContext *s, int offset)
>  {
> -    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, s->mem_index, MO_LEQ);
> +    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, s->mem_index, MO_LEUQ);
>      tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset);
>  }
>
>  static inline void gen_stq_env_A0(DisasContext *s, int offset)
>  {
>      tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset);
> -    tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, s->mem_index, MO_LEQ);
> +    tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, s->mem_index, MO_LEUQ);
>  }
>
>  static inline void gen_ldo_env_A0(DisasContext *s, int offset)
>  {
>      int mem_index =3D s->mem_index;
> -    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, mem_index, MO_LEQ);
> +    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, mem_index, MO_LEUQ);
>      tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q=
(0)));
>      tcg_gen_addi_tl(s->tmp0, s->A0, 8);
> -    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEQ);
> +    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
>      tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q=
(1)));
>  }
>
> @@ -2743,10 +2743,10 @@ static inline void gen_sto_env_A0(DisasContext *s=
, int offset)
>  {
>      int mem_index =3D s->mem_index;
>      tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q=
(0)));
> -    tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, mem_index, MO_LEQ);
> +    tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, mem_index, MO_LEUQ);
>      tcg_gen_addi_tl(s->tmp0, s->A0, 8);
>      tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q=
(1)));
> -    tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEQ);
> +    tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
>  }
>
>  static inline void gen_op_movo(DisasContext *s, int d_offset, int s_offs=
et)
> @@ -4261,7 +4261,7 @@ static void gen_sse(CPUX86State *env, DisasContext =
*s, int b,
>                              tcg_gen_mov_i64(cpu_regs[rm], s->tmp1_i64);
>                          } else {
>                              tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
> -                                                s->mem_index, MO_LEQ);
> +                                                s->mem_index, MO_LEUQ);
>                          }
>  #else
>                          goto illegal_op;
> @@ -4334,7 +4334,7 @@ static void gen_sse(CPUX86State *env, DisasContext =
*s, int b,
>                              gen_op_mov_v_reg(s, ot, s->tmp1_i64, rm);
>                          } else {
>                              tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
> -                                                s->mem_index, MO_LEQ);
> +                                                s->mem_index, MO_LEUQ);
>                          }
>                          tcg_gen_st_i64(s->tmp1_i64, cpu_env,
>                                          offsetof(CPUX86State,
> @@ -5954,7 +5954,7 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
>                              break;
>                          case 2:
>                              tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
> -                                                s->mem_index, MO_LEQ);
> +                                                s->mem_index, MO_LEUQ);
>                              gen_helper_fldl_FT0(cpu_env, s->tmp1_i64);
>                              break;
>                          case 3:
> @@ -5993,7 +5993,7 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
>                              break;
>                          case 2:
>                              tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
> -                                                s->mem_index, MO_LEQ);
> +                                                s->mem_index, MO_LEUQ);
>                              gen_helper_fldl_ST0(cpu_env, s->tmp1_i64);
>                              break;
>                          case 3:
> @@ -6015,7 +6015,7 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
>                          case 2:
>                              gen_helper_fisttll_ST0(s->tmp1_i64, cpu_env)=
;
>                              tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
> -                                                s->mem_index, MO_LEQ);
> +                                                s->mem_index, MO_LEUQ);
>                              break;
>                          case 3:
>                          default:
> @@ -6041,7 +6041,7 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
>                          case 2:
>                              gen_helper_fstl_ST0(s->tmp1_i64, cpu_env);
>                              tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
> -                                                s->mem_index, MO_LEQ);
> +                                                s->mem_index, MO_LEUQ);
>                              break;
>                          case 3:
>                          default:
> @@ -6110,13 +6110,13 @@ static target_ulong disas_insn(DisasContext *s, C=
PUState *cpu)
>                      break;
>                  case 0x3d: /* fildll */
>                      tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
> -                                        s->mem_index, MO_LEQ);
> +                                        s->mem_index, MO_LEUQ);
>                      gen_helper_fildll_ST0(cpu_env, s->tmp1_i64);
>                      break;
>                  case 0x3f: /* fistpll */
>                      gen_helper_fistll_ST0(s->tmp1_i64, cpu_env);
>                      tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
> -                                        s->mem_index, MO_LEQ);
> +                                        s->mem_index, MO_LEUQ);
>                      gen_helper_fpop(cpu_env);
>                      break;
>                  default:
> @@ -7938,10 +7938,10 @@ static target_ulong disas_insn(DisasContext *s, C=
PUState *cpu)
>                      gen_lea_modrm(env, s, modrm);
>                      if (CODE64(s)) {
>                          tcg_gen_qemu_ld_i64(cpu_bndl[reg], s->A0,
> -                                            s->mem_index, MO_LEQ);
> +                                            s->mem_index, MO_LEUQ);
>                          tcg_gen_addi_tl(s->A0, s->A0, 8);
>                          tcg_gen_qemu_ld_i64(cpu_bndu[reg], s->A0,
> -                                            s->mem_index, MO_LEQ);
> +                                            s->mem_index, MO_LEUQ);
>                      } else {
>                          tcg_gen_qemu_ld_i64(cpu_bndl[reg], s->A0,
>                                              s->mem_index, MO_LEUL);
> @@ -8045,10 +8045,10 @@ static target_ulong disas_insn(DisasContext *s, C=
PUState *cpu)
>                      gen_lea_modrm(env, s, modrm);
>                      if (CODE64(s)) {
>                          tcg_gen_qemu_st_i64(cpu_bndl[reg], s->A0,
> -                                            s->mem_index, MO_LEQ);
> +                                            s->mem_index, MO_LEUQ);
>                          tcg_gen_addi_tl(s->A0, s->A0, 8);
>                          tcg_gen_qemu_st_i64(cpu_bndu[reg], s->A0,
> -                                            s->mem_index, MO_LEQ);
> +                                            s->mem_index, MO_LEUQ);
>                      } else {
>                          tcg_gen_qemu_st_i64(cpu_bndl[reg], s->A0,
>                                              s->mem_index, MO_LEUL);
> diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
> index cfbc987ba6..c0f4825034 100644
> --- a/target/m68k/op_helper.c
> +++ b/target/m68k/op_helper.c
> @@ -774,7 +774,7 @@ static void do_cas2l(CPUM68KState *env, uint32_t regs=
, uint32_t a1, uint32_t a2,
>      uintptr_t ra =3D GETPC();
>  #if defined(CONFIG_ATOMIC64)
>      int mmu_idx =3D cpu_mmu_index(env, 0);
> -    MemOpIdx oi =3D make_memop_idx(MO_BEQ, mmu_idx);
> +    MemOpIdx oi =3D make_memop_idx(MO_BEUQ, mmu_idx);
>  #endif
>
>      if (parallel) {
> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
> index 47db35d7dd..1c2264417c 100644
> --- a/target/mips/tcg/translate.c
> +++ b/target/mips/tcg/translate.c
> @@ -2031,7 +2031,7 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
>          gen_store_gpr(t0, rt);
>          break;
>      case OPC_LD:
> -        tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEQ |
> +        tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEUQ |
>                             ctx->default_tcg_memop_mask);
>          gen_store_gpr(t0, rt);
>          break;
> @@ -2053,7 +2053,7 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
>          }
>          tcg_gen_shli_tl(t1, t1, 3);
>          tcg_gen_andi_tl(t0, t0, ~7);
> -        tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEQ);
> +        tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEUQ);
>          tcg_gen_shl_tl(t0, t0, t1);
>          t2 =3D tcg_const_tl(-1);
>          tcg_gen_shl_tl(t2, t2, t1);
> @@ -2077,7 +2077,7 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
>          }
>          tcg_gen_shli_tl(t1, t1, 3);
>          tcg_gen_andi_tl(t0, t0, ~7);
> -        tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEQ);
> +        tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEUQ);
>          tcg_gen_shr_tl(t0, t0, t1);
>          tcg_gen_xori_tl(t1, t1, 63);
>          t2 =3D tcg_const_tl(0xfffffffffffffffeull);
> @@ -2093,7 +2093,7 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
>          t1 =3D tcg_const_tl(pc_relative_pc(ctx));
>          gen_op_addr_add(ctx, t0, t0, t1);
>          tcg_temp_free(t1);
> -        tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEQ);
> +        tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEUQ);
>          gen_store_gpr(t0, rt);
>          break;
>  #endif
> @@ -2224,7 +2224,7 @@ static void gen_st(DisasContext *ctx, uint32_t opc,=
 int rt,
>      switch (opc) {
>  #if defined(TARGET_MIPS64)
>      case OPC_SD:
> -        tcg_gen_qemu_st_tl(t1, t0, mem_idx, MO_TEQ |
> +        tcg_gen_qemu_st_tl(t1, t0, mem_idx, MO_TEUQ |
>                             ctx->default_tcg_memop_mask);
>          break;
>      case OPC_SDL:
> @@ -2334,7 +2334,7 @@ static void gen_flt_ldst(DisasContext *ctx, uint32_=
t opc, int ft,
>      case OPC_LDC1:
>          {
>              TCGv_i64 fp0 =3D tcg_temp_new_i64();
> -            tcg_gen_qemu_ld_i64(fp0, t0, ctx->mem_idx, MO_TEQ |
> +            tcg_gen_qemu_ld_i64(fp0, t0, ctx->mem_idx, MO_TEUQ |
>                                  ctx->default_tcg_memop_mask);
>              gen_store_fpr64(ctx, fp0, ft);
>              tcg_temp_free_i64(fp0);
> @@ -2344,7 +2344,7 @@ static void gen_flt_ldst(DisasContext *ctx, uint32_=
t opc, int ft,
>          {
>              TCGv_i64 fp0 =3D tcg_temp_new_i64();
>              gen_load_fpr64(ctx, fp0, ft);
> -            tcg_gen_qemu_st_i64(fp0, t0, ctx->mem_idx, MO_TEQ |
> +            tcg_gen_qemu_st_i64(fp0, t0, ctx->mem_idx, MO_TEUQ |
>                                  ctx->default_tcg_memop_mask);
>              tcg_temp_free_i64(fp0);
>          }
> @@ -3092,7 +3092,7 @@ static inline void gen_pcrel(DisasContext *ctx, int=
 opc, target_ulong pc,
>              check_mips_64(ctx);
>              offset =3D sextract32(ctx->opcode << 3, 0, 21);
>              addr =3D addr_add(ctx, (pc & ~0x7), offset);
> -            gen_r6_ld(addr, rs, ctx->mem_idx, MO_TEQ);
> +            gen_r6_ld(addr, rs, ctx->mem_idx, MO_TEUQ);
>              break;
>  #endif
>          default:
> @@ -4344,10 +4344,10 @@ static void gen_loongson_lswc2(DisasContext *ctx,=
 int rt,
>      case OPC_GSLQ:
>          t1 =3D tcg_temp_new();
>          gen_base_offset_addr(ctx, t0, rs, lsq_offset);
> -        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TEQ |
> +        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TEUQ |
>                             ctx->default_tcg_memop_mask);
>          gen_base_offset_addr(ctx, t0, rs, lsq_offset + 8);
> -        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ |
> +        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUQ |
>                             ctx->default_tcg_memop_mask);
>          gen_store_gpr(t1, rt);
>          gen_store_gpr(t0, lsq_rt1);
> @@ -4357,10 +4357,10 @@ static void gen_loongson_lswc2(DisasContext *ctx,=
 int rt,
>          check_cp1_enabled(ctx);
>          t1 =3D tcg_temp_new();
>          gen_base_offset_addr(ctx, t0, rs, lsq_offset);
> -        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TEQ |
> +        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TEUQ |
>                             ctx->default_tcg_memop_mask);
>          gen_base_offset_addr(ctx, t0, rs, lsq_offset + 8);
> -        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ |
> +        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUQ |
>                             ctx->default_tcg_memop_mask);
>          gen_store_fpr64(ctx, t1, rt);
>          gen_store_fpr64(ctx, t0, lsq_rt1);
> @@ -4370,11 +4370,11 @@ static void gen_loongson_lswc2(DisasContext *ctx,=
 int rt,
>          t1 =3D tcg_temp_new();
>          gen_base_offset_addr(ctx, t0, rs, lsq_offset);
>          gen_load_gpr(t1, rt);
> -        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEQ |
> +        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUQ |
>                             ctx->default_tcg_memop_mask);
>          gen_base_offset_addr(ctx, t0, rs, lsq_offset + 8);
>          gen_load_gpr(t1, lsq_rt1);
> -        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEQ |
> +        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUQ |
>                             ctx->default_tcg_memop_mask);
>          tcg_temp_free(t1);
>          break;
> @@ -4383,11 +4383,11 @@ static void gen_loongson_lswc2(DisasContext *ctx,=
 int rt,
>          t1 =3D tcg_temp_new();
>          gen_base_offset_addr(ctx, t0, rs, lsq_offset);
>          gen_load_fpr64(ctx, t1, rt);
> -        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEQ |
> +        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUQ |
>                             ctx->default_tcg_memop_mask);
>          gen_base_offset_addr(ctx, t0, rs, lsq_offset + 8);
>          gen_load_fpr64(ctx, t1, lsq_rt1);
> -        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEQ |
> +        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUQ |
>                             ctx->default_tcg_memop_mask);
>          tcg_temp_free(t1);
>          break;
> @@ -4467,7 +4467,7 @@ static void gen_loongson_lswc2(DisasContext *ctx, i=
nt rt,
>              }
>              tcg_gen_shli_tl(t1, t1, 3);
>              tcg_gen_andi_tl(t0, t0, ~7);
> -            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ);
> +            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUQ);
>              tcg_gen_shl_tl(t0, t0, t1);
>              t2 =3D tcg_const_tl(-1);
>              tcg_gen_shl_tl(t2, t2, t1);
> @@ -4489,7 +4489,7 @@ static void gen_loongson_lswc2(DisasContext *ctx, i=
nt rt,
>              }
>              tcg_gen_shli_tl(t1, t1, 3);
>              tcg_gen_andi_tl(t0, t0, ~7);
> -            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ);
> +            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUQ);
>              tcg_gen_shr_tl(t0, t0, t1);
>              tcg_gen_xori_tl(t1, t1, 63);
>              t2 =3D tcg_const_tl(0xfffffffffffffffeull);
> @@ -4642,7 +4642,7 @@ static void gen_loongson_lsdc2(DisasContext *ctx, i=
nt rt,
>          if (rd) {
>              gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
>          }
> -        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ |
> +        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUQ |
>                             ctx->default_tcg_memop_mask);
>          gen_store_gpr(t0, rt);
>          break;
> @@ -4664,7 +4664,7 @@ static void gen_loongson_lsdc2(DisasContext *ctx, i=
nt rt,
>          if (rd) {
>              gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
>          }
> -        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ |
> +        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUQ |
>                             ctx->default_tcg_memop_mask);
>          gen_store_fpr64(ctx, t0, rt);
>          break;
> @@ -4693,7 +4693,7 @@ static void gen_loongson_lsdc2(DisasContext *ctx, i=
nt rt,
>      case OPC_GSSDX:
>          t1 =3D tcg_temp_new();
>          gen_load_gpr(t1, rt);
> -        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEQ |
> +        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUQ |
>                             ctx->default_tcg_memop_mask);
>          tcg_temp_free(t1);
>          break;
> @@ -4709,7 +4709,7 @@ static void gen_loongson_lsdc2(DisasContext *ctx, i=
nt rt,
>      case OPC_GSSDXC1:
>          t1 =3D tcg_temp_new();
>          gen_load_fpr64(ctx, t1, rt);
> -        tcg_gen_qemu_st_i64(t1, t0, ctx->mem_idx, MO_TEQ |
> +        tcg_gen_qemu_st_i64(t1, t0, ctx->mem_idx, MO_TEUQ |
>                              ctx->default_tcg_memop_mask);
>          tcg_temp_free(t1);
>          break;
> @@ -11330,7 +11330,7 @@ static void gen_flt3_ldst(DisasContext *ctx, uint=
32_t opc,
>          check_cp1_registers(ctx, fd);
>          {
>              TCGv_i64 fp0 =3D tcg_temp_new_i64();
> -            tcg_gen_qemu_ld_i64(fp0, t0, ctx->mem_idx, MO_TEQ);
> +            tcg_gen_qemu_ld_i64(fp0, t0, ctx->mem_idx, MO_TEUQ);
>              gen_store_fpr64(ctx, fp0, fd);
>              tcg_temp_free_i64(fp0);
>          }
> @@ -11341,7 +11341,7 @@ static void gen_flt3_ldst(DisasContext *ctx, uint=
32_t opc,
>          {
>              TCGv_i64 fp0 =3D tcg_temp_new_i64();
>
> -            tcg_gen_qemu_ld_i64(fp0, t0, ctx->mem_idx, MO_TEQ);
> +            tcg_gen_qemu_ld_i64(fp0, t0, ctx->mem_idx, MO_TEUQ);
>              gen_store_fpr64(ctx, fp0, fd);
>              tcg_temp_free_i64(fp0);
>          }
> @@ -11361,7 +11361,7 @@ static void gen_flt3_ldst(DisasContext *ctx, uint=
32_t opc,
>          {
>              TCGv_i64 fp0 =3D tcg_temp_new_i64();
>              gen_load_fpr64(ctx, fp0, fs);
> -            tcg_gen_qemu_st_i64(fp0, t0, ctx->mem_idx, MO_TEQ);
> +            tcg_gen_qemu_st_i64(fp0, t0, ctx->mem_idx, MO_TEUQ);
>              tcg_temp_free_i64(fp0);
>          }
>          break;
> @@ -11371,7 +11371,7 @@ static void gen_flt3_ldst(DisasContext *ctx, uint=
32_t opc,
>          {
>              TCGv_i64 fp0 =3D tcg_temp_new_i64();
>              gen_load_fpr64(ctx, fp0, fs);
> -            tcg_gen_qemu_st_i64(fp0, t0, ctx->mem_idx, MO_TEQ);
> +            tcg_gen_qemu_st_i64(fp0, t0, ctx->mem_idx, MO_TEUQ);
>              tcg_temp_free_i64(fp0);
>          }
>          break;
> @@ -12187,7 +12187,7 @@ static void gen_mipsdsp_ld(DisasContext *ctx, uin=
t32_t opc,
>          break;
>  #if defined(TARGET_MIPS64)
>      case OPC_LDX:
> -        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ);
> +        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUQ);
>          gen_store_gpr(t0, rd);
>          break;
>  #endif
> @@ -14403,7 +14403,7 @@ static void decode_opc_special3_r6(CPUMIPSState *=
env, DisasContext *ctx)
>  #endif
>  #if defined(TARGET_MIPS64)
>      case R6_OPC_SCD:
> -        gen_st_cond(ctx, rt, rs, imm, MO_TEQ, false);
> +        gen_st_cond(ctx, rt, rs, imm, MO_TEUQ, false);
>          break;
>      case R6_OPC_LLD:
>          gen_ld(ctx, op1, rt, rs, imm);
> @@ -15843,7 +15843,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, =
DisasContext *ctx)
>              check_insn_opc_user_only(ctx, INSN_R5900);
>          }
>          check_mips_64(ctx);
> -        gen_st_cond(ctx, rt, rs, imm, MO_TEQ, false);
> +        gen_st_cond(ctx, rt, rs, imm, MO_TEUQ, false);
>          break;
>      case OPC_BNVC: /* OPC_BNEZALC, OPC_BNEC, OPC_DADDI */
>          if (ctx->insn_flags & ISA_MIPS_R6) {
> diff --git a/target/mips/tcg/tx79_translate.c b/target/mips/tcg/tx79_tran=
slate.c
> index 6d51fe17c1..4e479c2d10 100644
> --- a/target/mips/tcg/tx79_translate.c
> +++ b/target/mips/tcg/tx79_translate.c
> @@ -355,12 +355,12 @@ static bool trans_LQ(DisasContext *ctx, arg_i *a)
>      tcg_gen_andi_tl(addr, addr, ~0xf);
>
>      /* Lower half */
> -    tcg_gen_qemu_ld_i64(t0, addr, ctx->mem_idx, MO_TEQ);
> +    tcg_gen_qemu_ld_i64(t0, addr, ctx->mem_idx, MO_TEUQ);
>      gen_store_gpr(t0, a->rt);
>
>      /* Upper half */
>      tcg_gen_addi_i64(addr, addr, 8);
> -    tcg_gen_qemu_ld_i64(t0, addr, ctx->mem_idx, MO_TEQ);
> +    tcg_gen_qemu_ld_i64(t0, addr, ctx->mem_idx, MO_TEUQ);
>      gen_store_gpr_hi(t0, a->rt);
>
>      tcg_temp_free(t0);
> @@ -383,12 +383,12 @@ static bool trans_SQ(DisasContext *ctx, arg_i *a)
>
>      /* Lower half */
>      gen_load_gpr(t0, a->rt);
> -    tcg_gen_qemu_st_i64(t0, addr, ctx->mem_idx, MO_TEQ);
> +    tcg_gen_qemu_st_i64(t0, addr, ctx->mem_idx, MO_TEUQ);
>
>      /* Upper half */
>      tcg_gen_addi_i64(addr, addr, 8);
>      gen_load_gpr_hi(t0, a->rt);
> -    tcg_gen_qemu_st_i64(t0, addr, ctx->mem_idx, MO_TEQ);
> +    tcg_gen_qemu_st_i64(t0, addr, ctx->mem_idx, MO_TEUQ);
>
>      tcg_temp_free(addr);
>      tcg_temp_free(t0);
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 9960df6e18..820d39c675 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -3244,10 +3244,10 @@ GEN_QEMU_LOAD_64(ld8u,  DEF_MEMOP(MO_UB))
>  GEN_QEMU_LOAD_64(ld16u, DEF_MEMOP(MO_UW))
>  GEN_QEMU_LOAD_64(ld32u, DEF_MEMOP(MO_UL))
>  GEN_QEMU_LOAD_64(ld32s, DEF_MEMOP(MO_SL))
> -GEN_QEMU_LOAD_64(ld64,  DEF_MEMOP(MO_Q))
> +GEN_QEMU_LOAD_64(ld64,  DEF_MEMOP(MO_UQ))
>
>  #if defined(TARGET_PPC64)
> -GEN_QEMU_LOAD_64(ld64ur, BSWAP_MEMOP(MO_Q))
> +GEN_QEMU_LOAD_64(ld64ur, BSWAP_MEMOP(MO_UQ))
>  #endif
>
>  #define GEN_QEMU_STORE_TL(stop, op)                                     =
\
> @@ -3278,10 +3278,10 @@ static void glue(gen_qemu_, glue(stop, _i64))(Dis=
asContext *ctx,  \
>  GEN_QEMU_STORE_64(st8,  DEF_MEMOP(MO_UB))
>  GEN_QEMU_STORE_64(st16, DEF_MEMOP(MO_UW))
>  GEN_QEMU_STORE_64(st32, DEF_MEMOP(MO_UL))
> -GEN_QEMU_STORE_64(st64, DEF_MEMOP(MO_Q))
> +GEN_QEMU_STORE_64(st64, DEF_MEMOP(MO_UQ))
>
>  #if defined(TARGET_PPC64)
> -GEN_QEMU_STORE_64(st64r, BSWAP_MEMOP(MO_Q))
> +GEN_QEMU_STORE_64(st64r, BSWAP_MEMOP(MO_UQ))
>  #endif
>
>  #define GEN_LDX_E(name, ldop, opc2, opc3, type, type2, chk)             =
      \
> @@ -3318,7 +3318,7 @@ GEN_LDEPX(lb, DEF_MEMOP(MO_UB), 0x1F, 0x02)
>  GEN_LDEPX(lh, DEF_MEMOP(MO_UW), 0x1F, 0x08)
>  GEN_LDEPX(lw, DEF_MEMOP(MO_UL), 0x1F, 0x00)
>  #if defined(TARGET_PPC64)
> -GEN_LDEPX(ld, DEF_MEMOP(MO_Q), 0x1D, 0x00)
> +GEN_LDEPX(ld, DEF_MEMOP(MO_UQ), 0x1D, 0x00)
>  #endif
>
>  #if defined(TARGET_PPC64)
> @@ -3364,7 +3364,7 @@ GEN_STEPX(stb, DEF_MEMOP(MO_UB), 0x1F, 0x06)
>  GEN_STEPX(sth, DEF_MEMOP(MO_UW), 0x1F, 0x0C)
>  GEN_STEPX(stw, DEF_MEMOP(MO_UL), 0x1F, 0x04)
>  #if defined(TARGET_PPC64)
> -GEN_STEPX(std, DEF_MEMOP(MO_Q), 0x1d, 0x04)
> +GEN_STEPX(std, DEF_MEMOP(MO_UQ), 0x1d, 0x04)
>  #endif
>
>  #if defined(TARGET_PPC64)
> @@ -3774,7 +3774,7 @@ static void gen_lwat(DisasContext *ctx)
>  #ifdef TARGET_PPC64
>  static void gen_ldat(DisasContext *ctx)
>  {
> -    gen_ld_atomic(ctx, DEF_MEMOP(MO_Q));
> +    gen_ld_atomic(ctx, DEF_MEMOP(MO_UQ));
>  }
>  #endif
>
> @@ -3857,7 +3857,7 @@ static void gen_stwat(DisasContext *ctx)
>  #ifdef TARGET_PPC64
>  static void gen_stdat(DisasContext *ctx)
>  {
> -    gen_st_atomic(ctx, DEF_MEMOP(MO_Q));
> +    gen_st_atomic(ctx, DEF_MEMOP(MO_UQ));
>  }
>  #endif
>
> @@ -3909,9 +3909,9 @@ STCX(stwcx_, DEF_MEMOP(MO_UL))
>
>  #if defined(TARGET_PPC64)
>  /* ldarx */
> -LARX(ldarx, DEF_MEMOP(MO_Q))
> +LARX(ldarx, DEF_MEMOP(MO_UQ))
>  /* stdcx. */
> -STCX(stdcx_, DEF_MEMOP(MO_Q))
> +STCX(stdcx_, DEF_MEMOP(MO_UQ))
>
>  /* lqarx */
>  static void gen_lqarx(DisasContext *ctx)
> @@ -3955,15 +3955,15 @@ static void gen_lqarx(DisasContext *ctx)
>              return;
>          }
>      } else if (ctx->le_mode) {
> -        tcg_gen_qemu_ld_i64(lo, EA, ctx->mem_idx, MO_LEQ | MO_ALIGN_16);
> +        tcg_gen_qemu_ld_i64(lo, EA, ctx->mem_idx, MO_LEUQ | MO_ALIGN_16)=
;
>          tcg_gen_mov_tl(cpu_reserve, EA);
>          gen_addr_add(ctx, EA, EA, 8);
> -        tcg_gen_qemu_ld_i64(hi, EA, ctx->mem_idx, MO_LEQ);
> +        tcg_gen_qemu_ld_i64(hi, EA, ctx->mem_idx, MO_LEUQ);
>      } else {
> -        tcg_gen_qemu_ld_i64(hi, EA, ctx->mem_idx, MO_BEQ | MO_ALIGN_16);
> +        tcg_gen_qemu_ld_i64(hi, EA, ctx->mem_idx, MO_BEUQ | MO_ALIGN_16)=
;
>          tcg_gen_mov_tl(cpu_reserve, EA);
>          gen_addr_add(ctx, EA, EA, 8);
> -        tcg_gen_qemu_ld_i64(lo, EA, ctx->mem_idx, MO_BEQ);
> +        tcg_gen_qemu_ld_i64(lo, EA, ctx->mem_idx, MO_BEUQ);
>      }
>      tcg_temp_free(EA);
>
> @@ -7957,7 +7957,7 @@ GEN_LDEPX(lb, DEF_MEMOP(MO_UB), 0x1F, 0x02)
>  GEN_LDEPX(lh, DEF_MEMOP(MO_UW), 0x1F, 0x08)
>  GEN_LDEPX(lw, DEF_MEMOP(MO_UL), 0x1F, 0x00)
>  #if defined(TARGET_PPC64)
> -GEN_LDEPX(ld, DEF_MEMOP(MO_Q), 0x1D, 0x00)
> +GEN_LDEPX(ld, DEF_MEMOP(MO_UQ), 0x1D, 0x00)
>  #endif
>
>  #undef GEN_STX_E
> @@ -7983,7 +7983,7 @@ GEN_STEPX(stb, DEF_MEMOP(MO_UB), 0x1F, 0x06)
>  GEN_STEPX(sth, DEF_MEMOP(MO_UW), 0x1F, 0x0C)
>  GEN_STEPX(stw, DEF_MEMOP(MO_UL), 0x1F, 0x04)
>  #if defined(TARGET_PPC64)
> -GEN_STEPX(std, DEF_MEMOP(MO_Q), 0x1D, 0x04)
> +GEN_STEPX(std, DEF_MEMOP(MO_UQ), 0x1D, 0x04)
>  #endif
>
>  #undef GEN_CRLOGIC
> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.=
c
> index 362a30d99e..406578d105 100644
> --- a/target/s390x/tcg/mem_helper.c
> +++ b/target/s390x/tcg/mem_helper.c
> @@ -1895,7 +1895,7 @@ static uint32_t do_csst(CPUS390XState *env, uint32_=
t r3, uint64_t a1,
>
>              if (parallel) {
>  #ifdef CONFIG_ATOMIC64
> -                MemOpIdx oi =3D make_memop_idx(MO_TEQ | MO_ALIGN, mem_id=
x);
> +                MemOpIdx oi =3D make_memop_idx(MO_TEUQ | MO_ALIGN, mem_i=
dx);
>                  ov =3D cpu_atomic_cmpxchgq_be_mmu(env, a1, cv, nv, oi, r=
a);
>  #else
>                  /* Note that we asserted !parallel above.  */
> @@ -1970,7 +1970,7 @@ static uint32_t do_csst(CPUS390XState *env, uint32_=
t r3, uint64_t a1,
>                  cpu_stq_data_ra(env, a2 + 0, svh, ra);
>                  cpu_stq_data_ra(env, a2 + 8, svl, ra);
>              } else if (HAVE_ATOMIC128) {
> -                MemOpIdx oi =3D make_memop_idx(MO_TEQ | MO_ALIGN_16, mem=
_idx);
> +                MemOpIdx oi =3D make_memop_idx(MO_TEUQ | MO_ALIGN_16, me=
m_idx);
>                  Int128 sv =3D int128_make128(svl, svh);
>                  cpu_atomic_sto_be_mmu(env, a2, sv, oi, ra);
>              } else {
> @@ -2494,7 +2494,7 @@ uint64_t HELPER(lpq_parallel)(CPUS390XState *env, u=
int64_t addr)
>      assert(HAVE_ATOMIC128);
>
>      mem_idx =3D cpu_mmu_index(env, false);
> -    oi =3D make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
> +    oi =3D make_memop_idx(MO_TEUQ | MO_ALIGN_16, mem_idx);
>      v =3D cpu_atomic_ldo_be_mmu(env, addr, oi, ra);
>      hi =3D int128_gethi(v);
>      lo =3D int128_getlo(v);
> @@ -2525,7 +2525,7 @@ void HELPER(stpq_parallel)(CPUS390XState *env, uint=
64_t addr,
>      assert(HAVE_ATOMIC128);
>
>      mem_idx =3D cpu_mmu_index(env, false);
> -    oi =3D make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
> +    oi =3D make_memop_idx(MO_TEUQ | MO_ALIGN_16, mem_idx);
>      v =3D int128_make128(low, high);
>      cpu_atomic_sto_be_mmu(env, addr, v, oi, ra);
>  }
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index dcc249a197..f180853e7a 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -3063,7 +3063,7 @@ static DisasJumpType op_lpswe(DisasContext *s, Disa=
sOps *o)
>      t1 =3D tcg_temp_new_i64();
>      t2 =3D tcg_temp_new_i64();
>      tcg_gen_qemu_ld_i64(t1, o->in2, get_mem_index(s),
> -                        MO_TEQ | MO_ALIGN_8);
> +                        MO_TEUQ | MO_ALIGN_8);
>      tcg_gen_addi_i64(o->in2, o->in2, 8);
>      tcg_gen_qemu_ld64(t2, o->in2, get_mem_index(s));
>      gen_helper_load_psw(cpu_env, t1, t2);
> @@ -4295,7 +4295,7 @@ static DisasJumpType op_stcke(DisasContext *s, Disa=
sOps *o)
>  #ifndef CONFIG_USER_ONLY
>  static DisasJumpType op_sck(DisasContext *s, DisasOps *o)
>  {
> -    tcg_gen_qemu_ld_i64(o->in1, o->addr1, get_mem_index(s), MO_TEQ | MO_=
ALIGN);
> +    tcg_gen_qemu_ld_i64(o->in1, o->addr1, get_mem_index(s), MO_TEUQ | MO=
_ALIGN);
>      gen_helper_sck(cc_op, cpu_env, o->in1);
>      set_cc_static(s);
>      return DISAS_NEXT;
> @@ -5521,7 +5521,7 @@ static void wout_m1_64(DisasContext *s, DisasOps *o=
)
>  #ifndef CONFIG_USER_ONLY
>  static void wout_m1_64a(DisasContext *s, DisasOps *o)
>  {
> -    tcg_gen_qemu_st_i64(o->out, o->addr1, get_mem_index(s), MO_TEQ | MO_=
ALIGN);
> +    tcg_gen_qemu_st_i64(o->out, o->addr1, get_mem_index(s), MO_TEUQ | MO=
_ALIGN);
>  }
>  #define SPEC_wout_m1_64a 0
>  #endif
> @@ -5997,7 +5997,7 @@ static void in2_m2_64w(DisasContext *s, DisasOps *o=
)
>  static void in2_m2_64a(DisasContext *s, DisasOps *o)
>  {
>      in2_a2(s, o);
> -    tcg_gen_qemu_ld_i64(o->in2, o->in2, get_mem_index(s), MO_TEQ | MO_AL=
IGN);
> +    tcg_gen_qemu_ld_i64(o->in2, o->in2, get_mem_index(s), MO_TEUQ | MO_A=
LIGN);
>  }
>  #define SPEC_in2_m2_64a 0
>  #endif
> diff --git a/target/sh4/translate.c b/target/sh4/translate.c
> index ce5d674a52..12f5e413ab 100644
> --- a/target/sh4/translate.c
> +++ b/target/sh4/translate.c
> @@ -994,7 +994,7 @@ static void _decode_opc(DisasContext * ctx)
>          if (ctx->tbflags & FPSCR_SZ) {
>              TCGv_i64 fp =3D tcg_temp_new_i64();
>              gen_load_fpr64(ctx, fp, XHACK(B7_4));
> -            tcg_gen_qemu_st_i64(fp, REG(B11_8), ctx->memidx, MO_TEQ);
> +            tcg_gen_qemu_st_i64(fp, REG(B11_8), ctx->memidx, MO_TEUQ);
>              tcg_temp_free_i64(fp);
>         } else {
>              tcg_gen_qemu_st_i32(FREG(B7_4), REG(B11_8), ctx->memidx, MO_=
TEUL);
> @@ -1004,7 +1004,7 @@ static void _decode_opc(DisasContext * ctx)
>         CHECK_FPU_ENABLED
>          if (ctx->tbflags & FPSCR_SZ) {
>              TCGv_i64 fp =3D tcg_temp_new_i64();
> -            tcg_gen_qemu_ld_i64(fp, REG(B7_4), ctx->memidx, MO_TEQ);
> +            tcg_gen_qemu_ld_i64(fp, REG(B7_4), ctx->memidx, MO_TEUQ);
>              gen_store_fpr64(ctx, fp, XHACK(B11_8));
>              tcg_temp_free_i64(fp);
>         } else {
> @@ -1015,7 +1015,7 @@ static void _decode_opc(DisasContext * ctx)
>         CHECK_FPU_ENABLED
>          if (ctx->tbflags & FPSCR_SZ) {
>              TCGv_i64 fp =3D tcg_temp_new_i64();
> -            tcg_gen_qemu_ld_i64(fp, REG(B7_4), ctx->memidx, MO_TEQ);
> +            tcg_gen_qemu_ld_i64(fp, REG(B7_4), ctx->memidx, MO_TEUQ);
>              gen_store_fpr64(ctx, fp, XHACK(B11_8));
>              tcg_temp_free_i64(fp);
>              tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 8);
> @@ -1032,7 +1032,7 @@ static void _decode_opc(DisasContext * ctx)
>                  TCGv_i64 fp =3D tcg_temp_new_i64();
>                  gen_load_fpr64(ctx, fp, XHACK(B7_4));
>                  tcg_gen_subi_i32(addr, REG(B11_8), 8);
> -                tcg_gen_qemu_st_i64(fp, addr, ctx->memidx, MO_TEQ);
> +                tcg_gen_qemu_st_i64(fp, addr, ctx->memidx, MO_TEUQ);
>                  tcg_temp_free_i64(fp);
>              } else {
>                  tcg_gen_subi_i32(addr, REG(B11_8), 4);
> @@ -1049,7 +1049,7 @@ static void _decode_opc(DisasContext * ctx)
>             tcg_gen_add_i32(addr, REG(B7_4), REG(0));
>              if (ctx->tbflags & FPSCR_SZ) {
>                  TCGv_i64 fp =3D tcg_temp_new_i64();
> -                tcg_gen_qemu_ld_i64(fp, addr, ctx->memidx, MO_TEQ);
> +                tcg_gen_qemu_ld_i64(fp, addr, ctx->memidx, MO_TEUQ);
>                  gen_store_fpr64(ctx, fp, XHACK(B11_8));
>                  tcg_temp_free_i64(fp);
>             } else {
> @@ -1066,7 +1066,7 @@ static void _decode_opc(DisasContext * ctx)
>              if (ctx->tbflags & FPSCR_SZ) {
>                  TCGv_i64 fp =3D tcg_temp_new_i64();
>                  gen_load_fpr64(ctx, fp, XHACK(B7_4));
> -                tcg_gen_qemu_st_i64(fp, addr, ctx->memidx, MO_TEQ);
> +                tcg_gen_qemu_st_i64(fp, addr, ctx->memidx, MO_TEUQ);
>                  tcg_temp_free_i64(fp);
>             } else {
>                  tcg_gen_qemu_st_i32(FREG(B7_4), addr, ctx->memidx, MO_TE=
UL);
> diff --git a/target/sparc/translate.c b/target/sparc/translate.c
> index fdb8bbe5dc..4c7c7b5347 100644
> --- a/target/sparc/translate.c
> +++ b/target/sparc/translate.c
> @@ -2464,7 +2464,7 @@ static void gen_ldstub_asi(DisasContext *dc, TCGv d=
st, TCGv addr, int insn)
>  static void gen_ldf_asi(DisasContext *dc, TCGv addr,
>                          int insn, int size, int rd)
>  {
> -    DisasASI da =3D get_asi(dc, insn, (size =3D=3D 4 ? MO_TEUL : MO_TEQ)=
);
> +    DisasASI da =3D get_asi(dc, insn, (size =3D=3D 4 ? MO_TEUL : MO_TEUQ=
));
>      TCGv_i32 d32;
>      TCGv_i64 d64;
>
> @@ -2578,7 +2578,7 @@ static void gen_ldf_asi(DisasContext *dc, TCGv addr=
,
>  static void gen_stf_asi(DisasContext *dc, TCGv addr,
>                          int insn, int size, int rd)
>  {
> -    DisasASI da =3D get_asi(dc, insn, (size =3D=3D 4 ? MO_TEUL : MO_TEQ)=
);
> +    DisasASI da =3D get_asi(dc, insn, (size =3D=3D 4 ? MO_TEUL : MO_TEUQ=
));
>      TCGv_i32 d32;
>
>      switch (da.type) {
> @@ -2660,7 +2660,7 @@ static void gen_stf_asi(DisasContext *dc, TCGv addr=
,
>
>  static void gen_ldda_asi(DisasContext *dc, TCGv addr, int insn, int rd)
>  {
> -    DisasASI da =3D get_asi(dc, insn, MO_TEQ);
> +    DisasASI da =3D get_asi(dc, insn, MO_TEUQ);
>      TCGv_i64 hi =3D gen_dest_gpr(dc, rd);
>      TCGv_i64 lo =3D gen_dest_gpr(dc, rd + 1);
>
> @@ -2727,7 +2727,7 @@ static void gen_ldda_asi(DisasContext *dc, TCGv add=
r, int insn, int rd)
>  static void gen_stda_asi(DisasContext *dc, TCGv hi, TCGv addr,
>                           int insn, int rd)
>  {
> -    DisasASI da =3D get_asi(dc, insn, MO_TEQ);
> +    DisasASI da =3D get_asi(dc, insn, MO_TEUQ);
>      TCGv lo =3D gen_load_gpr(dc, rd + 1);
>
>      switch (da.type) {
> @@ -2787,7 +2787,7 @@ static void gen_stda_asi(DisasContext *dc, TCGv hi,=
 TCGv addr,
>  static void gen_casx_asi(DisasContext *dc, TCGv addr, TCGv cmpv,
>                           int insn, int rd)
>  {
> -    DisasASI da =3D get_asi(dc, insn, MO_TEQ);
> +    DisasASI da =3D get_asi(dc, insn, MO_TEUQ);
>      TCGv oldv;
>
>      switch (da.type) {
> @@ -2817,7 +2817,7 @@ static void gen_ldda_asi(DisasContext *dc, TCGv add=
r, int insn, int rd)
>      TCGv lo =3D gen_dest_gpr(dc, rd | 1);
>      TCGv hi =3D gen_dest_gpr(dc, rd);
>      TCGv_i64 t64 =3D tcg_temp_new_i64();
> -    DisasASI da =3D get_asi(dc, insn, MO_TEQ);
> +    DisasASI da =3D get_asi(dc, insn, MO_TEUQ);
>
>      switch (da.type) {
>      case GET_ASI_EXCP:
> @@ -2830,7 +2830,7 @@ static void gen_ldda_asi(DisasContext *dc, TCGv add=
r, int insn, int rd)
>      default:
>          {
>              TCGv_i32 r_asi =3D tcg_const_i32(da.asi);
> -            TCGv_i32 r_mop =3D tcg_const_i32(MO_Q);
> +            TCGv_i32 r_mop =3D tcg_const_i32(MO_UQ);
>
>              save_state(dc);
>              gen_helper_ld_asi(t64, cpu_env, addr, r_asi, r_mop);
> @@ -2849,7 +2849,7 @@ static void gen_ldda_asi(DisasContext *dc, TCGv add=
r, int insn, int rd)
>  static void gen_stda_asi(DisasContext *dc, TCGv hi, TCGv addr,
>                           int insn, int rd)
>  {
> -    DisasASI da =3D get_asi(dc, insn, MO_TEQ);
> +    DisasASI da =3D get_asi(dc, insn, MO_TEUQ);
>      TCGv lo =3D gen_load_gpr(dc, rd + 1);
>      TCGv_i64 t64 =3D tcg_temp_new_i64();
>
> @@ -2886,7 +2886,7 @@ static void gen_stda_asi(DisasContext *dc, TCGv hi,=
 TCGv addr,
>      default:
>          {
>              TCGv_i32 r_asi =3D tcg_const_i32(da.asi);
> -            TCGv_i32 r_mop =3D tcg_const_i32(MO_Q);
> +            TCGv_i32 r_mop =3D tcg_const_i32(MO_UQ);
>
>              save_state(dc);
>              gen_helper_st_asi(cpu_env, addr, t64, r_asi, r_mop);
> @@ -5479,7 +5479,7 @@ static void disas_sparc_insn(DisasContext * dc, uns=
igned int insn)
>                      gen_ld_asi(dc, cpu_val, cpu_addr, insn, MO_TESL);
>                      break;
>                  case 0x1b: /* V9 ldxa */
> -                    gen_ld_asi(dc, cpu_val, cpu_addr, insn, MO_TEQ);
> +                    gen_ld_asi(dc, cpu_val, cpu_addr, insn, MO_TEUQ);
>                      break;
>                  case 0x2d: /* V9 prefetch, no effect */
>                      goto skip_move;
> @@ -5533,7 +5533,7 @@ static void disas_sparc_insn(DisasContext * dc, uns=
igned int insn)
>                      if (rd =3D=3D 1) {
>                          TCGv_i64 t64 =3D tcg_temp_new_i64();
>                          tcg_gen_qemu_ld_i64(t64, cpu_addr,
> -                                            dc->mem_idx, MO_TEQ);
> +                                            dc->mem_idx, MO_TEUQ);
>                          gen_helper_ldxfsr(cpu_fsr, cpu_env, cpu_fsr, t64=
);
>                          tcg_temp_free_i64(t64);
>                          break;
> @@ -5549,11 +5549,11 @@ static void disas_sparc_insn(DisasContext * dc, u=
nsigned int insn)
>                      gen_address_mask(dc, cpu_addr);
>                      cpu_src1_64 =3D tcg_temp_new_i64();
>                      tcg_gen_qemu_ld_i64(cpu_src1_64, cpu_addr, dc->mem_i=
dx,
> -                                        MO_TEQ | MO_ALIGN_4);
> +                                        MO_TEUQ | MO_ALIGN_4);
>                      tcg_gen_addi_tl(cpu_addr, cpu_addr, 8);
>                      cpu_src2_64 =3D tcg_temp_new_i64();
>                      tcg_gen_qemu_ld_i64(cpu_src2_64, cpu_addr, dc->mem_i=
dx,
> -                                        MO_TEQ | MO_ALIGN_4);
> +                                        MO_TEUQ | MO_ALIGN_4);
>                      gen_store_fpr_Q(dc, rd, cpu_src1_64, cpu_src2_64);
>                      tcg_temp_free_i64(cpu_src1_64);
>                      tcg_temp_free_i64(cpu_src2_64);
> @@ -5562,7 +5562,7 @@ static void disas_sparc_insn(DisasContext * dc, uns=
igned int insn)
>                      gen_address_mask(dc, cpu_addr);
>                      cpu_dst_64 =3D gen_dest_fpr_D(dc, rd);
>                      tcg_gen_qemu_ld_i64(cpu_dst_64, cpu_addr, dc->mem_id=
x,
> -                                        MO_TEQ | MO_ALIGN_4);
> +                                        MO_TEUQ | MO_ALIGN_4);
>                      gen_store_fpr_D(dc, rd, cpu_dst_64);
>                      break;
>                  default:
> @@ -5623,7 +5623,7 @@ static void disas_sparc_insn(DisasContext * dc, uns=
igned int insn)
>                      tcg_gen_qemu_st64(cpu_val, cpu_addr, dc->mem_idx);
>                      break;
>                  case 0x1e: /* V9 stxa */
> -                    gen_st_asi(dc, cpu_val, cpu_addr, insn, MO_TEQ);
> +                    gen_st_asi(dc, cpu_val, cpu_addr, insn, MO_TEUQ);
>                      break;
>  #endif
>                  default:
> @@ -5664,11 +5664,11 @@ static void disas_sparc_insn(DisasContext * dc, u=
nsigned int insn)
>                         before performing the first write.  */
>                      cpu_src1_64 =3D gen_load_fpr_Q0(dc, rd);
>                      tcg_gen_qemu_st_i64(cpu_src1_64, cpu_addr,
> -                                        dc->mem_idx, MO_TEQ | MO_ALIGN_1=
6);
> +                                        dc->mem_idx, MO_TEUQ | MO_ALIGN_=
16);
>                      tcg_gen_addi_tl(cpu_addr, cpu_addr, 8);
>                      cpu_src2_64 =3D gen_load_fpr_Q1(dc, rd);
>                      tcg_gen_qemu_st_i64(cpu_src1_64, cpu_addr,
> -                                        dc->mem_idx, MO_TEQ);
> +                                        dc->mem_idx, MO_TEUQ);
>                      break;
>  #else /* !TARGET_SPARC64 */
>                      /* stdfq, store floating point queue */
> @@ -5687,7 +5687,7 @@ static void disas_sparc_insn(DisasContext * dc, uns=
igned int insn)
>                      gen_address_mask(dc, cpu_addr);
>                      cpu_src1_64 =3D gen_load_fpr_D(dc, rd);
>                      tcg_gen_qemu_st_i64(cpu_src1_64, cpu_addr, dc->mem_i=
dx,
> -                                        MO_TEQ | MO_ALIGN_4);
> +                                        MO_TEUQ | MO_ALIGN_4);
>                      break;
>                  default:
>                      goto illegal_insn;
> diff --git a/target/tricore/translate.c b/target/tricore/translate.c
> index 07084407cb..417edbd3f0 100644
> --- a/target/tricore/translate.c
> +++ b/target/tricore/translate.c
> @@ -246,7 +246,7 @@ static void gen_st_2regs_64(TCGv rh, TCGv rl, TCGv ad=
dress, DisasContext *ctx)
>      TCGv_i64 temp =3D tcg_temp_new_i64();
>
>      tcg_gen_concat_i32_i64(temp, rl, rh);
> -    tcg_gen_qemu_st_i64(temp, address, ctx->mem_idx, MO_LEQ);
> +    tcg_gen_qemu_st_i64(temp, address, ctx->mem_idx, MO_LEUQ);
>
>      tcg_temp_free_i64(temp);
>  }
> @@ -264,7 +264,7 @@ static void gen_ld_2regs_64(TCGv rh, TCGv rl, TCGv ad=
dress, DisasContext *ctx)
>  {
>      TCGv_i64 temp =3D tcg_temp_new_i64();
>
> -    tcg_gen_qemu_ld_i64(temp, address, ctx->mem_idx, MO_LEQ);
> +    tcg_gen_qemu_ld_i64(temp, address, ctx->mem_idx, MO_LEUQ);
>      /* write back to two 32 bit regs */
>      tcg_gen_extr_i64_i32(rl, rh, temp);
>
> diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
> index 09430c1bf9..b1491ed625 100644
> --- a/target/xtensa/translate.c
> +++ b/target/xtensa/translate.c
> @@ -7077,7 +7077,7 @@ static void translate_ldsti_d(DisasContext *dc, con=
st OpcodeArg arg[],
>      } else {
>          addr =3D arg[1].in;
>      }
> -    mop =3D gen_load_store_alignment(dc, MO_TEQ, addr);
> +    mop =3D gen_load_store_alignment(dc, MO_TEUQ, addr);
>      if (par[0]) {
>          tcg_gen_qemu_st_i64(arg[0].in, addr, dc->cring, mop);
>      } else {
> @@ -7142,7 +7142,7 @@ static void translate_ldstx_d(DisasContext *dc, con=
st OpcodeArg arg[],
>      } else {
>          addr =3D arg[1].in;
>      }
> -    mop =3D gen_load_store_alignment(dc, MO_TEQ, addr);
> +    mop =3D gen_load_store_alignment(dc, MO_TEUQ, addr);
>      if (par[0]) {
>          tcg_gen_qemu_st_i64(arg[0].in, addr, dc->cring, mop);
>      } else {
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 57f17a4649..bb5c546b90 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -1751,12 +1751,12 @@ static const char * const ldst_name[] =3D
>      [MO_LESW] =3D "lesw",
>      [MO_LEUL] =3D "leul",
>      [MO_LESL] =3D "lesl",
> -    [MO_LEQ]  =3D "leq",
> +    [MO_LEUQ] =3D "leq",
>      [MO_BEUW] =3D "beuw",
>      [MO_BESW] =3D "besw",
>      [MO_BEUL] =3D "beul",
>      [MO_BESL] =3D "besl",
> -    [MO_BEQ]  =3D "beq",
> +    [MO_BEUQ] =3D "beq",
>  };
>
>  static const char * const alignment_name[(MO_AMASK >> MO_ASHIFT) + 1] =
=3D {
> diff --git a/tcg/tci.c b/tcg/tci.c
> index e76087ccac..336af5945a 100644
> --- a/tcg/tci.c
> +++ b/tcg/tci.c
> @@ -309,7 +309,7 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target=
_ulong taddr,
>          return helper_le_ldul_mmu(env, taddr, oi, ra);
>      case MO_LESL:
>          return helper_le_ldsl_mmu(env, taddr, oi, ra);
> -    case MO_LEQ:
> +    case MO_LEUQ:
>          return helper_le_ldq_mmu(env, taddr, oi, ra);
>      case MO_BEUW:
>          return helper_be_lduw_mmu(env, taddr, oi, ra);
> @@ -319,7 +319,7 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target=
_ulong taddr,
>          return helper_be_ldul_mmu(env, taddr, oi, ra);
>      case MO_BESL:
>          return helper_be_ldsl_mmu(env, taddr, oi, ra);
> -    case MO_BEQ:
> +    case MO_BEUQ:
>          return helper_be_ldq_mmu(env, taddr, oi, ra);
>      default:
>          g_assert_not_reached();
> @@ -348,7 +348,7 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target=
_ulong taddr,
>      case MO_LESL:
>          ret =3D (int32_t)ldl_le_p(haddr);
>          break;
> -    case MO_LEQ:
> +    case MO_LEUQ:
>          ret =3D ldq_le_p(haddr);
>          break;
>      case MO_BEUW:
> @@ -363,7 +363,7 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target=
_ulong taddr,
>      case MO_BESL:
>          ret =3D (int32_t)ldl_be_p(haddr);
>          break;
> -    case MO_BEQ:
> +    case MO_BEUQ:
>          ret =3D ldq_be_p(haddr);
>          break;
>      default:
> @@ -391,7 +391,7 @@ static void tci_qemu_st(CPUArchState *env, target_ulo=
ng taddr, uint64_t val,
>      case MO_LEUL:
>          helper_le_stl_mmu(env, taddr, val, oi, ra);
>          break;
> -    case MO_LEQ:
> +    case MO_LEUQ:
>          helper_le_stq_mmu(env, taddr, val, oi, ra);
>          break;
>      case MO_BEUW:
> @@ -400,7 +400,7 @@ static void tci_qemu_st(CPUArchState *env, target_ulo=
ng taddr, uint64_t val,
>      case MO_BEUL:
>          helper_be_stl_mmu(env, taddr, val, oi, ra);
>          break;
> -    case MO_BEQ:
> +    case MO_BEUQ:
>          helper_be_stq_mmu(env, taddr, val, oi, ra);
>          break;
>      default:
> @@ -420,7 +420,7 @@ static void tci_qemu_st(CPUArchState *env, target_ulo=
ng taddr, uint64_t val,
>      case MO_LEUL:
>          stl_le_p(haddr, val);
>          break;
> -    case MO_LEQ:
> +    case MO_LEUQ:
>          stq_le_p(haddr, val);
>          break;
>      case MO_BEUW:
> @@ -429,7 +429,7 @@ static void tci_qemu_st(CPUArchState *env, target_ulo=
ng taddr, uint64_t val,
>      case MO_BEUL:
>          stl_be_p(haddr, val);
>          break;
> -    case MO_BEQ:
> +    case MO_BEUQ:
>          stq_be_p(haddr, val);
>          break;
>      default:
> diff --git a/accel/tcg/ldst_common.c.inc b/accel/tcg/ldst_common.c.inc
> index bfefb275e7..6ac8d871a3 100644
> --- a/accel/tcg/ldst_common.c.inc
> +++ b/accel/tcg/ldst_common.c.inc
> @@ -45,7 +45,7 @@ uint32_t cpu_ldl_be_mmuidx_ra(CPUArchState *env, abi_pt=
r addr,
>  uint64_t cpu_ldq_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
>                                int mmu_idx, uintptr_t ra)
>  {
> -    MemOpIdx oi =3D make_memop_idx(MO_BEQ | MO_UNALN, mmu_idx);
> +    MemOpIdx oi =3D make_memop_idx(MO_BEUQ | MO_UNALN, mmu_idx);
>      return cpu_ldq_be_mmu(env, addr, oi, ra);
>  }
>
> @@ -72,7 +72,7 @@ uint32_t cpu_ldl_le_mmuidx_ra(CPUArchState *env, abi_pt=
r addr,
>  uint64_t cpu_ldq_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
>                                int mmu_idx, uintptr_t ra)
>  {
> -    MemOpIdx oi =3D make_memop_idx(MO_LEQ | MO_UNALN, mmu_idx);
> +    MemOpIdx oi =3D make_memop_idx(MO_LEUQ | MO_UNALN, mmu_idx);
>      return cpu_ldq_le_mmu(env, addr, oi, ra);
>  }
>
> @@ -100,7 +100,7 @@ void cpu_stl_be_mmuidx_ra(CPUArchState *env, abi_ptr =
addr, uint32_t val,
>  void cpu_stq_be_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint64_t val,
>                            int mmu_idx, uintptr_t ra)
>  {
> -    MemOpIdx oi =3D make_memop_idx(MO_BEQ | MO_UNALN, mmu_idx);
> +    MemOpIdx oi =3D make_memop_idx(MO_BEUQ | MO_UNALN, mmu_idx);
>      cpu_stq_be_mmu(env, addr, val, oi, ra);
>  }
>
> @@ -121,7 +121,7 @@ void cpu_stl_le_mmuidx_ra(CPUArchState *env, abi_ptr =
addr, uint32_t val,
>  void cpu_stq_le_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint64_t val,
>                            int mmu_idx, uintptr_t ra)
>  {
> -    MemOpIdx oi =3D make_memop_idx(MO_LEQ | MO_UNALN, mmu_idx);
> +    MemOpIdx oi =3D make_memop_idx(MO_LEUQ | MO_UNALN, mmu_idx);
>      cpu_stq_le_mmu(env, addr, val, oi, ra);
>  }
>
> diff --git a/target/mips/tcg/micromips_translate.c.inc b/target/mips/tcg/=
micromips_translate.c.inc
> index 0da4c802a3..0760941431 100644
> --- a/target/mips/tcg/micromips_translate.c.inc
> +++ b/target/mips/tcg/micromips_translate.c.inc
> @@ -1001,20 +1001,20 @@ static void gen_ldst_pair(DisasContext *ctx, uint=
32_t opc, int rd,
>              gen_reserved_instruction(ctx);
>              return;
>          }
> -        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TEQ);
> +        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TEUQ);
>          gen_store_gpr(t1, rd);
>          tcg_gen_movi_tl(t1, 8);
>          gen_op_addr_add(ctx, t0, t0, t1);
> -        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TEQ);
> +        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TEUQ);
>          gen_store_gpr(t1, rd + 1);
>          break;
>      case SDP:
>          gen_load_gpr(t1, rd);
> -        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEQ);
> +        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUQ);
>          tcg_gen_movi_tl(t1, 8);
>          gen_op_addr_add(ctx, t0, t0, t1);
>          gen_load_gpr(t1, rd + 1);
> -        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEQ);
> +        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUQ);
>          break;
>  #endif
>      }
> @@ -2578,7 +2578,7 @@ static void decode_micromips32_opc(CPUMIPSState *en=
v, DisasContext *ctx)
>          case SCD:
>              check_insn(ctx, ISA_MIPS3);
>              check_mips_64(ctx);
> -            gen_st_cond(ctx, rt, rs, offset, MO_TEQ, false);
> +            gen_st_cond(ctx, rt, rs, offset, MO_TEUQ, false);
>              break;
>  #endif
>          case LD_EVA:
> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/tran=
slate/fixedpoint-impl.c.inc
> index 7fecff4579..1aab32be03 100644
> --- a/target/ppc/translate/fixedpoint-impl.c.inc
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -137,7 +137,7 @@ static bool do_ldst_quad(DisasContext *ctx, arg_D *a,=
 bool store, bool prefixed)
>              ctx->base.is_jmp =3D DISAS_NORETURN;
>          }
>      } else {
> -        mop =3D DEF_MEMOP(MO_Q);
> +        mop =3D DEF_MEMOP(MO_UQ);
>          if (store) {
>              tcg_gen_qemu_st_i64(low_addr_gpr, ea, ctx->mem_idx, mop);
>          } else {
> @@ -205,11 +205,11 @@ TRANS64(LWAUX, do_ldst_X, true, false, MO_SL)
>  TRANS64(PLWA, do_ldst_PLS_D, false, false, MO_SL)
>
>  /* Load Doubleword */
> -TRANS64(LD, do_ldst_D, false, false, MO_Q)
> -TRANS64(LDX, do_ldst_X, false, false, MO_Q)
> -TRANS64(LDU, do_ldst_D, true, false, MO_Q)
> -TRANS64(LDUX, do_ldst_X, true, false, MO_Q)
> -TRANS64(PLD, do_ldst_PLS_D, false, false, MO_Q)
> +TRANS64(LD, do_ldst_D, false, false, MO_UQ)
> +TRANS64(LDX, do_ldst_X, false, false, MO_UQ)
> +TRANS64(LDU, do_ldst_D, true, false, MO_UQ)
> +TRANS64(LDUX, do_ldst_X, true, false, MO_UQ)
> +TRANS64(PLD, do_ldst_PLS_D, false, false, MO_UQ)
>
>  /* Load Quadword */
>  TRANS64(LQ, do_ldst_quad, false, false);
> @@ -237,11 +237,11 @@ TRANS(STWUX, do_ldst_X, true, true, MO_UL)
>  TRANS(PSTW, do_ldst_PLS_D, false, true, MO_UL)
>
>  /* Store Doubleword */
> -TRANS64(STD, do_ldst_D, false, true, MO_Q)
> -TRANS64(STDX, do_ldst_X, false, true, MO_Q)
> -TRANS64(STDU, do_ldst_D, true, true, MO_Q)
> -TRANS64(STDUX, do_ldst_X, true, true, MO_Q)
> -TRANS64(PSTD, do_ldst_PLS_D, false, true, MO_Q)
> +TRANS64(STD, do_ldst_D, false, true, MO_UQ)
> +TRANS64(STDX, do_ldst_X, false, true, MO_UQ)
> +TRANS64(STDU, do_ldst_D, true, true, MO_UQ)
> +TRANS64(STDUX, do_ldst_X, true, true, MO_UQ)
> +TRANS64(PSTD, do_ldst_PLS_D, false, true, MO_UQ)
>
>  /* Store Quadword */
>  TRANS64(STQ, do_ldst_quad, true, false);
> diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp=
-impl.c.inc
> index c9e05201d9..5e146a4345 100644
> --- a/target/ppc/translate/fp-impl.c.inc
> +++ b/target/ppc/translate/fp-impl.c.inc
> @@ -876,7 +876,7 @@ static void gen_lfdepx(DisasContext *ctx)
>      EA =3D tcg_temp_new();
>      t0 =3D tcg_temp_new_i64();
>      gen_addr_reg_index(ctx, EA);
> -    tcg_gen_qemu_ld_i64(t0, EA, PPC_TLB_EPID_LOAD, DEF_MEMOP(MO_Q));
> +    tcg_gen_qemu_ld_i64(t0, EA, PPC_TLB_EPID_LOAD, DEF_MEMOP(MO_UQ));
>      set_fpr(rD(ctx->opcode), t0);
>      tcg_temp_free(EA);
>      tcg_temp_free_i64(t0);
> @@ -1034,7 +1034,7 @@ static void gen_stfdepx(DisasContext *ctx)
>      t0 =3D tcg_temp_new_i64();
>      gen_addr_reg_index(ctx, EA);
>      get_fpr(t0, rD(ctx->opcode));
> -    tcg_gen_qemu_st_i64(t0, EA, PPC_TLB_EPID_STORE, DEF_MEMOP(MO_Q));
> +    tcg_gen_qemu_st_i64(t0, EA, PPC_TLB_EPID_STORE, DEF_MEMOP(MO_UQ));
>      tcg_temp_free(EA);
>      tcg_temp_free_i64(t0);
>  }
> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
> index c0e38060b4..091619915d 100644
> --- a/target/ppc/translate/vsx-impl.c.inc
> +++ b/target/ppc/translate/vsx-impl.c.inc
> @@ -85,19 +85,19 @@ static void gen_lxvw4x(DisasContext *ctx)
>          TCGv_i64 t0 =3D tcg_temp_new_i64();
>          TCGv_i64 t1 =3D tcg_temp_new_i64();
>
> -        tcg_gen_qemu_ld_i64(t0, EA, ctx->mem_idx, MO_LEQ);
> +        tcg_gen_qemu_ld_i64(t0, EA, ctx->mem_idx, MO_LEUQ);
>          tcg_gen_shri_i64(t1, t0, 32);
>          tcg_gen_deposit_i64(xth, t1, t0, 32, 32);
>          tcg_gen_addi_tl(EA, EA, 8);
> -        tcg_gen_qemu_ld_i64(t0, EA, ctx->mem_idx, MO_LEQ);
> +        tcg_gen_qemu_ld_i64(t0, EA, ctx->mem_idx, MO_LEUQ);
>          tcg_gen_shri_i64(t1, t0, 32);
>          tcg_gen_deposit_i64(xtl, t1, t0, 32, 32);
>          tcg_temp_free_i64(t0);
>          tcg_temp_free_i64(t1);
>      } else {
> -        tcg_gen_qemu_ld_i64(xth, EA, ctx->mem_idx, MO_BEQ);
> +        tcg_gen_qemu_ld_i64(xth, EA, ctx->mem_idx, MO_BEUQ);
>          tcg_gen_addi_tl(EA, EA, 8);
> -        tcg_gen_qemu_ld_i64(xtl, EA, ctx->mem_idx, MO_BEQ);
> +        tcg_gen_qemu_ld_i64(xtl, EA, ctx->mem_idx, MO_BEUQ);
>      }
>      set_cpu_vsr(xT(ctx->opcode), xth, true);
>      set_cpu_vsr(xT(ctx->opcode), xtl, false);
> @@ -152,8 +152,8 @@ static void gen_lxvdsx(DisasContext *ctx)
>      gen_addr_reg_index(ctx, EA);
>
>      data =3D tcg_temp_new_i64();
> -    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, DEF_MEMOP(MO_Q));
> -    tcg_gen_gvec_dup_i64(MO_Q, vsr_full_offset(xT(ctx->opcode)), 16, 16,=
 data);
> +    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, DEF_MEMOP(MO_UQ));
> +    tcg_gen_gvec_dup_i64(MO_UQ, vsr_full_offset(xT(ctx->opcode)), 16, 16=
, data);
>
>      tcg_temp_free(EA);
>      tcg_temp_free_i64(data);
> @@ -217,9 +217,9 @@ static void gen_lxvh8x(DisasContext *ctx)
>
>      EA =3D tcg_temp_new();
>      gen_addr_reg_index(ctx, EA);
> -    tcg_gen_qemu_ld_i64(xth, EA, ctx->mem_idx, MO_BEQ);
> +    tcg_gen_qemu_ld_i64(xth, EA, ctx->mem_idx, MO_BEUQ);
>      tcg_gen_addi_tl(EA, EA, 8);
> -    tcg_gen_qemu_ld_i64(xtl, EA, ctx->mem_idx, MO_BEQ);
> +    tcg_gen_qemu_ld_i64(xtl, EA, ctx->mem_idx, MO_BEUQ);
>      if (ctx->le_mode) {
>          gen_bswap16x8(xth, xtl, xth, xtl);
>      }
> @@ -245,9 +245,9 @@ static void gen_lxvb16x(DisasContext *ctx)
>      gen_set_access_type(ctx, ACCESS_INT);
>      EA =3D tcg_temp_new();
>      gen_addr_reg_index(ctx, EA);
> -    tcg_gen_qemu_ld_i64(xth, EA, ctx->mem_idx, MO_BEQ);
> +    tcg_gen_qemu_ld_i64(xth, EA, ctx->mem_idx, MO_BEUQ);
>      tcg_gen_addi_tl(EA, EA, 8);
> -    tcg_gen_qemu_ld_i64(xtl, EA, ctx->mem_idx, MO_BEQ);
> +    tcg_gen_qemu_ld_i64(xtl, EA, ctx->mem_idx, MO_BEUQ);
>      set_cpu_vsr(xT(ctx->opcode), xth, true);
>      set_cpu_vsr(xT(ctx->opcode), xtl, false);
>      tcg_temp_free(EA);
> @@ -382,17 +382,17 @@ static void gen_stxvw4x(DisasContext *ctx)
>
>          tcg_gen_shri_i64(t0, xsh, 32);
>          tcg_gen_deposit_i64(t1, t0, xsh, 32, 32);
> -        tcg_gen_qemu_st_i64(t1, EA, ctx->mem_idx, MO_LEQ);
> +        tcg_gen_qemu_st_i64(t1, EA, ctx->mem_idx, MO_LEUQ);
>          tcg_gen_addi_tl(EA, EA, 8);
>          tcg_gen_shri_i64(t0, xsl, 32);
>          tcg_gen_deposit_i64(t1, t0, xsl, 32, 32);
> -        tcg_gen_qemu_st_i64(t1, EA, ctx->mem_idx, MO_LEQ);
> +        tcg_gen_qemu_st_i64(t1, EA, ctx->mem_idx, MO_LEUQ);
>          tcg_temp_free_i64(t0);
>          tcg_temp_free_i64(t1);
>      } else {
> -        tcg_gen_qemu_st_i64(xsh, EA, ctx->mem_idx, MO_BEQ);
> +        tcg_gen_qemu_st_i64(xsh, EA, ctx->mem_idx, MO_BEUQ);
>          tcg_gen_addi_tl(EA, EA, 8);
> -        tcg_gen_qemu_st_i64(xsl, EA, ctx->mem_idx, MO_BEQ);
> +        tcg_gen_qemu_st_i64(xsl, EA, ctx->mem_idx, MO_BEUQ);
>      }
>      tcg_temp_free(EA);
>      tcg_temp_free_i64(xsh);
> @@ -421,15 +421,15 @@ static void gen_stxvh8x(DisasContext *ctx)
>          TCGv_i64 outl =3D tcg_temp_new_i64();
>
>          gen_bswap16x8(outh, outl, xsh, xsl);
> -        tcg_gen_qemu_st_i64(outh, EA, ctx->mem_idx, MO_BEQ);
> +        tcg_gen_qemu_st_i64(outh, EA, ctx->mem_idx, MO_BEUQ);
>          tcg_gen_addi_tl(EA, EA, 8);
> -        tcg_gen_qemu_st_i64(outl, EA, ctx->mem_idx, MO_BEQ);
> +        tcg_gen_qemu_st_i64(outl, EA, ctx->mem_idx, MO_BEUQ);
>          tcg_temp_free_i64(outh);
>          tcg_temp_free_i64(outl);
>      } else {
> -        tcg_gen_qemu_st_i64(xsh, EA, ctx->mem_idx, MO_BEQ);
> +        tcg_gen_qemu_st_i64(xsh, EA, ctx->mem_idx, MO_BEUQ);
>          tcg_gen_addi_tl(EA, EA, 8);
> -        tcg_gen_qemu_st_i64(xsl, EA, ctx->mem_idx, MO_BEQ);
> +        tcg_gen_qemu_st_i64(xsl, EA, ctx->mem_idx, MO_BEUQ);
>      }
>      tcg_temp_free(EA);
>      tcg_temp_free_i64(xsh);
> @@ -453,9 +453,9 @@ static void gen_stxvb16x(DisasContext *ctx)
>      gen_set_access_type(ctx, ACCESS_INT);
>      EA =3D tcg_temp_new();
>      gen_addr_reg_index(ctx, EA);
> -    tcg_gen_qemu_st_i64(xsh, EA, ctx->mem_idx, MO_BEQ);
> +    tcg_gen_qemu_st_i64(xsh, EA, ctx->mem_idx, MO_BEUQ);
>      tcg_gen_addi_tl(EA, EA, 8);
> -    tcg_gen_qemu_st_i64(xsl, EA, ctx->mem_idx, MO_BEQ);
> +    tcg_gen_qemu_st_i64(xsl, EA, ctx->mem_idx, MO_BEUQ);
>      tcg_temp_free(EA);
>      tcg_temp_free_i64(xsh);
>      tcg_temp_free_i64(xsl);
> @@ -2021,7 +2021,7 @@ static bool do_lstxv(DisasContext *ctx, int ra, TCG=
v displ,
>
>      xt =3D tcg_temp_new_i64();
>
> -    mop =3D DEF_MEMOP(MO_Q);
> +    mop =3D DEF_MEMOP(MO_UQ);
>
>      gen_set_access_type(ctx, ACCESS_INT);
>      ea =3D do_ea_calc(ctx, ra, displ);
> diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_=
trans/trans_rva.c.inc
> index 40fe132b04..86032fa9a7 100644
> --- a/target/riscv/insn_trans/trans_rva.c.inc
> +++ b/target/riscv/insn_trans/trans_rva.c.inc
> @@ -162,65 +162,65 @@ static bool trans_amomaxu_w(DisasContext *ctx, arg_=
amomaxu_w *a)
>  static bool trans_lr_d(DisasContext *ctx, arg_lr_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    return gen_lr(ctx, a, MO_ALIGN | MO_TEQ);
> +    return gen_lr(ctx, a, MO_ALIGN | MO_TEUQ);
>  }
>
>  static bool trans_sc_d(DisasContext *ctx, arg_sc_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    return gen_sc(ctx, a, (MO_ALIGN | MO_TEQ));
> +    return gen_sc(ctx, a, (MO_ALIGN | MO_TEUQ));
>  }
>
>  static bool trans_amoswap_d(DisasContext *ctx, arg_amoswap_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, (MO_ALIGN | MO_TEQ))=
;
> +    return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, (MO_ALIGN | MO_TEUQ)=
);
>  }
>
>  static bool trans_amoadd_d(DisasContext *ctx, arg_amoadd_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl, (MO_ALIGN | MO_=
TEQ));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl, (MO_ALIGN | MO_=
TEUQ));
>  }
>
>  static bool trans_amoxor_d(DisasContext *ctx, arg_amoxor_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl, (MO_ALIGN | MO_=
TEQ));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl, (MO_ALIGN | MO_=
TEUQ));
>  }
>
>  static bool trans_amoand_d(DisasContext *ctx, arg_amoand_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl, (MO_ALIGN | MO_=
TEQ));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl, (MO_ALIGN | MO_=
TEUQ));
>  }
>
>  static bool trans_amoor_d(DisasContext *ctx, arg_amoor_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl, (MO_ALIGN | MO_T=
EQ));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl, (MO_ALIGN | MO_T=
EUQ));
>  }
>
>  static bool trans_amomin_d(DisasContext *ctx, arg_amomin_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl, (MO_ALIGN | MO=
_TEQ));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl, (MO_ALIGN | MO=
_TEUQ));
>  }
>
>  static bool trans_amomax_d(DisasContext *ctx, arg_amomax_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl, (MO_ALIGN | MO=
_TEQ));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl, (MO_ALIGN | MO=
_TEUQ));
>  }
>
>  static bool trans_amominu_d(DisasContext *ctx, arg_amominu_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl, (MO_ALIGN | MO=
_TEQ));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl, (MO_ALIGN | MO=
_TEUQ));
>  }
>
>  static bool trans_amomaxu_d(DisasContext *ctx, arg_amomaxu_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, (MO_ALIGN | MO=
_TEQ));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, (MO_ALIGN | MO=
_TEUQ));
>  }
> diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_=
trans/trans_rvd.c.inc
> index 64fb0046f7..ed444b042a 100644
> --- a/target/riscv/insn_trans/trans_rvd.c.inc
> +++ b/target/riscv/insn_trans/trans_rvd.c.inc
> @@ -33,7 +33,7 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
>      }
>      addr =3D gen_pm_adjust_address(ctx, addr);
>
> -    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], addr, ctx->mem_idx, MO_TEQ);
> +    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], addr, ctx->mem_idx, MO_TEUQ);
>
>      mark_fs_dirty(ctx);
>      return true;
> @@ -54,7 +54,7 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
>      }
>      addr =3D gen_pm_adjust_address(ctx, addr);
>
> -    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEQ);
> +    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEUQ);
>
>      return true;
>  }
> diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_=
trans/trans_rvh.c.inc
> index ecbf77ff9c..cebcb3f8f6 100644
> --- a/target/riscv/insn_trans/trans_rvh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvh.c.inc
> @@ -121,14 +121,14 @@ static bool trans_hlv_d(DisasContext *ctx, arg_hlv_=
d *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_EXT(ctx, RVH);
> -    return do_hlv(ctx, a, MO_TEQ);
> +    return do_hlv(ctx, a, MO_TEUQ);
>  }
>
>  static bool trans_hsv_d(DisasContext *ctx, arg_hsv_d *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_EXT(ctx, RVH);
> -    return do_hsv(ctx, a, MO_TEQ);
> +    return do_hsv(ctx, a, MO_TEUQ);
>  }
>
>  #ifndef CONFIG_USER_ONLY
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
> index e51dbc41c5..4a2aefe3a5 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -216,13 +216,13 @@ static bool trans_lwu(DisasContext *ctx, arg_lwu *a=
)
>  static bool trans_ld(DisasContext *ctx, arg_ld *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    return gen_load(ctx, a, MO_TEQ);
> +    return gen_load(ctx, a, MO_TEUQ);
>  }
>
>  static bool trans_sd(DisasContext *ctx, arg_sd *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    return gen_store(ctx, a, MO_TEQ);
> +    return gen_store(ctx, a, MO_TEUQ);
>  }
>
>  static bool trans_addi(DisasContext *ctx, arg_addi *a)
> diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/trans=
late_vx.c.inc
> index 28bf5a23b6..98eb7710a4 100644
> --- a/target/s390x/tcg/translate_vx.c.inc
> +++ b/target/s390x/tcg/translate_vx.c.inc
> @@ -424,9 +424,9 @@ static DisasJumpType op_vl(DisasContext *s, DisasOps =
*o)
>      TCGv_i64 t0 =3D tcg_temp_new_i64();
>      TCGv_i64 t1 =3D tcg_temp_new_i64();
>
> -    tcg_gen_qemu_ld_i64(t0, o->addr1, get_mem_index(s), MO_TEQ);
> +    tcg_gen_qemu_ld_i64(t0, o->addr1, get_mem_index(s), MO_TEUQ);
>      gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
> -    tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_TEQ);
> +    tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_TEUQ);
>      write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
>      write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
>      tcg_temp_free(t0);
> @@ -592,16 +592,16 @@ static DisasJumpType op_vlm(DisasContext *s, DisasO=
ps *o)
>      t0 =3D tcg_temp_new_i64();
>      t1 =3D tcg_temp_new_i64();
>      gen_addi_and_wrap_i64(s, t0, o->addr1, (v3 - v1) * 16 + 8);
> -    tcg_gen_qemu_ld_i64(t0, t0, get_mem_index(s), MO_TEQ);
> +    tcg_gen_qemu_ld_i64(t0, t0, get_mem_index(s), MO_TEUQ);
>
>      for (;; v1++) {
> -        tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_TEQ);
> +        tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_TEUQ);
>          write_vec_element_i64(t1, v1, 0, ES_64);
>          if (v1 =3D=3D v3) {
>              break;
>          }
>          gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
> -        tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_TEQ);
> +        tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_TEUQ);
>          write_vec_element_i64(t1, v1, 1, ES_64);
>          gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
>      }
> @@ -950,10 +950,10 @@ static DisasJumpType op_vst(DisasContext *s, DisasO=
ps *o)
>      gen_helper_probe_write_access(cpu_env, o->addr1, tmp);
>
>      read_vec_element_i64(tmp,  get_field(s, v1), 0, ES_64);
> -    tcg_gen_qemu_st_i64(tmp, o->addr1, get_mem_index(s), MO_TEQ);
> +    tcg_gen_qemu_st_i64(tmp, o->addr1, get_mem_index(s), MO_TEUQ);
>      gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
>      read_vec_element_i64(tmp,  get_field(s, v1), 1, ES_64);
> -    tcg_gen_qemu_st_i64(tmp, o->addr1, get_mem_index(s), MO_TEQ);
> +    tcg_gen_qemu_st_i64(tmp, o->addr1, get_mem_index(s), MO_TEUQ);
>      tcg_temp_free_i64(tmp);
>      return DISAS_NEXT;
>  }
> @@ -993,10 +993,10 @@ static DisasJumpType op_vstm(DisasContext *s, Disas=
Ops *o)
>
>      for (;; v1++) {
>          read_vec_element_i64(tmp, v1, 0, ES_64);
> -        tcg_gen_qemu_st_i64(tmp, o->addr1, get_mem_index(s), MO_TEQ);
> +        tcg_gen_qemu_st_i64(tmp, o->addr1, get_mem_index(s), MO_TEUQ);
>          gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
>          read_vec_element_i64(tmp, v1, 1, ES_64);
> -        tcg_gen_qemu_st_i64(tmp, o->addr1, get_mem_index(s), MO_TEQ);
> +        tcg_gen_qemu_st_i64(tmp, o->addr1, get_mem_index(s), MO_TEUQ);
>          if (v1 =3D=3D v3) {
>              break;
>          }
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index 5edca8d44d..a8db553287 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -1744,7 +1744,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, M=
emOp memop, TCGType ext,
>      case MO_SL:
>          tcg_out_ldst_r(s, I3312_LDRSWX, data_r, addr_r, otype, off_r);
>          break;
> -    case MO_Q:
> +    case MO_UQ:
>          tcg_out_ldst_r(s, I3312_LDRX, data_r, addr_r, otype, off_r);
>          break;
>      default:
> diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
> index 633b8a37ba..c2f0faa623 100644
> --- a/tcg/arm/tcg-target.c.inc
> +++ b/tcg/arm/tcg-target.c.inc
> @@ -1443,13 +1443,13 @@ static void * const qemu_ld_helpers[MO_SSIZE + 1]=
 =3D {
>  #ifdef HOST_WORDS_BIGENDIAN
>      [MO_UW] =3D helper_be_lduw_mmu,
>      [MO_UL] =3D helper_be_ldul_mmu,
> -    [MO_Q]  =3D helper_be_ldq_mmu,
> +    [MO_UQ] =3D helper_be_ldq_mmu,
>      [MO_SW] =3D helper_be_ldsw_mmu,
>      [MO_SL] =3D helper_be_ldul_mmu,
>  #else
>      [MO_UW] =3D helper_le_lduw_mmu,
>      [MO_UL] =3D helper_le_ldul_mmu,
> -    [MO_Q]  =3D helper_le_ldq_mmu,
> +    [MO_UQ] =3D helper_le_ldq_mmu,
>      [MO_SW] =3D helper_le_ldsw_mmu,
>      [MO_SL] =3D helper_le_ldul_mmu,
>  #endif
> @@ -1694,7 +1694,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s=
, TCGLabelQemuLdst *lb)
>      default:
>          tcg_out_mov_reg(s, COND_AL, datalo, TCG_REG_R0);
>          break;
> -    case MO_Q:
> +    case MO_UQ:
>          if (datalo !=3D TCG_REG_R1) {
>              tcg_out_mov_reg(s, COND_AL, datalo, TCG_REG_R0);
>              tcg_out_mov_reg(s, COND_AL, datahi, TCG_REG_R1);
> @@ -1781,7 +1781,7 @@ static void tcg_out_qemu_ld_index(TCGContext *s, Me=
mOp opc,
>      case MO_UL:
>          tcg_out_ld32_r(s, COND_AL, datalo, addrlo, addend);
>          break;
> -    case MO_Q:
> +    case MO_UQ:
>          /* Avoid ldrd for user-only emulation, to handle unaligned.  */
>          if (USING_SOFTMMU && use_armv6_instructions
>              && (datalo & 1) =3D=3D 0 && datahi =3D=3D datalo + 1) {
> @@ -1824,7 +1824,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, M=
emOp opc, TCGReg datalo,
>      case MO_UL:
>          tcg_out_ld32_12(s, COND_AL, datalo, addrlo, 0);
>          break;
> -    case MO_Q:
> +    case MO_UQ:
>          /* Avoid ldrd for user-only emulation, to handle unaligned.  */
>          if (USING_SOFTMMU && use_armv6_instructions
>              && (datalo & 1) =3D=3D 0 && datahi =3D=3D datalo + 1) {
> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> index 84b109bb84..875311f795 100644
> --- a/tcg/i386/tcg-target.c.inc
> +++ b/tcg/i386/tcg-target.c.inc
> @@ -1615,10 +1615,10 @@ static void * const qemu_ld_helpers[(MO_SIZE | MO=
_BSWAP) + 1] =3D {
>      [MO_UB]   =3D helper_ret_ldub_mmu,
>      [MO_LEUW] =3D helper_le_lduw_mmu,
>      [MO_LEUL] =3D helper_le_ldul_mmu,
> -    [MO_LEQ]  =3D helper_le_ldq_mmu,
> +    [MO_LEUQ] =3D helper_le_ldq_mmu,
>      [MO_BEUW] =3D helper_be_lduw_mmu,
>      [MO_BEUL] =3D helper_be_ldul_mmu,
> -    [MO_BEQ]  =3D helper_be_ldq_mmu,
> +    [MO_BEUQ] =3D helper_be_ldq_mmu,
>  };
>
>  /* helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
> @@ -1628,10 +1628,10 @@ static void * const qemu_st_helpers[(MO_SIZE | MO=
_BSWAP) + 1] =3D {
>      [MO_UB]   =3D helper_ret_stb_mmu,
>      [MO_LEUW] =3D helper_le_stw_mmu,
>      [MO_LEUL] =3D helper_le_stl_mmu,
> -    [MO_LEQ]  =3D helper_le_stq_mmu,
> +    [MO_LEUQ] =3D helper_le_stq_mmu,
>      [MO_BEUW] =3D helper_be_stw_mmu,
>      [MO_BEUL] =3D helper_be_stl_mmu,
> -    [MO_BEQ]  =3D helper_be_stq_mmu,
> +    [MO_BEUQ] =3D helper_be_stq_mmu,
>  };
>
>  /* Perform the TLB load and compare.
> @@ -1827,7 +1827,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s=
, TCGLabelQemuLdst *l)
>      case MO_UL:
>          tcg_out_mov(s, TCG_TYPE_I32, data_reg, TCG_REG_EAX);
>          break;
> -    case MO_Q:
> +    case MO_UQ:
>          if (TCG_TARGET_REG_BITS =3D=3D 64) {
>              tcg_out_mov(s, TCG_TYPE_I64, data_reg, TCG_REG_RAX);
>          } else if (data_reg =3D=3D TCG_REG_EDX) {
> @@ -2019,7 +2019,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, T=
CGReg datalo, TCGReg datahi,
>          }
>          break;
>  #endif
> -    case MO_Q:
> +    case MO_UQ:
>          if (TCG_TARGET_REG_BITS =3D=3D 64) {
>              tcg_out_modrm_sib_offset(s, movop + P_REXW + seg, datalo,
>                                       base, index, 0, ofs);
> diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
> index d8f6914f03..27b020e66c 100644
> --- a/tcg/mips/tcg-target.c.inc
> +++ b/tcg/mips/tcg-target.c.inc
> @@ -1023,11 +1023,11 @@ static void * const qemu_ld_helpers[(MO_SSIZE | M=
O_BSWAP) + 1] =3D {
>      [MO_LEUW] =3D helper_le_lduw_mmu,
>      [MO_LESW] =3D helper_le_ldsw_mmu,
>      [MO_LEUL] =3D helper_le_ldul_mmu,
> -    [MO_LEQ]  =3D helper_le_ldq_mmu,
> +    [MO_LEUQ] =3D helper_le_ldq_mmu,
>      [MO_BEUW] =3D helper_be_lduw_mmu,
>      [MO_BESW] =3D helper_be_ldsw_mmu,
>      [MO_BEUL] =3D helper_be_ldul_mmu,
> -    [MO_BEQ]  =3D helper_be_ldq_mmu,
> +    [MO_BEUQ] =3D helper_be_ldq_mmu,
>  #if TCG_TARGET_REG_BITS =3D=3D 64
>      [MO_LESL] =3D helper_le_ldsl_mmu,
>      [MO_BESL] =3D helper_be_ldsl_mmu,
> @@ -1038,10 +1038,10 @@ static void * const qemu_st_helpers[(MO_SIZE | MO=
_BSWAP) + 1] =3D {
>      [MO_UB]   =3D helper_ret_stb_mmu,
>      [MO_LEUW] =3D helper_le_stw_mmu,
>      [MO_LEUL] =3D helper_le_stl_mmu,
> -    [MO_LEQ]  =3D helper_le_stq_mmu,
> +    [MO_LEUQ] =3D helper_le_stq_mmu,
>      [MO_BEUW] =3D helper_be_stw_mmu,
>      [MO_BEUL] =3D helper_be_stl_mmu,
> -    [MO_BEQ]  =3D helper_be_stq_mmu,
> +    [MO_BEUQ] =3D helper_be_stq_mmu,
>  };
>
>  /* Helper routines for marshalling helper function arguments into
> @@ -1384,7 +1384,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, T=
CGReg lo, TCGReg hi,
>      case MO_SL:
>          tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
>          break;
> -    case MO_Q | MO_BSWAP:
> +    case MO_UQ | MO_BSWAP:
>          if (TCG_TARGET_REG_BITS =3D=3D 64) {
>              if (use_mips32r2_instructions) {
>                  tcg_out_opc_imm(s, OPC_LD, lo, base, 0);
> @@ -1413,7 +1413,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, T=
CGReg lo, TCGReg hi,
>              tcg_out_mov(s, TCG_TYPE_I32, MIPS_BE ? hi : lo, TCG_TMP3);
>          }
>          break;
> -    case MO_Q:
> +    case MO_UQ:
>          /* Prefer to load from offset 0 first, but allow for overlap.  *=
/
>          if (TCG_TARGET_REG_BITS =3D=3D 64) {
>              tcg_out_opc_imm(s, OPC_LD, lo, base, 0);
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 3e4ca2be88..9e79a7edee 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -1935,24 +1935,24 @@ static const uint32_t qemu_ldx_opc[(MO_SSIZE + MO=
_BSWAP) + 1] =3D {
>      [MO_UB] =3D LBZX,
>      [MO_UW] =3D LHZX,
>      [MO_UL] =3D LWZX,
> -    [MO_Q]  =3D LDX,
> +    [MO_UQ] =3D LDX,
>      [MO_SW] =3D LHAX,
>      [MO_SL] =3D LWAX,
>      [MO_BSWAP | MO_UB] =3D LBZX,
>      [MO_BSWAP | MO_UW] =3D LHBRX,
>      [MO_BSWAP | MO_UL] =3D LWBRX,
> -    [MO_BSWAP | MO_Q]  =3D LDBRX,
> +    [MO_BSWAP | MO_UQ] =3D LDBRX,
>  };
>
>  static const uint32_t qemu_stx_opc[(MO_SIZE + MO_BSWAP) + 1] =3D {
>      [MO_UB] =3D STBX,
>      [MO_UW] =3D STHX,
>      [MO_UL] =3D STWX,
> -    [MO_Q]  =3D STDX,
> +    [MO_UQ] =3D STDX,
>      [MO_BSWAP | MO_UB] =3D STBX,
>      [MO_BSWAP | MO_UW] =3D STHBRX,
>      [MO_BSWAP | MO_UL] =3D STWBRX,
> -    [MO_BSWAP | MO_Q]  =3D STDBRX,
> +    [MO_BSWAP | MO_UQ] =3D STDBRX,
>  };
>
>  static const uint32_t qemu_exts_opc[4] =3D {
> @@ -1969,10 +1969,10 @@ static void * const qemu_ld_helpers[(MO_SIZE | MO=
_BSWAP) + 1] =3D {
>      [MO_UB]   =3D helper_ret_ldub_mmu,
>      [MO_LEUW] =3D helper_le_lduw_mmu,
>      [MO_LEUL] =3D helper_le_ldul_mmu,
> -    [MO_LEQ]  =3D helper_le_ldq_mmu,
> +    [MO_LEUQ] =3D helper_le_ldq_mmu,
>      [MO_BEUW] =3D helper_be_lduw_mmu,
>      [MO_BEUL] =3D helper_be_ldul_mmu,
> -    [MO_BEQ]  =3D helper_be_ldq_mmu,
> +    [MO_BEUQ] =3D helper_be_ldq_mmu,
>  };
>
>  /* helper signature: helper_st_mmu(CPUState *env, target_ulong addr,
> @@ -1982,10 +1982,10 @@ static void * const qemu_st_helpers[(MO_SIZE | MO=
_BSWAP) + 1] =3D {
>      [MO_UB]   =3D helper_ret_stb_mmu,
>      [MO_LEUW] =3D helper_le_stw_mmu,
>      [MO_LEUL] =3D helper_le_stl_mmu,
> -    [MO_LEQ]  =3D helper_le_stq_mmu,
> +    [MO_LEUQ] =3D helper_le_stq_mmu,
>      [MO_BEUW] =3D helper_be_stw_mmu,
>      [MO_BEUL] =3D helper_be_stl_mmu,
> -    [MO_BEQ]  =3D helper_be_stq_mmu,
> +    [MO_BEUQ] =3D helper_be_stq_mmu,
>  };
>
>  /* We expect to use a 16-bit negative offset from ENV.  */
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 9b13a46fb4..e9488f7093 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -862,7 +862,7 @@ static void * const qemu_ld_helpers[MO_SSIZE + 1] =3D=
 {
>  #if TCG_TARGET_REG_BITS =3D=3D 64
>      [MO_SL] =3D helper_be_ldsl_mmu,
>  #endif
> -    [MO_Q]  =3D helper_be_ldq_mmu,
> +    [MO_UQ] =3D helper_be_ldq_mmu,
>  #else
>      [MO_UW] =3D helper_le_lduw_mmu,
>      [MO_SW] =3D helper_le_ldsw_mmu,
> @@ -870,7 +870,7 @@ static void * const qemu_ld_helpers[MO_SSIZE + 1] =3D=
 {
>  #if TCG_TARGET_REG_BITS =3D=3D 64
>      [MO_SL] =3D helper_le_ldsl_mmu,
>  #endif
> -    [MO_Q]  =3D helper_le_ldq_mmu,
> +    [MO_UQ] =3D helper_le_ldq_mmu,
>  #endif
>  };
>
> @@ -1083,7 +1083,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, T=
CGReg lo, TCGReg hi,
>      case MO_SL:
>          tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
>          break;
> -    case MO_Q:
> +    case MO_UQ:
>          /* Prefer to load from offset 0 first, but allow for overlap.  *=
/
>          if (TCG_TARGET_REG_BITS =3D=3D 64) {
>              tcg_out_opc_imm(s, OPC_LD, lo, base, 0);
> diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
> index 57e803e339..b12fbfda63 100644
> --- a/tcg/s390x/tcg-target.c.inc
> +++ b/tcg/s390x/tcg-target.c.inc
> @@ -438,22 +438,22 @@ static void * const qemu_ld_helpers[(MO_SSIZE | MO_=
BSWAP) + 1] =3D {
>      [MO_LESW] =3D helper_le_ldsw_mmu,
>      [MO_LEUL] =3D helper_le_ldul_mmu,
>      [MO_LESL] =3D helper_le_ldsl_mmu,
> -    [MO_LEQ]  =3D helper_le_ldq_mmu,
> +    [MO_LEUQ] =3D helper_le_ldq_mmu,
>      [MO_BEUW] =3D helper_be_lduw_mmu,
>      [MO_BESW] =3D helper_be_ldsw_mmu,
>      [MO_BEUL] =3D helper_be_ldul_mmu,
>      [MO_BESL] =3D helper_be_ldsl_mmu,
> -    [MO_BEQ]  =3D helper_be_ldq_mmu,
> +    [MO_BEUQ] =3D helper_be_ldq_mmu,
>  };
>
>  static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] =3D {
>      [MO_UB]   =3D helper_ret_stb_mmu,
>      [MO_LEUW] =3D helper_le_stw_mmu,
>      [MO_LEUL] =3D helper_le_stl_mmu,
> -    [MO_LEQ]  =3D helper_le_stq_mmu,
> +    [MO_LEUQ] =3D helper_le_stq_mmu,
>      [MO_BEUW] =3D helper_be_stw_mmu,
>      [MO_BEUL] =3D helper_be_stl_mmu,
> -    [MO_BEQ]  =3D helper_be_stq_mmu,
> +    [MO_BEUQ] =3D helper_be_stq_mmu,
>  };
>  #endif
>
> @@ -1745,10 +1745,10 @@ static void tcg_out_qemu_ld_direct(TCGContext *s,=
 MemOp opc, TCGReg data,
>          tcg_out_insn(s, RXY, LGF, data, base, index, disp);
>          break;
>
> -    case MO_Q | MO_BSWAP:
> +    case MO_UQ | MO_BSWAP:
>          tcg_out_insn(s, RXY, LRVG, data, base, index, disp);
>          break;
> -    case MO_Q:
> +    case MO_UQ:
>          tcg_out_insn(s, RXY, LG, data, base, index, disp);
>          break;
>
> @@ -1791,10 +1791,10 @@ static void tcg_out_qemu_st_direct(TCGContext *s,=
 MemOp opc, TCGReg data,
>          }
>          break;
>
> -    case MO_Q | MO_BSWAP:
> +    case MO_UQ | MO_BSWAP:
>          tcg_out_insn(s, RXY, STRVG, data, base, index, disp);
>          break;
> -    case MO_Q:
> +    case MO_UQ:
>          tcg_out_insn(s, RXY, STG, data, base, index, disp);
>          break;
>
> @@ -1928,7 +1928,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s=
, TCGLabelQemuLdst *lb)
>      case MO_UL:
>          tgen_ext32u(s, TCG_REG_R4, data_reg);
>          break;
> -    case MO_Q:
> +    case MO_UQ:
>          tcg_out_mov(s, TCG_TYPE_I64, TCG_REG_R4, data_reg);
>          break;
>      default:
> diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
> index 9dd32ef95e..0c062c60eb 100644
> --- a/tcg/sparc/tcg-target.c.inc
> +++ b/tcg/sparc/tcg-target.c.inc
> @@ -889,20 +889,20 @@ static void build_trampolines(TCGContext *s)
>          [MO_LEUW] =3D helper_le_lduw_mmu,
>          [MO_LESW] =3D helper_le_ldsw_mmu,
>          [MO_LEUL] =3D helper_le_ldul_mmu,
> -        [MO_LEQ]  =3D helper_le_ldq_mmu,
> +        [MO_LEUQ] =3D helper_le_ldq_mmu,
>          [MO_BEUW] =3D helper_be_lduw_mmu,
>          [MO_BESW] =3D helper_be_ldsw_mmu,
>          [MO_BEUL] =3D helper_be_ldul_mmu,
> -        [MO_BEQ]  =3D helper_be_ldq_mmu,
> +        [MO_BEUQ] =3D helper_be_ldq_mmu,
>      };
>      static void * const qemu_st_helpers[] =3D {
>          [MO_UB]   =3D helper_ret_stb_mmu,
>          [MO_LEUW] =3D helper_le_stw_mmu,
>          [MO_LEUL] =3D helper_le_stl_mmu,
> -        [MO_LEQ]  =3D helper_le_stq_mmu,
> +        [MO_LEUQ] =3D helper_le_stq_mmu,
>          [MO_BEUW] =3D helper_be_stw_mmu,
>          [MO_BEUL] =3D helper_be_stl_mmu,
> -        [MO_BEQ]  =3D helper_be_stq_mmu,
> +        [MO_BEUQ] =3D helper_be_stq_mmu,
>      };
>
>      int i;
> @@ -1126,13 +1126,13 @@ static const int qemu_ld_opc[(MO_SSIZE | MO_BSWAP=
) + 1] =3D {
>      [MO_BESW] =3D LDSH,
>      [MO_BEUL] =3D LDUW,
>      [MO_BESL] =3D LDSW,
> -    [MO_BEQ]  =3D LDX,
> +    [MO_BEUQ] =3D LDX,
>
>      [MO_LEUW] =3D LDUH_LE,
>      [MO_LESW] =3D LDSH_LE,
>      [MO_LEUL] =3D LDUW_LE,
>      [MO_LESL] =3D LDSW_LE,
> -    [MO_LEQ]  =3D LDX_LE,
> +    [MO_LEUQ] =3D LDX_LE,
>  };
>
>  static const int qemu_st_opc[(MO_SIZE | MO_BSWAP) + 1] =3D {
> @@ -1140,11 +1140,11 @@ static const int qemu_st_opc[(MO_SIZE | MO_BSWAP)=
 + 1] =3D {
>
>      [MO_BEUW] =3D STH,
>      [MO_BEUL] =3D STW,
> -    [MO_BEQ]  =3D STX,
> +    [MO_BEUQ] =3D STX,
>
>      [MO_LEUW] =3D STH_LE,
>      [MO_LEUL] =3D STW_LE,
> -    [MO_LEQ]  =3D STX_LE,
> +    [MO_LEUQ] =3D STX_LE,
>  };
>
>  static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
> diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.=
def
> index 3e5594210c..f0af458aee 100644
> --- a/target/s390x/tcg/insn-data.def
> +++ b/target/s390x/tcg/insn-data.def
> @@ -45,7 +45,7 @@
>      D(0xeb6a, ASI,     SIY,   GIE, la1, i2, new, 0, asi, adds32, MO_TESL=
)
>      C(0xecd8, AHIK,    RIE_d, DO,  r3, i2, new, r1_32, add, adds32)
>      C(0xc208, AGFI,    RIL_a, EI,  r1, i2, r1, 0, add, adds64)
> -    D(0xeb7a, AGSI,    SIY,   GIE, la1, i2, new, 0, asi, adds64, MO_TEQ)
> +    D(0xeb7a, AGSI,    SIY,   GIE, la1, i2, new, 0, asi, adds64, MO_TEUQ=
)
>      C(0xecd9, AGHIK,   RIE_d, DO,  r3, i2, r1, 0, add, adds64)
>  /* ADD IMMEDIATE HIGH */
>      C(0xcc08, AIH,     RIL_a, HW,  r1_sr32, i2, new, r1_32h, add, adds32=
)
> @@ -76,7 +76,7 @@
>  /* ADD LOGICAL WITH SIGNED IMMEDIATE */
>      D(0xeb6e, ALSI,    SIY,   GIE, la1, i2_32u, new, 0, asi, addu32, MO_=
TEUL)
>      C(0xecda, ALHSIK,  RIE_d, DO,  r3_32u, i2_32u, new, r1_32, add, addu=
32)
> -    D(0xeb7e, ALGSI,   SIY,   GIE, la1, i2, new, 0, asiu64, addu64, MO_T=
EQ)
> +    D(0xeb7e, ALGSI,   SIY,   GIE, la1, i2, new, 0, asiu64, addu64, MO_T=
EUQ)
>      C(0xecdb, ALGHSIK, RIE_d, DO,  r3, i2, r1, 0, addu64, addu64)
>  /* ADD LOGICAL WITH SIGNED IMMEDIATE HIGH */
>      C(0xcc0a, ALSIH,   RIL_a, HW,  r1_sr32, i2_32u, new, r1_32h, add, ad=
du32)
> @@ -269,10 +269,10 @@
>  /* COMPARE AND SWAP */
>      D(0xba00, CS,      RS_a,  Z,   r3_32u, r1_32u, new, r1_32, cs, 0, MO=
_TEUL)
>      D(0xeb14, CSY,     RSY_a, LD,  r3_32u, r1_32u, new, r1_32, cs, 0, MO=
_TEUL)
> -    D(0xeb30, CSG,     RSY_a, Z,   r3_o, r1_o, new, r1, cs, 0, MO_TEQ)
> +    D(0xeb30, CSG,     RSY_a, Z,   r3_o, r1_o, new, r1, cs, 0, MO_TEUQ)
>  /* COMPARE DOUBLE AND SWAP */
> -    D(0xbb00, CDS,     RS_a,  Z,   r3_D32, r1_D32, new, r1_D32, cs, 0, M=
O_TEQ)
> -    D(0xeb31, CDSY,    RSY_a, LD,  r3_D32, r1_D32, new, r1_D32, cs, 0, M=
O_TEQ)
> +    D(0xbb00, CDS,     RS_a,  Z,   r3_D32, r1_D32, new, r1_D32, cs, 0, M=
O_TEUQ)
> +    D(0xeb31, CDSY,    RSY_a, LD,  r3_D32, r1_D32, new, r1_D32, cs, 0, M=
O_TEUQ)
>      C(0xeb3e, CDSG,    RSY_a, Z,   0, 0, 0, 0, cdsg, 0)
>  /* COMPARE AND SWAP AND STORE */
>      C(0xc802, CSST,    SSF,   CASS, la1, a2, 0, 0, csst, 0)
> @@ -436,19 +436,19 @@
>      C(0xc000, LARL,    RIL_b, Z,   0, ri2, 0, r1, mov2, 0)
>  /* LOAD AND ADD */
>      D(0xebf8, LAA,     RSY_a, ILA, r3_32s, a2, new, in2_r1_32, laa, adds=
32, MO_TESL)
> -    D(0xebe8, LAAG,    RSY_a, ILA, r3, a2, new, in2_r1, laa, adds64, MO_=
TEQ)
> +    D(0xebe8, LAAG,    RSY_a, ILA, r3, a2, new, in2_r1, laa, adds64, MO_=
TEUQ)
>  /* LOAD AND ADD LOGICAL */
>      D(0xebfa, LAAL,    RSY_a, ILA, r3_32u, a2, new, in2_r1_32, laa, addu=
32, MO_TEUL)
> -    D(0xebea, LAALG,   RSY_a, ILA, r3, a2, new, in2_r1, laa, addu64, MO_=
TEQ)
> +    D(0xebea, LAALG,   RSY_a, ILA, r3, a2, new, in2_r1, laa, addu64, MO_=
TEUQ)
>  /* LOAD AND AND */
>      D(0xebf4, LAN,     RSY_a, ILA, r3_32s, a2, new, in2_r1_32, lan, nz32=
, MO_TESL)
> -    D(0xebe4, LANG,    RSY_a, ILA, r3, a2, new, in2_r1, lan, nz64, MO_TE=
Q)
> +    D(0xebe4, LANG,    RSY_a, ILA, r3, a2, new, in2_r1, lan, nz64, MO_TE=
UQ)
>  /* LOAD AND EXCLUSIVE OR */
>      D(0xebf7, LAX,     RSY_a, ILA, r3_32s, a2, new, in2_r1_32, lax, nz32=
, MO_TESL)
> -    D(0xebe7, LAXG,    RSY_a, ILA, r3, a2, new, in2_r1, lax, nz64, MO_TE=
Q)
> +    D(0xebe7, LAXG,    RSY_a, ILA, r3, a2, new, in2_r1, lax, nz64, MO_TE=
UQ)
>  /* LOAD AND OR */
>      D(0xebf6, LAO,     RSY_a, ILA, r3_32s, a2, new, in2_r1_32, lao, nz32=
, MO_TESL)
> -    D(0xebe6, LAOG,    RSY_a, ILA, r3, a2, new, in2_r1, lao, nz64, MO_TE=
Q)
> +    D(0xebe6, LAOG,    RSY_a, ILA, r3, a2, new, in2_r1, lao, nz64, MO_TE=
UQ)
>  /* LOAD AND TEST */
>      C(0x1200, LTR,     RR_a,  Z,   0, r2_o, 0, cond_r1r2_32, mov2, s32)
>      C(0xb902, LTGR,    RRE,   Z,   0, r2_o, 0, r1, mov2, s64)
> @@ -565,7 +565,7 @@
>      C(0xebe0, LOCFH,   RSY_b, LOC2, r1_sr32, m2_32u, new, r1_32h, loc, 0=
)
>  /* LOAD PAIR DISJOINT */
>      D(0xc804, LPD,     SSF,   ILA, 0, 0, new_P, r3_P32, lpd, 0, MO_TEUL)
> -    D(0xc805, LPDG,    SSF,   ILA, 0, 0, new_P, r3_P64, lpd, 0, MO_TEQ)
> +    D(0xc805, LPDG,    SSF,   ILA, 0, 0, new_P, r3_P64, lpd, 0, MO_TEUQ)
>  /* LOAD PAIR FROM QUADWORD */
>      C(0xe38f, LPQ,     RXY_a, Z,   0, a2, r1_P, 0, lpq, 0)
>  /* LOAD POSITIVE */
> @@ -1279,7 +1279,7 @@
>  #ifndef CONFIG_USER_ONLY
>  /* COMPARE AND SWAP AND PURGE */
>      E(0xb250, CSP,     RRE,   Z,   r1_32u, ra2, r1_P, 0, csp, 0, MO_TEUL=
, IF_PRIV)
> -    E(0xb98a, CSPG,    RRE, DAT_ENH, r1_o, ra2, r1_P, 0, csp, 0, MO_TEQ,=
 IF_PRIV)
> +    E(0xb98a, CSPG,    RRE, DAT_ENH, r1_o, ra2, r1_P, 0, csp, 0, MO_TEUQ=
, IF_PRIV)
>  /* DIAGNOSE (KVM hypercall) */
>      F(0x8300, DIAG,    RSI,   Z,   0, 0, 0, 0, diag, 0, IF_PRIV | IF_IO)
>  /* INSERT STORAGE KEY EXTENDED */
> @@ -1303,7 +1303,7 @@
>      F(0xe303, LRAG,    RXY_a, Z,   0, a2, r1, 0, lra, 0, IF_PRIV)
>  /* LOAD USING REAL ADDRESS */
>      E(0xb24b, LURA,    RRE,   Z,   0, ra2, new, r1_32, lura, 0, MO_TEUL,=
 IF_PRIV)
> -    E(0xb905, LURAG,   RRE,   Z,   0, ra2, r1, 0, lura, 0, MO_TEQ, IF_PR=
IV)
> +    E(0xb905, LURAG,   RRE,   Z,   0, ra2, r1, 0, lura, 0, MO_TEUQ, IF_P=
RIV)
>  /* MOVE TO PRIMARY */
>      F(0xda00, MVCP,    SS_d,  Z,   la1, a2, 0, 0, mvcp, 0, IF_PRIV)
>  /* MOVE TO SECONDARY */
> @@ -1357,7 +1357,7 @@
>      F(0xad00, STOSM,   SI,    Z,   la1, 0, 0, 0, stnosm, 0, IF_PRIV)
>  /* STORE USING REAL ADDRESS */
>      E(0xb246, STURA,   RRE,   Z,   r1_o, ra2, 0, 0, stura, 0, MO_TEUL, I=
F_PRIV)
> -    E(0xb925, STURG,   RRE,   Z,   r1_o, ra2, 0, 0, stura, 0, MO_TEQ, IF=
_PRIV)
> +    E(0xb925, STURG,   RRE,   Z,   r1_o, ra2, 0, 0, stura, 0, MO_TEUQ, I=
F_PRIV)
>  /* TEST BLOCK */
>      F(0xb22c, TB,      RRE,   Z,   0, r2_o, 0, 0, testblock, 0, IF_PRIV)
>  /* TEST PROTECTION */
> --
> 2.34.0
>
>

