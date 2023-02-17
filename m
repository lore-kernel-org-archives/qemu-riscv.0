Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pStUv-0007rZ-Jm
	for mharc-qemu-riscv@gnu.org; Fri, 17 Feb 2023 00:41:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pStUu-0007rG-A8
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 00:41:28 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pStUs-0000x0-Ab
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 00:41:28 -0500
Received: by mail-pl1-x636.google.com with SMTP id x5so196707plg.9
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 21:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ENRC84PSYcXJNXmV9Mz3Zk2hlDOdE7xGSEXc5EjlWbM=;
 b=ak8fwLAnn8wkdT0pGEOvLvSxgrJ1dJmmMcGjHz6g8Ab6PElvrNW6WCD7c9RssVisth
 svC23XUBi9hZHeBrO57Q7ewUAVA+7z7dLBkXaHRzuOvPdbbakN7z0Pr2vLA7N+Zk7ddY
 0H6BnYScc5r+4SxoZ3zh/j777GSGvZD5dBjJ0OxmUsr//kt37n+ppDvobUxJPRJcqkJW
 GC9t5Kg5FZ4uhB//GVVX9Y3sHzv/iCYMaV17cKcK7+FacS/s65O5wVGnpJ2cd4v8NDGR
 ZJ6CcdGwglhV7vepyGfkJMyYMI1NCJEgbtziT5gSm/vThm/kq09kpssV98JwIGECjfXc
 zTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ENRC84PSYcXJNXmV9Mz3Zk2hlDOdE7xGSEXc5EjlWbM=;
 b=FPbmopQrG7oX3YvKAldEAkl5aBLC1yFQmdLINl8D+SmhvvkDT+bD1FgXH5FU1oy+GM
 XPEKiQ9HS+4SXbuWeRJ4wY3qAOIAwxfNCSmMi2SbS9Mzj4t092irKPNxfAzD5+BKTLOl
 qVY4DD0anJogR9413fByhrB16Cpuk5YCsHH3rFkVmP3t9pz7cB2oCTtK/j0kYUGRnAz1
 W5YmAf3ZMRJVDZULp810ivYhxuiII+M0Kh5mwNZpUDS8gD9AEFpuEDfS/FNIzVnvZQg4
 8Y9RqjYyzITDNiRnakNJ+dgTmziK/Xf0VIujDSi+zw7uCSK34O6/bNPfmkucje5muLn5
 bH+Q==
X-Gm-Message-State: AO0yUKW7u4emluthJFW9UqqZrMJAFbI6RoW6gTSrF6puipwoAFfO4o56
 6tcjYpy7kEPKH+DQ+BIOVEzY0A==
X-Google-Smtp-Source: AK7set9qZ9mlhkxvEpy2mWj/3h0vUzfi5DgUCSaocFeFTCDCqyB4sksIn+UKvmYKyfcCg0OiyY4n6A==
X-Received: by 2002:a17:90b:3146:b0:233:76bd:9faa with SMTP id
 ip6-20020a17090b314600b0023376bd9faamr9407686pjb.47.1676612483722; 
 Thu, 16 Feb 2023 21:41:23 -0800 (PST)
Received: from [172.20.100.240] (rrcs-173-198-77-219.west.biz.rr.com.
 [173.198.77.219]) by smtp.gmail.com with ESMTPSA id
 q18-20020a637512000000b004fc2eb3fe45sm611188pgc.54.2023.02.16.21.41.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 21:41:22 -0800 (PST)
Message-ID: <38499f24-94b5-1e46-2561-bce47bcc92ed@linaro.org>
Date: Thu, 16 Feb 2023 19:40:58 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 2/9] target/riscv: introduce riscv_cpu_cfg()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
 <20230216215550.1011637-3-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230216215550.1011637-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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
X-List-Received-Date: Fri, 17 Feb 2023 05:41:28 -0000

On 2/16/23 11:55, Daniel Henrique Barboza wrote:
> We're going to do changes that requires accessing the RISCVCPUConfig
> struct from the RISCVCPU, having access only to a CPURISCVState 'env'
> pointer. Add a helper to make the code easier to read.
> 
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.h | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

