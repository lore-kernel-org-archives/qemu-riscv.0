Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDU4u-0000qF-MG
	for mharc-qemu-riscv@gnu.org; Thu, 05 Jan 2023 12:30:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDU4t-0000l8-ER
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 12:30:55 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDU4q-0001zH-BU
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 12:30:55 -0500
Received: by mail-wm1-x329.google.com with SMTP id l26so26954169wme.5
 for <qemu-riscv@nongnu.org>; Thu, 05 Jan 2023 09:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1XSMKE/5EB1bpbXcBjrkxqRLay8QBqdRXQ4g4OxlKas=;
 b=IF3iR0QlAzQbtNh5PZvukBynNxG6WmcjaC+y5AYGPVFiffqpNkPNurBB6n+7OUKaMS
 RhtBuGxJyN0rFlS4EFpLP0ipdciXkBniWFAy9l3/luaNTohi1FyZPtCJ36SAB1BNZ51m
 sinBBGFINSlLcfemBVSuhwiYPc+KLpC1HpSzeAtqHeHzQWxgOIr45+txY4Jcy6EN9jGH
 X9UZA2QGtkvAaCtVzLI1vQLr9y7h75+9qSF23NvCVGV+0Gd+2/wgRArQJiHO9BHEjEvk
 52NBZVFki1sW+LFiAJuiQj9CUrG0HB9ZDsW/mF4IjbWdTXvbbZqvOxJPGtoFP9v6KYtv
 SS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1XSMKE/5EB1bpbXcBjrkxqRLay8QBqdRXQ4g4OxlKas=;
 b=y0aODpVjbg1BcFlPy7Ds4imJmwgWz7Zds0+BDQ6iioaxUsJEAwFQAap0NYt6eLpm9v
 T7yvYRoIYmww2nZ4OSue2PeFvOKSxpQUH4MktuNjVkUbp279/1Hk71lFMui6LiCJ8v46
 VSZ0gzJtsa9BeKcFz3BL0PElU993ZyWIt2b1Kc+rShi4Zza1ZOV39w9MGSwn8dmxSnZV
 Yr3GO6MhBldUfInHc6yHb/7Eh1vYNXCDo2G1+Gr6TC98VB8Q8h+OunKrhPRnLl9N6Zrc
 l3+kKW6X901oGHl0DJPTroI13QZsKiZuCkmUxRHJi0/xem2HazvRrXLxJ1Zw8Ykg7Hsv
 HV8Q==
X-Gm-Message-State: AFqh2kr5OWetpaXc6fMbIyD/1YoXPhd/TJZxvtnrkTTpZlqe+PePepb0
 I8DE4WjVuCtZwQESYY2qTG9Grg==
X-Google-Smtp-Source: AMrXdXullybworR9QQQLRTJsj7FIQUrHdLLVkmcuoAHB2iNZk9CVkB0nL7sUfBxwS0clQa/mjPWYBg==
X-Received: by 2002:a05:600c:8a9:b0:3cf:6e85:eda7 with SMTP id
 l41-20020a05600c08a900b003cf6e85eda7mr37622567wmp.14.1672939850822; 
 Thu, 05 Jan 2023 09:30:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s35-20020a05600c31a300b003cfa81e2eb4sm2886611wmp.38.2023.01.05.09.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 09:30:50 -0800 (PST)
Message-ID: <63479354-031b-add3-72b5-f32719f33f3a@linaro.org>
Date: Thu, 5 Jan 2023 18:30:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 19/21] gdbstub: move register helpers into standalone
 include
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Greg Kurz
 <groug@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bin Meng <bin.meng@windriver.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-20-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105164320.2164095-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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
X-List-Received-Date: Thu, 05 Jan 2023 17:30:56 -0000

On 5/1/23 17:43, Alex Bennée wrote:
> These inline helpers are all used by target specific code so move them
> out of the general header so we don't needlessly pollute the rest of
> the API with target specific stuff.
> 
> Note we have to include cpu.h in semihosting as it was relying on a
> side effect before.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/exec/gdbstub.h                 |  86 ---------------------
>   include/gdbstub/helpers.h              | 103 +++++++++++++++++++++++++
>   semihosting/syscalls.c                 |   1 +
>   target/alpha/gdbstub.c                 |   2 +-
>   target/arm/gdbstub.c                   |   1 +
>   target/arm/gdbstub64.c                 |   2 +-
>   target/arm/helper-a64.c                |   2 +-
>   target/arm/m_helper.c                  |   2 +-
>   target/avr/gdbstub.c                   |   2 +-
>   target/cris/gdbstub.c                  |   2 +-
>   target/hexagon/gdbstub.c               |   2 +-
>   target/hppa/gdbstub.c                  |   2 +-
>   target/i386/gdbstub.c                  |   2 +-
>   target/i386/whpx/whpx-all.c            |   2 +-
>   target/loongarch/gdbstub.c             |   1 +
>   target/m68k/gdbstub.c                  |   2 +-
>   target/m68k/helper.c                   |   1 +
>   target/m68k/m68k-semi.c                |   1 +
>   target/microblaze/gdbstub.c            |   2 +-
>   target/mips/gdbstub.c                  |   2 +-
>   target/mips/tcg/sysemu/mips-semi.c     |   1 +
>   target/nios2/cpu.c                     |   2 +-
>   target/nios2/nios2-semi.c              |   1 +
>   target/openrisc/gdbstub.c              |   2 +-
>   target/openrisc/interrupt.c            |   2 +-
>   target/openrisc/mmu.c                  |   2 +-
>   target/ppc/cpu_init.c                  |   2 +-
>   target/ppc/gdbstub.c                   |   1 +
>   target/riscv/gdbstub.c                 |   1 +
>   target/rx/gdbstub.c                    |   2 +-
>   target/s390x/gdbstub.c                 |   1 +
>   target/s390x/helper.c                  |   2 +-
>   target/sh4/gdbstub.c                   |   2 +-
>   target/sparc/gdbstub.c                 |   2 +-
>   target/tricore/gdbstub.c               |   2 +-
>   target/xtensa/core-dc232b.c            |   2 +-
>   target/xtensa/core-dc233c.c            |   2 +-
>   target/xtensa/core-de212.c             |   2 +-
>   target/xtensa/core-de233_fpu.c         |   2 +-
>   target/xtensa/core-dsp3400.c           |   2 +-
>   target/xtensa/core-fsf.c               |   2 +-
>   target/xtensa/core-lx106.c             |   2 +-
>   target/xtensa/core-sample_controller.c |   2 +-
>   target/xtensa/core-test_kc705_be.c     |   2 +-
>   target/xtensa/core-test_mmuhifi_c3.c   |   2 +-
>   target/xtensa/gdbstub.c                |   2 +-
>   target/xtensa/helper.c                 |   2 +-
>   47 files changed, 148 insertions(+), 121 deletions(-)
>   create mode 100644 include/gdbstub/helpers.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


