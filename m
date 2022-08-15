Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNjIi-0001bK-IH
	for mharc-qemu-riscv@gnu.org; Mon, 15 Aug 2022 19:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1oNjIg-0001a8-4o; Mon, 15 Aug 2022 19:15:14 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a]:33474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1oNjIe-0001bN-1c; Mon, 15 Aug 2022 19:15:13 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id r4so4421256vkf.0;
 Mon, 15 Aug 2022 16:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=1p30cTHaDHwD3tSkpCHUqDSGnIBEry22la+MZDLe2QE=;
 b=QpeHYiSfjc0RfUXDTcFFJbmXhDW5Atha1lUgiAFk08pgPrAIvFpi4aWFhziG4MArSH
 rTqZjfPrUgJp5DYwtQXc5jKFH/PdHHAW+6qXk3D4Jpas4tQ1xcwm38lHaNTr5a8v1W5+
 fjblPy3CmO8lLIBzg0A3Z9aO/f3UTKusU26IgbUcC4lLH4EypS6W2CSl0hiZdsXNOKQ7
 S51bkOXsit0IA3BJM+q0NWriwXJI2g9IZIk3fGTYlruFv0rni94Xrl3ccxVdohTqULyd
 MSGtTp6SUf0dvsu/OeQp8YKRgsmwo4kVcZZQj2C4uW/W2iol+jdo8eJsitqdCAWwDkZ6
 4baA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=1p30cTHaDHwD3tSkpCHUqDSGnIBEry22la+MZDLe2QE=;
 b=hVyN/ztJXHXD9Ya0430QYDUSTCCskIknVGrGJUuI7I9F0ijyntbsOIJlCURV9a+nSz
 5/BOC8Yyljooz0RkTFECIBV/4TA/QUxX0sRGs/sSUmy/t/0Rn41P9nhSbhIh8ggMlwGl
 c87uuUFE9vBGNo/19k6+GlTk69hZg4s0kajaK/g1LWeTdPwv19nAJQoHT4fafMDu+EPb
 AuBoospb5cyQlv8ywcBpJ/eGBZm6yv0WRcB8TnG++8UCUsgGhd19RKV6bE6DCL5ZMK3r
 TmmZb+tEQ1A2CwqcafDAPX2+TlOR6hS9lbkX0b70mb8sJ+rNujkRIJw0/Ocu0sp/70na
 zluw==
X-Gm-Message-State: ACgBeo3CcJOhhyjRaIHiSKsw3slbUbGsunijy35EFsTwPnuyJtB6Uuna
 7yFUN/Ns0KmDC4wSkHUPtHF5dl4Lb4YdnhIvvqg=
X-Google-Smtp-Source: AA6agR7sdJxpn4iBDV36au4BAIv/LrJGW3rDhg/l6Jr9L6KO9mbxxnzQaBK/Vv0AlaJd0ORH5jgY6QobctFNen4BEBc=
X-Received: by 2002:a05:6122:ca3:b0:378:cf0d:b458 with SMTP id
 ba35-20020a0561220ca300b00378cf0db458mr7534274vkb.15.1660605308334; Mon, 15
 Aug 2022 16:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
 <20220815190303.2061559-7-peter.maydell@linaro.org>
In-Reply-To: <20220815190303.2061559-7-peter.maydell@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 15 Aug 2022 16:15:19 -0700
Message-ID: <CAMo8BfLzPLit=fyN9Q4fUbrucWrewmPnsNx8JiH3gZwVQ8aHxw@mail.gmail.com>
Subject: Re: [PATCH 6/7] target/xtensa: Honour -semihosting-config userspace=on
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Furquan Shaikh <furquan@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-vk1-xa2a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
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
X-List-Received-Date: Mon, 15 Aug 2022 23:15:15 -0000

On Mon, Aug 15, 2022 at 12:03 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
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
>  target/xtensa/translate.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max

