Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcOyR-0000XF-UW
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 05:30:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcOyK-0000V0-DR; Mon, 18 Oct 2021 05:30:23 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcOyH-0000xn-JX; Mon, 18 Oct 2021 05:30:20 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i12so40010850wrb.7;
 Mon, 18 Oct 2021 02:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D7BVU4GhXL8n5L6edJ68HHv8FXWmZwwAdo3YO2vTNqg=;
 b=jG6itYlGXAG4BQSBgC02sYxn3NZkND8rEZCka+vIlFZ5gGPQVkHH3/nn1q7sUPi2BI
 SvLnybbRTWnPxcfH5SqCq9iPXArQ/dHva3apZTXpDmbxoSMIuI02IDpyUQPueqFRcOxB
 sA9URgktJCqxFiUiD7ohX9uCwmA5OlcxSVE7DHQ32fdSvRTGAbpuRpL3n+r3SfEdaEA7
 /JtWKLhCSPbVtGBzdw0ndTyuxclQTycrZ9Y2wXJ346jWP52rY0UmKWq2ba93lewHT2o9
 3ppfIZzuuut7XvJ2vqZwjW+7ePrGR+dkPbbFkqRDy67n70yLuo0TxBJWqWyhOYqfoTTN
 fvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D7BVU4GhXL8n5L6edJ68HHv8FXWmZwwAdo3YO2vTNqg=;
 b=I94uZIB1SNPvXhRvueOmx+p2DDf/17mGnXkM0F4M3ZAAQMdiO/AzHyfdNKRY07BAGq
 LDZOlQnq1fCuySVJHvfWMPwnM6oxWJ2tzPk8y8+axq+RF5XutjoAehLRdCl0l0Wv1ebT
 nHSaGYfR9HLErjijC9CSgl+9rJFefCVv+C50UzucA2TU8OMo8FLBqJ/VC2af5p+njeuj
 09TvyUlaHxh8t1W4oH25lPRShDeBweMCbc6l2VjsRJhS7EhAcUu75gzhe3ne/hjWS9FZ
 WDsTOnXUrewKiDK8UdINuEo72rN0fngnq41Lp/4md0IS6UrpcaR8myp2hwso+ObTJ+zG
 E5Hw==
X-Gm-Message-State: AOAM53313NFFO3wGKgdwK+4aTB40M3JbgDt5l1thr6Erk0M47u6gL6Iw
 7VuJQavomUfaD1GRoKlHeDOsTGGLNoU=
X-Google-Smtp-Source: ABdhPJzsPn+Nc3lQ33b4rfhCxFsLwAwh3oW9Tjln3eWDor2tIRvHTdUvCSI1x2pP0qZO3hpewyVVOg==
X-Received: by 2002:adf:9791:: with SMTP id s17mr33436556wrb.122.1634549415371; 
 Mon, 18 Oct 2021 02:30:15 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id a127sm16894044wme.40.2021.10.18.02.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 02:30:14 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <f6ab317d-86f4-9ad0-c108-0705593be3d9@amsat.org>
Date: Mon, 18 Oct 2021 11:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v1 1/2] target/riscv: Remove some unused macros
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
References: <f4d8a7a035f39c0a35d44c1e371c5c99cc2fa15a.1634531504.git.alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <f4d8a7a035f39c0a35d44c1e371c5c99cc2fa15a.1634531504.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 18 Oct 2021 09:30:24 -0000

On 10/18/21 06:32, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>

Possible commit description:

 Since commit 1a9540d1f1a ("target/riscv: Drop support for ISA
 spec version 1.09.1") these definitions are unused, remove them.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_bits.h | 8 --------
>  1 file changed, 8 deletions(-)

BTW I strongly suggest you to use git-publish for your
series / pull requests:

  https://github.com/stefanha/git-publish

Regards,

Phil.

