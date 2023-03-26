Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgIks-00057C-0i
	for mharc-qemu-riscv@gnu.org; Sun, 26 Mar 2023 01:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgIkg-00052d-8q
 for qemu-riscv@nongnu.org; Sun, 26 Mar 2023 01:17:13 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgIkd-0008F1-Bm
 for qemu-riscv@nongnu.org; Sun, 26 Mar 2023 01:17:09 -0400
Received: by mail-pl1-x632.google.com with SMTP id k2so5582891pll.8
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 22:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679807825;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n0jxUeHIwhiMyIT+/S+MP/ZU2mpKA2dyLJT+wV0tkRA=;
 b=DET0mdK2Z0EqalfvaPHoY4Kr/GdEyOi9S5//za2++/GbusbmSpSOBqOILn2AtC3b1P
 RG1vxUcQ7Vgw/Bo0LKOnqd/0F0I4cdJ9d1yVsPjDihJg6HOfnlRLXsfS83mVMU2rcrzG
 xqLX8zEOE3khs3TpvxrYt/L3qz6eI7QXuKQx8u+GKptiytPzX2pan45QR0xke18d2JxX
 hkR/89BuTX+xX+zRVBIZxW8h//WH8Xy9miLGtTwcWLBzoCYH+5vuPorqcfVFD+b1ND5i
 PFgbm5hUuki3abK6H7nmJV5ictkE2QRfp1h/nJgWOSBaECDMaCQwHLd2xqGxitC+7RAs
 LH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679807825;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n0jxUeHIwhiMyIT+/S+MP/ZU2mpKA2dyLJT+wV0tkRA=;
 b=pLZZz8lpC8ZF0NVjM4ykSRy7FTjWU5KZYRdfYtCrJsi9lK/lCJHcliyWU8tsfLJGUC
 lU0qDFQQ9Gx7WHllQ0Te04zgrfEh+R7Du7jSRnxpfvt6d9J3VOpt70ScZRpweN2zXwM+
 ezK8rjs3WBNgi1nCKY215pndA+yWBdIyLQqBkYu1EVAIPneclKEkJo6yyc9Ohb/WEXT0
 ZCZnpG6JfhwyFx8vzF4d7edREXV20ct6v8zk3YkWwNqlMsToUVhWuINs82fWBHIHe5ZJ
 UlZ2RIhCDTQnFzAn+M/By4pgTTCaUHxOU56q3kIK/PXevHiYAvcRsSUZMXibXX+z7n+P
 oWNQ==
X-Gm-Message-State: AAQBX9f2K5msuNoN3JAudvkSGBvvgy4oba4xW1uHHPf3tc5ftTDna7JK
 nv8nrWRHwBMhJ3oVqp6pZ0Nddw==
X-Google-Smtp-Source: AKy350beREb84TEsNPgCBPOTNESZgNkMTkYBqhswWn2Y1Altba6EJHN8ZliHMQOD+iNkkrgvqFRlxw==
X-Received: by 2002:a17:902:fb45:b0:19e:ba2c:27ec with SMTP id
 lf5-20020a170902fb4500b0019eba2c27ecmr7665168plb.11.1679807825677; 
 Sat, 25 Mar 2023 22:17:05 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:8931:d1e4:9c7f:b1c5?
 ([2602:ae:1544:6601:8931:d1e4:9c7f:b1c5])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a63510b000000b0050be183459bsm15640833pgb.34.2023.03.25.22.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Mar 2023 22:17:05 -0700 (PDT)
Message-ID: <f58ff921-4e9a-2d3e-e816-eb9d2a09ee35@linaro.org>
Date: Sat, 25 Mar 2023 22:17:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 00/25] target/riscv: MSTATUS_SUM + cleanups
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sun, 26 Mar 2023 05:17:19 -0000

On 3/25/23 03:54, Richard Henderson wrote:
> This builds on Fei and Zhiwei's SUM and TB_FLAGS changes.
> 
>    * Reclaim 5 TB_FLAGS bits, since we nearly ran out.
> 
>    * Using cpu_mmu_index(env, true) is insufficient to implement
>      HLVX properly.  While that chooses the correct mmu_idx, it
>      does not perform the read with execute permission.
>      I add a new tcg interface to perform a read-for-execute with
>      an arbitrary mmu_idx.  This is still not 100% compliant, but
>      it's closer.
> 
>    * Handle mstatus.MPV in cpu_mmu_index.
>    * Use vsstatus.SUM when required for MMUIdx_S_SUM.
>    * Cleanups for get_physical_address.
> 
> While this passes check-avocado, I'm sure that's insufficient.
> Please have a close look.

Somewhere after either patch 16 or 17, when env->virt is considered in riscv_cpu_mmu_index 
and a few other bugs are fixed, we can do

--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -591,11 +591,6 @@ void riscv_cpu_set_virt_enabled
          return;
      }

-    /* Flush the TLB on all virt mode changes. */
-    if (get_field(env->virt, VIRT_ONOFF) != enable) {
-        tlb_flush(env_cpu(env));
-    }
-
      env->virt = set_field(env->virt, VIRT_ONOFF, enable);

      if (enable) {
-- %< --

Because we're no longer trying to overlap the VS and HS tlbs on the same mmuidx.

I have been pondering additional changes that would avoid flushing for MXR changes, so 
that user-lookups from M-mode firmware gets the same advantage as has just been done for 
SUM.  But this is complicated by needing 12 (!) more mmuidx, which cannot currently be 
represented, nor does it even seem like the best idea.


r~

