Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB70C4167B
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 03:39:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rAike-0006cL-Cf; Tue, 05 Dec 2023 22:39:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rAika-0006bx-0q; Tue, 05 Dec 2023 22:39:04 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rAikY-0000NY-DO; Tue, 05 Dec 2023 22:39:03 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-54cb4fa667bso3906939a12.3; 
 Tue, 05 Dec 2023 19:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701833940; x=1702438740; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OLp5AGIqfRNPjvzsvUQwknLb6hSSPAKtwZW1BRi1ko8=;
 b=lQV9Dfh2qgTH5DJNZpuudsBktFowhltCePIdfEiBOhaCTYoQG+OrrClRQw5S0VYH2M
 AR8z2VxkL6yrr3xkdFjgBqiHxxw1ValpRiL0cel1gJAwkr+bZ0oqQjbbAL9h9008QOrm
 Q0QrZZ5FHi4QZ+7l3Bm6nPIjzy6ZUnCqoVS+BUYMgnWrfxef6rR/30PvWfKn3kTkbxWt
 C1RqmEv6x3QB+tYpeD6pBP8nAZa5d5UI1wHOmlWM36wGNUreiQBE9weobszlpjqz8Zk4
 +HvqlmHu+cJzbv1rqGp/UkKpeb9vb7BA1Kp+urJVzuOrq0LpNY+JVkx1RvCDIXvebd+e
 uuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701833940; x=1702438740;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OLp5AGIqfRNPjvzsvUQwknLb6hSSPAKtwZW1BRi1ko8=;
 b=eHtbSPnw3fLGEa5li3eLiCk32CueCppi/JhxtULvOPMsWxzRM2MeiSxlkQXFxTkS6O
 kuuoby7os3LbT2H3pc0kVNJHTDRgCU+BpOwi3AqJVbKyPd1LJ5iGnyALcPK8kqVHEGeT
 2NvDgF/dolzlzDYPoP6cuKfNwdmAL2c9+YcMK+uVuAQyEDabn8nVoUsA1qMTH/9mddrS
 nx7OKqz7ycmsvbXgIwRrhV+jKx8P3+77EcElXgCxS1YCb8WOQzbRyNsZ9TCYBVAZcX1/
 L+e9uWUTIvo/ug+gh0GGT+q5rYgoUKJ8NJF/E/njW7w4amEO+Dq2iLE9W6DWdFtZuRFX
 KHnw==
X-Gm-Message-State: AOJu0YxCDKhJR9zrte+BgyqY7nhP2MHHut6Ci9clBGpXQ5ZQP92u2f+H
 CljYOM26Xp3QpBjaVCssrwSSsjPOvPphKzGWCID81jUbtkHZ9EW0
X-Google-Smtp-Source: AGHT+IE2l89bpmHWuNJf1Zr6lGdHffeUaMYc9to6TsWLgfEGDHB8zFdzZPt6je2+T+R+003zvWE12ds/m7HZdpo+iGM=
X-Received: by 2002:a50:d501:0:b0:54c:ac4d:f4b7 with SMTP id
 u1-20020a50d501000000b0054cac4df4b7mr190943edi.1.1701833939678; Tue, 05 Dec
 2023 19:38:59 -0800 (PST)
MIME-Version: 1.0
References: <20231114022254.294711-1-alvinga@andestech.com>
In-Reply-To: <20231114022254.294711-1-alvinga@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Dec 2023 13:38:32 +1000
Message-ID: <CAKmqyKPqUD1j+p3E31Rdo4aDF_gBfJb2QmCJBGsjHqQViEOxTQ@mail.gmail.com>
Subject: Re: [PATCH v5] target/riscv: update checks on writing pmpcfg for
 Smepmp to version 1.0
To: Alvin Chang <alvinga@andestech.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alistair.francis@wdc.com, 
 liweiwei@iscas.ac.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Nov 14, 2023 at 12:24=E2=80=AFPM Alvin Chang via <qemu-devel@nongnu=
.org> wrote:
>
> Current checks on writing pmpcfg for Smepmp follows Smepmp version
> 0.9.1. However, Smepmp specification has already been ratified, and
> there are some differences between version 0.9.1 and 1.0. In this
> commit we update the checks of writing pmpcfg to follow Smepmp version
> 1.0.
>
> When mseccfg.MML is set, the constraints to modify PMP rules are:
> 1. Locked rules cannot be removed or modified until a PMP reset, unless
>    mseccfg.RLB is set.
> 2. From Smepmp specification version 1.0, chapter 2 section 4b:
>    Adding a rule with executable privileges that either is M-mode-only
>    or a locked Shared-Region is not possible and such pmpcfg writes are
>    ignored, leaving pmpcfg unchanged.
>
> The commit transfers the value of pmpcfg into the index of the Smepmp
> truth table, and checks the rules by aforementioned specification
> changes.
>
> Signed-off-by: Alvin Chang <alvinga@andestech.com>
> ---
> Changes from v4: Rebase on master.
>
> Changes from v3: Modify "epmp_operation" to "smepmp_operation".
>
> Changes from v2: Adopt switch case ranges and numerical order.
>
> Changes from v1: Convert ePMP over to Smepmp.
>
>  target/riscv/pmp.c | 40 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 32 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 162e88a90a..4069514069 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -102,16 +102,40 @@ static bool pmp_write_cfg(CPURISCVState *env, uint3=
2_t pmp_index, uint8_t val)
>                  locked =3D false;
>              }
>
> -            /* mseccfg.MML is set */
> -            if (MSECCFG_MML_ISSET(env)) {
> -                /* not adding execute bit */
> -                if ((val & PMP_LOCK) !=3D 0 && (val & PMP_EXEC) !=3D PMP=
_EXEC) {
> +            /*
> +             * mseccfg.MML is set. Locked rules cannot be removed or mod=
ified
> +             * until a PMP reset. Besides, from Smepmp specification ver=
sion 1.0
> +             * , chapter 2 section 4b says:
> +             * Adding a rule with executable privileges that either is
> +             * M-mode-only or a locked Shared-Region is not possible and=
 such
> +             * pmpcfg writes are ignored, leaving pmpcfg unchanged.
> +             */
> +            if (MSECCFG_MML_ISSET(env) && !pmp_is_locked(env, pmp_index)=
) {

This is tricky and took me a while to get my head around.

From what I can tell, there is a bug in the spec.

The spec specifically states that:

"""
The meaning of pmpcfg.L changes: Instead of marking a rule as locked
and enforced in all modes, it
now marks a rule as M-mode-only when set and S/U-mode-only when unset.
"""

So the check for !pmp_is_locked() sounds correct.

But then they add:

"""
The formerly reserved encoding of pmpcfg.RW=3D01, and the encoding
pmpcfg.LRWX=3D1111, now encode a Shared-Region.
"""

Which contradicts what they just said.

I *think* we want to ignore the locked bit here. We don't actually
care if it's already set, instead we care if the region is an M-mode
only region from the 2.1 table

I think the best bet here is to create a helper function that takes a
pmpcfg value and returns if it is M-mode only. Then we should check if
the current pmp_index is M-mode only OR if we are adding one and then
reject that.

Does that make sense?

Alistair

> +                /*
> +                 * Convert the PMP permissions to match the truth table =
in the
> +                 * Smepmp spec.
> +                 */
> +                const uint8_t smepmp_operation =3D
> +                    ((val & PMP_LOCK) >> 4) | ((val & PMP_READ) << 2) |
> +                    (val & PMP_WRITE) | ((val & PMP_EXEC) >> 2);
> +
> +                switch (smepmp_operation) {
> +                case 0 ... 8:
>                      locked =3D false;
> -                }
> -                /* shared region and not adding X bit */
> -                if ((val & PMP_LOCK) !=3D PMP_LOCK &&
> -                    (val & 0x7) !=3D (PMP_WRITE | PMP_EXEC)) {
> +                    break;
> +                case 9 ... 11:
> +                    break;
> +                case 12:
> +                    locked =3D false;
> +                    break;
> +                case 13:
> +                    break;
> +                case 14:
> +                case 15:
>                      locked =3D false;
> +                    break;
> +                default:
> +                    g_assert_not_reached();
>                  }
>              }
>          } else {
> --
> 2.34.1
>
>

