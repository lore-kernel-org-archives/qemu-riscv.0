Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D1FCD8CBD
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 17:09:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1smFyP-0005Bz-2w; Thu, 05 Sep 2024 13:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1smFyN-00059Y-Sa
 for qemu-riscv@nongnu.org; Thu, 05 Sep 2024 13:08:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1smFyM-0007ed-Do
 for qemu-riscv@nongnu.org; Thu, 05 Sep 2024 13:08:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725556121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8Jaz7uW567bSqUXq8hD9y058OCGxCimyDIWuBv/00P0=;
 b=S59zx4AvUtuEv5NV1WXBRnQsdeLYc4pPnsD+lugiZ02xDAWWMnr2X1j1DeKXHFNB4dSEcA
 s97UtdSkqAWI/kepVSQdiC2ZHFd/ujWKBvSc2Fa2MW9lboPbZ4FyKolMu3M5Q+jfAzUICS
 Ucpv0eh0F2Bm7e6GyFchJiAuxdNbVwc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-69Ko3QE4Mfief0v1zi4jVQ-1; Thu, 05 Sep 2024 13:08:38 -0400
X-MC-Unique: 69Ko3QE4Mfief0v1zi4jVQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3750b4feb9fso583314f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 05 Sep 2024 10:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725556117; x=1726160917;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Jaz7uW567bSqUXq8hD9y058OCGxCimyDIWuBv/00P0=;
 b=rhW54TVWfDP2NBCj1IgnAOTa0CONWfcEqZ/8+rGnQZcy6E9znwYNj4NTspBbJu9XVe
 GM/GFSWp+sokRtnB9vh+P5N8sJhsip7/KC6RoaaSQ50TBJ9NUQHkPufjlQog9JAq5l3C
 +5kQWURq1wizuWZ+tn+2w3ZB6v6COuHa1XNafM/xNnGLW6HgZ4zwynefVqygaLskIQv2
 wfe27bx7urtZY2RfJjKMHF/AoRNV/gX7BDk1kxqMAJGFg+kGX0u26J+HtAh+Neo6QOde
 iHW1JlIvrkfkSmH6JkMBqoS8NXtKD2aGgrDH4UYHo/8SgSS2VIE94CmMQSUv7cJPBHzc
 aDtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsVfs+lq9YYWK4LrCBVwNqTir/2oe1zWHw/d95CBBL9w/tUlUOnGiv+BpXPAYQGB9gOErNnS2mQT9B@nongnu.org
X-Gm-Message-State: AOJu0Yw4+l9tgVPrC5fUSldhB2/QH8gspH8uSg4F8SRdalSLRB4wrF4N
 AKedIE/0F+PgHTuuhnI5qHqC2xtevaHUnh9bohcw3SoxtZZ6x/6xgMPg1uKXTzVMv5z4Ivt/DMT
 clLd57cIOoB4+WfkUKFmmyrQjBdQ+7WdAJ86OKflQ2BbiOdpuPfY8
X-Received: by 2002:a5d:55ca:0:b0:371:8685:84c with SMTP id
 ffacd0b85a97d-3779a70775amr4037872f8f.15.1725556116855; 
 Thu, 05 Sep 2024 10:08:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE7/NMqINsEJ7FLprCw3SARA7sOIra4PGJh4qfNL0W8EP1Xbf3Et4z8k5iQJ8v8wzKGbumvg==
X-Received: by 2002:a5d:55ca:0:b0:371:8685:84c with SMTP id
 ffacd0b85a97d-3779a70775amr4037857f8f.15.1725556116324; 
 Thu, 05 Sep 2024 10:08:36 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-42-243-216.web.vodafone.de.
 [109.42.243.216]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c8c8e10fsm12098807f8f.49.2024.09.05.10.08.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 10:08:35 -0700 (PDT)
Message-ID: <bf198824-70c0-4724-b1d4-b6aa348322c1@redhat.com>
Date: Thu, 5 Sep 2024 19:08:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 13/16] target/riscv: Restrict semihosting to TCG
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Anton Johansson <anjo@rev.ng>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20240722110413.118418-1-alex.bennee@linaro.org>
 <20240722110413.118418-14-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240722110413.118418-14-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 22/07/2024 13.04, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Semihosting currently uses the TCG probe_access API. To prepare for
> encoding the TCG dependency in Kconfig, do not enable it unless TCG
> is available.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Anton Johansson <anjo@rev.ng>
> Message-Id: <20240717105723.58965-7-philmd@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20240718094523.1198645-14-alex.bennee@linaro.org>
> 
> diff --git a/target/riscv/Kconfig b/target/riscv/Kconfig
> index 5f30df22f2..c332616d36 100644
> --- a/target/riscv/Kconfig
> +++ b/target/riscv/Kconfig
> @@ -1,9 +1,9 @@
>   config RISCV32
>       bool
> -    select ARM_COMPATIBLE_SEMIHOSTING # for do_common_semihosting()
> +    imply ARM_COMPATIBLE_SEMIHOSTING if TCG
>       select DEVICE_TREE # needed by boot.c
>   
>   config RISCV64
>       bool
> -    select ARM_COMPATIBLE_SEMIHOSTING # for do_common_semihosting()
> +    imply ARM_COMPATIBLE_SEMIHOSTING if TCG
>       select DEVICE_TREE # needed by boot.c

  Hi,

this patch broke compilation with "--without-default-devices":

/usr/bin/ld: libqemu-riscv64-softmmu.a.p/target_riscv_cpu_helper.c.o: in 
function `riscv_cpu_do_interrupt':
.../qemu/target/riscv/cpu_helper.c:1678:(.text+0x283c): undefined reference 
to `do_common_semihosting'

Could you please have a look? I think we either have to revert to "select" 
instead of "imply", or you might need to put some "#if 
CONFIG_ARM_COMPATIBLE_SEMIHOSTING" into the code that calls 
do_common_semihosting() ...?

  Thomas


