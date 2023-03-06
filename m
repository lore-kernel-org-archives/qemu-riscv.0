Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZCtB-0001uj-7z
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 10:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCt7-0001bz-5M
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:36:33 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCt5-0002kn-Ht
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:36:32 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v16so9321973wrn.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 07:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116990;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w6czE5q2H3AYFx7L6nJUjFSBh4C7IkqQ4dBPgic2+gQ=;
 b=NmpwDCflp2ic5tt1sRNcZWSoXWpSWA7eXB3qMP0s7lWwth2vRenhcxN5y7VLW9Ef/V
 rn0zzAT2WqOz/Ns8hnv3FTNVDzSOMs9JiP9Z+c+homljan6v4qNfcz/1pndVH+kn/m0Y
 bMX4k/NH8RQeV3CRs3TjBz7wgg8CZHnUyXUgLlLI7I+CclpinkC7+Bzwe6xj1cnQG7yJ
 Rf1DcTwq2lvjoK5xhlCyQGea0zr0W3GeBxJJ/eTjkd9+xSE6r990KYePBbJdyRs2N4lx
 k1/53mb4u5phoo7v1LhfTI5PWU1PQlHSzhwbAxLgLH+48N9prdFonzXpwHBuHrQkUDpU
 mxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116990;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w6czE5q2H3AYFx7L6nJUjFSBh4C7IkqQ4dBPgic2+gQ=;
 b=uQqGjVO3NPSYlgOuOciJf9xfbFyYN/KWTw9qLZIaUNyCs7DQqldXkVdBWUgC5PidIR
 JDOKbRK/PBuMHfkPwHrhB7LWh6fBIkaJ9NIkunmlPRIXSD1sqGBFKUXxMHWz09TIPC2o
 ctTdmWWM/vhfB8pJ8s4lX0KdtXi0tTBLW4f6dEQ7rHCD2cfTtA8EQ0ys0isXXrhIC14N
 e/uInrYFwu7gaNGL87zBIn1DRjxe395Gk65NzHO2lf/M7PrbsN7UGj+E/SjDwd9Za1W1
 dV+FbP7gLcPN2mPwmTXOQ43/76CFqkxvGg8NdsdfOnZaVzMQhJphNLDr5/yrtNRMbZTt
 bp0A==
X-Gm-Message-State: AO0yUKUEODWjsBUtRcFxGCYWSnT9YNx2LEMfhxOf96/RjmBSbGurwgtE
 lMWSIVTOJUA0qiyIFbTWLqX2cw==
X-Google-Smtp-Source: AK7set9+ilWE/KnwBuuKbeo5AU/DajWXs+pLf0TbmRNZmlsI6Kw2sM8bJXaS9x+VmNjTaiwA/YtFEA==
X-Received: by 2002:a05:6000:52:b0:2c7:15a5:439d with SMTP id
 k18-20020a056000005200b002c715a5439dmr7276682wrx.8.1678116990112; 
 Mon, 06 Mar 2023 07:36:30 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j2-20020a5d6042000000b002c70d269b4esm9978536wrt.91.2023.03.06.07.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:36:29 -0800 (PST)
Message-ID: <cdc16f04-7216-fb1b-72f6-bd737c11f47f@linaro.org>
Date: Mon, 6 Mar 2023 16:36:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 54/70] tcg/sparc: Avoid tcg_const_tl in gen_edge
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-55-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-55-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-List-Received-Date: Mon, 06 Mar 2023 15:36:35 -0000

On 27/2/23 06:42, Richard Henderson wrote:
> Push tcg_constant_tl into the shift argument directly.
> Since t1 no longer exists as a temp, replace with lo1,
> whose last use was just above.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/sparc/translate.c | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


