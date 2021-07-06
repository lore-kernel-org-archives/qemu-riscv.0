Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0lJZ-000400-CY
	for mharc-qemu-riscv@gnu.org; Tue, 06 Jul 2021 09:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0lJY-0003z4-9C; Tue, 06 Jul 2021 09:40:40 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:52913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0lJS-0001pP-2i; Tue, 06 Jul 2021 09:40:39 -0400
Received: by mail-wm1-x331.google.com with SMTP id g10so7758091wmh.2;
 Tue, 06 Jul 2021 06:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mG8uwHwLtZdbbJXrNqeL0PlbQ4feuU2jH9RDQnv5Qao=;
 b=MLfs/Vxww/TFSoNf4P8ql/1R9v+zVvXPEjlPABnkTfGpHY3Gbz4pHp4LVBYuJACnob
 ad1sT1EmCZBewQR0i6wcImK4sbfLRICmSgiW7nCdioRjai/AARAxeHuvKNgCBxfLGNIz
 R03is1igWFUKADx1FPTPZpEZxgxhHonxVrjjokCRnZRje0GSLYv7hHqfsSDCXhmOgc6G
 067araEjZuNd9pbV2UYyKXvhcGghV3K04lWoSNY+HGA/iHO3ASSfqmj98M8UtHJqjEop
 jqTIQ+9DPJT/apSzzuHf7XGO/GQ1lRlAhcM9I84K406OqdosJR6czlzgHKi3r/FRJh60
 GhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mG8uwHwLtZdbbJXrNqeL0PlbQ4feuU2jH9RDQnv5Qao=;
 b=bGcEyOrmWN9XLsJNkjC36np3E9gtBSsU5N+1YjsGongyo4LIHXDW/n78tFT4J+0S5O
 CcAF2YZr2cIdciAgsSZza4LghOiXE2LesECuZYunHXWZOwntdmy9iDYg1iRgjePi1FrG
 inBT6wj4d5a38g2ygNVV0vzxZJUhmax3TKAdCKEW0HJbvKAbFcKwZf/rlM9RH5LlLbdN
 y/VlZWI9CGnjcpdJOHm5YiXsa+AGyQGpNE3+kXDkhU7zMzLtoF88SGUBAvR4LA0WiaS0
 //KmcDT38m2q0wl0eeVvJlBEyU5j9Ze7G6ihsOU6ZF3mX7fanc+IqaMP9o6G7AFue78H
 hIow==
X-Gm-Message-State: AOAM532rjPyQCo/tqiBg2Ab/ORySLK+HAUqZOlIW62vnllekRGdbUL7u
 k7U7AfhFNVb7XZplHnHv8EA=
X-Google-Smtp-Source: ABdhPJwQtC6NNBrNsDqRvuXI5Ir2okga/KjJe1cEm0SYBG4+SFPp5vGkrJQRpzuzZoOvbmIUEQmKNQ==
X-Received: by 2002:a05:600c:1d28:: with SMTP id
 l40mr831039wms.130.1625578830900; 
 Tue, 06 Jul 2021 06:40:30 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id b15sm20214959wrr.27.2021.07.06.06.40.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 06:40:30 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v1 1/5] meson: Introduce target-specific Kconfig
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff
 <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>, pbonzini@redhat.com,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210621152120.4465-1-alex.bennee@linaro.org>
 <20210621152120.4465-2-alex.bennee@linaro.org>
 <c3d33a80-b3bb-5aa5-50c7-7c1a379814ba@redhat.com>
 <8d018805-8e1f-4c1e-b1a4-45a34c8d2e63@amsat.org>
 <bd97210a-04d4-939f-b3b7-1e250d7d250a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b0b09bf7-71d7-1bd9-1aaf-717b66692304@amsat.org>
Date: Tue, 6 Jul 2021 15:40:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bd97210a-04d4-939f-b3b7-1e250d7d250a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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
X-List-Received-Date: Tue, 06 Jul 2021 13:40:40 -0000

On 7/6/21 3:10 PM, Thomas Huth wrote:
> On 06/07/2021 14.47, Philippe Mathieu-Daudé wrote:
>> On 7/6/21 12:52 PM, Thomas Huth wrote:
>>> On 21/06/2021 17.21, Alex Bennée wrote:
>>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>
>>>> Add a target-specific Kconfig. We need the definitions in Kconfig so
>>>> the minikconf tool can verify they exit. However CONFIG_FOO is only
>>>
>>> s/exit/exist/ ?
>>>
>>>> enabled for target foo via the meson.build rules.
>>>>
>>>> Two architecture have a particularity, ARM and MIPS:
>>>> their 64-bit version include the 32-bit subset.
>>>
>>> Why do you mention these here, but not x86, Sparc, PPC and RISC-V which
>>> also have 32-bit and 64-bit variants?
>>
>> Because we consider them as different targets, they don't include
>> (kselect) the subset.
> 
> And why is that done this way? There is certainly a big difference
> between Sparc and Sparc64, but for x86 and PPC, the 64-bit variant is a
> superset of the 32-bit variant, so why is it done different here
> compared to ARM and MIPS?

I don't know these targets well. Maybe the 64-bit variants do include
their 32-bit subset. If you know, I can easily send a new patch.

