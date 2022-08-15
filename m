Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNggf-0008Hu-Od
	for mharc-qemu-riscv@gnu.org; Mon, 15 Aug 2022 16:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNgge-0008Fj-61
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 16:27:48 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:37512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNggc-0002Z8-Lb
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 16:27:47 -0400
Received: by mail-qk1-x72f.google.com with SMTP id a15so6016884qko.4
 for <qemu-riscv@nongnu.org>; Mon, 15 Aug 2022 13:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=UYWcVUCm8A4Zo1ovf15GFjMc5swI2yDbuMF4qzITRzQ=;
 b=lQG36e3Z9j1Fb8Sv3OiW9gqVl6zE0ARVF4wkOG87Q6QvUL+2O5bnhXqOY6mfnDql4X
 X1Xd9UVAmRlEIylsVbu4QaOmcZnt1tUkgshZ06VYYDe0mBA4BKxPyFwAtCTk0DZ0Mly5
 8Hh1kXRBWiz0KLHmpIxu+XyoHOenfD24GvftImzRsKFTwMwAvalpL6Wkc6ACS8aTos69
 F1anHL+nAiZn95IF1E8mFE5lHWXgpGyntMRSs98tNVqf2Gk4Z/vzBSs6FMAz91rnV1ob
 tnqnlnnGNS7dwEN0l6xBm39XxbDEQJC+yckIoqtXm/ZZOEIYU7Tci/AySiITK5N5kg4R
 oxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=UYWcVUCm8A4Zo1ovf15GFjMc5swI2yDbuMF4qzITRzQ=;
 b=gF+l0h7QPRp8rwxhn3t1KZAv5sajLDK2fBfrpaPHsY8gJEMc6UjIyzcVjy6JKvaayk
 dbvXM4raYQp/BouuQnKMsHdvRWYXMTZNSOtIVceYNMEdN7ZDQEhp1X6LCK0yWnQlEKPu
 uA8fTFjHn5ifj83X0c4FjoQF0eFcqLwdqg9FazXntv4Y34IWtA/rjqmA7557Rq+bp9w0
 0wVS/rQlqdIq/7mOxYXIqzGL3RTz09RyJK7ZgaRkYHBkukTv8/dgWSHSElpCptuMMj6u
 ZlfYzljmagVDAi3oZQxhSH/NF3C5ejqMYvZ+Ff+N7tHyP/KiR9Oz7p/7iMo9cRTuy2Ii
 amYA==
X-Gm-Message-State: ACgBeo1r7icS6/71mIkYP/IvvGSDJpByZP5nscB5u0Lgqnag41mwh9L4
 aGXu8SoKUStDDmIeVG6lS7KHLA==
X-Google-Smtp-Source: AA6agR50wn9lxZ+Wt4WE7D++3xd+SMpVO2LFQ5j/5lLSnI/BFQyDrjHONWbgFwo4iMSPe08xJqSlkw==
X-Received: by 2002:a05:620a:1426:b0:6bb:268c:1c67 with SMTP id
 k6-20020a05620a142600b006bb268c1c67mr4876535qkj.298.1660595265701; 
 Mon, 15 Aug 2022 13:27:45 -0700 (PDT)
Received: from [192.168.125.227]
 (173-11-255-51-houston.txt.hfc.comcastbusiness.net. [173.11.255.51])
 by smtp.gmail.com with ESMTPSA id
 o4-20020ac872c4000000b0033fc75c3469sm8309176qtp.27.2022.08.15.13.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 13:27:45 -0700 (PDT)
Message-ID: <ac44051d-ca57-a39d-90ba-d993efbcf924@linaro.org>
Date: Mon, 15 Aug 2022 15:27:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/7] Allow semihosting from user mode
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Furquan Shaikh <furquan@rivosinc.com>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220815190303.2061559-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 15 Aug 2022 20:27:48 -0000

On 8/15/22 14:02, Peter Maydell wrote:
> Peter Maydell (7):
>    semihosting: Allow optional use of semihosting from userspace
>    target/arm: Honour -semihosting-config userspace=on
>    target/m68k: Honour -semihosting-config userspace=on
>    target/mips: Honour -semihosting-config userspace=on
>    target/nios2: Honour -semihosting-config userspace=on
>    target/xtensa: Honour -semihosting-config userspace=on
>    target/riscv: Honour -semihosting-config userspace=on and enable=on

Except riscv, for which I think needs changes,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

