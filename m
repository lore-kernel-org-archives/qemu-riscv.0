Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpYf1-0004so-Gl
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 10:24:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpYf0-0004p6-2s
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 10:24:14 -0500
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35]:46310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpYex-0006Nn-Iv
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 10:24:12 -0500
Received: by mail-oo1-xc35.google.com with SMTP id n127so270294ooa.13
 for <qemu-riscv@nongnu.org>; Wed, 16 Dec 2020 07:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8SRN56yJfUQeD5MpqsTXAZPAKET25/vTh1oHQZp/0pk=;
 b=tXlT1cBV99T/ZEnUgz1/Ks5xPtvhUlvAmp2mEo4M1pvkxjGFpjGMpk/ftig2HNS3+M
 CFhq+5poMw9fRQ3F/90XvyDojohCuQ6gt4eUVA9MWCkGu6Sk3vi9HsOsjuBsamhy388/
 TfL90PE9x78rj9W/soCq/9CEmZ2R1kq0wegFiEpOd4ZH7txdbwtLW6DdoKrBkhwOYXcy
 4BIR6+DNSorFQUNLh4rS80FRWiOB0QenOJ9bFB5rwaEdSRnJBREER9o4pRRtijHJpXJc
 VlO//oYcV4mtCMI/O/D67Vs+xLMEfWsFiJiY7IQRWwP2s5Y7XOiriG1pVV/o46UVXl/X
 P3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8SRN56yJfUQeD5MpqsTXAZPAKET25/vTh1oHQZp/0pk=;
 b=JIVG0tNx/CfkZfS918wIHdpwge1EeqKl5AaVa1Y7ijRBLIG4sk9rsIN68NMvGzxpyb
 OGRwieXFrXGV6c9O4vZPY1lQSF/2Zus91xeyanFF+U0MRA6WoUpKOWlg0YFw/hJaSWJw
 9BhnlyNMEaRjEf6NQNwmINirpPS5yRv7qmRhaxAubbeqVxkF+wENhBF/GI/qctTEuLvl
 hCJu4dErWPjV2mzdBzJxAjqb5YLk6pS98NUkPnBhk732DgCX7LMvpew+Hj/vZbhQF3rn
 /QUsWsNMYLo8VLIVOpSRJk9VcmGrpyKrzutrNs9wsXt5bk1yu0Fw+LeD+1Jgczx+GRmJ
 CaSg==
X-Gm-Message-State: AOAM532S2ruJLwfaoYXU0PKbT6XH+SBG3phDWeOZxljyamSWj/iHpxkR
 hxppQ/OzsILYKDitN8uqKAwsog==
X-Google-Smtp-Source: ABdhPJycP7jJWscjxldyHdQFPMqcSOjc41xzmC+bdgNutptWRJODNOsbc6CI+IJovCXPATGby9ek+g==
X-Received: by 2002:a4a:5590:: with SMTP id e138mr25668166oob.13.1608132250387; 
 Wed, 16 Dec 2020 07:24:10 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i25sm484709oto.56.2020.12.16.07.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 07:24:09 -0800 (PST)
Subject: Re: [RFC v2 03/15] target/riscv: rvb: count bits set
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-4-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dbe761f1-8422-41d2-5e53-89101aec22bd@linaro.org>
Date: Wed, 16 Dec 2020 09:24:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216020150.3157-4-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 16 Dec 2020 15:24:14 -0000

On 12/15/20 8:01 PM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +    return gen_unary(ctx, a, &tcg_gen_ctpop_tl);
...
> +    return gen_unary(ctx, a, &gen_pcntw);

You can drop all of the unnecessary &'s.


r~

