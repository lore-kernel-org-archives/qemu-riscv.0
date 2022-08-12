Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMeX5-0000KH-81
	for mharc-qemu-riscv@gnu.org; Fri, 12 Aug 2022 19:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oMeX3-0000J7-T5
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 19:57:37 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oMeX1-0001WS-FC
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 19:57:37 -0400
Received: by mail-pl1-x633.google.com with SMTP id x23so1993555pll.7
 for <qemu-riscv@nongnu.org>; Fri, 12 Aug 2022 16:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Yu7Th/2idDWs52OLV8YEVpfW5jDZwE1DAM0pcswm1Jc=;
 b=rwcJuWvE8SwMCHs0iIVmaA4g6wAIZWdd/hTdQsMTHqJDwjws5H8gr2jltLFvEsqf9D
 sqCmsv6ZDmPzb0eKVAzrEz7q1wsEHdtUD3iuwfp8rM66hXn92rOpCBH3j31yKeNnfLhe
 NE3axb+aLwgYMAOnPiAmLGJqFXASpndsGRqsDSDwYUai98pS/Nu9la0LUd1F0SdSZdL0
 oWn7X5Hy7AdEoYC0VeQcLw6SNCd99aUaOHcSk8AcE/Ab+EMi7b3NWwhQO2rmCLealqsE
 82mH7sVvJdf7WfN0fAUCr8r/3sDpn7zWOlNjsbwf1nNeBTo27X6+i0JlQzju/MINJBlh
 T73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Yu7Th/2idDWs52OLV8YEVpfW5jDZwE1DAM0pcswm1Jc=;
 b=vZWQZisl7AMSE4gDQQW1gnrrxwndUwojvli5o62XsZyvV4bTznYJf2t6Q7RurJMTZn
 x2h8T4fDteSJ0tNXrJJMdbNlZ9L3ePW6qL+FdlwyHROI3/+QXDZMUUxELdigOLE8p61l
 ngWPXBiPjKov1qjZxtzU8j3ED9qSC4xaxPqzK6+s9VGJ2JrRvfvO6bSQC2jP1whSoo4V
 h1r9lpqiJc7ZtzU2zLF+Rsd+NE+Dhh+KKEwfPG/x8l8HJk/emLgOWSj0gV6xeyfoHxQV
 a2MFW1jByMwNTSk365v12E9dsm6pc9DJCj9EDKwHJMU5oZBGYyuGfQwbG/vwO+GdGM/4
 zX6Q==
X-Gm-Message-State: ACgBeo3x7oNdugz/56v/DcQFRWcEMbO2NqNBqOuTENg1gwTr1jbMNLKx
 kzB+unPEqLh7iH8ZLyqZgPK4Q1UHkVJAXV8KoqYttQ==
X-Google-Smtp-Source: AA6agR65AYMhoyaAzWoSzfLIe8W5lsKRyPK0lRICm8Zbn3Pph6Klbli8VXEUOTEbqtF5G8vvT2WBgRcRRTF/0D7szAU=
X-Received: by 2002:a17:90a:e7c3:b0:1f5:8428:bee2 with SMTP id
 kb3-20020a17090ae7c300b001f58428bee2mr6482195pjb.33.1660348653624; Fri, 12
 Aug 2022 16:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
 <37244ef8-d2f1-038a-8a51-01d9f62fbe2c@linaro.org>
 <f977101c-bdc0-3b24-5fad-a75b07b5dac7@linaro.org>
In-Reply-To: <f977101c-bdc0-3b24-5fad-a75b07b5dac7@linaro.org>
From: Furquan Shaikh <furquan@rivosinc.com>
Date: Fri, 12 Aug 2022 16:57:22 -0700
Message-ID: <CA+tJHD4MC9xjVkDAg6QZ3Yq2L-cKDQkofQyGjX67cD_qxbCf1g@mail.gmail.com>
Subject: Re: [PATCH] riscv: Make semihosting configurable for all privilege
 modes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=furquan@rivosinc.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 12 Aug 2022 23:57:38 -0000

On Fri, Aug 12, 2022 at 4:42 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/12/22 16:27, Richard Henderson wrote:
> > On 8/11/22 13:41, Furquan Shaikh wrote:
> >> Unlike ARM, RISC-V does not define a separate breakpoint type for
> >> semihosting. Instead, it is entirely ABI. Thus, we need an option
> >> to allow users to configure what the ebreak behavior should be for
> >> different privilege levels - M, S, U, VS, VU. As per the RISC-V
> >> privilege specification[1], ebreak traps into the execution
> >> environment. However, RISC-V debug specification[2] provides
> >> ebreak{m,s,u,vs,vu} configuration bits to allow ebreak behavior to
> >> be configured to trap into debug mode instead. This change adds
> >> settable properties for RISC-V CPUs - `ebreakm`, `ebreaks`, `ebreaku`,
> >> `ebreakvs` and `ebreakvu` to allow user to configure whether qemu
> >> should treat ebreak as semihosting traps or trap according to the
> >> privilege specification.
> >>
> >> [1]
> >> https://github.com/riscv/riscv-isa-manual/releases/download/draft-20220723-10eea63/riscv-privileged.pdf
> >>
> >> [2] https://github.com/riscv/riscv-debug-spec/blob/release/riscv-debug-release.pdf
> >
> > I don't see why you need to change anything at all.
> >
> > Semihosting doesn't only use 'ebreak', but a sequence of 3 insns:
> >
> >      slli x0, x0, 0x1f       # 0x01f01013    Entry NOP
> >      ebreak                  # 0x00100073    Break to debugger
> >      srai x0, x0, 7          # 0x40705013    NOP encoding the semihosting call number 7
> >
> > If the -semihosting command-line argument is absent, then the new DSCR fields apply as
> > normal.  If the -semihosting command-line argument is present, and the ebreak is not
> > surrounded by the required nops, then the new DSCR fields apply as normal.  But if the
> > command-line argument is present and the nops are present, then semihosting overrides the
> > architecture and DSCR does not apply at all.
>
> I note that there's a missing test of semihosting_enabled() in
> target/riscv/insn_trans/trans_privileged.c.inc, and the PRV_S check in
> riscv_cpu_do_interrupt can be done at translation via ctx->mem_idx >= PRV_S.

I am not sure if I understood your comment correctly. Currently, qemu
has a check in `riscv_cpu_do_interrupt` to allow semihosting calls
only in S and M modes. This prevents semihosting calls from U mode.
This patch changes the default behavior of checking `>= PRV_S` for
semihosting and instead replaces it with the usage of
ebreak{m,s,u,vs,vu} properties to allow the user to configure what
modes should allow semihosting calls when `-semihosting` argument is
selected.

>
>
> r~

