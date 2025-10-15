Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8107ACCD184
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 02:24:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v8rBs-00050I-3A; Tue, 14 Oct 2025 22:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8rBp-0004zU-PW
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 22:24:33 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8rBg-0003ty-Fi
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 22:24:33 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-63babfdb52cso4469835a12.3
 for <qemu-riscv@nongnu.org>; Tue, 14 Oct 2025 19:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760495061; x=1761099861; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gp13dvcQhfwF/JKqdDmmqKB5Yail0lrxLkSvJtcQlUI=;
 b=IMMuAeFC/vd0XLoNyRvEVote0Myqz1toRsKmB3Kwl/NNxca0jOue/bOwOzVJUBLPUs
 gTp/0Qeit2wAx2qdDhoFhWoVhHhSvIUzh2d8YnxuHXKUCjw8ne6ABbkDUdBGG1XXrkCe
 P4Cr9TyrVUZzN+dwL3AMPhnP+hDPNqHHZMsbEqc2NcqGL6/kkCOsAKnuo/F9XtB1HEBU
 3NisEgEBFuQwXY1iVjyP12bjWxlohTkgvrwAsSdwy9pmonUXA8NECyLWT5x71ldcaT+M
 byFhQcuhB/XsNQRtHOamG5S7B2sX3PIxlF3Gwalkv3pdippyKrNujoYoHaJLwY3+Mx80
 qiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760495061; x=1761099861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gp13dvcQhfwF/JKqdDmmqKB5Yail0lrxLkSvJtcQlUI=;
 b=F1OLXU5s+3D1B52LlcmtU4CTL0tkg61j8CPFCzqdX3pogTOAkdCwqqW94HU+sWiIyd
 6aEHOqKL35YvwFeJBAtvISx7pivuf3ZX8KwuBgVzKFJppZd2JPVZQcjf5ZPngnW2tgNM
 ZMhn3zxToe7Xydi9i3dnq2VzvDOkLBNS5XYSqkEqzpGY1gUIpE+lPqJf+UgBzdeTkLOq
 gDd51GR+AIrVylX+BCgerMEL8m/Mc+lixKEBBjInjTAeFyhQqyY9WW4nBPNfyNku2Ij6
 v9lsEUsYsqqBTRxAopxjKz9x78g1eIGrtZaAzTe6CbwqErPVKk07/PDIJOsTelazk/lG
 1VEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIQ3TnfZ68pPIkUzqIFtFISbPCoPofhu5EL/Har3M34NhGgK4v7EVtsiriLYN98gspu7g4BtDjk3h+@nongnu.org
X-Gm-Message-State: AOJu0YyTPbbnVNq4HXSORHUEoGXlSlebzb51H0xVQBLhd1dqtZED5pM+
 f2EnjQZpKKZM54pZiXbFZ7DoGPpxiD5QVd0JYPM/I+bIUnP1d9ukLYE6B9fmwAJt2xtRX7K3eQN
 NSuUGVp5dlufj6YcqKtqDnRyY1pSPeoU=
X-Gm-Gg: ASbGncv138OsN78aAAgkHBo0QFiZHKtc6QrKYRVV5wWEldzVFX/+rjxAGH+cd/FmqGZ
 jA6MQ1ZLfnl7zvPnFgTDaIQJ3oRj2egJNfFdV5qi5K7WgHwbscyAGyaJ3gcpJ3QGCybJVXxZTHL
 iaYVlwBjr+vQngDDReC2j8mjv/CQZC+Kt3X8eMCh0xUIzrlq6nINXvZIdzaVXPUUEJGd3iLRgxJ
 Bpd9q+hpYTNOcYNTTcCa9oHzf4yLSCP9aoGWjoSAfoiCv5Bz3e/fX2qhLTpXv3JktU=
X-Google-Smtp-Source: AGHT+IEcQ2k4wDMQNmrj1s8e6x3fHLrMesMDJz/c3Vr2ndiT/3HBNjenrfvh83hHFWtIBXOxu4YhZjYG46svXs/bQhw=
X-Received: by 2002:a05:6402:358c:b0:639:e050:6794 with SMTP id
 4fb4d7f45d1cf-639e0506bd2mr20395065a12.11.1760495061212; Tue, 14 Oct 2025
 19:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <20251004200049.871646-1-linux@roeck-us.net>
 <20251004200049.871646-5-linux@roeck-us.net>
In-Reply-To: <20251004200049.871646-5-linux@roeck-us.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Oct 2025 12:23:54 +1000
X-Gm-Features: AS18NWDIhFH0EEYwEg9W41_NTXJH8oVdsGtVc9ZrloYfaRmS2dY-y9U8YchcruA
Message-ID: <CAKmqyKOP8hThu-XZud87dnJaJtmenA-mcrWnAwEyWN_7BYBfmA@mail.gmail.com>
Subject: Re: [PATCH 4/4] microchip icicle: Enable PCS on Cadence Ethernet
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Sun, Oct 5, 2025 at 6:03=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> PCS needs to be enabled for SGMII to be supported by the Linux kernel.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/microchip_pfsoc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 6e2a6e721b..5d3007e8d3 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -415,6 +415,7 @@ static void microchip_pfsoc_soc_realize(DeviceState *=
dev, Error **errp)
>      object_property_set_int(OBJECT(&s->gem0), "revision", GEM_REVISION, =
errp);
>      object_property_set_int(OBJECT(&s->gem0), "phy-addr", 8, errp);
>      object_property_set_bool(OBJECT(&s->gem0), "phy-connected", false, e=
rrp);
> +    object_property_set_bool(OBJECT(&s->gem0), "pcs-enabled", true, errp=
);
>
>      sysbus_realize(SYS_BUS_DEVICE(&s->gem0), errp);
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->gem0), 0,
> @@ -426,6 +427,7 @@ static void microchip_pfsoc_soc_realize(DeviceState *=
dev, Error **errp)
>      object_property_set_int(OBJECT(&s->gem1), "phy-addr", 9, errp);
>      object_property_set_link(OBJECT(&s->gem1), "phy-consumer",
>                               OBJECT(&s->gem0), errp);
> +    object_property_set_bool(OBJECT(&s->gem1), "pcs-enabled", true, errp=
);
>      sysbus_realize(SYS_BUS_DEVICE(&s->gem1), errp);
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->gem1), 0,
>                      memmap[MICROCHIP_PFSOC_GEM1].base);
> --
> 2.45.2
>
>

