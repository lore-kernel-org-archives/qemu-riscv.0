Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3oqd-00076v-0U
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 18:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3oqb-00074D-GA
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 18:58:53 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:33458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3oqY-0007pS-L9
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 18:58:53 -0400
Received: by mail-pl1-x636.google.com with SMTP id g19so156665plq.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 15:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QnnIcZDIbfq/i7nr6CWOpWg/8xI7vWY4gpm0Kv+LiXY=;
 b=WZhsfD9X3bvGaypquzBiYA/tQvZWFzZDAfabUfq25d1gohGpvZXaviuP41O5PzK8Px
 K/R74gBkguXMRGmO8DyaK6FpybPPDUL/3clfbvP8vz0pjqkiXssUFiqmP8t2geUOkEpv
 Y/+Kb/WnhO98OF3mSgZ8rW2IKT3jtSiwLevdgQFJk5K6s4PTNSRthKxqiYDn5TDF/ART
 Ne2HdqvqTiFGlumR3m3MV4FnA6QiY+grt1hsk664KVRDzvARLxDjFG+8kCQtejPBL0lw
 KSF5aTXuQPXvBnVhC3FRo2iuYsWST3QGilPoHxyPze3woFEDLlE3t7FCrsUlNxbYcKJ5
 I1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QnnIcZDIbfq/i7nr6CWOpWg/8xI7vWY4gpm0Kv+LiXY=;
 b=N6LKwtO3+tlYZ6jT1DBMHYzieHNtHwZp/KPZo2rxKn24UzbkyIBVgVlGH5hLTIjwNg
 nCYkTBm1DVHsaMv8l1VMxxr1FUimGXyhrjyNbrBOd0Le4tTg443bNjZZdYLWPfY2A31E
 cqkfWd0Vk59k+azHuYsNJ8DEBoEsw6FqYDDIGpSWpx/mouBq1O+Oy/Uc0/ZDs6JZy/Rc
 Oswn2K64sQubN19S7sOfoBcxuT3+HpulWVS2DcDjYsH7BLG10Xo2swXtgAV3NI1sD78I
 FkE9E9nK4cD9NFRX8DMD/gP9skM3Ul5T+OWsdn42/L4SqnLnhSEaXRzBG7GHH12IhYbv
 PfaQ==
X-Gm-Message-State: AOAM53153TpuuXAjxwGZYW7M64MGqGB9itVatZ0t/+4iCQ1A2opQQt3C
 lwbWXS33OiDTPjfNwY4BB05DXBD6BEc=
X-Google-Smtp-Source: ABdhPJzwt1YxRQJQzWwDgc1LeCRT2MQj4XR//FaESfnsbFn1gF8os30F7aHQdbX/Pj4PtlBAprrCUg==
X-Received: by 2002:a17:90b:f94:: with SMTP id
 ft20mr10942495pjb.69.1596754729318; 
 Thu, 06 Aug 2020 15:58:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id n3sm9490152pfq.131.2020.08.06.15.58.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 15:58:48 -0700 (PDT)
Subject: Re: [RFC v3 17/71] target/riscv: rvv:1.0: add translation-time
 nan-box helper function
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200806104709.13235-1-frank.chang@sifive.com>
 <20200806104709.13235-18-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c63fa4ab-7612-6868-343a-b96b58a5586d@linaro.org>
Date: Thu, 6 Aug 2020 15:58:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806104709.13235-18-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 06 Aug 2020 22:58:53 -0000

On 8/6/20 3:46 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Add do_nanbox() helper function to utilize gen_check_nanbox_X() to
> generate the NaN-boxed floating-point values based on SEW setting.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 27 +++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)

Similarly, do_nanbox will Werror as an unused function.
Otherwise looks fine.


r~

