Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntFmx-00007X-Ur
	for mharc-qemu-riscv@gnu.org; Mon, 23 May 2022 17:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ntFms-0008SR-6c; Mon, 23 May 2022 17:40:26 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:45922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ntFmp-00058J-3R; Mon, 23 May 2022 17:40:24 -0400
Received: by mail-io1-xd2a.google.com with SMTP id d198so11602035iof.12;
 Mon, 23 May 2022 14:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pUjqTbi3LnE3irwObyZh6joz8VYA+PW3Ldur0WaUFHE=;
 b=UY9VEAr5Aw5dfJD7HhcKziRpppKK6UB6ArKCFBhyiMm3zg9rL4CKOLGzd/m5k5UOTk
 N0fKiptYxo1xI8T0PIgDO5+eZ28RvGMUMU0DO3q47Km9RtL8vksb20paQVHvLxZ5ezqt
 x7Vungyq6ybhCbmQ1nUc1Wo2Oq2u2uE1OXpZ8JUuBwVs4g9OYAEHjDXIViEvIA+oxJMc
 BC67/UDPPpQBqV4XyDWybn6wEA3tGarl1ljmSAGjvonz93zV9O+OqM6MfRKakxLO6bUF
 xYjpf7/uWjTiEBNUYWF7PdAbGhMI/W8V+82mvesv8YH2+nEjI/+PB+sgW0XfYcIFdGcf
 AuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pUjqTbi3LnE3irwObyZh6joz8VYA+PW3Ldur0WaUFHE=;
 b=xlzlT7QHWJTYjZPWjhmTI6rrF7F6SFtwC0ybJqFEIjwDkfepU/0xOMxrKgdqfhjJpx
 f2+g6fsJZWOEFT7bQWTZ8bQrOcwpKBaEkTDFt3OZgTJGQbnI4vK1aXOU5DuSQhB1x3eU
 wrTry1FOWfp/iENmsza92rjwGASwOsxNuFZjUOOFCT0PDTw7WBz7tunp6ixE/U/vqr0A
 TwQ1Qrwn0TiEMLn1BaSXDRuQzR8Ugsn8yp0/lxdoWc30+NgEbKbofWgwxqlqv8dHhiu6
 e80oCKMK3uhGCMxgjSiVLbEq1z9tgNeNf60J2BV+L3AwevTw+eeNMvDEr+mNcDEMi2WJ
 zAoQ==
X-Gm-Message-State: AOAM533QFYE2EwFGXqUaLi5Nt6yg1BsDJOxVlFnkUGq283QurkV2L4R0
 hYtZOAPsLxP8Gq7rmjC71WMg8nIY2L/cew4tj30=
X-Google-Smtp-Source: ABdhPJwn6mkO+f3/HBVSF0kAPU6bGQ93a+zYZ8/sGTwoCdLE890s05MAj/gpkIryk73EzH/GpzvgVSDRjzDTB4OIudk=
X-Received: by 2002:a05:6602:2019:b0:65e:5056:1df4 with SMTP id
 y25-20020a056602201900b0065e50561df4mr9033429iod.203.1653342019636; Mon, 23
 May 2022 14:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <165244259451.12806.1710403216414520477-0@git.sr.ht>
 <165244259451.12806.1710403216414520477-2@git.sr.ht>
In-Reply-To: <165244259451.12806.1710403216414520477-2@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 May 2022 07:39:53 +1000
Message-ID: <CAKmqyKMt3REKjDG+-2b4506micZwYp5s=bSGYJr-gkujbyE9nw@mail.gmail.com>
Subject: Re: [PATCH qemu v18 02/16] target/riscv: rvv: Prune redundant
 access_type parameter passed
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 23 May 2022 21:40:28 -0000

On Fri, May 13, 2022 at 9:50 PM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: eopXD <eop.chen@sifive.com>
>
> No functional change intended in this commit.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/vector_helper.c | 35 ++++++++++++++++-------------------
>  1 file changed, 16 insertions(+), 19 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 85dd611cd9..60840325c4 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -231,7 +231,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>                   target_ulong stride, CPURISCVState *env,
>                   uint32_t desc, uint32_t vm,
>                   vext_ldst_elem_fn *ldst_elem,
> -                 uint32_t esz, uintptr_t ra, MMUAccessType access_type)
> +                 uint32_t esz, uintptr_t ra)
>  {
>      uint32_t i, k;
>      uint32_t nf = vext_nf(desc);
> @@ -259,7 +259,7 @@ void HELPER(NAME)(void *vd, void * v0, target_ulong base,               \
>  {                                                                       \
>      uint32_t vm = vext_vm(desc);                                        \
>      vext_ldst_stride(vd, v0, base, stride, env, desc, vm, LOAD_FN,      \
> -                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);      \
> +                     ctzl(sizeof(ETYPE)), GETPC());                     \
>  }
>
>  GEN_VEXT_LD_STRIDE(vlse8_v,  int8_t,  lde_b)
> @@ -274,7 +274,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
>  {                                                                       \
>      uint32_t vm = vext_vm(desc);                                        \
>      vext_ldst_stride(vd, v0, base, stride, env, desc, vm, STORE_FN,     \
> -                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);     \
> +                     ctzl(sizeof(ETYPE)), GETPC());                     \
>  }
>
>  GEN_VEXT_ST_STRIDE(vsse8_v,  int8_t,  ste_b)
> @@ -290,7 +290,7 @@ GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d)
>  static void
>  vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>               vext_ldst_elem_fn *ldst_elem, uint32_t esz, uint32_t evl,
> -             uintptr_t ra, MMUAccessType access_type)
> +             uintptr_t ra)
>  {
>      uint32_t i, k;
>      uint32_t nf = vext_nf(desc);
> @@ -319,14 +319,14 @@ void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         \
>  {                                                                       \
>      uint32_t stride = vext_nf(desc) << ctzl(sizeof(ETYPE));             \
>      vext_ldst_stride(vd, v0, base, stride, env, desc, false, LOAD_FN,   \
> -                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);      \
> +                     ctzl(sizeof(ETYPE)), GETPC());                     \
>  }                                                                       \
>                                                                          \
>  void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
>                    CPURISCVState *env, uint32_t desc)                    \
>  {                                                                       \
>      vext_ldst_us(vd, base, env, desc, LOAD_FN,                          \
> -                 ctzl(sizeof(ETYPE)), env->vl, GETPC(), MMU_DATA_LOAD); \
> +                 ctzl(sizeof(ETYPE)), env->vl, GETPC());                \
>  }
>
>  GEN_VEXT_LD_US(vle8_v,  int8_t,  lde_b)
> @@ -340,14 +340,14 @@ void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,          \
>  {                                                                        \
>      uint32_t stride = vext_nf(desc) << ctzl(sizeof(ETYPE));              \
>      vext_ldst_stride(vd, v0, base, stride, env, desc, false, STORE_FN,   \
> -                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);      \
> +                     ctzl(sizeof(ETYPE)), GETPC());                      \
>  }                                                                        \
>                                                                           \
>  void HELPER(NAME)(void *vd, void *v0, target_ulong base,                 \
>                    CPURISCVState *env, uint32_t desc)                     \
>  {                                                                        \
>      vext_ldst_us(vd, base, env, desc, STORE_FN,                          \
> -                 ctzl(sizeof(ETYPE)), env->vl, GETPC(), MMU_DATA_STORE); \
> +                 ctzl(sizeof(ETYPE)), env->vl, GETPC());                 \
>  }
>
>  GEN_VEXT_ST_US(vse8_v,  int8_t,  ste_b)
> @@ -364,7 +364,7 @@ void HELPER(vlm_v)(void *vd, void *v0, target_ulong base,
>      /* evl = ceil(vl/8) */
>      uint8_t evl = (env->vl + 7) >> 3;
>      vext_ldst_us(vd, base, env, desc, lde_b,
> -                 0, evl, GETPC(), MMU_DATA_LOAD);
> +                 0, evl, GETPC());
>  }
>
>  void HELPER(vsm_v)(void *vd, void *v0, target_ulong base,
> @@ -373,7 +373,7 @@ void HELPER(vsm_v)(void *vd, void *v0, target_ulong base,
>      /* evl = ceil(vl/8) */
>      uint8_t evl = (env->vl + 7) >> 3;
>      vext_ldst_us(vd, base, env, desc, ste_b,
> -                 0, evl, GETPC(), MMU_DATA_STORE);
> +                 0, evl, GETPC());
>  }
>
>  /*
> @@ -399,7 +399,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>                  void *vs2, CPURISCVState *env, uint32_t desc,
>                  vext_get_index_addr get_index_addr,
>                  vext_ldst_elem_fn *ldst_elem,
> -                uint32_t esz, uintptr_t ra, MMUAccessType access_type)
> +                uint32_t esz, uintptr_t ra)
>  {
>      uint32_t i, k;
>      uint32_t nf = vext_nf(desc);
> @@ -427,7 +427,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,                   \
>                    void *vs2, CPURISCVState *env, uint32_t desc)            \
>  {                                                                          \
>      vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,                \
> -                    LOAD_FN, ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD); \
> +                    LOAD_FN, ctzl(sizeof(ETYPE)), GETPC());                \
>  }
>
>  GEN_VEXT_LD_INDEX(vlxei8_8_v,   int8_t,  idx_b, lde_b)
> @@ -453,7 +453,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,         \
>  {                                                                \
>      vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,      \
>                      STORE_FN, ctzl(sizeof(ETYPE)),               \
> -                    GETPC(), MMU_DATA_STORE);                    \
> +                    GETPC());                                    \
>  }
>
>  GEN_VEXT_ST_INDEX(vsxei8_8_v,   int8_t,  idx_b, ste_b)
> @@ -576,8 +576,7 @@ GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d)
>   */
>  static void
>  vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
> -                vext_ldst_elem_fn *ldst_elem, uint32_t esz, uintptr_t ra,
> -                MMUAccessType access_type)
> +                vext_ldst_elem_fn *ldst_elem, uint32_t esz, uintptr_t ra)
>  {
>      uint32_t i, k, off, pos;
>      uint32_t nf = vext_nf(desc);
> @@ -612,8 +611,7 @@ void HELPER(NAME)(void *vd, target_ulong base,       \
>                    CPURISCVState *env, uint32_t desc) \
>  {                                                    \
>      vext_ldst_whole(vd, base, env, desc, LOAD_FN,    \
> -                    ctzl(sizeof(ETYPE)), GETPC(),    \
> -                    MMU_DATA_LOAD);                  \
> +                    ctzl(sizeof(ETYPE)), GETPC());   \
>  }
>
>  GEN_VEXT_LD_WHOLE(vl1re8_v,  int8_t,  lde_b)
> @@ -638,8 +636,7 @@ void HELPER(NAME)(void *vd, target_ulong base,       \
>                    CPURISCVState *env, uint32_t desc) \
>  {                                                    \
>      vext_ldst_whole(vd, base, env, desc, STORE_FN,   \
> -                    ctzl(sizeof(ETYPE)), GETPC(),    \
> -                    MMU_DATA_STORE);                 \
> +                    ctzl(sizeof(ETYPE)), GETPC());   \
>  }
>
>  GEN_VEXT_ST_WHOLE(vs1r_v, int8_t, ste_b)
> --
> 2.34.2
>
>

