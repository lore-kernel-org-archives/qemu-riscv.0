Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1moYhZ-00063v-L8
	for mharc-qemu-riscv@gnu.org; Sat, 20 Nov 2021 17:19:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moYhY-00063C-8I
 for qemu-riscv@nongnu.org; Sat, 20 Nov 2021 17:19:16 -0500
Received: from [2a00:1450:4864:20::436] (port=39704
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moYhW-00052n-TL
 for qemu-riscv@nongnu.org; Sat, 20 Nov 2021 17:19:15 -0500
Received: by mail-wr1-x436.google.com with SMTP id d27so24930101wrb.6
 for <qemu-riscv@nongnu.org>; Sat, 20 Nov 2021 14:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uXpyrC3qcidqF3BCl1Do1azpcuOZyCIiAoL+Rqxq15I=;
 b=EyFzoMUjIWnA2XtGyopqjuBUaABAbS8r9QmfS9lYoykxav7lR36SlBYVWHfGMVh+GZ
 qFE9rcyxmRgzC+5bgNAoF3B8W39p22GXumdz1GiSyl2hq2CzKr9KoCuZktBmICnYd3xu
 Wqm6SnK7/De9fBTpE4YtUl3myIeQD+OeLS1phSLMOmVThPPV+4hUOGJTUM+7EAnXnZut
 Hg86IXxGUQMNrSixBsQBPOuXy2jvrf20Zl76iyJGQMkncUDZI8bHrUm0TiqSSmOIM+LX
 cezZDw92VYbf0UuTme357HoyazA/F5iI75qch/XDwcRsqSEF7toMsDcuzOF7ow2bC2K0
 8cjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uXpyrC3qcidqF3BCl1Do1azpcuOZyCIiAoL+Rqxq15I=;
 b=TWSKeOFZB3RRr4DFPPGIBAEEfu9HAg9YHFyAwNpsJEt0euEm+hke5WPOwJCSd8Nn10
 3eQTchjWn8+QOulF7JSYn4k0uqblLhkXu+4iczMHKz0fg4xKnMo58GoStc/M8dYuBGU6
 NSUbFDR0CG4pKL4HyVXTwrbGdmvAKNunqHKlF0hP0whj+g8/xBX85OEUM74fnhz8B9rl
 8wZi3IAuvQUEKy0jeQBcMtnWOmVKL70qLpa3OCFcWYyVI9h7I8y0MTiwBbDETtX3p9pK
 k/sf57FtcZPuf2sgwl5n9H7dcAsUB8pG0iAKRrO4ZEwpGBydTXk0HJiiIuVVh3E7PQmx
 sr9g==
X-Gm-Message-State: AOAM530s4Sm3/IDeNsfexZOoI4dFnCPP3etHcGkKM6J43dRleK9Tycdt
 Kn1KrTpxR2lvnCDiZvCm/JUmxw==
X-Google-Smtp-Source: ABdhPJwt3VRvGHP0CCY2rFKpcz53xmoIFof/nEioGKwB8HlHCSQrP1T1ej681ezuKRf/sSUj8+l5/g==
X-Received: by 2002:adf:e482:: with SMTP id i2mr21442964wrm.284.1637446752957; 
 Sat, 20 Nov 2021 14:19:12 -0800 (PST)
Received: from [192.168.8.101] (77.red-88-31-131.dynamicip.rima-tde.net.
 [88.31.131.77])
 by smtp.gmail.com with ESMTPSA id b197sm4012974wmb.24.2021.11.20.14.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 14:19:12 -0800 (PST)
Subject: Re: [PATCH v1 03/12] target/riscv: Implement function
 kvm_arch_init_vcpu
To: Yifei Jiang <jiangyifei@huawei.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bin.meng@windriver.com, Mingwang Li <limingwang@huawei.com>,
 kvm@vger.kernel.org, libvir-list@redhat.com, anup.patel@wdc.com,
 wanbo13@huawei.com, Alistair Francis <alistair.francis@wdc.com>,
 kvm-riscv@lists.infradead.org, wanghaibin.wang@huawei.com,
 palmer@dabbelt.com, fanliang@huawei.com, wu.wubin@huawei.com
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-4-jiangyifei@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d3f974e1-6278-8c11-898a-a1cc55965786@linaro.org>
Date: Sat, 20 Nov 2021 23:19:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211120074644.729-4-jiangyifei@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 20 Nov 2021 22:19:16 -0000

On 11/20/21 8:46 AM, Yifei Jiang wrote:
> +    id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG, KVM_REG_RISCV_CONFIG_REG(isa));
> +    ret = kvm_get_one_reg(cs, id, &isa);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->misa_mxl |= isa;

This doesn't look right.
I'm sure you meant

     env->misa_ext = isa;


r~

