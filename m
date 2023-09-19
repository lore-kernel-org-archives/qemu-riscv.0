Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CAACD3439
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 04:42:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiSYo-0005YG-Q8; Tue, 19 Sep 2023 00:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qiSYm-0005XS-Mx; Tue, 19 Sep 2023 00:42:04 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qiSYl-0005DE-4Z; Tue, 19 Sep 2023 00:42:04 -0400
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-7aae07e7ba4so553066241.1; 
 Mon, 18 Sep 2023 21:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695098521; x=1695703321; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Jkh/jxI207IruDLy0l89BgaKzfqaABRl2qi3uRTet8=;
 b=Ksbg1IJidOm/joDu7Ku8bQ5kgsFLm2YucaQ15jUTF8EvZrOeyCFsEZmVDA+xCxH/d0
 YBf/mmjdauabcsZFxiDRUiUu62X5t2thYOM4AWBXOj5OcDp6FHKXG8GNN4hdUNQ50rfB
 wKlG+zwLbZ9/9hMQlH+OPhHp1QVSYh5SDJQ0r8OWWJ3bWd5oOkYHmTmRp8ldW1+HfpAR
 yW1qo3uNnaFFvS/pKDUUIIYDn0sAD3e7nTv4LzF/Op3C1ttRpBIOG2TRsKkcuUQ8cxfm
 zT2enWZ1Ahek+0V5v71X/3dq2NyixlMw6oi3hiIVRbCuoawhi4zbTA/jqEN90SYyOQ8b
 x5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695098521; x=1695703321;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Jkh/jxI207IruDLy0l89BgaKzfqaABRl2qi3uRTet8=;
 b=YNcVMbp17OENlozImLprzG+iPjj9EO2sNMeNkwYyBNyHSFnZo4AX/1pb6/3YpU4cas
 +Hxy5wt134br3zse0zWQ495y9Lun3hVk4Dug2nfZfjSeStF5ggVsG4Sgwfmc3xbBBI9p
 aK9XXwnEcgBthrmy6LohS9Q3sd55afJusGNk+KMUWWeKZbmHwIdJW4tYUTasOjijb3Tl
 sR/zoaDgaLYfYr6BsvkYhyZ4VKgc3ZGavI/7gCjitQUoooSB9QIsN2b4f8c/WXOdORMT
 zc1mTNyvfh3ocEFubxFJCJ90xVj9mwN+YaV/oHJseFFBhBU8hdzb/XeRJ9oquKGmi1Nf
 MEoA==
X-Gm-Message-State: AOJu0YxmhspC9sWsmfOeu4uYfyjvOOCn0zvFHRceCIU/c7Y3iDkIG4A9
 FiIHGtT/6PrfpjaI/fmoIcWmO2qVxR/FnfN14FA=
X-Google-Smtp-Source: AGHT+IGanukbeV5m45G89vcP7L7W1QpWJGT1ypWKujFP1DZTZjn4yW6+3FmNGyD2PisqCajiJzGet7aQdo06bCXhYXs=
X-Received: by 2002:a05:6102:6695:b0:452:6693:e014 with SMTP id
 gw21-20020a056102669500b004526693e014mr4690897vsb.28.1695098521625; Mon, 18
 Sep 2023 21:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230915083047.4067186-1-alvinga@andestech.com>
In-Reply-To: <20230915083047.4067186-1-alvinga@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Sep 2023 14:41:35 +1000
Message-ID: <CAKmqyKNxZbN7Sg9V90gX6O9fU7KcmfwRnbOj+dONHJ_-iBZQVg@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: update checks on writing pmpcfg for
 Smepmp to version 1.0
To: Alvin Chang <alvinga@andestech.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alistair.francis@wdc.com, 
 ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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

On Fri, Sep 15, 2023 at 6:32=E2=80=AFPM Alvin Chang <alvinga@andestech.com>=
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
> Changes from v2: Adopt switch case ranges and numerical order.
>
> Changes from v1: Convert ePMP over to Smepmp.

Did this part get lost?

Alistair

>
>  target/riscv/pmp.c | 40 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 32 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index a08cd95658..b144932b3b 100644
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
> +                 * ePMP spec.
> +                 */
> +                const uint8_t epmp_operation =3D
> +                    ((val & PMP_LOCK) >> 4) | ((val & PMP_READ) << 2) |
> +                    (val & PMP_WRITE) | ((val & PMP_EXEC) >> 2);
> +
> +                switch (epmp_operation) {
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

