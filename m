Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979C5CAC597
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 15:32:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uyBBJ-0003jA-Jh; Mon, 15 Sep 2025 11:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1uyBBF-0003iA-I4
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 11:31:50 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1uyBB6-0003sB-UD
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 11:31:47 -0400
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-4240111d446so17205045ab.3
 for <qemu-riscv@nongnu.org>; Mon, 15 Sep 2025 08:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1757950293; x=1758555093; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aq6RCJ0wdukZ1Q4R5ZbXYvLxhYL8PqHTPfLVyEwUqrQ=;
 b=SdP2tajq7gKsJsAOd0qBhd/8ay97oCESy21FmqGMldtYYcgricycUljm9WGxzv26vI
 j0aw0NAtsJvXPrnZhKO11JzBYwi8uHD/5K5jejSJpA5r1SXOfF4d1Bh3AIP1CAc7HhlE
 UX3Q2smhLSGmsDbsb0qngOD+YP4RJ1BplqtFhANr5eqNTqd532V3LoivdDheDtbD87Y/
 fAhenMS5fQKdzEquhJpZSpEuzh2dTTcA4NvyLHygkt1MVIWdXBXd2DIrYVJ33jNkhxJ7
 vkk5ON94y/aYZJfrYehL/cUc/oXtqubPJHFXAFxzR9cv16OAh6t1yLojPByrP3z0R1U8
 3MNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757950293; x=1758555093;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aq6RCJ0wdukZ1Q4R5ZbXYvLxhYL8PqHTPfLVyEwUqrQ=;
 b=f/et5AAFi0IrRB5D887nnwCA0FN/ePvux1TR54s26AhBjVu40aeQbbXkeTEk7PNVmc
 mF3fCVC/c5OsSmZTvinfLISWps6dnyQOH/COU3kXcRpRdkTtHZS0qjDIYoeGSciVaaHu
 DKLeZS7mul6bQg9SkAV1jya3iUvzA0ShJJegB7x+qmbTY3gGmgBjgr5bhDSAMRHJNLpj
 jFyWJWNz8zkwibkgz+AHjx7OPdUpY7A6HIzZ409wpJB01UqtQyk3dtXZhfbazj7ewSNS
 eFhZLucPDp83O14y7msL2zvAzjEHLTqlYKvTgepuBaYptcYt8E3o4IYYh6beXkRInlIr
 ZHNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzIdW1MZWGWvpwRM9FdF3OEO/fCC+1r4ved5ISsCxXm69zg+iaz8ZRy83eyco7ZlufvIj9a9WOn3pX@nongnu.org
X-Gm-Message-State: AOJu0YxmirfbHVphNxoXGgTHMlLrw29OIIL3oZ06sJXcfxJzU4lu2XeA
 lQSf1q1zKuKjQCG7nJH4mwwQdJSV7C2VI82ZQ5Wbs7Om9LBmwVwR/O9wMSYFql1uftY=
X-Gm-Gg: ASbGnctMa+q9nW1b7MUiRtZFxt+FcgZyuC/nIpaoZvFpRmgZIHnKRjPENs3Q892OOeS
 bVtHeZm9DQaGqdAuD7eQehK+oEm/JVw1KrRyJBGuFM1u9ibdR2mCLc1Lj/H/4mePXwWIYVIjoD7
 NZnNiACbmgJZvGeO7BY+C0q6EPKq3Kmrni9PcjUyjcEYgSGpJet+UODWOUzaBMnEpohgh2N0xEl
 w/UXYYn55uc8lJSTIoJcaqn/05tYxlqv3MAB/knWlW/PPvRGyFkFupjTmMAAztuX7clJG7O81tz
 STVlj9QFXiZ2QICwmbYjppF3qa3A+O2KWC3GwrTA1t5YACmFivcRSuexcG5lsuN3Or40H4z2nkO
 lIlj5HbOJR/WA3aGlYvz/HWI5TBE2WZpaVK8=
X-Google-Smtp-Source: AGHT+IF+RoXGyypxsQmN5LU58CWXW+LffefM+VQMEp0Wt0n4UMehnF3ta5VR4L9fSYiwM9x6UIJ9hQ==
X-Received: by 2002:a92:ca0f:0:b0:424:7bb:775c with SMTP id
 e9e14a558f8ab-42407bb7949mr28284665ab.31.1757950293164; 
 Mon, 15 Sep 2025 08:31:33 -0700 (PDT)
Received: from localhost ([140.82.166.162]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-4240a4cc099sm6178925ab.29.2025.09.15.08.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 08:31:32 -0700 (PDT)
Date: Mon, 15 Sep 2025 10:31:31 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Xie Bo <xb@ultrarisc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair23@gmail.com, 
 pbonzini@redhat.com, anup@brainfault.org, alistair.francis@wdc.com, 
 rkrcmar@ventanamicro.com, palmer@dabbelt.com, xiamy@ultrarisc.com
Subject: Re: [PATCH v9 0/2] =?utf-8?B?dGFyZ2V0L3Jpc2N277yaRmk=?=
 =?utf-8?Q?x?= riscv64 kvm migration
Message-ID: <20250915-da26ba5c012a2d49fb07f4fa@orel>
References: <20250915070811.3422578-1-xb@ultrarisc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915070811.3422578-1-xb@ultrarisc.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=ajones@ventanamicro.com; helo=mail-il1-x131.google.com
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

On Mon, Sep 15, 2025 at 03:08:06PM +0800, Xie Bo wrote:
> This is v9 of the series. Compared to v8, the patches are now based on
> the 'riscv-to-apply.next' branch from Alistair's repository:
> 
> https://github.com/alistair23/qemu/tree/riscv-to-apply.next
> 
> Changes since v8:
> - Rebased the series onto [alistair/riscv-to-apply.next]
> - Removed the previous 'Reviewed-by' tags due to the rebase

Please don't do that. If the rebase doesn't require a rework of the logic,
then the patches don't change in any significant way, so reviewers
shouldn't need to look at them again.

Anyway, for the series (since I can't see any difference from before)

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

>   * The changes are purely mechanical; no code logic was altered *
> - Added 'Cc: qemu-stable@nongnu.org'
> 
> Xie Bo (2):
>   Set KVM initial privilege mode and mp_state
>   Fix VM resume after QEMU+KVM migration
> 
>  target/riscv/cpu.c           | 17 +++++++++-
>  target/riscv/cpu.h           |  2 ++
>  target/riscv/kvm/kvm-cpu.c   | 60 ++++++++++++++++++++++++++++--------
>  target/riscv/kvm/kvm_riscv.h |  3 +-
>  target/riscv/machine.c       |  5 +--
>  5 files changed, 70 insertions(+), 17 deletions(-)
> 
> -- 
> 2.43.0
> 

