Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A45FC43458
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:37:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfHbb-0001TX-5K; Thu, 02 Jul 2026 09:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wfHbZ-0001Ml-CM
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:37:25 -0400
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wfHbX-0001Ob-Gb
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:37:25 -0400
Received: by mail-pj2-x04.google.com with SMTP id
 98e67ed59e1d1-38108e5002eso51104a91.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 06:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782999441; x=1783604241; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TWC67xpeW6SkAcMo3SnmZfkvmqHquflJsAo15XkmnHE=;
 b=Ht3L3AZPyTFhqHEUbT76wfnfanHFXW9oq1gBX2dutr1q88nGiWsSKqzrS6EjwilZsd
 AaL80nKSen3bch1k2wTsy9mAf7Xs6TstFOrCt2ScQhefbMMV9M/OFVzeyd39u82aNch+
 Yd6IWB4y5Fd/sBKVurY1N/q47+Z/xQjh4F/Ebf4WajzTsJ6UTNGIS0tX7fT93Vld64pu
 vA1eh2pkFm5Xwixvbcd87o4CJrs6Imqdrv2Amnye76r7VphRb6Vo0MMf1G/DCowTNXqo
 I02XQUBO7NxL0tiHrJ4hxdbqyzsIskKZkaBWZC7YNmaFZnr/3STHp5ZbUAjpENoywsHr
 BdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782999441; x=1783604241;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TWC67xpeW6SkAcMo3SnmZfkvmqHquflJsAo15XkmnHE=;
 b=UcVAkhNSAIX5hitFfsYsisduiMwaTrD3If63qY8AE9NvM4JH68m8/EwKEhFMrQZ4fO
 k6uNw2CvlR1a5EucsQDeWDaPaxpXy85moIZxyA1CV/PQNgapAI4wCv0/6epKItBDCd4C
 8cq6Op5DpcfRxynYBY3s92irc6m9s5NqBNg6/ct3W40SmTga7QfCDyFwDSkKSejCNmJA
 2AJyyvnsd5LmDxHYrytVBdBPsB3La1abwGLthCTHWT/JYnEYtuqsaHCzoHZb25+vvN56
 9yeagjL0lNaBiMyhBhH0OwtLATdu8v15wjxtemcSS8ziWqkwJWU1ILD6v5kyyBZHbxdJ
 7/zQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9+ZChbVUGcQ8hf8CEFnmITe8sH43xwEaxsWOxgfc+qUO20RF7ch3MKyrMySfxGzClc/pi4hXl4kgmp@nongnu.org
X-Gm-Message-State: AOJu0YwvbPxMcWcfqNW3Uf+Hfujm8bPWj9L2uCdvRiyihByuvGj4ajZW
 XS8p3CHjjKJSUgKRDlZ5NkTIG13zHc95ClYaq9BRsCDb/tGSxhoYY79V
X-Gm-Gg: AfdE7clBMtBjYh8JHfU7mKj+Z2Nlln6xAmA41/kGPhToqvnQK/FSe9ZUreYblAFsZNA
 MF7DdLzBLUoJmlkCJJmJBGRQRDkrXC/0Gh5KohOHrogB4HzS+w0XrZnRN4+3sCMFr2R31s1PIQE
 C9595zMRnObMu3DgEqCfgy8tzHAbzS2a/XE5jRRAsdeGDIN9VNv6tjshQmdIbAIu49kxFDFOLwS
 rXdnknIoH0JDKOPtjlSQYPJSFfJ6EZRR47J5i1PADxdFMYnGZMz8W0x9UE/LlGdJt9YP7838VnF
 mPPqUnpdNPyjCBrlmsLDbsAJqjs7Lg3ZuJDoOn2O+cHKLzuFsfhRaQHBnhWuLABXFvDdn5enD14
 L23OvwJhVIG7Fu0++6siDC5JF9kfwM/OOdNIN4ED9WjOpKLUwQOXXV4JIyfSh6Bn12+3tYfsvq3
 5sQliJUYKqa2E7hwa2Vw4GNd5vU7MmZaOHViiSCnStgRKSJb84
X-Received: by 2002:a05:6a20:9187:b0:3bf:c126:bb02 with SMTP id
 adf61e73a8af0-3bfed4818b7mr7049123637.47.1782999440493; 
 Thu, 02 Jul 2026 06:37:20 -0700 (PDT)
Received: from localhost ([64.186.250.142]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13b3c85b345sm14617293c88.10.2026.07.02.06.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:37:20 -0700 (PDT)
Date: Thu, 2 Jul 2026 21:37:17 +0800
From: Chao Liu <chao.liu.zevorn@gmail.com>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 andrew.jones@oss.qualcomm.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, Tao Tang <tangtao1634@phytium.com.cn>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] hw/riscv/riscv-iommu.c: check for misaligned IOHGATP_PPN
Message-ID: <akZhlFh68iVQNiKD@ChaodeMacBook-Pro.local>
References: <20260630203155.2103084-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630203155.2103084-1-daniel.barboza@oss.qualcomm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:39::4;
 envelope-from=chao.liu.zevorn@gmail.com; helo=mail-pj2-x04.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Jun 30, 2026 at 05:31:55PM +0800, Daniel Henrique Barboza wrote:
> We must check if IOHGATP_PPN is 16kb aligned for non-bare GATP modes.
> 
> qos-riscv-iommu.h needs change too since G_IOHGATP must now be 16kb
> aligned too.
> 
> Fixes: 69a9ae4836 ("hw/riscv/riscv-iommu: add ATS support")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3550
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>  hw/riscv/riscv-iommu.c               | 14 ++++++++++++++
>  tests/qtest/libqos/qos-riscv-iommu.h |  2 +-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index 891a56e731..09990c640f 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -795,6 +795,20 @@ static bool riscv_iommu_validate_device_ctx(RISCVIOMMUState *s,
>          return false;
>      }
>  
> +    if (gatp != RISCV_IOMMU_DC_IOHGATP_MODE_BARE) {
> +        uint64_t iohgatp_ppn = get_field(ctx->gatp,
> +                                         RISCV_IOMMU_DC_IOHGATP_PPN);
> +        /*
> +         * One of the conditions for a misconfigured DDT entry
> +         * according to the riscv-spec: "DC.iohgatp.MODE is not
> +         * Bare and the root page table determined by DC.iohgatp.PPN
> +         * is not aligned to a 16-KiB boundary."
> +         */
> +        if (iohgatp_ppn & ((1ULL << 14) - 1)) {
I believe that if we are checking the PPN of this hgatp register, we should be
checking its lower 2 bits. According to the RISC-V specification, this is meant
to check the 16 KB alignment of the base address for the second-stage page
table. 

It's equal:

 ```text
   addr = PPN << 12
   16 KiB = 2^14
   so, PPN just need lower 14 - 12 = 2 bit is 0
 ```

Reference:

 1. iohgatp section：

 The iohgatp field holds the PPN of the root second-stage page table ...
 The root page table as determined by iohgatp.PPN is 16 KiB and must be aligned
 to a 16-KiB boundary.

 2. Device-context configuration checks：

 A DC with DC.tc.V=1 is considered as misconfigured if any of the following
 conditions are true. If misconfigured then, stop and report "DDT entry
 misconfigured" (cause = 259).
  ...
 DC.iohgatp.MODEis not Bare and the root page table determined by DC.iohgatp.PPN
 is not aligned to a 16-KiB boundary.

So, We can modify it this way.

 ```c
   if (iohgatp_ppn & ((1ULL << 2) - 1)) {
       return false;
   }
 ```

To better align with what you expressed in your comments, we are
obtaining the page table base address directly from the PPN.

 ```c
   if (PPN_PHYS(iohgatp_ppn) & ((1ULL << 14) - 1)) {
       return false;
   }
 ```
> +            return false;
> +        }
> +    }
> +
>      fsc_mode = get_field(ctx->satp, RISCV_IOMMU_DC_FSC_MODE);
>  
>      if (ctx->tc & RISCV_IOMMU_DC_TC_PDTV) {
> diff --git a/tests/qtest/libqos/qos-riscv-iommu.h b/tests/qtest/libqos/qos-riscv-iommu.h
> index 90e69a5d73..4a972401f5 100644
> --- a/tests/qtest/libqos/qos-riscv-iommu.h
> +++ b/tests/qtest/libqos/qos-riscv-iommu.h
> @@ -46,7 +46,7 @@
>  #define QRIOMMU_L1_PTE_VAL          0x0000000000012000ull
>  #define QRIOMMU_L2_PTE_VAL          0x0000000000013000ull
>  
> -#define QRIOMMU_G_IOHGATP           0x0000000000020000ull
> +#define QRIOMMU_G_IOHGATP           0x0000000008000000ull
I believe this isn't an adjustment. as the original value was specifically
set to perform the 16KB alignment check.

The iommu helper function will handle:

 ```c
   iohgatp = qriommu_apply_space_offs(QRIOMMU_G_IOHGATP);
   dc.iohgatp = (iohgatp >> 12) | (8ull << 60);
 ```

So, we can get:

 ```
   iohgatp addr = 0x80000000 + 0x20000 = 0x80020000
   PPN         = 0x80020000 >> 12 = 0x80020
 ```

This is a valid 16 KB byte alignment check:

```
   0x80020000 & 0x3fff == 0
   equal
   0x80020000 & ((1ULL << 14) - 1) == 0
```

But if we use old ppn check code, It just so happens that his check
will fail:

```
   0x80020 & 0x3fff != 0
```

Thanks,
Chao
>  #define QRIOMMU_G_L0_PTE_VAL        0x0000000000021000ull
>  #define QRIOMMU_G_L1_PTE_VAL        0x0000000000022000ull
>  
> -- 
> 2.43.0
> 

