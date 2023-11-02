Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95D9C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 13:12:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyXUN-0005Dn-27; Thu, 02 Nov 2023 09:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qyXUL-0005C0-O6
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 09:11:57 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qyXUI-0004es-Jq
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 09:11:57 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9adb9fa7200so189554166b.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 06:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698930713; x=1699535513; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/mhgwh+O7LcOjk4R1KCYBoDCcYoTeQDUs7aOxlaxBys=;
 b=olCgJnQwNaWhcyCs3cZIQXnFvvkdsmhy+3vrz+bHKJ823NTFQLrcMgtfBRjTVDkFqK
 fc0Ld/eutflcLo2IecSpkhsT3bQRjoR8HDBRd5UfOR3KJEbhycYbWBMpE5/zH263bRja
 6UCBl7zb7ikIUh6xmOg5YgIOowe6MdxY4DkZuwJ0fowiKtKTD05YOs1eWmphb0uchtP2
 dqn15lBeOpbisXT7tbek02Pr0ZStXjgt+JIGaslb/XL5qnr/TvWfs2Ct64zV4qMrM4AO
 1vpXx1xxaCOz89wG478gBTcnFKN9BJgvSqYMg+ceR8lQ+e8FPg2+2VVCl9JlRwmkpwt9
 ihHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698930713; x=1699535513;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/mhgwh+O7LcOjk4R1KCYBoDCcYoTeQDUs7aOxlaxBys=;
 b=AEk3b0YROHkNOyAfs7eMuaEkHXfHgnRk1fQ6pVDj6Nf+9ItX+bSvQxS7QDevWiwCPK
 B5gAICTz6hu7AnR9lkDiYAYcYHTcwoZAy8kJjX+6N1Jsmzk5Cel9jWYUDkzkjFhHGRJ7
 FDpud9+ST9iDGgKZBQzq53G0qF5gYZ86KYNFIKSuA51+ac5H07+PGWEWabPJqVEWBcUz
 kIIhdjTLDFgZNWVmmzB9LLvVn/fsIoaTB3fnND4TTuv0qsMyXrl5ebZF0OH3+HNjHelm
 IgHviGUdOE080dAP08uJ9PBF+mLb3Yb4xGK5sCk6s3jFRLjNdVvzg1Gu4ZA1yXGJMLKg
 i8Rw==
X-Gm-Message-State: AOJu0YxdI81mK49k2UEe38YSKH6y3WgBZMtTnzIDVh8EILPWVFeFFziS
 rExoLx85ANSSZ0kcBtliydFqcA==
X-Google-Smtp-Source: AGHT+IELwNfbv14gpzI5Fmo8CawheYiXt5CUTJJX3D5ejCQeEzUeMCMpCah6Z4DL9Sdy8PR8uCRdsA==
X-Received: by 2002:a17:907:3fa3:b0:9bd:d405:4e8a with SMTP id
 hr35-20020a1709073fa300b009bdd4054e8amr4428037ejc.17.1698930712479; 
 Thu, 02 Nov 2023 06:11:52 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a170906145600b009ad875d12d7sm1129954ejc.210.2023.11.02.06.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 06:11:52 -0700 (PDT)
Date: Thu, 2 Nov 2023 14:11:50 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v8 03/19] target/riscv/cpu.c: set satp_max_supported in
 cpu_riscv_set_satp()
Message-ID: <20231102-b340fdccfc0cdf9bf9fb935f@orel>
References: <20231101204204.345470-1-dbarboza@ventanamicro.com>
 <20231101204204.345470-4-dbarboza@ventanamicro.com>
 <20231102-b74e75db47b353355c6e5d66@orel>
 <c51fd5aa-22a9-40dd-9463-60ef23fb77c5@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c51fd5aa-22a9-40dd-9463-60ef23fb77c5@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62e.google.com
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

On Thu, Nov 02, 2023 at 09:53:50AM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 11/2/23 06:24, Andrew Jones wrote:
> > On Wed, Nov 01, 2023 at 05:41:48PM -0300, Daniel Henrique Barboza wrote:
> > > The setter() for the boolean attributes that set satp_mode (sv32, sv39,
> > > sv48, sv57, sv64) considers that the CPU will always do a
> > > set_satp_mode_max_supported() during cpu_init().
> > > 
> > > This is not the case for the KVM 'host' CPU, and we'll add another CPU
> > > that won't set satp_mode_max() during cpu_init(). Users should be able
> > > to set a max_support in these circunstances.
> > > 
> > > Allow cpu_riscv_set_satp() to set satp_mode_max_supported if the CPU
> > > didn't set one prior.
> > > 
> > > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > > ---
> > >   target/riscv/cpu.c | 11 +++++++++++
> > >   1 file changed, 11 insertions(+)
> > > 
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index 822970345c..9f6837ecb7 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -1100,6 +1100,7 @@ static void cpu_riscv_get_satp(Object *obj, Visitor *v, const char *name,
> > >   static void cpu_riscv_set_satp(Object *obj, Visitor *v, const char *name,
> > >                                  void *opaque, Error **errp)
> > >   {
> > > +    RISCVCPU *cpu = RISCV_CPU(obj);
> > >       RISCVSATPMap *satp_map = opaque;
> > >       uint8_t satp = satp_mode_from_str(name);
> > >       bool value;
> > > @@ -1108,6 +1109,16 @@ static void cpu_riscv_set_satp(Object *obj, Visitor *v, const char *name,
> > >           return;
> > >       }
> > > +    /*
> > > +     * Allow users to set satp max supported if the CPU didn't
> > > +     * set any during cpu_init(). First value set to 'true'
> > > +     * in this case is assumed to be the max supported for
> > > +     * the CPU.
> > 
> > Hmm, doesn't that mean if a user does
> > 
> >   -cpu rv64,sv39=true,sv48=true
> > 
> > then the max is set to sv39 instead of sv48?
> > 
> > I made a mistake in my last review by stating we shouldn't set the max
> > supported satp for rv64i to the maximum satp that TCG supports. I forgot
> > how all of it worked. Setting the _supported_ modes to the maximum that
> > TCG supports makes sense as long as we don't default to any of them for
> > rv64i. So, I think we should return the set_satp_mode_max_supported() to
> > rv64i's definition (passing VM_1_10_SV57 or maybe even VM_1_10_SV64) and
> > then change set_satp_mode_default_map() to error out for rv64i (or maybe
> > for all "bare" type cpus).
> 
> Ok, then let's set max supported mode to SV64 (the maximum we allow).
> 
> Then we don't need to do anything else - setting a max supported value will allow
> TCG to handle it accordingly with OpenSBI and the kernel, and a suitable satp_mode
> will be picked by them. We can leave finalize() untouched.
> 
> I'll make a note in cpu_init() to remind ourselves that we're not setting a default
> satp_mode value, but a *limit* for the satp_mode value the CPU can handle.

It's both. It's the limit and, in the absence of user input, its used as
the default. Setting the limit is fine for a no-default cpu type, but
allowing it to become the default is not. We need to also modify
set_satp_mode_default_map() to only do what it does for non no-default
cpus types.

Thanks,
drew

