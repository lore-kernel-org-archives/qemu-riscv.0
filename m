Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1DEC36018
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 12:14:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sqX5q-0000IM-DJ; Tue, 17 Sep 2024 08:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sqX5i-0000Cp-Qx
 for qemu-riscv@nongnu.org; Tue, 17 Sep 2024 08:14:00 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sqX5h-0006rI-3G
 for qemu-riscv@nongnu.org; Tue, 17 Sep 2024 08:13:58 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-378f600e090so1274510f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 17 Sep 2024 05:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1726575235; x=1727180035; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MC7n5cuZfeSytA1WhfmxSyFOkG4NsKzOjqRAv+n83No=;
 b=g1wEqOq3t6L0JWoJ+rZFUl0YfxwPOjeAAm0aMn0PSDRVkFGAXuOqeSonY9lpl8GU6h
 9q45ZavtxHBxI9iUEkNZJX73T847YCTV7iK4WpxkUZBq7CJmI0XJUuqOLsDcMCBx7m3p
 1+HV+XIZxEHI/rZowubS9oMHn0bFaHM6QEf4nB57v3uSIw955ebQI+MHaAB2uL0fcpn+
 YUkOXvhp0tI/EquFatHmDhHGigtjKsEUPzA1Zrsd3IXNnfw6UbeYaVtJjn3Yc+wsEfU2
 grFyLd+V0wQmFz90NhrTr1cZC2qXsEMexfzedMB3HaMrr22FHusPewhhkrXz1d/1t+JF
 /nWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726575235; x=1727180035;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MC7n5cuZfeSytA1WhfmxSyFOkG4NsKzOjqRAv+n83No=;
 b=smP6+36CmeAaYfRtilrcA8CU1paAulFHkZTqO6phM7AOrRJANzmbPVzuNxGChp5S8f
 WTIwXjUUWRP1U9+nmPrVa4TXHdnkCWJ9VLOsZ6dQLMy/BumofQXApJSkSQcb3dJpNnMO
 8r6QHoIDQzoj7FTe65rBQSfhvLfqgx6Q0VGO+O68NcyUIqsFye1ZL35xdwUk0L7FCkas
 JrxdTf8KlM2d4g4twLETOA4xVHhsYn1yrh0hzWGI34Cx6efbf5EVwdNkEcuZg1mvbhvE
 Y2FP5H6evO8If6EXamhvCe4XEVmlLzlTW94L9rHeiBCIYPbQXobpEr8bZOTEUJbGFTNa
 usHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN7hU556Exk3388lyjwzjDdeYTOf3sT0VEkIS15zKnUYjgf1YqAkOJpwIwpDQmWbmbCC7Uqgfiq0ES@nongnu.org
X-Gm-Message-State: AOJu0Yy5TaIasBMqdxekB6ozuqoq+4f/Zu5WBJMov99/SSreiyx+PCxP
 I6rEApFrgDKRgtQAFj+huyQHtH/oF4qu6PZn1w3U382VVYYbTURxAMXm9PdCFCU=
X-Google-Smtp-Source: AGHT+IE5pOk6khKzpywNQbacL3gukULELrLhmknBhWl5mLFjzgvroDkQg/8ig4VVqGPm5QgSfLtP2Q==
X-Received: by 2002:a5d:5f52:0:b0:374:c949:836d with SMTP id
 ffacd0b85a97d-378c2d4d80fmr11539368f8f.37.1726575234136; 
 Tue, 17 Sep 2024 05:13:54 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e72e4abfsm9452724f8f.16.2024.09.17.05.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 05:13:53 -0700 (PDT)
Date: Tue, 17 Sep 2024 14:13:52 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/1] target/riscv: enable floating point unit
Message-ID: <20240917-f45624310204491aede04703@orel>
References: <20240916181633.366449-1-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916181633.366449-1-heinrich.schuchardt@canonical.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x434.google.com
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

On Mon, Sep 16, 2024 at 08:16:33PM GMT, Heinrich Schuchardt wrote:
> OpenSBI enables the floating point in mstatus. For consistency QEMU/KVM
> should do the same.
> 
> Without this patch EDK II with TLS enabled crashes when hitting the first
> floating point instruction while running QEMU with --accel kvm and runs
> fine with --accel tcg.
> 
> Additionally to this patch EDK II should be changed to make no assumptions
> about the state of the floating point unit.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  target/riscv/cpu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 4bda754b01..c32e2721d4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -923,6 +923,13 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
>      if (mcc->parent_phases.hold) {
>          mcc->parent_phases.hold(obj, type);
>      }
> +    if (riscv_has_ext(env, RVF) || riscv_has_ext(env, RVD)) {
> +        env->mstatus = set_field(env->mstatus, MSTATUS_FS, env->misa_mxl);
> +        for (int regnr = 0; regnr < 32; ++regnr) {
> +            env->fpr[regnr] = 0;
> +        }
> +        riscv_csrrw(env, CSR_FCSR, NULL, 0, -1);
> +    }

If this is only fixing KVM, then I think it belongs in
kvm_riscv_reset_vcpu(). But, I feel like we're working around an issue
with KVM synchronization with this, as well as with the "clear CSR values"
part of commit 8633951530cc ("target/riscv: Clear CSR values at reset and
sync MPSTATE with host"). KVM knows how to reset VCPUs. It does so on
VCPU creation and for any secondaries started with SBI HSM start. KVM's
reset would set sstatus.FS to 1 ("Initial") and zero out all the fp
registers and fcsr. So it seems like we're either synchronizing prior to
KVM resetting the boot VCPU, not synchronizing at all, or KVM isn't doing
the reset of the boot VCPU.

Thanks,
drew

