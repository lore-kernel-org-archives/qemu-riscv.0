Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMEOf-0002EP-GG
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 14:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEOe-0002D7-3v
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 14:58:40 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEOb-0001bo-Fy
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 14:58:39 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n5so42068wro.12
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 11:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oiQhN56lFLrpiH+pj4hs61ZfHlqK9dWLRHv6bDRQQ3o=;
 b=hdjjVASnZZts2OG7YHVPHgtc8QfF0KuyagkDs/eVxx+VOavJ//AGXGdwM4qpXoGkEq
 PnGw/DY/AuXGdUwcIdWhDxghCmBJaalDAduseAtNYOzeCN6yybQDoJQS6Z9flKcFTgEc
 EYC8VV6HP7BCZnAb0Vv7Et1S0lLvT88u5Z/9td1B4ZaenkNn1gy1ozkUU49DejP6J2qf
 tS4ke5eGtX4QM0DPUx9G1XM5qOo+wn51YNL+vvG4chwAOEg7qAEMHN0twScb9aFxOfbZ
 2DU6fBm/wl1wXvTirJGOlrG2B4tYdXhnFTz3nAOTiFd4wy+ZjCoRdCi6Xs1NdLS7xkjb
 0C9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oiQhN56lFLrpiH+pj4hs61ZfHlqK9dWLRHv6bDRQQ3o=;
 b=ZWgpfBAAoTQSQ5alEnG84rydF5ETaakGE3WyNM6CJaiM/HxTGvQTxIg+7F0iXtJh70
 hdN3Ce4396FNyvKMfdbxb237gXPpRMVGLW7io98dk2VFGm5/6tMlhFCEkYgIAeh44XK7
 Wmw2HSWKwX/Wxttjo2HuRQYbuzMWrQeGXPtcvKrz5dhnm8L/oW1N+h4Jsi459UTSUX5N
 yetF5GAkVsxh62eQFQ0Fj+5D8u1yi70j9eR2zj87Vj23kz2Wl0JiakuSAw1NVKn3maEU
 gGfo2gkMCWfuV4jI8DGzvADTqHG2dOlbhsKd0Np3ODvXvGDPWhCdkIcWsbI21xwjIlnV
 GrwA==
X-Gm-Message-State: AOAM531B0aFem/HHl7oyA4EIrBUY1BI06b/OvmAQrzQG9ItBun5LTozM
 GKLDYljTmcThTZGxAqf/uhTuKg==
X-Google-Smtp-Source: ABdhPJyYKs9kd4TFRynfDKiqHeE7P1s7loWOW4V9Ekvw6vHW+eCtG+8pBQ2WAHsgmlfBId3J7dQXqw==
X-Received: by 2002:adf:e604:: with SMTP id p4mr544447wrm.37.1630695515977;
 Fri, 03 Sep 2021 11:58:35 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id l17sm82167wrz.35.2021.09.03.11.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 11:58:35 -0700 (PDT)
Subject: Re: [PATCH 02/24] target/i386: Restrict sysemu-only fpu_helper helpers
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
 <20210902151715.383678-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <80295f1a-2156-5866-0208-a29e1b9ead58@linaro.org>
Date: Fri, 3 Sep 2021 20:58:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
X-List-Received-Date: Fri, 03 Sep 2021 18:58:40 -0000

On 9/2/21 5:16 PM, Philippe Mathieu-Daudé wrote:
> Restrict some sysemu-only fpu_helper helpers (see commit
> 83a3d9c7402: "i386: separate fpu_helper sysemu-only parts").
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/i386/cpu.h | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

