Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEE7C83F10
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 09:22:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbdsd-0002IV-0Z; Thu, 31 Aug 2023 05:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qbdsb-0002Hr-11
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 05:22:21 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qbdsY-0002oZ-HQ
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 05:22:20 -0400
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3a9b41ffe11so315762b6e.2
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 02:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693473737; x=1694078537; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aBV9ZJsds9vQgp+8Kc+hM5xtDO43f/8R7u6yMZkaLyk=;
 b=Q8kvDwvi3BAQmt+VE65gVneTOtuTb01PYBSB8+PFDm0hQyo2Sn1hVjSJHLvHp0gnVf
 HAsUddbCdtOqWqvQRkM9OaqKjojR4UpUugpAjZYsQ9FRGhY009aGsLADcCPsGuU9+2UN
 CGf7q+VowP67RM+SirOrw2qf1AZzoZ03V9XrvoeDCfSm774/vXdGJaPDxVXQ5zEo84xm
 4Drgrbh4a7xWZEhC3o5n+o1epuMwcDPtyoKz+kJ/3Xn4kviAC1MJJp8gbJ55wvyVlkQL
 +qsLzLTijPJYVaavL7hDkDGptBmZV/lEHH8ayjc8Kb7Yv5sXVnvLhMR86BEAU6YDDCzJ
 9AQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693473737; x=1694078537;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aBV9ZJsds9vQgp+8Kc+hM5xtDO43f/8R7u6yMZkaLyk=;
 b=TyMjrfckaMmZqMwS7tN0mHp7f5P7unj9Su0sjPSR7r5Gm4SaHUm03yMU1+VZCJs0M4
 PmE2g/GT9G0Hpy8y87+VTVOLMuFR79TCkFAV6GstPs+3LT8B3R/O1pBZHj4zg0ZK18Xx
 dwD7XKcVqGcnuKtDPXT/nagOCuOhVY/PIUMpn+rCjaDki7Kn1CZQ/lINY3M1O+nI+412
 52njys+V344rZ6gZ4XM1+tfZ5UbMbKEV4mwg9GjlZbErmk8++FzJI+m3jqeqg63b4Hpk
 RRfvX/hHg7oVceLl88Mfr7AGwL371a3SOR3/k0DCJdKrUUPPvuvP7LlL5d4OaIyhHUOo
 Z2XA==
X-Gm-Message-State: AOJu0YzrezUAlHhfFWFpVE5doA+9zmCv9m12wBRM476+dr0pMkSVGLM8
 ANWiM2FWA47riZTjr1/z/5QmgA==
X-Google-Smtp-Source: AGHT+IHoqs8cXDKEK7gwOEWilUeRgKNx+Why4f7WYTBBjCs05GDi1dPVVVG50Hj27AD2GUmgBVVYHA==
X-Received: by 2002:a05:6808:2903:b0:3a1:e17a:b3fb with SMTP id
 ev3-20020a056808290300b003a1e17ab3fbmr4696650oib.1.1693473737297; 
 Thu, 31 Aug 2023 02:22:17 -0700 (PDT)
Received: from [192.168.68.108] ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 bx33-20020a0568081b2100b003a3b321712fsm501824oib.35.2023.08.31.02.22.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 02:22:17 -0700 (PDT)
Message-ID: <6064b599-dedb-1871-b666-199aae74b2ba@ventanamicro.com>
Date: Thu, 31 Aug 2023 06:22:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] hw/riscv/virt.c: fix non-KVM --enable-debug build
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, richard.henderson@linaro.org
References: <20230830133503.711138-1-dbarboza@ventanamicro.com>
 <20230830133503.711138-2-dbarboza@ventanamicro.com>
 <20230831-d3b40182209cb9054ceaed62@orel>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230831-d3b40182209cb9054ceaed62@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.242,
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



On 8/31/23 05:42, Andrew Jones wrote:
> On Wed, Aug 30, 2023 at 10:35:02AM -0300, Daniel Henrique Barboza wrote:
>> A build with --enable-debug and without KVM will fail as follows:
>>
>> /usr/bin/ld: libqemu-riscv64-softmmu.fa.p/hw_riscv_virt.c.o: in function `virt_machine_init':
>> ./qemu/build/../hw/riscv/virt.c:1465: undefined reference to `kvm_riscv_aia_create'
>>
>> This happens because the code block with "if virt_use_kvm_aia(s)" isn't
>> being ignored by the debug build, resulting in an undefined reference to
>> a KVM only function.
>>
>> Add a 'kvm_enabled()' conditional together with virt_use_kvm_aia() will
>> make the compiler crop the kvm_riscv_aia_create() call entirely from a
>> non-KVM build. Note that adding the 'kvm_enabled()' conditional inside
>> virt_use_kvm_aia() won't fix the build because this function would need
>> to be inlined multiple times to make the compiler zero out the entire
>> block.
>>
>> While we're at it, use kvm_enabled() in all instances where
>> virt_use_kvm_aia() is checked to allow the compiler to elide these other
>> kvm-only instances as well.
>>
>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>> Fixes: dbdb99948e ("target/riscv: select KVM AIA in riscv virt machine")
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   hw/riscv/virt.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index 388e52a294..3b259b9305 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -782,7 +782,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
>>       }
>>   
>>       /* KVM AIA only has one APLIC instance */
>> -    if (virt_use_kvm_aia(s)) {
>> +    if (kvm_enabled() && virt_use_kvm_aia(s)) {
>>           create_fdt_socket_aplic(s, memmap, 0,
>>                                   msi_m_phandle, msi_s_phandle, phandle,
>>                                   &intc_phandles[0], xplic_phandles,
>> @@ -808,7 +808,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
>>   
>>       g_free(intc_phandles);
>>   
>> -    if (virt_use_kvm_aia(s)) {
>> +    if (kvm_enabled() && virt_use_kvm_aia(s)) {
>>           *irq_mmio_phandle = xplic_phandles[0];
>>           *irq_virtio_phandle = xplic_phandles[0];
>>           *irq_pcie_phandle = xplic_phandles[0];
>> @@ -1461,7 +1461,7 @@ static void virt_machine_init(MachineState *machine)
>>           }
>>       }
>>   
>> -    if (virt_use_kvm_aia(s)) {
>> +    if (kvm_enabled() && virt_use_kvm_aia(s)) {
>>           kvm_riscv_aia_create(machine, IMSIC_MMIO_GROUP_MIN_SHIFT,
>>                                VIRT_IRQCHIP_NUM_SOURCES, VIRT_IRQCHIP_NUM_MSIS,
>>                                memmap[VIRT_APLIC_S].base,
>> -- 
>> 2.41.0
>>
>>
> 
> I think I'd prefer
> 
>   /* We need this inlined for debug (-O0) builds */
>   static inline QEMU_ALWAYS_INLINE bool virt_use_kvm_aia(RISCVVirtState *s)
>   {
>      return kvm_enabled() && kvm_irqchip_in_kernel() && s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC;
>   }
> 
> assuming that works.


I've tried before with 'inline' but not with 'QEMU_ALWAYS_INLINE'. But unfortunately
it doesn't work too:


diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3b259b9305..a600d81e77 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -77,9 +77,10 @@
  #endif
  
  /* KVM AIA only supports APLIC MSI. APLIC Wired is always emulated by QEMU. */
-static bool virt_use_kvm_aia(RISCVVirtState *s)
+static inline QEMU_ALWAYS_INLINE bool virt_use_kvm_aia(RISCVVirtState *s)
  {
-    return kvm_irqchip_in_kernel() && s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC;
+    return kvm_enabled() && kvm_irqchip_in_kernel() &&
+           s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC;
  }
  
  static const MemMapEntry virt_memmap[] = {
@@ -782,7 +783,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
      }
  
      /* KVM AIA only has one APLIC instance */
-    if (kvm_enabled() && virt_use_kvm_aia(s)) {
+    if (virt_use_kvm_aia(s)) {
          create_fdt_socket_aplic(s, memmap, 0,
                                  msi_m_phandle, msi_s_phandle, phandle,
                                  &intc_phandles[0], xplic_phandles,
@@ -808,7 +809,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
  
      g_free(intc_phandles);
  
-    if (kvm_enabled() && virt_use_kvm_aia(s)) {
+    if (virt_use_kvm_aia(s)) {
          *irq_mmio_phandle = xplic_phandles[0];
          *irq_virtio_phandle = xplic_phandles[0];
          *irq_pcie_phandle = xplic_phandles[0];
@@ -1461,7 +1462,7 @@ static void virt_machine_init(MachineState *machine)
          }
      }
  
-    if (kvm_enabled() && virt_use_kvm_aia(s)) {
+    if (virt_use_kvm_aia(s)) {
          kvm_riscv_aia_create(machine, IMSIC_MMIO_GROUP_MIN_SHIFT,
                               VIRT_IRQCHIP_NUM_SOURCES, VIRT_IRQCHIP_NUM_MSIS,
                               memmap[VIRT_APLIC_S].base,


Same error:

/libssh.so -lrbd -lrados -lbz2 -lutil -Wl,--end-group
/usr/bin/ld: libqemu-riscv64-softmmu.fa.p/hw_riscv_virt.c.o: in function `virt_machine_init':
/home/danielhb/work/qemu/build/../hw/riscv/virt.c:1466: undefined reference to `kvm_riscv_aia_create'
collect2: error: ld returned 1 exit status



Thanks,


Daniel




> 
> Either way,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Thanks,
> drew

