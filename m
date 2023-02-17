Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSqI2-0007i1-4y
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 21:15:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baxiantai@gmail.com>)
 id 1pSqHz-0007hU-RR; Thu, 16 Feb 2023 21:15:55 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baxiantai@gmail.com>)
 id 1pSqHy-0006uk-9d; Thu, 16 Feb 2023 21:15:55 -0500
Received: by mail-pl1-x630.google.com with SMTP id i15so1325109plr.8;
 Thu, 16 Feb 2023 18:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=65HZqLr24EvYMLceZSWjbgB+D4Bc/r0FogWKLBf3HF0=;
 b=DPRGGIhNT+O9RpP0M1TylXjBoVpKc2ipYIHtMNnPyjyoKaJC00z3R9X+stClEzny4M
 OsU0GxmpEYXr5orNaLYqnCKP84+E9kzFPMDvDd1DSqboLkQFSH2YvN5ofwpVWWKrWAmT
 bfHlMLU8ocUAYpNCBf6YxNccTMyIVEdH0tOkDbs8gQWHBiUzpXw6aCvQEMxFQ5SThMEq
 KsCxPZAMFXtFhuhdvWTWrlmEpE5Bsc9vUggV0Eu8RGQilojhQIXtO4ivd48R6eKESfkt
 KZNuclJkV5U7N+hqRhP4kHkE+es4Fm/Hd6fdkw/wi3HuqH2rbsqnk3Koo+OdSHFkr3Id
 OxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=65HZqLr24EvYMLceZSWjbgB+D4Bc/r0FogWKLBf3HF0=;
 b=QbNwD6QY4l1h29jJNirrVuyqLYc9XpYmbu7ZLyipP+/JMAWJCin/OsQNwnfJ6e8khF
 pZGjWi/7iFVwd1hYce2y9FRX3OHue3piqKZ1NhoXDOp4PqasllqeP0t+C0kHAZWh483N
 2URYkcZBULyenQRNT6JQDKUxAsph1Lo8SJUPsyhm5CHYTowyhk2ux/v5dsYOU2zBq/f+
 2ud49sSvFQl0+AnnxXMEI+FgGxW6xxmlplqa3hicdZ/RzdRKzVPSMQlqVubsn5nAIvTu
 SfKMzhFsIm73GQV9Kto+RPWOOnjpyCM3rRIkgjVss8cTB3iWYdVGW31+uPo6zUBEv4Le
 f5SQ==
X-Gm-Message-State: AO0yUKXFz50NmcyHRJxb6DXXJ9+iyG3szt/LOL7H2pPWsfq6vjx7++/3
 XsbDVTGFw5dSHtkFQrJ/sPY=
X-Google-Smtp-Source: AK7set+RPRzD+DM2Dgu+p+M7oOQlZ5C2uXUuEFcnD7QO1zwYyzpeagzS8nKZnGrN1zELPpDnmBfBWQ==
X-Received: by 2002:a17:903:234c:b0:19a:7f4b:3ef6 with SMTP id
 c12-20020a170903234c00b0019a7f4b3ef6mr9708514plh.3.1676600152540; 
 Thu, 16 Feb 2023 18:15:52 -0800 (PST)
Received: from [30.221.98.44] ([47.246.101.60])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a1709026b4100b00192aa53a7d5sm1945182plt.8.2023.02.16.18.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 18:15:52 -0800 (PST)
Message-ID: <9ea6def2-5648-11d1-261a-d4a42cec2f24@gmail.com>
Date: Fri, 17 Feb 2023 10:15:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 02/18] target/riscv: Correct the priority policy of
 riscv_csrrw_check()
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
References: <20230213180215.1524938-1-bmeng@tinylab.org>
 <20230213180215.1524938-3-bmeng@tinylab.org>
From: LIU Zhiwei <baxiantai@gmail.com>
In-Reply-To: <20230213180215.1524938-3-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=baxiantai@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 17 Feb 2023 02:15:56 -0000


On 2023/2/14 2:01, Bin Meng wrote:
> The priority policy of riscv_csrrw_check() was once adjusted in
> commit eacaf4401956 ("target/riscv: Fix priority of csr related check in riscv_csrrw_check")
> whose commit message says the CSR existence check should come
> before the access control check, but the code changes did not
> agree with the commit message, that the predicate() check came
> after the read / write check.
>
> Fixes: eacaf4401956 ("target/riscv: Fix priority of csr related check in riscv_csrrw_check")
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
>
>   target/riscv/csr.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 1b0a0c1693..c2dd9d5af0 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3793,15 +3793,15 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> -    if (write_mask && read_only) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
>       RISCVException ret = csr_ops[csrno].predicate(env, csrno);
>       if (ret != RISCV_EXCP_NONE) {
>           return ret;
>       }
>   
> +    if (write_mask && read_only) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>   #if !defined(CONFIG_USER_ONLY)
>       int csr_priv, effective_priv = env->priv;
>   

