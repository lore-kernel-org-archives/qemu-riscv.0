Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYAOH-0001rH-3J
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 13:44:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAOB-0001kA-2p
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:44:19 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAO8-0007ex-J2
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:44:18 -0500
Received: by mail-pf1-x435.google.com with SMTP id c10so2148828pfv.13
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 10:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869055;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sQZzZcEGjMCNAdpg7pW4PnlMgakuvC67V9XQ3TiLV4w=;
 b=bTOA9Df5q0V+NQyltpkgQUtPGlWL/HYHUonQmNiX6yY3+UnFqH7O4HQYt0ILrtVK9J
 mZEDGmBTIvk6gRIPyFoYTMEwT8ZasHD8jsmCwvLck3g5mbXF8b5WbkMpea41KoU0CDKn
 doYXPo1fFZs2JGa4wqVNRxk4Dv0gNaecpDNH8scLg8KA1EDP0jAq90X68EsNh8OPci3N
 JUc2pGViAm52uXSqpkrgm3yWa1hqWd4y/Eg0H1AgsDXCHB4b4H2q2BE4aTrL5WJ/MioM
 7gDbRCLdRvJn/Rg6a8tAdUpZWTzaPgSXAhInITQct+kTJ9SE+ycV4O5/cZn75NjwnuT9
 3OAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869055;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sQZzZcEGjMCNAdpg7pW4PnlMgakuvC67V9XQ3TiLV4w=;
 b=X/I6KwaT5djjE+f+3awDaV3M1rLbvhZ3g8zdNkSlHn14GgjDhaukPsk7LN4YInwXCX
 dj8TddFOPoob9T1NrAXqJe5ojw1EjrDWapZDG/aPPQaEEd4fDFd5rcfyO2nnEX17imGq
 ScFjaBVmvGgx6TLYUsSmj8SCnrB9JMxqTG2wsciyVYiWptQJBFDbtovXhv1D9mgc6iYB
 cjq6mqIeyAZO3swrmWw7fR+9i/spaKB4FC4RWXxp3Q6h0oXfgFfiCL1/J9cCm0wUdPYE
 M1C1ZBFH9ejAOomCCysmKD0b0xITPWqxQPsLE8dvKtQezoQwY2DZ+rAEbXJZ8QbIpZCZ
 jTqw==
X-Gm-Message-State: AO0yUKWtCl49Gc1e/goBJ9R7KibKm/1OYwJ0IvBFb9vg9UgQqmz3ztje
 5mddYowReCmVZkzTLdEWWNIjVPyvfMib0Z7buL4jaw==
X-Google-Smtp-Source: AK7set+enV2mf6xc6rTRBSHMstCHNSlxtzXkSi+5rsqQYTpQOLpbTd7oox3CL9NqVK+PEnNz5YzJPaC/+WLXuzaTXws=
X-Received: by 2002:a63:f705:0:b0:503:7cc9:3f8d with SMTP id
 x5-20020a63f705000000b005037cc93f8dmr864956pgh.9.1677869055010; Fri, 03 Mar
 2023 10:44:15 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-20-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:44:03 +0000
Message-ID: <CAFEAcA_0BTp6YL_CEHDQBaNDiE3GSeV4pAFWyYBWRY6OKtTCjA@mail.gmail.com>
Subject: Re: [PATCH v2 19/76] target/avr: Drop R from trans_COM
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 18:44:20 -0000

On Mon, 27 Feb 2023 at 05:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This variable is not used, only allocated and freed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

