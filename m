Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00150C83F17
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 10:04:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ubcVl-0006dA-1W; Tue, 15 Jul 2025 06:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1ubcVd-0006bg-Ox
 for qemu-riscv@nongnu.org; Tue, 15 Jul 2025 06:03:37 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1ubcVb-0001WH-T4
 for qemu-riscv@nongnu.org; Tue, 15 Jul 2025 06:03:37 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-558fa0b2c99so4365919e87.2
 for <qemu-riscv@nongnu.org>; Tue, 15 Jul 2025 03:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1752573812; x=1753178612; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2xjQmuDCGdjXJTbqeZ26m4iepUkkU+JnpxrcriQakXM=;
 b=NJ6g7mldkYIiTbFvnfcxxExdGHdtxDcAeH4NoouJj9mc17G7BDW44Ke/c5dQpnNXA1
 Lb1i1Wiofpv7Kp2krk7eknlzKZLUha3AfilyrlZlQ0nbXdy6syBldysv7K95GwnWMk3c
 Ft/P+EMX+402a7+jrrnF7453SclbbwAr3zUmeKQrPCo1+uvEAOnmp/owUZMRpsJ3WBX5
 qdldf7wUhIZqe68BymtkqjPGCZ9tqkKdIMz0KLLxU7MtcSp+fnLUibYDgH8Im7padF7O
 VeoeMHP6cO4mu/bYR34Ftpidz1b9QLsTDE4Cmf99KTJYwnEMzkKOtRD9wrtmaUSYS/DZ
 u09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752573812; x=1753178612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2xjQmuDCGdjXJTbqeZ26m4iepUkkU+JnpxrcriQakXM=;
 b=slPH2p64jb7g3/xHbg21Mjpjrf23uvopjebMhQOruEye63h4axZlXCcxXeq9lUn8c8
 1vU41VuHdzktX2qBsT8H4RQ0+zEAvFy0TSNxXa1nMsrpvl+iKSUgFwHJWJxUDGfbjhIX
 nFHt9WMeIfFpz9w3dVBmFoomQI7Q1w5f/wkoqPedmtW+lLnfGxZ4XYIkX543knTeR4Ke
 6NkWc9CZOnjbUhlTMi/O1m0HbilsijUtNiDOMv9Mt1+yviEl1n0IJgjA+svJibHYHw7R
 pcV/3dEgsRGXlRYMPrKOpVMz4Ic8IbCDacKG9AJdaqIFqj/N7alQmsV7xgML5EbBOBWN
 A1+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxGFAcsZOv0uIe3WoIiAnucGxfJO3r4nYDJ2tCQE57narIA1jXPppfyc//C5nXbeymxr+PeKIIrk5G@nongnu.org
X-Gm-Message-State: AOJu0YzB3u3sjWD6hlK81a4/kLF/bbNm0i06AKCxaqdAhDLkWQ3fIayL
 5O3L3TMIrxBko1XIAhbwYJ7qhiZWBUKjtT3stGL5ExDDN3nsbvluEhkvOtkde0yqVYEIpyZ5pC9
 ZJZSPPPqbjXOkbMEX76SbM7Vo3XrBZdkxDfTuzUmeBg==
X-Gm-Gg: ASbGncuuYqMge8+D0SSuPvoeGFWMmsGM5hwlgwj0Z5hi0x9nz2EZScPIfC3/4d7uwzs
 h0oAWV/asN8BnlrhoTsTG5acDP/9iiPvzY/Qb5JldGa8nyGTpshTukevWOatfusDnCUPtpI1Cor
 zLnbDsN3gtpR9C7Q2b7ltgt07tdDQ+Te3KFXrfv821AGgJcn9L1GPM0Ufx5qzqbrd7jSbCbPqiH
 oi9U9s/
X-Google-Smtp-Source: AGHT+IFXLT/YIZudceKXxU577T8aQrk7qew1ipDBKwaHY1bg2iIe0I8LJJDGnk5r+vfLTBC7YsxthAc0xYjwcoLNxS0=
X-Received: by 2002:a05:6512:b9b:b0:553:2c92:fdcb with SMTP id
 2adb3069b0e04-55a057c3c43mr4851000e87.3.1752573812309; Tue, 15 Jul 2025
 03:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250708060720.7030-1-luxu.kernel@bytedance.com>
In-Reply-To: <20250708060720.7030-1-luxu.kernel@bytedance.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 15 Jul 2025 15:33:21 +0530
X-Gm-Features: Ac12FXxx34DKhRmAxeDmKtKcGhnGF01dAkjBDQu1R7v66kLO01ZB-2f8U4Xrw30
Message-ID: <CAK9=C2VzaAyNS8fLNJS8wMF=wxRtWBX1_G1xw9=WPnPVYG99eA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix exception type when VU accesses
 supervisor CSRs
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=apatel@ventanamicro.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Jul 8, 2025 at 11:37=E2=80=AFAM Xu Lu <luxu.kernel@bytedance.com> w=
rote:
>
> When supervisor CSRs are accessed from VU-mode, a virtual instruction
> exception should be raised instead of an illegal instruction.
>
> Fixes: c1fbcecb3a (target/riscv: Fix csr number based privilege checking)
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>

LGTM.

Reviewed-by: Anup Patel <apatel@ventanamicro.com>

Regards,
Anup

> ---
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 8631be97c5..9bebfae3f0 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -5577,7 +5577,7 @@ static inline RISCVException riscv_csrrw_check(CPUR=
ISCVState *env,
>
>      csr_priv =3D get_field(csrno, 0x300);
>      if (!env->debugger && (effective_priv < csr_priv)) {
> -        if (csr_priv =3D=3D (PRV_S + 1) && env->virt_enabled) {
> +        if (csr_priv <=3D (PRV_S + 1) && env->virt_enabled) {
>              return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>          }
>          return RISCV_EXCP_ILLEGAL_INST;
> --
> 2.20.1
>

