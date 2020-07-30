Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k18qD-00059W-0o
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 09:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k18qC-00059P-Dy
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 09:43:24 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:36923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k18qA-00009f-RI
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 09:43:24 -0400
Received: by mail-pj1-x1032.google.com with SMTP id lx9so4545478pjb.2
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 06:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TDd10USEdK7bw4u2wiZeBaLU7fHfTOUlVMyxLIByVP0=;
 b=E41eFrjl0WG/tT1KhFK1RMFUN7kaxq+Tki9bn74UflAo+LkDgJ3ESWH6Ys1h1ptt4Z
 Uf53ilI80C8KZrBIdJqkxfpxLebFrFFL8qMRnjtUGosEZfB/yu/7+s7C1rrZZ3Mzzj6o
 q/fU8r6Gpk3P+PrEfc3qGxh5b+Wx44Wo6hBT00uns31l52hfX8SIdBTXTOzN1lTGHOKh
 WJagVqafiI6dymkz7h2xJFAY5M0MEjdi8xHAZQzv5s2gYPyZIpQZQN6dy+100DpuI5k7
 51EbZM0WYonBfjuvRvrC7vQmEU/lFYM/QRbiXKHEz2BdHQZSuI6z7+QGUA9e1Yr3Z0v0
 vrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TDd10USEdK7bw4u2wiZeBaLU7fHfTOUlVMyxLIByVP0=;
 b=Zt6HtLJA98FJd8QYrugw+o+G7IjZFZiMLsgxSnqDBLfGZpXVDP2xwo8uPue7Fv8idY
 /yssrKZlGTbUmucxRRCOkLG8I6fXo+K5nqpUuS2o4n0C7bPAAq4GO0QVpr6b4S/YvzY1
 z+nvaFGRD+GpBsvooECDnjNW73q8XCQw9a5AnMTLoU+MsB5pG47NmTL67XTeqGdiXtOb
 ZFE8cKrcZxFUcudJ4NBncgFJ5fTHFTbR0UO6oV4wzVVX2hLjbWtyYOHiMJa6pExx5UtA
 7p34jCzezSGMVEI2j5l6OI5vaH5d9pbeWCBy1CkDiq6KyEVOiwfH00ZiKrqH8jeNScOB
 FQhA==
X-Gm-Message-State: AOAM530UcYDxDereIirNvRfjZn2SMMKOInfNaBjJP3OGLlmSTEq0DlWf
 qYORf1t4bcit5s1TfuYFS0aSNg==
X-Google-Smtp-Source: ABdhPJxS+aUXa8+1ZTNeFfe2s/zqve/u912v8MURAXNC266hy/M61y6yvCkZkbZK72+CDjDYMKSFdA==
X-Received: by 2002:a63:1f04:: with SMTP id f4mr34028857pgf.34.1596116601089; 
 Thu, 30 Jul 2020 06:43:21 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j16sm6295836pgb.33.2020.07.30.06.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 06:43:20 -0700 (PDT)
Subject: Re: [RFC v2 37/76] target/riscv: rvv-0.9: allow load element with
 sign-extended
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-38-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bcc93273-4e1f-9604-46f2-0b682a3c9184@linaro.org>
Date: Thu, 30 Jul 2020 06:43:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-38-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 30 Jul 2020 13:43:24 -0000

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> For some vector instructions (e.g. vmv.s.x), the element is loaded with
> sign-extended.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 26 ++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

