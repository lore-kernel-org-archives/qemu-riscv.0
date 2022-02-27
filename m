Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOOdu-0008Uu-2E
	for mharc-qemu-riscv@gnu.org; Sun, 27 Feb 2022 13:51:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOdl-0008Sa-1y
 for qemu-riscv@nongnu.org; Sun, 27 Feb 2022 13:51:30 -0500
Received: from [2607:f8b0:4864:20::434] (port=34728
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOdj-00060n-74
 for qemu-riscv@nongnu.org; Sun, 27 Feb 2022 13:51:28 -0500
Received: by mail-pf1-x434.google.com with SMTP id g1so9136283pfv.1
 for <qemu-riscv@nongnu.org>; Sun, 27 Feb 2022 10:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RLHBL3JagmCoUGNMMJMHaIspdw14OW7z5m0+E5Qi16c=;
 b=FlxtHcq9sNQcAGxYGRZY4wdeSI8cnqqDSjOR2KXaZOIsHyhdpZzi4fupWoJ6PMB/CJ
 ESsgE0pYt0oKELH5c1sSkOX4j9bmubfi5v9lxSztb4gtYlkypeI163b7WkrUOOKNUN9N
 7WuGl/J7gT02ZCvBg9x3uTvO1TeN2jdrj5XFOPbps2U8OfQpA3VDeZ7Z+e1RzYiUARvd
 kW9z3a4fDuGLTz8/R3p8AtmbM40ql1SOoZiU/5ZcVlKcQJfBc+taCD2KZAeth3t4z5Gl
 GywHGmWHzfpKYLNuMmRxwpuCQ99xP6aEAaBA87Wvf9JggyHDUA7yL4TT5pEx6jW5X+gI
 NUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RLHBL3JagmCoUGNMMJMHaIspdw14OW7z5m0+E5Qi16c=;
 b=UXV1xSa1n4nmHi6TsAKF/J/60/34n030wRQWCHwChUm2CzK9l/zpoYoxqaG/bnR+Nu
 7B1XS13lS7L/or702qPFklf8XjtxvRxD0z1WrlkV3jNtm7dqeTyHr12q7xlQWjqBjIV0
 siGcn7xWoN0JcNND7fM2xWMymm8pXpTV/HyOm23vQ4Gfyg9yVPv8XlXMLe2qfOqZl97n
 5VU71eokzere0MOH+WPerVADXaPpUjULINtP/pvgwi4r6RD1BgM7oM5aedsLfaA88jtm
 5hcpVO/JKaz65lK0QSnQrsuDnvKOa8Re8E2+/hZ3CvIKB69NzZFc9MS5ScUbazT0pkWv
 ulbA==
X-Gm-Message-State: AOAM531Tf6/Y1U3lcMbZAAe4JPB8SAPinxGtOTavzKIClVWK/Xg2Ibod
 TesNygSInxHHeFCsRD1A/Se1pw==
X-Google-Smtp-Source: ABdhPJy9KO6El2UJpOULHa56a6cmdSNQ3FM8J/Nvo2ezb3P7b7iUYx8GdPQuKbhZO+rlt/bmn2Y2yQ==
X-Received: by 2002:a05:6a00:140c:b0:4e1:530c:edc0 with SMTP id
 l12-20020a056a00140c00b004e1530cedc0mr17998720pfu.18.1645987885531; 
 Sun, 27 Feb 2022 10:51:25 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:23be:43d9:7006:705a?
 (2603-800c-1201-c600-23be-43d9-7006-705a.res6.spectrum.com.
 [2603:800c:1201:c600:23be:43d9:7006:705a])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm10593006pfj.43.2022.02.27.10.51.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 10:51:25 -0800 (PST)
Message-ID: <9f65cc93-49bf-2514-9d92-02d13212e288@linaro.org>
Date: Sun, 27 Feb 2022 08:51:21 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 05/14] crypto: move sm4_sbox from target/arm
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
 <20220227142553.25815-6-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220227142553.25815-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 27 Feb 2022 18:51:31 -0000

On 2/27/22 04:25, Weiwei Li wrote:
>     - share it between target/arm and target/riscv
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Reviewed-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   crypto/meson.build         |  1 +
>   crypto/sm4.c               | 49 ++++++++++++++++++++++++++++++++++++++
>   include/crypto/sm4.h       |  6 +++++
>   target/arm/crypto_helper.c | 36 +---------------------------
>   4 files changed, 57 insertions(+), 35 deletions(-)
>   create mode 100644 crypto/sm4.c
>   create mode 100644 include/crypto/sm4.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

