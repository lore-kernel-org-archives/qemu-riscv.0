Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZKeY-0002AT-1k
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 18:54:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKeW-00029W-9Q
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 18:54:00 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKeT-0000k8-KD
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 18:53:59 -0500
Received: by mail-wm1-x336.google.com with SMTP id az36so6779855wmb.1
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 15:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678146836;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4lvmdh+guACxNDpVN5e2/HvwUwWIYlocbz5czwQqn2s=;
 b=G/jClcW+zhNHVrJx6K09Avm0FDe3JOU1b+spHzKb6ySlkKyi3akozFuvo1Frl22Hyb
 SpNum406By1lDohGMEPqNTg54P0khP2MHwm332Ygvn6RWPjY+1+LaRFXa95enDDZNfgn
 mGktK1ZjoZuKccPrjaBAqU7t7Z2Z6RGa4u2Zpwr1lDqeQtfKWyrQbUnSjnIU7JdN892h
 0o1GxGQw+Q9wPIg91u5vopRoGS7J9HKBJXaG2wNUuCxJVITwtEziAyy6EC/vzcryZ0yg
 bSWBXZvxAnd3OeEBBkrONruGVzbiuyCeGAYcqDBQ1yPFRbq1KhSlZc0pmw5K4ChojryY
 wdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678146836;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4lvmdh+guACxNDpVN5e2/HvwUwWIYlocbz5czwQqn2s=;
 b=IYauI0GS9oOnYMT8Dxf5FNQzXUlhIlSsXET4lciU4KShs7iAtkuEFsbkd3zzbbwZDM
 NMmkHNtMjP58uYzntedpQlpvSlAgpM5b3CmD7jufnYx7bOl6C01TwJOR8xWa9JgffgUj
 SH2vgapUEQYNGjEja2loYhTTo2M0yXqw/w4MBi8Gs640ouHBEvxvw+F1GG2uEI0KJ2TS
 gOAbuCXgjvGk+mObavJfOAfjfvEOHRpqjXAk8z2Om5T+l1h8uS4YLEo8OPZpGrYR5ueU
 hx6p2LQ46nDdMkk2Dpj+MFNKTJWg6QJThEiQxXbzrdvV6DAh6NKPv0Gihg/ThEqjJP/2
 P6cg==
X-Gm-Message-State: AO0yUKWXQfngpgv1yQA3yqWQD1RZ4MziS+m0hUOeyMzMGMa4XfVUyJLi
 kUWSgOrSakYIolKgqR4BCHP2Ag==
X-Google-Smtp-Source: AK7set+Rird/tYE22DVn7VHtfWe/I/jnUlwGSm5fKMRow1KsaOsb6HomwSS5sqB07x1cs0uwXQg0QA==
X-Received: by 2002:a05:600c:4fd6:b0:3df:d8c5:ec18 with SMTP id
 o22-20020a05600c4fd600b003dfd8c5ec18mr10573924wmq.13.1678146836065; 
 Mon, 06 Mar 2023 15:53:56 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c42c600b003eb192787bfsm11216331wme.25.2023.03.06.15.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 15:53:55 -0800 (PST)
Message-ID: <0207a585-c9b1-851a-d86b-0f32dbf56c85@linaro.org>
Date: Tue, 7 Mar 2023 00:53:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 26/70] target/m68k: Avoid tcg_const_i32 when modified
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-27-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-List-Received-Date: Mon, 06 Mar 2023 23:54:01 -0000

On 27/2/23 06:41, Richard Henderson wrote:
> In several instances, a temp is initialized with a
> for use as a constant, and then subsequently used
> as an unrelated temp.  Split them.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 29 ++++++++++++++++-------------
>   1 file changed, 16 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


