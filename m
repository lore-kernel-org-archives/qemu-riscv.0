Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933FFCDB46F
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 04:14:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbW2k-0002tb-U6; Mon, 22 Jun 2026 00:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbW1r-0002mk-1H
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 00:13:13 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbW1o-0000Ax-MZ
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 00:12:58 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6977c0814d1so2292166a12.2
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 21:12:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782101575; cv=none;
 d=google.com; s=arc-20240605;
 b=COCZOORq0fv5MVed9P68+S1Ss8cP2vEX6tsKHZH5tUP8V8WxKYlivpmzZilRKa/Bqo
 VNEfhpVGQJPCa2MedRMmpA6wzHXhFxORPf/C8oU84+taY2ndFeIPTNXoSs1S8FE3Lw7G
 GF0EONCMEx7bzc7rzJ1OvHlPbYXgTAIEIuTPsLJK7DgQSol8PNT/B0tEdGuMWR3VSFUG
 zlDDFQjmGP4YU/ATmzRNEsdql8vW11nnHmE3l1zT8bUaKdBIU5T57A62rb6utrKiUERd
 X+9Zaic+qVqo/aIF1UABSxK1rv6h4EEbr8RmnSucm2sJNk4QatCwEv73isOCaNngAZQL
 le7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Qq/odUaXMxUN5BrCm8twid2sdR2qQJq9NaeYdQt/Gd4=;
 fh=Cd3VdkviCstS6CPGHqPrrjFrqf00wC9OWR/4Ai2YMQk=;
 b=BvI7unXvw2FlIxxF9rsOENvBE7+W/W7p66YCcbdC8nqzR++VNzlKDRaYEkDZNxPzqo
 GZse3RYavmqtdo3UNs4EuRoo6oDHyteOzrzcdsn8jY9/v7lcISAc4xOaqhMBUOVisK49
 u6kjdwMThe/xu0QcztmanxMMqcxcorGaAGG2DLNlgTMlL2xB/6fWgniqbHQnONnNoDs8
 eq+m1axk9+R2JN5wFXmhBsnwzd1cabsiQ/tRqWT+UT9MCuYJn8q/szuvc1uYDGXur370
 qeKfExoXGS41YgjxdsDDzivEeD9ED/P8LlTkdc0Ofk6ltgPkJKLF1/iwj0LVybu3PSuK
 7mtg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782101575; x=1782706375; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qq/odUaXMxUN5BrCm8twid2sdR2qQJq9NaeYdQt/Gd4=;
 b=bMCZPLpMB4BQUR9gjGLNUcFojO/d69xH40pbrwZzGHcJnItP80ZVL7ATxwm4D1vjfB
 3ZpuE9eYCXD7L4wMocLDIcGLzvuyQ1ZJ0kmqy9Jm3EHH8KFjV1C/8kPm0oIy1Z1t3lme
 7TcT00mMp/pEm+XGxk+wVtjzVWaeP5dVmyikthqBbLhpMfoj7Q/xtwHK9IulziBkQYCB
 MQxSeN9ICvu5VE6uwWcAsDhrqtyrE6DxJdB9nD593wRBcsNy7ftr8iV13ez6QO2Ixq6S
 sDq97iq0rF/Ni2KMfPzDOGltONaVP4rjvVBxftVwZhOZTJam4lLIFy7qQDmSFKGLZO+j
 m8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782101575; x=1782706375;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Qq/odUaXMxUN5BrCm8twid2sdR2qQJq9NaeYdQt/Gd4=;
 b=kVENYNN+B0p72uxVPBH4Tyxp85+7/2/Opq+AJKwb+0oIKAl5zrmZ6bz9dvA0LbBbKm
 pRHBtWO9TwhuBH2MPk8F//uezLBCkjAZ3HINpOSI7soNg964zhOv7gYqVGLcVTqOgYSY
 ByFsl0EBCkVsqsZBZijotge/B8crxMNvKiRWceMpLCxDJojEqeIsmRm2lQVOYb0FEQrL
 eqh18l0gETo2Ro3wKcv+TB6cKycqkeFOW4Qa4uFPbQyiKY/hGWIDZ4Z9rd/VFk2iAMBa
 7P5jHX0IlOiEzYJZlBLuopndj93cSBK+CBVeOcjjMLnwLjlXQrMMQ+QyoOiISJ5z3m62
 T79A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/I8mwlomWPH0PAV+HVwQCaLP/OyOiwwWlr6PDS0wCsjbMjjOt/oQBXMXZDgZVauSfuyYH48mE618q1@nongnu.org
X-Gm-Message-State: AOJu0YxzSgRI8XQFd3KDQERw6UPzz67+HAUMwwZQZcMqMWU0DMIpSPlR
 GR6+AywQzArDMXn6SoyKBtDR+KOcvksmR5dxK6816OExKah/p1TkVfWUS1rCwctLhJ0lgPvVRVx
 mkeS8h78q669rqMXk+6joFyM3IKDtqg4=
X-Gm-Gg: AfdE7ck8eg2w7afOEnUFM2k2q2wMJ7LxbbT6Ye3SNasDAY1N57tXl3uQzd6N8PJ786s
 M8C9FqdZHTWg1nL4VoTBxhylel8/5OPaFn2qWmDoqlykmH7LW+/2ybRMr6Y6ipB78ZVPRd4vOKB
 H1XeY6ax/jiLAWX43WpWs5u996+VrVOTkd6lWafQnHf1gEup6NUJhSMAShlVBxXpi2HUNJJnutP
 ImAAS7JHGOTE4YyEP2rN7U695pUwG/W/ztQq0XqvnZB2/u4pa8RXJBz5I4hqYjV2k1InSxm6qK/
 xpTOp2tEVm960BMWBHUr0PU40rk=
X-Received: by 2002:a05:6402:2812:b0:697:818a:2109 with SMTP id
 4fb4d7f45d1cf-697818a3199mr2674909a12.27.1782101575063; Sun, 21 Jun 2026
 21:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260511083105.641907-1-inochiama@gmail.com>
In-Reply-To: <20260511083105.641907-1-inochiama@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jun 2026 14:12:28 +1000
X-Gm-Features: AVVi8Cf0RYAV3dgqvATNtpo5eO721X7_VxzcOinjPvxyLwtnZFKOQGm3eebRad0
Message-ID: <CAKmqyKO=bNBy447j_nxBLG+djeVGUKRfEmNmvS1T5nX2UgC4DQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Check PMP before updating PTE
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
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52a.google.com
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

On Mon, May 11, 2026 at 10:55=E2=80=AFPM Inochi Amaoto <inochiama@gmail.com=
> wrote:
>
> According to the RISC-V spec, the PTE update is a supervisor write
> operations, and it should also follow the CPU PMP configuration like
> the PTE read.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Logic looks good

> ---
>  target/riscv/cpu_helper.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 39c3486ae0..6edce36138 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1604,6 +1604,14 @@ static int get_physical_address(CPURISCVState *env=
, hwaddr *physical,
>              return TRANSLATE_FAIL;
>          }
>
> +        int pmp_prot;
> +        int pmp_ret =3D get_physical_address_pmp(env, &pmp_prot, pte_add=
r,
> +                                               sxlen_bytes,
> +                                               MMU_DATA_STORE, PRV_S);

Please don't mix code statements and declarations inside a block:
https://qemu-project.gitlab.io/qemu/devel/style.html#declarations

./scripts/checkpatch.pl should catch these type of errors

Alistair

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

