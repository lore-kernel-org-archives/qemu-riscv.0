Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phXEV-0000HM-11
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 10:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phXET-0000H3-A8
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 10:57:01 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phXER-0002LF-Td
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 10:57:01 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso3957600pjc.1
 for <qemu-riscv@nongnu.org>; Wed, 29 Mar 2023 07:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680101818;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=82SJkRP4r0odD2Ho/lmm9udP9KAom4bi6GsrIUyXTdQ=;
 b=qBaIWyYjdV3PCh5a3tzIwDgG4zQklq+OV9oDrAndEB8SgmLYhM0iUufoSpSGr+ispM
 QR1TeS5BAlkbjUpmxAq6hS6KfGwrkAPGhqASOLjl0Rq6nRtMcjv1DGwGcghSz+Dh5QoR
 BKDTo+sTH/ufskbBaD4p7NWVNV0ry5g+ylivOxXVwnYzAMLxzVfotGBkAPu2jn0hQDkm
 yvLYaXOEaDwB1GwaszzyqeldNmVHAvkZ330+WgnqW1wsxr1Wx0hmd7N+EQIJyT1Fr/lH
 tYXeKowVJ4rE/kSdP0m/uJa2qenydEwyvas6MPdPfK3RH7n2gICR5nH2lkEkIT5A+B8C
 q10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680101818;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=82SJkRP4r0odD2Ho/lmm9udP9KAom4bi6GsrIUyXTdQ=;
 b=1tmKZvfrklp+vFNECXM0fyqwPEZRxjXHpQstKtqTuFoL0Jiqmq8OQbRtCpNrLafydv
 Y/p57yazboz4vsbUaoEwzGJX/LKathw+k3lrXKA0rAzYHpnuYFtoArScEpCywhiPOW5N
 5X9zJDylwoinl7AeVvSbsz96U2nwZog01ISncmCXIiI8xHRjBMOyWSN2IN6STkRSEQYN
 ntJ7oQ2/MH33IpX7sC/M6pPDZbbqZ5ZtWNsamGrxdmH2uS62Yr1jKTcX67ZfLAsHvKRX
 KSVKAA1KM2S0blDt8zh0OB8qWCltEgK4XkRx7WKeTZ2xnb4Ry0LBjxKLCamHz4o3WuDS
 Mf6A==
X-Gm-Message-State: AAQBX9c0KLMRfU03U9vi9flkUeUDkgWwH1VPzkYXBxYOiVCiH6kIXSou
 6wclh2EEVVWOmdBLbYyP4Jifqz2A0QpDk0IYekc=
X-Google-Smtp-Source: AKy350bDw29ZWWPqn4uWNH1xbMRzj4BRzh+OmofebNXVRYjVcD26U+TcQw4FJPwT+MjIJoQef9yXgQ==
X-Received: by 2002:a17:90b:1bcc:b0:23f:2955:aabe with SMTP id
 oa12-20020a17090b1bcc00b0023f2955aabemr20544823pjb.8.1680101818355; 
 Wed, 29 Mar 2023 07:56:58 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:3369:815f:629b:7300?
 ([2602:ae:1541:f901:3369:815f:629b:7300])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a17090b050400b0023b3ebedc17sm1526032pjz.46.2023.03.29.07.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 07:56:57 -0700 (PDT)
Message-ID: <a1095968-2f25-ba16-718b-89c531f5acc2@linaro.org>
Date: Wed, 29 Mar 2023 07:56:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] target/riscv: Fix addr type for get_physical_address
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230329101928.83856-1-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230329101928.83856-1-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
X-List-Received-Date: Wed, 29 Mar 2023 14:57:01 -0000

On 3/29/23 03:19, Weiwei Li wrote:
> Function get_physical_address() translates both virtual address and
> guest physical address, and the latter is 34-bits for Sv32x4. So we
> should use vaddr type for 'addr' parameter.
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

