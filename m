Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E86C83F12
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 14:19:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qazYZ-0000G9-MY; Tue, 29 Aug 2023 10:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qazYX-0000FE-Db
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 10:18:57 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qazYU-0001zB-TP
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 10:18:57 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fe4cdb72b9so43456275e9.0
 for <qemu-riscv@nongnu.org>; Tue, 29 Aug 2023 07:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693318733; x=1693923533;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Avwm6g3wqpU0rrbhmDuEJQYPbNE2E3ULIXXoLDVzdlQ=;
 b=k9DO7cD4UxRh/ytg0NXx7d/O+B8AwXaneYrLuHp5DGtsWABHNF7BhQmbDiEuQI2OW6
 YOdX3qAWpOqmhcqj9/hoCtGCAWZGkiw9lFZOEWjtBy8o37vYvWYwETXPrDiQd3Etr8r3
 hfDAR84oPUbN4hUdvznAphbfRJqHt0kjckGH7obOzxQjh0oTilM00mtR24TRwrzIDOXr
 QvUIJpY1ynn+Fbsj8BPF6WaMMHax04RZjaA97mRQIsNhcODwIOckol12zh6SO+1aMFW7
 jPG29/BfYAbAYAsqD2TEK0ieJJ4YxNgDi0qAdI1vSNXZBNyBUO7qHpnXPgsbwUnE4nsL
 6m8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693318733; x=1693923533;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Avwm6g3wqpU0rrbhmDuEJQYPbNE2E3ULIXXoLDVzdlQ=;
 b=NkLZevA8hsincj5XZn6vAmliNFPSr+C+lD+ZWSsShVOFguF6eEYtIDwv5MMFGcGgg7
 0J7wOmAqI6wpI3qUicP3dmZgQHflD8EzaFeeKvfoNvYHUa6htejXOYLnU1cf8cKvKObh
 yDoZrhfdY2vNILqY3/te96cBi/zFsEmH+wLS2+L1nb9w2fGuty3qVPibVqNtnBMoXDDk
 /MyYmmN9eLToRK0crLJF+lgyahrT1TP0XNMNaKGJe3J2SUP+obkFaM3EMfXuUg2oSCCZ
 uqJbLsICWSC/Ms+oMagEJloGIEJOSMmVYvXq7YLiIz+RljWORCdka6hoGXQ85fNRH1gQ
 x4ng==
X-Gm-Message-State: AOJu0Yytrbtt4p1j1z8HQi6JhTV/AKnIfhitzDUchrVAiidkEblLJQ9/
 vo6nD6B8CU4bfhDFgO3ZHHqocA==
X-Google-Smtp-Source: AGHT+IFwc5PwvF5zXWdsoq13yanWn21+qp9AGRZH5BhqoRysFt26bH3LetbLVcX0xolKXZY4Swof2Q==
X-Received: by 2002:adf:f8c4:0:b0:314:d31:f7 with SMTP id
 f4-20020adff8c4000000b003140d3100f7mr23019808wrq.63.1693318733269; 
 Tue, 29 Aug 2023 07:18:53 -0700 (PDT)
Received: from [192.168.69.115] (sml13-h01-176-184-15-56.dsl.sta.abo.bbox.fr.
 [176.184.15.56]) by smtp.gmail.com with ESMTPSA id
 z16-20020a1c4c10000000b003fa96fe2bd9sm17202535wmf.22.2023.08.29.07.18.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 07:18:50 -0700 (PDT)
Message-ID: <c0089044-54d2-43ab-6b30-854a4fa3aa4f@linaro.org>
Date: Tue, 29 Aug 2023 16:18:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 2/2] hw/riscv/virt.c: fix non-KVM --enable-debug build
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230829122144.464489-1-dbarboza@ventanamicro.com>
 <20230829122144.464489-3-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230829122144.464489-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.242,
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

On 29/8/23 14:21, Daniel Henrique Barboza wrote:
> A build with --enable-debug and without KVM will fail as follows:
> 
> /usr/bin/ld: libqemu-riscv64-softmmu.fa.p/hw_riscv_virt.c.o: in function `virt_machine_init':
> ./qemu/build/../hw/riscv/virt.c:1465: undefined reference to `kvm_riscv_aia_create'
> 
> This happens because the code block with "if virt_use_kvm_aia(s)" isn't
> being ignored by the debug build, resulting in an undefined reference to
> a KVM only function.
> 
> Add a stub for kvm_riscv_aia_create() in kvm_riscv.h when CONFIG_KVM is
> false. Adding it as an inline instead of using kvm-stubs.c will make it
> easier in the future to remember to add stubs for kvm functions that are
> used in multiple accelerator code.
> 
> Fixes: dbdb99948e ("target/riscv: select KVM AIA in riscv virt machine")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/kvm_riscv.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Similarly:

-- >8 --
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
@@ -79,7 +79,9 @@
  /* KVM AIA only supports APLIC MSI. APLIC Wired is always emulated by 
QEMU. */
  static bool virt_use_kvm_aia(RISCVVirtState *s)
  {
-    return kvm_irqchip_in_kernel() && s->aia_type == 
VIRT_AIA_TYPE_APLIC_IMSIC;
+    return kvm_enabled()
+        && kvm_irqchip_in_kernel()
+        && s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC;
  }
---

?

