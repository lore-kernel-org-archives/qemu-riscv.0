Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECC1CCD184
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 05:16:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v8XNr-0001D6-4s; Tue, 14 Oct 2025 01:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8XNp-0001Ca-Ru
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 01:15:37 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8XNn-00051j-N1
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 01:15:37 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-634b774f135so7779856a12.2
 for <qemu-riscv@nongnu.org>; Mon, 13 Oct 2025 22:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760418934; x=1761023734; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TWEKL+K2EdHFX23rio2xc7rOoZrOpXqpzaRi2cEUSWI=;
 b=kpibA+fOq6oi+y+vT7rLJfXqhSeLVV+8uyJjkB36u4j8JXxnnd7rRJ8jGiMi5KCr8A
 beSqZlEjzZuM2pd5JwJwyWUQ0n1txeIaYg6zsfC0gjrJE5LYOioQbg/sAOYi4YDec3CR
 ySpESirMpY36CFZlWMYEsuKJY0uj/kJ8Gs6gAwkx9cUKlpJxEmEMjXcQtfRL5OgiI8xd
 v4/HN7UhsJzQZdHOIh4kdu50tE1JVNeOqko1FO/WwZ4zS8HpXwDqty4bCcuzEL4Ipp0L
 K4Dj/ct0gNL4HvMomm8sfkYkSIIwMdMwVkZy+xdINTYLxuadXXFh5SRdcHmJbxOeBVkD
 oGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760418934; x=1761023734;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TWEKL+K2EdHFX23rio2xc7rOoZrOpXqpzaRi2cEUSWI=;
 b=ZAaVv7dmGzvjssHxLWtv+EGG6GSksqlaOCqYuyBBUHe06bUF/72BGhr6IeUg68SIqW
 3jKUhCrSBPKIq2PKgRE/RzVVJw2Ti9R+7oc0aQi26rhzALm3jMBwIxr0YeTgWysDF/WA
 wJCBsnzkD+NefsZaEUh6KMTFpDzr+V39G4Lqr27pTh37lLWAomBJNulzyNwRTykSkxiG
 4bDU7d1zNb6IORM2UAM7PEcStf5egoFfcC4HGG/kicPbEYq8Q2ife9JYzqpCKRHNixFN
 blPBOvqp+NC3GMyu1x/BUGl//7aUfgg5x3x8Crwuis6SpS5IlsKdCPeorTRpb/r1Rqxp
 xSPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKKvHYcveY9erpxiEUMkiAfp6MJPgwq8cOxydGQU42pK3V4OSRKFAGGyjySOljMVhdAWyHAvtu4zPb@nongnu.org
X-Gm-Message-State: AOJu0Yw2h8ESqnXzPeBz3QocsZzBltxyuv+TAo7WZHM5TnvdGouSwnYX
 k/6HT1mxuroLxTAaK0ka9A5JeZATSzVqZfckor7f9AoB4d4Ug5m7S2gL88i0zDNr14nA8ghUu75
 +naK7IqEj8SalmbcqD+g4nBxXTjlIW0I=
X-Gm-Gg: ASbGncvP6lHT5zrnaFSu8skLlz1BPXOii0Mfpl00AV4LYu5IZrMW6iDxQq26xuWJ40f
 RXJlOCAJRQF/7ozGFbiSXF1hA4wHM31+w0r500eXWxlFIXulkLbDpMaZhNhVIjOIhWUsz+nvBY6
 lldG8xia+Ss2MRdgJmaUKb5SCuoriupmoMAZcT9o4H1YzONkARjgLRhfzPCj0/h4Ovl1z0vJmNZ
 IdFQM3s3lJmDo/ouZOO1cM16H/yMdYvjNS9NGQndBl3Um6Oy8Nd26r/NlLZAhyaId4=
X-Google-Smtp-Source: AGHT+IE9X7t3z+452ufCeRYTLKfQWAh4Ln64+KM5dTXjusQ6j44w1gdeDyL8FuHmvmu0djQwo2YVWzck5vLgISzPVto=
X-Received: by 2002:a05:6402:34c9:b0:637:98a1:c7c4 with SMTP id
 4fb4d7f45d1cf-639d5b43aefmr18713744a12.5.1760418933869; Mon, 13 Oct 2025
 22:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251010155045.78220-1-philmd@linaro.org>
 <20251010155045.78220-14-philmd@linaro.org>
In-Reply-To: <20251010155045.78220-14-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 14 Oct 2025 15:15:06 +1000
X-Gm-Features: AS18NWBr7ECcFnKlgcz-_7xhjc7klpejQBzibBp52LlqBAsrtri2RAKly-7y2_I
Message-ID: <CAKmqyKMxiOc+Sm2eXVxm_HgBCi0v28Echu=EqAkyvNRCiVNHjw@mail.gmail.com>
Subject: Re: [PATCH 13/13] target/riscv: Introduce mo_endian_env() helper
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Christoph Muellner <christoph.muellner@vrull.eu>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Anton Johansson <anjo@rev.ng>, Richard Henderson <richard.henderson@linaro.org>,
 Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x529.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sat, Oct 11, 2025 at 1:56=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> mo_endian_env() returns the target endianness from CPUArchState.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/op_helper.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index c486f771d35..9d048089e2a 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -28,6 +28,18 @@
>  #include "exec/tlb-flags.h"
>  #include "trace.h"
>
> +static inline MemOp mo_endian_env(CPURISCVState *env)
> +{
> +    /*
> +     * A couple of bits in MSTATUS set the endianness:
> +     *  - MSTATUS_UBE (User-mode),
> +     *  - MSTATUS_SBE (Supervisor-mode),
> +     *  - MSTATUS_MBE (Machine-mode)
> +     * but we don't implement that yet.
> +     */
> +    return MO_TE;
> +}
> +
>  /* Exceptions processing helpers */
>  G_NORETURN void riscv_raise_exception(CPURISCVState *env,
>                                        RISCVException exception,
> @@ -633,7 +645,7 @@ target_ulong helper_hyp_hlv_hu(CPURISCVState *env, ta=
rget_ulong addr)
>  {
>      uintptr_t ra =3D GETPC();
>      int mmu_idx =3D check_access_hlsv(env, false, ra);
> -    MemOpIdx oi =3D make_memop_idx(MO_TE | MO_UW, mmu_idx);
> +    MemOpIdx oi =3D make_memop_idx(mo_endian_env(env) | MO_UW, mmu_idx);
>
>      return cpu_ldw_mmu(env, adjust_addr_virt(env, addr), oi, ra);
>  }
> @@ -642,7 +654,7 @@ target_ulong helper_hyp_hlv_wu(CPURISCVState *env, ta=
rget_ulong addr)
>  {
>      uintptr_t ra =3D GETPC();
>      int mmu_idx =3D check_access_hlsv(env, false, ra);
> -    MemOpIdx oi =3D make_memop_idx(MO_TE | MO_UL, mmu_idx);
> +    MemOpIdx oi =3D make_memop_idx(mo_endian_env(env) | MO_UL, mmu_idx);
>
>      return cpu_ldl_mmu(env, adjust_addr_virt(env, addr), oi, ra);
>  }
> @@ -651,7 +663,7 @@ target_ulong helper_hyp_hlv_d(CPURISCVState *env, tar=
get_ulong addr)
>  {
>      uintptr_t ra =3D GETPC();
>      int mmu_idx =3D check_access_hlsv(env, false, ra);
> -    MemOpIdx oi =3D make_memop_idx(MO_TE | MO_UQ, mmu_idx);
> +    MemOpIdx oi =3D make_memop_idx(mo_endian_env(env) | MO_UQ, mmu_idx);
>
>      return cpu_ldq_mmu(env, adjust_addr_virt(env, addr), oi, ra);
>  }
> @@ -669,7 +681,7 @@ void helper_hyp_hsv_h(CPURISCVState *env, target_ulon=
g addr, target_ulong val)
>  {
>      uintptr_t ra =3D GETPC();
>      int mmu_idx =3D check_access_hlsv(env, false, ra);
> -    MemOpIdx oi =3D make_memop_idx(MO_TE | MO_UW, mmu_idx);
> +    MemOpIdx oi =3D make_memop_idx(mo_endian_env(env) | MO_UW, mmu_idx);
>
>      cpu_stw_mmu(env, adjust_addr_virt(env, addr), val, oi, ra);
>  }
> @@ -678,7 +690,7 @@ void helper_hyp_hsv_w(CPURISCVState *env, target_ulon=
g addr, target_ulong val)
>  {
>      uintptr_t ra =3D GETPC();
>      int mmu_idx =3D check_access_hlsv(env, false, ra);
> -    MemOpIdx oi =3D make_memop_idx(MO_TE | MO_UL, mmu_idx);
> +    MemOpIdx oi =3D make_memop_idx(mo_endian_env(env) | MO_UL, mmu_idx);
>
>      cpu_stl_mmu(env, adjust_addr_virt(env, addr), val, oi, ra);
>  }
> @@ -687,7 +699,7 @@ void helper_hyp_hsv_d(CPURISCVState *env, target_ulon=
g addr, target_ulong val)
>  {
>      uintptr_t ra =3D GETPC();
>      int mmu_idx =3D check_access_hlsv(env, false, ra);
> -    MemOpIdx oi =3D make_memop_idx(MO_TE | MO_UQ, mmu_idx);
> +    MemOpIdx oi =3D make_memop_idx(mo_endian_env(env) | MO_UQ, mmu_idx);
>
>      cpu_stq_mmu(env, adjust_addr_virt(env, addr), val, oi, ra);
>  }
> @@ -703,7 +715,7 @@ target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, t=
arget_ulong addr)
>  {
>      uintptr_t ra =3D GETPC();
>      int mmu_idx =3D check_access_hlsv(env, true, ra);
> -    MemOpIdx oi =3D make_memop_idx(MO_TE | MO_UW, mmu_idx);
> +    MemOpIdx oi =3D make_memop_idx(mo_endian_env(env) | MO_UW, mmu_idx);
>
>      return cpu_ldw_code_mmu(env, addr, oi, GETPC());
>  }
> @@ -712,7 +724,7 @@ target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, t=
arget_ulong addr)
>  {
>      uintptr_t ra =3D GETPC();
>      int mmu_idx =3D check_access_hlsv(env, true, ra);
> -    MemOpIdx oi =3D make_memop_idx(MO_TE | MO_UL, mmu_idx);
> +    MemOpIdx oi =3D make_memop_idx(mo_endian_env(env) | MO_UL, mmu_idx);
>
>      return cpu_ldl_code_mmu(env, addr, oi, ra);
>  }
> --
> 2.51.0
>
>

