Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhNrX-0001cn-A9
	for mharc-qemu-riscv@gnu.org; Thu, 13 May 2021 22:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhNrT-0001ZV-TV; Thu, 13 May 2021 22:47:35 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:37565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhNrS-00005W-80; Thu, 13 May 2021 22:47:35 -0400
Received: by mail-yb1-xb32.google.com with SMTP id i204so5092068yba.4;
 Thu, 13 May 2021 19:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QIZtcOhVN6GIyp0UAfVE9JWtpSm6aabauJd/INikChY=;
 b=X+kZTkMPe1ctPFxgNQJQX3jL605vYNSahnaf7HC+krGzzojtN1Lus1g9aYi/2J9S9N
 T+NKjNeONk9b/nf0vhMJuxUEDmX0zbp22aBLQz8qt4N6amEP3eS9sa/NQwZiusbuEi25
 wsoaNPtT751gBV1HPoQP4XVVREvok3oIZokM4uXBdvu0eJdriSVzunlFESHmwMyEum95
 LN2hq4PRcQFTp//v9zIpL+9NnxA/jNVVR18DWFvFapyJxHkzmx2S67q/7PwLst1Kyxuc
 ezCwOTUJUSxLVBlfD60b0rSl7T0uNUCKMSRcQkw/7YcZ0QHhG/ORRXyiRSWewcu1RpR9
 5hPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QIZtcOhVN6GIyp0UAfVE9JWtpSm6aabauJd/INikChY=;
 b=eyxQDuGc6v/MeoEYQqJVi5cZKNYcTkoG+35dBwtX5N46kLgmjNI9V/dWg+/b7BC6mW
 BdHPRZOEEa3xtzpp0uTpNIIsIL+Tf5GCy7Mz9kJ4XSGH4fnhX/rTTpDEGMXtsUKvhKHg
 6NR8EWzeE+edxtZVZmxgOiWCor+w0EWw6wqjKUfxHEww0QZN4G/M7ApW/Ct3wCW9Iivx
 TTPAHNuTJ8PJaqLtNMVyC6AGyP1GGzkK3DwRlXO5qpjWMyFc3RHfSzZhcy/9ha7h8ZeC
 zmyUvGUJ3AuQrItQ3U3dq3lByIQbTS9fEEf1uzvPzXSPTA6LGeTarbpufAQBMsP6PvRi
 ZMOQ==
X-Gm-Message-State: AOAM530WpbkVXGk2C9Xu5r94WCjrdcvBkwiRT47juQy+08YNy1321fYl
 HL61x4VeIK2dEiY+HvDLMZNatddIAhrAByDK0Gw=
X-Google-Smtp-Source: ABdhPJxFYyhc0zMueut1/Q34KLrWExleDZjbRp6Xai364UQ86tDfB/yH0v9SJgTUKy379Z6hRMuOXvjDVN8zJIl3GBg=
X-Received: by 2002:a25:e645:: with SMTP id d66mr30013081ybh.314.1620960452805; 
 Thu, 13 May 2021 19:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210513163858.3928976-1-philmd@redhat.com>
 <20210513163858.3928976-7-philmd@redhat.com>
In-Reply-To: <20210513163858.3928976-7-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 14 May 2021 10:47:21 +0800
Message-ID: <CAEUhbmX6mBKQK0ubfpYgeoqrjN7OSGoa6Nt7Gz+pDaU_Qw3gjw@mail.gmail.com>
Subject: Re: [PATCH 06/10] hw/riscv/Kconfig: Add missing dependency
 MICROCHIP_PFSOC -> SERIAL
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 14 May 2021 02:47:37 -0000

Hi Philippe,

On Fri, May 14, 2021 at 12:57 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Commit a8fb0a500a6 ("hw/char: Add Microchip PolarFire SoC MMUART
> emulation") added a dependency on the SERIAL model, but forgot to
> add the Kconfig selector. Fix that to solve when built the
> MICROCHIP_PFSOC machine stand-alone:
>
>   /usr/bin/ld: libcommon.fa.p/hw_char_mchp_pfsoc_mmuart.c.o: in function =
`mchp_pfsoc_mmuart_create':
>   hw/char/mchp_pfsoc_mmuart.c:79: undefined reference to `serial_mm_init'
>
> Fixes: a8fb0a500a6 ("hw/char: Add Microchip PolarFire SoC MMUART emulatio=
n")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 86957ec7b06..b72a248809e 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -12,6 +12,7 @@ config MICROCHIP_PFSOC
>      select SIFIVE_CLINT
>      select SIFIVE_PDMA
>      select SIFIVE_PLIC
> +    select SERIAL

This dependency should be expressed by MCHP_PFSOC_MMUART in hw/char/Kconfig

>      select UNIMP
>
>  config OPENTITAN
> --

Regards,
Bin

