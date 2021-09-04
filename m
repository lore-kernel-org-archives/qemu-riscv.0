Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMf3A-0002ky-CT
	for mharc-qemu-riscv@gnu.org; Sat, 04 Sep 2021 19:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMf38-0002hR-KE; Sat, 04 Sep 2021 19:26:14 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMf36-0004Hr-Uh; Sat, 04 Sep 2021 19:26:14 -0400
Received: by mail-wr1-x430.google.com with SMTP id q14so4014670wrp.3;
 Sat, 04 Sep 2021 16:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D7kizWc2z0WcIB/d06SPHJ60XtO1gjqH1zrp9t9Gx+Q=;
 b=P0cZnL64Wa9HoAEcMMyjCEzOsK8k9nipDnHnVcXfN91sleHi64dU0U9uJCDqkTUHr/
 FHHJCDHYppHWjZF+hIPUut7IcUEZkmlPj+FqqsndUOs3UliC/TDAIj7E++mw4LrV+bAe
 RCYpc4B/6y3CTzgZkt7O3l7z+dJ/G0TMlDFQhty6sfeSXZQsPgsthboEtlQ8/kjyK1XI
 MUNAg5r7eu9zp2BlrLqTRfRXavw7gZYdVFixxBUjF2td0My/Ow50RY5zRDEdRW+qOn4p
 rESaHzLXk/ZZvvEN24+FJm7AP9+yI6IyVotGJM2twLPCt9pgb+XnPydn8Tu8ZcfFdXqq
 GH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D7kizWc2z0WcIB/d06SPHJ60XtO1gjqH1zrp9t9Gx+Q=;
 b=lY0PQWVTFs2ZQNdZexTzBRso6nm+i5qnm25Ovhe99LcJIg5BV8XsteQ4+XyGSN3AW0
 GxmRVfEBsQCaDrVhopzfSl8rSXCv+L4LkCGJUQt67kTg87wzb/AljZLAfHBMICj4GISE
 uYoQSBeuy4uqL2HyNpHAQA1ZhbYJAKe8E3AYyQDTbHXfRiDRoqAHN2C+Dis5k5xXck22
 fzHFS2ZM9PmtsCrSBa6x4juT0z8mqo5nYMfFhmvwHeC2w87XB+Xo6VRQb5FNPDei9lfT
 MF0NiMmpRDWFE3vNvvTXBuaxsrh0BGMHTbdjlNN7wwUlhf4S6x0CUQtPMGPQH3LiQgrU
 SzaQ==
X-Gm-Message-State: AOAM533kcsupbqHE5E0R2ZtgE80xghvUYB1/7ukV7wnq9fWDPK1dqfDP
 u/4Y8wbpy3/M8iR/9ztJAhg=
X-Google-Smtp-Source: ABdhPJykzKTmUvP1H0u8EN+3IOpHh/6AlQo2cD/MpinBIdHr4rXUOVOjhLmGtuW8ZUtsIwu4gd36/Q==
X-Received: by 2002:adf:8b03:: with SMTP id n3mr5631365wra.439.1630797970685; 
 Sat, 04 Sep 2021 16:26:10 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id n4sm3376333wra.37.2021.09.04.16.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 16:26:10 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [RFC PATCH 04/24] accel/tcg: Rename user-mode do_interrupt hack
 as fake_user_exception
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
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
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-5-f4bug@amsat.org>
 <d813a7f0-95d2-e859-a8ad-c097c7654252@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6d7ef009-2970-c8f2-624f-4d5d720980d5@amsat.org>
Date: Sun, 5 Sep 2021 01:26:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d813a7f0-95d2-e859-a8ad-c097c7654252@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
X-List-Received-Date: Sat, 04 Sep 2021 23:26:14 -0000

On 9/3/21 9:07 PM, Richard Henderson wrote:
> On 9/2/21 5:16 PM, Philippe Mathieu-Daudé wrote:
>> do_interrupt() is sysemu specific. However due to some X86
>> specific hack, it is also used in user-mode emulation, which
>> is why it couldn't be restricted to CONFIG_SOFTMMU (see the
>> comment around added in commit 78271684719: "cpu: tcg_ops:
>> move to tcg-cpu-ops.h, keep a pointer in CPUClass").
>> Keep the hack but rename the handler as fake_user_exception()
>> and restrict do_interrupt() to sysemu.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>> ---
>> RFC: Any better name / idea here?
> 
> I guess I'm ok with fake_user_interrupt.

I can use do_fake_user_interrupt (closer match to do_interrupt
equivalent). Alternative name is "do_interrupt_user", same as
the handler:

/*
 * fake user mode interrupt. is_int is TRUE if coming from the int
 * instruction. next_eip is the env->eip value AFTER the interrupt
 * instruction. It is only relevant if is_int is TRUE or if intno
 * is EXCP_SYSCALL.
 */
static void do_interrupt_user(CPUX86State *env, int intno, int is_int,
                              int error_code, target_ulong next_eip)

> But I believe that this could all be moved into cpu_loop.c.

I tried to give it a try, but seems out of my comfort zone.
I'll create an issue to do it as a future cleanup on top of
this series.

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks,

Phil.

