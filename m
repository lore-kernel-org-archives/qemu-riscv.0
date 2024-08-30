Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55647CA0FFD
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 14:51:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sk2xn-0001HI-I3; Fri, 30 Aug 2024 10:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sk2xm-0001FN-K1
 for qemu-riscv@nongnu.org; Fri, 30 Aug 2024 10:50:58 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sk2xk-00043r-Qh
 for qemu-riscv@nongnu.org; Fri, 30 Aug 2024 10:50:58 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42bbe809b06so4436975e9.1
 for <qemu-riscv@nongnu.org>; Fri, 30 Aug 2024 07:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1725029455; x=1725634255; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=b4kDZatGXtmNM9vtyLMuJHBOsQhrvjgD/DTlmmTOWVQ=;
 b=oK2cRxpV+VL5YG6BKpxTzvYQyMW6ghBsKWGIvn18OYuzYuRE2J1icl5/Zpl2lqeClg
 drxlXHJb3++muA86UFNknj9ogd8S3MGsfEo28BWChhC28EtwqjwEww9sRfTkbAub2IBE
 OJi9SIt2R50FpnGVf6ETvVfWqrjLBJIxWd1yol8J6R5SuT6OZ1Db3i4EiiCHUZ9sQa2M
 IFgU0XIhehOBSbVgjIR4JGaFe/kx395sqenxwekD+qt4NoNf2NxkXXjlrsyXSPA+50jY
 QOOKfLC8FcCcxSPsgJkrZ9zKewsr80Yxmq1NtBb/7pxA4aLEN8sdnjWWRTRzAgnWtH2J
 nycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725029455; x=1725634255;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b4kDZatGXtmNM9vtyLMuJHBOsQhrvjgD/DTlmmTOWVQ=;
 b=MELRv50AntpxRgCWgwtgjsyd/P+VYGNi4ZVtpyIqzupjJ2Odk3R14wKSgcj3PXTNsa
 WpEzDYqbotG1aSqPwoVk98rDbDHFTyHQG93UebfVp1kELLslm09/J7+Cbfh0hERvwL3d
 KDlPb/XPSaYV5wS8Tgl4mZ+vBJMkxnp2BkFmvOi+1r5NWPvSws9GSU7IO7DbgxPDSfZB
 38fywAGr26a1rWmq7YxBM0kPCDl66GNuzXlGP27yYD7WEwRwR1B7GV1tN1wwdqPSZvOL
 dSNb9LaLX9anBLSkYeACi3vgk8GtN0VEH/wCkFrwCyckEX4U1eo+z4dORdz0QYramtgF
 grPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXygpMJQU130CfnxZznVP8JTV+IaslOtUY149ne7WbKxxx4/ndEEm6JpGRCdN3FjMwtwIliOzYwaLhD@nongnu.org
X-Gm-Message-State: AOJu0Yy35UTMgkk7VpH/ZAy9mkE0LgWkPLj5fW16tx1sxZT6WQjo0FcZ
 NXMYzg4bJR0oYQVLI87iefUZiPadbH3keQV9beNJ1Aj+F5Sz5JnGEa4SpJqVSq0=
X-Google-Smtp-Source: AGHT+IE6MKCubeTJihK81mhe2rKJQ/BqYAgVDvu1m0uverpM9l2bAjLlOSVpC5HX/dlYJGl4MyD5iw==
X-Received: by 2002:a05:600c:3ba7:b0:425:7c5f:1bac with SMTP id
 5b1f17b1804b1-42bb0306f94mr56489525e9.21.1725029454052; 
 Fri, 30 Aug 2024 07:50:54 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749efb007csm4204157f8f.92.2024.08.30.07.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 07:50:53 -0700 (PDT)
Date: Fri, 30 Aug 2024 16:50:52 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Vladimir Isaev <vladimir.isaev@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Anup Patel <apatel@ventanamicro.com>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, atishp@rivosinc.com
Subject: Re: [PATCH] target/riscv: Stop timer with infinite timecmp
Message-ID: <20240830-f7e2039c7d1cc5e33bd1f5b2@orel>
References: <20240829084002.1805006-2-ajones@ventanamicro.com>
 <5f547cd8-2068-4499-af7e-04f3f27ea617@syntacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f547cd8-2068-4499-af7e-04f3f27ea617@syntacore.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Aug 30, 2024 at 02:05:05PM GMT, Vladimir Isaev wrote:
> Hi Andrew,
> 
> 29.08.2024 11:40, Andrew Jones wrote:
> > While the spec doesn't state it, setting timecmp to UINT64_MAX is
> > another way to stop a timer, as it's considered setting the next
> > timer event to occur at infinity. 
> 
> I think this should be explicitly stated in the spec, since some software
> may initially set time and timecmp to big values just to check how overflow
> is handled. And without it no chance that all HW implementations will interpret
> UINT64_MAX as 'stop timer'.
> 
> Do we need github issue on SSTC/privileged?

Hi Vladimir,

I don't think we need to update the spec, so hardware is free to make the
interrupt pending if time ever reaches UINT64_MAX. However, the hardware
will then need to clear the pending interrupt on the very next increment
of time. This means even if the interrupt is raised it will most likely
look spurious to the handler. I think we can leave this to software. If
the software wants to use UINT64_MAX to stop timers, then it may also want
to add a check in its timer handlers for timecmp == UINT64_MAX, and, under
that condition, just ignore the interrupt.

Thanks,
drew

> 
> Thank you,
> Vladimir Isaev
> 
> > And, even if the time CSR does
> > eventually reach UINT64_MAX, the very next tick will bring it back to
> > zero, once again less than timecmp. For this reason
> > riscv_timer_write_timecmp() special cases UINT64_MAX. However, if a
> > previously set timecmp has not yet expired, then setting timecmp to
> > UINT64_MAX to disable / stop it would not work, as the special case
> > left the previous QEMU timer active, which would then still deliver
> > an interrupt at that previous timecmp time. Ensure the stopped timer
> > will not still deliver an interrupt by also deleting the QEMU timer
> > in the UINT64_MAX special case.
> > 
> > Fixes: ae0edf2188b3 ("target/riscv: No need to re-start QEMU timer when timecmp == UINT64_MAX")
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  target/riscv/time_helper.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
> > index 8d245bed3ae3..bc0d9a0c4c35 100644
> > --- a/target/riscv/time_helper.c
> > +++ b/target/riscv/time_helper.c
> > @@ -92,6 +92,7 @@ void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
> >       * equals UINT64_MAX.
> >       */
> >      if (timecmp == UINT64_MAX) {
> > +        timer_del(timer);
> >          return;
> >      }
> >  
> 
> 
> 

