Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A17C2D0CD
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 May 2025 16:36:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uH3T5-0001RZ-8I; Mon, 19 May 2025 12:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1uH3Sz-0001OG-6b
 for qemu-riscv@nongnu.org; Mon, 19 May 2025 12:35:53 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1uH3Sw-0005bC-Nw
 for qemu-riscv@nongnu.org; Mon, 19 May 2025 12:35:52 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a367ec7840so1444877f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 19 May 2025 09:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1747672548; x=1748277348; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=j/8OU9GwBScM7IdCPEI5Z6hfoyVtLf9FiHGqtQG5zUY=;
 b=mupJ1Ein4iaqiKDJjaaIpq0RSMxKBFBu7gyJ05Xm/aDsM2qS3I1b9OxbXIUpJB2Yhz
 KTkF9ZFVfb+eUdjAxW3BGUcyqEvBHKttG0cAtXpsVSqL/chHW41WfTd3Wy86pPbMD7QH
 yHyjfoQ0+Vc2FCGZ+lI6u1Vzv1JVNchxPwe3mqi2A7bVcpQVYfTkY2YfsNARNMiBtUBE
 FwA/sWVMuIS+i9mYPK1JxavS5HHK6f0wHQB/xjDePYL/tumfAvrHV3Fspn8GVyHaDpxO
 L6iH/LSU2Rp65/Vwuk1W1SM85YwfgVZYllPu5oNiGRw5OYZh4XOXwhG1EB750GqHdWSZ
 MLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747672548; x=1748277348;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j/8OU9GwBScM7IdCPEI5Z6hfoyVtLf9FiHGqtQG5zUY=;
 b=sdxUGRAmq8gkmfHZ9a8dzw3ght8WLiaioF7C5hxhxKQK8If+FcnGIeaHGPeRHxSB0N
 xKHxTDZWxSMNxItXaKgfy6QSqiP3LtlxqUvVHfYgVRvfz5Yk1+swp4W24Y9DXDQRDd+F
 7MsDRMdk2JBQoQ4n4zaZSGdXVl0SXUXzId4n1jSlvMV5GLRueACb8AfNK4ZH04abLoj+
 T7imcRXTqN1EQbHew8K8dcFeUa0hCwMAjH6sSHkYxfMPX1VGDQjfED7x6ON8niu7wUxx
 p1006TRlShn9a9lZqG28d/u/vdcJg/EcGQ/pCXcvUGFEArA+SAPjAqC7F7I7oCUoOM8H
 cekQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2GUgb/l6iXi+0ZQfKR6hA6LMMr24ngPl9tWZl/K7m+AQoLxj2p0+KzIMfi2DC13Uy85hvDJH+hSAx@nongnu.org
X-Gm-Message-State: AOJu0YzJYjW3IAc2UB/h526S8PCSRG9N0NJhk8C5I7ZZNLbuMwq1w9Bw
 DixF+hruhBMiYzC1wM3SYZstdY3QlM+qjwRGnDEKiP8PXSVcf/1t+KAulrWM+iBniMs=
X-Gm-Gg: ASbGncs4xovYfyZvWVIQpU8iviNkRmUb9jtrHrmhz4mL+AejXu3oYdyWviQ6Qh96fkp
 9yZ94scUMWRTNeh93j/SQAs3+KAQVMNjb9cTgfNNWVgLpQMm1Dm45a2HtUAkq6ph6LbEQPFyQNu
 rtN/fVlV3uMwHtIBa6MNFGNJhJ2fjh4T/mVFzdg8W21Dh6g67icKNCOGhuVRHN/icHnJsrIQnY6
 30l24ILXt6EvG/SHAbGqjU9VfbQZiAseVOgmesZR9ty6+whfC67FAiby5DQvd+6U3Xpi2MpTniE
 x8PHnEw0wga5Mf3WCbgLpoeDJFX5n7F+jcfAIZw=
X-Google-Smtp-Source: AGHT+IE6fGD+nqfy+GVrxhTagsRGuY2GsEZ5h18vCzrSlogS0QztjKJxMs/DWLPnRghgEcmYR2wo9Q==
X-Received: by 2002:a05:6000:2384:b0:3a1:f684:39a7 with SMTP id
 ffacd0b85a97d-3a35fde361amr10219404f8f.0.1747672547945; 
 Mon, 19 May 2025 09:35:47 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::ce80])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca8d258sm13298494f8f.100.2025.05.19.09.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:35:47 -0700 (PDT)
Date: Mon, 19 May 2025 18:35:46 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH RFC] target: riscv: Fix satp mode initialization based on
 profile
Message-ID: <20250519-a153c03e434d1bf31498eb01@orel>
References: <20250516122319.4100121-1-alexghiti@rivosinc.com>
 <e86af5b2-7d8a-4503-8a5c-5ee2147aa850@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e86af5b2-7d8a-4503-8a5c-5ee2147aa850@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42c.google.com
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

On Mon, May 19, 2025 at 09:48:14AM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 5/16/25 9:23 AM, Alexandre Ghiti wrote:
> > The satp mode is set using the svXX properties, but that actually
> > restricts the satp mode to the minimum required by the profile and
> > prevents the use of higher satp modes.
> 
> For rva23s64, in "Optional Extensions" we'll find:

The keyword is "Optional". The profile should only set sv39 since that's
what rva23 (and rv22) have for the mandatory support. sv48 and sv57 are
both optional so, while the user should be allowed to turn them on, just
like other optional extensions, they shouldn't be on by default since we
don't set any optional extensions on by default.

So we don't want this change, but fixing any bugs with the first hart vs.
the other harts is of course necessary.

Thanks,
drew

> 
> https://github.com/riscv/riscv-profiles/blob/main/src/rva23-profile.adoc
> 
> - Sv48 Page-based 48-bit virtual-memory system.
> - Sv57 Page-based 57-bit virtual-memory system.
> 
> So in theory we could go up to sv57 for rva23s64 (and rva22s64, just checked).
> Changing satp_mode to the maximum allowed seems sensible.
> 
> But allowing all satp modes to go in a profile defeats the purpose, doesn't it?
> None of the existing profiles in QEMU claims supports sv64. Granted, I'm not a
> satp expert, but removing the satp restriction in profiles doesn't seem right.
> 
> 
> Thanks,
> 
> Daniel
> 
> 
> > 
> > Fix this by not setting any svXX property and allow all satp mode to be
> > supported.
> > 
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >   target/riscv/tcg/tcg-cpu.c | 3 ---
> >   1 file changed, 3 deletions(-)
> > 
> > diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> > index 5aef9eef36..ca2d2950eb 100644
> > --- a/target/riscv/tcg/tcg-cpu.c
> > +++ b/target/riscv/tcg/tcg-cpu.c
> > @@ -1232,9 +1232,6 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
> >   #ifndef CONFIG_USER_ONLY
> >       if (profile->satp_mode != RISCV_PROFILE_ATTR_UNUSED) {
> >           object_property_set_bool(obj, "mmu", true, NULL);
> > -        const char *satp_prop = satp_mode_str(profile->satp_mode,
> > -                                              riscv_cpu_is_32bit(cpu));
> > -        object_property_set_bool(obj, satp_prop, profile->enabled, NULL);
> >       }
> >   #endif
> 
> 

