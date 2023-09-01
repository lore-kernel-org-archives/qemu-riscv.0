Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B96CA0FE1
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 02:29:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbtuD-0003et-3E; Thu, 31 Aug 2023 22:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qbtu6-0003dB-CT; Thu, 31 Aug 2023 22:28:58 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qbtu2-0002TB-MF; Thu, 31 Aug 2023 22:28:56 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-44d38d91885so737589137.1; 
 Thu, 31 Aug 2023 19:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693535333; x=1694140133; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BcwEfdfaKAzY1q71GpFY8RoOlX2asnxOyf6/1C1zFPM=;
 b=k7NGAl1rsebCJPBoiKOB16Ktoiy8+t3i5CysFW2iZtgBeNmUIeB/RReTJc6mCmWfE5
 PwTq/+Kz9zmEHf0Om6OcR0Llq3fA2llxy8dV/UAsq0QZAWZFh2bkChSjeAjN2+k4JK4T
 9OqWlj4TZ9ES1E3UYhpw+0e2bvqL1MJ/ROFcPNrCVE0+6qeVDlc+QkBxe+0O8L4/GAfl
 5Ha9J9hmCN0oxn8QAS4ErcqY7EngmHtm31muM7fynPKm6QIIDe350v3c5g7gjSm83OpF
 Cypd7i+/uGZVWMex691WMgN9tCGopcEsu51UeSHQaqI68In6dIDQIZHxDiLOtivtQFX0
 K02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693535333; x=1694140133;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BcwEfdfaKAzY1q71GpFY8RoOlX2asnxOyf6/1C1zFPM=;
 b=TP/LroyB9fi/kVGxn1TJjCM5BLEjcU+bhWrSNIaXOUmnbtor/jkGHO9+eykpQDp+E7
 L4ssFUEHhUvCt7vu8GSnb2Jlms6gqBtJSOFccrHXel9lR+3HXYQRb5zaBIzdfsi1fRRg
 sNpdZTSz4oCcqCiiXUnMYAlTiwj+B4joqbFlZDRRCM7GezyhH08YDCbQInQRJez1vaan
 mQSciv7wuRIYmcD5eSEr5SaX2HdvNxXS5TtD6v9jrCMuqF01znojNzg6idOm5wNMBRZF
 tFknt6UVQN3blyX39ci8PkbRefa6WWzx1Uk4Y8pSPfZYXWYf3FUrWrQuCI8XwyET7BsM
 8Ozg==
X-Gm-Message-State: AOJu0YwvND6FqLacFQHLZdETeRFgNC8ZOa00Zr2t0ISGKE+5iM47vWgw
 1Lq23c3FtusyONGr2RrCz9Z3Uw0qVdJsyGjVBHWEHbRtM4IX8A==
X-Google-Smtp-Source: AGHT+IFAEtJWFzJMfYBO4jPbb5BVF4ee6UIGRDHruBT17H145OdgxB4iFY4i+2tkFP6lf3d/vdLYhuI+IZfSn3WwmPE=
X-Received: by 2002:a67:e8cc:0:b0:44e:a216:59a6 with SMTP id
 y12-20020a67e8cc000000b0044ea21659a6mr1713042vsn.4.1693535333300; Thu, 31 Aug
 2023 19:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <bc82203b72d7efb30f1b4a8f9eb3d94699799dc8.camel@rivosinc.com>
In-Reply-To: <bc82203b72d7efb30f1b4a8f9eb3d94699799dc8.camel@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 1 Sep 2023 12:28:26 +1000
Message-ID: <CAKmqyKPQN_xNV1sXV=nenQXPzWViUjq9DC-hD52J+GRYjv1CeA@mail.gmail.com>
Subject: Re: [PATCH] linux-user/riscv: Add new extensions to hwprobe
To: Robbin Ehn <rehn@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
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

On Tue, Aug 29, 2023 at 12:58=E2=80=AFAM Robbin Ehn <rehn@rivosinc.com> wro=
te:
>
> This patch adds the new extensions in
> linux 6.5 to the hwprobe syscall.
>
> And fixes RVC check to OR with correct value.
> The previous variable contains 0 therefore it
> did work.
>
> Signed-off-by: Robbin Ehn <rehn@rivosinc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  linux-user/syscall.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 9353268cc1..c46a0b1493 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -9049,6 +9049,10 @@ static int do_getdents64(abi_long dirfd, abi_long =
arg2, abi_long count)
>  #define RISCV_HWPROBE_KEY_IMA_EXT_0     4
>  #define     RISCV_HWPROBE_IMA_FD       (1 << 0)
>  #define     RISCV_HWPROBE_IMA_C        (1 << 1)
> +#define     RISCV_HWPROBE_IMA_V        (1 << 2)
> +#define     RISCV_HWPROBE_EXT_ZBA      (1 << 3)
> +#define     RISCV_HWPROBE_EXT_ZBB      (1 << 4)
> +#define     RISCV_HWPROBE_EXT_ZBS      (1 << 5)
>
>  #define RISCV_HWPROBE_KEY_CPUPERF_0     5
>  #define     RISCV_HWPROBE_MISALIGNED_UNKNOWN     (0 << 0)
> @@ -9096,7 +9100,15 @@ static void risc_hwprobe_fill_pairs(CPURISCVState =
*env,
>                      riscv_has_ext(env, RVD) ?
>                      RISCV_HWPROBE_IMA_FD : 0;
>              value |=3D riscv_has_ext(env, RVC) ?
> -                     RISCV_HWPROBE_IMA_C : pair->value;
> +                     RISCV_HWPROBE_IMA_C : 0;
> +            value |=3D riscv_has_ext(env, RVV) ?
> +                     RISCV_HWPROBE_IMA_V : 0;
> +            value |=3D cfg->ext_zba ?
> +                     RISCV_HWPROBE_EXT_ZBA : 0;
> +            value |=3D cfg->ext_zbb ?
> +                     RISCV_HWPROBE_EXT_ZBB : 0;
> +            value |=3D cfg->ext_zbs ?
> +                     RISCV_HWPROBE_EXT_ZBS : 0;
>              __put_user(value, &pair->value);
>              break;
>          case RISCV_HWPROBE_KEY_CPUPERF_0:
> --
> 2.39.2
>
>

