Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C75CD5BD1
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 03:56:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTtkv-0006cQ-J8; Sun, 31 May 2026 23:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTtkl-0006by-Ho
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 23:55:52 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTtkj-0002p0-Ev
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 23:55:51 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-becfa735b9aso90721866b.1
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 20:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780286148; cv=none;
 d=google.com; s=arc-20240605;
 b=aKEZsc/Wrs+wRbIv7ImtPx/xrOQxJtAAPUVY0yoM+dcZx4X4tqYtJBlGecBWmskIOO
 lF8GZosHFEWHYTUSCdc6/n3cfnRU2dWWvsP/v+D78RcuQZrXCiQFN4e+QX2b+wUkVLcB
 IUeY4VT1j9KCbIOZlKr3e3aW7X4UaT6/2ej1X+vileysUQ6n4NNYXuu+wLjyiI+bjhq5
 96xCiXswsYsfGXeJv03MpXi+bmp/TNJoHMb2iw4RT7gp3c1VCUIp1aJNhyPQm71RUk9X
 b8cS2DytBIzHszJfm3zmMDuNxIDAeQXwoKqjI6BUxo6kf13SD5ky9ckpfCmi2MAAnmiX
 UBRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=nnOnrcJSjSN1lAmrzErKuLVAP/jlLgIKR/oTsGO10JE=;
 fh=+GlWeKGgMD6VqUSHsk7E0JZyTzcTfJNrCe0lPfvzXJU=;
 b=j+IDR1D0xPjwGzh1kOVCNN/3+4ns/XpWhKFjULKd4VPNXLdlPJCPoYoKnLnfSWiSn0
 cnV2Vp5vfafbiqBvT5ytTFh4UddcdxAHgcXYvOPKQ6YV/d0sIrouCGCT+PSY0qk4U8j0
 WZCJK10MQSpxsQyk1fivAZKNlutGXsldik/MOQJcfejXS+UPeznlU1zlxgFj/ruXPTsi
 mck9o5j738GMszqa54Bt6ytIMjNftcPihKDgY19oYtD+NoK7ug7EGaKIANopC1HHf+e9
 /5fbEKIrtSjv73HH1iZUQ7zoSg3bxbdOwuNmEFYzeOmGKzvIpIWmujOhIhNREngwL4qu
 z5GA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780286148; x=1780890948; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nnOnrcJSjSN1lAmrzErKuLVAP/jlLgIKR/oTsGO10JE=;
 b=lIzqMxQ2LvvquB7m5BRO/n4MfQwV8NgSsGozs9vZeQc0q8vEpJwb8fHPXlzLN84u5p
 7lLzzCsoGSYZj0hTVOi3a8A3Ho3IR/qpRLafYkOD3+lNlNcFyWCg936u7bRB4kLcsmxC
 CdjJek/+r7yZljmVuyw/eoEE13Tnu5uE2VcM0m7D0kiMNmZLdmiOJv6XJ1AkRuGN5f1o
 nMb/fkaWJOlv3oHjkZbKbYBTCYMM6ol/4LHc4J5nOp+czQObmMiflha4SvNrC+yxoNIe
 85rO0/MT3y/BZvE3bmBmaiEhym4UJHmuuYDzHnpZYyxI4qCEAEbbaPv0KMlYq80UPYtM
 fphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780286148; x=1780890948;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nnOnrcJSjSN1lAmrzErKuLVAP/jlLgIKR/oTsGO10JE=;
 b=CgtZphRcp36LpqDeVHaEvWBmsGj7hEGMA1XvePd9WWi9qd4UsCmmTBdReHRZeX4g4+
 +y7yfVVMOz3YI15YvsyhKX5H0w/dozw7hBHeieV6wBWhVQTta3fvzqbmAm39hNeDDkBB
 WAYM7x7Q/9SRRUyZUj+hvHKQC1ghb38c1Pon7j1tMFlq9XwatnkkaKDmHR8GVa1qu7uZ
 R/neunvyOlxEorGR1H7EnGtJFS/12tEQgtEcu84Qudd2DnVYE97lMi6Y6sZLPhRyHasf
 6MHAe7PEuVBskG1Jo+PK9SfBxepVWAMRvME6MXvionS/vsUEy43eTGFVj/0WJJVk12++
 PEJg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/9OaIAHheo1KXzGvUtoqyUInsFPEbnc3/vN4tXoS5A5QCKsZEaGXuT6fcFFxSrd7Mt2bIFFK75ldTy@nongnu.org
X-Gm-Message-State: AOJu0Yz+tvK3aob22yQFqk4eRd7mIVK9+ZRQ0wcIM6mRCFbDh8c4PAyy
 05FJyLEw/UypjVDqMvH1QRFzpo7v+aSFBpp+Ufp8vC0XHQlGse5Sv7FMvKus6XVkCaoQnHEGauy
 1AwKTaUQkHr6IIE2yz93JYG0ZYJygzH4=
X-Gm-Gg: Acq92OF0VYa9bfm0AmXTvf2FotRDzgJvyaw4iMaFhuIjOGL6mEPLN4SWq/xV3S6bg68
 brwJg8O5uZbq8pZa9Ox5kS4vWVxXHTiPQNVvhz3SvPA1BKgM8beZ1FFnGNc1fer78/m2u9FBFmj
 z5EdMWgTxbAUZ/zq2/FE+1fO5HlJ+oZblNywNlz7WWWZP7y9y8I/h2NP2UBot59uHD59QwGEk4g
 2bYkOzHei/zU9Ew2S5zp/TBefkaqxC/Z0aCdVS6NqdADtAg6RFdXR7a2ZcVGaduke6FXb9pKWRC
 Dh8vFhiB6jbFke81n3MPffk6eHtQjX1iFvmaTrZZy247MoFoYV/0XH2aD+k=
X-Received: by 2002:a17:907:80b:b0:bdb:6077:a168 with SMTP id
 a640c23a62f3a-beab5af5f66mr486141766b.26.1780286147462; Sun, 31 May 2026
 20:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260527201348.29511-1-philmd@linaro.org>
 <20260527201348.29511-6-philmd@linaro.org>
In-Reply-To: <20260527201348.29511-6-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Jun 2026 13:55:19 +1000
X-Gm-Features: AVHnY4KnXJr-PqtZ0cNvu9t-sEHPgWxO1vm6OKJi6U97YcjdWz1LO7JOyCwPpCg
Message-ID: <CAKmqyKMfUXfy_5ptMRTQch9hXMwN3rKtECoNi+5-y0FoNbwbcQ@mail.gmail.com>
Subject: Re: [PATCH v11 05/12] target/riscv: Remove target_ulong use in
 get_physical_address()
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
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62f.google.com
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

On Thu, May 28, 2026 at 6:15=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Use uint32_t for RV32, uint64_t otherwise.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 6da67e132eb..fd7c6ac1b23 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1625,16 +1625,18 @@ static int get_physical_address(CPURISCVState *en=
v, hwaddr *physical,
>              return TRANSLATE_FAIL;
>          }
>
> -        target_ulong *pte_pa =3D qemu_map_ram_ptr(mr->ram_block, addr1);
> -        target_ulong old_pte;
> +        void *pte_pa =3D qemu_map_ram_ptr(mr->ram_block, addr1);
> +        uint64_t old_pte;
>
>          if (riscv_cpu_sxl(env) =3D=3D MXL_RV32) {
> -            old_pte =3D qatomic_cmpxchg((uint32_t *)pte_pa, cpu_to_le32(=
pte),
> -                                      cpu_to_le32(updated_pte));
> +            uint32_t cmp =3D cpu_to_le32(pte);
> +            uint32_t val =3D cpu_to_le32(updated_pte);
> +            old_pte =3D qatomic_cmpxchg((uint32_t *)pte_pa, cmp, val);
>              old_pte =3D le32_to_cpu(old_pte);
>          } else {
> -            old_pte =3D qatomic_cmpxchg(pte_pa, cpu_to_le64(pte),
> -                                      cpu_to_le64(updated_pte));
> +            uint64_t cmp =3D cpu_to_le64(pte);
> +            uint64_t val =3D cpu_to_le64(updated_pte);
> +            old_pte =3D qatomic_cmpxchg((uint64_t *)pte_pa, cmp, val);
>              old_pte =3D le64_to_cpu(old_pte);
>          }
>          if (old_pte !=3D pte) {
> --
> 2.53.0
>
>

