Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZCSP-0000oS-P5
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 10:08:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCSO-0000nE-My
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:08:56 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCSN-0004hA-1z
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:08:56 -0500
Received: by mail-wr1-x42a.google.com with SMTP id t15so9156580wrz.7
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 07:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678115333;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NjfFXgRBu2mFU/p8wC8b/Tz6qqP/Z/aF+roBFRxHKpc=;
 b=lYZecB/TCNAmO4XeEvAZGWBge/fE6Wjpe6tEg35igN4c4rJ6Bx/m3Gb6EdJQDU68pA
 xQsHm5h5160AonENwjHPFobESvaYaWT+uaQccM1Hd/B3H+INs12RmL9EHm9tsX6cc9Ky
 0Lk9P7cmayaZV7uLYlybtadX1TqaNQeTv3Qy3kA1em5zMFjZ0/i2ScChBMfqg41Xb21+
 1LJaUTpOCDqv84RbTCAeHGeIbMDooYFX/UlkHhY2NJjlJnfPCyay6KFOeJ469eO2ZnMo
 B/fprfw8aqBXl+rcjIUShJ1rJhC8jXCyVxHiTGvnDKGJeVe1YVaVs9ovqaK7w/P6/Q42
 9Xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678115333;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NjfFXgRBu2mFU/p8wC8b/Tz6qqP/Z/aF+roBFRxHKpc=;
 b=bxIrOsLelwhXmBU7xubeC4qmV+mUtsDjQzAKXq0Le6LoKfBFgmb/iFZewjLS8uXcB0
 rWNeCD7/OGNOOqtdMLhbRIPenKxNQv5nMNQiIkMN5c1yGRjfgYriZQlksUfnTVmPO9v9
 VWLqs6Wkg8o9jWq7kKUWu3CUl580qNJhuTx5pFbktI1CgcQbzak4myViLYddrjFHfkb4
 WG+KoJfUyyQ4n7lx2bXa04DYQRF6YRbn+GSrp//L/jzYgh2FpBKU40Mq6cKR680PndDx
 hXdffggKxElDG+lk6aZvMWlAYH3AlqTH4L4Rtf4kTmNxOYnsw+enHLFysYJUM+K2JO/W
 svsQ==
X-Gm-Message-State: AO0yUKWjtmCIn1/qTAJJDBsp7nRtYd38iQHzOkvHj4J6zJWR0KUzTcIZ
 aFFDydv0e9lC2Mjon56oQpfyIA==
X-Google-Smtp-Source: AK7set/7yu/ae7ayZS9pWEsoPhGB+P0rghncAnSIO3akOJqA6TUk1arGpBN0AS3lvsK9DJnTPGlsNA==
X-Received: by 2002:adf:efca:0:b0:2ce:34c8:44c with SMTP id
 i10-20020adfefca000000b002ce34c8044cmr6637846wrp.19.1678115333400; 
 Mon, 06 Mar 2023 07:08:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r11-20020a5d494b000000b002c54c9bd71fsm9782018wrs.93.2023.03.06.07.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:08:52 -0800 (PST)
Message-ID: <3e3c97bc-973f-b0dc-a84b-39390adf26ad@linaro.org>
Date: Mon, 6 Mar 2023 16:08:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 34/70] target/ppc: Split out gen_vx_vmul10
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-35-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-35-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 06 Mar 2023 15:08:56 -0000

On 27/2/23 06:41, Richard Henderson wrote:
> Move the body out of this large macro.
> Use tcg_constant_i64.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/translate/vmx-impl.c.inc | 95 +++++++++++++++--------------
>   1 file changed, 49 insertions(+), 46 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


