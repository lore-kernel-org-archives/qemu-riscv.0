Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWXn5-0004r9-9z
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 02:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWXn2-0004pK-G1
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 02:19:17 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWXmz-0005es-Qk
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 02:19:16 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so6367464wmb.3
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 23:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EkabTtd7DUB+19zLLPs/zHOycE77u2Vk1pv1TbWdLw8=;
 b=fy5cOHwCUrL9UkxIJSSolZ8m4lbo9PsUZpKRuYs0a9pbPOpEwudDRnoZuaK6o1cLrH
 0bprjYHNFlMqrHMkKXR3+ZQC38iiInw4C7k+p3+UZHufxrUGzaurQ6HGAM25PJTI/K2u
 S5nFVmi3SVSGwSGvBtb1PbKYCpWR4om3eAj0YjFIWTQxPGrNR6X1ePFavA4ts8sGF8fs
 vMTMknKvWrruTV+ImWUgnzTGp11qnHggCHS/DcL6iKLNvRBBlOLYr4uKEtWlIIBj2D++
 xZ4X7D9ixqCynIA1OI4QvDmUEh8Wrk0uUYAxUzqbAr/hJIAWbVkZKUit0CoSlXoLL0Nj
 FECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EkabTtd7DUB+19zLLPs/zHOycE77u2Vk1pv1TbWdLw8=;
 b=rOP0cCePK1g3c7N4j5WjmiGTvH/tYpkFJdHJwp3TNxcaS/3gymC2Ghix1qTPZsG8UB
 Aom2C4Ekdq95KH7hNvjllw4K/iHn7L218zvWc2+hwJmaGpzCa6iQNzJvrVK5+pVjeeIW
 T6OYrdvEPYF4KSGprOrxkTbi/kpkXRK12hKu2CVlcGiyaZ9RYS4WwvmtdXsk98SW7QlI
 DK/VLQRTJH989547VFG6g2X0CSK4W7EPL2ZTXiwTmoGFzfnR90cFQwyXTT7ctcJHwPlE
 BgQn5aiQuzlg85nsuOIcm7yHpFlaAIEVS7eGWRtl4h3ABthRtIAbTeiN7qOQJR5JsUlP
 hzkw==
X-Gm-Message-State: AO0yUKWf16vcoc/323WiFuqrhuX1FRUCkLJrjHHcgU4Vi2q571HG7Dxu
 ZIyiMoklFytVKivXRZccANfJZg==
X-Google-Smtp-Source: AK7set/uLA6J57SQAhzhLmTu88L3XFpIItUCCGp1qjUwEHyrQs3A/Trbz+FnMl3LO75sVajkrY1c2g==
X-Received: by 2002:a05:600c:1609:b0:3eb:3f2d:f22f with SMTP id
 m9-20020a05600c160900b003eb3f2df22fmr2840340wmn.21.1677482346561; 
 Sun, 26 Feb 2023 23:19:06 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i14-20020a5d55ce000000b002c559405a1csm6169808wrw.20.2023.02.26.23.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 23:19:06 -0800 (PST)
Message-ID: <8aacf5f2-22ca-8905-0187-094e66d1261e@linaro.org>
Date: Mon, 27 Feb 2023 08:19:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 23/31] target/hexagon/idef-parser: Drop gen_tmp_local
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227053701.368744-1-richard.henderson@linaro.org>
 <20230227053701.368744-24-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227053701.368744-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 07:19:18 -0000

On 27/2/23 06:36, Richard Henderson wrote:
> This is now equivalent to gen_tmp.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/hexagon/idef-parser/parser-helpers.c | 24 ++-------------------
>   1 file changed, 2 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


