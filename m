Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUqBR-0004I0-UU
	for mharc-qemu-riscv@gnu.org; Mon, 27 Sep 2021 08:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUqBJ-0004Ds-OJ; Mon, 27 Sep 2021 08:56:31 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:50974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUqBH-0004o8-33; Mon, 27 Sep 2021 08:56:29 -0400
Received: by mail-wm1-x32e.google.com with SMTP id j27so417745wms.0;
 Mon, 27 Sep 2021 05:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a9oh2xcqRor71IjDOvmuYqm6f69y1o9qp1dJpiHbu4U=;
 b=RyEYM0wJdcadeEc8/0oI3icoTGcuQrZ8ErZcL6AT1V0kC6nz3c8/E8RHGlnF1WM+z1
 sPU5ku6JBBbd4ySVmq/9IjMWkjNhclXLerUW7areOLS/0izUTN0y25zKYh5uFniw15Br
 MyBxTI92G4VCpGroSOMFhVoAt6+L6wkIAwPIbyp244cnUx5j9cF+vl1nDgPGEztSa3Fz
 DKWOQld+Ma3rPKmxqVZ1HAJ/gLhQUjGfV3AI8tCZjoZwy2PMVXkIHB7ZbdDKADIrsxgJ
 kPehwvugDjTISakB0ZipSolM7sDxwPVe1bk4L/bB4HFK0MsqKYtaIGiPf44wVUcDiEpG
 Z+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a9oh2xcqRor71IjDOvmuYqm6f69y1o9qp1dJpiHbu4U=;
 b=7A96DwQPXm7P9W2pcrvRCu0ETie6Ipy89954G0fiOUUz5uCTeFF6oMJvEnGniwgozC
 opMcxgxVkPmsXPIJpR+q+Y5Dkkjtl0w3lMLUTUuYBGZ+t5lnCyrr/DhtG3K2MlslI6ES
 nBKu0vqyXBG2F46ChSwZVKAmSnSQPEpLiCrczDB7f0cHeYQGyJ66HxxeHjsmF7+H301U
 OgEKJS/fSX9xuAjwnqWfNLY6W2IEkLZhqtLx4/fU/PoWzRO02GD9dnw/5NSSnzJKKuu2
 aYCAsnHNovubmjUxZOu44+yGwWWxViIgrOA2MmV2aumT8BBit1iPxGryRpIomPlg0p4b
 /tOQ==
X-Gm-Message-State: AOAM531XU8SxEhKp3mYLVwuwswFlYuukHlyQvcRvjx2s4tVzOHlp13AI
 4RJo+9sra+N4zLi87AS1mGn7gnoDQ2A=
X-Google-Smtp-Source: ABdhPJyM5Ljnv2Kg2I790Ji5RaBqDGYM05xmcq6JnsuoRLKdSILhTuwFTw576d8OoRaz5Jmp1cb8yQ==
X-Received: by 2002:a7b:c767:: with SMTP id x7mr15847228wmk.62.1632747385050; 
 Mon, 27 Sep 2021 05:56:25 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id p1sm21004767wmi.30.2021.09.27.05.56.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 05:56:24 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <3e1507b8-81a4-aa98-5079-e07021be5a73@amsat.org>
Date: Mon, 27 Sep 2021 14:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 1/2] hw/dma: sifive_pdma: Fix Control.claim bit
 detection
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Markus Armbruster <armbru@redhat.com>
References: <20210927072124.1564129-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210927072124.1564129-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.136,
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
X-List-Received-Date: Mon, 27 Sep 2021 12:56:33 -0000

On 9/27/21 09:21, Bin Meng wrote:
> At present the codes detect whether the DMA channel is claimed by:
> 
>   claimed = !!s->chan[ch].control & CONTROL_CLAIM;
> 
> As ! has higher precedence over & (bitwise and), this is essentially
> 
>   claimed = (!!s->chan[ch].control) & CONTROL_CLAIM;
> 
> which is wrong, as any non-zero bit set in the control register will
> produce a result of a claimed channel.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Maybe worth adding:

Reported using GCC 9.3.0 on Ubuntu 20.04:

  suggest parentheses around operand of ‘!’ or change ‘&’ to ‘&&’ or ‘!’
to ‘~’ [-Werror=parentheses]

> Fixes: de7c7988d25d ("hw/dma: sifive_pdma: reset Next* registers when Control.claim is set")
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> ---
> 
> Changes in v2:
> - reword the commit message
> 
>  hw/dma/sifive_pdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
> index b4fd40573a..b8ec7621f3 100644
> --- a/hw/dma/sifive_pdma.c
> +++ b/hw/dma/sifive_pdma.c
> @@ -243,7 +243,7 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
>      offset &= 0xfff;
>      switch (offset) {
>      case DMA_CONTROL:
> -        claimed = !!s->chan[ch].control & CONTROL_CLAIM;
> +        claimed = !!(s->chan[ch].control & CONTROL_CLAIM);
>  
>          if (!claimed && (value & CONTROL_CLAIM)) {
>              /* reset Next* registers */
> 

