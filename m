Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY9FK-0001TJ-Ma
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 12:31:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9FI-0001QW-Sf
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:31:04 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9FG-0007iZ-G5
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:31:04 -0500
Received: by mail-pf1-x42f.google.com with SMTP id y10so2036421pfi.8
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 09:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864661;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8LO3H0xihPu/J7zCAeMi7XJn5vVG/43m/HalvuEQr3o=;
 b=EjgxcE/0dBUUdbaQphTA0Lbw8siPMn7ulYY1y/o4HEz/PKmm6ZZdrZwg8LAPRk1PSS
 tgGJGdXB4Iy94L/E8OgpVZgOYe9WYWXZefbRdaEajHBcASfLcmyCQoxfZHvewgcoYR6n
 xvV5XTX9l8QwxxZtqpqwZ8BTG4uMXc6fJxxrhKQTKSLZt0KCjbpgnuC6CoOhRiDGv91d
 uJvAX31FD9TkrWGKi8lVX/t240OYhFlBOlHmIGnVeh5IGYcGUnRCwtU+EVLQpqkeeoie
 WMU3aBh6En8dOKJQw+NlBkSnf/FAYGSQZSWs20advLcM9eiZBSoHxbhVqW0na5OaxolA
 yHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864661;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8LO3H0xihPu/J7zCAeMi7XJn5vVG/43m/HalvuEQr3o=;
 b=q6mu6PwgA7H/HeI4qD4t+GXBMSuJ4wZxNvrwLuM7JNBikD2+W0rzrwzAmMh8xov0LW
 O20mZ0b0I8VbyzDjeApyMM2W0x1QeUmOO+dS0RE2Nc8Ma9/E+nXIRMyV50RZScbD9bjA
 e6MMzkO3kAN5dSFf7k3+vdhen6y6dBT+zxnDB8saYGnelgs+H8Zcc8bnzSGuoHehTXcc
 gIOp3l0Qsu3n/MgbUQkjCrDjK+6PQU8GNXCAwuD8MhwJx4iOlNOU40P09OQ6Kd5/V1sr
 61XLfa6ECvcJYjzAuBMJ+rFEBqPCRKQPcV1D9kqGVueLvtGRyWdDX23+ajJeCaPH8ie+
 byUw==
X-Gm-Message-State: AO0yUKUU8OIvclXaI6EDFbExIFOLUhOGsSd8JpnkJ4mqnOqxis2UH/6F
 FaVLIm4DSpOFI0Ew2OAstrPUVgaxxzmt/qVyzzhbpw==
X-Google-Smtp-Source: AK7set/XDpILp5H8f1RSFrbqRocnWwpF2ExtPn6MF2mttgJYQPYoP6FpW4PFfp0aqNEBi0g4AW7NCNabUmWsnEwUhwE=
X-Received: by 2002:a63:291e:0:b0:503:77ce:a1ab with SMTP id
 bt30-20020a63291e000000b0050377cea1abmr746185pgb.9.1677864661031; Fri, 03 Mar
 2023 09:31:01 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-7-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:30:49 +0000
Message-ID: <CAFEAcA8JB219zg9gFkBd_FQN3jm0pto1LJ+eFun1Su1-WYw4ng@mail.gmail.com>
Subject: Re: [PATCH v2 06/76] target/arm: Drop tcg_temp_free from translator.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Mar 2023 17:31:05 -0000

On Mon, 27 Feb 2023 at 05:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

