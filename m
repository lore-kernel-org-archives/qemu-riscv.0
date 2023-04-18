Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poftJ-0002Np-5p
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 03:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1poftI-0002Ng-G5
 for qemu-riscv@nongnu.org; Tue, 18 Apr 2023 03:36:40 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1poftF-0005Ri-Ga
 for qemu-riscv@nongnu.org; Tue, 18 Apr 2023 03:36:40 -0400
Received: by mail-ej1-x62b.google.com with SMTP id vc20so15814709ejc.10
 for <qemu-riscv@nongnu.org>; Tue, 18 Apr 2023 00:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681803395; x=1684395395;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6yxyqwjPqfgzOj8BEoy/R9Kl5mJhfXmO92/e6f1UPrU=;
 b=sVuUJ+9V+YQnPyIcswoKVLCj8mIFg/1VIuL5xSbnSd2NFJYlcJsWO9wSFwxmc6h4vO
 J0gi2bz1fXZKbLzmhCDejxq1yfmAiSvu+Xnfo5mQPsCbgPNoT5IrHaZIgqrZ1xJAhIOr
 jax9HDMex8CNmJmIokpzKmITSEoGgdXuQlLfyv4OIeVXzYTC0kRUuFwfnuXKUe6dFQCo
 brctBRznTwcY/JPoumLJMcBVUEZu4ZB91X4yN+/j7BOdpDhJR0iWsdsgmw+zRdr6ms3W
 99/sJgaEgFA2xu9AcQH7jr76ZS8dDBK1grqvpARuDq/T9J7tqpT/+wJKN9IrViNVAnJh
 Zg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681803395; x=1684395395;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6yxyqwjPqfgzOj8BEoy/R9Kl5mJhfXmO92/e6f1UPrU=;
 b=YAodzVizZYfbXMymgGoxBaJ9fBl8fsa7McJmVeTyuGNilGXxhYfnK9KGpAEIPMn3He
 r95g762awyxPzMjKgUkN+nBnfS7UcDN69jw9EE93WwF1qSiXy/zN3RvNYOZPqNlz9KjY
 QcAcQ4PznM5U/B/U+EYEVHBJt2OWIFIMVRrUu5xtUKWDYkI4G6Xi6aROwALygTWjQb0x
 DMAI+jwMFRNigmEQOofqjVM2kATWGDLvkL+wKqtjEILwbLC0UFO/zmE7Usg05vWX6rnS
 GuMH3lJat/0RVqTJWJlfIMst2dAcvA+bRibgB+OpmbpkJPffb7mVYMmxN9YHI2wjEKsg
 bx0Q==
X-Gm-Message-State: AAQBX9e7AlsHYCZphlRj4pDQTw15743vr1kJAcjv1T5MsZ04KhoR3V5Z
 3Sx6TUL1GQsvXpu8rvCazsRdqQ==
X-Google-Smtp-Source: AKy350b+TXz0EuvD8aeZbpysOT+cje+AR4Q98DVTLe22b3zOMIaLyQoiNPWVUaYernjZJoGgqXRBnQ==
X-Received: by 2002:a17:906:64ca:b0:94f:4d4d:23 with SMTP id
 p10-20020a17090664ca00b0094f4d4d0023mr7460102ejn.68.1681803395636; 
 Tue, 18 Apr 2023 00:36:35 -0700 (PDT)
Received: from [192.168.58.227] ([91.223.100.53])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a17090635c300b0094ed14a5b75sm6625273ejb.51.2023.04.18.00.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 00:36:35 -0700 (PDT)
Message-ID: <e6fea4f5-4750-30df-4ce4-e2d36f5e4664@linaro.org>
Date: Tue, 18 Apr 2023 09:36:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 6/6] accel/tcg: Remain TLB_INVALID_MASK in the address
 when TLB is re-filled
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230413090122.65228-1-liweiwei@iscas.ac.cn>
 <20230413090122.65228-7-liweiwei@iscas.ac.cn>
 <a256a5fd-e408-74a3-5476-694d216e08d8@ventanamicro.com>
 <e2288c5f-b4a1-9105-6c2e-60e51decd91d@linaro.org>
In-Reply-To: <e2288c5f-b4a1-9105-6c2e-60e51decd91d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.284,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 18 Apr 2023 07:36:40 -0000

On 4/18/23 09:18, Richard Henderson wrote:
>>> -            /*
>>> -             * With PAGE_WRITE_INV, we set TLB_INVALID_MASK immediately,
>>> -             * to force the next access through tlb_fill.  We've just
>>> -             * called tlb_fill, so we know that this entry *is* valid.
>>> -             */
>>> -            flags &= ~TLB_INVALID_MASK;
> 
> 
> I missed the original patch, but this is definitely wrong.
> 
> Clearing this bit locally (!) is correct because we want to inform the caller of 
> probe_access_* that the access is valid.  We know that it is valid because we have just 
> queried tlb_fill (and thus for riscv, PMP).
> 
> Clearing the bit locally does *not* cause the tlb entry to be cached -- the INVALID bit is 
> still set within the tlb entry.  The next access will again go through tlb_fill.
> 
> What is the original problem you are seeing?  The commit message does not say.

 From https://lore.kernel.org/qemu-devel/3ace9e9e-91cf-36e6-a18f-494fd44dffab@iscas.ac.cn/
I see that it is a problem with execution.

By eye, it appears that get_page_addr_code_hostp needs adjustment, e.g.

     (void)probe_access_internal(env, addr, 1, MMU_INST_FETCH,
                                 cpu_mmu_index(env, true), false, &p, &full, 0);
     if (p == NULL) {
         return -1;
     }
+   if (full->lg_page_size < TARGET_PAGE_BITS) {
+       return -1;
+   }
     if (hostp) {
         *hostp = p;
     }

It seems like we could do slightly better than this, perhaps by single-stepping through 
such a page, but surely this edge case is so uncommon as to not make it worthwhile to 
consider.


r~

