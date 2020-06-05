Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jhGY9-0001Qh-8j
	for mharc-qemu-riscv@gnu.org; Fri, 05 Jun 2020 13:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jhGY7-0001O6-Fb
 for qemu-riscv@nongnu.org; Fri, 05 Jun 2020 13:54:35 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:53270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jhGY5-0007IQ-Oc
 for qemu-riscv@nongnu.org; Fri, 05 Jun 2020 13:54:35 -0400
Received: by mail-pj1-x1043.google.com with SMTP id i12so2983194pju.3
 for <qemu-riscv@nongnu.org>; Fri, 05 Jun 2020 10:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1fWWlCHxNNamvAiXSBO3D0fMPSUezKve2Rs84fD+14E=;
 b=I49mYqsfbYRms3npymGakgoXyzsggxYsHn1VPSM1PFoJUMcNFnD5kdIRTk5pK/5TJO
 /1tzZ81Fa6NJXiOeFf9XatRbc486nXc/0gqUJBElP3O4NkS/3WH/k/Suj7FSBwoLXOHu
 727cF6WBXZHOCV7kOPzoZ3D1N9MTY8C3r5HJkZ8p1+AYr0W/WrxbrLd6bhhYXLJtJHDb
 //x4JLnIAKVrPL5As4eNbMMB+S538ProX2L3xu+zQkQ+lsn2FhvLtjrP9OHPalHF1B2E
 UF4LER/b2yKNHcUtvQdRvaVfWaxNek7lta/wumYD2za5Rl39ouks9IqWWWb2V032zP9g
 e7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1fWWlCHxNNamvAiXSBO3D0fMPSUezKve2Rs84fD+14E=;
 b=Dy5bvd7/Q6yPVeIjM8ZvYvx6Z4tzyhPAz0FuFDN1pfTilfbgGlF31iVMSmcmjxRPxw
 3uvPMXSJs75j+mtVcaHl0qqvAayYGTfVIIz0Bqak78mL/R29jGc+T4bV+IX/pfGtQlkH
 wmuVn7p86r4ef0cHLFyrFC0UtYdkATWy+FBxT/ujzZsGv5gOu1gpANLgrXa4UEa+W8GF
 zFC0z87l/HhXUmPek/yg0vEmmXqwgCySZXIVj7ZAK4pqCipf2zsjhR5FYRETVThChYP0
 CGwKsCZa6MkUMbS56V2H93dREqlck8Z8SBBaLKnVm1tP1pRayCzv83WxJ//O1KcwmXP/
 Qd4A==
X-Gm-Message-State: AOAM5327/DZc5uqvLsGIl7kB5W6H3xPX/aDF+AiUBGymy/0Fofr802Ba
 Aglr3Vn3xGZniVM/PFOhVfoU+A==
X-Google-Smtp-Source: ABdhPJyYHCrN/kXy0dUyNRObLQuvzqXZ5ZZaFsTmtDkOikIRiqy5f3+vULrp03LYh6lovschyHw3CA==
X-Received: by 2002:a17:902:7281:: with SMTP id
 d1mr11231627pll.78.1591379672173; 
 Fri, 05 Jun 2020 10:54:32 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 12sm249593pfb.3.2020.06.05.10.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2020 10:54:31 -0700 (PDT)
Subject: Re: [PATCH v2 04/17] target/riscv: Implement checks for hfence
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: anup.pate@wdc.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1591319882.git.alistair@alistair23.me>
 <c78f245c8d1629f1bce1387ba623a0215767f804.1591319882.git.alistair@alistair23.me>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b714c7ba-802b-142f-6795-9c0227d3a462@linaro.org>
Date: Fri, 5 Jun 2020 10:54:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c78f245c8d1629f1bce1387ba623a0215767f804.1591319882.git.alistair@alistair23.me>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 05 Jun 2020 17:54:35 -0000

On 6/4/20 6:20 PM, Alistair Francis wrote:
> Call the helper_hyp_tlb_flush() function on hfence instructions which
> will generate an illegal insruction execption if we don't have
> permission to flush the Hypervisor level TLBs.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/helper.h                   |  5 ++++
>  target/riscv/insn_trans/trans_rvh.inc.c | 32 +++++--------------------
>  target/riscv/op_helper.c                | 13 ++++++++++
>  3 files changed, 24 insertions(+), 26 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


