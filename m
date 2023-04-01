Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1piPtU-0005fw-TI
	for mharc-qemu-riscv@gnu.org; Fri, 31 Mar 2023 21:19:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piPtS-0005fK-LK
 for qemu-riscv@nongnu.org; Fri, 31 Mar 2023 21:18:58 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piPtQ-0003SZ-Sv
 for qemu-riscv@nongnu.org; Fri, 31 Mar 2023 21:18:58 -0400
Received: by mail-pj1-x102c.google.com with SMTP id q102so22270696pjq.3
 for <qemu-riscv@nongnu.org>; Fri, 31 Mar 2023 18:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680311935;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gXC/VCdc+dvVE7dTFsNO2McLEihGqVq5qip5L/HC9N8=;
 b=TlEX/TKQ6Jt7oHVHbhp4dFjLg3bb775gJpKholl6iXrj/n/hY2+zj/KDUMlQTliLGd
 RQa+r32+CPL63Wv2RBiwqVa8izByftzyA8hB3OXIiiUarzL8rIWQqSzWomM1LOzCgjj4
 0ar5uuppqdkHyW0yqv0AK5N0tjzSYV3ZjGmO8hSOAu4ixEpMuRaFD/WaMi+YgmlgIM9i
 BfldM7D7kJppMaHHD0ZMLLsp8Qz3pG/KpQ8XVOSHzQn78bLR99KDMBYn47/yIqherMgm
 PBXqDUveCbWa+N2KHIpOVgu12CQ8y6Xv1v8t4IClQJ59c7uGYSKa0vm5NrRY1eBxlgGf
 aiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680311935;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gXC/VCdc+dvVE7dTFsNO2McLEihGqVq5qip5L/HC9N8=;
 b=sBfdWmwf85UdhBc+zN8uyNO1a2BUBUIJKYFm8t/mpI5DtmMb65HWTN2nOZ+Jqv9GWh
 R0sUVzaWPFi7uNjaK9LEhtPQJU47Wo5FI13SjI3x2DYpYb7JNz0hry83tNQEF+LGiE09
 vGKu53mMkEGSy2hPn7+pQVhH5xjqaZ1ciP0d1FAfQCw2zf21Tsi5VSEXpm7Qa3ffJGt6
 ff2UcXz/eM68x0AdJmtfnSCPItWH/7N0WupIQ1bR8+fl26DY4ghyeWdOTreqEAFyJSOE
 52s7W5Qhux7xmI26XoUvyHDs9ScD5IHtoKFncukGjOmLRGB2ci3k/vA0I6BEW15rmhyg
 YWNQ==
X-Gm-Message-State: AO0yUKV7HvB7ksx7voFszodYGIfKCRj6c7bQ4HrfSxBDqXjD4FutVUA7
 k4MhprU82Awa2D12Dxpqr6JAtaU4iTlgF0iZp+g=
X-Google-Smtp-Source: AK7set8o0xNZwl0pKNW6g6QZ/OJpf7UUJysTUrpVbXZec/mH4mM5njL2FLOoVNuu7fiayBB2lC5+Hg==
X-Received: by 2002:a05:6a20:671f:b0:d8:f312:b3b with SMTP id
 q31-20020a056a20671f00b000d8f3120b3bmr23796539pzh.3.1680311935214; 
 Fri, 31 Mar 2023 18:18:55 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 bw11-20020a056a00408b00b0056283e2bdbdsm2372762pfb.138.2023.03.31.18.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 18:18:54 -0700 (PDT)
Message-ID: <054b85f3-5ae8-9215-f9af-d3c55126e552@linaro.org>
Date: Fri, 31 Mar 2023 18:18:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 5/8] accel/tcg: Fix overwrite problems of tcg_cflags
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230331150609.114401-1-liweiwei@iscas.ac.cn>
 <20230331150609.114401-6-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230331150609.114401-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sat, 01 Apr 2023 01:18:58 -0000

On 3/31/23 08:06, Weiwei Li wrote:
> CPUs often set CF_PCREL in tcg_cflags before qemu_init_vcpu(), in which
> tcg_cflags will be overwrited by tcg_cpu_init_cflags().
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   accel/tcg/tcg-accel-ops.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

