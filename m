Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmXbW-0005te-3W
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 06:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmXbV-0005tM-2w
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 06:21:29 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmXbT-0001fn-F7
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 06:21:28 -0400
Received: by mail-wr1-x433.google.com with SMTP id j1so14345518wrb.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 03:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681294886; x=1683886886;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kbvz25g1gd95mfNr1Luvyo3c+omVh7uTvD4cLsXR77g=;
 b=cOQhZ62JYuVnVBcBF63FOzNvfwfYCrSFXc7MlSbdgkhiHvGR8AVYSZrHbnvtlQwDDD
 qvEJbHCvXHEHkqcl6ha7qnRHNse78PujMAWp+2biBAFzCXTOCSTkrf9tqdc6oSAZu/mc
 JNph3EKsnMWOnRV9lN5Ia+4mI5XRhd0cGo3quUFG2593Uf8D0tTRTn3+E4IbzW9Ls1sr
 HobTf5BDJhJEbZ2gJKUdYJcUR8ssupOZgbq1PsjAUUenOxQ0AW/wY1AU21eCURGo6mIg
 KlO0BpQ6W60gxz2bZ7dm5zf5+f2wKhgGjrYRXQr3gr1X+8dJ9vd6xTgUr8pf124szKsg
 W5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681294886; x=1683886886;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kbvz25g1gd95mfNr1Luvyo3c+omVh7uTvD4cLsXR77g=;
 b=QfaLTrxRGV32vJBO237Cr0k4V+okX+94QzW7EblvK7exvSoyKENjHqedttC/SSdpfT
 QMkgH0HoQ7RSbFP623FxOKAkv0qwNZZIE/EauHJ5TwYnHbjZEu5eMdk1LDIdJnIt846Q
 JjFyLHFlumo3S485+9ENNPpRCr/+2F72qLgSAspZ/VMZOePrPsGSCvppsGTIVi4wtwsE
 fZg0/9ag4vTdlKEzVvNKEMP9Bwtdu5wTIF9tb8mtCjESWyFK18Jv43W846MG9WRC0zHH
 bsZ0NUVoRMBjel2985RzkWIvhvyt8OL2UX8N72bIg9+y0zOWB3sRTWAE+0cxks+u+Yn8
 K1fQ==
X-Gm-Message-State: AAQBX9cvYQQjOgHA+VQfHTUZx6wXrp8Kqc8edFrAzhETc94SEauACyTl
 IjhfFsmjvon+vXK9zXPfTO2VTM2Z9GLC7y1QnGScmWxl
X-Google-Smtp-Source: AKy350aFmDdRlNLfeQspb3wfY3vh021p8FlSeVnBQgTnLZfjsW5Wt9KVNIei3852Ma0GcztLgMc0UQ==
X-Received: by 2002:a05:6000:1045:b0:2f4:2f98:bf2d with SMTP id
 c5-20020a056000104500b002f42f98bf2dmr1676656wrx.37.1681294885981; 
 Wed, 12 Apr 2023 03:21:25 -0700 (PDT)
Received: from [10.0.2.69] (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfe0c8000000b002cff0e213ddsm16886557wri.14.2023.04.12.03.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 03:21:25 -0700 (PDT)
Message-ID: <e2ef863a-b9d6-49c7-3691-2ce8768b0b4a@linaro.org>
Date: Wed, 12 Apr 2023 12:21:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC 3/5] target/riscv: Add support for Zvfbfmin extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230412023320.50706-1-liweiwei@iscas.ac.cn>
 <20230412023320.50706-4-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230412023320.50706-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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
X-List-Received-Date: Wed, 12 Apr 2023 10:21:29 -0000

On 4/12/23 04:33, Weiwei Li wrote:
> Add trans_* and helper function for Zvfbfmin instructions.
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/helper.h                      |  3 +
>   target/riscv/insn32.decode                 |  4 ++
>   target/riscv/insn_trans/trans_rvbf16.c.inc | 64 ++++++++++++++++++++++
>   target/riscv/vector_helper.c               |  6 ++
>   4 files changed, 77 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

