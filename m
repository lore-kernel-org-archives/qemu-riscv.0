Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf2L6-0003wj-Vx
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 11:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mf2L4-0003t6-Nz; Mon, 25 Oct 2021 11:56:42 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:45692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mf2L2-0005mL-EA; Mon, 25 Oct 2021 11:56:42 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 71-20020a1c014a000000b0032cafd23b1dso428517wmb.4; 
 Mon, 25 Oct 2021 08:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q7jsTJhnPdSU4NLw5szcgqWjL15U5QhL98qLEhGKFAI=;
 b=m4mrKmLC78Is7J0S9rpzYr71t/mTyvBca1cLwpIVmJpxkAQVvQVQKf1M/Wr1+UEJgN
 cfLQUFi4M/7R8xbwPUdFX5NkToQyj7AU6vwwPq0MNw/ooQZnHlXg62132uU+3Y8/PVX8
 o1yRLxSFolyelulUBOaYrPImLhRM0hEsogjVsj41N3ryZTb89eSBddppW7+OAC6chu/V
 FqReE5fadKFfgTpPuhalNXFmiAJSApVH2pNbXjjrBSkagZPDEPv5bAot0bJSfD/9urPY
 azuiTQPwXSowICYhpmZo8vMY46Gs4leOBeEKzH/O/87E4l3KZEMbRsLMpHpSCBGA0MCU
 gOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q7jsTJhnPdSU4NLw5szcgqWjL15U5QhL98qLEhGKFAI=;
 b=SfAC1kHo9N2L5O++eyzE7dxtpSn2FS6n2rz+oV/3y8tpYh9LE4nRH5yGtghDH28TnU
 3YFp9DnE1RmLaeRCltMLh26w4+SgF2digqS63j7bSbFPGTE6UvhhPv4Q2qec5W5WKCrG
 VI0yHXtjBEpe39hOmD5s1UgPmfpfXYy9WMDhGJh1jpyMoP54sJ4UZiKsnUcs/9HXB6ss
 YbLGg+/U6CfMY1IQm9SGCAx75n7CnnjKhPBbfVpPLVxCiHwqV8eplc5ENvX9Abfqpn/4
 qRtq2guTSEk2JzY6XIvcO5xXVk0WfQnLJG+gv/RVbqzJduEDU4qtbXvpGcrsaCxMYd4n
 rnRw==
X-Gm-Message-State: AOAM532bbrPiGeNfr7A31OameAmBTxhD5S8hiD50I0I81LP3AKjbYR1L
 P9yLXyJJcuLWHBv466hc8lk=
X-Google-Smtp-Source: ABdhPJw04qroD+59/EmNniodbNKT7zkG9QIIKKaaKkI/2Rk5WEjsGLWGa/8sl3/oUt+xW6OGIUVYHw==
X-Received: by 2002:a1c:9d8b:: with SMTP id
 g133mr24098299wme.132.1635177395082; 
 Mon, 25 Oct 2021 08:56:35 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u2sm16096241wrr.35.2021.10.25.08.56.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 08:56:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <04382cc1-750c-ee71-2cec-74a28b4375ad@amsat.org>
Date: Mon, 25 Oct 2021 17:56:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 07/17] target/riscv: moving some insns close to similar
 insns
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211025122818.168890-8-frederic.petrot@univ-grenoble-alpes.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211025122818.168890-8-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.846,
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
X-List-Received-Date: Mon, 25 Oct 2021 15:56:43 -0000

On 10/25/21 14:28, Frédéric Pétrot wrote:
> lwu and ld are functionally close to the other loads, but were after the
> stores in the source file.
> Similarly, xor was away from or and and by two arithmetic functions, while
> the immediate versions were nicely put together.
> This patch moves the aforementioned loads after lhu, and xor above or,
> where they more logically belong.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/insn_trans/trans_rvi.c.inc | 34 ++++++++++++-------------
>  1 file changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

