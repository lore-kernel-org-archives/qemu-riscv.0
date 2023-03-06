Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZCpt-00010E-EY
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 10:33:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCpY-0000io-VE
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:32:54 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCpU-0001av-QF
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:32:51 -0500
Received: by mail-wr1-x42a.google.com with SMTP id e13so9221627wro.10
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 07:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116764;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JtDF3RU7jMzqIqV3K4q6YKDOYZ+qOIfKmkzQId52Pm8=;
 b=uXodVpsO+p2fcqAdg7ZMl3CMU/gTKz2QtR31qMWFVe2R7MUkPMKLQQIHj41ri9BJqe
 RodkHXjGdECvSRSOaRM2UoaZmqQpOOKbzZqAFc6c9jJczLqM+diHC4L9QM2orv32nGlg
 jDI1SYCUMRpMrZgkCtl0KGbzbAxELY2aXHtbEqbu0JyZomn+7vcHxSKPu4DSoazzqZzL
 1UOnDUYriJH0D/WnPCOmKoup6CpdR2RHV19HE68aT3s0LYnCPPb7Z9rp9kxwQIQ+O0U9
 IZFAhw0KKqQb8AXixNxZtJOE2KEgLzKFbes5e2b5ebpk8z3XZMKZfTPx/ULzAGqQAreR
 +W4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116764;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JtDF3RU7jMzqIqV3K4q6YKDOYZ+qOIfKmkzQId52Pm8=;
 b=M96yTrumM1WK5yvPBGSvTy/0cnvAcwcg/4RxRhAgjVt4xuYoKU5JZJJ9lxSkYOi+QM
 OcYvq0yZBnm7ff7TvRdzFHOwSAnFSoQ0Xn0abe4fq3q1J+dic/FDKouV94Px/W9ONIX2
 Kp2o4z+etNxDOIYnesAwtXwaiRQ8jsMSMIJXEfNalw+UkOAWq0tjO3p9Q/6XGgikOrDl
 4Ww70Py5pXbn6y1IOz7VUNMANagOko8QN9pxMgM+nKZXsp4nkrQMUEFwvooleajETOMw
 jHzKzeBTFC4IMWEOBV+OpK+uUE82D9aX8aTj1sYCRbvNpCpS015bwhhRg9fKtIij4ZLM
 PmfQ==
X-Gm-Message-State: AO0yUKXJ/JHTE0g2lYV+S5GXWgUt7bArpGIJZxwRYGbnLAv6nuG0b9f3
 y1UaADoFbTlG5HKYkebWzgegtw==
X-Google-Smtp-Source: AK7set8kAiQnRHyF3qIiSCDqXSFBYSinovgpCJcI6+nMKZy3K6Vg39oOk8RXdep5OeoxdO6ft9sb7Q==
X-Received: by 2002:adf:e34c:0:b0:2ca:8995:38d with SMTP id
 n12-20020adfe34c000000b002ca8995038dmr8035183wrj.16.1678116764263; 
 Mon, 06 Mar 2023 07:32:44 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s4-20020adff804000000b002c705058773sm10617333wrp.74.2023.03.06.07.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:32:43 -0800 (PST)
Message-ID: <89a41cc8-16fd-38d7-caa4-aa0aff51696f@linaro.org>
Date: Mon, 6 Mar 2023 16:32:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 69/70] tcg: Drop tcg_const_*_vec
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-70-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-70-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-List-Received-Date: Mon, 06 Mar 2023 15:33:01 -0000

On 27/2/23 06:42, Richard Henderson wrote:
> Replace with tcg_constant_vec*.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h         |  4 ----
>   tcg/tcg-op-vec.c          | 34 ++--------------------------------
>   tcg/i386/tcg-target.c.inc |  9 ++++-----
>   3 files changed, 6 insertions(+), 41 deletions(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


