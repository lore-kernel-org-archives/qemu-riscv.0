Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4ECACDE00B
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 00:40:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcubo-0002gd-3t; Thu, 25 Jun 2026 20:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcubm-0002g1-V4
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 20:39:50 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcubl-0004gR-IA
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 20:39:50 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6980ae819d0so783563a12.3
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 17:39:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782434388; cv=none;
 d=google.com; s=arc-20260327;
 b=NNa0RhtqufCjs5x2ApyYox45aKZ7BZ7Ffo0/baiQqimI9upOnPPOjqzcH56gXb5HG/
 PZ7eY/DGY/H4zOssWIds0b7B9sK9de/fEh4dDWnCRww1y9bK9qyG4+nrA+xe16++TOLp
 leWelcSYsSDo6qM1zvFuOIYckaCzcXaLfE6OH+bzKZ/MH1VNFYOV37v6raoWmzROklbS
 F3bb9Qw5jQmLY6A2SbPyPbxa+K1d2iaHml5XqOR36EXuRo1q1cJw9SEpyN32JHwC1vPR
 j0ZX6Dc8tn1b1OjYuaCHKBGbndgmaFSNUsvHWzxzoEhpFvILywzBEv/uun3Ke+pzdDaE
 sP8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=0tY7eeiHPpKhGIMhfzxHDid+o2cnG7nUgOBAi2VlDoc=;
 fh=KH6qZp61Y1PoURatyud7V/0zJAwhWOtYyqrzBkA8pr0=;
 b=RZd5i0YTsMjgD9x2gIq+K0XYsUGyBY8sKueqp7lcfT9mG6CY183igDxWsrLP85CkPY
 AjTC2LdFkp04tSH921TMi2hstFDYOsCzWaB4T1w6qsi2dS/dCWwtLUArCqAqqLDQ0B0R
 OtaaN+WQJd/7IRBHkWyYM93NygyohX9aXnfWbfUlkkZspMKhYHi5SpcX0+EtfQaiV0Ax
 Uazsg2wHJJALEoGE2qBSMVJwu5q7euROJ7Hut0v0qawQJgbj1F/rCfBihhVqNKr319T7
 2BWG8600IbL72ouFp8t7K7Ep7VxRYXDzIyZVyVZtywlNxi9yxnvjtqzavnXpG9nlp8Yy
 3Qhg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782434388; x=1783039188; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0tY7eeiHPpKhGIMhfzxHDid+o2cnG7nUgOBAi2VlDoc=;
 b=ZSFhupl0V/Zd/xaAwUNJQ4qvYr+GnmaJt69YqakW2HXg1g63lXBgPsk6feMhx9yI76
 Yggb7SZ7QVi7fZLyCjC9jRHYdpCxODKOTgWv44Bx+syUVOoBBQlOWGCMXiOSke7WJpG2
 s6VQRJkUE3KKdv96zCFVrW+9F5dGbRYtkuxYc+IESNsXACf2Nd0/A/C3gMwjkZ4Tlj9F
 8k0B5Z5mDUWX6zkGAs3Cjs3NtgVt4SM3OGcD8h7B8J5En36cNEk824IXRSlCzucncYqh
 Dets89RZAQVcm0etq7kL0ofb5s9G3MQEc2Amb59u0dWe0Ywe9jCbx57cZwVXcTNFqBS0
 b7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782434388; x=1783039188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0tY7eeiHPpKhGIMhfzxHDid+o2cnG7nUgOBAi2VlDoc=;
 b=RCimyUqfWkUxoxl4mwWJ4P4YUHbuIkB+r6vqXUZXFQwRq0dHaCLnwDzSCbfRgsl8dI
 6v2YhKWtsnsRpVsCujBUL7IHxt4cj6GCYfk/8c5RHSTj2EECjzqeoQhIImr5QFh2nqcC
 WyHnDg2QuJz72LIj005XID5/s1EK9Uq/H0iaHpLmypvS1++J3GyVc2kno5aIv3EM/88I
 Ab5SRrxvLrATQxbkKFs0trFPVKRI+XBPPEF/jiXnzkKZ4o5w8l5m8RtA5nbWnnMwa/m5
 I74NeIuiMFOW2MAo9onHrP97w8Qni5QGEgUDRfT6f9rxfnQNAgPxKJZPzmSSZk5Wz/8A
 y8Ow==
X-Forwarded-Encrypted: i=1;
 AHgh+RpyUlhnHUwS8j/Eyoj17Y/n+GHkd5hmZ4rXjry2PFbOekFZHa3j0c6D7UKcozIiLcRSICLQLi/SKQGX@nongnu.org
X-Gm-Message-State: AOJu0YyCNv5hsL9HzJLkmnNsay9dcN9CYp8T0knVdeszfVR+sm8NIfb2
 z/L909mAIqKzuQ/3N2/M1uF595rngeVRXaoTVtBELr+dxcjik520NUC+eZGiCLogDNsE16YDMdf
 +0LCRl+3qF+Ya3kdIW37HJBnoDKsWrlk=
X-Gm-Gg: AfdE7clccaQha9T3j8TX2PBT5bhGDZnHaeYAEYutBZREoS8k7lPHMacHJUuETqC/Nw8
 kMXj0Sa3TFdHvz6V9yM+RNCSQnN1ZKZikdwWvpeJcvHcwHpd+OJUFaU1FjDaeIJTQxrRZT40qfC
 o2dKlAiT/dqkqQlbGZ04XTybZ2Y28nCppkUWdiZBPeLr7ked7H++28sna1a3XYkPXrlWBMNccEb
 Vu1+HaWbtkHm1taJNNumyDQ2dumr7AmuzanhR0otYtHCvS/jDRj/e7e1ajmmziewl4uIxVPBPzE
 EHlqWTbRAAuCiHoLkPMa+SS99m0=
X-Received: by 2002:a05:6402:3581:b0:691:b158:b424 with SMTP id
 4fb4d7f45d1cf-69810a456f8mr808066a12.5.1782434387897; Thu, 25 Jun 2026
 17:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
 <20260624000632.2149359-4-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260624000632.2149359-4-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 Jun 2026 10:39:21 +1000
X-Gm-Features: AVVi8CeUR4rAOilicponoAHTMt2Mi4R7Mx4j6B9es0ABeuGk3jNKiRSfjqigSLo
Message-ID: <CAKmqyKMb8gAwWe3ad=O2TOFX2e0zBfzeyPP5J+5tBggTSm5Hxg@mail.gmail.com>
Subject: Re: [PATCH v2 03/24] target/riscv/machine.c: do not migrate pmp state
 with kvm
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com, 
 fritchleybohrer@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x534.google.com
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

On Wed, Jun 24, 2026 at 10:09=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> The PMP emulation isn't present in the KVM driver.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/machine.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index ba96ceceef..e1cbcaa349 100644
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
> @@ -29,7 +30,11 @@ static bool pmp_needed(void *opaque)
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
> @@ -39,10 +44,12 @@ static int pmp_post_load(void *opaque, int version_id=
)
>      int i;
>      uint8_t pmp_regions =3D riscv_cpu_cfg(env)->pmp_regions;
>
> -    for (i =3D 0; i < pmp_regions; i++) {
> -        pmp_update_rule_addr(env, i);
> +    if (tcg_enabled()) {
> +        for (i =3D 0; i < pmp_regions; i++) {
> +            pmp_update_rule_addr(env, i);
> +        }
> +        pmp_update_rule_nums(env);
>      }
> -    pmp_update_rule_nums(env);
>
>      return 0;
>  }
> --
> 2.43.0
>
>

