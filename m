Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0kUh-0003uH-1N
	for mharc-qemu-riscv@gnu.org; Tue, 06 Jul 2021 08:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0kUf-0003qO-Ro; Tue, 06 Jul 2021 08:48:05 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0kUe-0000ZJ-85; Tue, 06 Jul 2021 08:48:05 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so4240871wmq.1; 
 Tue, 06 Jul 2021 05:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NEhc5WhDYlEEKVlhSzUmANOUr6OiHh9Mh0E8nMqQW6U=;
 b=qBJ5s8dBix/ei+6rR/Fi/5PkDB8J6MDTafEpTEMru3KoB8fgdZCPWUxonYyjrp+Ijc
 yGW6wY6y29XYuPmJOTojJv8yUi85vHDhz2gZx5oUJiVMiTW2Z3ofL9jAfXryhIGXQEy6
 T3dMHNwoW9KepwkcpxmYAP1QOt9o+0wabXHifHtV6MBR0R/vYTQsCF6Q8kwwhHoX4nO+
 FInEh6+8wCTr/oy7N95L2/Ug/PpLdR9WtCu0mFtSqxcfwn4ZqvWg1Ggw5YFb0yFw8c5h
 LKvzFYVS9TDA3Oho23Fwyq6yvN0X8AX3eHc0mPgnh/ImCyIgjGggGgn0BVrhjxtb0pu0
 u+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NEhc5WhDYlEEKVlhSzUmANOUr6OiHh9Mh0E8nMqQW6U=;
 b=EZ2LGekUtcm7poRyMQm1E7PHNCqoR2GqAVoHD6727Y9pD9E8AblEprY7rmR7lOy5Fr
 9vUKVxTFuxh+FGz00jOmEUgBCinyP8ScbGFe3lQRqjvrOE9mfCszYUbPue1G49knWKYo
 Me5nT09rO2oeFKTrW+uuM+DGJww/qC3uYeVPrfyd2tYOOcACIG8jAa8K+xtN1kx5O0BG
 1r4TPelIIN3NhLaZBE6oY5vyOnSt12KUFmebhV1rdnIIRqmtw3V4fmEG+qSK9EjqiBdO
 Hy3vvViMxRl8EYyBJJyq4Hc42F/278d96l/4rieIX49cTFPGd8bSAVcy0HxiKCVXWqmg
 syOQ==
X-Gm-Message-State: AOAM531ANxjgdfAOzlTSRRJ/tr7k9B0KrN2+9MpkMhMH6wpzQ/qSZrNG
 6IdBjPQtiCr3Oul4n92XoEE=
X-Google-Smtp-Source: ABdhPJzA7h0Ajc7fujgjB/Xv1LlickoIHZuPkeEk8lL+ygfFTP6GlWEZlOHZ24Au2tMaRm7f2Lw/QA==
X-Received: by 2002:a05:600c:b48:: with SMTP id
 k8mr507814wmr.180.1625575679578; 
 Tue, 06 Jul 2021 05:47:59 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id h21sm14983105wmq.38.2021.07.06.05.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 05:47:58 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v1 1/5] meson: Introduce target-specific Kconfig
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 pbonzini@redhat.com, Aurelien Jarno <aurelien@aurel32.net>
References: <20210621152120.4465-1-alex.bennee@linaro.org>
 <20210621152120.4465-2-alex.bennee@linaro.org>
 <c3d33a80-b3bb-5aa5-50c7-7c1a379814ba@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8d018805-8e1f-4c1e-b1a4-45a34c8d2e63@amsat.org>
Date: Tue, 6 Jul 2021 14:47:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c3d33a80-b3bb-5aa5-50c7-7c1a379814ba@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 06 Jul 2021 12:48:06 -0000

On 7/6/21 12:52 PM, Thomas Huth wrote:
> On 21/06/2021 17.21, Alex Bennée wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Add a target-specific Kconfig. We need the definitions in Kconfig so
>> the minikconf tool can verify they exit. However CONFIG_FOO is only
> 
> s/exit/exist/ ?
> 
>> enabled for target foo via the meson.build rules.
>>
>> Two architecture have a particularity, ARM and MIPS:
>> their 64-bit version include the 32-bit subset.
> 
> Why do you mention these here, but not x86, Sparc, PPC and RISC-V which
> also have 32-bit and 64-bit variants?

Because we consider them as different targets, they don't include
(kselect) the subset.

> 
> The patch itself looks fine to me, so once you've clarified the commit
> message:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> 
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Message-Id: <20210131111316.232778-6-f4bug@amsat.org>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>
>> ---
>> vajb:
>>    - removed targets that no longer exist
>>    - reword commit message to show why we need the Kconfigs
>> ---

>> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
>> new file mode 100644
>> index 0000000000..3f3394a22b
>> --- /dev/null
>> +++ b/target/arm/Kconfig
>> @@ -0,0 +1,6 @@
>> +config ARM
>> +    bool
>> +
>> +config AARCH64
>> +    bool
>> +    select ARM

>> diff --git a/target/mips/Kconfig b/target/mips/Kconfig
>> new file mode 100644
>> index 0000000000..6adf145354
>> --- /dev/null
>> +++ b/target/mips/Kconfig
>> @@ -0,0 +1,6 @@
>> +config MIPS
>> +    bool
>> +
>> +config MIPS64
>> +    bool
>> +    select MIPS

