Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYXZr-0006A0-LL
	for mharc-qemu-riscv@gnu.org; Thu, 07 Oct 2021 13:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXZq-000677-Eh
 for qemu-riscv@nongnu.org; Thu, 07 Oct 2021 13:53:06 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:43897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXZo-0002q2-7E
 for qemu-riscv@nongnu.org; Thu, 07 Oct 2021 13:53:06 -0400
Received: by mail-pg1-x52b.google.com with SMTP id r2so513140pgl.10
 for <qemu-riscv@nongnu.org>; Thu, 07 Oct 2021 10:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8qBrST+9sd1tP1NBL1OuDdKGYJvS54xHLBO10eCRpyU=;
 b=bicKQ6CtqUv3NRIwiMwL27Qlh6obTYvPHAE4Y7uQMVU7+wy8Ddrfw7RkFUeovXcCeH
 MhfmkdTTEhOaiklKazPWywhuw2dbt4ZZLiy9bZuSV3U0govQ62v4rqHqWW3HgiBOWeZK
 FNhoQX7AZyCxB6uIfYOojSFNU09YJ9nDPy3qMxKrhw3S9TH1NaiAKgSm2aqZoNZzRWah
 lBbacaIGNDP8zU5bEZ+PPVv1NAiqTE1BKON72Gm5wLXxwgZFyaWGFeaHXC6+MbBw1ODH
 hLfm1D0L8dygtZa7JhXy0LLoWAEvdxcYyIbHEbkTLQrq4iG6arazL9tLL7qVwsHHexoY
 qGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8qBrST+9sd1tP1NBL1OuDdKGYJvS54xHLBO10eCRpyU=;
 b=b9wv5a08rzBcs3W0gviTs0TsB2nfJ3HLU46tXglzE/SLJeGOzp8bIx4X+divspbbfv
 tQiyudQByHUTcXu0bwmxCh20IpEPNOesnmD+G6sf3+8vhLGfMSn016CtnYTGBBWmAOSR
 oEohBhf/NwS42jx3l3GktiOC2ViCoE7IZskuWf8tCCdXBv0kzG43iI+1piS0XL4Gd8qs
 XALwQpBtGfFF97YnTAlfCPKG2fwLPg2Mhk48nNMVym9kZInxy+OD1eIvbQ3E028voDJI
 tf1G4zQWmn2xdAyLKTy3loLvE7c1B/uHV2ubUtKGc41JStt66vYP/yhGIsisalLtH/lg
 cipg==
X-Gm-Message-State: AOAM533DhUMvuNlIhksASkNbQ25Te2rlvM/QfOW1D2P4DA1chc0hxBxl
 An6fqLbUnx3gzJMm0In9bCETiA==
X-Google-Smtp-Source: ABdhPJxee7uAoi7lV+G1TLJeQNu4CwQoIRS/0htw/1mZhzA810AbcaAe7YfQcPd+5EJ9MNMZ+d1uKg==
X-Received: by 2002:a63:f40b:: with SMTP id g11mr769333pgi.401.1633629182489; 
 Thu, 07 Oct 2021 10:53:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n202sm74529pfd.160.2021.10.07.10.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 10:53:02 -0700 (PDT)
Subject: Re: [PATCH] target/riscv: Pass the same value to oprsz and maxsz for
 vmv.v.v
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20211007081803.1705656-1-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <89fc02c0-4164-64fa-d265-f350704d3eff@linaro.org>
Date: Thu, 7 Oct 2021 10:53:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007081803.1705656-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
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
X-List-Received-Date: Thu, 07 Oct 2021 17:53:06 -0000

On 10/7/21 1:17 AM, frank.chang@sifive.com wrote:
> From: Frank Chang<frank.chang@sifive.com>
> 
> oprsz and maxsz are passed with the same value in commit: eee2d61e202.
> However, vmv.v.v was missed in that commit and should pass the same
> value as well in its tcg_gen_gvec_2_ptr() call.
> 
> Signed-off-by: Frank Chang<frank.chang@sifive.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

