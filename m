Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLl1Q-000720-Ts
	for mharc-qemu-riscv@gnu.org; Wed, 10 Aug 2022 08:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLl1P-0006x4-3i
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 08:41:15 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLl1N-0005PN-DM
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 08:41:14 -0400
Received: by mail-wr1-x42b.google.com with SMTP id j15so17633407wrr.2
 for <qemu-riscv@nongnu.org>; Wed, 10 Aug 2022 05:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=2wdII7q5350dyl+ZyIL7Pkw6L02jN8t/a+pXCBjdHpw=;
 b=ORCb/eDfBtKKdbzps2w5tmBfUUErwjR9opq8BWJtZl83Q+CEfvDZTz/8sqWFOeoFs0
 bpSDwcARrsN30+06Fp1qiHedG4OAMWVAEXcBC/OrfZY+MIS4k7elTYgoZRbpl4WJyZ5b
 felXvccZXg5E6yui5dZM1FjY/HcdrhxLMY+7qYFlBdfLmmzHu6V1QRQAVSyWya/zzs5/
 ad1JKW5GBFKn9nkNp2N8VFuAINTWXobSfzMdrIt6NcDfcPVxLnni3NteAyz73UAKWzFF
 LIsSDYRD15G0eNprH3uySlYWd+Qb7oComNwtDAZ2k+w21OPCpDE9aa+Nx+w8n2a4L6ga
 eLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=2wdII7q5350dyl+ZyIL7Pkw6L02jN8t/a+pXCBjdHpw=;
 b=n7FaaHnYV2MSmo14SxFBimAqSKj13qlkr1r81fE4y+RP+PJDOfvvlezvqzYkNAnn1c
 P1aOiDuWE1yhiZ6DGlT9YUu1ktGZOsvAFQNJ83jsups/7VzuVCISJsB8s2bnlko1WuZ9
 IBVimFfzrR3lH6/2FfbtES4GhTJ8NUz19o6eY+TBVs4umDEbmu4zabx8Mm6FDHscW6zR
 MpXSzy0NssnqlHvSfASyPNrn8DIJFuVvN3AED6FrTb0sAu5LXb+yAaT6+LHFI2Yq8wCz
 SuSaaVRb8T1baXkoMjdSTbovz6w85Ny9YmtylX2Z/Vt4Fm9YauIhZIF9zlFWLy7H+MQ3
 R+hw==
X-Gm-Message-State: ACgBeo2cgMlxPhL+U5TGGXJa56lUmjcwUn+QaACXSWpTZobEVp0FFsQd
 lhijf50oEnaWdXoA56bPVoHIuQ==
X-Google-Smtp-Source: AA6agR5Borh/n3SiCw1B1/WNk89PhMagsjdRhSOdPWxzrm5btbr7JnXiCB+Qf5pO+48T/VjdASIIcw==
X-Received: by 2002:a05:6000:181b:b0:221:119b:d26a with SMTP id
 m27-20020a056000181b00b00221119bd26amr15853755wrh.708.1660135269964; 
 Wed, 10 Aug 2022 05:41:09 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a5d4f05000000b002205a5de337sm16335295wru.102.2022.08.10.05.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 05:41:09 -0700 (PDT)
Date: Wed, 10 Aug 2022 14:41:08 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 6/6] hw/arm: change to use qemu_fdt_setprop_strings()
Message-ID: <20220810124108.dqmryussx5x5p7d3@kamzik>
References: <20220809185639.750345-1-qemu@ben.fluff.org>
 <20220809185639.750345-7-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809185639.750345-7-qemu@ben.fluff.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 10 Aug 2022 12:41:15 -0000

On Tue, Aug 09, 2022 at 07:56:40PM +0100, Ben Dooks wrote:
> Change to using qemu_fdt_setprop_strings() instead of using
> \0 separated string arrays. Note, also there were a few places
> where qemu_fdt_setprop_string() can be used in the same areas.
> 
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> ---
> v4:
>  - fixed checkpatch errors with string
>  - fixed patch subject
> ---
>  hw/arm/boot.c             |  8 +++---
>  hw/arm/virt.c             | 28 +++++++++------------
>  hw/arm/xlnx-versal-virt.c | 51 ++++++++++++++++-----------------------
>  3 files changed, 37 insertions(+), 50 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

