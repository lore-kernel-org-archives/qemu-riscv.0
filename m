Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6Ejz-0001dB-3i
	for mharc-qemu-riscv@gnu.org; Sun, 31 Jan 2021 10:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Ejw-0001ah-UK; Sun, 31 Jan 2021 10:34:17 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:33663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Ejv-0007m5-C7; Sun, 31 Jan 2021 10:34:16 -0500
Received: by mail-wm1-x32c.google.com with SMTP id s24so9893225wmj.0;
 Sun, 31 Jan 2021 07:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7+lv5nqUTiSVBF2ev6X8VB7oA6fyYxN74cd6tEru69k=;
 b=cmKy/aHaE9aodYH/b7bSiqfqQheo9E1sIjukxQBc1VgXxJRrY2wSB4YasMdMt2MPxl
 +vF0HXh+MHaK4FNhldGLbGAsC1oMTohUJ80F39Vc1KNOjo10m8dEpAZhnIjqdLDZxCMO
 iy5dX7mhDnJV80gMoTnDduUeHy08tYEqDjKy/hGkJm8M8ccBDudffksaRJsz+rPmu7/F
 gq6Yhygq49vCtxSdKrLVwWcYmn4/Ifo9+uv++uB+rSmYqnnSUCfHrC+pc/otue+4qumz
 EscINztxRJSl4D7Vw4JZHanxmBc7uVXedMsXCvqou+6iRVMY33VE0wYSfki9Ze2ByEQS
 Y7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7+lv5nqUTiSVBF2ev6X8VB7oA6fyYxN74cd6tEru69k=;
 b=RPBjY9AYT1kI73RJzh24CxPLJ4xg1cALD5kJcCA29JmnyxuLT56T3+DWVboGDUDPni
 d0z6QG8beChvb9MAD3Hj8Ho2NYS+C+mkkQ1KwuMuxSZU0RyQ+UNCBajDavq6k7QpoBsC
 hKsy5rGNSbCpyXy6Ns8zXLB1ZzQ/Xl0po4i/539yKU5IfybUZpKRieblEi4n8phJCH4p
 F1C870P2VdMO8Uvw9ul+A8kZv7XlVzlFzV0G9caoDKXjyCGe4X3hT1mDjWtzD7mE6MoS
 rejAiZ3uogEHDU2eJUWsvY/8B4Lw+j0SDHfBkDjHEv+CSQu4A658FJxv9ZXvd/xmLCyj
 6PfQ==
X-Gm-Message-State: AOAM531yaeEvUjhbJVXrzKq63LHMJzrWJGTQjzkoGT6XXqoMrxiwNXrz
 fT+OyeeKxCKJ3vev4AcWOLQ=
X-Google-Smtp-Source: ABdhPJwblFkbqTQrHm/KyELTO/r8GF9dbjXukSaHHEtMp1Ri/kUmGIhs0RsWPhx3OEcLCVNH5fdEkw==
X-Received: by 2002:a05:600c:4ed3:: with SMTP id
 g19mr11191688wmq.95.1612107249712; 
 Sun, 31 Jan 2021 07:34:09 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id q18sm23411770wrr.55.2021.01.31.07.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 07:34:08 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 05/10] meson: Introduce target-specific Kconfig
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, qemu-ppc@nongnu.org,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-6-f4bug@amsat.org>
 <d4a706cb-11ac-1c79-9641-c061bffea829@amsat.org>
Message-ID: <4e0131d8-80a4-a0ad-f911-cd3f1f521105@amsat.org>
Date: Sun, 31 Jan 2021 16:34:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d4a706cb-11ac-1c79-9641-c061bffea829@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
X-List-Received-Date: Sun, 31 Jan 2021 15:34:17 -0000

On 1/31/21 1:36 PM, Philippe Mathieu-Daudé wrote:
> On 1/31/21 12:13 PM, Philippe Mathieu-Daudé wrote:
>> Add a target-specific Kconfig.
>>
>> Target foo now has CONFIG_FOO defined.
>>
>> Two architecture have a particularity, ARM and MIPS:
>> their 64-bit version include the 32-bit subset.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
> ...
> 
>> diff --git a/meson.build b/meson.build
>> index f00b7754fd4..a2dda0ce95e 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -1322,7 +1322,8 @@
>>        command: [minikconf,
>>                  get_option('default_devices') ? '--defconfig' : '--allnoconfig',
>>                  config_devices_mak, '@DEPFILE@', '@INPUT@',
>> -                host_kconfig, accel_kconfig])
>> +                host_kconfig, accel_kconfig,
>> +                'CONFIG_' + config_target['TARGET_ARCH'].to_upper() + '=y'])
>>  
>>      config_devices_data = configuration_data()
>>      config_devices = keyval.load(config_devices_mak)
>> diff --git a/Kconfig b/Kconfig
>> index bf694c42afe..c01e261e4e9 100644
>> --- a/Kconfig
>> +++ b/Kconfig
>> @@ -1,4 +1,5 @@
>>  source Kconfig.host
>>  source backends/Kconfig
>>  source accel/Kconfig
>> +source target/Kconfig
>>  source hw/Kconfig
>> diff --git a/target/Kconfig b/target/Kconfig
>> new file mode 100644
>> index 00000000000..a6f719f223a
>> --- /dev/null
>> +++ b/target/Kconfig
>> @@ -0,0 +1,23 @@
>> +source alpha/Kconfig
>> +source arm/Kconfig
>> +source avr/Kconfig
>> +source cris/Kconfig
>> +source hppa/Kconfig
>> +source i386/Kconfig
>> +source lm32/Kconfig
>> +source m68k/Kconfig
>> +source microblaze/Kconfig
>> +source mips/Kconfig
>> +source moxie/Kconfig
>> +source nios2/Kconfig
>> +source openrisc/Kconfig
>> +source ppc/Kconfig
>> +source riscv/Kconfig
>> +source rx/Kconfig
>> +source s390x/Kconfig
>> +source sh4/Kconfig
>> +source sparc/Kconfig
>> +source tilegx/Kconfig
>> +source tricore/Kconfig
>> +source unicore32/Kconfig
>> +source xtensa/Kconfig
>> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
>> new file mode 100644
>> index 00000000000..3f3394a22b2
>> --- /dev/null
>> +++ b/target/arm/Kconfig
>> @@ -0,0 +1,6 @@
>> +config ARM
>> +    bool
>> +
>> +config AARCH64
>> +    bool
>> +    select ARM
> 
> This isn't correct yet, as Kconfig is primarly designed for devices,
> and per docs/devel/kconfig.rst:
> 
>   "devices are usually ``default y`` if and only if they have at
>    least one ``depends on``;"
> 
> So having one machine "depends on AARCH64" selects AARCH64 on ARM :/
> I'll see if explicit each arch as 'default n' helps...

Taking this comment back, the approach works but is fragile, as
an incorrect dependency can select the wrong arch and it is hard
to detect.

