Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pbxcK-0007AA-Jh
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 01:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbxcI-00079n-EN
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 01:54:34 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbxcH-0003eA-17
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 01:54:34 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 bh21-20020a05600c3d1500b003ed1ff06fb0so3869148wmb.3
 for <qemu-riscv@nongnu.org>; Mon, 13 Mar 2023 22:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678773271;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/ErSqSM96rJpsC3uSqdgRe7F4ZCEIKCRiNwCqKHn1Vo=;
 b=Tva0fivNjqpl+9XxfX27/C62V0vchzx0ADLlROM6ccZyBzQacqQTGtzapfUglW+9US
 XYbwtQlbSA8f31BJDRxv7UorrRVxKkBeGeLXiFq/Z0470O5yn9apQ5YEcZkQdm0QQk/x
 n+AGAIWmdDhsVWD9qu9Axa4luDXnX9frcXmbycGNbOpEgD3sZHTs86RzyZjx/YQAb3ki
 xWOtYOpJtthcq9lle9bvwPvVUT7Njwb/QE3yEpAUFt46WIYt9CPCmfDfBo9C73WvgVH2
 dz6vIqXUr1OVDG/3dbDtnAf1wy3o/PaE2tvtByHyxgyOCdCesTDCgQScHMWmhG4l2t3c
 /mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678773271;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ErSqSM96rJpsC3uSqdgRe7F4ZCEIKCRiNwCqKHn1Vo=;
 b=EA7Kht7pAKy/4qe83ARUuebkiLE1EmWSHhkToTmu80FGMrUSkM5/REcmulifJ8Zagg
 4rl2qUnMDWbmoWz7/mwT0uAXAgmStIJghYrusfIPfW+LOllZoYTFhCZ5LxSlW/DV4BOx
 nHPXXQhAM77pCEK8Am0KHQDxoXMCvuKtOOh55MqYgPz37TATuFuAl+qoWMPxGfwtqd8i
 ujdKLJXJc4DdWnVSj/WWtqDGYpzb8ZzfQrwA48LWrAZfQ/+zKUR8+gzxeXjtNbWD6FD/
 2Q0/HDK/LHBqmvennjGz6lM+ExT/dPcj4C1KTeXM5hKAA2kWjNrWRqZJhQB3r89s9Oy4
 OqyQ==
X-Gm-Message-State: AO0yUKVRO6rCTSl9l2HLMz+EykhT4UyuVRY9zEvijSaeiYSFAssNLLsK
 jK/yUZ5h+6LFWv++TlR68GXB0Q==
X-Google-Smtp-Source: AK7set9+dQ0aKjNe6ZppwcIMr5p3XWJwcPgDSXID7i1rleiaE0TyM3nL9hcGqDB9YhLfHfYW3GdW0g==
X-Received: by 2002:a05:600c:511a:b0:3ea:f01d:2346 with SMTP id
 o26-20020a05600c511a00b003eaf01d2346mr13767055wms.15.1678773271505; 
 Mon, 13 Mar 2023 22:54:31 -0700 (PDT)
Received: from [192.168.150.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 z4-20020a1c4c04000000b003eb395a8280sm1677191wmf.37.2023.03.13.22.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 22:54:31 -0700 (PDT)
Message-ID: <a3278eb8-a553-cf47-34bf-c0287cf4a069@linaro.org>
Date: Tue, 14 Mar 2023 06:54:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 4/4] target/riscv: Simplify arguments for riscv_csrrw_check
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230309071329.45932-1-liweiwei@iscas.ac.cn>
 <20230309071329.45932-5-liweiwei@iscas.ac.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230309071329.45932-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-List-Received-Date: Tue, 14 Mar 2023 05:54:34 -0000

On 9/3/23 08:13, Weiwei Li wrote:
> Remove RISCVCPU argument, and get cfg infomation from CPURISCVState
> directly.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/csr.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


