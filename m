Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lH5ja-0002hK-6m
	for mharc-qemu-riscv@gnu.org; Tue, 02 Mar 2021 09:10:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH5jW-0002g4-Kn; Tue, 02 Mar 2021 09:10:42 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:33588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH5jU-0007Bs-Va; Tue, 02 Mar 2021 09:10:42 -0500
Received: by mail-ej1-x632.google.com with SMTP id jt13so35539676ejb.0;
 Tue, 02 Mar 2021 06:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WfvwxWrxxEeBzngpLg0mUnnwLyaVyzyP6BTbo+AU/c0=;
 b=cf6XaUwUHWVs/4nqZvc3KjIHVxIqxdNsgQP2lUVTLx8d25WChOOiHbHTo8TM3u6gZL
 g5JG2KohJ/rlwbe/+ZqzR4OkUWEul3F3v4XKhKldvqjdKbvoxMJzBMt6GuxjN7GsA+Fe
 V+w3R7pS5aG2xqq5EQqEx/OF3Tb59TX2iDGzkz1TjEFzO3AIoV5G4HEtERoflkUU0Z0Q
 XkeiaUgfxkPElow67pmZh2VppoAoQF2xHEgH4L0ph8qdzwnshB/ZkvKx7kZXwRy4MjXG
 4n246G5xVNMOC30TsVI3sZA50T0yfXDOBEqpg1tpZWf9D0oDs6TIq2VSJAbXKcnIFHtm
 DCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WfvwxWrxxEeBzngpLg0mUnnwLyaVyzyP6BTbo+AU/c0=;
 b=FRP3RpuY8iyHVPXtnx8vAxl2RZBHaz39DRz6WKps293lEZL8+fmAsQaBWrEeMVm9I+
 d0zBle2uwN9OJ5IWNRtnSQE9Q5L8bzaKa4+4Gra5y8zkqSf8EBL/M/8yZSR+a82j+t6s
 F7kJEQwKG1S5uypHArK+75Cnm2DaFTykGPAYKSBvLx1wHVLzPhNvlAQ0M4iCWk1c0FWm
 7qhMOTtL+X4AwOE+2m20XJXU3b9/Lgqf1nL2ThbduzTCy3KYx+hzHVor7ADlSewSihxe
 3bpLfLTS3owvB9hzdtGQy3aAkFtdk9w0NYfUxXV/CeoLwgBvUOLpzWSOdUROJDLEbWpf
 NDqQ==
X-Gm-Message-State: AOAM532GHX4tshb2NcUpmE6BxU5MAXQeWgq+vlQWqYmExfzEBOJet1FJ
 3wZCJuWv2+M2Fc5ZmLZiNczYh8esEf4=
X-Google-Smtp-Source: ABdhPJxHLhUbmSriG1oz2z2e4fYSekgBZG4hpYlUEVLdMe3TMSLYK65lvL7pMrYqQIPQxZy3o9OsSQ==
X-Received: by 2002:a17:906:3a13:: with SMTP id
 z19mr21565057eje.317.1614694238729; 
 Tue, 02 Mar 2021 06:10:38 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y12sm11958296ejb.104.2021.03.02.06.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 06:10:37 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 0/2] semihosting: Move it out of hw/
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Chris Wulff <crwulff@gmail.com>, qemu-arm@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Marek Vasut <marex@denx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>
References: <20210226131356.3964782-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <463befd2-c384-553b-9a78-bb033d92638e@amsat.org>
Date: Tue, 2 Mar 2021 15:10:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210226131356.3964782-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 02 Mar 2021 14:10:42 -0000

Cc'ing Claudio.

On 2/26/21 2:13 PM, Philippe Mathieu-Daudé wrote:
> In order to reduce CONFIG_USER_ONLY uses in hw/, move
> semihosting out of it, being a generic feature.
> 
> Philippe Mathieu-Daudé (2):
>   semihosting: Move include/hw/semihosting/ -> include/semihosting/
>   semihosting: Move hw/semihosting/ -> semihosting/
> 
>  meson.build                                       | 1 +
>  include/{hw => }/semihosting/console.h            | 0
>  include/{hw => }/semihosting/semihost.h           | 0
>  {hw/semihosting => semihosting}/common-semi.h     | 0
>  gdbstub.c                                         | 2 +-
>  hw/mips/malta.c                                   | 2 +-
>  linux-user/aarch64/cpu_loop.c                     | 2 +-
>  linux-user/arm/cpu_loop.c                         | 2 +-
>  linux-user/riscv/cpu_loop.c                       | 2 +-
>  linux-user/semihost.c                             | 2 +-
>  {hw/semihosting => semihosting}/arm-compat-semi.c | 6 +++---
>  {hw/semihosting => semihosting}/config.c          | 2 +-
>  {hw/semihosting => semihosting}/console.c         | 4 ++--
>  softmmu/vl.c                                      | 2 +-
>  stubs/semihost.c                                  | 2 +-
>  target/arm/helper.c                               | 4 ++--
>  target/arm/m_helper.c                             | 4 ++--
>  target/arm/translate-a64.c                        | 2 +-
>  target/arm/translate.c                            | 2 +-
>  target/lm32/helper.c                              | 2 +-
>  target/m68k/op_helper.c                           | 2 +-
>  target/mips/cpu.c                                 | 2 +-
>  target/mips/mips-semi.c                           | 4 ++--
>  target/mips/translate.c                           | 2 +-
>  target/nios2/helper.c                             | 2 +-
>  target/riscv/cpu_helper.c                         | 2 +-
>  target/unicore32/helper.c                         | 2 +-
>  target/xtensa/translate.c                         | 2 +-
>  target/xtensa/xtensa-semi.c                       | 2 +-
>  Kconfig                                           | 1 +
>  MAINTAINERS                                       | 4 ++--
>  hw/Kconfig                                        | 1 -
>  hw/meson.build                                    | 1 -
>  {hw/semihosting => semihosting}/Kconfig           | 0
>  {hw/semihosting => semihosting}/meson.build       | 0
>  35 files changed, 35 insertions(+), 35 deletions(-)
>  rename include/{hw => }/semihosting/console.h (100%)
>  rename include/{hw => }/semihosting/semihost.h (100%)
>  rename {hw/semihosting => semihosting}/common-semi.h (100%)
>  rename {hw/semihosting => semihosting}/arm-compat-semi.c (99%)
>  rename {hw/semihosting => semihosting}/config.c (99%)
>  rename {hw/semihosting => semihosting}/console.c (98%)
>  rename {hw/semihosting => semihosting}/Kconfig (100%)
>  rename {hw/semihosting => semihosting}/meson.build (100%)
> 


