Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56ADD735EE
	for <qemu-riscv@archiver.kernel.org>; Sat, 30 Nov 2024 06:14:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tHGjR-0003Ff-KX; Sat, 30 Nov 2024 01:13:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGjP-0003F9-Q4
 for qemu-riscv@nongnu.org; Sat, 30 Nov 2024 01:13:27 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGjO-0001y5-6a
 for qemu-riscv@nongnu.org; Sat, 30 Nov 2024 01:13:27 -0500
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-7fc41dab8e3so1672064a12.3
 for <qemu-riscv@nongnu.org>; Fri, 29 Nov 2024 22:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732947205; x=1733552005;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xStmvMus9MgEzCXx/nEWzr58YQNuNR1BqlwJ+N/QWGA=;
 b=cqKWrzlAgpV6EJStXsW61pKod+mcG+rXeYWcmvox0vk949FqKvqOv4wvTKKz8ZoAfX
 FgUW8HNMXB6FoHanhDVpbcv1jJdU5uydJgf2NS0GqxhbiZLmXfbG25hNUwrd0og8WYAs
 N6haPgYgrCeAtxSQ0wMCUsJgxH6Qp+ztZ+wrlmkDWjPXA3W0I6XbmZnAYQq6AEMSyAaP
 oWPC6J0qqDQri6//0Egv6jswEXD2LXxlvQQ0xdUg1c/nrgJZQAtQNPpSkeZaHJmil69P
 ElZXr17qFXKk7mN+LiROESs6WYsqMRKNxLxQx27by/CjSteJCnTxzsSuHh2kf0QgxS98
 3TSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732947205; x=1733552005;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xStmvMus9MgEzCXx/nEWzr58YQNuNR1BqlwJ+N/QWGA=;
 b=nmP9sEVngez3ET3r7x28e3hrjiV9gYUOeI0XDmJsYqUb3ZFuiN/KwEEdxwvSwp/o8q
 zPi2ymlAjAbv9avxlBMAT70p0xqoP7OQ+pFA3n2XVek1Y6wg4ETfueaMtZ1wJfgghdim
 +SFjLbU8VDn5mmkDLBZsiOTUpGEl+oA25lzXvKMXgjXmibnGYJ28tZVk5g/MYMOhS6/V
 /nFrvVsrAleviBXFhqV7kWXNEqBdaPdBIuart/SnpE1DhLch/E++rTsvPJKDZQy6CCKw
 9Arlwwpbk4Co1XfE5OWTvIpK81seVH92kRqQb9mq+7ksQfIf/fEk2q8NYsonOjTQ4Lk2
 hG7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgIYDONSr3oXlW9z1ZdAJZJylS+EGctSUIi0egQOQaTRPyZuUGulw0/jNZH0dEtjcDQ5wCUPeFyja5@nongnu.org
X-Gm-Message-State: AOJu0Yy4BuHa5V3LbSi7PWQfTMvon0CHWKgn38p0fqW6sFtP5kklTRU8
 dgm40yo8G7a6/ymxfFH/VxW2HLyt8gDX+NuYCYJUk0M2MURXCITcnoFllBkK0e8=
X-Gm-Gg: ASbGncttpPWEhAGeOCWz7E7pfoExVcHp4kciLDBTHiWujPSMuJam30mrHlWdnOovTWN
 0490dVU2BEtaPyDTfvkcLoLA0EBRkIxir0lAAcKNNRGvT7JqpAOcVZwl1VbfjzcfecYLJnYtWmp
 q4Vmpw6K7HxSYso8cTY+K9X/6nFisvTNN3YdDHASmOYTEbYgmf+LXbzgRz48XXq8NgmULr9Ef+4
 xsTI4wObndAL0Ly7kq1aWhAqP8PURsLxYQ83l72JlrInUizyozg5pusKUvLxnE=
X-Google-Smtp-Source: AGHT+IFpf59s0NU8wlUNNR9e+oBxL0iyxDRPGCW/zwdhJpZ/1qFUVg5a8z0YHBA+/uCkM0ZZCKsNeg==
X-Received: by 2002:a05:6a21:789b:b0:1db:f68a:d943 with SMTP id
 adf61e73a8af0-1e0e0ac3600mr19037693637.17.1732947204635; 
 Fri, 29 Nov 2024 22:13:24 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7254176f4c4sm4620630b3a.60.2024.11.29.22.13.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 22:13:24 -0800 (PST)
Message-ID: <8b8907e8-cc08-4dd5-991c-496637d39b61@daynix.com>
Date: Sat, 30 Nov 2024 15:13:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 02/15] hw/display/apple-gfx: Introduce
 ParavirtualizedGraphics.Framework support
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, stefanha@redhat.com,
 mst@redhat.com, slp@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, gaosong@loongson.cn,
 jiaxun.yang@flygoat.com, chenhuacai@kernel.org, kwolf@redhat.com,
 hreitz@redhat.com, philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu,
 Alexander Graf <graf@amazon.com>
References: <20241129152506.59390-1-phil@philjordan.eu>
 <20241129152506.59390-3-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241129152506.59390-3-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 2024/11/30 0:24, Phil Dennis-Jordan wrote:
> MacOS provides a framework (library) that allows any vmm to implement a
> paravirtualized 3d graphics passthrough to the host metal stack called
> ParavirtualizedGraphics.Framework (PVG). The library abstracts away
> almost every aspect of the paravirtualized device model and only provides
> and receives callbacks on MMIO access as well as to share memory address
> space between the VM and PVG.
> 
> This patch implements a QEMU device that drives PVG for the VMApple
> variant of it.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Co-authored-by: Alexander Graf <graf@amazon.com>
> 
> Subsequent changes:
> 
>   * Cherry-pick/rebase conflict fixes, API use updates.
>   * Moved from hw/vmapple/ (useful outside that machine type)
>   * Overhaul of threading model, many thread safety improvements.
>   * Asynchronous rendering.
>   * Memory and object lifetime fixes.
>   * Refactoring to split generic and (vmapple) MMIO variant specific
>     code.
> 
> Implementation wise, most of the complexity lies in the differing threading
> models of ParavirtualizedGraphics.framework, which uses libdispatch and
> internal locks, versus QEMU, which heavily uses the BQL, especially during
> memory-mapped device I/O. Great care has therefore been taken to prevent
> deadlocks by never calling into PVG methods while holding the BQL, and
> similarly never acquiring the BQL in a callback from PVG. Different strategies
> have been used (libdispatch, blocking and non-blocking BHs, RCU, etc.)
> depending on the specific requirements at each framework entry and exit point.
> 
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>

