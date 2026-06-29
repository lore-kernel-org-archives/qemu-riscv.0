Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941E5C43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 00:45:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1we081-00005M-Qn; Sun, 28 Jun 2026 20:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1we07y-0008Q1-DH
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 20:45:34 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1we07v-0002mz-T5
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 20:45:33 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6980ae819f4so5325122a12.0
 for <qemu-riscv@nongnu.org>; Sun, 28 Jun 2026 17:45:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782693930; cv=none;
 d=google.com; s=arc-20260327;
 b=e2Cw0kymJodH69NrzZKuYNnZKQjeRLLrvoSJqIv70nXuPdy10KCMsdNMnux/ovZf1u
 jsUhqsH+QqDz85XDKqRDaYo4aYF2IQHlWmhmCUVgPEHXzsnn0r3RTaxPYVI04g0x0NTU
 M11kQky9kXj30gpb6OKSt6rS4k+GHlIijOMtAD6Wda56sl986kSTBJOSLz982hG+lqR2
 0j+9/fEXaMi2QmRKlz1lz4GAgne7iEAOLFZfdingbZX9SQ4xEmbtrk22wAZlj8AZVa7X
 xybmZp5L1Y39smLNvm15C7ecgdIqUDgk1DdcS0NdkrEwTemynAQZ/vsmZgwOAQpkBigF
 qDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=9PvtYFFZJ7TZzvr6qKGt7pVoyHPxrrOdOwouQD7sQfE=;
 fh=7z6ecQ+Ko67LKNUunfYE18KqVeFaoB8/HW9xWfmWzzw=;
 b=ctfNYA7r65mKI7EYyawQJkiA3lM9jYxd8SI6vBt8qrV9OMB7XZAhLKP/NoH59jRcjI
 T7CfZhp8r9SDBnn9xO9nc1SFvzHzz3MH1Bex3rADaKfcwn9QVpsCwmG5SD22m4UYEQea
 e3ESHIokI4d7NalpB1LrTpzZUWC1TVK7+GI23EzTPaKCo/WgwHDgymbykjIlt9iiBOhz
 8FRv9b1zNmX+US4huyulD3Bj/X2rwuYZwyCeQXAlrzIkrRNbOtV7klm2H5d6/dptu90S
 3E21MqYHoLQqPOWrRoOi5ArzJJLywtzr6uiOPSogRIZepZJ0DBYCwwyf5qFuI4GctpIO
 b5mw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782693930; x=1783298730; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9PvtYFFZJ7TZzvr6qKGt7pVoyHPxrrOdOwouQD7sQfE=;
 b=s8C9eOBv5LE3Zg2BlEWQ5Cv+6E3hD2zRP4nyx0/vkD7eSMXRLy6G0XtMnEOmxZDpNp
 rzzRXtOq+Hju2GNiB120r2fXzJzcPYyLK2s+mu5LSQNtfeoa0IXB2tKCyVArrpB2MGiy
 yNRPerKMFE1/xHQtJ7T0YvswKCy14pbmr63U7XKvAhItGbavCyU+UWLZ9xuZQkHjDP9l
 zkw9X1ceFKYxbp6+6uvRczStcVBgeUZBMyukqGOAz8Wudvji2WzTKuhRayXOA3C0NNKx
 ukgTZ1B4AgvoZJsKT9Aq+vjc/dWua8Mfvm51H4IDh6i4simId+u9Z2eK0iPrPwQPaIwl
 oLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782693930; x=1783298730;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9PvtYFFZJ7TZzvr6qKGt7pVoyHPxrrOdOwouQD7sQfE=;
 b=IRnkPlZHx5iTSfsMqCZ3ij1zkZ22juFsglgHZ4TMy66c0kgXCL0FaYICybvKkwuxDT
 bQCU4e/UlYtRI66PifbbkoKugwapdGJzLpinLcV9RetdRO42cwkeLmLq/U+/g2koAsNx
 2ZMU0DAJ/l8uqjgLuGte9EETnAPW4L8vzKHuw38alsa399uglMAgwtIxsIWlyINZCYh9
 Zcm1gO0POZoNhGniFUF+WYB0XbLxHpRtA/jcDJ9GMah+NSgUnPKfa8kKZe4bWzGW49fm
 1igm8w6SXN/IkWCCgbDZHngEwbH3PBLYf/3he124dgTPrtcpYQDIkKDzklx39fv340jc
 O+MA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rov4ObgMHK/USty81LNcHWyvXy+t1RnPD2gANb9hZGBD+npDrFi7jeD6tJKBq8xDhpb1+7T/XorlJxk@nongnu.org
X-Gm-Message-State: AOJu0YwO8Y4APBswtP8QzSYsNjmyrDxzplHkT+aMnWFShpTAaJZXBC+g
 XGFCZAMI6LIbfS5UVIRwj5M0HRywdZNqF78WVYhCtHtslgRHGmTloJ8T2YhYjQTjtKzzDS4FfYL
 9txNayF1Tf1VrytcicuS7bu3znxJEYUhG1R9V
X-Gm-Gg: AfdE7cmXiJ6AZ9XdGRPzOe/hf3AxbByvy0yoa2XImdg0xfZZUzgytQOF+73iWnjjZhi
 jpQiCs2m03+ReUzg9cCu8rEtCWl8Krf/ioL8g9PRnAcHadhq1J7H6HW5uDVAc9W5Umkd7Vwd25m
 Y9WcxU+BZxp3MH/EOkkRP16f4DDzHcDB2pXNWeBzbgADhgrFUK/D/0NVkpbQFfhw+r7ZpekJBPY
 w50hAGCYQCiF/KYLYIHtcHeDSYsS+u/lWvXysIhTCKKGsEEUBIrmRmKBZwX7RIIBqORWkeCIYEp
 JcNx8Fki0QytpqkJRKlkdqfshFQ=
X-Received: by 2002:aa7:dcd1:0:b0:698:480d:1ccd with SMTP id
 4fb4d7f45d1cf-698480d1e29mr1633142a12.6.1782693929784; Sun, 28 Jun 2026
 17:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260626220529.3800372-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260626220529.3800372-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Jun 2026 10:45:01 +1000
X-Gm-Features: AVVi8CeK33fi4LGq-6JDCV8EHmP463bXr9PZkII2lVhbwIjmi8eDk03zAVG8zBk
Message-ID: <CAKmqyKMHzdZc14UwLoQ2pxJS+u3_-1XGPbB+ygct_5Pd9MMT3A@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/riscv-iommu.c: fix MSI MRIF interrupt-pending
 offset
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Sat, Jun 27, 2026 at 8:06=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> We're doing a wrong shift when calculating the offset for the
> interrupt-pending bits, off by one right shift order.
>
> This went undercover for awhile because the calculation works for
> interrupt entities 1 to 63.  The math goes wrong when using interrupt
> entities 64 or greater.
>
> Instead of fixing the issue and running we're also adding some notes
> on where this calc comes from.
>
> Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3561
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/riscv-iommu.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index 3ea9130860..792729cfd5 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -686,7 +686,26 @@ static MemTxResult riscv_iommu_msi_write(RISCVIOMMUS=
tate *s,
>
>      /* MRIF pending bit address */
>      addr =3D get_field(pte[0], RISCV_IOMMU_MSI_PTE_MRIF_ADDR) << 9;
> -    addr =3D addr | ((data & 0x7c0) >> 3);
> +    /*
> +     * AIA spec section "Format of a memory-resident interrupt file":
> +     * address offset 0x000 contains interrupt-pending bits for
> +     * identities 1-63, offfset 0x010 for identities 64-127, and
> +     * so it goes up to 0x1F0 for identities 1984-2047.
> +     *
> +     * Hence each batch of identities advances offset by 16 (0x010)
> +     * for every interrupt-pending bits.  This means that doing
> +     * (data & 0x7c0) will filter out the first 6 bits, then
> +     * a >> 2 will turn the result in the 0x10 steps we need.
> +     *
> +     * E.g:
> +     *
> +     * - (1-63 & 0x7c0) =3D 0, 0 >> 2 =3D 0, offset 0x000
> +     * - (64-127 & 0x7c0) =3D 64, 64 >> 2 =3D 16, offset 0x010
> +     * - (128-191 & 0x7c0) =3D 128, 128 >> 2 =3D 32, offset 0x020
> +     *
> +     * and so on.
> +     */
> +    addr =3D addr | ((data & 0x7c0) >> 2);
>
>      trace_riscv_iommu_msi(s->parent_obj.id, PCI_BUS_NUM(ctx->devid),
>                            PCI_SLOT(ctx->devid), PCI_FUNC(ctx->devid),
> --
> 2.43.0
>
>

