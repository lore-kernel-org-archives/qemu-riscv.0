Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F370C71153
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 09:45:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qd68W-0001U9-1i; Mon, 04 Sep 2023 05:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qd68R-0001Sl-AK
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 05:44:43 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qd68P-0003e1-0M
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 05:44:43 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-52a1ce529fdso1606830a12.1
 for <qemu-riscv@nongnu.org>; Mon, 04 Sep 2023 02:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693820679; x=1694425479; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WC1C45aLsX1I/YbAdV9YATF+6FUzHC4kWmTASk2ZK1E=;
 b=AUj9HlK4+Ml/MHJ4DORcA/et4JlZAlDxXWRmpkpIPtrpq1YrGvGzjlCtprzhsSJ0lE
 mjmUd6s1O5a0vPro9jYcnj89Sp9pdMoWDSCWeMNHz6TlvJngWDVBLrQw2Cm0QA5JIrH+
 pK1TBsptX622aESG2WCPxbIk4jDw7xhd7wytU2X7EJQKLRhE9hwg0Di1B5EtIWgqoUQq
 XToGEbiGIeTcRgAyfUk8Nvrx3NeCi9uH0PbKLzzBeMoalmrsu+6UJHbAyJlNOqXLurtp
 VD7zTRV50lzIcqig7BCEYAfdnoT6FjY4X3O/ZDHJE3do184gkHlp1BpR+QvxzGsOSRmy
 GTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693820679; x=1694425479;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WC1C45aLsX1I/YbAdV9YATF+6FUzHC4kWmTASk2ZK1E=;
 b=bD+VwyWL6SPgI21FikBk8Frr323q6nR0zPhY6zwVfPFE4n/ihqmLZNLsB2ptl5OfQ2
 wujSIsIFISg506jXJoNn+OFua7KCwSK3vA+yxBeayNkVTMQ4oNh3bTnvJiCaYNQ0SzN7
 gryL77sSPz0+RcyEj/E/oDq2dApG/svkULKWFqNXUzYdcV5hCFAEu1ZlgqP3VXbUMR79
 0JLtiXP4yFqrO3N+g0lcTmQvwCVq8uKkG1Q4v53qK+lOLrrPrxgLKmN/GQ/npxVmRKdr
 uqt66hk3lL+pjodr5LFqjzg3MAp+vlwWt5jJO0W9UtDTUPGiB64mILS9HmYcwp5akIMv
 nz3w==
X-Gm-Message-State: AOJu0YwUSBxl/b/KbNuqqrtoebiz1TAh9DJAqcQObCoqvUl+2Afr/nhT
 hK6o5PfleTrMy33ssafXQbo1VozmswBgbXSkFPhJLPujtIQvB3RW
X-Google-Smtp-Source: AGHT+IFLZhweHFkUNVpdDQY7+I5Rbb6u3mlwK3f04fe0vGmsvkT6LXiCtyzhfQab2RvWJF0SaMakbyBJWfvp/rTQhlY=
X-Received: by 2002:a05:6402:1211:b0:525:528d:836f with SMTP id
 c17-20020a056402121100b00525528d836fmr7199375edw.18.1693820679494; Mon, 04
 Sep 2023 02:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230823070704.363098-1-chigot@adacore.com>
In-Reply-To: <20230823070704.363098-1-chigot@adacore.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Sep 2023 10:44:28 +0100
Message-ID: <CAFEAcA_bNSwu9kH8uEoAn2zoRnHa4ng+D-n2FO0h+Khnbdf9=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/char: riscv_htif: replace exit(0) with proper
 shutdown
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, 23 Aug 2023 at 08:07, Cl=C3=A9ment Chigot <chigot@adacore.com> wrot=
e:
>
> This replaces the exit(0) call by a shutdown request, ensuring a proper
> cleanup of Qemu. Otherwise, some connections like gdb could be broken
> without being correctly flushed.
>
> Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/char/riscv_htif.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index 37d3ccc76b..c49d20a221 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -31,6 +31,7 @@
>  #include "qemu/error-report.h"
>  #include "exec/address-spaces.h"
>  #include "sysemu/dma.h"
> +#include "sysemu/runstate.h"
>
>  #define RISCV_DEBUG_HTIF 0
>  #define HTIF_DEBUG(fmt, ...)                                            =
       \
> @@ -205,7 +206,16 @@ static void htif_handle_tohost_write(HTIFState *s, u=
int64_t val_written)
>                      g_free(sig_data);
>                  }
>
> -                exit(exit_code);
> +                /*
> +                 * Shutdown request is a clean way to stop the QEMU, com=
pared
> +                 * to a direct call to exit(). But we can't pass the exi=
t code
> +                 * through it so avoid doing that when it can matter.
> +                 */
> +                if (exit_code) {
> +                    exit(exit_code);
> +                } else {
> +                    qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SH=
UTDOWN);
> +                }

This is wrong for the same reason that patch 3 is wrong.

Also, does the guest code really expect to handle execution
continuing after this point? qemu_system_shutdown_request()
is asynchronous.

thanks
-- PMM

