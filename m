Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FFAC43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 01:00:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1we0Ly-0003KO-1t; Sun, 28 Jun 2026 21:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1we0Lv-0003GN-9q
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 20:59:59 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1we0Lt-0007aq-Ol
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 20:59:59 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-69531108f25so5291742a12.2
 for <qemu-riscv@nongnu.org>; Sun, 28 Jun 2026 17:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782694796; cv=none;
 d=google.com; s=arc-20260327;
 b=mPLKJjdFywrGnDQNDYlQ6UDBkWe3ESJLELbQw6yQrzLoVELGheV5xSoupiNe7Skofc
 d/D1Ybk8xFCyDJ2BDUpGMcdWR7tfjunOKtCeKxDZhNeYHPpm3zoGCM2x6iB89MhcqeTu
 2vLR89t451dHDnsPzIQo5JZAzvX2utdcXHNuGi9ZWAv/Ly4BEWgjU5jjIxEHCi94yY7O
 ToCitsq4GczBSliD96PMMDvxvUwqz7nLnT+VHc3pabZSOhg9vZjCq2fAdBXFf/zEXTbs
 9OjOTJGILRTa9PWPXM8WkWqnWt1b+iezdVhNbViNcZgkz5Wsb9jDwV7+WY0sWTqPASIc
 9aRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=fswDypsmaUpnX9gRc/EeXf+M7ydl21C44MDky4xyUmg=;
 fh=9SBQ2xWcPE44cfrHajCGB3EFNYXQ5vo111zlUjLqJMg=;
 b=VORW06haBxnltsW1tTzhyMzxifcgh+XmW04mOIlbVCo6ibA2SVXrxv2ul8nDHFGFMb
 CLI2GEV5AT+Mj5Ydwuo0q2OcN7LgIPyhC2WbJ1x3b9m68TbXzzcjjlYjDVoQ+BSp94YC
 qKYhJq8mkRZIqu4S3sbjOBvkbnoRGUNrltwlI75vmc8B1ZJqIDz17PFpVyN8Mkx95wwZ
 PAPCpU+hTv2QjgDBmyeXcE4OWivbI8foQ7+0eAAAipn4H06vi12m6+4pWqGeuA6lxLaK
 wGt5rIBE5hOimx/u0A1VSeGJAQ7aSTnFaEG5DSCxBQmKKpiI83lgRgKpA8enZjxkRst2
 kp0Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782694796; x=1783299596; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fswDypsmaUpnX9gRc/EeXf+M7ydl21C44MDky4xyUmg=;
 b=hYeK7/oQKfARluNyF/34WM1MqXQf3YG/VEaifsSUy+Cbd5yO/kYeXDx6lBmrdpHeJW
 KCoYOhqQUs9yTTuAKf8bO9RVMHFCHAvJDxw/SxKw3smktwS34V3NPn5i8Cn+SFBUA9JQ
 +6M0A8I4s3786xx4auUDavRWLAX13vGz4rhXVmDgseOzUWCSS6fFGOW9kOVdNerVv0rg
 iN9fMbPETHZKbWaQM6lPK+UBDFHt0MMrL34UMZ+ZE4mV3JkBPuNO0vfa1BPS5h0ucgN2
 jyIRqEya/Zx16z3aILE4QdA3v4CugaF8csg2dHjytvHDml5bO5Uaoq3bu6tX9ekoXQfn
 ba1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782694796; x=1783299596;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fswDypsmaUpnX9gRc/EeXf+M7ydl21C44MDky4xyUmg=;
 b=HavsuUS7wgsHD9kykleZxxlbwVlT0Msl6KLl1zZ38FX8/SRRZo8GIo6bPecfQuJmOi
 +FUbYMe183yu909ngomI9TJ3k9HwjuKUaqI8Yp0baVcLlCXYDVxy75EjUB9Q3IYJprF3
 nnfSheKQZZffTvxEnZKmuxwUvmmtbTqxMMlZ065as/Q/40RibBwu6Kyo6F/Vkks5YMBE
 2ywrqFHLJM6w/PKjiD3vW1pESRowpWOHBWFHg7euD3El7x1aVtRJ8s7HL5MFxkmFNtvS
 dB49ooCEoHcVtN0by/6giRLaZaOLDN7tOrZfoFy5dfrbl64cfgqDsW2d/Hpp7myuqFgh
 VFfA==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro5xK0Jc4PYn1STfPap12qaKGehVGqYvg4VXyWCRJemdD4uJeelOVTfmyk0QPon0DX6CZGekeEE4mup@nongnu.org
X-Gm-Message-State: AOJu0YxJgCpxkCkZV7dm09naOSbG//20jV+CRfUNeataq6Xnq5hRCX7p
 56sM1Toqa2ImLiMH8GsplriB64l/+NnuFJ8/VD5UHXLo6b+LIDN+2KQLxUit72sud9obnC9sTAR
 X1pzvuRQPPad0lMnRV1S2vSDTpZucmik=
X-Gm-Gg: AfdE7cmKDhNR7o/DPYJ2cqJIWVp3EvLzgkyGf+9qZYDgvPBUiyXKt7UiFa3xp9QyJxs
 qEigfykRUTQOIKlKdZemKyCCBCLNuoI+Ov6ugcUC2hI9YquuawYdlL50DZFqa6JPcu5GpPpPUOP
 PYpA+pFHAbyYbyaQGNUNPo6FrCg0pofOeeb6OAmOUQquh7+MiRNODDmCZaTJbw0XW+GrLWnfHcg
 9y38jeV0YNcrU/Lx3CVZIRvnYzk30NVNSTWZAGOEDw5Bea9ZFInz7fvsb//PrZYsqP9Qf1Wwsv0
 lAfC/iGjBG8lc04wQFESsC7/9qQ=
X-Received: by 2002:a05:6402:50cf:b0:698:4992:77e7 with SMTP id
 4fb4d7f45d1cf-69849927b2cmr2218816a12.7.1782694796102; Sun, 28 Jun 2026
 17:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260622113402.563196-1-inochiama@gmail.com>
In-Reply-To: <20260622113402.563196-1-inochiama@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Jun 2026 10:59:29 +1000
X-Gm-Features: AVVi8CcKB09sM2BM5GrxtazdBYawgGxN3XAGf7XXJD18gpx0MXGH2S3RDNdmr0Q
Message-ID: <CAKmqyKMpOiAuYm04BPGsMrfUd5y=kn-eJxQKds0gd+55yV5g7w@mail.gmail.com>
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
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x532.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

