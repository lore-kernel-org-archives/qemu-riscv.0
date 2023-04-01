Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1piQ7F-0008P2-2p
	for mharc-qemu-riscv@gnu.org; Fri, 31 Mar 2023 21:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piQ7D-0008Oc-7Q
 for qemu-riscv@nongnu.org; Fri, 31 Mar 2023 21:33:11 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piQ7B-0006Nv-As
 for qemu-riscv@nongnu.org; Fri, 31 Mar 2023 21:33:10 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 mp3-20020a17090b190300b0023fcc8ce113so27283867pjb.4
 for <qemu-riscv@nongnu.org>; Fri, 31 Mar 2023 18:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680312787;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oAfkoqjjqGLkw1ubzRFSYonf8Dja+RmQDegR1V3dmUY=;
 b=GKSwC4uUCAYrziNL7vMV2ecMoFid438IrP48t/5XxDOd2w5jJPoRW7L3qhCFhdGUCi
 tNnQp9sO8MxhM4rMih3IXKrilBSBdfgn0NG3yACCHUIlmexWz7wy+jskZq/gZ73qGtBy
 08nFb4Yo1zF/DvPmhF65Ib1NdqAY/nJMhXi3QhpBI/kRYs0HbplN/y9hYEcpxtbxX4Or
 SzbMPKgcYA5QMeCw6Pwb5N7v9g1d0gvWl7js8nGZJTL1oWZXiX+LZSH6HC6Ywn+gd7n0
 fkLHY2bbxszM6wjpJr8i9c5kQPrnXGe1xQ3xKIjputbCYIbbIgSOBHZurZKUdz06jHD2
 EqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680312787;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oAfkoqjjqGLkw1ubzRFSYonf8Dja+RmQDegR1V3dmUY=;
 b=Jkq5j8HbhDfrNhWwlkwT0JB4u7s/DlJYaLGKR22YPLgcLVGEzEuoHSvSqXwajpbwCg
 BLTwtD2ViuubVjKnz0xgc3Rakup5Aj06ojQwXTHVwA/NZLj+2SkFWJmCy0iflgrh2Cqt
 bAdxXA2rlgj4O6HaochCJ9juzp2eCMooxH2wjED8EiPvNB9yRBKmgRlJ5iUdxiw+P3/B
 OEnhD/JoJgsAgOqfMUFq6+aeitMGZw+SqJkDhpMDva2PNRx4hYKDYpQ8l3O77mlwX2Bw
 CiwIAHxBP1EkRcoTn2JU4sc5LfdInpHWju39olZDhIMHpVvJuLuC2jOfpVbK4dLEg+lx
 QjcA==
X-Gm-Message-State: AAQBX9cettO19V803qwPz7TvBISqIE3P/mZByAZbz1dgA4SAT5FbMTmc
 7FNNZlEONzdoCu06PkoeMray8Q==
X-Google-Smtp-Source: AKy350a0kcUsMTwMu14owUJYRpZwBVswhAXbBSDReiYnF8vdpIpdfYZZ4KQr0HngqJXFj5Ykuzc+Ow==
X-Received: by 2002:a17:902:c44c:b0:1a1:8edc:c5f8 with SMTP id
 m12-20020a170902c44c00b001a18edcc5f8mr24946627plm.56.1680312787353; 
 Fri, 31 Mar 2023 18:33:07 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a170902740300b001a19f2f81a3sm2160852pll.175.2023.03.31.18.33.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 18:33:06 -0700 (PDT)
Message-ID: <6c0ea9e4-4f5b-9384-7b48-ded2998f9204@linaro.org>
Date: Fri, 31 Mar 2023 18:33:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 5/8] accel/tcg: Fix overwrite problems of tcg_cflags
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230331150609.114401-1-liweiwei@iscas.ac.cn>
 <20230331150609.114401-6-liweiwei@iscas.ac.cn>
 <054b85f3-5ae8-9215-f9af-d3c55126e552@linaro.org>
In-Reply-To: <054b85f3-5ae8-9215-f9af-d3c55126e552@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Sat, 01 Apr 2023 01:33:11 -0000

On 3/31/23 18:18, Richard Henderson wrote:
> On 3/31/23 08:06, Weiwei Li wrote:
>> CPUs often set CF_PCREL in tcg_cflags before qemu_init_vcpu(), in which
>> tcg_cflags will be overwrited by tcg_cpu_init_cflags().
>>
>> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
>> ---
>>   accel/tcg/tcg-accel-ops.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Fixes: 4be790263ffc ("accel/tcg: Replace `TARGET_TB_PCREL` with `CF_PCREL`")


r~



