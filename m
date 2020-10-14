Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSnHX-0001pf-Bz
	for mharc-qemu-riscv@gnu.org; Wed, 14 Oct 2020 16:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSnHV-0001n6-KH
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2020 16:21:53 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:55776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSnHT-0000nl-0g
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2020 16:21:53 -0400
Received: by mail-pj1-x1044.google.com with SMTP id ds1so370686pjb.5
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2020 13:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/Hju540kJqtJpEYf8VHbuGev0rjwVMmjPN5aCVW9Yww=;
 b=RI2ADYxI3R5szbqv8P6TyetYks8Hv+qbb2IQt7o7Ez4q4be46/S8Vdz5o7IJHZb39H
 4wArwJDcLCJUBgMOHk8UdZLFQSK2JR4Ph6X6qfQUGFzMwrjTzrArlXIfOAy87Cc4aLfp
 aiZm1+VOIbuQmnj6dqnUsTXMdONB0Rb7i4raF9fOGM7qQi8/9LCrc4XRnwqLdUVt4VcV
 1p23AltLZ47nXZGPAM/+RStkyPpVfXwYMHDItSm/9UDowcfzBCBiPKXKxTrEICM3N4Lb
 xLkoe9F07zGGNZlBf/AtNKLWYgz/Keq9F+9cqtU78vPzKlM2Bru+2WTR68VCd4oWbOrc
 oNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Hju540kJqtJpEYf8VHbuGev0rjwVMmjPN5aCVW9Yww=;
 b=lXvEl2BXXZTfCQed3h1OgggEWEhUS+R8qsV4DwLM7u4dmDkEJ+tvcXpz43QajbNAzM
 V+zCoqitPGcLmXRF6D98sWUAroL2Y68/erFbXb5GIFRmsDePNVl6j7NdZkkLTKO3g2S1
 dVa3HKFmmI3xRxoDaGYjw/h5ris2LZmykEC7/gAED0bYH2IR2WUNOUIEdZydSbTpfhF+
 Ck7I8mFMEWNNO11eizDVTzBqiOMLmJki9hR2AA9X41X4vnFhB6BtOuBpOE0KssrQFO+Z
 LrZurGz5nwO/6Wqdj5y59uG+Lz6ayUGNK/halVPOliJr9FuIYI4c46bFTAjroS/c0L2J
 XI2A==
X-Gm-Message-State: AOAM533eIC9gpywPAznmuoR3OaeGXGfNVpW/48mjtL851mkzDPrt/R+/
 NNefcP5lnqDiXkSdeh+UWNsgMg==
X-Google-Smtp-Source: ABdhPJwg1m2go9q0rSA9e/dh3bJhHcDEjYqFng0Tro4WOMID/4ik8E+mAainvJw8hfH7Bnp7syeyBg==
X-Received: by 2002:a17:902:bc8a:b029:d4:dc57:6c29 with SMTP id
 bb10-20020a170902bc8ab02900d4dc576c29mr622919plb.77.1602706909308; 
 Wed, 14 Oct 2020 13:21:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 3sm481863pfv.92.2020.10.14.13.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2020 13:21:48 -0700 (PDT)
Subject: Re: [PATCH V3] target/riscv: raise exception to HS-mode at
 get_physical_address
To: Yifei Jiang <jiangyifei@huawei.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, victor.zhangxiaofeng@huawei.com,
 wu.wubin@huawei.com, zhang.zhanghailiang@huawei.com, dengkai1@huawei.com,
 yinyipeng1@huawei.com
References: <20201014101728.848-1-jiangyifei@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee4b99ec-5842-6638-ecff-54096ec0b0e8@linaro.org>
Date: Wed, 14 Oct 2020 13:21:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201014101728.848-1-jiangyifei@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Oct 2020 20:21:53 -0000

On 10/14/20 3:17 AM, Yifei Jiang wrote:
> +                if (fault_pte_addr) {
> +                    *fault_pte_addr = (base + idx * ptesize) >> 2;

The shift is wrong.  It should be exactly like...

> +                }
> +                return TRANSLATE_G_STAGE_FAIL;
>              }
>  
>              pte_addr = vbase + idx * ptesize;

... this.


r~

