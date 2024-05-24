Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F96CC25B74
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 May 2024 16:12:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sAXWV-00010z-W5; Fri, 24 May 2024 12:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1sAXWT-00010E-Vq
 for qemu-riscv@nongnu.org; Fri, 24 May 2024 12:12:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1sAXWS-0005Qa-H0
 for qemu-riscv@nongnu.org; Fri, 24 May 2024 12:12:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716567119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZs06456MpZWCEfJBvTpJcfRIZ64fwVcyCyhJwXD55E=;
 b=E/ahelQlYX43AHdNpHfcQ6OZzvwSLYa7mUd2PvNvRRXCEPzczrRq8cAZCOhllwOCtQRtvC
 03DuIXSn0xrusWkNx6LzTOFUlHpglYkv/3MEQYWpXnBpAu4aClRtCB6ap2omoaX3gIOAIM
 bSYVnmJ18YboBCY26Oevu+c+GYOY5q4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-BTi8BetwMLSJ6UYLYG0d2A-1; Fri, 24 May 2024 12:11:57 -0400
X-MC-Unique: BTi8BetwMLSJ6UYLYG0d2A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4210a9cd834so2224795e9.3
 for <qemu-riscv@nongnu.org>; Fri, 24 May 2024 09:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716567116; x=1717171916;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eZs06456MpZWCEfJBvTpJcfRIZ64fwVcyCyhJwXD55E=;
 b=dsmpcDHbZaAq93jf3wkrhff0GSI6FLPYwr0thftbXdaGg0LP3chqw1Y0OS9hmkg0rt
 UxW/hCl0eaaJl+wxzf3YaMNJkzL+OYZquHyHZ5K5FO5X+zqJnjHoFauEvfphnJkpS1Pb
 zKrkjf+ugzQ7bNX9ufpn0n8LRpJK2jcjvq+J2HGtDfAjHVT6kuTcMcnv1JmtkKJ58nLF
 1Nz+zKj/80heZWT4s3CbIPq9MdfRj3zwp05i4+xBF9FlDqwRYQI9xSw/quKJlnH6Gl0P
 wTJtS1UCNjkvXQY9Wq6br5tWkzgjiSPqMKupG+iBzu006OAVof2LL4aZl4MoMJNd+ups
 0ZEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi2jfkgA6845vZXIQhlnp7szcF+++HBGL/N+GrcATOywk8dkche1go6tjpkxHVvrKTHgJhtzo7WH/02gOjKxtKuJrTD2Q=
X-Gm-Message-State: AOJu0Yz0yuvC6YnheBICklFh6QzoCEGmfo149tXk5jnUZxKDI1VhOIuD
 Y4rPM3lqIdOCbGBFn13TMIHh6pc8Z0SuL0yNEKGlw9JgkBC+l4lAU7mfqlN1n3qteTA+ZECOTJG
 4gqfkg9RLubRAdQQOKJ9g0aqljgVCiucyqAEjDMY+J1RK/7bJ+9D+jbVK7rUFh2rJNNDnPttm2v
 A1xigFVzncEPKa/EAUixIAAeU6Y2w=
X-Received: by 2002:a05:600c:1d9e:b0:41a:3868:d222 with SMTP id
 5b1f17b1804b1-42108994047mr20117645e9.0.1716567116107; 
 Fri, 24 May 2024 09:11:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU4nHinG5UwWYfIzzaP4TB6q5N8h7uK09ZIRPsfyGS+poyVFItA8joQq8EIDF7CBO3B42QpM4Casm7ZYe8n8s=
X-Received: by 2002:a05:600c:1d9e:b0:41a:3868:d222 with SMTP id
 5b1f17b1804b1-42108994047mr20117365e9.0.1716567115718; Fri, 24 May 2024
 09:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231221094923.7349-1-duchao@eswincomputing.com>
 <20231221094923.7349-2-duchao@eswincomputing.com>
 <ada42503-dab4-474f-a61a-a9fe3fa63afa@ventanamicro.com>
In-Reply-To: <ada42503-dab4-474f-a61a-a9fe3fa63afa@ventanamicro.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 24 May 2024 18:11:43 +0200
Message-ID: <CABgObfYA3Er1y3R9v0Huf3w43n7oD83UhkqdRk-oBYzyM6O_ow@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] target/riscv/kvm: add software breakpoints support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Chao Du <duchao@eswincomputing.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair23@gmail.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, anup@brainfault.org, 
 atishp@atishpatra.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Apr 16, 2024 at 11:23=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
> > +int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoi=
nt *bp,
> > +                                  vaddr len)
> > +{
> > +    if (len !=3D 4 && len !=3D 2) {
> > +        return -EINVAL;
> > +    }
>
> I wonder if this verification should be moved to kvm_insert_breakpoint().=
 Is
> there any known reason why other archs would use 'len' other than 2 or 4?=
 The
> parent function can throw the EINVAL in this case. Otherwise all callers =
from
> all archs will need a similar EINVAL check.

I'm not sure how len is defined in the gdb protocol, but x86 has a
breakpoint length of 1 and an instruction length that can be any value
between 1 and 15.

Most architectures could assume that it's always one value, i.e. just
not care about checking len in kvm_arch_insert_sw_breakpoint.

The patches look good, feel free to take them through the RISC-V tree.

One thing that I was wondering is: could RISC-V just use always
c.ebreak if C instructions are supported, and ebreak if they're not?
But if for example that would that mess up the synchronization of the
disassembly in gdb, it's a good reason to add the len argument as you
did here.

Paolo


