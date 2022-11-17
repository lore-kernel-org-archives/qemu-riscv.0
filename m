Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovahI-000328-La
	for mharc-qemu-riscv@gnu.org; Thu, 17 Nov 2022 03:56:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovahG-0002zO-Dc
 for qemu-riscv@nongnu.org; Thu, 17 Nov 2022 03:56:35 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovahE-0007yZ-LO
 for qemu-riscv@nongnu.org; Thu, 17 Nov 2022 03:56:34 -0500
Received: by mail-pg1-x533.google.com with SMTP id v3so1412787pgh.4
 for <qemu-riscv@nongnu.org>; Thu, 17 Nov 2022 00:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kqJAP6tjAIDgERt4KrljqFtOkRGiex31JOKGKuiDpq0=;
 b=Im/I/mYlywvsSzNCa4xHczSONgg/jyRu1M/ZL6tcHz03ekvAPI51mucQtCPUOF9LsA
 nmpRs2lfsyTNCevvh2y6CyKFkUiNQBEX8jvZGU1KrcUNpbLXkK0TIdQZ3zTURJyRUuYA
 Afbevus5EM7wSePr18J1rKlb0RpmLfTdAQlG2+zmLlDk61ACYa6aQl74cLN+MrPPZ1j7
 vTHBQjh3q5euFvRKQkvjBo/E4YO4oCApXyBCuoWYJzVVZv+F/bk3KXB+e9OOc0T25Pn7
 82mkZ70auwYRE2dsKAUjP4dwnD4bMFbDesjG8bvaIlYyLXedYkNd3HEOMxU26O4HvHFD
 NAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kqJAP6tjAIDgERt4KrljqFtOkRGiex31JOKGKuiDpq0=;
 b=1GLlMZQtWUMSYSAGRx2eG/1ZXxcpx/1XeGCZhDU+0Eh3acy9PhVBkg6fDBUGZY+Dqw
 NSh2rLlLks3N8/JJOuW8zy+cAFgQf6rZMCJLJvDdL/Xk1ZBgYBREs1I+5scgEE4564uN
 y7wOb4S2QR1GDToDTlum+pghiq96ZH7qi1/fjjdPmszq/jQgHACXnRG+KRhu60h63QDO
 MW9gQIjIKeVHKsQ8LCni5uRDnzOEmvozNSsXhu6/d4Ib7v4y7aOmL4BBeQShRKmizqUU
 qfHAMv7eMAiqIlqG4oquB2VW+YH2vGZT7EwH7ifiGxTUD9AVt22EwFj3fpCNFPMk2Pev
 X42g==
X-Gm-Message-State: ANoB5pn+4z+SrXphu/tnL7BTGzYpXYhZIXBSmbFw8dbO9WtYfha6SYWw
 YY8CcdnM5N4Ym6KU63xamLVRHA==
X-Google-Smtp-Source: AA0mqf6BptuwrFNreB4Uvv0VabtT4vDpVMTJUu+QLx+3CcrsX+kKQTimAh+QR2iNKpIpGQyZYO8w2Q==
X-Received: by 2002:a05:6a00:140c:b0:56b:b520:3751 with SMTP id
 l12-20020a056a00140c00b0056bb5203751mr2035043pfu.29.1668675391076; 
 Thu, 17 Nov 2022 00:56:31 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:b354:386:82db:58e7?
 ([2602:47:d48a:1201:b354:386:82db:58e7])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a17090aa38100b001ef8ab65052sm414965pjp.11.2022.11.17.00.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 00:56:30 -0800 (PST)
Message-ID: <703801a6-b625-6af0-9b16-f21f1372e630@linaro.org>
Date: Thu, 17 Nov 2022 00:56:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 2/9] target/riscv: add support for Zca extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221117070316.58447-1-liweiwei@iscas.ac.cn>
 <20221117070316.58447-3-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221117070316.58447-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 17 Nov 2022 08:56:35 -0000

On 11/16/22 23:03, Weiwei Li wrote:
> Modify the check for C extension to Zca (C implies Zca)
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
>   target/riscv/translate.c                | 8 ++++++--
>   2 files changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

