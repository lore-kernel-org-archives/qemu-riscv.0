Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093B3C47071
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 09:52:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3Z2k-0001yJ-KD; Thu, 16 Nov 2023 04:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Z2j-0001xl-E0
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 04:52:13 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Z2h-0007hU-Ms
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 04:52:13 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-32f70391608so374054f8f.2
 for <qemu-riscv@nongnu.org>; Thu, 16 Nov 2023 01:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700128330; x=1700733130; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eJbwXVt2Z6najqF1TVzKDP+6ZWX+M46efpJixXq1zIk=;
 b=TIaR9wNrOBGtN4NyiR8xr6A29FrW4hgB7226w+Qwst/lxDb1jpAlB9SMWQk3MRg4u9
 yKjbCRA1VzqFqvGgmYu826wqrzQ522D52YCSfQjcgCihtI6S+ofyLBXabXL8DbuKliC5
 NQQMxN99qonu+26GfOqQTmf/xpwDAAAYVVeGEQ9A/K1okSJMxJg4vIGQi3xw8U7zi9nr
 SqjP0UHUjvuixLyJ9LyM2xxbEo+2EmgCTzgTBDUEMwlhpl2MdzDrmABgmkH4MgTfOoIo
 VQ4TP4Aa5vIDA6rf9iOhDHJ39o8rf0gj0VCRTb7emCcq4yqIjWRjTvbZjVxamKoSyjyD
 Eytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700128330; x=1700733130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eJbwXVt2Z6najqF1TVzKDP+6ZWX+M46efpJixXq1zIk=;
 b=B8V1jv0xv5+r2+lle1uOxQGBldJ6QmEngoYX9QPE4ow66pSiM/sth2xpd2Ip1C5KFg
 mjzbusjVJufFpQ9vL71KOP6rZZSi1vA4jVlQS90wOPLU0PGlwrpe+B0Oe3M2E2PGcXDb
 /PZWq/WJ1ETKuLuiJf+sumQxC81zqEyJYUWbcoqCUgkOMQt/0WbroAyF25UhbN94R0lz
 M7MiNMvSeVpRtXD+q97e8fT0BuM9wkO2In16sZT3uysv/p7oUXkDzo53gwDVRzKCL02S
 GEAC0gzqtmisq7veQmMe6jCCoBMotWze5dih0zhwV/v7UlkdyhmGJnC7YsXnaf0O8Yhk
 VtcQ==
X-Gm-Message-State: AOJu0YwGvzSTL1ST5wWLPixnUejoeMW5cmc87xkOMUsR+p/XKzLSz6KB
 rIJ4DRAtwTKB6Gm80yb51pB7Ug==
X-Google-Smtp-Source: AGHT+IEAIgUPS1JS0xNpf4FVCAqwXMUQpzOJhJjL+OXXkziOcno7C00ZISMYFE1Ys/C2aF80vS4/kQ==
X-Received: by 2002:a5d:4584:0:b0:32d:88f6:ec2f with SMTP id
 p4-20020a5d4584000000b0032d88f6ec2fmr9906336wrq.60.1700128329483; 
 Thu, 16 Nov 2023 01:52:09 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a056000120100b003296b488961sm12812220wrx.31.2023.11.16.01.52.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 01:52:09 -0800 (PST)
Message-ID: <08b7421e-f261-45e7-b741-34eb0ccd818d@linaro.org>
Date: Thu, 16 Nov 2023 10:52:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/31] machine: Constify
 MachineClass::valid_cpu_types[i]
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-24-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-24-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 15/11/23 00:56, Gavin Shan wrote:
> Constify MachineClass::valid_cpu_types[i], as suggested by Richard
> Henderson.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/m68k/q800.c      | 2 +-
>   include/hw/boards.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Preferably:

-- >8 --
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 1d7cd5ff1c..83d1571d02 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -726,19 +726,18 @@ static GlobalProperty hw_compat_q800[] = {
  };
  static const size_t hw_compat_q800_len = G_N_ELEMENTS(hw_compat_q800);

-static const char *q800_machine_valid_cpu_types[] = {
-    M68K_CPU_TYPE_NAME("m68040"),
-    NULL
-};
-
  static void q800_machine_class_init(ObjectClass *oc, void *data)
  {
+    static const char * const valid_cpu_types[] = {
+        M68K_CPU_TYPE_NAME("m68040"),
+        NULL
+    };
      MachineClass *mc = MACHINE_CLASS(oc);

      mc->desc = "Macintosh Quadra 800";
      mc->init = q800_machine_init;
      mc->default_cpu_type = M68K_CPU_TYPE_NAME("m68040");
-    mc->valid_cpu_types = q800_machine_valid_cpu_types;
+    mc->valid_cpu_types = valid_cpu_types;
      mc->max_cpus = 1;
      mc->block_default_type = IF_SCSI;
      mc->default_ram_id = "m68k_mac.ram";
---

Since commit 3d1611bfa1 ("hw/hppa: Allow C3700 with 64-bit and B160L
with 32-bit CPU only") we need to update hw/hppa/machine.c:

-- >8 --
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 9d08f39490..c8da7c18d5 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -672,19 +672,18 @@ static void hppa_nmi(NMIState *n, int cpu_index, 
Error **errp)
      }
  }

-static const char *HP_B160L_machine_valid_cpu_types[] = {
-    TYPE_HPPA_CPU,
-    NULL
-};
-
  static void HP_B160L_machine_init_class_init(ObjectClass *oc, void *data)
  {
+    static const char * const valid_cpu_types[] = {
+        TYPE_HPPA_CPU,
+        NULL
+    };
      MachineClass *mc = MACHINE_CLASS(oc);
      NMIClass *nc = NMI_CLASS(oc);

      mc->desc = "HP B160L workstation";
      mc->default_cpu_type = TYPE_HPPA_CPU;
-    mc->valid_cpu_types = HP_B160L_machine_valid_cpu_types;
+    mc->valid_cpu_types = valid_cpu_types;
      mc->init = machine_HP_B160L_init;
      mc->reset = hppa_machine_reset;
      mc->block_default_type = IF_SCSI;
@@ -709,19 +708,18 @@ static const TypeInfo 
HP_B160L_machine_init_typeinfo = {
      },
  };

-static const char *HP_C3700_machine_valid_cpu_types[] = {
-    TYPE_HPPA64_CPU,
-    NULL
-};
-
  static void HP_C3700_machine_init_class_init(ObjectClass *oc, void *data)
  {
+    static const char * const valid_cpu_types[] = {
+        TYPE_HPPA64_CPU,
+        NULL
+    };
      MachineClass *mc = MACHINE_CLASS(oc);
      NMIClass *nc = NMI_CLASS(oc);

      mc->desc = "HP C3700 workstation";
      mc->default_cpu_type = TYPE_HPPA64_CPU;
-    mc->valid_cpu_types = HP_C3700_machine_valid_cpu_types;
+    mc->valid_cpu_types = valid_cpu_types;
      mc->init = machine_HP_C3700_init;
      mc->reset = hppa_machine_reset;
      mc->block_default_type = IF_SCSI;
---

