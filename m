Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73247CCF2DA
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Oct 2026 09:49:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xIjzL-0004SI-JC; Mon, 19 Oct 2026 05:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIjzJ-0004R8-6e
 for qemu-riscv@nongnu.org; Mon, 19 Oct 2026 05:49:01 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIjzH-00059M-Ns
 for qemu-riscv@nongnu.org; Mon, 19 Oct 2026 05:49:00 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-8b0f59a5fdeso11646447b3.1
 for <qemu-riscv@nongnu.org>; Mon, 19 Oct 2026 02:48:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792403338; cv=none;
 d=google.com; s=arc-20260327;
 b=VI1844XP2kmvJ3LQj85BGippccu15r5cV1Q08cVhBU3zibx5LGVfrw8UWGVpF3MLIZ
 re+eo2FVl4XJPkdCozJg9aAVktefegZQIOr/erhO09K7Z9DTZYpNM4h1zJoDLt6lkm2E
 E2M4YkygoMYue4dtU0plEj92KbSIgLGB+I0IUYqdWorgqg1XESC6wC8H81ApDRS2HBRm
 iwStqN0gSv/73H0siEr0UROzhOMcTEXGwvMfg7A+LBiX9naGEKLWhaq8ycdIXXAUeSm6
 xwsJJCpnSImuHaqtJ4PJMlj3vqrbqWT/3ceElQek1lrM1lmbxR9UzONBu0ldjsBXa3NA
 cgLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=VpazGT/H0cNlBGgBGm0mofOQrsYsp4CwtARvM4aII+Y=;
 fh=hnVpQO+uDAGX9svCHE2uAwXH9hflWFtgBPrvOU3grc0=;
 b=OuuuGQsAToHQWT5boMQtNORpvTwbXAIXQBazDk/4Nw4+SI5EGBEHyKe1S0o74bVnrp
 gIPw+vc0YyeYP5avBmmBL0B+NqKOKbvuJdjZyI1PEZ+ndiYiPe5xcpYsLjJu118iGNIg
 6GoZzcauROyoWcDabOAAD8EFnIUOYrp426Dfc5eRKKAgYFg3CaFUhGRUwKcbsdbHNeo4
 i/LBlVIuCWL9O9rMJ5pzbeJPBqr5pK/EyxrSXbJRdEWs3qtyCA0qo71RRnD4eE6nZSpm
 NtAXQmK69Jwf4gWA/JpIEO8q1lIM/OXVyU6OCtszRfi99SnLHjvN3uigAVqzq2OCYIcS
 +xJg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792403338; x=1793008138; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VpazGT/H0cNlBGgBGm0mofOQrsYsp4CwtARvM4aII+Y=;
 b=jzka2MbN67RQe6Q3sw0f1EMQtds+8Ia+Gu8iBN4gcc/fi6nZsW/QANyutlkvRrFXzh
 35Dh3Qc1TEYJOqEMecwyNElMyg9bmNewlEWYAP7PN+mo3g7G7rV8pVmtGv1R/pT0DmAr
 /m9I749Ku4bI/xGZPtAeBneQN1aiwrZmB+PrjLaKSPwLXU4HuKvLgXuIkOBqeA+UGdgV
 2/gJ53FYRCF0DsnCOpfLqLGmjFqLKprYr0RROqu4AOaJ6dGw3oXN2brsq7EwHpmwRyrZ
 TWsEPoY7dPVZaL/goEBSzyvxEf/td3DshJYpbEU6Mm7Mh0BHKO+VAsAGk4K/8nNOrEaE
 f+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792403338; x=1793008138;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VpazGT/H0cNlBGgBGm0mofOQrsYsp4CwtARvM4aII+Y=;
 b=lA5/2EYHFkJtElzF/H8yxIBhn2H7lIk/taVbBq614hOcwFRDk/DITG3HCktUFVfqcH
 ORdI4H7tiWQBLYejgr4SaaKx3ypf0G7PehSIm6nkn+cI1YANai3KtFDbabe3LwzP50bE
 oGHEfK40Dh9Gc36y7/WvIzn4CuUx0Qm1sEUI+MebFhLn/IhcZ6a3QxSgnRnB6fva1e09
 l4WbPkMMVtw61zR3Iho2v2naIhKEqnFAvKhZEaHvg18Bn9gTjZB+c2MdhbpFGUpcCdGT
 p/CcxKf1UqiPU8dVJR/HjZmpMKPBWMWTSomJudFskszp7AGGe0l+RWdYQg+ycC1te9C3
 AxiA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxDP0gpV16RrCRKYig2ZzSiyGMpkqJedqcHOyEAksV3X+tTYhjg3FOMrVtDVI6raSmY/tqKBi9A0PT1@nongnu.org
X-Gm-Message-State: AFq9FYKFTG1v5MW+5gsZss/kKPiagEBcCUpZG4nOUe1YLbUF6sLfuSU/
 wBmWf5UoJJiBtKED4wXeAwwyI5pJ/nbRrpc5Jce1BJZCZWkTkEVtNTsN0MGcn5rBcBAtaErLs8V
 t5l5YL3t/4BRBP3GPXqKEaFj4Ox+juOaKsU2eMsi7PBJNdPuJmhIozAsLDA==
X-Gm-Gg: AYBFou2u/yBUXDdcoWx+FpDuAFEieKkPixyv10LP0L59git8lZGSN7N1v/d9cjxXFzP
 mOdsE6OdvcAn6jqNpqHfoxMe3YDAv5DqMSazTOzC1pAhzSf+njJ5JSkgtevUfBr+60x/2JNg6Oh
 MlTC/QqNbnjJlZcsr/aR7AcGOJd1b4tX1HGdpxTeHeIQY6+d7xzdGWMLko1to6T8gHEGq+lGA1y
 VpqryR97eVA+FFsqsVlAIhDrPknU31Ogyut7pPy0dggCJqlO5izm9uXinjO7uaUQhiLmTyn8BZL
 OH4Jz2YdvJWYqg9+uVCzd58W1NPvp74+k5B/q0hOuh0EV6QrzPucp72zMfNTekfvB816x2IHO+M
 LTy40GprzWJfLzxyye3HnNcWznJqomIonCjqGEBI=
X-Received: by 2002:a05:690c:e3ef:b0:8b0:ad5b:d487 with SMTP id
 00721157ae682-8b0f2065a34mr28644737b3.2.1792403338459; Mon, 19 Oct 2026
 02:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20261018230741.6560-1-philmd@oss.qualcomm.com>
 <8360ad12-6dab-44e6-a930-17ed8e92a09b@oss.qualcomm.com>
In-Reply-To: <8360ad12-6dab-44e6-a930-17ed8e92a09b@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Oct 2026 10:48:47 +0100
X-Gm-Features: AclHuK-coNXjJOiyeIIN5PLDBbZToILIcDSjk6lnon2bFaxl5z1EVFGcfdu7qyY
Message-ID: <CAFEAcA8thrNkzvR_UVnfYUjaSNiaax6Xupw=DsBapHDyPbpdEg@mail.gmail.com>
Subject: Re: [PATCH] docs: Remove stale chapter on RISC-V 'Z' CPU properties
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, devel@lists.libvirt.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 19 Oct 2026 at 10:42, Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
>
>
> On 10/18/2026 8:07 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > RISC-V 'Z' CPU properties were removed in commit 455c0fa9eef,
> > for the release v10.1.0. Remove the stale comment.
>
> I wasn't aware that we need to remove stuff from deprecated.rst after
> awhile.  Thanks for taking care of it!

We are supposed to move the section from deprecated.rst to
removed.rst (adjusting it as necessary) when the feature moves
from "deprecated" to "actually removed". We didn't do that in
455c0fa9eef, so we should do that here, rather than just deleting
the section.

> >   docs/about/deprecated.rst | 24 ------------------------
> >   1 file changed, 24 deletions(-)

Alistair, could you unqueue this, please, as it doesn't update
removed.rst ?

thanks
-- PMM

