Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMG9N-00081u-Ex
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 16:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG9F-0007wA-9M
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:50:55 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:41556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG9B-0000IT-6l
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:50:51 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so369419wmq.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 13:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yepslUEHvjRRjLKdVvdi3rkpY9efahI4a2fz/vTn6zo=;
 b=Euo9+It8JqFOxFty8/PcgMF4vbgKDEBzjI2LOrYoIo1CoPGfa9a2XW/KXN8NqvsAHA
 xqWAiiLxgyG0IZgUKTdzVkguHhVEMcQyUaNWs+ptkc0AsareiOvNg7D5INFRIKWbvlfZ
 tnYHddqsaN8wN8NpVOdBg266nkRzRMG45OjXdKHrQPeW8+AWpuQ3VO5w6qu5DGWiR1Qt
 eukwl6p6WyeIQ1nEkt9Ne+q5S5MZ8G9vHTf6Jfs5SpFE8ngbYQbO09IXBc3nLsWeMDwt
 AM8g62JZLX3Ozrsgiukn3E1pRg64H4TPhK3aW81r+LCVHgWlL9vAhdksUm5k2iomh/HA
 8fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yepslUEHvjRRjLKdVvdi3rkpY9efahI4a2fz/vTn6zo=;
 b=VFLBDnzHXd7s7FQF/QDrYNqLgQpEmh40TODoSp3s5XAEH9pAaxqMVAA6J4PJ2CiLVG
 uuQ7IgFIh0zBJo7c74p5pCpUaF6PekiaMqqMlowdGENIzGLRp22fHErk1v0cmHl8q6Ja
 7lN3g0zBCtLfyp5Kbdmg4P/D+InEWnPU26TFjRghq5VXNwI+2nVLoKdrpiyC6cC0nl6p
 lxrQa8eDYWJdpOz67/rh9KPWUudQ0L3m/C+DVl/GuQ3N8E3e7wSaR1GLJibx8QXnjsim
 YybWqqc29kNaHpcDM78TJtnlmS8+mAcucuzPVsjyRv6Wye1zx75gHBlibyTdD7z7LnLo
 9mvA==
X-Gm-Message-State: AOAM533XSD/O7vnxUiDxnxEBPiIDuDRvVZSHJ5s91HcfJC8hlRM+LcUV
 sgTLdlzblDIILS6T6dQmd4b5ZQ==
X-Google-Smtp-Source: ABdhPJzmfIc5AxFo7ZoehIQ3L6a3OS/2e3HXK5dNoY+eEKwy0JdySAUNP/uPGEvzYqNqOm9N9fLVuA==
X-Received: by 2002:a1c:3542:: with SMTP id c63mr516907wma.68.1630702247474;
 Fri, 03 Sep 2021 13:50:47 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id o7sm319872wmc.46.2021.09.03.13.50.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:50:47 -0700 (PDT)
Subject: Re: [PATCH 08/24] target/avr: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Warner Losh <imp@bsdimp.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-9-f4bug@amsat.org>
 <b6ccbd42-8286-6a27-7bd9-e0b1ff3e96d9@linaro.org>
 <a675fd4f-0d8d-b833-1784-c9b77ae5f332@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e329d2a3-7960-9b2d-320c-ea1304972da7@linaro.org>
Date: Fri, 3 Sep 2021 22:50:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a675fd4f-0d8d-b833-1784-c9b77ae5f332@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Sep 2021 20:50:57 -0000

On 9/3/21 10:47 PM, Philippe Mathieu-Daudé wrote:
> On 9/3/21 9:12 PM, Richard Henderson wrote:
>> On 9/2/21 5:16 PM, Philippe Mathieu-Daudé wrote:
>>> Restrict cpu_exec_interrupt() and its callees to sysemu.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>>> ---
>>>    target/avr/cpu.h    | 2 ++
>>>    target/avr/cpu.c    | 2 +-
>>>    target/avr/helper.c | 2 ++
>>>    3 files changed, 5 insertions(+), 1 deletion(-)
>>
>> Well, avr doesn't support user-only. So... probably any instance of
>> CONFIG_USER_ONLY is already a mistake.
> 
> Maybe we can rename the disassemblers[] array in meson.build as
> arch_definitions[], and somehow (?) poison CONFIG_USER_ONLY on
> targets where only sysemu is supported...?

Seems like too much work for too little gain -- there aren't that many targets that only 
support sysemu.


r~

