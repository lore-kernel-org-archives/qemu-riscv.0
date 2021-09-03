Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMEXT-00020g-Jm
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 15:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEXR-0001xr-S3
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:07:45 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEXQ-0000Oe-6n
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:07:45 -0400
Received: by mail-wr1-x42c.google.com with SMTP id g18so76842wrc.11
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 12:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0NdsLuVFQiOXh+Ug01/7WslzxoTyRGDqrkPMYYNKLu0=;
 b=bWrhcAwD+6e32H7526OPNojiGlKGcJsLcTVvThqO1xLUD1uPw62Z3Y1AbyViS4Wze2
 X65hjmzwUMCy6VRKnA87cj15qpRKSJFiozipKa3TQ9tITppTq4fZ0XG7ZtEAgsOTFzZA
 wGLemVO7gAr/R2IAMV4eGMGDAuR3ptVY4R9F/NYasgqY+c0wc0m5Mnv3uk9FvOkRybGG
 /ToWAZeZnCZSTRKs0gyPccVdnXpFYTulLbBv1EwFYXYysrOXs/zQ97vYdsV8TmgweA2t
 ztCzNgZN4mtZkSeq4h1CcjWPZcVDqQN8lnJAeqnjvOSyxI1tndJp2IBQo/13PeqiKgK2
 XLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0NdsLuVFQiOXh+Ug01/7WslzxoTyRGDqrkPMYYNKLu0=;
 b=r/ROYtZqlaRhupBDdQHKYdsE0FnwPWQbwpMRKnKCykkZUeNIaI8dd/j4yUqJf9BYrW
 2qI99P8Z7BSc3wI8X89DiwFy2Fqr2USB08q33ws5o9O0j4wEv+2rB4d4ZQ4Fb9kODXIH
 mD2PlV+U9h5hl1/1Ol7dz+5mlc3cXt7xe/6VGXHwU2MViiv5MP3DRVNskDkHeu/IQRah
 z+VANc5ftF3TCOsuDJ55tY84vySGMZ97m5+YatzNYHddmoq90+06d0aqUB88BuDpecmT
 xydiOJJV5XsxiQVLv++irjy9INstp6CzEHAL6AoFAFDiI/k/uoM8e1feEri3q2O6Y/3W
 W0kg==
X-Gm-Message-State: AOAM532fG9QJKU4YRwmRNY+VggosZCiAOUZZMbEZbWUEB4s9npn59RG/
 51Get2XzavvLgEmggluuQnAvOw==
X-Google-Smtp-Source: ABdhPJxloNzzm4PJWtjHU784wtarEtmUSN9VE8291iltjikP5Q4TnZYBNuteiG7sBpUDLjv8/UVYAA==
X-Received: by 2002:adf:f889:: with SMTP id u9mr599800wrp.67.1630696062529;
 Fri, 03 Sep 2021 12:07:42 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id l21sm168030wmh.31.2021.09.03.12.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:07:42 -0700 (PDT)
Subject: Re: [RFC PATCH 04/24] accel/tcg: Rename user-mode do_interrupt hack
 as fake_user_exception
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
 <20210902151715.383678-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d813a7f0-95d2-e859-a8ad-c097c7654252@linaro.org>
Date: Fri, 3 Sep 2021 21:07:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
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
X-List-Received-Date: Fri, 03 Sep 2021 19:07:46 -0000

On 9/2/21 5:16 PM, Philippe Mathieu-Daudé wrote:
> do_interrupt() is sysemu specific. However due to some X86
> specific hack, it is also used in user-mode emulation, which
> is why it couldn't be restricted to CONFIG_SOFTMMU (see the
> comment around added in commit 78271684719: "cpu: tcg_ops:
> move to tcg-cpu-ops.h, keep a pointer in CPUClass").
> Keep the hack but rename the handler as fake_user_exception()
> and restrict do_interrupt() to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> RFC: Any better name / idea here?

I guess I'm ok with fake_user_interrupt.
But I believe that this could all be moved into cpu_loop.c.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

