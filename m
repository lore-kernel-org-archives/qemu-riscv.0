Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMfHH-0007rQ-FV
	for mharc-qemu-riscv@gnu.org; Sat, 04 Sep 2021 19:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfHG-0007qq-Ef; Sat, 04 Sep 2021 19:40:50 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:42763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfHE-0005ZC-Nr; Sat, 04 Sep 2021 19:40:50 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso2120294wmr.1; 
 Sat, 04 Sep 2021 16:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7B1Tb7+LoNWIC6SLhDrpAAfzztMayZmtlKwX9VY86h4=;
 b=SZt6L1IQa4I2vUjhoDepUCUfey1oy5Pp0yK6+6HpFVagJ3vGh8eo7jj9UQPPDlj9qR
 4eFeYXCDp9Z7rCjdQviBJx0z6rJFUEfRowGmf+PjdZqF/mI952vGHNWEudUmX4v635Lz
 itC+wNbuNIPOXy+13uB9aB0BOu6TFQGyUV7Q+f6vPZMWfCIaGuCC5sZ6Lo+pyjNxgpM3
 5o2Dszj3OUzNXcgqyFxDRML4vfrg2eBCrZFz/q7YVZNLDSQ/yGKZeK1I/CYjkPleNH0d
 IiSTuOlmcxNS1qvPd2ZbcqXLQqm2DB+J5oVDfX11CC9s8DV2p/gvZ4qiIgYSbxP5+J1V
 7f4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7B1Tb7+LoNWIC6SLhDrpAAfzztMayZmtlKwX9VY86h4=;
 b=hJMqPwZQ3m0gkpsJyrzJMfzWaceO3xr8GXDsv4hmK2bNS8BzTCP3mrrwJ2A5xOmQS4
 qtvdWTJVnpRnRqZhedzuYXO15YIB4Gxs1cbnqYNX5J7DdHXWs0ReB+tpJYscLPHJfJg3
 xo9sPb/+0HAMuDDinJ4ZIOYm3bRbl8CcqA427LU/QnJbP0OskY69VovZ/WcZZqQPT0iJ
 xrq5eS87sWfKAmE4TnOr9yOMvsXDchwmHaUbzy74CAGLgIUFlxPLBm2RHYtZH1ReFHM2
 gSEUQkEcY4bQdTGXZhz03+8NE2AdqqWx7lqPdOIe6T5mF33h0BT/2YNgSabF49gNvobr
 DgKQ==
X-Gm-Message-State: AOAM533ODLoNn5womD0yZvan5oRwg1HJSKxwZE38oNfo15gavhSB8NQ8
 cTGMgHx13fPNoWSp76AxarI=
X-Google-Smtp-Source: ABdhPJy7WfYr79Zhc0QukuXTfF0s7AerxaKaLzDnWvd3yjpJDgkkkFRdP9ijcHZZKde6nTPj3uIZ8A==
X-Received: by 2002:a05:600c:4ed1:: with SMTP id
 g17mr678056wmq.193.1630798845652; 
 Sat, 04 Sep 2021 16:40:45 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id g11sm3297600wrx.30.2021.09.04.16.40.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 16:40:44 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 16/24] target/openrisc: Restrict cpu_exec_interrupt()
 handler to sysemu
To: Warner Losh <imp@bsdimp.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-ppc <qemu-ppc@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-17-f4bug@amsat.org>
 <CANCZdfrMm7dHn+g7V08xrk+JuWKBTVp8Q=8PaBGdSWx7z5ZrBw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f729f68d-3880-3aab-ee23-fdbcb126fc9e@amsat.org>
Date: Sun, 5 Sep 2021 01:40:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CANCZdfrMm7dHn+g7V08xrk+JuWKBTVp8Q=8PaBGdSWx7z5ZrBw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.832,
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
X-List-Received-Date: Sat, 04 Sep 2021 23:40:50 -0000

On 9/2/21 10:24 PM, Warner Losh wrote:
> 
> 
> On Thu, Sep 2, 2021 at 9:18 AM Philippe Mathieu-Daudé <f4bug@amsat.org
> <mailto:f4bug@amsat.org>> wrote:
> 
>     Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
>     Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org
>     <mailto:f4bug@amsat.org>>
>     ---
>      target/openrisc/cpu.h       | 5 +++--
>      target/openrisc/cpu.c       | 2 +-
>      target/openrisc/interrupt.c | 2 --
>      target/openrisc/meson.build | 6 ++++--
>      4 files changed, 8 insertions(+), 7 deletions(-)
> 
> 
> I'm not 100% sure about the build changes because my meson fu is weak,
> but they seem right given the rest. 
> 
> Reviewed-by: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>

>     diff --git a/target/openrisc/meson.build b/target/openrisc/meson.build
>     index 9774a583065..e445dec4a00 100644
>     --- a/target/openrisc/meson.build
>     +++ b/target/openrisc/meson.build
>     @@ -9,7 +9,6 @@
>        'exception_helper.c',
>        'fpu_helper.c',
>        'gdbstub.c',
>     -  'interrupt.c',

openrisc_ss is a 'Source Set', it is build each time the openrisc
target is selected (regardless system/user).

>        'interrupt_helper.c',
>        'mmu.c',
>        'sys_helper.c',
>     @@ -17,7 +16,10 @@
>      ))
> 
>      openrisc_softmmu_ss = ss.source_set()

The 'openrisc_softmmu_ss' source set is only build when sysemu
is selected.

>     -openrisc_softmmu_ss.add(files('machine.c'))
>     +openrisc_softmmu_ss.add(files(
>     +  'interrupt.c',

By moving it to the sysemu-specific set, the file won't be built
for a user-only build.

>     +  'machine.c',
>     +))
> 
>      target_arch += {'openrisc': openrisc_ss}
>      target_softmmu_arch += {'openrisc': openrisc_softmmu_ss}

BTW the user-equivalent of ARCH_softmmu_ss is ARCH_user_ss, and
is optional:

$ git grep _user_ss.= target
target/i386/meson.build:23:i386_user_ss = ss.source_set()
target/mips/meson.build:1:mips_user_ss = ss.source_set()
target/s390x/meson.build:34:s390x_user_ss = ss.source_set()

Thanks for your reviews!

Phil.

