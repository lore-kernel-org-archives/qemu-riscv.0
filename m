Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC52CDE00B
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 01:24:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcvI4-0000qt-Du; Thu, 25 Jun 2026 21:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcvI2-0000qb-8X
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 21:23:30 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcvHu-0006C9-8r
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 21:23:28 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-697763eeafcso612991a12.3
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 18:23:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782436987; cv=none;
 d=google.com; s=arc-20260327;
 b=dICL5pcOvtNy0bM/FHTBgTOzGWZoXd8WJYaHjPv4P9Zi8N7cvsDqUFWAs4h7reppMU
 Avb56ap5orU8SWtdRUsXky1msIyKGtbdx9OJsL2CXzD4m5G2VuvK6cOjBr6+wysyeHHf
 yBtryMmD5XfNMt9pWFLCRK9XZASGI0sxrk3m/NdQ75obP4/8Q+o9fXHeGQ037cGkl3gY
 cGnJxE7h++hOpxXrKhQtgqraQiXrmDI6HWWmhyFBmlytjqsqerhf2xR6BjyfLQIQVKZU
 zChKRsOEjyJEvgF/Wan6rnftxtMh9KOkpZUH2g64RVILJQ+Ne1QTQzZ9QryP0npZ5+TO
 c6wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=hbsim/OmqBEq5Y5SAScIk83QXaU3bbpggnMY4QgzNag=;
 fh=Ik49rdM60zMetV5PIG+6SOjRCs/Zc6cJSD3OcmLziGE=;
 b=W/WRkkbsHLvKqtX1S1NqfiPZYAB76qVw1RVNZmLOtNPP12klBrTNZuUTxUBuuS4ygm
 hy0d3XAHKBjasTQv4aW3K9AEqkE1eMkTpFyDykt+V84sbU3vxI+ilJWELdWl0an0AMOm
 rRR540o4T8oW3q7Nxth4AWhRV7xq07/Yrw1ClEe2IRRMAn5zG6hgs7xpSBqyTP8BF07t
 98BwBMPIyA9c7gK6ssZSdFJ+XJAa4Pv//ZIC0XkeZQRCkv7G+wy610WlNTlFetLLhQsc
 gxQ6YqE2Q6LbpyAJwNhRJBWsfoJAfQoHxUkE406xNMt2Vxp+SvMziI8uKuVySUJa2NwF
 4eFQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782436987; x=1783041787; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hbsim/OmqBEq5Y5SAScIk83QXaU3bbpggnMY4QgzNag=;
 b=eSh7xQgJdPxOIuUw3pqQ363hMbpDCS6RVPylwTJFDDfvYml8q3W+x5m6+wMuZusugJ
 Y1dwEIL3/IwdwhoopGHpX84R4DtEpi5ty40ZTZ6wGMuILLOQLydpEPLzBLtlO7p2ZM5C
 9kG8rzy5xsVyQ1j80nhWBHanqlBXYiIpt6DSTaLBirrbYg3cJE4d8p1F/GiwqauHOXoB
 wZjm/CoPrRrW386h8UZRBiWRi4+tqt7154zY1tibpBlLSF5sLjnQ8omT+1Nn2cTwTnJc
 Rp75ulykbxU2mGxkiKy+VsusjkExf8ZMX4VzWkTdeU9fBDdvu0+Nk/Z0YButBVR9j2Mn
 +8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782436987; x=1783041787;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hbsim/OmqBEq5Y5SAScIk83QXaU3bbpggnMY4QgzNag=;
 b=pphali3Mi5vUC25NzH5DDDAguIIG+gKcMmqlJeb1bmifgwHCLV8nJRKlLcmul6D2aX
 VmXWOMTi3tiO4VCqR5cr6DDA9/UgXDS9XWHg/ElNc881eqrqP90Fnpflhzh9NpeAem4T
 GBatcErqbkB0MzHy7lQj7gj0zjxHSO/aTdLFKKwQU2w6LEjTGXv7KN3qlewlmDYLj+dC
 d80yJd9Bae+eDn8PfEjVxkugjYOliLqMUIa9prmgRsthbUtL0cFKnEDkRAjzKatqwBYG
 FCmJ/uWbz4t2+dU0vrb5rUIvDebLB6VVcgAlrHh1GtArPmi07rptheqVx1GYpmOw6dRH
 1k5A==
X-Forwarded-Encrypted: i=1;
 AHgh+RqAAkwLqX0A5uy4LaspMC8XgfBJK3qT8pdxmPlLKVfuAS0Q7E4c3SPKlWrOLZtmHPol21S1D0I/7KFx@nongnu.org
X-Gm-Message-State: AOJu0YybKIsDBZS6UyfJn5q7ET0Qhkr/OyP5LYLiojObvubdY2Uq3CY/
 lGz44Yhx1sqhY8K/Gs0VTF8EDEALcM2aEL2yifsIho6qPmNPXz9yyHCvOWth0yDkLrCMa9xsaTJ
 YpGGGEpZzzf1hoJWW+dwBcXJeFtArWwI=
X-Gm-Gg: AfdE7clYtXT7GLpdzihHfTs6RQMtR7LpzqolStgmn3vMRojH1O54yc8a2wwdChBMNEU
 UC/BVpT4IdqVB/hPjhTLJJhe+RnyO/kCnT0h+DUUjYKR3bNa/zFZeAkIe4mMayy9Hi8lztQjw8X
 CsGpHHLRKjksWmJunqyiZm6nvNoR+rPghSkklGNQvW1QHwJjfcZkpZ/SDEeZIGG6JdXe0JLuju7
 paYkTVvVKUQHZ2GwV4RflNB6DwHywk5KaAGiFMhUsDnEodfc6JKkq+e6/GWswJLHoRzvDb4CVux
 m9WDNKeZvuu1mAQJ9uoXaLH0pb7jHX1bRvIa7w==
X-Received: by 2002:a05:6402:5113:b0:697:b86d:809c with SMTP id
 4fb4d7f45d1cf-6981087601fmr881308a12.0.1782436986598; Thu, 25 Jun 2026
 18:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
 <20260624000632.2149359-22-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260624000632.2149359-22-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 Jun 2026 11:22:39 +1000
X-Gm-Features: AVVi8Cc36hGXf6rRr4QhHWxuQuSZNvi_1jwi0t8tXOcN4jkD_eRY4PXMf5yN2CM
Message-ID: <CAKmqyKM651KZ_PAohGaboDQ5tyrN6E=eb+sLQLrQREXv_KWSuA@mail.gmail.com>
Subject: Re: [PATCH v2 21/24] target/riscv/tcg: remove unused
 riscv_cpu_get_geilen()
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com, 
 fritchleybohrer@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52c.google.com
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

On Wed, Jun 24, 2026 at 10:09=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> No one uses it.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h            | 1 -
>  target/riscv/tcg/cpu_helper.c | 9 ---------
>  2 files changed, 10 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d6c5d6c1db..7618110412 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -646,7 +646,6 @@ int riscv_cpu_pending_to_irq(CPURISCVState *env,
>
>
>  bool riscv_cpu_fp_enabled(CPURISCVState *env);
> -uint8_t riscv_cpu_get_geilen(CPURISCVState *env);
>  void riscv_cpu_set_geilen(CPURISCVState *env, uint8_t geilen);
>  bool riscv_cpu_vector_enabled(CPURISCVState *env);
>  void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.=
c
> index 822c9fe483..baf5cace2f 100644
> --- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -526,15 +526,6 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *e=
nv)
>      }
>  }
>
> -uint8_t riscv_cpu_get_geilen(CPURISCVState *env)
> -{
> -    if (!riscv_has_ext(env, RVH)) {
> -        return 0;
> -    }
> -
> -    return env->geilen;
> -}
> -
>  void riscv_cpu_set_geilen(CPURISCVState *env, uint8_t geilen)
>  {
>      if (!riscv_has_ext(env, RVH)) {
> --
> 2.43.0
>
>

