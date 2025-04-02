Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C7EC28B20
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Apr 2025 14:40:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tzzGo-0006P0-Jd; Wed, 02 Apr 2025 10:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzzGe-0006O4-Qi
 for qemu-riscv@nongnu.org; Wed, 02 Apr 2025 10:40:38 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzzGa-00040N-Ft
 for qemu-riscv@nongnu.org; Wed, 02 Apr 2025 10:40:36 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so69557595e9.2
 for <qemu-riscv@nongnu.org>; Wed, 02 Apr 2025 07:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743604829; x=1744209629; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tvMjyOyyNNwjTWNo1fk6qGXnG8fPKOLFq2Z6zXy8Ma4=;
 b=LkSD+7ZXysa9xoNdpN97gMxGmqVa8ApI48RGl6iU8VvraG+m2lk5FPsx2/rOZ2IC1X
 6Vx7Z//e22POyd71g+duSA5v1MLv4GriKt/3LnM8iUd/MTY26dDBsxV+I4HqnRUsW5Lg
 vgFCWOKW6cJnXkWt/XnmSvOJLPRGjbZjTDVvNv+YD9wMQu51gk44Upydl9F2NQUDfiAH
 FMXimCzo17A7ZmqlpkKFA+N4mouMxNbeAE2xcQr1oFkHuvfWBgJ4buMHkL7Igdv6FLN2
 g0uJfaM8eEWue0cs9gOP1Q1KzGaHiUs6pVMUwv57ZE2KvuN0SgoEDarArRoZ7AR9rOsj
 yR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743604829; x=1744209629;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tvMjyOyyNNwjTWNo1fk6qGXnG8fPKOLFq2Z6zXy8Ma4=;
 b=QFBpiO6ZdWyC4QrFP4QdrH7GbSVxMA324B020mH+T5BkzNo9QpNHE6ej6PXYTCmgrm
 XhG5Z+EbP/dxmjioDUj7g0HG0m1V0CxHTTSn5uPySgp/J+HF/bjqFKWJSJ+o0Ow++Khx
 4kfjHH3ddnDua1cptb7Cts60XHLm1az7EfuwQR20v/AuQxwOmtLZdh9A7krKQP1CQCVF
 r8kI/EeXwdkKmxVk9rHBGZ6UMycfXhr2WC0IEZfLTDaNwgHVRbGc/7Pp/qc5E7p581nq
 1SM8seKb8sESmO9HQ2ZBYT2dOiBLww43XJ8ttyomu0wZkeuPXe31wnwIscq7dWxkteXF
 txPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrCl0WRroBfy/uzTKVqW2uIoEjEUzj7rgNHPmj+EMyJJdMB2dP+/3euRuUzYN3XMY1uuegCHpzwZJb@nongnu.org
X-Gm-Message-State: AOJu0YxTmrRVmMTYQFQtyw2YqexmOR66eAvijtTVOu50MNKtXEMzWuo9
 HOcsaTWp/wCFLzy9gV9gTJ4SGSYEqeJZ7KAHVcAJ77HxC46o5V62gdcIJRtgLO0=
X-Gm-Gg: ASbGncvm4CgVxaAhu0UOzyi1SL1Ekj52MiDqMiSpMj0wsPjwaQcWnoQuKuupmeNNc5x
 aAEUZzozdSsbpCPr1faLIFPNhHGNIoZzbEwot0tYREMoidi4qXlKnNTmeTImHCs4tFEs6xPac9H
 e+dLvfSgPpHPiZrPYeYjcn1MC8mC9YHX3zd8mLEppkMCaffE0FxJbaxSUt4p9gsoNpbzFnvDSvd
 b82qtPvYTcaqRtftWX/jUPRxxZrVSKl6fHGAFA9FtOZvBDIp78VXKtqN4UbZcIg5Kqn6bUhrX9V
 nNFIudS8AgQhYC5SEoIn0iCtSLbTnA3b9sbsVuAqz3np1/BksXOE+xAUz4v38o6tT9OxI6L1HuT
 ut5saLcGu1aWz
X-Google-Smtp-Source: AGHT+IGsM2J2ZUE+TigT5GPiigBXYlUgFMk1vexz/bFmC1Pl4cDpkzJXrYz+Lj1hWeY5oIBeIt7Tjg==
X-Received: by 2002:a05:600c:4f43:b0:43c:fad6:fa5a with SMTP id
 5b1f17b1804b1-43db62b77acmr156577125e9.24.1743604829386; 
 Wed, 02 Apr 2025 07:40:29 -0700 (PDT)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb60eae85sm22764335e9.26.2025.04.02.07.40.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 07:40:28 -0700 (PDT)
Message-ID: <90049822-b71a-4120-9537-7d43caf44f83@linaro.org>
Date: Wed, 2 Apr 2025 16:40:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 1/4] target/riscv: Restrict RV128 MTTCG check on
 system emulation
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv <qemu-riscv@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>, Bin Meng <bmeng@tinylab.org>,
 Andrew Jones <ajones@ventanamicro.com>, Palmer Dabbelt <palmer@rivosinc.com>
References: <20250321155925.96626-1-philmd@linaro.org>
 <20250321155925.96626-2-philmd@linaro.org>
 <2650b68f-e705-4994-9791-0bf8b2e01d74@linaro.org>
 <43e170ad-d4e3-489d-a049-22361cd34f13@linaro.org>
Content-Language: en-US
In-Reply-To: <43e170ad-d4e3-489d-a049-22361cd34f13@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 2/4/25 16:25, Philippe Mathieu-Daudé wrote:
> On 23/3/25 19:08, Richard Henderson wrote:
>> On 3/21/25 08:59, Philippe Mathieu-Daudé wrote:
>>> Multi-threaded TCG only concerns system emulation.
>>
>> That's not really true.  User emulation simply has no option to
>> run in a single-threaded context.
>>
>> I really don't think we should allow RV128 in user-mode at all.
>> Certainly not until there's a kernel abi for it.
> 
> It seems to be safe since commit 905b9fcde1f ("target/riscv: Replace
> is_32bit with get_xl/get_xlen"):
> 
>   #ifdef TARGET_RISCV32
>   #define get_xl(ctx)    MXL_RV32
>   #elif defined(CONFIG_USER_ONLY)
>   #define get_xl(ctx)    MXL_RV64
>   #else
>   #define get_xl(ctx)    ((ctx)->xl)
>   #endif
> 
> Should we undefine MXL_RV128 on user-mode?

Indeed the CPU is exposed on user-mode...

$ qemu-riscv64 -cpu help
Available CPUs:
   max
   rv64
   rv64e
   rv64i
   rva22s64
   rva22u64
   rva23s64
   rva23u64
   shakti-c
   sifive-e51
   sifive-u54
   thead-c906
   tt-ascalon
   veyron-v1
   x-rv128           <---------
   xiangshan-nanhu

Per commit 6df3747a274 ("riscv: Introduce satp mode hw
capabilities") I wonder if this is expected.

Anyhow, I'll post a patch disabling it as:

-- >8 --
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 430b02d2a58..33abcef0073 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -699,3 +699,3 @@ static void rv64_xiangshan_nanhu_cpu_init(Object *obj)

-#ifdef CONFIG_TCG
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
  static void rv128_base_cpu_init(Object *obj)
@@ -710,7 +710,6 @@ static void rv128_base_cpu_init(Object *obj)
      env->priv_ver = PRIV_VERSION_LATEST;
-#ifndef CONFIG_USER_ONLY
+
      set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
-#endif
  }
-#endif /* CONFIG_TCG */
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */

@@ -3257,3 +3256,3 @@ static const TypeInfo riscv_cpu_type_infos[] = {
                                                   MXL_RV64, 
rv64_xiangshan_nanhu_cpu_init),
-#ifdef CONFIG_TCG
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,   MXL_RV128, 
rv128_base_cpu_init),

---

