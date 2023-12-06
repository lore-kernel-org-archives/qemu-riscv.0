Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857AEC4167B
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 00:57:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rAgDn-0005j6-JJ; Tue, 05 Dec 2023 19:57:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rAgDm-0005io-RL; Tue, 05 Dec 2023 19:57:02 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rAgDl-0000tw-A2; Tue, 05 Dec 2023 19:57:02 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-548ce39b101so7842752a12.2; 
 Tue, 05 Dec 2023 16:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701824219; x=1702429019; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iOrzd1+wCgODobzsxmtV08tAr43Yb62xMT/P7Tl7mKc=;
 b=ILhhWjqLEG5bEAJ9zYVsgiJCO2q2ALWqINEREL6ukoy/Q5QQ1V5caLDcfOxE8bRQp3
 rAuU1D2LtE/sEVkz+Yv5Kgjsa35B6tSr94azFviBhefKCKV35AeupguJnwLRx3MG3KiH
 1Vr0Fm3iBEoBHHnJ0DIaN20qDp0q4XZ/DZdIkO9sNUEKaj/gDg/zIzsjMpW4vvjL9J5C
 1BCDrXXb6Usns19jpMY5pfVy3r2J0GfLVkohCX8Guj4qB/e2cvs6T+rzSomUY/0AKqXv
 /rjjAuqvZHIihMY4TCB3MxbPJBHv0VbgSaGuCjPyFDpZJvD188JatjuquUMZS8XOZdQn
 fU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701824219; x=1702429019;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iOrzd1+wCgODobzsxmtV08tAr43Yb62xMT/P7Tl7mKc=;
 b=NoKopv3o3/WAz41Jhut/iWOy6kkczEaCTNNetyw8TKyDJAUQgsKpNT8whL3GqGofiC
 GM1Gz1OIk2mAC6iWcykSMbR4I7iJQOhl+xHFljmgHsc0GGT1HwHpB1w+pKUFLpEvDpHD
 CebKMic2ozAJlIipNw4Z2chN7aiHvnKII3J0kr8rBsr+054AB4j1GEX1jyoYMfeuyfs8
 eAqkQX7pqN/uHopY/o0FlLiw+C1Xj7Z0ybsgoq3jxBMKQxhX+J6nON4wMEnbmHpXFAY2
 v0VOSUShCAySTkfzv+tl2R9DELCzKNTXgdUZ0JzxDPy6GKfI/7K/RVgQhhgXUdPIwkM4
 0Gaw==
X-Gm-Message-State: AOJu0YzQZ6miwJReP8lSfPEDF3YsTbtnzrUlh9PyAkiaJxiY0lc2KeIS
 UBSrJrXKT1KThbwZw1hHX3znOO0sYn/DJo4fNHQxh/mBHRmw4A==
X-Google-Smtp-Source: AGHT+IHLoLKB7RwhsoR0UZleUdy51e5/r8CSYwxlL4PAMRJQHBtwprGneuli0mOT/3q04+NQFnAql5Pa/H5WE8FDPh0=
X-Received: by 2002:a05:6402:448b:b0:54d:1d9f:5eb2 with SMTP id
 er11-20020a056402448b00b0054d1d9f5eb2mr54591edb.79.1701824219469; Tue, 05 Dec
 2023 16:56:59 -0800 (PST)
MIME-Version: 1.0
References: <20231123181300.2140622-1-christoph.muellner@vrull.eu>
In-Reply-To: <20231123181300.2140622-1-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Dec 2023 10:56:32 +1000
Message-ID: <CAKmqyKOoH1+Gc7oUw5-fW5wZX3yiQDWs2xoQQDNyci=W=D0MuQ@mail.gmail.com>
Subject: Re: [PATCH v2] linux-user/riscv: Add Zicboz extensions to hwprobe
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x529.google.com
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

On Mon, Nov 27, 2023 at 12:37=E2=80=AFAM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> Upstream Linux recently added RISC-V Zicboz support to the hwprobe API.
> This patch introduces this for QEMU's user space emulator.
>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  linux-user/syscall.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 65ac3ac796..2f9a1c5279 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8799,6 +8799,7 @@ static int do_getdents64(abi_long dirfd, abi_long a=
rg2, abi_long count)
>  #define     RISCV_HWPROBE_EXT_ZBA      (1 << 3)
>  #define     RISCV_HWPROBE_EXT_ZBB      (1 << 4)
>  #define     RISCV_HWPROBE_EXT_ZBS      (1 << 5)
> +#define     RISCV_HWPROBE_EXT_ZICBOZ   (1 << 6)
>
>  #define RISCV_HWPROBE_KEY_CPUPERF_0     5
>  #define     RISCV_HWPROBE_MISALIGNED_UNKNOWN     (0 << 0)
> @@ -8855,6 +8856,8 @@ static void risc_hwprobe_fill_pairs(CPURISCVState *=
env,
>                       RISCV_HWPROBE_EXT_ZBB : 0;
>              value |=3D cfg->ext_zbs ?
>                       RISCV_HWPROBE_EXT_ZBS : 0;
> +            value |=3D cfg->ext_zicboz ?
> +                     RISCV_HWPROBE_EXT_ZICBOZ : 0;
>              __put_user(value, &pair->value);
>              break;
>          case RISCV_HWPROBE_KEY_CPUPERF_0:
> --
> 2.41.0
>
>

