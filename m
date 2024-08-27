Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65450C5473F
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 23:07:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sj5Gd-0005XC-EP; Tue, 27 Aug 2024 19:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sj5Gb-0005TD-UU
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2024 19:06:25 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sj5Ga-00080W-Bd
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2024 19:06:25 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-71423704ef3so4892500b3a.3
 for <qemu-riscv@nongnu.org>; Tue, 27 Aug 2024 16:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724799981; x=1725404781;
 darn=nongnu.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KNvkt4n/+2yRALA7QxJ9ImAlFQ5JbuehZ8EoLiYSyLQ=;
 b=l+9zYAIQm1lo4/2zWIeHdT5B0eHoYPFV+A5AR64yLym5i47hhhoVTMlpnQ4bH6AzdN
 ZN27aHNTqhk45wzdmpYZO2g5L/O3UrcXrPt0T/8mg3vsB7uWiek7m/By8AVUwwKbJM/c
 AyRz+vwjM8KvxRLyzN+1KA6XK1mP+VxsR56APDa1Y5VTimgdMhYelhrlT4lMiO/EkIlL
 RvQ6mPDLiYT9CGgXOuYguUpKhhn26YEvUaipt75Xz/JzqZpCSEJsR6AvVgqROL7UeyKV
 RxpY5t04wMJh1CZo0nKc3cb3ETnL2U6lEEiQdujsshZ+HOS55zKFq8VjqGU0MfU9v6X4
 bLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724799981; x=1725404781;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KNvkt4n/+2yRALA7QxJ9ImAlFQ5JbuehZ8EoLiYSyLQ=;
 b=vPnKDJ4tmoD/JU5hvQ70Gyf+8kuHGk/FN5SrDMOA9rVw+bpSxkJhooN1+lk2r3uDAK
 PgZ01rKV5ZgD2q+Vo8GfFXeBRNHSZgJFSPBPn5IDFko0GtkNPxaRAK1gZdwUeMwfgrk1
 ckdtmEOTvpRZj5lkILCPglxoOl6guV+X2qiQb8pXKXUkKc7+rWkThY72bPvwznsfq6Yq
 IQ2UIPFIPncUl2bcnvTtJqJrvp31xE7KCfwaTmzsPEAZ7zA84kCAMFvMKrBj18klvPHe
 s1z+2gnfosbbWfK8Tp7vt5dpmmvlw1izSMclS2PnbYU0cJXfry1nb8QSyEI5VTVhqeB6
 zHLQ==
X-Gm-Message-State: AOJu0YwqJsMVUiQXyzwL6LiI5L1NXMbED0OHaR9Bx/pGAC0uXldYGfRn
 XNIGTxJQt/PI0bzTRMK8Vcfg0jgYmyKe+kQHSUoKnOnIBbim8KAGpDORfZ1RdPE=
X-Google-Smtp-Source: AGHT+IHwdnJKpPt8O1usG25Lg/pEcjqPSMTrzrZ9MIpIsrAdksIyC8Q1kd+vqN+2r5ZpVpuK65fhsQ==
X-Received: by 2002:a05:6a00:1953:b0:705:951e:ed84 with SMTP id
 d2e1a72fcca58-71445d4d2e8mr17435241b3a.15.1724799981130; 
 Tue, 27 Aug 2024 16:06:21 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7143422ec2esm9051766b3a.27.2024.08.27.16.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 16:06:20 -0700 (PDT)
Date: Tue, 27 Aug 2024 16:06:18 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jim.shu@sifive.com, andy.chiu@sifive.com,
 richard.henderson@linaro.org, kito.cheng@sifive.com
Subject: Re: [PATCH v9 11/17] target/riscv: mmu changes for zicfiss shadow
 stack protection
Message-ID: <Zs5b6mXdYLMzoW0f@debug.ba.rivosinc.com>
References: <20240826152949.294506-1-debug@rivosinc.com>
 <20240826152949.294506-12-debug@rivosinc.com>
 <CAKmqyKOQcUBjz0PsaYFWnir=FCNA_+7CkrN=5PLH+ayxU+zLkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKOQcUBjz0PsaYFWnir=FCNA_+7CkrN=5PLH+ayxU+zLkg@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=debug@rivosinc.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

On Tue, Aug 27, 2024 at 03:59:08PM +1000, Alistair Francis wrote:
>On Tue, Aug 27, 2024 at 1:31 AM Deepak Gupta <debug@rivosinc.com> wrote:
>>
>> zicfiss protects shadow stack using new page table encodings PTE.W=0,
>> PTE.R=0 and PTE.X=0. This encoding is reserved if zicfiss is not
>
>Shouldn't this be R=0, W=1, and X=0 ?

Yes. A typo. Will fix.

>
>Alistair
>
>> implemented or if shadow stack are not enabled.
>> Loads on shadow stack memory are allowed while stores to shadow stack

