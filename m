Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E4FCD6E4C
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 03:52:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTthU-0005Uv-1I; Sun, 31 May 2026 23:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTthS-0005Ug-Ao
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 23:52:26 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTthQ-00023U-JG
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 23:52:25 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-68b482888c3so4888922a12.0
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 20:52:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780285942; cv=none;
 d=google.com; s=arc-20240605;
 b=AXihPzXBAX6lkVkzfGtPvMphe+vj8Uuj13Z4Xax2dOoG3LIkMQRI8oBuf9pcCgCLwR
 E9+w50Bn0HWV1QIvrLhTUYJBXrBfJs5rYUA7BGV+CY4kSoszZIMlOehxDS6ti303UQ83
 FmoJVWhLDwXitv367I5ejBuSvwD2SZMA2CmngjDxQV1BdoADih4pSph/UlruKMXUVI42
 ya/YyL3oea82LkAMdHncvsFIs33e3QNZzHCHq2nwL7UkW5UhFl+G9FODD9v48y3ZG9W0
 HTa8wEPb/vc38FjibsUetzi2B2iYILq+/S0YnPia1K/WwhXunMI0/ckRwYETWhoXWjy8
 OZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=zfDsXkKyFyq9+mfCFsFLYMmwfqHMbcg5Ymls1jwl+Ss=;
 fh=wft29fKSCtR5Ye8TnpMAZ9XaNlgTxuAwqLlSGXzxjgg=;
 b=kxJSJh0OUVyA4stVG3I+ccQ2ZBFTVXPeYZvyABcG3B/qrpWjKTkD5+4dpLTPm5Jj1d
 Q4OIaqEXtDxuBj8p2I0OFgxAajgjIvY3S/+La0SShAzq/bQQKE5jcWC09QzkSVqSaH0g
 oJqMaFfeOB28TqhJyA+5s2nGWqzK2CHbq+njZvQasxW2YTZqOm3uPGQyjFpXwunsPd9B
 xoNPcmFMJAdcA/se2r+UYIwbUzzMlrfKtSms8V9BD+gPL1TdWOiQ4ceXYaIYnEBzr1MX
 +UwkZAbV4Hs6totLFp3OR4BShWxPP6+0CBdaQNfKFlSvl4xg3phavNIkNXZPifuEFEaA
 ykUg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780285942; x=1780890742; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zfDsXkKyFyq9+mfCFsFLYMmwfqHMbcg5Ymls1jwl+Ss=;
 b=spWMmL6SBhN7M6kDOaL/aVO4cGpS4mb9SDhxEOFifkZHMhQAdqm3dP0amSPHhrmiNP
 MNqznd9gmMOg3bHYwzPTXEJRBIDnN07WWnG0a4p7HfDNphSQktoeE/W8lPvg3jlhY+JN
 n/ux1WBc79NTBbcJwy4tfOnMkLu8AAGpQm9/hOLhIxzUyTqEwh7IrFkywa8xWZZ/n27n
 HdFSPdUsYgCkKhfzRlisL2g9y2Cfp/pRfuQF7WnwGumJJ6WNrh2NYL2mTrLyKE8R6pdn
 +R7ehDWkFJGlfGAs5H2P9g0cji3DXTMKeqkdcEMl5vhJKyQcnnAaWzHgdN0fW1Vnnrx6
 DCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780285942; x=1780890742;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zfDsXkKyFyq9+mfCFsFLYMmwfqHMbcg5Ymls1jwl+Ss=;
 b=eAUzlqGB76ShcrN/e/Zv0b7Z14QqkoMfJ3QeTVI04ryoz6pQ5zyWLs0CVfD8CtgOcL
 uzTQZzee6khDhUXUecLrr9eDIzn5dGlRgkx/ebV3ZB6c2bPI4suxyiqhoqbsi+VTZO/T
 0782OMRdHaw4jqyIPIF3TpUHhX53z8ZKf2TqnkqF27IQJXbAIGSbF82qMkcZEkCqONiE
 UmsVMV+hgxJoXN5HE3IIZhdxZ1C0v0dEQUVEMMwwIMrsWfrjRn0Gm7hAgnOMoDPvaukC
 qZm6KrJuIeIa5tTNDnkx20G7hDZmlXoQjvn7h+BYrQLvTJe5L87zmt1qUN2IqDAuug/r
 esNQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ91DR0XBI1Yxp59smkGG7cACHojj55dhGUPUQHS5UHSJivh1oxrrY42sX/FMceas2OKb4nyvXX1p/fP@nongnu.org
X-Gm-Message-State: AOJu0YwObfBiK5Cr4QSS/ZcwQWZBy4MI4cv0SG9shFpVUvW+BCYScTqr
 Nx6lVYM/AdWhsaTTV3gwNC+nhLWcCKGnHA6/7Yv26czlDarkA3QVWzlDIfRMh69Lju4aBaTBb69
 DN4ZNK7kYO1eMJOCafSKJ93qs4FJIiVk=
X-Gm-Gg: Acq92OF3Ysan3AVQVuA+1+U2iifq38FZixXGELoCqYSxjYc5g7OuZ0dgwywVTFmivcP
 /h4eDNVmm6fDLLS84bJHiooH5NA9MJ91SF6yHamhUBQISHcSbPg8AZDAQXvpDM017eALp/nVv9i
 tlRVZssDaQByBq+cUCkcO3gi8SdeZH+svsvjcn+VNTIgTyi+49ymb9gWGuLTKyuMubhJH0aKLn4
 QLgMBTt2Bj324x81pwBkF4UAPtnzmXv+774nE9oNphG/5F+qs7srEsT/uJ4RUzkpCN8NchBFNV2
 Z6h2yfw7lQHFgtBMmMGoimbL/yCDcpeu+PkoE4VwiA/sAl/Y
X-Received: by 2002:a17:907:c807:b0:ba7:41d0:5efd with SMTP id
 a640c23a62f3a-be9a7fab0damr610853066b.28.1780285942019; Sun, 31 May 2026
 20:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260527201348.29511-1-philmd@linaro.org>
 <20260527201348.29511-5-philmd@linaro.org>
In-Reply-To: <20260527201348.29511-5-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Jun 2026 13:51:55 +1000
X-Gm-Features: AVHnY4IguP4OgwazF0mPVDb6p559K0TqSeH82Va4YljaRc2vJzTn7MjL6F4TQLY
Message-ID: <CAKmqyKN8TVS_QZYt9nDUxsyq=_-dg6MFObvyci5S=vNa=ye7YQ@mail.gmail.com>
Subject: Re: [PATCH v11 04/12] target/riscv: De-indent some code in
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
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, May 28, 2026 at 6:17=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> get_physical_address() is quite complex already. In order
> to make the two next commits simplers, de-indent one if()
> ladder. No logical change intended.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 33 ++++++++++++++++++---------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f86bfdb32e7..6da67e132eb 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1617,27 +1617,30 @@ static int get_physical_address(CPURISCVState *en=
v, hwaddr *physical,
>          hwaddr l =3D sxlen_bytes, addr1;
>          mr =3D address_space_translate(cs->as, pte_addr, &addr1, &l,
>                                       false, MEMTXATTRS_UNSPECIFIED);
> -        if (memory_region_is_ram(mr)) {
> -            target_ulong *pte_pa =3D qemu_map_ram_ptr(mr->ram_block, add=
r1);
> -            target_ulong old_pte;
> -            if (riscv_cpu_sxl(env) =3D=3D MXL_RV32) {
> -                old_pte =3D qatomic_cmpxchg((uint32_t *)pte_pa, cpu_to_l=
e32(pte), cpu_to_le32(updated_pte));
> -                old_pte =3D le32_to_cpu(old_pte);
> -            } else {
> -                old_pte =3D qatomic_cmpxchg(pte_pa, cpu_to_le64(pte), cp=
u_to_le64(updated_pte));
> -                old_pte =3D le64_to_cpu(old_pte);
> -            }
> -            if (old_pte !=3D pte) {
> -                goto restart;
> -            }
> -            pte =3D updated_pte;
> -        } else {
> +        if (!memory_region_is_ram(mr)) {
>              /*
>               * Misconfigured PTE in ROM (AD bits are not preset) or
>               * PTE is in IO space and can't be updated atomically.
>               */
>              return TRANSLATE_FAIL;
>          }
> +
> +        target_ulong *pte_pa =3D qemu_map_ram_ptr(mr->ram_block, addr1);
> +        target_ulong old_pte;
> +
> +        if (riscv_cpu_sxl(env) =3D=3D MXL_RV32) {
> +            old_pte =3D qatomic_cmpxchg((uint32_t *)pte_pa, cpu_to_le32(=
pte),
> +                                      cpu_to_le32(updated_pte));
> +            old_pte =3D le32_to_cpu(old_pte);
> +        } else {
> +            old_pte =3D qatomic_cmpxchg(pte_pa, cpu_to_le64(pte),
> +                                      cpu_to_le64(updated_pte));
> +            old_pte =3D le64_to_cpu(old_pte);
> +        }
> +        if (old_pte !=3D pte) {
> +            goto restart;
> +        }
> +        pte =3D updated_pte;
>      }
>
>      /* For superpage mappings, make a fake leaf PTE for the TLB's benefi=
t. */
> --
> 2.53.0
>
>

