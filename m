Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iotao-0007rG-3M
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jan 2020 13:28:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48398)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1iotak-0007k6-Bg
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2020 13:28:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1iotaj-0003Y6-8F
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2020 13:28:34 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:38084)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1iotaj-0003UF-3E
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2020 13:28:33 -0500
Received: by mail-pl1-x643.google.com with SMTP id f20so51578plj.5
 for <qemu-riscv@nongnu.org>; Tue, 07 Jan 2020 10:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=QSlAdgkdBtCqgeZMjTjn8Ck356ySWYi2bzB6dzsyjg4=;
 b=XhSYuse9Q2zBTLf/c61wE29rneUO+J1PsaE6XUPVhISKGmdPY0kV6qO+08VhkS16cf
 VXO7WWAe2rF7VWPsJxTFCxdpiONtR0xW9LM2ueeFb1qYBMw1Df3TE8tGqoVvPc8Ky61F
 2RaRr8Iq8Af7TwrHd/gB5RxMjgc952CLMWQfJlWIXas18Am3bJHpSFalhNiN3GmrgytX
 9biU5cNVKjaHVIcL7u6lwcX8DjptrlkeFscarKmxrZTf7yOkeQMvYLGcVbY77yGxJYMC
 vUQGGWWGT4yR8/g4YaA6n79tnXUMw9EoYoqvmgH4r2jNHY3QIqHc11V69kiZFjfXKlbo
 YVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=QSlAdgkdBtCqgeZMjTjn8Ck356ySWYi2bzB6dzsyjg4=;
 b=scUvY2vrrH/WpNzRTuT7wVdc7uCPoD55D67zdu/qsOU6P97cBLmG2mkhgLebnouKHc
 VktzycpxPlkGFBkgSBQ/Aqgd14bdt2R6imSj01mPdrBYKcxqcKeji/2X7VaXsszBE4xZ
 msOOu1VPyKh37l1E8x877S2pUzarEGfERSguelColSt8Ve/zRG1v2TiIIok1DdNHc/LS
 E1amh4GalV29BDPWiB84Z/eJf74MH5UkeVtJMFs6ZgGNK33QZ3WYCcWpIxsmWQXajb2E
 By8CvlxoqTI4e8Nvlf7OgjKSVCz9YFzyyqwn+IzSCAYh5jTVMmYRaMxF1eM5ThdTEIkw
 uLPA==
X-Gm-Message-State: APjAAAX0Aah4Chb24ymA5oL4kWh2lXCjm8cuNrkPJagDefPPIe3IyNdI
 rnceVw4ey9aAcR027Se30VqWRQ==
X-Google-Smtp-Source: APXvYqyhSa3S1PUu/3jtsxNwybcI0++sqZZNxEEhlrDLUtE1JxOlesQzDy05Ct2cmPRZ3HY98ndMYA==
X-Received: by 2002:a17:90a:bb0c:: with SMTP id
 u12mr1224412pjr.100.1578421709729; 
 Tue, 07 Jan 2020 10:28:29 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id l186sm449150pge.31.2020.01.07.10.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 10:28:29 -0800 (PST)
Date: Tue, 07 Jan 2020 10:28:29 -0800 (PST)
X-Google-Original-Date: Tue, 07 Jan 2020 10:27:44 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v1 06/36] target/riscv: Rename the H irqs to VS irqs
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
To: Alistair Francis <Alistair.Francis@wdc.com>
In-Reply-To: <d43f1c34d02514d3df0527c20718725a36684887.1575914822.git.alistair.francis@wdc.com>
References: <d43f1c34d02514d3df0527c20718725a36684887.1575914822.git.alistair.francis@wdc.com><cover.1575914822.git.alistair.francis@wdc.com>
Message-ID: <mhng-0d2e3aed-8a36-49b7-a42e-4d7b0155a60a@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
X-List-Received-Date: Tue, 07 Jan 2020 18:28:36 -0000

On Mon, 09 Dec 2019 10:10:56 PST (-0800), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c      |  6 +++---
>  target/riscv/cpu_bits.h | 12 ++++++------
>  2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d23d2cba64..e8ae07107e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -80,14 +80,14 @@ const char * const riscv_excp_names[] = {
>  const char * const riscv_intr_names[] = {
>      "u_software",
>      "s_software",
> -    "h_software",
> +    "vs_software",
>      "m_software",
>      "u_timer",
>      "s_timer",
> -    "h_timer",
> +    "vs_timer",
>      "m_timer",
>      "u_external",
> -    "s_external",
> +    "vs_external",
>      "h_external",
>      "m_external",
>      "reserved",
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 9ce73c36de..eeaa03c0f8 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -514,29 +514,29 @@
>  /* Interrupt causes */
>  #define IRQ_U_SOFT                         0
>  #define IRQ_S_SOFT                         1
> -#define IRQ_H_SOFT                         2  /* reserved */
> +#define IRQ_VS_SOFT                        2
>  #define IRQ_M_SOFT                         3
>  #define IRQ_U_TIMER                        4
>  #define IRQ_S_TIMER                        5
> -#define IRQ_H_TIMER                        6  /* reserved */
> +#define IRQ_VS_TIMER                       6
>  #define IRQ_M_TIMER                        7
>  #define IRQ_U_EXT                          8
>  #define IRQ_S_EXT                          9
> -#define IRQ_H_EXT                          10 /* reserved */
> +#define IRQ_VS_EXT                         10
>  #define IRQ_M_EXT                          11
>
>  /* mip masks */
>  #define MIP_USIP                           (1 << IRQ_U_SOFT)
>  #define MIP_SSIP                           (1 << IRQ_S_SOFT)
> -#define MIP_HSIP                           (1 << IRQ_H_SOFT)
> +#define MIP_VSSIP                          (1 << IRQ_VS_SOFT)
>  #define MIP_MSIP                           (1 << IRQ_M_SOFT)
>  #define MIP_UTIP                           (1 << IRQ_U_TIMER)
>  #define MIP_STIP                           (1 << IRQ_S_TIMER)
> -#define MIP_HTIP                           (1 << IRQ_H_TIMER)
> +#define MIP_VSTIP                          (1 << IRQ_VS_TIMER)
>  #define MIP_MTIP                           (1 << IRQ_M_TIMER)
>  #define MIP_UEIP                           (1 << IRQ_U_EXT)
>  #define MIP_SEIP                           (1 << IRQ_S_EXT)
> -#define MIP_HEIP                           (1 << IRQ_H_EXT)
> +#define MIP_VSEIP                          (1 << IRQ_VS_EXT)
>  #define MIP_MEIP                           (1 << IRQ_M_EXT)
>
>  /* sip masks */

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

