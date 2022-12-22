Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8MXU-0000Sq-Os
	for mharc-qemu-riscv@gnu.org; Thu, 22 Dec 2022 09:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8MXT-0000SN-4H
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 09:27:15 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8MXR-0006Y8-IX
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 09:27:14 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso3991572wme.5
 for <qemu-riscv@nongnu.org>; Thu, 22 Dec 2022 06:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=blCRELuzFMtHZANGquiJFCsDWGzE8wQu4+zVF/O08rQ=;
 b=Bpt0hQ2OVOTsTmpF8K/jsYK5fEmPXDcbgi9FxRKxnzkGxPenByDv2+WO5ykoHZH6Es
 Wx/LBj4qcGbh349ZIBYlVQcdQgKyfpGyOMEO1enSWNEmPN19G/yODq9g8/EwrCr7z356
 RanbkZXkDTrVzb7b299QipB/nkdZtNeyr2MJLu93qWm4/AK5bBdW4QHiD3s2hjBLxOLI
 C3zoUAJWkaiTyFRKXDv0orl8yaupROQcHV/bjhMga8vRqcAQyWik5wCCclA2Nsy57e2l
 ls9gEdL8KJtbgkwjOmps3DKuv+E73P26RipCGg3tmd7VO03UluYEpW7vA7V8O22/JMlN
 ukGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=blCRELuzFMtHZANGquiJFCsDWGzE8wQu4+zVF/O08rQ=;
 b=OYXDaLpZ8yoT4pRzmPJy83vFU4TD7r7xP+KCBO28OBbT0kIK2ZA+dTC5K/UNhruFUU
 sgT4Yijgj/juOQ0KHxHZe5ZFlZmIMwBaveNS+DeqtIl4NCx6tLT+MJ+FLfopSHy8rAQK
 pXUb/4os6wtugjQZkeTYlrj2CPMC56Ruo/aNGmS1sw9iYqiqlMVYp2Dh7gTwXKkA3vrt
 yEQIp7xD8kctxdV6rACcT65F+Z7rDmzPnwdpnfZP5MaTnUJ2suU6bBSMmC60j6qoZD/I
 qCaJ7dg2Gv/zfVX1eQ3X2fdR590yYpJRHZT1bMTYhcqq3ofIVi4HW3Sx6F/HXSZmk5tN
 MKUA==
X-Gm-Message-State: AFqh2kqWv55l/DA0yYvUmXXOKcm+FjuAY1UevcmsnkLy+DqFZB6bL4xg
 vCcqAfvlWXNTv/5hk0+3g4MHVCQgYRSnslgENMw=
X-Google-Smtp-Source: AMrXdXtvy3qAmyV4+h3mum48O3Qy3LAq2Qog1PQ1YcAFFFt9+4UEskE5lSBJe8NaLbVxEcsWpiJgiw==
X-Received: by 2002:a05:600c:500a:b0:3d3:5b56:b834 with SMTP id
 n10-20020a05600c500a00b003d35b56b834mr4445677wmr.5.1671719232071; 
 Thu, 22 Dec 2022 06:27:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e2-20020adfe7c2000000b0024245e543absm647520wrn.88.2022.12.22.06.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 06:27:11 -0800 (PST)
Message-ID: <60ba08e8-88a2-4f44-7adf-d6e4af748854@linaro.org>
Date: Thu, 22 Dec 2022 15:27:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 06/15] hw/riscv/spike.c: load initrd right after
 riscv_load_kernel()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-7-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221182300.307900-7-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-List-Received-Date: Thu, 22 Dec 2022 14:27:15 -0000

On 21/12/22 19:22, Daniel Henrique Barboza wrote:
> This will make the code more in line with what the other boards are
> doing. We'll also avoid an extra check to machine->kernel_filename since
> we already checked that before executing riscv_load_kernel().
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/riscv/spike.c | 31 +++++++++++++++----------------
>   1 file changed, 15 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


