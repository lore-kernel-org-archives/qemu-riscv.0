Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUiYP-00082Q-Rr
	for mharc-qemu-riscv@gnu.org; Mon, 27 Sep 2021 00:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUiYN-00080m-RA; Mon, 27 Sep 2021 00:47:48 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUiYM-0008DS-B7; Mon, 27 Sep 2021 00:47:47 -0400
Received: by mail-wr1-x433.google.com with SMTP id d6so48335379wrc.11;
 Sun, 26 Sep 2021 21:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ix3GPs7ILYiUQFRczMH/bYnLo9Fsseb5Ku/IPCZWzc0=;
 b=USEAwtNC6KwP/j830n0Kx511xctvwguLbsYpVGKHmlCx2HnOMG0i4UWtP3CRPUAFm7
 WZXN+PATEO5cOVAv0lydq7IKAkNYSXicf3TIGHvBzzKx1aCMMwaWfa57La51r/D8ngup
 DUO4yeMTU+m+vuoBivKBjOFLKjxrN0Uy+7SeI85lkJlghV1J3X97vgTX7HL0IfhSAgL3
 IeYg4q0U6yByO9txL6CFabmLQZQ9CD2A+B71sa6vcYZuGj55Fg1f+vcPtMYs8Wx8k4mZ
 0L/5cRLXZq76eIUJ/FC5nbcGOiTNesp9xrsvsMQrYGcwhrAPVG4fKSLAY7s6DrKA4BN0
 KzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ix3GPs7ILYiUQFRczMH/bYnLo9Fsseb5Ku/IPCZWzc0=;
 b=1xXWIOXwuyHLSvfY3fFvufYw0bVoBnoO3IOzs3Dox8GvECzKislrKpmPcbwnVbhuJb
 +1hItP1tCJKHCyXDZYAj+s8G7v9X56LVBu3olt8BetAvOxWwKv5Nvul5v5fVg8mTvc69
 AXFA0f5tc26qMz05hcPjJPdBP9/Hf21tJFeFQg+aVnLiqm5/3QhFElhS6s2YGfLBLXci
 KCuYMmHYngSw9O+tz/2yeVTaJX/H81dU6K6sIEIwdK8x9PUEErzM6AA7d1iscmPeLaph
 vnymfZChHt21lSBTpM4Ya18089aZAM9o+l/xqcqPKuGjljJ6r0GTSYVp2qIBTdJhM3eQ
 T6/A==
X-Gm-Message-State: AOAM533y6cYrRAB3XlCycuo4nKcpMapKpvFY6MAWMLN+odvZZDoFRCUq
 Q+EvqSEPbaC7xGshm/PzFkI=
X-Google-Smtp-Source: ABdhPJzPTLsTfGf67OrxNaXdIujcOboS/y2SazQFMh4VOxUC39bl88sAcoTP/gmNmBoqrFSMhTcFPw==
X-Received: by 2002:a05:6000:186a:: with SMTP id
 d10mr25865640wri.113.1632718064116; 
 Sun, 26 Sep 2021 21:47:44 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id j4sm15767808wrt.67.2021.09.26.21.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 21:47:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <8a997109-92cb-675b-f872-4a07dbebe861@amsat.org>
Date: Mon, 27 Sep 2021 06:47:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] hw/dma: sifive_pdma: Improve code readability for
 "!!foo & bar"
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Eric Blake <eblake@redhat.com>
References: <20210927022113.1518559-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210927022113.1518559-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.478,
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
X-List-Received-Date: Mon, 27 Sep 2021 04:47:48 -0000

On 9/27/21 04:21, Bin Meng wrote:
> GCC seems to be strict about processing pattern like "!!for & bar".
> When 'bar' is not 0 or 1, it complains with -Werror=parentheses:
> 
>   suggest parentheses around operand of ‘!’ or change ‘&’ to ‘&&’ or ‘!’ to ‘~’ [-Werror=parentheses]
> 
> Add a () around "foo && bar", which also improves code readability.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
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

AFAIK in C logical NOT has precedence over bitwise AND, so IIUC
compilers should read the current code as:

           claimed (!!s->chan[ch].control) & CONTROL_CLAIM;

meaning this patch is doing more than "improve code readability",
this is a logical change and likely a bug fix...

BTW GCC suggestions are:

           claimed (!!s->chan[ch].control) & CONTROL_CLAIM;

           claimed (!!s->chan[ch].control) && CONTROL_CLAIM;
>  
>          if (!claimed && (value & CONTROL_CLAIM)) {
>              /* reset Next* registers */
> 


