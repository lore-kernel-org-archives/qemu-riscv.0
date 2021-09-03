Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMEYm-0003Qy-FK
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 15:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEYd-0003M3-8m
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:08:59 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEYa-0001Kk-Ee
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:08:58 -0400
Received: by mail-wr1-x42b.google.com with SMTP id i6so118359wrv.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 12:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bNawZA+iiFWKHVH1C9qcUdpIzLY56k93AuR3hOCtsAQ=;
 b=blyy2Qcq3ys7NOCvDyC8LIH2WNtvRXNUBgIwD/R7GSOUVE9wYVoYzHJGPK69ZYwCjA
 /S+Qc9/SdTZlxmOIBExVgufjoLdFU4+jgy3FXzLa4+tyhGho9wBXZlcoEIVwOUJFCD3F
 mgy63j0TY1qxnocUld0trkmVqpIKL6cVxSttgmPwtQl51Hg/RP9gK747OSfHVrizYbwd
 Micckh16om7iN2OIXLNXwMa3zoWgNLx3sBg5GepSQ4b151h1FUxRi90O3ywDB1/4Zeef
 /aU+BgTBjwOp+y3dNUFgFNT0evBnmbIcdE1aMrJjbf676wCa7Jm/8Lc4P/eQjyPluN1U
 eAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bNawZA+iiFWKHVH1C9qcUdpIzLY56k93AuR3hOCtsAQ=;
 b=i4o6lsGx93wfzc1wf52alKhz5NIOaLGmIZ6HnqzlEOGPUGTGVW4+2x1TSpUZY4uJpT
 3YnKA8op85RPrRdP0/AonUU5W4RQbzeM9sfq2pz1NxyyEXEbpJhsA06drN3nUypxCVLs
 FR38LWz2OBIDa3f18qG73Ede+GkgyOTthT4QNBqDXY//9tDavcpb+zF8QP+LwVCpkr2v
 eIB4k7qldVjbEhAoGUQFmLnCJDCMh6rsQsxC0mZRjWdGgcI8NYv3fmdgW0asNeuiCOQ6
 JQlINM6xMwKZ70gdC93HbSTVcqMS8mx3mQWgs3B/GMtQOnUphaPbUcHt7N9eI5Nt9KsQ
 Eong==
X-Gm-Message-State: AOAM5312x8/MCRt0Nv+ieFOWZ6cnnmOcPqw7Rxj09dGd+cjdt3z3GeLh
 51F0v4zX05j4msMbNoPNGvQmGw==
X-Google-Smtp-Source: ABdhPJwGy4Hl0Kp/sF6gZVGlrWRB35x93Jy2sQjV6NpFST12HsjPqu1badXhKkBnspeVECad2SVmOQ==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr543312wrz.369.1630696132260; 
 Fri, 03 Sep 2021 12:08:52 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id d24sm166620wmb.35.2021.09.03.12.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:08:51 -0700 (PDT)
Subject: Re: [PATCH 05/24] accel/tcg: Assert most of cpu_handle_interrupt() is
 sysemu-specific
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
 <20210902151715.383678-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3ce44beb-77a0-30dc-d4fa-9c47865e86e9@linaro.org>
Date: Fri, 3 Sep 2021 21:08:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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
X-List-Received-Date: Fri, 03 Sep 2021 19:09:00 -0000

On 9/2/21 5:16 PM, Philippe Mathieu-Daudé wrote:
> To prove TCGCPUOps::cpu_exec_interrupt() is limited to system
> emulation, start by asserting it is not called under user emulation.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   accel/tcg/cpu-exec.c | 3 +++
>   1 file changed, 3 insertions(+)

Eh, sure, I guess.  I meant this merely as a diagnostic aid.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

