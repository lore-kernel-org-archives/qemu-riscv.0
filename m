Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pISG0-0003FA-3W
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 05:34:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISFy-0003Bf-3F
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 05:34:54 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISFw-0002yM-5l
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 05:34:53 -0500
Received: by mail-wr1-x430.google.com with SMTP id q10so1414992wrs.2
 for <qemu-riscv@nongnu.org>; Thu, 19 Jan 2023 02:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AEmsREcAFT81eV3NjMeFW98XhnSQZEK0F4zsNMDi1Ps=;
 b=yfxQb6gSS2EA183BSpZd9n6qqwP4FPHxBRAM37QypBhZpGwbMF03Tj/YifDGVxOfWi
 ixq3qTQVYXx75tIvWrJyOTCR2PPh0yJzHP0b/YbDgtGsNRNk2qrBB0rar5Ww4Jx0SUcV
 g09dPNsY32W9uZT3kOrZ6Q3qqgaE1DlOFFpbbx8LreNYCb55FwBTZll1tXvTcrV9fekG
 8CTaljl6cMNa+otP194K8rwD4x1qhm8lBYeNtKNz+B3l7d0RW/MyS1FZ/bTQ3bVBzOoy
 IGfBhgfU0vYIiBIug4KMVXep352OCAehlx0fpx8RYuyAaL2NC2AHCNwfPWB48rdMG7OG
 6LFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AEmsREcAFT81eV3NjMeFW98XhnSQZEK0F4zsNMDi1Ps=;
 b=EgC1NooN7JElv62xzSJ5+YTjC8L7QyOAQhRp5WsMNolwBGERhvvJLvJxZ/gSYaUHOv
 JGUQTORCrZnrVf/sQQeC8Y99oaDkDAd8r+E1yzv3aq5LQx9OhnepfPEwc5h2eV8v4bLQ
 sTsauz7dIEN8HfpfvzBZH3bguXOLyfwvMbCP5vX17z1UHjtdbxtwP4G3O9twGBXSQwYV
 s7XMSd8iRAc0DwPg2hLsiRHFWJUFvWB0T5hyDwp6nCYmvfnVDccIN1Pg7W7aHIEOaJf2
 +Dp0NqJcO9HlLubnnoL5NTYKwjut6bdM6X1f3nMPYoWYtC8Q+yPHgRceJCb1tMizrXao
 5ihw==
X-Gm-Message-State: AFqh2kqm1s8uXVZjntMH6tRLhpglcvewGRWSOnlx9wfR8wEaC3fvnlf3
 Lw3GGGMjXO8IC73pujEPf2RtYg==
X-Google-Smtp-Source: AMrXdXsjAFK8P00t+u/bsFDl+vkhWx8vGZ08Y7Aaa7uS42EjHDsMzmt+D0N0+RIKLePbgkfRcXPYFA==
X-Received: by 2002:a5d:522d:0:b0:2bd:ff91:7e1e with SMTP id
 i13-20020a5d522d000000b002bdff917e1emr8356574wra.57.1674124490801; 
 Thu, 19 Jan 2023 02:34:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m10-20020adff38a000000b002bc83b85180sm24776905wro.114.2023.01.19.02.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 02:34:50 -0800 (PST)
Message-ID: <d27cab4a-b62b-4551-cf6b-8f23bf253e98@linaro.org>
Date: Thu, 19 Jan 2023 11:34:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 05/19] crypto: Clean up includes
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-6-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119065959.3104012-6-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-List-Received-Date: Thu, 19 Jan 2023 10:34:54 -0000

On 19/1/23 07:59, Markus Armbruster wrote:
> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.
> 
> This commit was created with scripts/clean-includes.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   crypto/block-luks-priv.h | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



