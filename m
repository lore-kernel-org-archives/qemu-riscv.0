Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMEhU-0003HA-G6
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 15:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEhT-0003EX-E5
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:18:07 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEhR-0000NI-N9
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:18:06 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 u26-20020a05600c441a00b002f66b2d8603so217478wmn.4
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 12:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mwr1Yoc3bVTYdXxpaf6LJnSTfObUZol8Xm1fU5QuNxI=;
 b=w400k2o6lHjrwT+TkBkWnGbh4Krs2aLXvHm6k75S79gEXkZGkwnX2bFAF2PJeMlGCI
 23UNO30AgO8BPKy2uPG668WHjz+Nq5/Ye4k8JLdie28GoQ+EVFJWL9ly6CpQ6KUs1DI5
 0Z+jvwZZboghaJeGceT5OFrm85MUbsBJn7UFcDtd7duLjpcwAY//mIbWubz0o22F3WkN
 D63/dlpBKpJpto4+e28TwRjnuMc1mAkdRbLmfwyTNKBCfMGTxWIAFbpvyJnk12YEgehi
 h/2/dN7HwT2DppvYgVdrNlTcravAcQ4av+9tYoSMYuLJsUfRrO2uBO3PiATnDE/X4s5M
 QQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mwr1Yoc3bVTYdXxpaf6LJnSTfObUZol8Xm1fU5QuNxI=;
 b=XwPQ6dbRRuqO2vVSmcF5ivdd9cP2zbBhi+LiwXrREewBntQQMloD+IEuHk+TNXHj9k
 SgOrxKbww3K3xatqEdJ/AD9TnqdMujAliEvJNXQRKbU28D/TSmpeJfrgusp7e+F+dKP4
 FcR0UoYWC73TfvvmrhIsE9/zN9EzAKowvZJbDDJsMKdQ3PeWVugoT2N5lY9bfGz25xF6
 sWCLWm8BUyC4b3/+ndI4icS0/MbclNdu6YT9h+VVM2RGbdrCJMZKPjZlFWlyEg/2sQk/
 4zwRMqMYIdpi943OSAKJvSaPgf0WOJqBjroKxoFIA1Jbu8HhTzXoC+f0IeUvqVzeAeF2
 0A5A==
X-Gm-Message-State: AOAM532arTar2zI9/CBN/IIjO8Kioibu1beqH7yE5OCzrND24VYBd3TD
 nIKH5RpxVb1Lj0qfoxQe/AWf2A==
X-Google-Smtp-Source: ABdhPJwQ3gZCrEXPdMJYk/Bm39evMzefh2l2IUEvax/hAwykjBNjEZ/gq0NeV7WE1Z8V4mOmioz4Ew==
X-Received: by 2002:a7b:c451:: with SMTP id l17mr336740wmi.74.1630696684366;
 Fri, 03 Sep 2021 12:18:04 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id n4sm104894wro.81.2021.09.03.12.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:18:03 -0700 (PDT)
Subject: Re: [PATCH 15/24] target/nios2: Restrict cpu_exec_interrupt() handler
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
 <20210902151715.383678-16-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fd02f869-16e4-e8f2-5389-68ffe96a3969@linaro.org>
Date: Fri, 3 Sep 2021 21:17:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-16-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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
X-List-Received-Date: Fri, 03 Sep 2021 19:18:07 -0000

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/nios2/cpu.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

