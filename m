Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF87C43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 01:03:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1we0Ow-00042F-Fy; Sun, 28 Jun 2026 21:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1we0Oq-00041i-Rh
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 21:03:02 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1we0Oo-0008SC-Cm
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 21:02:59 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-698587a1335so898833a12.3
 for <qemu-riscv@nongnu.org>; Sun, 28 Jun 2026 18:02:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782694976; cv=none;
 d=google.com; s=arc-20260327;
 b=VRbog0cHIDGWyfL/ShZcOD8bO2u+aVNDOktN3jXAsObHYfybQ6ktYrLaMr8qH9YtEB
 aNKwVvjuYnpxNypWxL3ozAyB6Kam5udNYhjK/5rwD0jS4TT2nE/Iof+rj+Roug3eux1n
 SZjeMuwtwgTwZeGxxL+RG5xqujXFRkKWhXoUhTPxNzrWAZRpJIKMVb8UN71+P4Fd0exN
 /AVNTFsIKrpm7mTqVvH7Cvr+5g4ykK0LgoH5kjiSH5scoj9kP0S3zD90rrVhlnUXtpoP
 jOTTjyihTDfi99lmN5hmLDDz4pB9yMZNsf6UtRqRipxHsRvHI5ENI3xsiCEOb9CO0VW9
 VB9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=HXeThzPRQlbC7Deg8yJSMmt16h9NKwjC+NX4T58zivM=;
 fh=x/5El8S6z9qSPETVrUC1l7Eu3ibYBoLwO5D4JLJdJlE=;
 b=E1NfjGR/XgIlbRMJ81skYbMbYOCl6TWYy3yUZXpiVOLd6mR2UPjGUq37oslvwH1LdG
 MeegbiMtk5NPT6c25/o+ZKK9Y7ityx8tLOVYosMxSnk5SPTVOOpVE2OTqRIxehdN9Q0M
 qW/MTzLtbUTKxZAmU93G8MNR6diixvlXRHqZNVBIa/f6mIJJFVbWi3YsRLqp4J80e58/
 Nbnc4jclUViDucJllza66nHrBZ4rWvQvce/MQQkM/7ko58SKnILO53LDh6VNkof2c5pF
 rvBEMxOXtKz0Pdpac8mz9lb01uDm0txRqaDvuftbVCzIAuTdN35dXsDOijuVla22Q6jc
 O1aw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782694976; x=1783299776; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HXeThzPRQlbC7Deg8yJSMmt16h9NKwjC+NX4T58zivM=;
 b=ovCIR8duAqcsM8dOoRACtOcVn2nmNs5WzfSiS/032o/BOvaZGXiwpjEGNCBW+ZitQk
 bB+AGIgu9lovlndfwmG0DVDldqMeO0a4K8nQWkZnUriOOoKEYBL9VCiFvmnsxhKm932l
 5thPux0azIwQ6WZeF2Xhwmr819qUMp3gPHViv5ZRlpFt/fdNl7UoecVfFpZL3Q8qSQbD
 hirVjN9VOGBOeALFQm+EDyKFSg7emZvNVuAXd8oaL1bpeQBhbr9zoq/Cf1FG7bnoJsd+
 6I7tXrZrFFiamKVXgKid6NM+BXzCMm1jgy1tw4DLqqtT5HiFEiXQ+OOhWmcgH9QzIvO9
 tO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782694976; x=1783299776;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HXeThzPRQlbC7Deg8yJSMmt16h9NKwjC+NX4T58zivM=;
 b=YO3M71o8Iea0NZ59JwvuUvjqsdYK4hvjHP0oGvZMsv9+3pyXSI234CH6ky3eddqSE4
 xoR3gwv721jvlRo5mZ8zDOTElXtvAxocoLiYEu3niff6ff5BomM6e/gZKxiQVgdvFhB4
 uA5XqgzRprn6HOrUdTQlKerfn2Ljq8QoqHJIdjDrUArFCoPt3Ep0c4Djet0VXIKHra2x
 7enIpOk1uYCPCNZb+nbmLzNPURn5Cn5u7mHlO1K2M1M28vsvBvrnRZ/u4jZlT/BFTPsk
 PNkA1T0ToFecih9XeOx86hzAGJyVdKSrvEDAnKkGBkDBnBsOeLGi0I7GqYE90aK9KvIC
 RGKQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr1MiisMCzZ2XgyWRgBfwQ00QaCfwVO+LD6zyQv7p5ayf2DDbmhvIrSwhzeGTc7E1jleTNL0ecLcxbM@nongnu.org
X-Gm-Message-State: AOJu0YzCP6lhkpfZq8o1lrC/cLsUmUfGDjckrEGLcy3Wrow3EPzTFp+m
 kcNZHNiHewdKTkwFVJjb5qXLWKAHpxDil/pjACdhemzGsJ1+sIZZDYWDgfFToVgMij7WeLkJ6vx
 HrNmurQiqoiNORby947NZM5RqkW/eoeI=
X-Gm-Gg: AfdE7cnMG7N42Ji8L/EXymmg2A2iSb4f5yfizm6HEb6a72X4F9l09DfaA4NUDmnbpWB
 9uY/O0eKpXLjN/nhcPyvVoc3a36KVkRma8+OGtM0Qx9C3cNFc8BGXovpCz1+P3fCm+406e3xIM9
 2uxPyjcOUykDvXMqLAB5/lnsV7w43FfVqwZNC1MCKO6INqMtrSkRO33DL/GmIO786Y+BTZyZ3lI
 twLeotrMp7m7bNPJRQyj+hR+XPjxA9Y7kpNJpR0NxVh6OjhAU3qOHfDXjgOuNxTRhClsAnByRqO
 Zycr7w4Q7FAwRopiw/9XM7Auzu8DKIH5Q2tkKg==
X-Received: by 2002:a05:6402:5113:b0:683:e394:cc0c with SMTP id
 4fb4d7f45d1cf-69810a45891mr5285524a12.4.1782694976070; Sun, 28 Jun 2026
 18:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260622113402.563196-1-inochiama@gmail.com>
In-Reply-To: <20260622113402.563196-1-inochiama@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Jun 2026 11:02:29 +1000
X-Gm-Features: AVVi8CeEJ8aKXqngsxtjy74Tpl-17M24re5WU-YMY3sESK03fk-TjPvK7loMl0o
Message-ID: <CAKmqyKOaS3rzSmvM0FPkH8uMV441qxes_5-sbQwc8T5J_jsYjw@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Check PMP before updating PTE
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x531.google.com
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

On Mon, Jun 22, 2026 at 9:35=E2=80=AFPM Inochi Amaoto <inochiama@gmail.com>=
 wrote:
>
> According to the RISC-V spec, the PTE update is a supervisor write
> operations, and it should also follow the CPU PMP configuration like
> the PTE read.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> Changed from v1:
> 1. Separate code statements and declarations.
> ---
>  target/riscv/cpu_helper.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 59edcdd370..2db07f5dfb 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1655,10 +1655,18 @@ static int get_physical_address(CPURISCVState *en=
v, hwaddr *physical,
>
>      /* Page table updates need to be atomic with MTTCG enabled */
>      if (updated_pte !=3D pte && !is_debug) {
> +        int pmp_prot, pmp_ret;
> +
>          if (!adue) {
>              return TRANSLATE_FAIL;
>          }
>
> +        pmp_ret =3D get_physical_address_pmp(env, &pmp_prot, pte_addr,
> +                                           sxlen_bytes, MMU_DATA_STORE, =
PRV_S);
> +        if (pmp_ret !=3D TRANSLATE_SUCCESS) {
> +            return TRANSLATE_PMP_FAIL;
> +        }
> +
>          /*
>           * - if accessed or dirty bits need updating, and the PTE is
>           *   in RAM, then we do so atomically with a compare and swap.
> --
> 2.54.0
>
>

