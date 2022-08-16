Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNkZ1-0008NQ-AK
	for mharc-qemu-riscv@gnu.org; Mon, 15 Aug 2022 20:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkYv-0008Ir-Kz; Mon, 15 Aug 2022 20:36:06 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:41492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkYu-0004W3-B9; Mon, 15 Aug 2022 20:36:05 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 202so7896521pgc.8;
 Mon, 15 Aug 2022 17:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=QE/9zaBaF5F3Z7zm+3XawoZwRFsR9FjiJhlar80nXaY=;
 b=GJ/E3j7cJvqHbAfvEiCmLtt/DKIol+QqbaqLtTQseb5KGVXUOC7mdcwXJEoeMYEBwi
 pssN8KgzzlqiS+1hopRozMbCi0OPgbBkqJ3am9KKqDZmRXb3POzhd8+pGXns7nTfmSSK
 6W3z53XAZ3yHOmtbD7TRgGX/0H/OmB9T+2+9IR6UKljLWteWYtRhdqJUE++ELu38PLAx
 MRKYf11QjQGQxv3EKNFF7iyCB0Ls+vDYd8XEf+AcHN859eKYDBQhug6eFJmpeaA49Mj4
 c2k9WBjQCxONt+/5uV7fvvCILe2SYDg0vcCEUmHLLnjGPAa2qujPoUBYyjUwFzNPfGAr
 zzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=QE/9zaBaF5F3Z7zm+3XawoZwRFsR9FjiJhlar80nXaY=;
 b=rwqumCpjyk2RaaaQhGkLCFhyvEDsUzaOCQkfDhg8w7UPViFdA2MYX6vZIhkz1euqVz
 zzab1BXTYVwe4H5C31Z/64CZqBfmzq3AyI+dvN5gRVDyXns9sqafEh3S2LKCKs8OHHKr
 XGg7UAPHX6lN0PvHO7RsRm/iz6Omxqor7Up9JluBcgXWHoMZhCR6/I/IlxEkG2t0s64Q
 ji7dX8WFcQewjg5f3QYtlidvQ+huu62M5RxSLt587FXdV94IxmRDP3vGN4xk15jB8HEE
 jljwOd9tqnGRDUSfbf/FN0429Z4D2Xc20qYn7L8dF7Q1jgxyRDO+M0j934a+N4r9sRWT
 Y/sQ==
X-Gm-Message-State: ACgBeo0IUF9LlbNRtfkS0p5vmTx1ncOrLBSgd+/5h+IwloLytrUu8DKX
 G0JgikeXrCVlWizp6AnCGtU=
X-Google-Smtp-Source: AA6agR7CCRrGYasklM4iFsXHXJzChnMwctQDqoOZKxc6zJCn3QybU7f/vpu5k/djBA+I8tQD8iFIYg==
X-Received: by 2002:a05:6a00:2409:b0:534:98c0:e53a with SMTP id
 z9-20020a056a00240900b0053498c0e53amr12159441pfh.11.1660610162312; 
 Mon, 15 Aug 2022 17:36:02 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a65614e000000b0040d1eb90d67sm6296479pgv.93.2022.08.15.17.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 17:36:01 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <5f5cc9f0-65b5-20dc-eba4-b6895a58de4e@amsat.org>
Date: Tue, 16 Aug 2022 02:35:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 6/7] target/xtensa: Honour -semihosting-config userspace=on
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
 <20220815190303.2061559-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220815190303.2061559-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52a.google.com
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
X-List-Received-Date: Tue, 16 Aug 2022 00:36:07 -0000

On 15/8/22 21:03, Peter Maydell wrote:
> Honour the commandline -semihosting-config userspace=on option,
> instead of always permitting userspace semihosting calls in system
> emulation mode, by passing the correct value to the is_userspace
> argument of semihosting_enabled().
> 
> Note that this is a behaviour change: if the user wants to
> do semihosting calls from userspace they must now specifically
> enable them on the command line.
> 
> xtensa semihosting is not implemented for linux-user builds.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/xtensa/translate.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

