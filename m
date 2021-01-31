Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6ByB-0007mW-7e
	for mharc-qemu-riscv@gnu.org; Sun, 31 Jan 2021 07:36:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6By6-0007lG-2q; Sun, 31 Jan 2021 07:36:42 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6By1-0007VV-Qs; Sun, 31 Jan 2021 07:36:39 -0500
Received: by mail-wr1-x42b.google.com with SMTP id a1so13598428wrq.6;
 Sun, 31 Jan 2021 04:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SlPVp/QhGLIucOeXf2GAys5Xs3M9ZcVjsvA0z2gXN4o=;
 b=GqF9nNkgn2avmaYgMPwoNKRqTrCOmYlhjcSJIIM1a525tHHZGokwelM3VxqW9GfU3A
 HEeLfJ26Y8GiggTDcd8voUsssPtXfKtE9pl6TB9a8171kJ6lbfYQB//8UBw9PCbYH7a6
 EqVY3pwGeNTAS9MVRXwig/mcReaRpUFYSZF7nvLvr6zyDvesdvIlynLasC41Ohrv8hfv
 fZbPuFsaA9kHV91Xku1duzJ1qzyxSpwDpGL42iPrk/lWGl+rilDElZWKztrBCbBw/Ade
 PgbwkfTGoY/QMivj+j+fXN5p1X7sum2107zX4v8e5dIT6Tmo5kZS7c5IcvS9Vg+wTuIM
 UoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SlPVp/QhGLIucOeXf2GAys5Xs3M9ZcVjsvA0z2gXN4o=;
 b=KjkAfAne9ByPXD788TL/SVRVJqQ/6+yedC+Ilzl0PRH2CAI1neFHdxEzCI/8b+uMYM
 BqmTB0ZQOj8M3+V/GKNnTux+CAWt5KtWxq9dYL5pJXfF8rg3QJ7r7CzWHJyb2/cnGb1J
 rYotngEoS8HHzeQUmHWuMTEP9/HNspE2GD8XBUeH0MZPWrDI9WjmIrclxMya1lwPZvMv
 21Pj8GtSbLOSg1Hjty1y2xGQJqfFmieq7e1Z373E3QG1LaM/YP1CfLuX/0LpWxpZK654
 mOkzO3B+scBPAsv+b2I+RHZWpPPOnQ1352cNI9KLD9TaCGUwsNSgmP1pnTlfd3xDU5NA
 INLw==
X-Gm-Message-State: AOAM532Haiy+Hn5FWM++ilisd3TnTJuyClGKR6kxMx2g3G3qeGpsms+U
 ljtA5Bl3268zP8mj5iO/+wI=
X-Google-Smtp-Source: ABdhPJwav7PbpTPE6lRzujkZ6yrrDC5Aycgug4nFeHODSjoMTWkGUOKecg5Ror2BMadj4R5bOHipCA==
X-Received: by 2002:adf:e511:: with SMTP id j17mr13477973wrm.17.1612096594084; 
 Sun, 31 Jan 2021 04:36:34 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id q6sm21580414wrw.43.2021.01.31.04.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 04:36:33 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 05/10] meson: Introduce target-specific Kconfig
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-6-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d4a706cb-11ac-1c79-9641-c061bffea829@amsat.org>
Date: Sun, 31 Jan 2021 13:36:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210131111316.232778-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.079,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 31 Jan 2021 12:36:42 -0000

On 1/31/21 12:13 PM, Philippe Mathieu-Daudé wrote:
> Add a target-specific Kconfig.
> 
> Target foo now has CONFIG_FOO defined.
> 
> Two architecture have a particularity, ARM and MIPS:
> their 64-bit version include the 32-bit subset.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
...

> diff --git a/meson.build b/meson.build
> index f00b7754fd4..a2dda0ce95e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1322,7 +1322,8 @@
>        command: [minikconf,
>                  get_option('default_devices') ? '--defconfig' : '--allnoconfig',
>                  config_devices_mak, '@DEPFILE@', '@INPUT@',
> -                host_kconfig, accel_kconfig])
> +                host_kconfig, accel_kconfig,
> +                'CONFIG_' + config_target['TARGET_ARCH'].to_upper() + '=y'])
>  
>      config_devices_data = configuration_data()
>      config_devices = keyval.load(config_devices_mak)
> diff --git a/Kconfig b/Kconfig
> index bf694c42afe..c01e261e4e9 100644
> --- a/Kconfig
> +++ b/Kconfig
> @@ -1,4 +1,5 @@
>  source Kconfig.host
>  source backends/Kconfig
>  source accel/Kconfig
> +source target/Kconfig
>  source hw/Kconfig
> diff --git a/target/Kconfig b/target/Kconfig
> new file mode 100644
> index 00000000000..a6f719f223a
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
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> new file mode 100644
> index 00000000000..3f3394a22b2
> --- /dev/null
> +++ b/target/arm/Kconfig
> @@ -0,0 +1,6 @@
> +config ARM
> +    bool
> +
> +config AARCH64
> +    bool
> +    select ARM

This isn't correct yet, as Kconfig is primarly designed for devices,
and per docs/devel/kconfig.rst:

  "devices are usually ``default y`` if and only if they have at
   least one ``depends on``;"

So having one machine "depends on AARCH64" selects AARCH64 on ARM :/
I'll see if explicit each arch as 'default n' helps...

