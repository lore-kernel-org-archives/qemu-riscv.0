Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BBCC77B75
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 May 2023 16:15:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q02ko-0002p3-OF; Fri, 19 May 2023 12:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q02kn-0002oj-O4
 for qemu-riscv@nongnu.org; Fri, 19 May 2023 12:14:53 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q02kg-00065Y-Lk
 for qemu-riscv@nongnu.org; Fri, 19 May 2023 12:14:53 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1928ec49077so2607956fac.0
 for <qemu-riscv@nongnu.org>; Fri, 19 May 2023 09:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1684512884; x=1687104884;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Tq6xfwT5cHquy+MPJLoYTkt26hrJyZpju4pMec1VbH8=;
 b=MZWjl6MfCU5ot2ibae3EjTT8AsscGhUcenXnV7cjH6/5QK5O5bL9uMbEN3gOyuWgZ9
 J+YMt1eWT5q7Qn4cCVwTQhhVER0X4oD7nECDK+6j12kyNe7i8Ivx6NV5Uy0+trh49rNv
 jP53GH+1xjjYZIKpO7eEcAL4hsJ5wQJnB8Dlrq7nvbmuS7dGuCSHWLgXXsb3d6qIx0l6
 KnnjfsXspi/gShqbEbApc77IrldaJPBko84mY0VnC9lLbSiF8qzwfZvDHZMTTAhX3uMz
 V5v41bVr0rgMIzZHAmQ3W0aqnTUAv6nnE9YcSzexHCQMID3eXhWR0SaiiiL1RKtUfaEP
 mxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684512884; x=1687104884;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tq6xfwT5cHquy+MPJLoYTkt26hrJyZpju4pMec1VbH8=;
 b=HvYDIPb1ue1Gtq9+gU4rldTftXOE1YYWSGSWGfxT81EAskZNuMvf9JBqyx0aFejc5T
 n8veiF9nqxukzEg13pfcM9VauWeX/VIctYV2M+m5ff/CxCOUTzZbtsxikqvt97d53kxl
 C/KoqW+uCyX7vs8eSwJcBYJtDrGBHsHmSNxUx6HT/iGPk8Pz/d+GFGKVmQ4FFwhvfVb9
 jc9OpoChkhFYC7+2LQU1oL+/lO057cNn1lnmx3HtZl9mmjZbp1C9PIRIsNTOJXCDbIRv
 4osy7Ry79G6L09kbdyR9s3PdqIGEnYkIDLVRZajVV+QhpghVIvCrIlUAbd6IjC13+SO0
 eAOg==
X-Gm-Message-State: AC+VfDxESZhOnDhWLQvAaaKwIVqkCAjplf+9gYIaiO+yy+OSgG3EQNsN
 Z7V+o7BRrBkGCUxhkEiTWr75ZA==
X-Google-Smtp-Source: ACHHUZ5lOcBc3CSo6y0CP5FTVmpFNOVeZCTiiR9faPjHi/JKkUFXfZEhiL+gFThlyXIFZh9xGU14VA==
X-Received: by 2002:a05:6871:4694:b0:195:f440:40e9 with SMTP id
 ni20-20020a056871469400b00195f44040e9mr1912929oab.31.1684512884603; 
 Fri, 19 May 2023 09:14:44 -0700 (PDT)
Received: from sunil-laptop ([106.51.191.118])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a056870d78600b00172ac40356csm2080793oab.50.2023.05.19.09.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 09:14:43 -0700 (PDT)
Date: Fri, 19 May 2023 21:44:36 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [PATCH v2] hw/riscv: virt: Assume M-mode FW in pflash0 only when
 "-bios none"
Message-ID: <ZGegbFr7EBanur1R@sunil-laptop>
References: <20230425102545.162888-1-sunilvl@ventanamicro.com>
 <CABJz62Og-9mVUfBKExMU1MG=UD7mnOKsdpeuEvXpoPTVn8TS7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABJz62Og-9mVUfBKExMU1MG=UD7mnOKsdpeuEvXpoPTVn8TS7A@mail.gmail.com>
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oa1-x35.google.com
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

On Fri, May 19, 2023 at 09:11:37AM -0700, Andrea Bolognani wrote:
> On Tue, Apr 25, 2023 at 03:55:45PM +0530, Sunil V L wrote:
> > qemu-system-riscv64 -bios <opensbi_fw> \
> > -drive file=<smode_fw_vars>,if=pflash,format=raw,unit=0 \
> > -drive file=<smode_fw_code>,if=pflash,format=raw,unit=1,readonly=on  \
> > -machine virt
> 
> I've noticed that edk2 for RISC-V, at least in the form it is
> currently packaged for Fedora, doesn't seem to have separate CODE and
> VARS files:
> 
>   $ ls /usr/share/edk2/riscv/* | cat
>   /usr/share/edk2/riscv/RISCV_VIRT.fd
>   /usr/share/edk2/riscv/RISCV_VIRT.raw
> 
> Is that something that needs to be addressed in upstream edk2? If so,
> will you be looking into it?
> 
Hi Andrea,

Yes, I have changes ready but before I submit EDK2 patches, I need qemu
changes merged which enables EDK2 to use both pflash.

Thanks,
Sunil

