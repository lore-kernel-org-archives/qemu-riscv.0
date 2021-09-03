Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMEml-0007BZ-6k
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 15:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEmj-00074d-L4
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:23:33 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEmh-0004zq-9X
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:23:32 -0400
Received: by mail-wr1-x42a.google.com with SMTP id i6so164636wrv.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 12:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ldBvNt8Gk/8FMytYbcH/BX1QrHuLB0k2DNw7Jz0vniQ=;
 b=e26LbhwA8iscP6BWFZ9FFnpq1zmSGFg0wJFZ2NidkSRm0CDTWjxHJtDX6vQbCMl/2r
 qMb5gwsTNFWTrMQwcPuTvZQgldAceh6MNB21h1O8xU/IrTORcb86tBgMgS2QQOGKFf+t
 IVBukE9Ii/SABkBGbVSrGt+J2vg9k9liA5ReDsrSSFsibzdL47wIjY5XJMXufJzuj6uQ
 YeQnA8o3R6O66Af2Z/wTY5Xb89RbXDXuD9ZtVlLfYuNleM3stM7RONTyzvqu0rqIyinP
 thQN/e7Zp0dIOuOsOrVa0BXWS+Uc30k/v2dMfBZt2WIabvQ5KNnfSuVum81y8XAzDIy8
 5Smg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ldBvNt8Gk/8FMytYbcH/BX1QrHuLB0k2DNw7Jz0vniQ=;
 b=TfcZnpq2D6Y53m7EMVSmjF8fhbjoBpzTo0l7axW3HL+3ZQrhGC3CoHUpDPniqQm6/J
 m8uHc45Xr+rKvUyOrRxZ3upbnKe/HjNDmajG8r0Q2U7Yx/jxeRecg1VOJUeiCZwNjcjA
 +QPBMSZFDs3MOYAbhFCnRir3x1t4kpgbfbTNa92kNQHPpH1yz6pk5a9MlM0V4TmjxVRe
 nhI1qtLOrxOZ2BHYQWPTupgIRaKgmQETBJTwp8Pc+C4xRqXjuHkbeBZKRJC6h9nFjL0K
 4UySMZCxcrovELcvLvl25JF/ZT5sCaPhIQa/ARUYsEBiJVw7S2gqkanwTd5eugi8+ykm
 85Lw==
X-Gm-Message-State: AOAM533N6QPOWI0jm+EjlARLObnL9ZaX3bwwm2hDMMxSJddFAzco8blJ
 osGVwz2eVmmGVYtBKzwirlWvdA==
X-Google-Smtp-Source: ABdhPJwQNxucDHobXN2MxoPwF0ibBF1KAZymqJBM1BD9PVrhyD1zNdUEp4qnWAs3Rap9CwQW7NWKpw==
X-Received: by 2002:a05:6000:10:: with SMTP id h16mr687491wrx.24.1630697010062; 
 Fri, 03 Sep 2021 12:23:30 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id u8sm241594wmq.45.2021.09.03.12.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:23:29 -0700 (PDT)
Subject: Re: [PATCH 21/24] target/rx: Restrict cpu_exec_interrupt() handler to
 sysemu
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
 <20210902151715.383678-22-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eb5dc779-b21a-acf0-9be3-3003331ae330@linaro.org>
Date: Fri, 3 Sep 2021 21:23:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-22-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
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
X-List-Received-Date: Fri, 03 Sep 2021 19:23:34 -0000

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/rx/cpu.h    | 2 ++
>   target/rx/cpu.c    | 2 +-
>   target/rx/helper.c | 4 ++++
>   3 files changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

