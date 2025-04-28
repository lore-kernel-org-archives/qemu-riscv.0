Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B74C369DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 15:37:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u9QXn-00048w-WA; Mon, 28 Apr 2025 11:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u9QXW-00041V-Al
 for qemu-riscv@nongnu.org; Mon, 28 Apr 2025 11:37:04 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u9QXS-0002NR-5D
 for qemu-riscv@nongnu.org; Mon, 28 Apr 2025 11:37:01 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39c14016868so4863553f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 28 Apr 2025 08:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745854614; x=1746459414; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OCGJMNCZ/fqqw/GUEMkreeTFhMnnnCHvM4H6nBWrE2k=;
 b=TfQ4vtQMuPyG1OV55cZPgYeJffXxlO/Sxsw5iwfXF4O0AyV1Z/qof7zWo8dfj2H0dj
 Xn1W6YsX7rjtrClN4HtWNzVhYkum1UowCPUxWl3XgqYHpCHSsf0waY59KAUm41cm6vZ6
 Bn3Jpo4cFiHqvlVQzrO15MJGGGZl9VLz4f9wv9oLMI2ZLsu+2kbbZ6J2r450ihNkAxAu
 yya5XYe0KxbggDflaDXKL+bgyH7ch0QEon/g0RmcRLbOa662wHXOYO8wfrotzjPrpNFv
 FmTiEjsi+WPbvwoyhHUEXHocBpDVPKICGpuq+7Pjy4TqAmL9HHlvgTiEAvZqOnOSFe3/
 b08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745854614; x=1746459414;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OCGJMNCZ/fqqw/GUEMkreeTFhMnnnCHvM4H6nBWrE2k=;
 b=jf7VZ/e8+mK7Q67RculK+7DEXmSk10xAjEJqTSVFlDk00TgYW0o9udtru58XkblSjG
 YH8s54CtAemoQFVbiJ1d2+NQ2kjthOpZ9GB846C8xWpiijd0kiN9xYMCpyCCkqZubBQ1
 kQ7tDW4513JvtdYv1u9EKWVl1nClREvAtkw+281Y0O20EADvJRvvEbPvyK8cbS9f4XUR
 kzhA7il7sOTz0vuk644Fbsr73pQrVGBzVaAUQUQqyw5yYe3XN++YpnzM8Dd0AdHygrNg
 fC41zjijKAxNq/9yFTQUySXP6/XfA5ymRedLOn6HkcDnuhjvuHvxFwLQnOoBmgVkX3W8
 pRFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmmaKcDPFLTwtceEEDg1bzxP0vYW9YEIaC+h4kL3/leEmiRV7A3yd6oqAfxxZqrEtLnzzf2F/UB2CC@nongnu.org
X-Gm-Message-State: AOJu0YxVjyAalwrgR02fcE5Wk0THvnf/1ngr9GtelLUfgERGMv2Pm4Dd
 4OuklP3rjZx+Wy9LVpe5EyEI/x5nLgftJuJ/To6uvBZTjBbmTk8pHlVVoY76CHs=
X-Gm-Gg: ASbGncsyt6+zpGvO3i0XWmKLeN0eLz5YHMgHV7a3N0OXjmAhFtyiFg7Z/69PAUAtLaz
 P3evsPU6wQ2a9uawr8NAWcZNMDYBudDQu7FhU0rVH4/4HkeItRbDBpPknNsK+C1Uw4bMSI8K66S
 g32pdxUS78fFBlG2Gmsn6WOReIoeLoyA/9qvGuIigjyEAQLx2OyliUJ0Z1ykmBAFFUxUzx7bx7r
 uCbj/nB26YkggF9QdfVF1tC1k4B/u0oWw+8gtzg8FtGinCLYljWW43REmdmKHupPwBEck5lSL3y
 q0dHYQvcQIe9W3SWXNo0e+yDtayn
X-Google-Smtp-Source: AGHT+IGwoQRUG7ti2SoENQDkodAbIuixv4O2EFuC6BJZf2c945ndlNGF+gYMCyCKgGQINYS83AL7Og==
X-Received: by 2002:a05:6000:196e:b0:39a:c9fe:f069 with SMTP id
 ffacd0b85a97d-3a0891abea9mr173740f8f.30.1745854613706; 
 Mon, 28 Apr 2025 08:36:53 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a089debe62sm66650f8f.40.2025.04.28.08.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 08:36:53 -0700 (PDT)
Date: Mon, 28 Apr 2025 17:36:52 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Meng Zhuo <mengzhuo@iscas.ac.cn>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Subject: Re: [PATCH] target/riscv: add satp mode for kvm host cpu
Message-ID: <20250428-c071a9089f070c2e6f001d9b@orel>
References: <20250427132557.1589276-1-mengzhuo@iscas.ac.cn>
 <20250428-00fc862d2d2d628ffa4c8547@orel>
 <D9I60P8TG036.2ZHSS9EHW4W8N@ventanamicro.com>
 <20250428-4cb96c7f0226e15a40006dee@orel>
 <D9IB9OMTGUZ7.8UBDDIX7RW0J@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D9IB9OMTGUZ7.8UBDDIX7RW0J@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Apr 28, 2025 at 03:37:26PM +0200, Radim Krčmář wrote:
> 2025-04-28T14:08:59+02:00, Andrew Jones <ajones@ventanamicro.com>:
> > On Mon, Apr 28, 2025 at 11:30:36AM +0200, Radim Krčmář wrote:
> >> 2025-04-28T09:00:55+02:00, Andrew Jones <ajones@ventanamicro.com>:
> >> > On Sun, Apr 27, 2025 at 09:25:57PM +0800, Meng Zhuo wrote:
> >> >> This patch adds host satp mode while kvm/host cpu satp mode is not
> >> >> set.
> >> >
> >> > Huh, the KVM side[1] was written for this purpose, but it appears we never
> >> > got a QEMU side merged.
> >> >
> >> > [1] commit 2776421e6839 ("RISC-V: KVM: provide UAPI for host SATP mode")
> >> 
> >> KVM satp_mode is the current SATP.mode and I don't think the other
> >> SATP.modes can generally be guessed from the host SATP mode.
> >> 
> >> Can't QEMU use the host capabilities from cpuinfo or something?
> >> 
> >> Do we need to return a bitmask from KVM?
> >> (e.g. WARL all modes in vsatp and return what sticks.)
> >>
> >
> > The widest supported is sufficient because all narrower must also be
> > supported. Linux should be figuring out the widest and capturing that
> > at boot time and we should be returing that info for the KVM satp_mode
> > get-one-reg call.
> 
> Linux has command line overrides for the mode (no4lvl and no5vlv), so
> the active mode in Linux might not be the widest supported by the cpu.
> 
> Let's say Linux decides to use 9 on a host cpu that has 0,8,9,10.
> set_satp_mode_max_supported() will set supported vcpu modes to 0,8,9.
> 
> Should "-cpu host" contain the 10?

If the architecture allows it and the host kernel/KVM is aware of it. If,
OTOH, the boot options / hardware description has hidden the platform's
capabilities from KVM, then it won't know 10 is supported, so it won't
tell the vmm it is and the vmm shouldn't second guess that.

> 
> > If the satp_mode we're currently returning isn't the widest possible,
> > then we should fix that in KVM.
> 
> The numbers are even more complicated... Pasting the values from manual:
> 
>   0      Bare
>   1-7    Reserved for standard use
>   8      Sv39
>   9      Sv48
>   10     Sv57
>   11     Reserved for Sv64
>   12-13  Reserved for standard use
>   14-15  Designated for custom use
> 
> The reserved values make this extra juicy, let's say Linux uses 14 on
> machine that has 0,8,9,14.  QEMU sees 14 and sets the vcpu modes to
> 0,8,9,10 -- it's not even a subset of the host CPU.
> (There might be similar problems even with future standard extensions.)

Currently QEMU won't recognize anything higher than 10 and it knows how
to skip 1-7. If we need to add more standard support (or custom support)
we'll have to modify set_satp_mode_max_supported(). But let's burn that
bridge later. We should probably sanity check the input to that function
with something like the (untested) diff below, though.

Thanks,
drew

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 09ded6829a2c..a9088c7b1770 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -435,10 +435,18 @@ const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
 }
 
 static void set_satp_mode_max_supported(RISCVCPU *cpu,
-                                        uint8_t satp_mode)
+                                        uint8_t satp_mode,
+                                        Error **errp)
 {
     bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
     const bool *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
+    int satp_max = rv32 ? VM_1_10_SV32 : VM_1_10_MAX;
+
+    if (satp_mode > satp_max) {
+        error_setg(errp, "satp_mode %s is higher than the supported max %s",
+                   satp_mode_str(satp_max, rv32),
+                   satp_mode_str(satp_max, rv32));
+    }
 
     for (int i = 0; i <= satp_mode; ++i) {
         if (valid_vm[i]) {
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index a30317c61781..46d206abba97 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -662,6 +662,7 @@ typedef enum {
 #define VM_1_10_SV48        9
 #define VM_1_10_SV57        10
 #define VM_1_10_SV64        11
+#define VM_1_10_MAX         VM_1_10_SV64
 
 /* Page table entry (PTE) fields */
 #define PTE_V               0x001 /* Valid */

