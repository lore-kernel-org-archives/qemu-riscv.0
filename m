Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E413AC021A7
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:11:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sqXyY-0004jc-Cd; Tue, 17 Sep 2024 09:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sqXyX-0004ic-18
 for qemu-riscv@nongnu.org; Tue, 17 Sep 2024 09:10:37 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sqXyV-0006Ke-Ct
 for qemu-riscv@nongnu.org; Tue, 17 Sep 2024 09:10:36 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d43657255so642859066b.0
 for <qemu-riscv@nongnu.org>; Tue, 17 Sep 2024 06:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1726578633; x=1727183433; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wDPxkanvhTO8S8DQTo+wYn18S9VjZBi4MmAakGQKvqk=;
 b=nIylzdTWEvkvE2VJshmKdhAUSHmBUPHwXPEZWUIjB0/EPkayVFSWepCUZireLC+r0t
 68Dwdo89olX//Hggg+4gMeeMA1I7XRH9x1Af8miNDG/JjZSxGcon9RgDlyxtopnFWJqd
 Y4bt8UTHcuwBgz6pBmNuRJlEzuWfZhYEnq6ZhRH7wd0O6yRtynLFpg4WfMPl4x4b+dsJ
 UdcpQKGXDjJEHjFBcxRg3FBOYuyFtsHXGhoKHpqcHZl85CUd5cjCLXy0dip8pQVIEoD0
 oWJjDwv0yCOr6eoo1J4gSZf6wV9nan0aJfQsfiLHsSZYc3g4925DQYgSb0uxJDH5xl0T
 Bw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726578633; x=1727183433;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wDPxkanvhTO8S8DQTo+wYn18S9VjZBi4MmAakGQKvqk=;
 b=jdrv85MmSrHBrTP/pxzmhg+Q9g3+vx0h4CkV3otcGh7y6agJCz0m3e6nV1EH2MJvmr
 IvJ0cLhYoCCjQDy4oYW/vIbdIo3PN+Gl1n5f3swxPpGHZq3Q1y7prg8O5QDBCkjXA2bL
 fIwK6rq4H1Mh/R17NG6RRhxfMQP+8337bXnihB6C3RKOFwh05xh1iknF6i4bI8y0TYAL
 yEIkwSE3UPl1zYFFZ9q82DNhFqupguAGccbjJ6SDmbKIqWNYZXVQbk6iMOh1Rb3y2Ms3
 JumTGmOjEH8BjmavHueWcGGKguvQqao4NvGwFtw33NDuCX4EbSHzZoVJH37ZnHUMdZcl
 lZCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmJldNGaPiJUPO8yyYDKubdsCRb2foyQ4Veg4y6rxyK2Zrg9X6aqfuL9qzxsJTMM/Xoms9eacPixYG@nongnu.org
X-Gm-Message-State: AOJu0Yz3y7D0cmuXK3XjixeE0B6ruDB2SsJt6zf7+qlk5ca31en8hLAh
 LtKQYXHxAgxzbYqrK2z6ZQSud7TQK2embVuvaerC0CT4h8yS8ilOp8SvNxQ91KQ=
X-Google-Smtp-Source: AGHT+IHhRy8Rd6lfla0JmbaIsCUjkVDWFWgCl2lO6w2VhF/DHlIUsw9cuHy2TVWorxxx4ip3oHOIMg==
X-Received: by 2002:a17:907:94cd:b0:a8d:e82:bdb3 with SMTP id
 a640c23a62f3a-a9047ca416amr1446867366b.18.1726578632434; 
 Tue, 17 Sep 2024 06:10:32 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e67f3sm444660666b.185.2024.09.17.06.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 06:10:32 -0700 (PDT)
Date: Tue, 17 Sep 2024 15:10:30 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexei Filippov <alexei.filippov@syntacore.com>
Cc: alistair.francis@wdc.com, alistair23@gmail.com, 
 apatel@ventanamicro.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 liwei1518@gmail.com, palmer@dabbelt.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v9] target/riscv/kvm/kvm-cpu.c: kvm_riscv_handle_sbi()
 fail with vendor-specific SBI
Message-ID: <20240917-d929b9736eea1df07a77a9bc@orel>
References: <20240626-1420003b7d88d892be22a719@orel>
 <20240917115433.38503-1-alexei.filippov@syntacore.com>
 <20240917-4c642a7fb52b49f470c9f29a@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917-4c642a7fb52b49f470c9f29a@orel>
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SORTED_RECIPS=2.499, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Tue, Sep 17, 2024 at 02:29:41PM GMT, Andrew Jones wrote:
> On Tue, Sep 17, 2024 at 02:54:33PM GMT, Alexei Filippov wrote:
> > kvm_riscv_handle_sbi() may return not supported return code to not
> > trigger qemu abort with vendor-specific sbi.
> > 
> > Add new error path to provide proper error in case of
> > qemu_chr_fe_read_all() may not return sizeof(ch), because exactly zero
> > just means we failed to read input, which can happen, so
> > telling the SBI caller we failed to read, but telling the caller of this
> > function that we successfully emulated the SBI call, is correct. However,
> > anything else, other than sizeof(ch), means something unexpected happened,
> > so we should return an error.
> > 
> > Added SBI related return code's defines.
> > 
> > Signed-off-by: Alexei Filippov <alexei.filippov@syntacore.com>
> > Fixes: 4eb47125 ("target/riscv: Handle KVM_EXIT_RISCV_SBI exit")
> 
> Fixes tag goes above s-o-b and 8 hex digits is a bit small. Most
> commit references in QEMU are using 10 or 12 digits.
> 
> > ---
> >  target/riscv/kvm/kvm-cpu.c         | 10 ++++++----
> >  target/riscv/sbi_ecall_interface.h | 12 ++++++++++++
> >  2 files changed, 18 insertions(+), 4 deletions(-)
> > 
> > diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> > index f6e3156b8d..9f2ca67c9f 100644
> > --- a/target/riscv/kvm/kvm-cpu.c
> > +++ b/target/riscv/kvm/kvm-cpu.c
> > @@ -1517,19 +1517,21 @@ static int kvm_riscv_handle_sbi(CPUState *cs, struct kvm_run *run)
> >          ret = qemu_chr_fe_read_all(serial_hd(0)->be, &ch, sizeof(ch));
> >          if (ret == sizeof(ch)) {
> >              run->riscv_sbi.ret[0] = ch;
> > -        } else {
> > +            ret = 0;
> > +        } else if (ret == 0) {
> >              run->riscv_sbi.ret[0] = -1;
> > +        } else {
> > +            ret = -1;
> >          }
> > -        ret = 0;
> 
> Looks good!
> 
> >          break;
> >      case SBI_EXT_DBCN:
> >          kvm_riscv_handle_sbi_dbcn(cs, run);
> >          break;
> >      default:
> >          qemu_log_mask(LOG_UNIMP,
> > -                      "%s: un-handled SBI EXIT, specific reasons is %lu\n",
> > +                      "%s: Unhandled SBI exit with extension-id %lu\n",
> >                        __func__, run->riscv_sbi.extension_id);
> > -        ret = -1;
> > +        run->riscv_sbi.ret[0] = SBI_ERR_NOT_SUPPORTED;
> 
> This, along with the addition of the SBI_* defines below, should be a
> separate patch. If we were just naming the -1, then I wouldn't mind it
> slipping in with the same patch, but this is changing behavior since
> SBI_ERR_NOT_SUPPORTED is -2. I agree with the change, though, it just
> needs to be a separate patch. And the separate patch should have the
> same Fixes tag.
>

Actually it's even more of a difference than s/-1/-2/ since we're no long
aborting the SBI call, but returning non-supported instead.

Thanks,
drew

