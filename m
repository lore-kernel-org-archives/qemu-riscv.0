Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lperB-0003Nf-Ad
	for mharc-qemu-riscv@gnu.org; Sat, 05 Jun 2021 18:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lper9-0003NM-Hp
 for qemu-riscv@nongnu.org; Sat, 05 Jun 2021 18:33:27 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lper7-0002Di-K4
 for qemu-riscv@nongnu.org; Sat, 05 Jun 2021 18:33:27 -0400
Received: by mail-pf1-x429.google.com with SMTP id c12so10226333pfl.3
 for <qemu-riscv@nongnu.org>; Sat, 05 Jun 2021 15:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YDHg+VEJV3GItXooMJlAAsagEkuPy0NmAs3cfITCXF4=;
 b=P0jGAM687Dg3CppBBP4GLl41VhobcQ20r+QSHZ1g/amunEq0TNAKEIPrF8TciAE2GG
 jDD/XGMzRH6Ymzcw4sdDHKdBtKUEaw8kzmcN3LquJl0kt06EZAWlKery2eeCVbKtg6HE
 iUUUym8ycjpWjY17lgYuL8pf22jCUvt6MUaix7GmZNpVp7982YI61tCiPYpH/sSKZ2xP
 jfPpJV6XG0anh6koOirjJ0nVm9OAJ78O+yLynOSDXEh/AEHFF6LWyAYl5VJWeTogmcwx
 3twQ6ZNnu6t4Xb3eec8F37ftXlbnyAto6llsyBgpW4AJn60UGqgB1pR4yf5WZBnbt2+c
 w0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YDHg+VEJV3GItXooMJlAAsagEkuPy0NmAs3cfITCXF4=;
 b=tKQG8Gau0gm1M2z2zK9iVUkf5fRADUVNnUz6PAiVzeT+J678IySFgqtdffA11lD0DZ
 bk+xOUUQML6kgK6fehf1EOKBDZG+HNjrZTQp+roV5L3Hmp4tx2zsE4hTWf1i2NMEkOhg
 IuKLkJaqy2v91eieUP13vok1Ck0GssX1IkARKuNvdbSl9w+wNIkZkdfrqpKGjhtiHnzP
 nc1syzGwv4XB2zP75/VkNolYeSIkAesr+Uqiug1Kl6tUfWVDXjlMZOH+zZfLBH8ge7CM
 0mpr/oO+IiCkKIYIpsnl0R/jE9Mi0soutlGtwBspi0Z5+QYDPPKz/q4oaNLV/TMlRI4a
 kbhw==
X-Gm-Message-State: AOAM532+omiDHp9A9H0yEhI6qIRzSBeynzRBHQo6IxQJ+CkQy2T7M58x
 CrbWQZ/Q5kKZf/wNPxr0rN+ZjQ==
X-Google-Smtp-Source: ABdhPJzpB7x7n00fXCFTLcuK8d27VCIsglRfnwc/sQbp9mhdffYqFMJOUgHN2/ojA1bAsja07WfVzw==
X-Received: by 2002:a65:58c8:: with SMTP id e8mr11370635pgu.20.1622932404099; 
 Sat, 05 Jun 2021 15:33:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 b195sm5102037pga.47.2021.06.05.15.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 15:33:23 -0700 (PDT)
Subject: Re: [PATCH v16 93/99] meson: Introduce target-specific Kconfig
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-94-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <56411bc8-ffdf-babb-fc72-63bfb7db5df1@linaro.org>
Date: Sat, 5 Jun 2021 15:33:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-94-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
X-List-Received-Date: Sat, 05 Jun 2021 22:33:27 -0000

On 6/4/21 8:53 AM, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Add a target-specific Kconfig.
> 
> Target foo now has CONFIG_FOO defined.
> 
> Two architecture have a particularity, ARM and MIPS:
> their 64-bit version include the 32-bit subset.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <20210131111316.232778-6-f4bug@amsat.org>
> ---
>   meson.build               |  3 ++-
>   Kconfig                   |  1 +
>   target/Kconfig            | 23 +++++++++++++++++++++++
>   target/alpha/Kconfig      |  2 ++
>   target/arm/Kconfig        |  6 ++++++
>   target/avr/Kconfig        |  2 ++
>   target/cris/Kconfig       |  2 ++
>   target/hppa/Kconfig       |  2 ++
>   target/i386/Kconfig       |  5 +++++
>   target/lm32/Kconfig       |  2 ++
>   target/m68k/Kconfig       |  2 ++
>   target/microblaze/Kconfig |  2 ++
>   target/mips/Kconfig       |  6 ++++++
>   target/moxie/Kconfig      |  2 ++
>   target/nios2/Kconfig      |  2 ++
>   target/openrisc/Kconfig   |  2 ++
>   target/ppc/Kconfig        |  5 +++++
>   target/riscv/Kconfig      |  5 +++++
>   target/rx/Kconfig         |  2 ++
>   target/s390x/Kconfig      |  2 ++
>   target/sh4/Kconfig        |  2 ++
>   target/sparc/Kconfig      |  5 +++++
>   target/tilegx/Kconfig     |  2 ++
>   target/tricore/Kconfig    |  2 ++
>   target/unicore32/Kconfig  |  2 ++
>   target/xtensa/Kconfig     |  2 ++
>   26 files changed, 92 insertions(+), 1 deletion(-)
>   create mode 100644 target/Kconfig
>   create mode 100644 target/alpha/Kconfig
>   create mode 100644 target/arm/Kconfig
>   create mode 100644 target/avr/Kconfig
>   create mode 100644 target/cris/Kconfig
>   create mode 100644 target/hppa/Kconfig
>   create mode 100644 target/i386/Kconfig
>   create mode 100644 target/lm32/Kconfig
>   create mode 100644 target/m68k/Kconfig
>   create mode 100644 target/microblaze/Kconfig
>   create mode 100644 target/mips/Kconfig
>   create mode 100644 target/moxie/Kconfig
>   create mode 100644 target/nios2/Kconfig
>   create mode 100644 target/openrisc/Kconfig
>   create mode 100644 target/ppc/Kconfig
>   create mode 100644 target/riscv/Kconfig
>   create mode 100644 target/rx/Kconfig
>   create mode 100644 target/s390x/Kconfig
>   create mode 100644 target/sh4/Kconfig
>   create mode 100644 target/sparc/Kconfig
>   create mode 100644 target/tilegx/Kconfig
>   create mode 100644 target/tricore/Kconfig
>   create mode 100644 target/unicore32/Kconfig
>   create mode 100644 target/xtensa/Kconfig

I guess you haven't rebased since unicore, moxie et al were removed?

> --- a/meson.build
> +++ b/meson.build
> @@ -1359,7 +1359,8 @@ foreach target : target_dirs
>         command: [minikconf,
>                   get_option('default_devices') ? '--defconfig' : '--allnoconfig',
>                   config_devices_mak, '@DEPFILE@', '@INPUT@',
> -                host_kconfig, accel_kconfig])
> +                host_kconfig, accel_kconfig,
> +                'CONFIG_' + config_target['TARGET_ARCH'].to_upper() + '=y'])

I can understand this,

>   
>       config_devices_data = configuration_data()
>       config_devices = keyval.load(config_devices_mak)
> diff --git a/Kconfig b/Kconfig
> index d52ebd839b..fb6a24a2de 100644
> --- a/Kconfig
> +++ b/Kconfig
> @@ -1,5 +1,6 @@
>   source Kconfig.host
>   source backends/Kconfig
>   source accel/Kconfig
> +source target/Kconfig
>   source hw/Kconfig
>   source semihosting/Kconfig
> diff --git a/target/Kconfig b/target/Kconfig
> new file mode 100644
> index 0000000000..a6f719f223
> --- /dev/null
> +++ b/target/Kconfig
> @@ -0,0 +1,23 @@
> +source alpha/Kconfig
> +source arm/Kconfig
> +source avr/Kconfig
> +source cris/Kconfig
> +source hppa/Kconfig
> +source i386/Kconfig
> +source lm32/Kconfig
> +source m68k/Kconfig
> +source microblaze/Kconfig
> +source mips/Kconfig
> +source moxie/Kconfig
> +source nios2/Kconfig
> +source openrisc/Kconfig
> +source ppc/Kconfig
> +source riscv/Kconfig
> +source rx/Kconfig
> +source s390x/Kconfig
> +source sh4/Kconfig
> +source sparc/Kconfig
> +source tilegx/Kconfig
> +source tricore/Kconfig
> +source unicore32/Kconfig
> +source xtensa/Kconfig
> diff --git a/target/alpha/Kconfig b/target/alpha/Kconfig
> new file mode 100644
> index 0000000000..267222c05b
> --- /dev/null
> +++ b/target/alpha/Kconfig
> @@ -0,0 +1,2 @@
> +config ALPHA
> +    bool

But not these.  I guess the whole Kconfig thing is processed unconditionally, 
and there must be some definition?


r~

