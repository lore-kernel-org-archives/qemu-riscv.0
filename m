Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA90C5AC80
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 11:54:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wsJ8V-0003c7-MW; Fri, 07 Aug 2026 07:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1wsJ8U-0003b1-Eb
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 07:53:14 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1wsJ8S-0005zU-VO
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 07:53:14 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2cedda2ce6fso28537655ad.1
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 04:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786103591; x=1786708391; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=thkczxHTxiM1oI5KDbxA3/xmXENBCgHW8XGI2G/Cct0=;
 b=To4j3Z6YK6B8LWmI5BksI3IUtGa9KALjoNpjuFEqw9m6KikdKRynWutrfxP2a8LWmQ
 bkfrAK02VEJgAy6s0Zcc+ztCHvHDGCay2vC+/f0upL3BtKywVWm8tWeV5RCbhDUL4+LQ
 Y5EYG2SwGyJlwovuuyE/5CP5AZIbWKv3NWhHy9/kr8fCF3yRa5yDJT6V2Lndt/+rgcdx
 IoEczn5KtS0qPksIl67c3NubJGtGPtXbr2NH4h7UQsBwV+zlbajfjxKg9jA2KqI19+hQ
 89wfDTERh/PgneD2kP7ZeKHf1kcYCpc527Jy7DZK6fGbWqIgnvJrYGSlN/XrvAspO3Zy
 Csow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786103591; x=1786708391;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=thkczxHTxiM1oI5KDbxA3/xmXENBCgHW8XGI2G/Cct0=;
 b=TzpgPx3nQ890y1ClJnMoVsMZ5yoZfnjfzZMkimRptUl5xTg2ojCoW/I6lBEw4398JM
 Z0EMr+epXwlGFoSHlRto1ERYcZWsmFSwrRK6BFwoEZi42ASAmg6f8h5LLNodG0+aL9aR
 /DRgqvxBMH10q1+RoCU8bivQGCl7GLL0fq5KOQRS4jUVuSL2n/ZS4+4VCVQBTEj+39P8
 lsms185j3vYLE0JXLVSIRKIF2KNwt7w5aaKxQtkCyvyTqvIv/ILilietSnMmNnSYBBwY
 M91Vajjj3ciYCuyiYaLiHnrKqBTIayrP0Ogwl1PCbhmAYX9Fx6tWgKDxkMzoJ7Skj8SL
 3UVQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp32pDnKt+IoZlI5ZvcT2Bl14UOmNOw8Kgbs6ih+pMku5eSNPYp6LgVr1C7xSSY4RVO8JF1HR1VZZaF@nongnu.org
X-Gm-Message-State: AOJu0Yz/CcanOnMTkoW9Bjl6qBs3kkOKqVxFJzTLZc6+qXm3gpC584a5
 evvmm1iEag+xqunTQn06EqXbxBd5/0O1PfBQc6L2XywW4uY8dyzdPuky
X-Gm-Gg: AR+sD13xDkjJwi1aLMPluYYXJH7aROY0ohtKc/km+iiq/wrj9RrVc5QYeP2QpHjY2Hd
 ECtoCcKPBjS6snIPB13wCwD599D4QWZIqe0ziCovtq0JgSr9OMP3XZ9gn9+51Cqi0Zs44A+Vz5j
 gklRdCzXVow3qK7PtExJg9g1sGPPD9AYeXVnj4tf4RMzDzPAyBbedKBMD06QXVnXM0ip+2qugXa
 Ar+R/GCsa+WeEHCpWDUOVkcfQOHofIX+13dXGCzLuVlaiNlNe3QUenwfPbsUjUTMZsPHCJFvOiE
 0+CwZPnqwN/FJzN0aZdW0NeIrvXJHAMKvEMqrAq7TDCQ5B24TOuAO0UZkH2vYvYTpd3suPE5UJR
 ZEd1xG1BLGSsexGSpv4c2zVu0AVGqhKlcgC+4GrAG78t5jOGb/DKpywOIOWnB3GtvH7uLi0puaT
 VbYw25/4OiNskC8HrDF85xzGaczBCbM48kIMtlU1CtC40ZiWRAdzSmVEMC5YNIaw==
X-Received: by 2002:a17:902:e945:b0:2ca:d151:383a with SMTP id
 d9443c01a7336-2d0ca98f97dmr263985155ad.20.1786103591196; 
 Fri, 07 Aug 2026 04:53:11 -0700 (PDT)
Received: from [192.168.0.111] ([14.19.22.86])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d15ecf309asm7903115ad.60.2026.08.07.04.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:53:10 -0700 (PDT)
Message-ID: <c201c673-eee6-474b-ace2-03f36d004858@gmail.com>
Date: Fri, 7 Aug 2026 19:53:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 3/3] tests/qtest: add K230 UART test
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>
References: <20260725-feat-k230-uart-v2-v2-0-d5fe82c47c28@gmail.com>
 <20260725-feat-k230-uart-v2-v2-3-d5fe82c47c28@gmail.com>
 <af3d837c-e7f2-48ce-9b9c-c2ea9e4d8fb8@oss.qualcomm.com>
Content-Language: en-US
From: WX Chen <wxchen0913@gmail.com>
In-Reply-To: <af3d837c-e7f2-48ce-9b9c-c2ea9e4d8fb8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=wxchen0913@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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


Hi Daniel,

Thanks for the review!


On 8/6/26 04:10, Daniel Henrique Barboza wrote:
>
> Any reason to use g_usleep() instead of qtest_clock_step()?  There are 
> a couple
> of g_usleep() uses in the code but you used lots of qtest_clock_step() 
> too.
>
> AFAIK g_usleep() is wall time and qtest_clock_step() is simulated 
> time, and
> I guess you should be using qtest_clock_step() for all the pollings 
> you're
> doing in this file.
>

You're right, there's no reason to mix them here. I'll fix this in v3.


Regards,

WX Chen



