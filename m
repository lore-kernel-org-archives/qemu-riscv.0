Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQ10b-0005IN-9Y
	for mharc-qemu-riscv@gnu.org; Thu, 09 Feb 2023 02:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ10Z-0005He-2n
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 02:06:15 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ10X-0006dx-5L
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 02:06:14 -0500
Received: by mail-wm1-x32e.google.com with SMTP id u10so752628wmj.3
 for <qemu-riscv@nongnu.org>; Wed, 08 Feb 2023 23:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iRuTkb3w4DYwZGdSllWXBXTGBdpSnpukaC5Bgij9Ov8=;
 b=qc6TvSzz13e5xf8RDVnlvF+td7+rrdZ8knnkNrYzP9Ir879bq4LytglVEK09sf9LdR
 wEJoHMrZVI2f+ZQWOUyAHHntqZPXILBOR2+6P4MYUYy+ZKtB0QnMbtiUVUx4qNkCgwNc
 m1sygcsgoas3YnWPH5lFz1sCP8cEd+707qStywEqyAV85ypgIlr/MXJKrY1Ni4COZ92C
 1JyuISgcmJU21VE/bDV23YWiw/eUWhc5qHai3/W58kCOGWVIKs/lC7G4+5R3PXH5Thle
 lMtX762PzkJ5XfT8PkBLGK+9VErCZnynjSDx0ux37vaHpopdVKndSEkNdmBgEdqnfAmb
 TLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iRuTkb3w4DYwZGdSllWXBXTGBdpSnpukaC5Bgij9Ov8=;
 b=ACqeP0jmttB8gyzchYPr5JZZ7h60PEgkEM1vqCy2gS34BtW57xo5VF/nYE8cqmUgJV
 AwWNGI4jz1GIbLU8T5Y2wikwMfuapHwie0kg7L+EX/TkAKUq5z55G4AbzcMVo8rGCkLi
 UyXqy6XgOEcwd8KiNhEn5cYLzGOhrJ2FuP5K1MlycVhA8SpbCvkwOOtlcRfGU3qAyXYF
 LIkRenkvyax2k2QUu6V3WzshuTzHz45Vo7hQYdToRP+3UCTZ3dYGk/6tLsgfEzYWwiek
 SuiYCHfqn8QMTfPrORhI39JB1n/cuBSpFbJ5p5CIeQuBGEbUUtAIRw8b1SiwlUdYhFSF
 Wxww==
X-Gm-Message-State: AO0yUKU+EOrGbtdXxNPkHuXQPZAmwNu5I8eVKHQdBt857nPpsMrnqtwr
 AW6ggUhdtn+FgRGn3dlTd3jPUA==
X-Google-Smtp-Source: AK7set9/BYBU6AOBnQKu0jvWU7ZU5Tb0dACjKFSmMQhox7dZq/uO5oeS0U+ijoMyTM5TsIOF7YcTQw==
X-Received: by 2002:a05:600c:993:b0:3dc:4fd7:31e9 with SMTP id
 w19-20020a05600c099300b003dc4fd731e9mr9975045wmp.7.1675926371595; 
 Wed, 08 Feb 2023 23:06:11 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 ja13-20020a05600c556d00b003dc4b4dea31sm875798wmb.27.2023.02.08.23.06.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 23:06:11 -0800 (PST)
Message-ID: <6744fece-c121-c6da-c811-de88d65e0b89@linaro.org>
Date: Thu, 9 Feb 2023 08:06:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] MAINTAINERS: Add some RISC-V reviewers
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: bmeng.cn@gmail.com, alistair23@gmail.com, dbarboza@ventanamicro.com,
 alistair.francis@wdc.com, palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com,
 liweiwei@iscas.ac.cn
References: <20230209003308.738237-1-alistair.francis@opensource.wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230209003308.738237-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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
X-List-Received-Date: Thu, 09 Feb 2023 07:06:15 -0000

On 9/2/23 01:33, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> This patch adds some active RISC-V members as reviewers to the
> MAINTAINERS file.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   MAINTAINERS | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



