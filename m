Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A9EC43458
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 00:46:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgXTU-0007RG-RP; Sun, 05 Jul 2026 20:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgXTS-0007QN-2N
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 20:46:14 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgXTQ-00058b-ET
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 20:46:13 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-698e5859a3cso4445285a12.0
 for <qemu-riscv@nongnu.org>; Sun, 05 Jul 2026 17:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783298771; cv=none;
 d=google.com; s=arc-20260327;
 b=YWMyQA1jazrH8Hv5SG/SlgAlJa5DnNFR152u/MmbbH5Wd8vRZdJtqcYKHa6UJ0pqlp
 WH+RfiHJQFqFD7nFqazSzHdPYxS9EIarc2m09zm7HDS2zBG2+pTt3JR6/vJtFCMHSshP
 7tkwlaVeH2OTn5gZ/BSzWYER84u5Zm2gsrVMbcOOFmJtHkPmW9iMqoh14Fz/SACxm5v4
 TzC5Y3CBhXwBBehdnG77NR1+Bek33pkqg/MFIMf+3+FAhLsnA2y5khoOWqMFEPLQGQ4i
 vfAU1ro+FeptB52fX2oRCMS6Xw91+QAYZ996UXFwMiDtguwDDBdctvQDKfr61eq7AQIW
 aIUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=B2FA8iGDLf9MABeDEiYb3p07hX/E50KoRlwiiqvYMlE=;
 fh=sip+7gFYSiywcRSvcyzH+XQLiaqkn89UPB/lTtGdC88=;
 b=VM/Rv1nNVbXXUNWJfmUH1EsQlYL4tT2xij0912DmnKb9sWpUIAZ0qCcGiFLeGeHdNZ
 Fz9l+RCjnfdnMBrjZPHFBDkM6aYEqc/5PQejzZkkM1maxaudL88uxCTObkGUavYsDRUd
 7ygn0fGES4jSNbQyiJcPBl0p47mG6xRB4WMgb7sxRzPzb0rtaAt0D61oKMCev3xSu7BZ
 WJGryerygt5dPpIKAaXc2Kbz6ZXP26m8AkQfz2Uid+slIJ0nK7c1tCmP6uiSiQS6pOEH
 6qVMKwCtmBvAui2VCdfBdJXMIwpXmSFTxihLFsPiIwi9zGD3HGgiWWq9aM0KBnFhtLDr
 mMsw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783298771; x=1783903571; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B2FA8iGDLf9MABeDEiYb3p07hX/E50KoRlwiiqvYMlE=;
 b=eir9EHjh1KPwFcmrT0u4jMiC2/hXaSztpBkPkl88OtmAnEPvxOVhHiMnv1C+IcBe0O
 DJWKTWtkkiv0Jv+77SnK00HgGkfNkwPkvWgfwedx9S9zrtj++zAtuQmRFkZjONzkosfU
 +IJ1AQ9PhAc374ogxj2O5nw2I85tLMMx1Y0WXLCJvIlPfsKu6Od+qqe3XKcZDQ4QKV/s
 jjypGDr8VQWiC8XxZ8x1HxP5xEookbKHnsyHEByJWtWzDqPMf1Aiote9sH1TMRIw/mS0
 ugtd16GYrSSV9yt+/aokGdN1Z36umKfg3oVZvtDOUo0lNvPdH/MIJjQ7UVNtQ0/zk6i5
 W9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783298771; x=1783903571;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B2FA8iGDLf9MABeDEiYb3p07hX/E50KoRlwiiqvYMlE=;
 b=EMV0O0r+u8Osm8PPk197tW5fBloYXrt8TcOSr7U7JHbJ3znea0vvl7VE5JHr3YpUi1
 lqKVxmJ0ERCILlebUO79NX/zuzdRLOH+TCqFeB63CnO8xmnZlBXWtMihu5NOWH6g+t83
 Q8eyfEd/xdc8czTprjpGANmGY4rDZT+rETQi6DDkQnDz5DtGXkVDq44LqDpQXgdSXQPM
 cCsNPDfJkTIoUVZ9g9vug5Ijlbklqho1E7Q6rlxvgrpNDCm5XHx93jfSdYELI/ksLu/+
 NmdBgVP4/AhBisoTXMB0kSPM2XIJogeFTktBqsqWe70IXRwWllGJAt9EsUxQaU57X2ob
 2nBQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RopFwTz9BQApuwCVBu3l3UOVWYiJQusz7WUcRTdPHXDAoFYbAMa61cn5YS3DtVudGmrPo0ZAOKgSp16@nongnu.org
X-Gm-Message-State: AOJu0Yw5gAk8e0l0+0RPExUY49WS1rpiKL+drO7vBFWTf22dG91cMccO
 X3br1lm7snYDlLa4RCM0g91poTIjXJzA7HObQy+ccbTT98+v2ZloIKA7RHaKDBC+baVbPSx/1S7
 bG+WHd1CkkL77rpo8vEl1fd9wtw/4FfQTTmRo
X-Gm-Gg: AfdE7cl+NFK3jIVSwlqPk8HobStvfq38dNECgpPYdthTRplrdCoxkQ7+rA9i5bUYpOy
 bh7o9aoMBUodx5ZLFkSq/DGa+tdACWZCNxEsQr6hQ3iiz7m0S0DUCITk/ogXeoiCgeuulebU6DI
 +hshWTOjBESi7ekQYsb8/vDf4Jwao1Az73yN/Ex4jbevQXeK8cf07OnrKCL9f+FnkrbBGdNZ4EP
 l8tFVRp+NSSb7wVM6Ziqa4+AUayJUa3iXgGIN6pyjLvUTwju7bh843X/5WrPPX5/OW/RRt9Ggg1
 06k4JTdUiHKFs7Bde05Lx7pkzAw=
X-Received: by 2002:aa7:d305:0:b0:698:86ce:8dc8 with SMTP id
 4fb4d7f45d1cf-698c10acd82mr3577817a12.10.1783298770788; Sun, 05 Jul 2026
 17:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
 <20260703180538.3346781-6-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260703180538.3346781-6-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2026 10:45:44 +1000
X-Gm-Features: AVVi8CeYR1Jn88ndWApj2Lert9f9rkzB7vn7Pb0b4H5mdhB_J6CJKMVIgff61bk
Message-ID: <CAKmqyKP3eHjO57v4i1Luy_v8MDHW26ha1MhKUpmrXjrCQc55Rg@mail.gmail.com>
Subject: Re: [PATCH v4 05/24] target/riscv/machine.c: do not migrate pmp state
 with kvm
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52a.google.com
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

On Sat, Jul 4, 2026 at 4:08=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> The PMP emulation isn't present in the KVM driver.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/machine.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index ba96ceceef..ef0a8eae24 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -20,6 +20,7 @@
>  #include "cpu.h"
>  #include "qemu/error-report.h"
>  #include "system/kvm.h"
> +#include "system/tcg.h"
>  #include "migration/cpu.h"
>  #include "exec/icount.h"
>  #include "target/riscv/debug.h"
> @@ -29,21 +30,25 @@ static bool pmp_needed(void *opaque)
>  {
>      RISCVCPU *cpu =3D opaque;
>
> -    return cpu->cfg.pmp;
> +    if (kvm_enabled()) {
> +        return false;
> +    }
> +
> +    return tcg_enabled() && cpu->cfg.pmp;
>  }
>
>  static int pmp_post_load(void *opaque, int version_id)
>  {
> +#ifdef CONFIG_TCG
>      RISCVCPU *cpu =3D opaque;
>      CPURISCVState *env =3D &cpu->env;
> -    int i;
>      uint8_t pmp_regions =3D riscv_cpu_cfg(env)->pmp_regions;
>
> -    for (i =3D 0; i < pmp_regions; i++) {
> +    for (int i =3D 0; i < pmp_regions; i++) {
>          pmp_update_rule_addr(env, i);
>      }
>      pmp_update_rule_nums(env);
> -
> +#endif
>      return 0;
>  }
>
> --
> 2.43.0
>
>

