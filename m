Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13C0CE7A91
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 01:53:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkamF-00029g-Vd; Sun, 24 Sep 2023 21:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkamF-00029O-0g; Sun, 24 Sep 2023 21:52:47 -0400
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkamD-0007ZA-BN; Sun, 24 Sep 2023 21:52:46 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-49966c6fafbso1845195e0c.0; 
 Sun, 24 Sep 2023 18:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695606764; x=1696211564; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dJGg5UmtZbMsIymT2oHjzGkP39vIjSHXvlqhvQiZqi4=;
 b=clUWke0WN4BsyUkT2HipyNN1wmXb/1pPBwkPa+YWxTi6I9MhOKRbJUQET6xfNQzaoV
 d2MpYI6KGCVX0XOU4Ws0B+7V4cCWqEy4tZk6UpFPLedTnRFlMeFhuwODQVzmbVrYU4ON
 KHyV8cpAy9CypvcDaYujUWWgoZrr9VLq2xrtQcvXEWzGl5uA6AlyY/leGoeINKiwZLNZ
 H4WyIEcAM30ag07Y2/nYpzqGZL76POkTaWrPoOiGRGucmspUnSSrgGTSETXwGY9u4l4q
 J2zwQJnVJYWmzPpWnUckPI2VkR1hUapdg9WHUAua5XKzVMWz3Pxnt8cZsoz58CA1EPtk
 ETTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695606764; x=1696211564;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dJGg5UmtZbMsIymT2oHjzGkP39vIjSHXvlqhvQiZqi4=;
 b=Lfxe21ghYp+tB49qJ05JI3Ob6VOj8wLSa7YiZ1qOwquEOn5lkcgpmyvjgBcWOnkkgs
 6BNml4vuHOBsFCHquXMvqiNZ2jUs/WUPNQpnjS1nxk7v0OV+H1tXlFRNMArkFR3SpaxT
 yFTKv0BJm4RYJVBs2RdDOa1Nptz90EpSx85Ary9HGLKuRIW1LMtcNGLWkQ8j++ncfQpK
 SuGBmkKeTJuoez2CAmKostqGSWvQw8FQEuJHXuhYtd0aoPe5VdoOAXBgFG2w4aWCuOa7
 SZX3Q1ty24v0bGocDRee5/GgKyjS6PPeD6/62ZBPiSIlrS2+P7edwKzJUo+xhmUTeUzE
 /5mg==
X-Gm-Message-State: AOJu0Yz2eTiQfpon6oCi8tz76e3sjXBu6jrWso2YS8M/SLSSR2w31KDb
 l7UIrkInCatCbMCFJrkwn666jEUICc7m8B1527RJ/yuTnL9Vrg==
X-Google-Smtp-Source: AGHT+IGM4Tkk1vFM6tLhfGqxJ8Cj1dBuXqQFkgb8tiMrkcCpbL3pgwgYzxWIpL4SijKgNUgqEOhNCq7rCFrZlVTf/lk=
X-Received: by 2002:a05:6122:45a7:b0:49a:1a56:945c with SMTP id
 de39-20020a05612245a700b0049a1a56945cmr1213210vkb.13.1695606764070; Sun, 24
 Sep 2023 18:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230924161044.1859672-1-alvinga@andestech.com>
In-Reply-To: <20230924161044.1859672-1-alvinga@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Sep 2023 11:52:17 +1000
Message-ID: <CAKmqyKOKc7OPOpmcn2x20QfGApuOd1t5NypwbJZ7E0kY30CRsQ@mail.gmail.com>
Subject: Re: [PATCH v4] target/riscv: update checks on writing pmpcfg for
 Smepmp to version 1.0
To: Alvin Chang <alvinga@andestech.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alistair.francis@wdc.com, 
 ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2f.google.com
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

On Mon, Sep 25, 2023 at 2:11=E2=80=AFAM Alvin Chang <alvinga@andestech.com>=
 wrote:
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
> Changes from v3: Modify "epmp_operation" to "smepmp_operation".

This has the same issue as all the previous versions.

QEMU is currently not shipping with Smepmp support. So updating some
of the code to support Smepmp is confusing.

As I pointed out for the v3, we currently only support ePMP 0.9.3. So
that is what the code must work with.

In order for this change to go in, we also need to upgrade QEMU to
support Smepmp 1.0.

This patch is an attempt to do that:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg967676.html

You basically need to combine the changes from
https://www.mail-archive.com/qemu-devel@nongnu.org/msg967676.html into
this patch. So there is a single patch that updates to Smepmp.

Alistair

>
> Changes from v2: Adopt switch case ranges and numerical order.
>
> Changes from v1: Convert ePMP over to Smepmp.
>
>  target/riscv/pmp.c | 40 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 32 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index a08cd95658..2ebf18c941 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -99,16 +99,40 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_=
t pmp_index, uint8_t val)
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

