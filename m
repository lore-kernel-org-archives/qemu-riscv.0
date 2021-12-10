Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvhos-0007zx-AZ
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 10:28:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mvhop-0007xo-BG
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 10:28:19 -0500
Received: from [2607:f8b0:4864:20::1036] (port=40608
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mvhol-0000VD-Vw
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 10:28:18 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 gf14-20020a17090ac7ce00b001a7a2a0b5c3so9663320pjb.5
 for <qemu-riscv@nongnu.org>; Fri, 10 Dec 2021 07:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HXdL9Wxu8vJBtlrwI2yuHfy/5s/Kql+/SWzhOlK7YO4=;
 b=jp1R95KgIML3TQMBubHygrP+fsnhwjAnsegKzgRkX+UNAx54szLM/e/uuvynFeCqGK
 wcag7Fi51ouHZa8Eznms7qnk5x9IkwUrIUCu9/5+nuCQS7qCYPlgBaDMQJoupBQoPPj/
 VZm2rotJeD9/RSCHTD83JZPi3ImkmYHbarLdc6Jy9SM7mgVi1GIjuvvhdBnmp+FDQ+d0
 ZGkT3uuRP9T9H4vEbEmGJ/OXa++UYWV8zylgwmiti9n741Iy4bsqVa0PYDak7zeFLPbG
 5qYjn3URZclwj3Wsh20bjqaRRQzI0I6+FQzwUJHE6pdpwR8FCgsyfsjagYQxeg2hu/6i
 6xbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HXdL9Wxu8vJBtlrwI2yuHfy/5s/Kql+/SWzhOlK7YO4=;
 b=vu409wy9A8k17RFjHHYfgD2BsZ9LC1C2QleftyfRujX+UgtgLNivPnk+iNyeyq24Z8
 Yb1URzp1eDqv3MkIBborXqTLKr9VZLHSDz5XYiJj3K80NMokvn2nAaDvnQHvLlBLS96n
 UUxSL0Gd4bhxBpcOamMch3B51FYdMlZltdwZ+0lojdza7V+V6MSmAIaJrbZLS6utHAnv
 JryNNbFYLSwyl6aMQHyoFWWjnMP4zbVKH7sgBboRNeWP6l8C2/UiowwGcMDPRZwX4Jot
 FOVP9NU5T42Vs7+/y7cXATu5Ln+wEhHYELuDjp0oYTcxWQyhOYf9KZCpjz0Mfs46la+b
 oJxQ==
X-Gm-Message-State: AOAM532BTaZFxsp935GbphCTEMSieRTWYY9coyccL0M2iB0NWlx5FyET
 yWMstKDw+6qpQWQNxRBjMWuOlQ==
X-Google-Smtp-Source: ABdhPJwl856RlVd8/Y9QSt9wECXY9zb7JigiAUijcFXSAAC/Zo/ZWBhfHmBE8leyPMP/rLrS18Qo5Q==
X-Received: by 2002:a17:902:e544:b0:144:e3fa:3c2e with SMTP id
 n4-20020a170902e54400b00144e3fa3c2emr76960689plf.17.1639150094374; 
 Fri, 10 Dec 2021 07:28:14 -0800 (PST)
Received: from [172.20.1.20] (45-19-222-18.lightspeed.sntcca.sbcglobal.net.
 [45.19.222.18])
 by smtp.gmail.com with ESMTPSA id ne22sm3240433pjb.18.2021.12.10.07.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 07:28:14 -0800 (PST)
Subject: Re: [PATCH 1/2] target/riscv: Set the opcode in DisasContext
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>, bmeng.cn@gmail.com
References: <20211210062638.824672-1-alistair.francis@opensource.wdc.com>
 <20211210062638.824672-2-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2088e128-a1d7-b46c-68db-a625bb75e998@linaro.org>
Date: Fri, 10 Dec 2021 07:28:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211210062638.824672-2-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.317,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 15:28:19 -0000

On 12/9/21 10:26 PM, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/translate.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

