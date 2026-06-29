Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6EEC43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 00:54:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1we0Ga-00023b-W8; Sun, 28 Jun 2026 20:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1we0GZ-00022m-6G
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 20:54:27 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1we0GX-0005e5-B0
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 20:54:26 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-69532288224so5509180a12.0
 for <qemu-riscv@nongnu.org>; Sun, 28 Jun 2026 17:54:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782694464; cv=none;
 d=google.com; s=arc-20260327;
 b=n6R9fAsGbr/+wQoL2YDwmQdSHEsEAlZ2ZFQyZ4+7nx+dEkJtV5kl4CaXPH6ILax+n/
 E3Ae+WdJiLBo6JWBUHQ3f0rxK1EMrMBype/6pkW+iUDqR71HeVBzaZfAvhHLV+gXJTAc
 pXKitCSNjsm2wXQc/sdguX82Ms1YniLsH9e9EvhHSx0DZFF8n/YiTLKDBhXijrAtx+Gf
 6iGBjMVHNUIzmfkxxARGB8dqgUMR/WYGiknsWVuuo0hJCX+eQmTFmWEpWkpu4/M5jt79
 nUC1L9Jb7w84JHZVnt7uZDMCI9oNqSJoqzGAgAG+ROHXWwDwJQOM3LJxWKGjefmsVfVj
 7Agw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5d2lZ4pWSohSk57YjRQFDaDExvgrPNsodilWDmJTziQ=;
 fh=8LySAWRNbBBYtd/URnI6QuiCtlBfckPDYRq4rgUkG18=;
 b=GrI5sBQs8b5I1n0doCaTgnxrwuDG5kyRe/FVNNKs8dAL+Zd3Yr6HBl6EWRA5PSUkNw
 Wdw+BtvHbevRonqgrPKI85En2M16UKg6VculuSw/eLFA8zhG8KdEkWlTWBBDxgioqRRP
 Uh/Fqr5tC5g7Ge7kzzLSJYXKb9tjWtY+W1I/aBnvPuVN/5MzvXtVjA3l/i2cOSJEQ1yb
 1Kb1h7VKmW0hCPeJLeHsTSYcNutZ/Q5fhAS3d4brmhWWReiTvAiVDsVqvqShcIDm8iyB
 w3jWqD8ISiDrp1iL5ACxPqcg338YYREMb3EqX4YlA5KP99P2XVnG7BCm+T1KsTWpzSGh
 3OSQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782694464; x=1783299264; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5d2lZ4pWSohSk57YjRQFDaDExvgrPNsodilWDmJTziQ=;
 b=pLyPO/m7LPPqH5aC3IaB3UZoGTxZzEYD/e5O+88w2Q3gWmWtwInxe7pH2md5fJ5Xsc
 dRkYQ8cBYZKmVeSjBvQ+uf9JEis1j1P8XeRgRBAwkuE8eb9yJCP7IkGXzqd1fzrzqedE
 jhVzjsu0O1md5khqy8RXiM4PcyspAjqJWMLsMqNKJUKLkv4YFAlAfAceuqcEg/BvdZmb
 Z3RxBO6myjBSce+MMOhphKhg39c0J6LMFztv63MD8izFWepOctTTA+9k6FfHr8ao93aC
 +/AoIZwrM+RzTu9aeS8nvc87mY8ab2VUaE74NSXBQBV8ll1SDEZpKkPLR5eTEkyPhzfx
 aM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782694464; x=1783299264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5d2lZ4pWSohSk57YjRQFDaDExvgrPNsodilWDmJTziQ=;
 b=h6DS4LOs8xhaHnZwVsRMNhYZf5INlm8rjWHnYN6PMcfr6dt6Aa8wiDtG4vbs8JoFjo
 iRO6cHdcK38RetPXxTw81voRjOJ6OuNkmvc+jzeaq5zIU0frmEB33u/kC3HkZx2/b/VH
 l2kLXQ7PH/6iPEdazGX4Hh1J2qQcCPXM9ApDDTHLoo1m+E3lZ8oxTAEJ66b9yObYVsAL
 A9RAzgTzWd9XNtNTBsQsBpZrnOCP1Ik7Zki+iCznZaJoOTZCQED4sN/wqAJ5Q4cF8ikz
 MkQJ7Uy2MVk+Rw9IAz468m8F0fE8IgWH86ulV2s5+1EdMeICcaNkRcT1ltFtHc1s6jU7
 T0Mg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrmA0CidKDThDIiSFPTqA5L4ybU+OwPgxyfoawnRhi2ktC+6uVf4+s4aF1Tf3rLFqE84X11XYW3FsWA@nongnu.org
X-Gm-Message-State: AOJu0YxsMbDvyGT5/Uv8YB1vGlkMRbAa8Ee9CUGfwsjeNYXn4tidWrTH
 PEh4La/5iLnZ5Mm5TycCXcAc4KTSmrvBAVDkXyfDg8gcFmJJWUAC0XOaYJvN6uGXKXtMWwBrSS8
 +o2NaRJ1iXUfdSN4Grax8IlWkTZYvmjU=
X-Gm-Gg: AfdE7ckwevr8ST37y0a7mPHXIdm54aotnvRd/5l2+bKwOso+TnEcpGX9UbqyPYmkCq1
 ij8SxM/OtfPTnoALbi+NzmBWQiXgKk6N3bDxD0USY0m6HbZZmYaYasUkTrTM2sOCdrDFfUZ8SeA
 JtgmbT/Iwy4vbtl2kWuWaCLdqsx3Cy/+5DBolE8zpSOHSICDkAKdc06sdkNyNheMHuWN/kfnCPL
 DNF86Y6IFF+r5I+O2Z9T90w0USQSD3qcI/of6Jc6j+9wogj3Ed1Wisuaf5+u3d7jgUjCqkAuoJU
 bNKFFYORp35Uuts6ky3aBzOV6IU=
X-Received: by 2002:aa7:d604:0:b0:698:3b7c:7e41 with SMTP id
 4fb4d7f45d1cf-6983b7c804dmr2942777a12.33.1782694463588; Sun, 28 Jun 2026
 17:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260625-marchid-v2-1-3821c351028b@gmail.com>
In-Reply-To: <20260625-marchid-v2-1-3821c351028b@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Jun 2026 10:53:57 +1000
X-Gm-Features: AVVi8Cd9PrZGsLrwdrZZbrz8nzKCtNCvtsbS2dJnvnr9QMX-v0jLxd52gqvOYp0
Message-ID: <CAKmqyKP817ZuYSkctYBaUkbv7+wDEzj2j9qi+5TENE7hSViODQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Report QEMU CPU archid as 42
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, Atish Patra <atish.patra@linux.dev>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Jun 26, 2026 at 3:13=E2=80=AFPM Charlie Jenkins
<thecharlesjenkins@gmail.com> wrote:
>
> When a non-vendor CPU is used, report the archid as 42 which has been
> allocated for QEMU in the riscv isa manual [1]. This can help software
> check if it is running in QEMU.
>
> [1] https://github.com/riscv/riscv-isa-manual/blob/main/marchid.md
>
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> This series was original proposed by Palmer Dabbelt [1] with a follow up
> by Daniel Henrique Barboza. This patch implement's Daniel's suggestion.
>
> When booting with a non-vendor CPU such as with the qemu arg "-cpu rv64"
> marchid will now be reported as 42.
>
> > qemu-system-riscv64 ... -cpu rv64
>
> processor       : 0
> hart            : 0
> isa             : rv64imafdch_zicbom_zicbop_zicboz_ziccrse_zicntr_zicsr_z=
ifencei_zihintntl_zihintpause_zihpm_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_=
zbc_zbs_sstc_svadu_svvptc
> mmu             : sv57
> mvendorid       : 0x0
> marchid         : 0x2a
> mimpid          : 0x0
> hart isa        : rv64imafdch_zicbom_zicbop_zicboz_ziccrse_zicntr_zicsr_z=
ifencei_zihintntl_zihintpause_zihpm_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_=
zbc_zbs_sstc_svadu_svvptc
>
> When booting with a vendor CPU like veyron-v1, the proper marchid will
> still appear.
>
> > qemu-system-riscv64 ... -cpu veyron-v1
>
> processor       : 0
> hart            : 0
> isa             : rv64imafdch_zicbom_zicboz_ziccrse_zicntr_zicsr_zifencei=
_zihpm_zaamo_zalrsc_zca_zcd_zba_zbb_zbc_zbs_smaia_smstateen_ssaia_sscofpmf_=
sstc_svinval_svnapot_svpbmt
> mmu             : sv48
> mvendorid       : 0x61f
> marchid         : 0x8000000000010000
> mimpid          : 0x111
> hart isa        : rv64imafdch_zicbom_zicboz_ziccrse_zicntr_zicsr_zifencei=
_zihpm_zaamo_zalrsc_zca_zcd_zba_zbb_zbc_zbs_smaia_smstateen_ssaia_sscofpmf_=
sstc_svinval_svnapot_svpbmt
>
> [1] https://lore.kernel.org/all/20240131182430.20174-1-palmer@rivosinc.co=
m/
> ---
> Changes in v2:
> - Added comment linking the spec allocating 42 to marchid
> - Cleaned up the id setting
> - Link to v1: https://lore.kernel.org/qemu-devel/20260624-marchid-v1-1-a0=
af7997071f@gmail.com
> ---
>  target/riscv/cpu.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index fa497e5e8a..94946d335f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -47,6 +47,13 @@
>  static const char riscv_single_letter_exts[] =3D "IEMAFDQCBPVH";
>  const uint32_t misa_bits[] =3D {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
>                                RVC, RVS, RVU, RVH, RVG, RVB, 0};
> +#define RISCV_CPU_MVENDORID 0
> +#define RISCV_CPU_MIMPID 0
> +/*
> + * marchid allocated for qemu:
> + * https://github.com/riscv/riscv-isa-manual/blob/main/marchid.md
> + */
> +#define RISCV_CPU_MARCHID 42
>
>  /*
>   * From vector_helper.c
> @@ -1183,6 +1190,10 @@ static void riscv_cpu_init(Object *obj)
>          mcc->def->profile->enabled =3D true;
>      }
>
> +    cpu->cfg.mvendorid =3D RISCV_CPU_MVENDORID;
> +    cpu->cfg.marchid =3D RISCV_CPU_MARCHID;
> +    cpu->cfg.mimpid =3D RISCV_CPU_MIMPID;
> +
>      env->misa_ext_mask =3D env->misa_ext =3D mcc->def->misa_ext;
>      riscv_cpu_cfg_merge(&cpu->cfg, &mcc->def->cfg);
>
>
> ---
> base-commit: b83371668192a705b878e909c5ae9c1233cbd5fb
> change-id: 20260624-marchid-80d176b873d8
>
> Best regards,
> --
> - Charlie
>
>

