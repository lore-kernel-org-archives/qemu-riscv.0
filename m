Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNkRM-000454-E3
	for mharc-qemu-riscv@gnu.org; Mon, 15 Aug 2022 20:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkRD-00043o-PG; Mon, 15 Aug 2022 20:28:07 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:37376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkRC-0003Mc-44; Mon, 15 Aug 2022 20:28:07 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 w11-20020a17090a380b00b001f73f75a1feso15926570pjb.2; 
 Mon, 15 Aug 2022 17:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=UZ0PWb4u/K3MzceaxSR1BScumNLvE8kHzwOtMREmTuo=;
 b=RWkFrrdcHYJa66lIaUgsy50J9RhRqF3vnBuJfqBW1iESoZXM5YNSktSk1JgBWffIP8
 ZUZ19vWozNkF5M2Bn8008a0I2TQNgAAQCWAp+Jq6EhV9r9iUT/hD27E3Rbh8yjE/OT9e
 c26mwBEvvn/4/umhmvmbV1aHeb35YSCR+oJ156tJbwTmau8fyA7xt61EGIJv2WSMRl3d
 9kBMiduz3hrbLiVMOf+bsXlDk8GNku8Rlmur3IXnsnqabtEFp4NOBvMdg9nmmbLRJcTg
 E5EYENG7RFOeSlmXe44SS3SQOyOmkJmdFyNgGVtkOAo7TV5wK561+AO8k1920OU3cB1U
 o8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=UZ0PWb4u/K3MzceaxSR1BScumNLvE8kHzwOtMREmTuo=;
 b=yPSDuaALqSP3HnFovNDZhKCCEiXG8LWfRoqqTbjju5PJCcuF7CkmPqc4pZJwKYlx7B
 NqxctpIZyg2YpvFPliF1W4DXecwulOm5nIA4U8nkqEurFyvIz8YFpwAYDEq7Bez5MNy+
 vEYrZ/eEAd7MQKXY6+ajWA0EB9jS1FvKi0bXnLKRRUacpTS/TrU93ZEI3mx6OnM+3vMz
 XOuA7qWi+3rqtSOa/I1+fkXVx1tk5QWH8lSr80vpSEDWss5JnDWySXmyD1VicdIikxBF
 CqfHmMenSQU542Sg56xpP6AhBBdTFIGVeROTb5HMMAku7NZa2Wr9HvtQiFDWW2AWTeuZ
 TmsA==
X-Gm-Message-State: ACgBeo0UKFl3A7ZMky5aGaxye7tSJ42s19+iv8MgqmVCsPIYB0Ad3xC6
 PcJjfhYi2g3WLFzQfdr5xVE=
X-Google-Smtp-Source: AA6agR6quOOU+hp1ifQSRZAEBAsmZjPTksd30w+I5QhsTo3pTIm2BSlOxHVw/cTcu27bjCe4MQacfQ==
X-Received: by 2002:a17:90a:d982:b0:1f5:49e8:7803 with SMTP id
 d2-20020a17090ad98200b001f549e87803mr30015124pjv.173.1660609683679; 
 Mon, 15 Aug 2022 17:28:03 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a1709026ac800b0016c5306917fsm7556853plt.53.2022.08.15.17.27.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 17:28:03 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <25c03df9-8454-5283-9d56-21fb18ad9975@amsat.org>
Date: Tue, 16 Aug 2022 02:27:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 1/7] semihosting: Allow optional use of semihosting from
 userspace
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Furquan Shaikh <furquan@rivosinc.com>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
 <20220815190303.2061559-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220815190303.2061559-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Aug 2022 00:28:13 -0000

On 15/8/22 21:02, Peter Maydell wrote:
> Currently our semihosting implementations generally prohibit use of
> semihosting calls in system emulation from the guest userspace.  This
> is a very long standing behaviour justified originally "to provide
> some semblance of security" (since code with access to the
> semihosting ABI can do things like read and write arbitrary files on
> the host system).  However, it is sometimes useful to be able to run
> trusted guest code which performs semihosting calls from guest
> userspace, notably for test code.  Add a command line suboption to
> the existing semihosting-config option group so that you can
> explicitly opt in to semihosting from guest userspace with
>   -semihosting-config userspace=on
> 
> (There is no equivalent option for the user-mode emulator, because
> there by definition all code runs in userspace and has access to
> semihosting already.)
> 
> This commit adds the infrastructure for the command line option and
> adds a bool 'is_user' parameter to the function
> semihosting_userspace_enabled() that target code can use to check
> whether it should be permitting the semihosting call for userspace.
> It mechanically makes all the callsites pass 'false', so they
> continue checking "is semihosting enabled in general".  Subsequent
> commits will make each target that implements semihosting honour the
> userspace=on option by passing the correct value and removing
> whatever "don't do this for userspace" checking they were doing by
> hand.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/semihosting/semihost.h | 10 ++++++++--
>   semihosting/config.c           | 10 ++++++++--
>   softmmu/vl.c                   |  2 +-
>   stubs/semihost.c               |  2 +-
>   target/arm/translate-a64.c     |  2 +-
>   target/arm/translate.c         |  6 +++---
>   target/m68k/op_helper.c        |  2 +-
>   target/nios2/translate.c       |  2 +-
>   target/xtensa/translate.c      |  6 +++---
>   qemu-options.hx                | 11 +++++++++--
>   10 files changed, 36 insertions(+), 17 deletions(-)
> 
> diff --git a/include/semihosting/semihost.h b/include/semihosting/semihost.h
> index 93a3c21b44d..efd2efa25ae 100644
> --- a/include/semihosting/semihost.h
> +++ b/include/semihosting/semihost.h
> @@ -27,7 +27,7 @@ typedef enum SemihostingTarget {
>   } SemihostingTarget;
>   
>   #ifdef CONFIG_USER_ONLY
> -static inline bool semihosting_enabled(void)
> +static inline bool semihosting_enabled(bool is_user)
>   {
>       return true;
>   }
> @@ -52,7 +52,13 @@ static inline const char *semihosting_get_cmdline(void)
>       return NULL;
>   }
>   #else /* !CONFIG_USER_ONLY */
> -bool semihosting_enabled(void);
> +/**
> + * semihosting_enabled:
> + * @is_user: true if guest code is in usermode (i.e. not privileged)
> + *
> + * Return true if guest code is allowed to make semihosting calls.
> + */
> +bool semihosting_enabled(bool is_user);

Per the description, possibly rename as semihosting_allowed().

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

