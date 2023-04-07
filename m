Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkp12-0003Ro-Rx
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 12:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkp11-0003NK-IE
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 12:32:43 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkp0y-0001WZ-Vy
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 12:32:43 -0400
Received: by mail-pl1-x632.google.com with SMTP id o11so40416881ple.1
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 09:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680885159;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ol3VuGCIGxaKPoYwQmo8ShsyaxboWcCOitXC4rLZuIA=;
 b=I2nF4Wu4Fw6Rf5EzUWwksmJPLsppffLbkAVguQDCkyv1+KyAn/zv37sRVRaWWyaj6h
 D6vYymMHQXK7mfdrenzlmdn45SWO6QXC4W8wReWAfgaJwrRMHHI3+Ii42OGWb4WtNha1
 2J9ir3AqVphNFSzKRmYAEGUYkecyhbg0KiG0Aq5ZpwDQQmru7FVY726wKjZUuWTxt5oc
 qJTyxprrcmN4w2h9G3KsXa0hx1ztj5PGwI1DlEuJMqrp3zV1ZTibzsDggZu4pid9LEFG
 TD4to4Cd+jqbp+hDTCJWvkC+wjefGGflUugdLaAzANLZ1SOWsrQLZlIPTwb97MqmwkpI
 w1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680885159;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ol3VuGCIGxaKPoYwQmo8ShsyaxboWcCOitXC4rLZuIA=;
 b=KT4ALp5LFydmuL8tvr+ZUH5HxlhHi0jML/gqMS9mhtlZUnO5518fipvfdiqDJsAXS4
 eHJmHJjKCyUVU/vkjkwIUdJymIfa9npRegXnSFoOFOvkVOKochVbE6zBzUbMmrQidRgC
 C7FTSZ2X+JR30X67pVNG0qvEIlRts7nZ5kGpy/3PwkyQKiDZkxh7KPE+ES7s1bTjnkHf
 fzFvxNkgo4MRc+viW3AOIRLJa2+jDFBTbbM1CHA4ARk2vOxr3YHSiI0MejrP45dP5l20
 FhEQl2Cv7V4x+EpBoNLtATcE5i+i3IOxQ2ykHRV7lcpGwFdvRer7+GUELn0OhKp9RL4Y
 7WYg==
X-Gm-Message-State: AAQBX9eazsPYwj756urKhYlsNjGJmcQ9ugeDaUF491TgwdXipYDO0dMj
 haFq7fM4PC5Xtg74ulGUQjguhw==
X-Google-Smtp-Source: AKy350a3qDu6/fYxOSmlJyirWMC4Z1iM/402nJxKGqryEqkXdPEWgxqAjpb+APMIJy/9BYRKlh9jSQ==
X-Received: by 2002:a17:902:e412:b0:19f:3b86:4715 with SMTP id
 m18-20020a170902e41200b0019f3b864715mr2841511ple.8.1680885159593; 
 Fri, 07 Apr 2023 09:32:39 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a170902bb8800b001a19f2f81a3sm3113270pls.175.2023.04.07.09.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 09:32:39 -0700 (PDT)
Message-ID: <d15bb9e6-071d-dd04-2677-4ace7578ede0@linaro.org>
Date: Fri, 7 Apr 2023 09:32:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 3/3] target/riscv: Legalize MPP value in write_mstatus
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230407014743.18779-1-liweiwei@iscas.ac.cn>
 <20230407014743.18779-4-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230407014743.18779-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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
X-List-Received-Date: Fri, 07 Apr 2023 16:32:43 -0000

On 4/6/23 18:47, Weiwei Li wrote:
> mstatus.MPP field is a WARL field since priv version 1.11, so we
> remain it unchanged if an invalid value is written into it. And
> after this, RVH shouldn't be passed to riscv_cpu_set_mode().
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu_helper.c |  8 ++------
>   target/riscv/csr.c        | 32 ++++++++++++++++++++++++++++++++
>   2 files changed, 34 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

