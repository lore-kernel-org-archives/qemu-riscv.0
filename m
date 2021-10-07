Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYOQL-0001i0-DC
	for mharc-qemu-riscv@gnu.org; Thu, 07 Oct 2021 04:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mYOQI-0001hm-Nm; Thu, 07 Oct 2021 04:06:38 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mYOQG-0004Ny-A5; Thu, 07 Oct 2021 04:06:37 -0400
Received: by mail-wr1-x42f.google.com with SMTP id r10so16322842wra.12;
 Thu, 07 Oct 2021 01:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pZW0cU0jT+5wZ02BVKG94yny6dTjJNbVLJr0SYeWd6g=;
 b=F+pSX0ERYWcat43XlIN58dcleTRvCXvex17UktDeCTXJVwdsHYtGU3qdBfSIFkZYfH
 1ZOdvshsDOYJMYlTa6a5or6CSZNllcLuemsTTGBBMMC/gizY9A8MgS6DFM+Lb7dMIcva
 N7I0pDnIcmgWKvcUDrJvo6wXmy3jvQjpZq+2X+JeL7y0qcp6nKlY7R+hA3Se04USrtul
 tEPqUbiqdffObwWTBUz667xPhEtYbMRhhj+coD+5H+JZOQ3FgORKlepwI3B7tEAkZu/V
 EUttq2prXwKMnCfmmv6frDFGMfMdzj+JawRPHzahpT9IqIrOBhTtv3ToPId/y/Mby6MP
 kSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pZW0cU0jT+5wZ02BVKG94yny6dTjJNbVLJr0SYeWd6g=;
 b=AevEt7Q0f/wmHB0QGLoAFsrUSscTDBfz2a3qn5Yosg6APsRq8iR2GZXWdqDvpMA1BH
 YtpeferA5fD/ZYK57OdDNMtqnwempv5qa4htbjjkR9Zk/JPV8MLSCXxG7y26ulD/rBi6
 xzyFnpn0/pd/5snGvoR0u8njuj+jwheZwO2KwcQC/0n3ZGsv5KOD6CJBeBfIHvewhCZi
 KRpvwC3B0WUQIXRNFNykmh51HWFeHbNVTtr9Y3B9hYsKU+0ehIYRwlytxp8V+3UQlezI
 1dbprbfiydafTlynn/zfJwjMA/4yH10j1hbAZwf9VGJn9abZrMe1N61TM76q01GUbIJV
 95Yg==
X-Gm-Message-State: AOAM5319f6MtLjKGd0O15W8p7PJWdYiOsdhHR129mHKF+moDgx2MwLlS
 EkGuweBQNBVuL12ImLkd3DU=
X-Google-Smtp-Source: ABdhPJxvvRhXNKcqO1bTiM4ZyT3p+yoFdqFW2c/Q8PnJnk0OCCarutyRuGNLK94xJdbS6Vim5yuJSA==
X-Received: by 2002:a1c:1f8a:: with SMTP id
 f132mr14774721wmf.186.1633593993546; 
 Thu, 07 Oct 2021 01:06:33 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id n14sm10415364wrm.78.2021.10.07.01.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 01:06:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <c0ea6336-3fa9-ffce-8062-d78db80838bf@amsat.org>
Date: Thu, 7 Oct 2021 10:06:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 01/27] memory: add a few defines for octo (128-bit)
 values
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bin.meng@windriver.com, richard.henderson@linaro.org,
 alistair.francis@wdc.com, fabien.portas@grenoble-inp.org, palmer@dabbelt.com
References: <20211006212833.108706-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211006212833.108706-2-frederic.petrot@univ-grenoble-alpes.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211006212833.108706-2-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.964,
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
X-List-Received-Date: Thu, 07 Oct 2021 08:06:39 -0000

On 10/6/21 23:28, Frédéric Pétrot wrote:
> Introducing unsigned quad, signed quad, and octo accesses types
> to handle load and store by 128-bit processors.
> This is just a small addition to Richard's patch not yet upstreamed
> https://lore.kernel.org/qemu-devel/20210818191920.390759-24-richard.henderson@linaro.org/
> Note that the patch must be applied first for the rest to compile
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> ---
>  include/exec/memop.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/exec/memop.h b/include/exec/memop.h
> index 04264ffd6b..9297f58a39 100644
> --- a/include/exec/memop.h
> +++ b/include/exec/memop.h
> @@ -85,10 +85,13 @@ typedef enum MemOp {
>      MO_UB    = MO_8,
>      MO_UW    = MO_16,
>      MO_UL    = MO_32,
> +    MO_UQ    = MO_64,
>      MO_SB    = MO_SIGN | MO_8,
>      MO_SW    = MO_SIGN | MO_16,
>      MO_SL    = MO_SIGN | MO_32,
> +    MO_SQ    = MO_SIGN | MO_64,
>      MO_Q     = MO_64,

To avoid confusion, I'd rename MO_Q -> MO_UQ in a
previous patch, updating the repository with a simple
sed command from the shell:

  $ sed -i '/MO_Q/MO_UQ' $(git grep -lw MO_Q)

> +    MO_O     = MO_128,
>  
>      MO_LEUW  = MO_LE | MO_UW,
>      MO_LEUL  = MO_LE | MO_UL,
> @@ -105,9 +108,12 @@ typedef enum MemOp {
>  #ifdef NEED_CPU_H
>      MO_TEUW  = MO_TE | MO_UW,
>      MO_TEUL  = MO_TE | MO_UL,
> +    MO_TEUQ  = MO_TE | MO_UQ,
>      MO_TESW  = MO_TE | MO_SW,
>      MO_TESL  = MO_TE | MO_SL,
> +    MO_TESQ  = MO_TE | MO_SQ,
>      MO_TEQ   = MO_TE | MO_Q,
> +    MO_TEO   = MO_TE | MO_O,
>  #endif
>  
>      MO_SSIZE = MO_SIZE | MO_SIGN,
> 


