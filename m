Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMEZU-00041G-UW
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 15:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEZL-0003y7-4G
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:09:43 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:40914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEZH-0001tu-JX
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:09:42 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso201437wmc.5
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 12:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d2f3Ph/ntZxA5OIRFxM0NkPVcVIY7tJmN/5TzZTd+sw=;
 b=ptIeMzygBxniK4GFmpcdybITkROV8gzJ4bJ66hTihivE0KlfgILn2EK5lgfZko1vzS
 AZU7M6XEvHTEP3XfbINTOCIUJXPyCoS2j0xmJAnAbGMTNN+EZTamV9nfrcXIQPPBkG/r
 udWjS8bAZh1BuA7YCmQfzsiWImJNERh/N8u41eDTGdad8At+UacNySmIiDIEZ3KhiPbj
 Zja0vxJ74VFq+10e2V6Ff/sogjSjtNfXuXe5QTYZbTkt0leKvto5SXf3lKefK9yJr9ZE
 zQdONd0+wKl+aAj9hTCqZPTrHql3AeqlLojRghoYTgiH+nXU34VYFB+bOW/IQhPzTON5
 MEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d2f3Ph/ntZxA5OIRFxM0NkPVcVIY7tJmN/5TzZTd+sw=;
 b=D12r6iDxC24zje8lBjlTj9PWyowrff7LDpJcCe0AQ+rhpa6TGgoXCJdxZ/Kl5lW8Dx
 ZQt1MipdMDdXhyxgHMfHL8L3qwUQBqfUKEESREgNW79A3wp7eNsdBaM7+rUNI4ifeQQY
 0Zorr7O6P4m1XP6/Ps4vvlZL2BCX9dDF1uqvatPVHQuKxcIByC1KTsm+IZm5FUHgHT8N
 OrYkAmqTWEyQrdxfIqBwonz4MdklcWeKVcrVXu+6eV0Z8qfrj2/Qw9bc75sMPzH/fYHw
 eJjNapNKnTQoIUZZpDXSL/XfAPKhjzPEpPPmHorIe8qLsRYhtLIycDm88O9zqcP1w8fF
 8qlQ==
X-Gm-Message-State: AOAM530FlJF8yXo9R+wCu/PJiruYrV6uV+JoaIH1X2R5ljAf1VXjvuMO
 y2FDdeTI8l4jT6hu+ILocYANuA==
X-Google-Smtp-Source: ABdhPJyPSGdqaPC89X1tU7ouxlCf3esrACwEZC/VxyJjnG9yZ4kOF0/wkw3nEbZFncfKHsPtusP2qw==
X-Received: by 2002:a1c:a5c2:: with SMTP id o185mr314671wme.34.1630696176482; 
 Fri, 03 Sep 2021 12:09:36 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id c4sm220491wme.14.2021.09.03.12.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:09:36 -0700 (PDT)
Subject: Re: [PATCH 06/24] target/alpha: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Warner Losh <imp@bsdimp.com>, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Chris Wulff <crwulff@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost
 <ehabkost@redhat.com>, Marek Vasut <marex@denx.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Greg Kurz
 <groug@kaod.org>, qemu-riscv@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-ppc@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dc88952c-68ac-db70-a01d-212e66576888@linaro.org>
Date: Fri, 3 Sep 2021 21:09:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
X-List-Received-Date: Fri, 03 Sep 2021 19:09:49 -0000

On 9/2/21 5:16 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/alpha/cpu.h    | 2 +-
>   target/alpha/cpu.c    | 2 +-
>   target/alpha/helper.c | 5 ++---
>   3 files changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

