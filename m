Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzOUo-0004hG-Lz
	for mharc-qemu-riscv@gnu.org; Mon, 20 Dec 2021 14:38:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzOUm-0004g1-0A
 for qemu-riscv@nongnu.org; Mon, 20 Dec 2021 14:38:52 -0500
Received: from [2607:f8b0:4864:20::42c] (port=36488
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzOUj-0005qK-6U
 for qemu-riscv@nongnu.org; Mon, 20 Dec 2021 14:38:51 -0500
Received: by mail-pf1-x42c.google.com with SMTP id v13so9631447pfi.3
 for <qemu-riscv@nongnu.org>; Mon, 20 Dec 2021 11:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XlIJnEe4/EuB0SwMKCDBr1wmwFasJTbdUD4zhd/HOQQ=;
 b=IBFrLgP2U8mzotsL/Q5cRMX6NjFkcJIPBFR4d7vTPIJrvSidUKhatVL82ak5MurfP/
 1KmftcuONQuXWmw0GybV0ZHw6jEx4lGCiBHQwbqqyQuzXOI7s9TRkpjPjRVnMpTuKIb0
 85aoN9jrq+32gGsVmkGNz1j8XEjmXdRv8sijnuWEmZfjf069MRJ4nALCrqST2jqYu22A
 tyJUEqImjbQVjpxcH9kFUzBnTUskxqQ6qvbiMXXc/ru2xNTVmDEtXoEK6LTr43N3BWG2
 TS2y+y0YJ2p1Y/IwW2TZaoi9n9Oo/2FqQnjhkVnR5qBHkzpRxNLLNg6G7/vXOs111k2p
 37WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XlIJnEe4/EuB0SwMKCDBr1wmwFasJTbdUD4zhd/HOQQ=;
 b=10Ab6IahcsCflAvXV4ViH2JjYs+by1MSL0sB/rNkCCCY+MDwXvs51BnDTgOnKcIYYA
 +TAucHcvdyqphEklk42/9ShJBXdRiiQwdQjtb1LxYlXdUTCkpn+SgZ5+la5ZWG3sjqOv
 OMT0yW9BCK4hAx45UVFX5UzGySLwomGgPqgcAaXFWexP3Dj/T8+WjYJk+xLdU6w8qK9h
 0YabR+69w8W189XC+ugC4Hag8CSj2wd6u85l2ulab/aFeVoIpiNpcoNXml1qTvTdq3on
 fXIh5Nu4pAHfk4fNvxOscnqpEo8RJEJ9pIpsKlz4I15Uz/Mlul6n4Tz1TRmfeKQCAf0a
 FRnA==
X-Gm-Message-State: AOAM530xMdsElmOU7uvRjHUEhwSIrkn4rGAI9PgsKroNELi3BSIxTQ9B
 hCL4b+GXa+hH+1ST7RmftV4GgA==
X-Google-Smtp-Source: ABdhPJzl5IF0f7UsyeugcUJfKXeU/ZEMRtKMXke5zHBYonLJyaG1nPlssvCMUIuVwvI0EZk7Hy8+mQ==
X-Received: by 2002:a05:6a00:24c1:b0:4b8:574e:574f with SMTP id
 d1-20020a056a0024c100b004b8574e574fmr18104144pfv.38.1640029124709; 
 Mon, 20 Dec 2021 11:38:44 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id s21sm19812276pfk.3.2021.12.20.11.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 11:38:44 -0800 (PST)
Subject: Re: [PATCH v4 2/3] target/riscv: Fixup setting GVA
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com,
 alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>
References: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
 <20211220064916.107241-3-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <61eedb9c-8645-ba35-be31-370f5a13a858@linaro.org>
Date: Mon, 20 Dec 2021 11:38:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211220064916.107241-3-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.608,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 20 Dec 2021 19:38:52 -0000

On 12/19/21 10:49 PM, Alistair Francis wrote:
> From: Alistair Francis<alistair.francis@wdc.com>
> 
> In preperation for adding support for the illegal instruction address
> let's fixup the Hypervisor extension setting GVA logic and improve the
> variable names.
> 
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/cpu_helper.c | 21 ++++++---------------
>   1 file changed, 6 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

