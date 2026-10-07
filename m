Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C96ACA5FF1
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 11:51:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEQBK-0007v6-AO; Wed, 07 Oct 2026 07:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xEQBJ-0007un-BO
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 07:51:33 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xEQBH-0007pA-8r
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 07:51:33 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6afafc89b48so2666377a12.2
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 04:51:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791373890; cv=none;
 d=google.com; s=arc-20260327;
 b=aY6FyiAlSeD6/CeuPdu3d2/+AeJ4RPaa1syuzWNsymVLSVWSnHqzqDpdYlXDljXKVT
 GxM89/JyyQswghYvycGvvES4qhXmDhZuldWDl8NANRXFL1I1BSWAbdy8KNRhUMWeDFF/
 8uIIt0HmS7yWTDL9lRep8QzsvasftQafb0JEgMwSthCOPLtqeIKEmvkctcPQJf6DBT0E
 X3fB4sI0AeZdyUHMMiRzlil1wWXn84FYWUpoiHkWOTwTWGQoTageFZGbN1rnh4p5A4Vu
 Gr4bf1Fgu/dfjkCk1wVaD8vpHjSqtX4OgHgIjhCaXVV8r0f5VMVnBmpweZTny7nvWCB/
 EI7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=oXR07ZM9OgEvwdfpKcUZs8ZfL7H2QkPzD6gX3qOBON4=;
 fh=KOiau5oxuF8nbLJU9AO8ZNIlgNAGb+tcSj+vCvNVksg=;
 b=d6QMkgbz6UzTA+YCVkDyVZh1ajXfsyTft4aiqpYrVVSJsh9bF8FBMc1YmY8IIhA0MC
 qdyFQM6tRGV1CAkx/xjTosN6UxEtZH2DrVQYqSig+2YC57Q1VcEm/Wev94PDK7SaCCb6
 3Xb/becknnNmeRn6mRUIFU6r3dgQ0dNDJjNvHOMxrF/mrfJwzq2h3DyAMuyqAuEmE9Ey
 9/TCZs/WyZCiCwWCczN+21byodJjpTFQfOxH8u/5fYVBljFjmsPZm7auOR2WBZ18E5+y
 UEB3CJf0YCt86XdNcnQkAVty6qs3w/ImyPORbeDdSO1MzM+lcEdRmociVGaDMeOOPaAD
 R9PQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791373890; x=1791978690; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=oXR07ZM9OgEvwdfpKcUZs8ZfL7H2QkPzD6gX3qOBON4=;
 b=J0G61YZwUz1JYaJhTGPW2Ap33uZtOsW0CXF3MPWeRC5zHV9I3VzZntrXBKmFzBTw/D
 hg1d4tKCKuKk0AYiF9CHHJ7lyXmrnhd5j7fLXf/qVkC/WyGRavv81c6+dPOb6RCEm4Uc
 p5/XSVMKIOfjM9uLOA4Or4mN0La+c8vvUMXpuPd13TQpibZ182PBoLLOnmUN2LvB0Ych
 xh/KHUbVj69chsuP/WyDRfOHArYd8O7KaLe4BAfVpe0v3BdFlYGp9LVVigKOR9NcvKE8
 XK/lcRvKcKRE/zoTUlO4MRy1w8yVn4fQaQXhjvd+FSYIf63m4l9VZo2THOye2Jrl0Chb
 txQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791373890; x=1791978690;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=oXR07ZM9OgEvwdfpKcUZs8ZfL7H2QkPzD6gX3qOBON4=;
 b=2MTHdxemkjYrSU2Cq2u63oGJox44lVRWy1cctNyzHbcTtfE+M7vyjF9jB/mOvRFoZm
 cPL3v78h1uzijMD4WFHgc6K0S1FO+2QOcfgopsZcwNCtOMlEp6Qdz+kEhmD9MSlk1qTP
 ktfISZaXqrIJ2RQVJZ9RS6hwRva7H+cgVDye2DRfafT7CtTdzJ3rYEGlhLd/UZNSPZoi
 Uf1weX9MSAQjR7m//9Zb8uHAboI/Mc1e2XN7beN+Nd3tAX2saDGOJeXS/nx1uLVyWV0Z
 kyq37AHhMjL14hhrTZGbj2BCGn8AtOIkHTYrCiH2ku29aCh915CDxnYPaGJS20tAzIdd
 HjVQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw8Y74J0Yh3AYHYNxLcYbqVU7zI0Md9EtJO2Mnn2NCNfaGruu9l3Qg39Ec2GK5QGNsePr388IFM5WB8@nongnu.org
X-Gm-Message-State: AFq9FYKL9YzDf0uGdETTLOfuN4E4HQB1OXOmDc522/9mOg0vjF/hiyUX
 1I8qaQbj/+1aN9z76obtq4knYxxPpGRrx3JZGOL70XlPIrvPiiVVONCf4tInuv8pRp0fXNQU6hc
 KsOcjN93wysfgSlWhwPoAo2NvaCX0Lxg=
X-Gm-Gg: AYBFou1toM7CTOx6yNyDyJc/d7fDz945GVEh2xpx49KXKxgAc2yFcbG/g7B8DDoKXN/
 kW3tQi6JF50mTxVgiHuJD9gUbe6XZOeHPa+6xk/2Som0lh4XxnAQ6v1aiFEefMSX5QrvH9wjfyn
 6KeUW709zJ3DHqyoQwEtTzsZ62e2MLL0L/1OX22PgS76BgMd2mU3/OhvtBlaofg6Sz5JYGcpqOW
 R9xPLQnFOFwarA5z/qgEtXgbExm+zm9e6x0IXF7DkX6ZqwuOmIg5MmYwaRca7WbsUuGSB5ISKGW
 j9mGPc94j9m218PjJG4HjYUcWizFIrnlgkL/Jj5oKNZfOBX/tuApqAo=
X-Received: by 2002:a05:6402:a255:20b0:6aa:f1d2:ddb5 with SMTP id
 4fb4d7f45d1cf-6aff442c2abmr1530347a12.31.1791373888306; Wed, 07 Oct 2026
 04:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <20261007-rv-dedup-v2-0-8a2f0f296a7f@rev.ng>
 <20261007-rv-dedup-v2-14-8a2f0f296a7f@rev.ng>
 <17cb7c7c-5f22-4a03-8855-4d1ec91d347a@oss.qualcomm.com>
In-Reply-To: <17cb7c7c-5f22-4a03-8855-4d1ec91d347a@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Wed, 7 Oct 2026 19:51:13 +0800
X-Gm-Features: AclHuK-Ah-giB4sLe0vH8O3RGeeOC7vhSqJMmJDFAl454lDn7GVLWvg40Qa5H1k
Message-ID: <CAE2XoE9eXXKQGZZ0kvmex88+tjch1-+H_-MgB6JEu+4bdPZq8g@mail.gmail.com>
Subject: Re: [PATCH v2 14/18] target/riscv: Compile pmp.c once
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 daniel.barboza@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Oct 7, 2026 at 6:25=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 7/10/26 10:43, Anton Johansson wrote:
> > Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> > Signed-off-by: Anton Johansson <anjo@rev.ng>
> > ---
> >   target/riscv/tcg/pmp.c       | 5 +++--
> >   target/riscv/tcg/meson.build | 2 +-
> >   2 files changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
> > index 99345d63dc..2d7194de10 100644
> > --- a/target/riscv/tcg/pmp.c
> > +++ b/target/riscv/tcg/pmp.c
> > @@ -638,19 +638,20 @@ uint64_t pmpaddr_csr_read(CPURISCVState *env, uin=
t32_t addr_index)
> >       if (addr_index < pmp_regions) {
> >           val =3D env->pmp_state.pmp[addr_index].addr_reg;
> >           int g =3D pmp_get_granularity_g(env);
> > +        const unsigned long_bits =3D target_long_bits();
>
> We need to fetch this information from @env. Maybe riscv_cpu_mxl_bits()?

discussed before, there is possible be 128bits

> >           switch (pmp_get_a_field(env->pmp_state.pmp[addr_index].cfg_re=
g)) {
> >           case PMP_AMATCH_OFF:
> >               /* fallthrough */
> >           case PMP_AMATCH_TOR:
> >               /* Bit [g-1:0] read all zero */
> > -            if (g >=3D 1 && g < TARGET_LONG_BITS) {
> > +            if (g >=3D 1 && g < long_bits) {
> >                   uint64_t granule =3D 1ULL << g;
> >                   val =3D ROUND_DOWN(val, granule);
> >               }
> >               break;
> >           case PMP_AMATCH_NAPOT:
> >               /* Bit [g-2:0] read all one */
> > -            if (g >=3D 2 && g < TARGET_LONG_BITS) {
> > +            if (g >=3D 2 && g < long_bits) {
> >                   val =3D deposit64(val, 0, g - 1, -1ULL);
> >               }
> >               break;
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

