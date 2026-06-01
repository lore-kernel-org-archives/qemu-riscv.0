Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBC4CD6E4C
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 03:57:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTtm9-0007Fb-Fp; Sun, 31 May 2026 23:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTtm6-0007F0-B6
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 23:57:14 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTtm3-00034w-Fe
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 23:57:14 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-68bd167797dso3642657a12.0
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 20:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780286229; cv=none;
 d=google.com; s=arc-20240605;
 b=VoJ4NPU8LcaByk6oryqecl6KIiWGdt/h6RvekV90yg/BG2/jfPS3BnmzU8N04pqWo/
 FLao3EqRXJp3I6YWK+smffd2KtpdInMruga0ObWMN13icN/af7XH+GwU7K01ooUjnheR
 EHdCDDKOdZi4zBgYHFPcL/ALbUcW5cH4fjNx38HVO+NaINWg7dVuvacGEwt1Nfc7eDUe
 623zbNlj//4AFjg4DLtK7uXjVORUixthewS5AMNDt5csRHe2nUeELMpHeAQ+BUIzsojz
 KwlNtpg/pQETROcQCDg4eGEdYT+QyW2WrFZNab4rDl+beeoqdZM6ycBJD5LWQOzNVnVo
 Kzig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=bG8rcqZZOPoDhwgw0R4h8I+oqU1nVaTcUK4zdwxk4Ko=;
 fh=oMnWvlaaNSxfIimPyepIr7sO+8P5bM4t3DRk91+pfBk=;
 b=XIunkbL8LNRXSfJm1ZHJ+8cJTKay4kiMdNuRuzPhy2Ps/sgjJbOWhYxd+IYDTKax8+
 zRICI7lCzXSzTv2Yrknlwj2DQ8PtTi9XRf5NwFjvIEut1swNk5wIfwwaPSPmIif/EEnC
 n8JEhE7Xk4oezikd+lf7yNvIbQtikiFaWjmdjCAaFOjid6pAFPufeSj2FWci4FaEWhl/
 Nq0J280S/RGp0Nlq9EvKIzwteiEX6E1yupowfdkADCrpa6z7WRRK7jIVaKpWoL0vs5st
 Pet0RD1O4nliJJW8yea1A+TjAuxfzJvPffHvI50+/VFb8DGU6FQqZIDiI82DXD9SxEYT
 ghmQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780286229; x=1780891029; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bG8rcqZZOPoDhwgw0R4h8I+oqU1nVaTcUK4zdwxk4Ko=;
 b=Ups95z7hjFc+nJPgHkPiUBoLYWjcll3czb9y3UUDqZlga9nqM5BVCB4cLkD06S4j4X
 pRm0OzVhju7Ch/BG+wIFoEGNvtS6wC2t9mt4UU08lQkLoQA5KT4X0WgIG+xzXMkT0B28
 FQ/aU+dIXv5p0jPuG/yVtHIzznQovcB/NvjtV9ihXjnZmKpipVJPed2BwtcY4JRD/V5A
 HwX/4nzCoYclgOwKCE0HpPU1EWFcShNQ7bksn1MS423z2xvCEBleZE364l+Jh3Px3TDo
 h3WqCjdtQX5mKpXChpah6qkYInA1T4tPao2D61UBYm6wl0rkgNa4fiuf7l0MdVFj2268
 8NNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780286229; x=1780891029;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bG8rcqZZOPoDhwgw0R4h8I+oqU1nVaTcUK4zdwxk4Ko=;
 b=hHtzLS2EI9S84GATsdzMRw7xOfxSmz46ekA0Fn94lxILeYip64cScMP3GNqqtHEamx
 L/FFtj/CF0V1Mu83zTP4tTQ51kMPdenUjxhQoMxqT6c4Wcu+UeUw+x4shvmKvPEMWgT+
 v0o+xV/0wFMCsFN/BV8gTw/mgV3DPV8fTUiVQxWEEUcCRgOXrDr+UDItGllTYhex1aLv
 3TmxxrHgKPa/RAtw9vJGxdpHGGSfnPnvyluernx3K89VqZowCdrxDsI6f30drW+6nq/z
 g+ubYHUQ6jMuCSNlf6hg3ctVk9nR2Wd6O+csWhAumhMZDGJpskMcpxDXK/wqPnD7JXsc
 fQfQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9nS9k0gdMSaY7Zdx2MrnQK7RZzrn1KFdRvQoXWmbHpj/3FHeq1qnTBpfIlSTL15fXgrE/aX3SXqcJj@nongnu.org
X-Gm-Message-State: AOJu0Yw4DarYI3TbC0SPL9VY7+qgOzRh9rFFFFsVNoKbReClkB/KPAKh
 gqrwpBa9OS0UzTSvHL4cnVvCNNA4LTU3CZwl2IlzdtwWwb4Xgse7yto5MZbsN3/BNxKMfm6eE4k
 60YSo1dH2ghiXwWGbHTM1zu5sKncxBBo=
X-Gm-Gg: Acq92OE9+rG4Uqs3Oa6GbF5GF/fXrTPdyM6A9iGDsif0cnT7g12A9qEbyEDuCABY+lS
 4XXrkG/IUoOQA3RcsDSjf3Q0e2YV9YDHUoolV5QyUbIRnKkvegoICCPKNmPbwjncdWTbY3x9u9U
 Yv6wS3DvCTeIDfeH47rKEd6oCZh0X7YCOBKdkj4+9MVuhUaw6dGOe5IIebUlRTFlFUoePPd/s/Y
 X2LGnDkLOppJffV40Vxk23njtRUS1oRe93V/U0ScxW+IxO74HO4f33RWTxEq4FSqpngmetJuHyT
 MX0/DKSw15XLkhwcw8Wo4E/xNyReS5Ki0AGIfhqEEYEzquql
X-Received: by 2002:a17:907:75f1:b0:bed:38b8:9b59 with SMTP id
 a640c23a62f3a-bed38b8a8eemr94317366b.9.1780286229233; Sun, 31 May 2026
 20:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260527201348.29511-1-philmd@linaro.org>
 <20260527201348.29511-7-philmd@linaro.org>
In-Reply-To: <20260527201348.29511-7-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Jun 2026 13:56:42 +1000
X-Gm-Features: AVHnY4IYPecXeM38cKoLqpb6Tvi3m1eqmX1ql6WtyUVRk7sX36Pa6EMce-9EKBs
Message-ID: <CAKmqyKOjJ_Scd8HzKkWfDZS9byREDD9miJA2wfs2=b+kK6z9Rg@mail.gmail.com>
Subject: Re: [PATCH v11 06/12] target/riscv: Fix page table walk endianness
 for big-endian harts
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org, 
 Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 Anton Johansson <anjo@rev.ng>, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52f.google.com
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

On Thu, May 28, 2026 at 6:16=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> From: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>
>
> The page table walker reads PTEs using address_space_ldl/ldq which use
> compile-time native endianness (always LE for RISC-V). However, when a
> big-endian kernel writes PTEs via normal store instructions, they are
> stored in big-endian byte order. The walker then misinterprets the PTE
> values, causing page faults and a hang when the kernel enables the MMU.
>
> The RISC-V privileged specification states that implicit data memory
> accesses to supervisor-level memory management data structures follow
> the hart's endianness setting (MSTATUS SBE/MBE bits).
>
> Fix both PTE reads and atomic A/D bit updates to use the explicit _le
> or _be memory access variants based on the hart's runtime endianness.
>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index fd7c6ac1b23..9ec15fdf46f 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1370,6 +1370,7 @@ static int get_physical_address(CPURISCVState *env,=
 hwaddr *physical,
>      target_ulong pte;
>      hwaddr pte_addr;
>      const hwaddr base_root =3D base;
> +    const bool be =3D mo_endian_env(env) =3D=3D MO_BE;
>      int i;
>
>   restart:
> @@ -1418,9 +1419,11 @@ static int get_physical_address(CPURISCVState *env=
, hwaddr *physical,
>          }
>
>          if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
> -            pte =3D address_space_ldl_le(cs->as, pte_addr, attrs, &res);
> +            pte =3D be ? address_space_ldl_be(cs->as, pte_addr, attrs, &=
res)
> +                     : address_space_ldl_le(cs->as, pte_addr, attrs, &re=
s);
>          } else {
> -            pte =3D address_space_ldq_le(cs->as, pte_addr, attrs, &res);
> +            pte =3D be ? address_space_ldq_be(cs->as, pte_addr, attrs, &=
res)
> +                     : address_space_ldq_le(cs->as, pte_addr, attrs, &re=
s);
>          }
>
>          if (res !=3D MEMTX_OK) {
> @@ -1629,15 +1632,15 @@ static int get_physical_address(CPURISCVState *en=
v, hwaddr *physical,
>          uint64_t old_pte;
>
>          if (riscv_cpu_sxl(env) =3D=3D MXL_RV32) {
> -            uint32_t cmp =3D cpu_to_le32(pte);
> -            uint32_t val =3D cpu_to_le32(updated_pte);
> +            uint32_t cmp =3D be ? cpu_to_be32(pte) : cpu_to_le32(pte);
> +            uint32_t val =3D be ? cpu_to_be32(updated_pte) : cpu_to_le32=
(updated_pte);
>              old_pte =3D qatomic_cmpxchg((uint32_t *)pte_pa, cmp, val);
> -            old_pte =3D le32_to_cpu(old_pte);
> +            old_pte =3D be ? be32_to_cpu(old_pte) : le32_to_cpu(old_pte)=
;
>          } else {
> -            uint64_t cmp =3D cpu_to_le64(pte);
> -            uint64_t val =3D cpu_to_le64(updated_pte);
> +            uint64_t cmp =3D be ? cpu_to_be64(pte) : cpu_to_le64(pte);
> +            uint64_t val =3D be ? cpu_to_be64(updated_pte) : cpu_to_le64=
(updated_pte);
>              old_pte =3D qatomic_cmpxchg((uint64_t *)pte_pa, cmp, val);
> -            old_pte =3D le64_to_cpu(old_pte);
> +            old_pte =3D be ? be64_to_cpu(old_pte) : le64_to_cpu(old_pte)=
;
>          }
>          if (old_pte !=3D pte) {
>              goto restart;
> --
> 2.53.0
>
>

