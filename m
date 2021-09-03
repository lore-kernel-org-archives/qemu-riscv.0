Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMG5x-0000CF-C6
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 16:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMG5u-0008Qg-4D; Fri, 03 Sep 2021 16:47:26 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:42967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMG5s-0005vT-DI; Fri, 03 Sep 2021 16:47:25 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso343693wmr.1; 
 Fri, 03 Sep 2021 13:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7Z/eAs8sVAWlLVGUFtlGgI8WaRQ2xmlqcdP/z9+qniE=;
 b=feEecvKXaGFJJXkRI6qXEHovs73FL8d9gxq/b3ZS5wDin3Yp5ON33DgpFsI9szO0wB
 8RZ+u4NJXQptwT7PB2JKlaL9IKeUMNw+IXsTLfvwJF5RSDNFSce4zbiFIrgDqNbJKsMj
 4Jqr4f+249W2GD3HmyyW8StOJeqtqYz9guCeYbCiqSmLLYyLlWBpbtG4eYtKnXnftYBT
 Hv6UeT4M5XXnvRWYfnSiFXagOWGo2K05ccHosGJHz4NeOLvO8L+rmW9KNezE1NFOUgQ2
 XJb8DkPes1HbGPkN5NpK3WBtDzrj32ACjMr42yGprDrc2SQ4fZx0euBlMmvuMQIMY/aV
 7ZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7Z/eAs8sVAWlLVGUFtlGgI8WaRQ2xmlqcdP/z9+qniE=;
 b=tpYsVxr22sNOWBNn2cTRqmXJgJuEZVNebJ6Du4/l3kmxwSTjeKU3RNaX6v7B1aoqe+
 OpB7iiLJVwn4NBYyae6C2Xi9wwGukc8Y5MHOcwQKw/NpNC0QTJYj7n2jVJQEhLemDimE
 vMyDsgMsdyUQgKdW3EPlO1QLQRfd1MSQjFtBEivdHWMNcRE1KSkhEgESDD0Ol1ULenRW
 cJ35cafwFKYbd+W6PICSIYTkvXgFMiEwXsgRDoWlIzC0F9bn8mP9cdbgnr9s+M56wqPw
 EmBqUjllUotBngITmOhEPl5y2Wo0pyPHJj0JP6fh/FFTqqnvmVATcIxnmh+Sq9PoTMks
 dArg==
X-Gm-Message-State: AOAM532TWuXuO1UnbLElMbIsKqBAor5hG+AtHe1L3VK21skE4LYKItnO
 Dy6vURvBvGUkga5B3oWjwWo=
X-Google-Smtp-Source: ABdhPJzWq+7dYCO9SidHB0H631kzz1VlHCJoNGe2WkmASwbDNQ9YSZQ0s59jI0Jf95/Qi/FwcTQZWQ==
X-Received: by 2002:a1c:4682:: with SMTP id t124mr538600wma.168.1630702041945; 
 Fri, 03 Sep 2021 13:47:21 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id b15sm316840wru.1.2021.09.03.13.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:47:21 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 08/24] target/avr: Restrict cpu_exec_interrupt() handler
 to sysemu
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a675fd4f-0d8d-b833-1784-c9b77ae5f332@amsat.org>
Date: Fri, 3 Sep 2021 22:47:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b6ccbd42-8286-6a27-7bd9-e0b1ff3e96d9@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.888,
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
X-List-Received-Date: Fri, 03 Sep 2021 20:47:26 -0000

On 9/3/21 9:12 PM, Richard Henderson wrote:
> On 9/2/21 5:16 PM, Philippe Mathieu-Daudé wrote:
>> Restrict cpu_exec_interrupt() and its callees to sysemu.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>> ---
>>   target/avr/cpu.h    | 2 ++
>>   target/avr/cpu.c    | 2 +-
>>   target/avr/helper.c | 2 ++
>>   3 files changed, 5 insertions(+), 1 deletion(-)
> 
> Well, avr doesn't support user-only. So... probably any instance of
> CONFIG_USER_ONLY is already a mistake.

Maybe we can rename the disassemblers[] array in meson.build as
arch_definitions[], and somehow (?) poison CONFIG_USER_ONLY on
targets where only sysemu is supported...?

