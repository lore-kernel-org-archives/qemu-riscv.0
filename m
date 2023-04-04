Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjh9Z-0002Kq-CV
	for mharc-qemu-riscv@gnu.org; Tue, 04 Apr 2023 09:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjh9X-0002HH-Jl
 for qemu-riscv@nongnu.org; Tue, 04 Apr 2023 09:56:51 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjh9V-0003KJ-SM
 for qemu-riscv@nongnu.org; Tue, 04 Apr 2023 09:56:51 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 qe8-20020a17090b4f8800b0023f07253a2cso33983493pjb.3
 for <qemu-riscv@nongnu.org>; Tue, 04 Apr 2023 06:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680616608;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3kRCQPATvee73mIKCO2KHqyh62Qrt/XnrvotLVomgo0=;
 b=VS57fUZwHjAYAS816428wEt9QSV3WcmGO+1IdEajHSRfwl0Izw6uSbTp36Y25L+hKB
 OwznJfm/d66IXtZwFSJuoWRrR7G3BAHyLE1Gbn6B5hZCsrCkqawKSRzhpLtj9nOyIg2Z
 oab6SqkMUhIFtvcRKCmHO/DcVVfMDdY1t1nJgjSFjUc3ZUigDT41ad4G2i25YjJVMzgx
 J5NcGwBjHPJy0V33VY06vYyqc1h8z81decRji6+ipCyGCQwdIgqHjxMJtHQ0TgvGh+eR
 la+3MPX2Z2qlnEkql6qj95vfL4Uakj2ryHR45uRbS1SUyOFZcgg/bu7W8Tpqrw58CnU3
 jGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680616608;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3kRCQPATvee73mIKCO2KHqyh62Qrt/XnrvotLVomgo0=;
 b=xRt27UI9ukv1Os3XOXSP2Oo2FPOhOLAX3xjoNGxonF+MlJtioKXsB2msJDEfCnGmiB
 AlheHYVMxuG49Bd9ArPJpIlICsglxVMCfnaK/QaNjjJ3YtRJzTQUmbbG/4iK/VQQ7CsD
 iAx9kYVtnZg1PobYTdB9cjABh1S1PLgXWbQIsrosWq/VZv8QP5hsz+coiH/AfLDr3qE+
 gVsK9iqSr1ASFQETJnoUc8Xw0nTM4AA+ZphzogAujV/AwKM9BQut/oTon53w0E3XhWbm
 BKfAvjC8QgqRy4QUbLOQCCzWjIdJ9aj7lOJowy5m/TWW1aysGlhSLHhzlrX+hg9jZoer
 BPoQ==
X-Gm-Message-State: AAQBX9dlDnDiTIDPE4ORu8Xa690Xm8xbstGU3eHhV7LPEIOks7lk/A21
 Y7njiTKFcLRI7ZY6Kn7r7jHa2w==
X-Google-Smtp-Source: AKy350bSS30gQrWmufuOvylanm4K3XvxwIIqlcVuSq5p7XrbsKq0O7P/CKc+a/z+izfEEGA6z3SgIw==
X-Received: by 2002:a17:90b:1c03:b0:237:47b0:3235 with SMTP id
 oc3-20020a17090b1c0300b0023747b03235mr3022591pjb.32.1680616608124; 
 Tue, 04 Apr 2023 06:56:48 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a1709028f8800b001948ff5cc32sm8336625plo.215.2023.04.04.06.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 06:56:47 -0700 (PDT)
Message-ID: <f0923f4b-e5e5-b648-6c77-4a5a151a9b6c@linaro.org>
Date: Tue, 4 Apr 2023 06:56:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 4/6] target/riscv: Add support for PC-relative
 translation
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230404020653.18911-1-liweiwei@iscas.ac.cn>
 <20230404020653.18911-5-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230404020653.18911-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.925,
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
X-List-Received-Date: Tue, 04 Apr 2023 13:56:51 -0000

On 4/3/23 19:06, Weiwei Li wrote:
>   static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
>   {
> -    gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
> +    TCGv target_pc = dest_gpr(ctx, a->rd);
> +    gen_pc_plus_diff(target_pc, ctx, a->imm + ctx->base.pc_next);
> +    gen_set_gpr(ctx, a->rd, target_pc);
>       return true;
>   }

This is not how I expect a function called "pc plus diff" to work.
It should be simpler:


     TCGv rd = dest_gpr(ctx, a->rd);

     gen_pc_plus_diff(ctx, rd, a->imm);
     gen_set_gpr(ctx, a->rd, rd);

All of the manipulation of cpu_pc, pc_save, and pc_next are all hidden inside the 
function.  All that "add upper immediate to pc" should do is supply the immediate.


r~

