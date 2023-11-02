Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926B2C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 13:49:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyY47-0007IG-4n; Thu, 02 Nov 2023 09:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qyY46-0007Hb-5g
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 09:48:54 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qyY43-0003Sq-3y
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 09:48:53 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-543c3756521so1530646a12.2
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 06:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698932929; x=1699537729; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0zFeKu3Zwf8U/ziyaZ+s9QlT3aXm32lTYlpwni2T390=;
 b=Hpt4+cM8jBCe8tNF7Tp2nq8NCUapYGw3vNl08NwwwViM6zYoz/2vCkigWGOJmtqAsP
 B3/26Z8q5zB/fNEMdRsAigM8XFkyeftJPhlGCGqZyZoW1h3S/aUVvgv7A35zGHmR0FME
 KM192Pg431/cR2IK/un1a99/T5t5XI8KxQYjVypvTG2Iml3yiX3rveotXKBvsdaip5C1
 55cxrWN7WXivNbdkZE8r23u/4w20fE3fxhww0DcGjFY6bS9szYvJb1pJl9Qs7i3zUR5E
 txAQmtklk6ybZptHcmZsqqx9QLHn2VT29fNKSLzZED+mTEvYaks7kLbRatZuNmS/Xv6C
 ZZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698932929; x=1699537729;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0zFeKu3Zwf8U/ziyaZ+s9QlT3aXm32lTYlpwni2T390=;
 b=UZuSstbpLq/SYhxzwxnlgXtajGPDP8LqOvcW+CQrW+qXhRx1S/r9rCN8Zzyit1B1Lb
 Q3tD05vTyTvaFy2np3wK67ilYTu7v6ziNDmHUlIAMYn6KsO/n34iG9oPeAHkQbTDYhF0
 p7kmiSM+K/w2PiD3i/LvEV8fgcFxkayzJ0muCE6m7DNW+BPWof9anfl8xpldxLDhuVYW
 LYA0yJDW1TEuN/9YyRBADisccRfEBGzIGER/X7tghfb9e9LGrwkXhNjd+S14FECjb/lB
 sHa/zFUTk7SONZFI7md7YqlT8bh/YYQY4jKcy0k51qCeawcP3hxw5GuW22NQPA1eZnGd
 j2ig==
X-Gm-Message-State: AOJu0YyBXNOvmC2OaMxDCYTaAjnx65tJiU/+azM5aL2AzXZ9pG7Llikc
 XwUuQKFC/OfFlt/hfVVyfJ7kTg==
X-Google-Smtp-Source: AGHT+IE9RRFPIyv3B3U6XX7XjlxEQOBZfy2bQ3xfanpLOvkhvYnHh2w4EYPb4tCF9ij6Er/acycJfg==
X-Received: by 2002:a50:d5d4:0:b0:53e:98c6:5100 with SMTP id
 g20-20020a50d5d4000000b0053e98c65100mr15581260edj.30.1698932928791; 
 Thu, 02 Nov 2023 06:48:48 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a50d701000000b00543525d9fddsm2388386edi.21.2023.11.02.06.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 06:48:48 -0700 (PDT)
Date: Thu, 2 Nov 2023 14:48:47 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v8 05/19] target/riscv/tcg: update priv_ver on user_set
 extensions
Message-ID: <20231102-492bf4aa8761af0d8549ca3b@orel>
References: <20231101204204.345470-1-dbarboza@ventanamicro.com>
 <20231101204204.345470-6-dbarboza@ventanamicro.com>
 <20231102-bdcd40a9183dbbfe6667a304@orel>
 <05eb78d6-7563-4c5a-bae7-5ca14f4e91a2@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05eb78d6-7563-4c5a-bae7-5ca14f4e91a2@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Nov 02, 2023 at 10:42:25AM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 11/2/23 06:47, Andrew Jones wrote:
> > On Wed, Nov 01, 2023 at 05:41:50PM -0300, Daniel Henrique Barboza wrote:
> > > We'll add a new bare CPU type that won't have any default priv_ver. This
> > > means that the CPU will default to priv_ver = 0, i.e. 1.10.0.
> > > 
> > > At the same we'll allow these CPUs to enable extensions at will, but
> > > then, if the extension has a priv_ver newer than 1.10, we'll end up
> > > disabling it. Users will then need to manually set priv_ver to something
> > > other than 1.10 to enable the extensions they want, which is not ideal.
> > > 
> > > Change the setter() of multi letter extensions to allow user enabled
> > > extensions to bump the priv_ver of the CPU. This will make it
> > > conveniente for users to enable extensions for CPUs that doesn't set a
> > > default priv_ver.
> > > 
> > > This change does not affect any existing CPU: vendor CPUs does not allow
> > > extensions to be enabled, and generic CPUs are already set to priv_ver
> > > LATEST.
> > > 
> > > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > > ---
> > >   target/riscv/tcg/tcg-cpu.c | 20 ++++++++++++++++++++
> > >   1 file changed, 20 insertions(+)
> > > 
> > > diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> > > index f54069d06f..b88fce98a4 100644
> > > --- a/target/riscv/tcg/tcg-cpu.c
> > > +++ b/target/riscv/tcg/tcg-cpu.c
> > > @@ -114,6 +114,22 @@ static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
> > >       g_assert_not_reached();
> > >   }
> > > +static void cpu_validate_multi_ext_priv_ver(CPURISCVState *env,
> > > +                                            uint32_t ext_offset)
> > > +{
> > > +    int ext_priv_ver;
> > > +
> > > +    if (env->priv_ver == PRIV_VERSION_LATEST) {
> > > +        return;
> > > +    }
> > > +
> > > +    ext_priv_ver = cpu_cfg_ext_get_min_version(ext_offset);
> > > +
> > > +    if (env->priv_ver < ext_priv_ver) {
> > > +        env->priv_ver = ext_priv_ver;
> > > +    }
> > 
> > This will ignore user input. If the user, for example, does
> > 
> >   -cpu rv64,priv_spec=v1.10.0,zicbom=on
> 
> 
> This won't ignore user input because "priv_spec=v1.10.0" will be evaluated during
> finalize() time, in riscv_cpu_validate_priv_spec(). This change I made was made
> with this behavior in mind.
> 
> In the case you mentioned, this will happen:
> 
> $ ./build/qemu-system-riscv64 -M virt -cpu rv64,priv_spec=v1.10.0,zicbom=on
> qemu-system-riscv64: H extension requires priv spec 1.12.0
> 
> This happened because, although 'zicbom=true' would bump priv ver to 1.12.0 if needed
> (it isn't - rv64 is already set to LATEST), "priv_spec=v1.10.0" is evaluated during
> finalize() time and the CPU priv_ver is set to 1.10 before our validation step.
> 
> This means that doesn't matter where the 'priv_spec' option is in the command line,
> it'll always be honored.

Oh, good. Sorry for the noise! But maybe a comment above the priv_ver bump
saying something along the lines of what you wrote here would help ease
the minds of those that cross this in the future (including the mind of my
future self after I've forgotten this again)

> 
> 
> > 
> > then, afaict, priv_spec will be silently bumped to 1.12. I think we should
> > error out in that case instead. And, we should also error out for
> > 
> >   -cpu rv64,zicbom=on,priv_spec=v1.10.0
> > 
> > which means we should know when priv_spec is either
> > 
> >   - its default value
> >   - has been bumped by an extension
> >   - has been explicitly set by the user
> 
> > 
> > > +}
> > > +
> > >   static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
> > >                                       bool value)
> > >   {
> > > @@ -829,6 +845,10 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
> > >           return;
> > >       }
> > > +    if (value) {
> > > +        cpu_validate_multi_ext_priv_ver(&cpu->env, multi_ext_cfg->offset);
> > > +    }
> > 
> > Some misa extensions also have priv spec version dependencies. See
> > riscv_cpu_validate_misa_priv()
> 
> Yeah. I'll add this same mechanic to RVH, the only MISA bit we have that has a priv_ver
> limitation. Thanks,

Thanks,
drew

