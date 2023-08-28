Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09D2C83F12
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 16:48:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qafOv-0007qH-Cj; Mon, 28 Aug 2023 12:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qafOu-0007pl-63
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 12:47:40 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qafOr-0008RV-QL
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 12:47:39 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-401c9525276so12017065e9.1
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 09:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693241256; x=1693846056;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qnbbpQq+Gu4QPdSgM3C88HLBfJ2eapZvqglT3tZ9USU=;
 b=PPBuyPnHLItxAynwJLpgtTGPyrUEZ8ehORMdLflD+yjwbrKNVjnioJSRjc4oObwylu
 9AVCbjPuGcCuQ6eH+YppFm+JlsU7liwtey+jlFI0AnNScQG1eumYzqwXv5zaiWSNvlcM
 J8ukJJkb1L2hT7qadyHPL3IqovgABPybXj/Adx4yyfMDOovWe5A7aRVV5YqELJlB73vA
 5pbLHYh+Uyz415NB32Psbqsj9bxlOisuIZEMuD62GaJACeUiXYdFwnAeqTkX6BiJe/uB
 VEkhPK5nKzhTkNM+F22xmM0fwo4qaT4cAGhozNLc2Xz7jXgVNuoyOPtfr3DXf0JNbyoV
 VBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693241256; x=1693846056;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qnbbpQq+Gu4QPdSgM3C88HLBfJ2eapZvqglT3tZ9USU=;
 b=EUX2vl2xKGtE8wzgwD6vrupu/w7ShQIv6+U2GDUmsY2Laoya38MhxBJVriqT0urT8F
 Bh5FsUWdh3E+BogibPGeE+SKJnxjm+aV7OiTxiP+pb55t4r2yDhX/96snBN5G/wePl6T
 s4OBbY5pJVBgfvO6pzXQojerReleFehGhIa1TIP3MKLMktP981KZwiRs78xyuP3ODgF9
 eFeYbw3tMfz+lyzqSR06tk0dB/57nlCHGum4c51mDZPFpK+WKgTnyTkQD6JH1zB6vi+6
 +SpiF7vdO+8BzOoojcmtigPA2P5nWyOBJtnvddPPdcjaMyLM10MXizngv+0CWe4+IUFV
 I36A==
X-Gm-Message-State: AOJu0Yy2vq3elFThqaT9IkZRKwF4bfWC+RNqiGaEtGqsHlUhrD/52DlP
 kpIfM65uqMa/QYDmzL/d1ihFZQ==
X-Google-Smtp-Source: AGHT+IEzXse2TKvm6TpkhDrKvC8/3PimMxjk58Tf5ZfFM/bZ+LghuaJSYMnQbyyEqn6mIrGMhtK72A==
X-Received: by 2002:a7b:c445:0:b0:401:cdc1:ac82 with SMTP id
 l5-20020a7bc445000000b00401cdc1ac82mr1476080wmi.9.1693241255787; 
 Mon, 28 Aug 2023 09:47:35 -0700 (PDT)
Received: from [192.168.69.115] ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a1c4c10000000b003fa96fe2bd9sm14394767wmf.22.2023.08.28.09.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 09:47:35 -0700 (PDT)
Message-ID: <355beacc-19a4-f860-52ec-c421858b40e1@linaro.org>
Date: Mon, 28 Aug 2023 18:47:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 12/20] target/riscv: move KVM only files to kvm subdir
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-13-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230825130853.511782-13-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.169,
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

On 25/8/23 15:08, Daniel Henrique Barboza wrote:
> Move the files to a 'kvm' dir to promote more code separation between
> accelerators and making our lives easier supporting build options such
> as --disable-tcg.
> 
> Rename kvm.c to kvm-cpu.c to keep it in line with its TCG counterpart.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/riscv/virt.c                       | 2 +-
>   target/riscv/cpu.c                    | 2 +-
>   target/riscv/{kvm.c => kvm/kvm-cpu.c} | 0
>   target/riscv/{ => kvm}/kvm-stub.c     | 0
>   target/riscv/{ => kvm}/kvm_riscv.h    | 0
>   target/riscv/kvm/meson.build          | 2 ++
>   target/riscv/meson.build              | 2 +-
>   7 files changed, 5 insertions(+), 3 deletions(-)
>   rename target/riscv/{kvm.c => kvm/kvm-cpu.c} (100%)
>   rename target/riscv/{ => kvm}/kvm-stub.c (100%)
>   rename target/riscv/{ => kvm}/kvm_riscv.h (100%)
>   create mode 100644 target/riscv/kvm/meson.build


> +++ b/target/riscv/kvm/meson.build
> @@ -0,0 +1,2 @@
> +riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm-cpu.c'),
> +                                 if_false: files('kvm-stub.c'))

Hmm maybe we need to add:

-- >8 --
diff --git a/include/hw/core/accel-cpu.h b/include/hw/core/accel-cpu.h
index 5dbfd79955..65973b6f2e 100644
--- a/include/hw/core/accel-cpu.h
+++ b/include/hw/core/accel-cpu.h
@@ -33,6 +33,7 @@ typedef struct AccelCPUClass {
      void (*cpu_class_init)(CPUClass *cc);
      void (*cpu_instance_init)(CPUState *cpu);
      bool (*cpu_realizefn)(CPUState *cpu, Error **errp);
+    ResettablePhases cpu_reset;
  } AccelCPUClass;
---

and here:

  static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
  {
      AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);

      acc->cpu_instance_init = kvm_cpu_instance_init;
+    acc->cpu_reset.hold = kvm_riscv_reset_vcpu;
  }

so then calling some accel_cpu_reset_hold() in riscv_cpu_reset_hold(),
would call kvm_riscv_reset_vcpu() and we can remove kvm-stub.c.




