Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzCVP-0006jP-By
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 00:46:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzCVG-0006ei-U3
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 00:46:06 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:39668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzCVC-0004bX-FL
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 00:46:02 -0500
Received: by mail-pl1-x631.google.com with SMTP id x18so810094pln.6
 for <qemu-riscv@nongnu.org>; Mon, 11 Jan 2021 21:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0btZZyxLbPp+zlpmT4LbQ6qGRS+kr24F+fkm0s4Esnc=;
 b=xIJhEPle0E64Iewc8aQ1a6h9z+gVY6pFbo1u5fyP+wQcIxN+mC9mprQqOt399MaCXZ
 Ukl36hypr8IVCo/6cDYGkQYkrQQU43nagXaVaKLfEgfZ6TupcEjoRxEkvY0aUkFMNd8/
 UvKAabewO7e+K0ZAu+VivGIDarMJreTBiG6jLFk7Vvw+JYTRnpTrB+WydyD1u5bFR2E1
 3C+/oT4hOtd/erNVsyGx9ne4x4RmYGnjJnp3KbT2092Ge1zXHe5KE87Oh7ClIVwx4pCg
 ELKGXffb7p6tiXzbrUp58/hzo2XjEWmS/vCKG2yWW02+osF3KSCdgtaXimcqH3Ccxe6T
 DKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0btZZyxLbPp+zlpmT4LbQ6qGRS+kr24F+fkm0s4Esnc=;
 b=JlS7Cghzm42nBGjIl2NwDoGLhagCdA5kRX/xL5wD2HWzucCkCWlenL/GWZENjsTU4b
 Iu4JUqd7MAi6pjtXnrVMy6cwbMKqQsW9+p7RmanEj9tQxc3eIu29Lm4+s5JzwWftkRGz
 Ari7AMwjdO7Zm55Dyww76Lj8xYBL45CZjAP7mN8HmMG6OsxcE+iHgH96ZfXBBsdg1+T7
 LPUhNeB07Yfhejriv0aC9BDAQRZ3HNYRKc8ZKfubZtEOH++1XpCRroSPJyM8jZ1nI1Y0
 ejL5JHCyHOdQLeTSR3TYRcQH1s698UnvF6B4WMXkh3JtHMSfQnz6BP0p1MiC6o/MoOKD
 RUeg==
X-Gm-Message-State: AOAM5322A7bkWCbonk3l8JxHYfcaRUEnFsxIIidnQGOabE0fUi8JVXbQ
 SMVAZs3w/6m7iuwcCLC67yS1Og==
X-Google-Smtp-Source: ABdhPJyvD3aHzslT9iXVng3kD6opQiX520ZQoSnSjZi3MBxVZE1enxCn1nso3sCgzYEOvbzYZtsWCw==
X-Received: by 2002:a17:902:6b89:b029:da:fc41:baec with SMTP id
 p9-20020a1709026b89b02900dafc41baecmr3544914plk.39.1610430353146; 
 Mon, 11 Jan 2021 21:45:53 -0800 (PST)
Received: from [10.25.18.36] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id 4sm1442426pjn.14.2021.01.11.21.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 21:45:52 -0800 (PST)
Subject: Re: [RFC v3 11/16] target/riscv: rvb: rotate (left/right)
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20210112022001.20521-1-frank.chang@sifive.com>
 <20210112022001.20521-12-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6c66108c-2b31-a080-1349-32ba5a3a2dc1@linaro.org>
Date: Mon, 11 Jan 2021 19:45:48 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112022001.20521-12-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 12 Jan 2021 05:46:06 -0000

On 1/11/21 4:19 PM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32-64.decode           |  3 +++
>  target/riscv/insn32.decode              |  3 +++
>  target/riscv/insn_trans/trans_rvb.c.inc | 36 +++++++++++++++++++++++++
>  target/riscv/translate.c                | 36 +++++++++++++++++++++++++
>  4 files changed, 78 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

