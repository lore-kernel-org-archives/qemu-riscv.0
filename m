Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960A1C369C2
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 14:08:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u7xFw-0007K4-8Q; Thu, 24 Apr 2025 10:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u7xFu-0007JW-Ou
 for qemu-riscv@nongnu.org; Thu, 24 Apr 2025 10:08:46 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u7xFt-0008Mv-4P
 for qemu-riscv@nongnu.org; Thu, 24 Apr 2025 10:08:46 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-af5085f7861so755178a12.3
 for <qemu-riscv@nongnu.org>; Thu, 24 Apr 2025 07:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1745503723; x=1746108523; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M2N9CStS5IF5ngS8fidDPDqwrbrUnRLIG3Hxdpxt10M=;
 b=i+frh4BR7C8oc8nRjbFKSDe6JmuSpg9OrUWMB5hpJS3/hJL4u4XYjuntjACS6pRW9h
 4BJEkwKeKJq/VjbFIM9/33f9ShEQdFhsaDndndSWYPK7ZmDoLBqEAAnfK4GlA7VXwNhO
 cAaslNFpixqe7fxFKGtjZXElYH5Hj2X3FMH8QxeqdaMJkqUejUx5+UFngXkDv2l/uOf9
 U4+/NW4EIxBe4uGECyTQtztq4ylOBtmH8GE+m26sEevNvgviBlKDCOzrBQocAtHitFEh
 FlQRNSMgkAWd/PoJ77k14GatOvZquiF/YXAHbPmXZOVAWjdIeiOUzIIz2BkU2sXmtJiG
 SaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745503723; x=1746108523;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M2N9CStS5IF5ngS8fidDPDqwrbrUnRLIG3Hxdpxt10M=;
 b=kMwVkP34PiOYSL0ky1RCiOuAogY99y4LyrE6sYCqsOIOd1bgYMjg00zIyizaL+BhfE
 omHvPSq6VynJ0BxClOSVtGalAtwxTpv8ysxBRCHcETdAxhxrD1zP4PSlR9In2fSKJKHN
 GH5i7IAJ1b1tDsYCR6CS4iqilCZpRe8j6b0AtMYJHSCA404Sp1CVMztpYXuanyFO2KSN
 AcBiK6s+oLtT/ct1N1QtztPSPcMvzl1HRDCgicvl0mjm1sIE1DHGgIeCXmYWNTs5xTGu
 mAgozv94UrSAhUSdSwXApwVZZ5ZvLm1wPawdBbi2PW4O70iUl2ShO4fRm1tSrozb70Tg
 PpOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpFD8X4lmEaqpx3tX0JwR3GCTxtlP6WZz/3aWfeuMTsb2oJSUNQIUJ/XA63vIH+E13gFL8983YZkJZ@nongnu.org
X-Gm-Message-State: AOJu0YzC0Ez9jCAlidsvzPzSZV4XzyHpNVNZdncbFVDPZFT6G1H6KgoY
 PRBsCmr6V1IxraFTE9oNatADPWb0kiQJBwNCFhoxBnsqJ6ngIY636es8//QQvfI=
X-Gm-Gg: ASbGncvTezqAP6QQ8xWWodLPEJzdnyIbuak8p9/ucXaTY4MozYrcfaxkF+SONcHHZcJ
 AW6dlo71f3pv1ZcKDC0I67UDxd9nDlY9aqkMSPEBAZkeGbU3fYs8iN0G2tZD5j9UdK+hfTTtfLI
 92oK7BMKjNiWUkbygFXNav9xvDIUHTAYPRELmVqiBTtJW+ZgLupL63mvGRWH5hON9iXMjhwPsTR
 ByV4Llz23qTTrkUN8VjmRp5JxjbRaQznn3bEQ4k+WqMZWuIoHX0kx4GQOxbFZIFDZV7lwiWZiXC
 fU2fxlGxBjai++sz1Ae2oOaed4OaS+dhLxFOJxSBZw==
X-Google-Smtp-Source: AGHT+IFsHCf8JCAbTgy++JBWI+ZLvGFpzD4gmNovlsp6whN6uhvmw2sHadC4uF/z5yTRFrnTlVO05w==
X-Received: by 2002:a05:6a20:d50c:b0:1f5:7d57:8309 with SMTP id
 adf61e73a8af0-20444f089b8mr3591225637.21.1745503723300; 
 Thu, 24 Apr 2025 07:08:43 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.240.169])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25941bddsm1458176b3a.69.2025.04.24.07.08.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 07:08:42 -0700 (PDT)
Message-ID: <778a30a3-d196-4cb6-aaac-7428a4003e83@sifive.com>
Date: Thu, 24 Apr 2025 22:08:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] target/riscv: vadc and vsbc are vm=0 instructions
To: Anton Blanchard <antonb@tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.or
Cc: dbarboza@ventanamicro.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com
References: <20250415043207.3512209-1-antonb@tenstorrent.com>
 <20250415043207.3512209-4-antonb@tenstorrent.com>
Content-Language: en-US
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <20250415043207.3512209-4-antonb@tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

LGTM Thanks

Reviewed-by: Max Chou<max.chou@sifive.com>



On 2025/4/15 12:32 PM, Anton Blanchard wrote:
> We were marking vadc and vsbc as vm=1 instructions, which meant
> vext_check_input_eew wouldn't detect mask vs source register
> overlaps.
>
> Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
> ---
>   target/riscv/insn32.decode | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index cd23b1f3a9..5442203eca 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -451,14 +451,14 @@ vwsubu_wv       110110 . ..... ..... 010 ..... 1010111 @r_vm
>   vwsubu_wx       110110 . ..... ..... 110 ..... 1010111 @r_vm
>   vwsub_wv        110111 . ..... ..... 010 ..... 1010111 @r_vm
>   vwsub_wx        110111 . ..... ..... 110 ..... 1010111 @r_vm
> -vadc_vvm        010000 0 ..... ..... 000 ..... 1010111 @r_vm_1
> -vadc_vxm        010000 0 ..... ..... 100 ..... 1010111 @r_vm_1
> -vadc_vim        010000 0 ..... ..... 011 ..... 1010111 @r_vm_1
> +vadc_vvm        010000 0 ..... ..... 000 ..... 1010111 @r_vm_0
> +vadc_vxm        010000 0 ..... ..... 100 ..... 1010111 @r_vm_0
> +vadc_vim        010000 0 ..... ..... 011 ..... 1010111 @r_vm_0
>   vmadc_vvm       010001 . ..... ..... 000 ..... 1010111 @r_vm
>   vmadc_vxm       010001 . ..... ..... 100 ..... 1010111 @r_vm
>   vmadc_vim       010001 . ..... ..... 011 ..... 1010111 @r_vm
> -vsbc_vvm        010010 0 ..... ..... 000 ..... 1010111 @r_vm_1
> -vsbc_vxm        010010 0 ..... ..... 100 ..... 1010111 @r_vm_1
> +vsbc_vvm        010010 0 ..... ..... 000 ..... 1010111 @r_vm_0
> +vsbc_vxm        010010 0 ..... ..... 100 ..... 1010111 @r_vm_0
>   vmsbc_vvm       010011 . ..... ..... 000 ..... 1010111 @r_vm
>   vmsbc_vxm       010011 . ..... ..... 100 ..... 1010111 @r_vm
>   vand_vv         001001 . ..... ..... 000 ..... 1010111 @r_vm


