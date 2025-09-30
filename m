Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC33CCA470
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 09:47:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3Wwt-0000r3-Rn; Tue, 30 Sep 2025 05:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1v3Wwp-0000pi-Qa
 for qemu-riscv@nongnu.org; Tue, 30 Sep 2025 05:47:03 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1v3Wwf-0004XV-S3
 for qemu-riscv@nongnu.org; Tue, 30 Sep 2025 05:47:03 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D08E03FC44
 for <qemu-riscv@nongnu.org>; Tue, 30 Sep 2025 09:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1759225607;
 bh=uvo9NKKhIxL7ku6fF0tnNNYwziWTsfr/mzHizUMKmBQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=uaaArUGVCN6UpmU1N7yMuKbs1PVx8nhfDm1KipiUMcckgM52TNPJJf9WCU4qgSN3g
 3LCXasExwYahLyXmo/NnhQKLFsw+fEV3FczL5g92dHjF+LuZD6bs++YHiCz2gZd9Tu
 tcvt9ertfhAnuBelXuBhNS7C3rwDWcWOd9z63rzgdhyA0MpxqYdC7as8ei6b7KYPc9
 417ugWPxTDssIB8RHMVANAvT2EYedZsQTypOhgdLS6joNAavU/6a/QRD2S4jAfA7VE
 TMxoJyCUeGTJY/9Kzu1qdteVpHHTH+HFeyzNL196g5gBbPFCscNt9td6XC7+8mQxAg
 TyhVYB6Kg9Qxw==
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3f4fbdf144dso3243419f8f.2
 for <qemu-riscv@nongnu.org>; Tue, 30 Sep 2025 02:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759225607; x=1759830407;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uvo9NKKhIxL7ku6fF0tnNNYwziWTsfr/mzHizUMKmBQ=;
 b=dAtXZY70TXZBENQxleEI8n2cqxB7hQjNVQojH3dkhjIIJbsPNCiylYzCSCuGJONt9z
 eEq9EXBDiZjEM1kdZdsQ5bO7HFIlP+Wbjln1I5hY4s/5Fm4xkOVLbmz5eznoyAIxdARc
 tHdnHxYRCGZR35ibjzKpy8Ph00nbuSqbI2lihJoDJy4PktR6GZdqagO5xyMXRRkB+AxS
 BlwljNHINdWB+68Rv3IdLV1qU5dXl0CviqajXRMG39BbaFK3fZC4yoZ+TP6zAFl3OIVa
 5hprWIK3gssGsv6Jj4pVIl+TunCR+Vam6fgt3y7fbsMg75x1vLrJzAm199tbFsQj1ZTG
 nFQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaN9dFPmw8VAh6YCdskYT1qfsa97oAZc6eFgKZz14S9787Cl1tsseW3Uc7CThdjBSG4oj6vsGQgdiR@nongnu.org
X-Gm-Message-State: AOJu0Yy2tB27MCQZcO+Iegk+dH4WMZFTKVx65bVL6qiXmwoh2ynrGygR
 HH/9OgKwHMx81u0k/gLFwNUPONI3waP/hTqyzkv550YR4mbyPUGghaBe0lfC+I0cMXoMr7q+3En
 NWhbSK8bbmCrQDKO5cY9VlWQ+W9DdO5DYRrOzv8JgLftu4FZWmYwteTvU9s05nHDmNmyGdTOB
X-Gm-Gg: ASbGncvjcBzw7QRy/8MFXC1Fw5a863bw6onxSMH/gmxU40lGaHy/aKoB47bft1yxw3B
 tbqroPcestRIXJXcLQmpg1tn4h+WvCof5bZbvoTA7XTgUubwuscG2vKJU88PctAWqT188R7aDRu
 8sgwQGM8pntPdlkUq2kTI4uReLeCfKEjc9KQ00UylsuXhuXHKeroO58nDjTvCahehBxFDGWfWbj
 T14p0q7EAGgGaxI6mk1kyXkTJ3f+GJ54IeDXZTxoImdcqGY7/ghcK3v/pK827wx7xEH+zyU9TMT
 hrmMagyqmAE6kjlXAJfCPxHUMazyA+4IehUSlCVX1ZsGo4SC5smZ767RHGid6k7K7fdUmy5Wxbe
 IMrLhBxIdmnXoCNrH1LELg3/yA9+onlbX9nePmAa+8ss=
X-Received: by 2002:a05:6000:26c8:b0:3cd:edee:c7f1 with SMTP id
 ffacd0b85a97d-40e50e6223bmr18651954f8f.56.1759225607326; 
 Tue, 30 Sep 2025 02:46:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWW3ErnnMMma3/fMkNbRn8zYh0PrnPVegrfGd79swb2KiDNOr19fVF0UmgLX2zFxRAKKG+GQ==
X-Received: by 2002:a05:6000:26c8:b0:3cd:edee:c7f1 with SMTP id
 ffacd0b85a97d-40e50e6223bmr18651925f8f.56.1759225606874; 
 Tue, 30 Sep 2025 02:46:46 -0700 (PDT)
Received: from [192.168.103.116]
 (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72facf9sm22558618f8f.13.2025.09.30.02.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 02:46:46 -0700 (PDT)
Message-ID: <6ad3dee0-0fe8-4368-b43f-e7f8f30ead24@canonical.com>
Date: Tue, 30 Sep 2025 11:46:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/7] Add RISCV big endian support
To: Roan Richmond <roan.richmond@codethink.co.uk>, ben.dooks@codethink.co.uk, 
 lawrence.hunter@codethink.co.uk
Cc: felix.chong@codethink.co.uk, sagark@eecs.berkeley.edu, palmer@dabbet.com, 
 alistair.francis@wdc.com, bmeng.cn@gmail.com, qemu-riscv@nongnu.org
References: <20241220154616.283933-1-roan.richmond@codethink.co.uk>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20241220154616.283933-1-roan.richmond@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=185.125.188.122;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-0.canonical.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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

On 12/20/24 16:45, Roan Richmond wrote:
> This is part of our project to investigate big endian on RISC-V.
> The full information is documented on our gitlab[1] which includes
> source repositories, build information and project documentation.
> 
> We have a minimal buildroot, qemu and kernel working on QEMU.
> 
> As this is a work in progress any review or help is appreciated.
> 
> [1] https://gitlab.com/CodethinkLabs/riscv_bigendian
> 
> Ben Dooks (2):
>    target/riscv: Add big endian check for atomic ops
>    taregt/riscv: Add big endian checks for pagetable
> 
> Lawrence Hunter (3):
>    target/riscv: Add SSTATUS_UBE
>    target/riscv: Add sfence.vma for endian change
>    target/riscv: Add big endian CPU target

The RISC-V specification explicitly allows for bi-endian cpus. Shouldn't 
we change the existing generic RISC-V cpus to allow starting low-endian 
and switching the endianness at runtime instead of adding a new CPU?

The switch to big-endian could occur at the entry-point of OpenSBI.

Best add a cpu parameter to define a cpu as big-endian, low-endian, or 
bi-endian and default to low-endian only.

Best regards

Heinrich

> 
> Roan Richmond (2):
>    target/riscv: Add riscv MSTATUS_xBE CSR support
>    target/riscv: Add riscv big endian data flag into DisasContext
> 
>   target/riscv/cpu-qom.h                      |  1 +
>   target/riscv/cpu.c                          |  8 +++++
>   target/riscv/cpu.h                          |  2 ++
>   target/riscv/cpu_bits.h                     |  3 ++
>   target/riscv/cpu_helper.c                   | 34 ++++++++++++++++-----
>   target/riscv/csr.c                          | 19 ++++++++++--
>   target/riscv/insn_trans/trans_rva.c.inc     |  4 +++
>   target/riscv/insn_trans/trans_rvi.c.inc     |  6 ++++
>   target/riscv/insn_trans/trans_rvzacas.c.inc |  8 ++---
>   target/riscv/translate.c                    |  5 +++
>   10 files changed, 76 insertions(+), 14 deletions(-)
> 


