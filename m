Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8MYF-0000n2-WF
	for mharc-qemu-riscv@gnu.org; Thu, 22 Dec 2022 09:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8MYB-0000lX-2w
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 09:27:59 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8MY9-0006bg-HY
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 09:27:58 -0500
Received: by mail-wr1-x432.google.com with SMTP id y8so1785610wrl.13
 for <qemu-riscv@nongnu.org>; Thu, 22 Dec 2022 06:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SYr3ZE5mnQEuANkbaf+1RJ1Bpay47v3iAOywUBFw9Hc=;
 b=nkDqL4XgGLE5cv9u9XoqZamjhYbNlW7N/wUelrsjrgw+5IS7XSSB5vPbd87Z65taNI
 3w3ljwzLLzwXdanOMWBdr+OaFlI+zImWJuThXIhsOHLSau20TkX5jC8ZbBkhmYleOGzY
 msVPf3LAXO1vf+9NB0pAKwcqxmv4y18ouXSvwkyBjj4JAQC2e0920oDxQ+Y0q51Lb3xN
 F7fq4wOCJoZBYq289e+9ScJGh6D2+QcMkVdJzhpUHjsDe6NYx5bJlzMiVNlMasNINMCo
 UTEsTYJs3U+vE1PiiIhwYL1WSFtasqeR3hP6vydoNbxDhjHL7G8wK5NHJv/j8nGA12V0
 HYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SYr3ZE5mnQEuANkbaf+1RJ1Bpay47v3iAOywUBFw9Hc=;
 b=TUTQ9YPs3niEglAW240pw6mfqTbtXBz4nQuzJR5yj8/r8Fr2yx2b3/90SnqmVGVKod
 b2VcDfmXTvvhdNNUtcMioe9xalbs41FIHuAShNSkfnmIA9pLyqMt6vccDZENY5IoULhX
 TiuTNFjUkOEAZ4cqgU7OR9LPhi6gAlJ3uCdaijadtZHyzAMG7UD2q4sBHfTZ6s5PFzYs
 nQrQIadGStLD0Q12R1wY2Con5H8paVBQc3b/nBoOQY/bvfSBVZrDZffZxNs83nvUtWkj
 zZOTOXfUA+AGaqBP1ALayxqa+rQFwx/BfS2McVP1DSUj1kqrGbTInLbyrRw1IEsQRh4E
 z+kg==
X-Gm-Message-State: AFqh2kp6B1GHcMSRqDCSmOsVahia30C3ZfDTFKpKlXy0O0ruoEpIK7Xe
 jb5Kq1qwVLzwOxqsYQgEbXZnkQ==
X-Google-Smtp-Source: AMrXdXtfM1FWb6vdVGELDcYc8GxFQqd9sJmkrcw9FIUJPs8sSq+mR03echfDPOP6WZjGV7kjHG22Xw==
X-Received: by 2002:a5d:54ce:0:b0:242:486:5037 with SMTP id
 x14-20020a5d54ce000000b0024204865037mr3713658wrv.32.1671719276250; 
 Thu, 22 Dec 2022 06:27:56 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j13-20020a5d618d000000b002425dc49024sm714675wru.43.2022.12.22.06.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 06:27:55 -0800 (PST)
Message-ID: <d08c3f65-42e3-b9d8-39bc-7506047fa39b@linaro.org>
Date: Thu, 22 Dec 2022 15:27:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 09/15] hw/riscv/boot.c: use MachineState in
 riscv_load_initrd()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-10-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221182300.307900-10-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 22 Dec 2022 14:27:59 -0000

On 21/12/22 19:22, Daniel Henrique Barboza wrote:
> 'filename', 'mem_size' and 'fdt' from riscv_load_initrd() can all be
> retrieved by the MachineState object for all callers.
> 
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/riscv/boot.c            | 6 ++++--
>   hw/riscv/microchip_pfsoc.c | 3 +--
>   hw/riscv/sifive_u.c        | 3 +--
>   hw/riscv/spike.c           | 3 +--
>   hw/riscv/virt.c            | 3 +--
>   include/hw/riscv/boot.h    | 3 +--
>   6 files changed, 9 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


