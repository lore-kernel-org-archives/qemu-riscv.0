Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oZ4U1-00014F-2J
	for mharc-qemu-riscv@gnu.org; Fri, 16 Sep 2022 02:05:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oZ4Tz-00012G-QZ
 for qemu-riscv@nongnu.org; Fri, 16 Sep 2022 02:05:47 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:45667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oZ4Tx-0005bN-Qi
 for qemu-riscv@nongnu.org; Fri, 16 Sep 2022 02:05:47 -0400
Received: by mail-ed1-x52e.google.com with SMTP id m3so10153868eda.12
 for <qemu-riscv@nongnu.org>; Thu, 15 Sep 2022 23:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=xoBVhPFMskf/4VvtbUjeQnT9ohsQrWkVqByxW13tgtM=;
 b=b+NxZpBbmK8j1hkleIFiLrtUqyPWsOUqm/bz2go5PBHNsHC7YO15aVj/C7dlzMwlM5
 fTXAZJ5JRwhIE60jAIpW2hF5H17SbwtnmbSoAenoEgW2A/LWlkS3SQpp8YxgPXhhXvPF
 /K/i3X6g5XxcxfHO9o/mM5zbo7zJs2b4K+bypMWnyJhpHA7XGNO4YYwl2s+Rxeuajq87
 4BOy/kS/zNQ3c4BflnxlOu1gq3MFx6x/Zt9kZ2TrHdVMCRV2IcYg9+BVDFj0BKQ/RUvt
 oHp5giY5eaTwi43OGjGyNdklt+J7RYAifANjGEEe1L0wn1rYjrujH8s484Ao2yjJ0yW1
 YPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=xoBVhPFMskf/4VvtbUjeQnT9ohsQrWkVqByxW13tgtM=;
 b=ujReuibsEfOR9M2SnD3JN+nwXQfJJuByaZ6f3TIR5ak7uhatqzFfEOiV/hh0TkAL38
 Z+LTyQwE+ChhnwcJrkrWSApziOUfMFzvOnFf/1J+2O3hSwvLEX8FPmSXWM4sm1/Dx9eC
 VH4oAy2cxeDeSZx1JXoX0eKKJyvU5xCB1B2SwBwATihkuaB42QhHFxC1EODX4tqqe6IZ
 opkxZeG5LUxGBCjD+1JPmHRUgjVT/qd030xSK+8DeNupr6LmVmDNWW3uQHjgOSVlaq0t
 fHriHbfKmhEh7MVn12esIybkpOcxfQBiCQfzszWZOvfZ/BGrwPwnhqzDAxauAPwGCk+g
 LIWw==
X-Gm-Message-State: ACrzQf3jhch9W8uTOAyTgKlplF4bFhZzhEInbOUYWeJZddIzUj+FX+aj
 rCK0sAZ+XkCSNGH6TTu/CmOX/Q==
X-Google-Smtp-Source: AMsMyM4taU7NCO4S99MpewWxUg6JoZ5wKtLviz8k1kzLHvk31lZluBy0wyCz1MjjytwDgUpF7Cr7tQ==
X-Received: by 2002:a05:6402:40cb:b0:451:2b71:9940 with SMTP id
 z11-20020a05640240cb00b004512b719940mr2594317edb.237.1663308344424; 
 Thu, 15 Sep 2022 23:05:44 -0700 (PDT)
Received: from [192.168.1.39] ([81.0.216.218])
 by smtp.gmail.com with ESMTPSA id
 uz6-20020a170907118600b0073cd7cc2c81sm9969739ejb.181.2022.09.15.23.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 23:05:43 -0700 (PDT)
Message-ID: <8e1643a0-1748-df10-4493-47323d425e32@linaro.org>
Date: Fri, 16 Sep 2022 08:05:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/11] riscv: Add privilege level to DisasContext
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
 <20220906122243.1243354-2-christoph.muellner@vrull.eu>
 <bfff6a65-f0f7-8659-2b58-582345018868@linaro.org>
In-Reply-To: <bfff6a65-f0f7-8659-2b58-582345018868@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.816,
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
X-List-Received-Date: Fri, 16 Sep 2022 06:05:48 -0000

On 9/16/22 08:00, Richard Henderson wrote:
> Or, keep the field, because it's usage will be more self-documentary, but copy the value 
> from ctx->mmu_idx and add a comment.

Or, add an inline function like

static inline int priv_level(DisasContext *ctx)
{
#ifdef CONFIG_USER_ONLY
     return PRV_U;
#else
     /* Priv level equals mmu index -- see cpu_mmu_index. */
     return ctx->mmu_idx;
#endif
}

so that usages within a user-only build are compile-time constant and folded away.


r~

