Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B52CD98C5
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 04:44:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wYzB9-0007JF-Jn; Mon, 15 Jun 2026 00:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wYzB7-0007IW-Dl
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 00:44:05 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wYzAu-0003Xb-3d
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 00:44:04 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-68d23396ed3so4978395a12.1
 for <qemu-riscv@nongnu.org>; Sun, 14 Jun 2026 21:43:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781498626; cv=none;
 d=google.com; s=arc-20240605;
 b=MbqW/55xi7CoDVKucxjknEBKPQ1vsbHfhbxlwMRCuYX7n+wpR19KJdtj4rzahI6bOz
 3Pb7i2x249cNoI/F4mFELckFu7HqHdRXK3qAjiKt+y1yccDRdMZ5Fs/smp0oCZsJkfqr
 1LUgJ8Wi4OomJ8up5bjv5NFLG0gndnZj6JB1G8QtjCU6Pg/Asivik/xGURwxS12rfykU
 RAfMYFWDXxnCWvql2h7XE/SSzULPhftkygmba3YFQ9/ioIvwprni3o8xFq4o1L62h66/
 ZL8yl8pezP4EzHxnXhp4LJlDuQWYpKtwL4BtwcJf4fRgpd91KQt77O8pPsDPZhAEpwSt
 4atg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=DrcGPMbuxyxKnqdIu36LaepVNElvzfbfxu1uxA8QwOA=;
 fh=b43EDbfBicHgMVyb8jAb96E1MZs0RQNSdT6WDntkhlI=;
 b=K2fEFieHrm8NcdRBcWwYIUem6OGM5jV2PnV2A9jvmeTWXNHIA3yv64cWi7PsRS3zgp
 zvvbhozkYt+VP+VPTlLSOmWSo9G1nwiBWU7TbPbD/ffrnr2p1VbNhKFKc4MoONNiyJzD
 Rv+Cl5LQ7aV4ds9A0YAqZHpoXkAzE3cMKPervK9UMLoTS+K+ZNOqzXf+X17+/Azw3lYC
 QZecNcItIko8exaPox1d8d3LLbbluaJpVr/ko7RfNIGP6c9p5QUzg45SviQ1nclB7Z2+
 auo5OSprlykzRoKytiq7qUJ9RVYlNiF3GrY1RVxPpnYhRZJuT+/J+fnxusS9GflPlKOR
 EntA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781498626; x=1782103426; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DrcGPMbuxyxKnqdIu36LaepVNElvzfbfxu1uxA8QwOA=;
 b=C0dp1AXBpdwOFzjp2RymlNnUcFAvU7sFlI6KEtWNm42DDtWwHDr67bXOOmd8ym78jc
 7TU6KPPAFAJKuiuaDxbmHBuHK0k7RBsK+QevGhxsUx5x+tsQbuOgfaCIpdE5yGouURE9
 sSRuY5JolG+LNw8IO3wviQIbRAiwTjxvYfHbNJ7GslVHJlF+osIb4esGwJjcTucZbIfp
 1fb30sWD75Q2S61rWEyCyNpG745KfOFZiJbU1lZ00mr4LNNk55e0IkV+sPAuZA/Y9+ww
 /euQW+J2A6KoU7lYoekini7JeltwabfTLsnnQKBKdfxTA3GjathuULyngnYEBGt2yQQ/
 gSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781498626; x=1782103426;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DrcGPMbuxyxKnqdIu36LaepVNElvzfbfxu1uxA8QwOA=;
 b=oCfXThFoXzAa35KicSbl4VIy88ADfh4GTy+SbXj67alXVwNm4PkXYaUa5dCbOyBD6w
 HIA+ayO2vQDCzuJfS8uhkr5ilrOwmXXctYvqhtx8doNM4mvj9I9JfWN2WZSd7xl5+tOa
 pCx7LnX+hSHkQ/2H9e+JVAxHQuUOk8WpZmQnphJjuPKDgSDKC1aGyn+8NDdBmYhGDB7H
 0ZPtQH96XfTYP/s/ub/gK3yyKuI/y4I+X+Xd7QvOjqVj2pqE9NnHcjIqrAtUuJkz7Gza
 54+iPAcSUbqSXxZaFCrK5Los1/MbPDW9Kqeulk3tJY8dvrTc/m57Th5pHTwP/PpizsTl
 jQzw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/wcyyiIjASsYXEy39Z505g1ydOeo/p1Q5yFp00keIDaGbp0Zq3yZ1vXqCpskTjeODb0zfD+q61Hi0I@nongnu.org
X-Gm-Message-State: AOJu0YxfvLg/cvnXJPyGxr+RA4DRaf7EtY1zO+kORaeTF8SbK/JXQ3+b
 tU97LUswa3BPORihwvm/H7lQ90dWS0Z7PikiyS5X5xAUe9a0Z+MfsiQRExsWiv6yVmkGmImdJxv
 imRXUn0zBHbsb4dGS52XR/ShLwK1/CFg=
X-Gm-Gg: Acq92OHy89kwpD3tqZJs9RLbfTUYRv50HD8FEKuEnJx7Kd1pRQj8fTuL6OqZ3LVuoQt
 HVMv+J2i7xtWdwFAkeKaTzgxxDACprzqo9ViPx8r9HDXD8s438lKFjW2LfYe8KqdxZdLNQEM5ZI
 4U9mv6RnCywzKylZ4Ck0GnpV8BjuJ78WqwrXb+4q8USwzYHQnxMEldBYHTDxF9Rqa/rlFDpqLFg
 zeFy8sNvtYAGXz0hnONYHRepkS6gntmffsOw4793bbaReS2GHQSlopVQXX+yNhMWRqi1Rj5ePnm
 P0ysXD+EmJc+9XwG6sfaY3izCZ6Iqss0j4HxmQ==
X-Received: by 2002:a05:6402:530e:b0:68c:bf82:884c with SMTP id
 4fb4d7f45d1cf-693778c3aeemr5092069a12.6.1781498625959; Sun, 14 Jun 2026
 21:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260603065859.592063-1-joel@jms.id.au>
 <20260603065859.592063-6-joel@jms.id.au>
In-Reply-To: <20260603065859.592063-6-joel@jms.id.au>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Jun 2026 14:43:19 +1000
X-Gm-Features: AVVi8CeZ_RyHdElm9_hhwOfbp0QCgGS0SiTey-Rb_WQqu8aTMJZfv7COEXaI87A
Message-ID: <CAKmqyKMoxRONCgs_ZVPykigCR476ZiHeVJ5ETxWkruq8vPpjJg@mail.gmail.com>
Subject: Re: [PATCH v8 05/12] hw/riscv/aia: Configure stride for the M-mode
 IMSIC
To: Joel Stanley <joel@jms.id.au>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Nicholas Piggin <npiggin@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 Michael Ellerman <mpe@kernel.org>, Joel Stanley <jms@oss.tenstorrent.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x533.google.com
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

On Wed, Jun 3, 2026 at 5:04=E2=80=AFPM Joel Stanley <joel@jms.id.au> wrote:
>
> riscv_create_aia() currently hard-codes the M-IMSIC at one 4 KiB page
> per hart and gives callers no way to widen it.
>
> Add an m_imsic_stride parameter that supplies the per hart byte
> stride directly. The virt machine passes IMSIC_HART_SIZE(0)
> (=3D 4 KiB), preserving its existing compact layout.
>
> The parameter only changes how the slots are spaced, with the rest of
> each slot reserved. This allows future platforms that have different
> layouts to control the stride.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

With a `uint32_t`

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/aia.h  | 1 +
>  hw/riscv/aia.c  | 3 ++-
>  hw/riscv/virt.c | 1 +
>  3 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/aia.h b/hw/riscv/aia.h
> index 5ad0a902be0d..452e78b9d7ad 100644
> --- a/hw/riscv/aia.h
> +++ b/hw/riscv/aia.h
> @@ -14,6 +14,7 @@
>  uint32_t imsic_num_bits(uint32_t count);
>
>  DeviceState *riscv_create_aia(bool msimode, int aia_guests,
> +                             hwaddr m_imsic_stride,
>                               uint16_t num_sources,
>                               const MemMapEntry *aplic_m,
>                               const MemMapEntry *aplic_s,
> diff --git a/hw/riscv/aia.c b/hw/riscv/aia.c
> index 82ea9d48ea75..840f84d26b98 100644
> --- a/hw/riscv/aia.c
> +++ b/hw/riscv/aia.c
> @@ -25,6 +25,7 @@ uint32_t imsic_num_bits(uint32_t count)
>  }
>
>  DeviceState *riscv_create_aia(bool msimode, int aia_guests,
> +                             hwaddr m_imsic_stride,
>                               uint16_t num_sources,
>                               const MemMapEntry *aplic_m,
>                               const MemMapEntry *aplic_s,
> @@ -47,7 +48,7 @@ DeviceState *riscv_create_aia(bool msimode, int aia_gue=
sts,
>              /* Per-socket M-level IMSICs */
>              addr =3D imsic_m->base + socket * (1U << IMSIC_MMIO_GROUP_MI=
N_SHIFT);
>              for (i =3D 0; i < hart_count; i++) {
> -                riscv_imsic_create(addr + i * IMSIC_HART_SIZE(0),
> +                riscv_imsic_create(addr + i * m_imsic_stride,
>                                     base_hartid + i, true, 1,
>                                     num_msis);
>              }
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4cd941a6aac6..529bb2fc0132 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1549,6 +1549,7 @@ static void virt_machine_init(MachineState *machine=
)
>          } else {
>              s->irqchip[i] =3D riscv_create_aia(s->aia_type =3D=3D VIRT_A=
IA_TYPE_APLIC_IMSIC,
>                                               s->aia_guests,
> +                                             IMSIC_HART_SIZE(0),
>                                               s->num_sources,
>                                               &s->memmap[VIRT_APLIC_M],
>                                               &s->memmap[VIRT_APLIC_S],
> --
> 2.47.3
>
>

