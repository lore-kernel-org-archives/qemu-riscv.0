Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMEfM-0007WI-Pz
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 15:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEfF-0007Te-3l
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:15:49 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEfD-00070h-0J
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:15:48 -0400
Received: by mail-wr1-x429.google.com with SMTP id q11so111626wrr.9
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 12:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KRYtFSGfxSivzzPAIo1pOM/prDrQP3UYfUGodRXWQVU=;
 b=eo2pY2mSjpDvuzV4Ij+xyp2hFSe7F0mxdYJyx0m4DkSllMryyUrLNK34dhYaahpt1y
 ZpZvuNPOQmJ7fkwYNdn5r9uNC2MkgypyKdnzsxgHxsupjSqUGTA89kjpawIjJRAcZ6Nu
 RGeoEnreFxvXoBCFv/lqwuXge0iFgME0YVdnUEXUqKbGuOsM0yOuvKepgwu3CFMwZK7a
 HnTk5hHfLcrQWholJCQTjwen6rieyHxb0F2MA6gztN9vJUo33za1Ate8GAzHA4H3iSWB
 76+hxbZNzWngCv7hX/83Bz1vsFgYO8lX3m1Hwv2eZ8aJ5jg+7TtjbmtlMeckTw4DXKSS
 2FqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KRYtFSGfxSivzzPAIo1pOM/prDrQP3UYfUGodRXWQVU=;
 b=hALuZeuznrNQa75VfwcOw94JnBU7nKlFmpjL0TJRA7HrOmkMo/fmIxJMgffu0U7en0
 xTuxGZzHD/5MovNqVdsZ6PtmHQLlhCuaxniSzCmNXaFOA337RAlpgD5idqGm0GC8egLe
 8jYDB0zqKzWZTn7p43EVCEKOcveSrrEiKth3LGYUYygE3O3Z+jga2bmFYyE0+997TL6u
 TpKnMBDwnzhel8DR/JFhDxKOqVXLoKiecqreKu1BddVz23se7UBfhqQoJLcDzi5O+sij
 Rp5XoCV1lwI3+QA/NVXglvlJnIAlj64HAk9+0bCQ30ncJIVp/iIyGRdA+2QczvmQ3rMp
 TzWg==
X-Gm-Message-State: AOAM532QFNuu5PonKcKeIVRpqAS30pkZDz2amSO3w1tSHGmYkHbFt6xx
 AhQvwPYilVW+V1CNlO/kXwO0ag==
X-Google-Smtp-Source: ABdhPJzf5Lga1BvaWRxa/6kD4T8+6+aQA6HE39+CpWhcRfPdtMnYuxuCy85GE90EVeUSPyenQF45MQ==
X-Received: by 2002:adf:eacb:: with SMTP id o11mr606681wrn.418.1630696544131; 
 Fri, 03 Sep 2021 12:15:44 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id l124sm246312wml.8.2021.09.03.12.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:15:43 -0700 (PDT)
Subject: Re: [PATCH 11/24] target/i386: Restrict cpu_exec_interrupt() handler
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
 <20210902151715.383678-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9f3a806a-fa87-49f2-8aba-2cf3aeae0c1a@linaro.org>
Date: Fri, 3 Sep 2021 21:15:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-12-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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
X-List-Received-Date: Fri, 03 Sep 2021 19:15:51 -0000

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/i386/tcg/helper-tcg.h |  2 ++
>   target/i386/tcg/seg_helper.c | 10 ++--------
>   target/i386/tcg/tcg-cpu.c    |  2 +-
>   3 files changed, 5 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

