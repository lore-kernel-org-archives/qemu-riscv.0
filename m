Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jc9MB-0000Qm-4O
	for mharc-qemu-riscv@gnu.org; Fri, 22 May 2020 11:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jc9M6-0000Jv-Pt
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 11:13:05 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37180
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jc9M5-0001iO-Vx
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 11:13:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590160380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=esPhA5uPa52ZkKLU+VzHjUqOZ2ccRyG0jIhcXa9X9os=;
 b=JEjyEDvPfqASJAxzFvzwh2eYaakGg30iV2g+8k4Xkgodcpd4KXQGHHj69XnMhqEcoXVK79
 hNsmmto22hKHwY07nlJ2W/SRIk4h3Pn0rYUnoimegOkydC04nMCmgBy98MaG849sy2zgTu
 pVFNWe1RbmW3kUhHazeODzGKa7e9YVA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-i18b3X1yN82DEKbERiQlkw-1; Fri, 22 May 2020 11:12:52 -0400
X-MC-Unique: i18b3X1yN82DEKbERiQlkw-1
Received: by mail-wm1-f70.google.com with SMTP id p24so689173wmc.1
 for <qemu-riscv@nongnu.org>; Fri, 22 May 2020 08:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=esPhA5uPa52ZkKLU+VzHjUqOZ2ccRyG0jIhcXa9X9os=;
 b=pUr+H6YIKTKj3yAhvwmiOO06xZlRyzYk+SnXRn43xeIGjJY59jpNmmnwZVBNOOZPjs
 yohgaa34EfIPuGCyz5Ls8DcuEq31U8uX0n6H0gyDHdX3vBZuRnDBKIv9CQra1NApb3SR
 OPh8PNh7/kmdIk8rWrF8cn6IMKnKIBK6NtYAtO6uLA7oHbH++XmJrQiR7vS/VzgXoH1g
 xMX9hW2YpN17mxu2lRLfjMKm3Rj1S84Q3iXNnHOF/0cnuDDlxpX2BgTmoYJVhlSon9PY
 1Txn64isETSwmGISzQXMUjUdvzMixkJnzW4ZvCGn9UiT5F96O4G1z/hwJ81SR0xWlVRM
 2S2w==
X-Gm-Message-State: AOAM533v2aYXXCy2ZjuhMd8F2qog9KLKx+WLXJ0OMT/RH3e9ud682x3p
 I2bU4s2v7xsGfGpxlnLNqgPLCbyiv9ow/+LKg/VlirqYEXV4cFm3veKKbSnehKguEM6SdxcXDtl
 Wq1M3haW7aR61LJQ=
X-Received: by 2002:a7b:c205:: with SMTP id x5mr14437133wmi.135.1590160371313; 
 Fri, 22 May 2020 08:12:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSXgJaVmQVhbh5oua1UP9kTbA0+y5AKSl1+bMKoEgJMWuZ7Lr9XCnTkvWj3JjYiOen6+l5lg==
X-Received: by 2002:a7b:c205:: with SMTP id x5mr14437106wmi.135.1590160371130; 
 Fri, 22 May 2020 08:12:51 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id n13sm9570037wrs.2.2020.05.22.08.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2020 08:12:50 -0700 (PDT)
Subject: Re: [PATCH v3 11/11] hw/semihosting: Make the feature depend of TCG, 
 and allow to disable it
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff
 <crwulff@gmail.com>, qemu-arm@nongnu.org, Laurent Vivier
 <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Michael Walle <michael@walle.cc>,
 Marek Vasut <marex@denx.de>, qemu-riscv@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
References: <20200521195911.19685-1-philmd@redhat.com>
 <20200521195911.19685-12-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <7e59175e-86f7-98f8-392b-929796ec877a@redhat.com>
Date: Fri, 22 May 2020 17:12:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200521195911.19685-12-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/22 11:11:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 22 May 2020 15:13:06 -0000

On 5/21/20 9:59 PM, Philippe Mathieu-Daudé wrote:
> The semihosting feature is only meaningful when using TCG.
> 
> Do not enable it by default, and let the few targets requiring
> it to manually select it.
> The targets restricted to TCG that previously selected it
> (see commit 16932bb761e52c2 'introduce CONFIG_SEMIHOSTING')
> are left unmodified; however the selection is moved to the
> target Kconfig.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v3: Fixed odd hidden \xC2 UTF-8 chars:
> 
> Traceback (most recent call last):
>   File "qemu/scripts/minikconf.py", line 355, in parse_file
>     self.src = fp.read()
> UnicodeDecodeError: 'ascii' codec can't decode byte 0xc2 in position 21: ordinal not in range(128)
> ---
>  default-configs/arm-softmmu.mak         | 1 -
>  default-configs/lm32-softmmu.mak        | 2 --
>  default-configs/m68k-softmmu.mak        | 2 --
>  default-configs/mips-softmmu-common.mak | 3 ---
>  default-configs/nios2-softmmu.mak       | 2 --
>  default-configs/xtensa-softmmu.mak      | 2 --
>  hw/semihosting/Kconfig                  | 4 +++-
>  target/arm/Kconfig                      | 2 ++
>  target/lm32/Kconfig                     | 2 ++
>  target/m68k/Kconfig                     | 2 ++
>  target/mips/Kconfig                     | 2 ++
>  target/nios2/Kconfig                    | 2 ++
>  target/riscv/Kconfig                    | 2 ++
>  target/xtensa/Kconfig                   | 2 ++
>  14 files changed, 17 insertions(+), 13 deletions(-)
>  create mode 100644 target/arm/Kconfig
>  create mode 100644 target/lm32/Kconfig
>  create mode 100644 target/m68k/Kconfig
>  create mode 100644 target/mips/Kconfig
>  create mode 100644 target/nios2/Kconfig
>  create mode 100644 target/riscv/Kconfig
>  create mode 100644 target/xtensa/Kconfig
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 8fc09a4a51..f6044f1121 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -40,6 +40,5 @@ CONFIG_MICROBIT=y
>  CONFIG_FSL_IMX25=y
>  CONFIG_FSL_IMX7=y
>  CONFIG_FSL_IMX6UL=y
> -CONFIG_SEMIHOSTING=y
>  CONFIG_ALLWINNER_H3=y
>  CONFIG_ACPI_APEI=y
> diff --git a/default-configs/lm32-softmmu.mak b/default-configs/lm32-softmmu.mak
> index 115b3e34c9..6d259665d6 100644
> --- a/default-configs/lm32-softmmu.mak
> +++ b/default-configs/lm32-softmmu.mak
> @@ -4,8 +4,6 @@
>  #
>  #CONFIG_MILKYMIST_TMU2=n        # disabling it actually causes compile-time failures
>  
> -CONFIG_SEMIHOSTING=y
> -
>  # Boards:
>  #
>  CONFIG_LM32=y
> diff --git a/default-configs/m68k-softmmu.mak b/default-configs/m68k-softmmu.mak
> index 6629fd2aa3..4fef4bd731 100644
> --- a/default-configs/m68k-softmmu.mak
> +++ b/default-configs/m68k-softmmu.mak
> @@ -1,7 +1,5 @@
>  # Default configuration for m68k-softmmu
>  
> -CONFIG_SEMIHOSTING=y
> -
>  # Boards:
>  #
>  CONFIG_AN5206=y
> diff --git a/default-configs/mips-softmmu-common.mak b/default-configs/mips-softmmu-common.mak
> index da29c6c0b2..6c0904b200 100644
> --- a/default-configs/mips-softmmu-common.mak
> +++ b/default-configs/mips-softmmu-common.mak
> @@ -1,8 +1,5 @@
>  # Common mips*-softmmu CONFIG defines
>  
> -# CONFIG_SEMIHOSTING is always required on this architecture
> -CONFIG_SEMIHOSTING=y
> -
>  CONFIG_ISA_BUS=y
>  CONFIG_PCI=y
>  CONFIG_PCI_DEVICES=y
> diff --git a/default-configs/nios2-softmmu.mak b/default-configs/nios2-softmmu.mak
> index 1bc4082ea9..e130d024e6 100644
> --- a/default-configs/nios2-softmmu.mak
> +++ b/default-configs/nios2-softmmu.mak
> @@ -1,7 +1,5 @@
>  # Default configuration for nios2-softmmu
>  
> -CONFIG_SEMIHOSTING=y
> -
>  # Boards:
>  #
>  CONFIG_NIOS2_10M50=y
> diff --git a/default-configs/xtensa-softmmu.mak b/default-configs/xtensa-softmmu.mak
> index 4fe1bf00c9..49e4c9da88 100644
> --- a/default-configs/xtensa-softmmu.mak
> +++ b/default-configs/xtensa-softmmu.mak
> @@ -1,7 +1,5 @@
>  # Default configuration for Xtensa
>  
> -CONFIG_SEMIHOSTING=y
> -
>  # Boards:
>  #
>  CONFIG_XTENSA_SIM=y
> diff --git a/hw/semihosting/Kconfig b/hw/semihosting/Kconfig
> index efe0a30734..30befcdd21 100644
> --- a/hw/semihosting/Kconfig
> +++ b/hw/semihosting/Kconfig
> @@ -1,3 +1,5 @@
>  
> +# default is 'n'
>  config SEMIHOSTING
> -       bool
> +    bool
> +    depends on TCG
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> new file mode 100644
> index 0000000000..035592dd86
> --- /dev/null
> +++ b/target/arm/Kconfig
> @@ -0,0 +1,2 @@
> +config SEMIHOSTING
> +    default y if TCG

This patch is incorrect, because previously the feature was selected for
system-mode only, and now it is selected in user-mode too.

[...]


