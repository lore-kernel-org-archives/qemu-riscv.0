Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED6EC369C2
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 16:43:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8M93-00021k-Io; Fri, 25 Apr 2025 12:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u8M8y-0001vD-Rd
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 12:43:16 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u8M8w-0005wK-Jk
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 12:43:16 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39ee651e419so1440281f8f.3
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 09:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745599393; x=1746204193; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MJojtPWYq6owKnYgBwlGB6E/22rq46E+3UWcvTNHAqY=;
 b=J3DsTcNbzbMpflyVyQDmqk2npUd5A9PqoIAXeoSC5XmtxKAHk3c9Xdvy4lH1QcHUZL
 JF1Of2Tune76WvjGCbxmP9uEQ0Rxe3t+molH7dhJyURf1iZGjWyh8jfYFSCd3/HO0zUZ
 NZJO5ROqhwOkqGvTDwqIZ11ZhMUPls2baIH35h0pO2b31S0ba/kMH2vvVjRdqkYKzfIN
 i7QX5I3ztlUs1EaWJhz2yaq4ktWRNTdFP3xTv6xybeLziX6GY/67IGhWtSwVgcUn35WB
 qvBCpObjqNo8ZJe+usceiComun32Hvowjl3TJ6ihbpmCHvT3ozbxsziKF0kHv9bgpbtI
 2Hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745599393; x=1746204193;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MJojtPWYq6owKnYgBwlGB6E/22rq46E+3UWcvTNHAqY=;
 b=qAPTTHJum2jP1Z8gFws5E3U5QRthvr8dkYr8uM57g33Lvkz4DRJhpW+TOCOKVnwe+p
 IeEF7oPHbxT6rKqpvE6HOdBpNwAy4Zs1ulZMYgoJsBFdjxKsSwLp9VupxeDqN5xFXYs2
 cYv9b44uIoMnOTuYKHBsB1XlB0cS8BYGU7TIbkgEUMFxWCSz0GTBeTuMW1kcv6UN0nzx
 pxelydZyT8QYfad0HIC2inxjyjsQc83u4Ymi32RHShoDqM1gJSeKERR3qm1m6IMlKeYy
 DE4BDT4h4REoUHFYiPCYxKnh/k2Hdi6a9ocQIFNegTjcPQg/moa2p9EjImTh2eoNXUcA
 ziYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8cFJdTvSrtmPxPVN+KUKgYBBKuSFuuN1TufSMygAAiZZCfQ7o74i40263Me7UGmFBsbnfopmlyqvd@nongnu.org
X-Gm-Message-State: AOJu0YwvPOJKZ5zZS5VP36vHR/gK2dTc6BP2DOzkn4J0oXK/Cj6QqsTm
 4m0LgPjAOYQaea3ZrzZXBMsevR5aq82pl6Tr+YXj4sIVRjk/sHmFGjSIlzJc31c=
X-Gm-Gg: ASbGncudyfvwCz1xVsFzJQlMpfAxIBwK8HFJgyXewaxuNBEjzuRkeFq+ioUFf3StYlv
 KaWmZa2Q79flDcN4evw1esnZsZn+zve+2wzYjX0rQ9N1vJKPsdX1E6nsO+3BFcdSjV5YQmtgSXa
 3rTvbGya7Wj0a9Qjwm6I04hOLmaRX1hnY50qrQqMs2zh+ZWId1rvlUdKMmgW4jlqcTCiGVR5U+7
 G88ioso9ec7amXlcRsVyYRoSDkk+jbCLWLiPbb+Q0hhQFaykxHJVM+9POM2rGAOIidRzoK8E7Rq
 +yB4GPPuACj7hEypFL4wCFWT6i2d
X-Google-Smtp-Source: AGHT+IH8w5UF3AsN5V9fOr4Ni19fKuRf/qdHeSDWqGt7q9tz8CO7tqpbABG+UhyZBlcQeF3v8OT2lg==
X-Received: by 2002:a5d:64a6:0:b0:38d:cf33:31d6 with SMTP id
 ffacd0b85a97d-3a074e10426mr2498722f8f.3.1745599392792; 
 Fri, 25 Apr 2025 09:43:12 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e5d264sm2871271f8f.95.2025.04.25.09.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 09:43:12 -0700 (PDT)
Date: Fri, 25 Apr 2025 18:43:11 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH v3 8/9] target/riscv: widen scounteren to target_ulong
Message-ID: <20250425-14cba750e7a8932b576b69d9@orel>
References: <20250425160203.2774835-1-dbarboza@ventanamicro.com>
 <20250425160203.2774835-9-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425160203.2774835-9-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42c.google.com
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

On Fri, Apr 25, 2025 at 01:02:02PM -0300, Daniel Henrique Barboza wrote:
> We want to support scounteren as a KVM CSR. The KVM UAPI defines every
> CSR size as target_ulong, and our env->scounteren is fixed at 32 bits.
> 
> The other existing cases where the property size does not match the KVM
> reg size happens with uint64_t properties, like 'mstatus'. When running
> a 32 bit CPU we'll write a 32 bit 'sstatus' KVM reg into the 64 bit
> 'mstatus' field. As long as we're consistent, i.e. we're always
> reading/writing the same words, this is ok.
> 
> For scounteren, a KVM guest running in a 64 bit CPU will end up writing
> a 64 bit reg in a 32 bit field. This will have all sort of funny side
> effects in the KVM guest that we would rather avoid.
> 
> Increase scounteren to target_ulong to allow KVM to read/write the
> scounteren CSR without any surprises.
> 
> Aside from bumping the version of the RISCVCPU vmstate no other
> behavioral changes are expected.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.h     | 9 ++++++++-
>  target/riscv/machine.c | 6 +++---
>  2 files changed, 11 insertions(+), 4 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

